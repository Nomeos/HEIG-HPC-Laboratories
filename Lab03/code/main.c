#include <stdio.h>
typedef struct {
    int x, y;
} Point;

void update(Point *p) {
    p->x = p->x + 1;
    p->y = p->y + 1;
}


int main() {
    Point p = {1, 2};
    printf("Before update: x = %d, y = %d\n", p.x, p.y);
    update(&p);
    printf("After update: x = %d, y = %d\n", p.x, p.y);
    return 0;
}