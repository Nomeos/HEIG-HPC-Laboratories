#include "ecg_processing.h"

#include <math.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "ecg_utils.h"

struct ECG_Context {
    ECG_Params params;

    double *gain_buffer;
    double *lowpass_buffer;
    double *filter_buffer;
    double *derivative_buffer;
    double *squared_buffer;
    double *mwi_buffer;
};

ECG_Status ecg_analyze(ECG_Context *ctx, const double *signal, size_t n_samples, int lead_idx, ECG_Peaks *peaks,
                       ECG_Intervals *intervals) {
    if (!ctx || !signal || n_samples == 0 || !peaks) {
        return ECG_ERR_NULL;
    }

    for (size_t i = 0; i < n_samples; ++i) {
        ctx->gain_buffer[i] = signal[i];
    }

    ecg_apply_gain(ctx->gain_buffer, n_samples, ctx->params.gain);

    ecg_moving_average(ctx->gain_buffer, ctx->lowpass_buffer, n_samples, 15);

    ecg_highpass_ma(ctx->lowpass_buffer, ctx->filter_buffer, n_samples, 50);

    ecg_derivative_1(ctx->filter_buffer, ctx->derivative_buffer, n_samples);

    ecg_square(ctx->derivative_buffer, ctx->squared_buffer, n_samples);

    ecg_mwi(ctx->squared_buffer, ctx->mwi_buffer, n_samples, 50);

    double max_mwi = 0.0;
    for (size_t i = 0; i < n_samples; i++) {
        if (ctx->mwi_buffer[i] > max_mwi) max_mwi = ctx->mwi_buffer[i];
    }
    double threshold = (ctx->params.r_threshold_hint > 0.0)
                           ? ctx->params.r_threshold_hint
                           : max_mwi * 0.5;

    size_t refractory = (size_t) (0.2 * ctx->params.sampling_rate_hz);
    size_t last_peak = 0;

    peaks->R_count = 0;
    for (size_t i = 1; i < n_samples - 1; i++) {
        if (peaks->R_count > 0 && (i - last_peak) < refractory) continue;

        if (ctx->mwi_buffer[i] > ctx->mwi_buffer[i - 1] &&
            ctx->mwi_buffer[i] > ctx->mwi_buffer[i + 1] &&
            ctx->mwi_buffer[i] > threshold) {
            if (peaks->R_count < MAX_BEATS) {
                peaks->R[peaks->R_count++] = (int) i;
                last_peak = i;
            }
        }
    }

    if (intervals) {
        intervals->count = 0;

        for (size_t i = 1; i < peaks->R_count; i++) {
            if (intervals->count < MAX_BEATS) {
                double rr_seconds = (double) (peaks->R[i] - peaks->R[i - 1]) / ctx->params.sampling_rate_hz;
                intervals->RR[intervals->count++] = rr_seconds;
            }
        }
    }

    return ECG_OK;
}

ECG_Context *ecg_create(const ECG_Params *params) {
    if (!params || params->sampling_rate_hz <= 0 || params->leads <= 0) {
        return NULL;
    }

    ECG_Context *ctx = malloc(sizeof(ECG_Context));
    if (!ctx) {
        return NULL;
    }

    memcpy(&ctx->params, params, sizeof(ECG_Params));

    ctx->lowpass_buffer = malloc(MAX_SAMPLES * sizeof(double));
    ctx->derivative_buffer = malloc(MAX_SAMPLES * sizeof(double));
    ctx->squared_buffer = malloc(MAX_SAMPLES * sizeof(double));
    ctx->filter_buffer = malloc(MAX_SAMPLES * sizeof(double));
    ctx->mwi_buffer = malloc(MAX_SAMPLES * sizeof(double));
    ctx->gain_buffer = malloc(MAX_SAMPLES * sizeof(double));
    if (!ctx->derivative_buffer || !ctx->squared_buffer || !ctx->filter_buffer ||
        !ctx->mwi_buffer || !ctx->lowpass_buffer || !ctx->gain_buffer) {
        free(ctx->gain_buffer);
        free(ctx->derivative_buffer);
        free(ctx->squared_buffer);
        free(ctx->filter_buffer);
        free(ctx->mwi_buffer);
        free(ctx->lowpass_buffer);
        free(ctx);
        return NULL;
    }
    return ctx;
}

void ecg_destroy(ECG_Context *ctx) {
    if (ctx) {
        free(ctx->gain_buffer);
        free(ctx->lowpass_buffer);
        free(ctx->filter_buffer);
        free(ctx->derivative_buffer);
        free(ctx->squared_buffer);
        free(ctx->mwi_buffer);
        free(ctx);
    }
}
