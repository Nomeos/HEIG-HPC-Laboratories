# Lab 01 Report

## Introduction
L'objectif de ce laboratoire était d'implémenter l'algorithme de Pan-Tompkins pour la détection des pics R dans les signaux ECG. Les données fournies comprenaient des enregistrements ECG et des valeurs correspondantes dans un fichier CSV. L'implémentation devait être efficace en termes de temps d'exécution et d'utilisation de la mémoire.

## Methodology
L’approche utilisée était de suivre les étapes suivantes :
1. Comprendre le projet (analyse ECG et valeurs dans le CSV)
2. Lire et comprendre l'algorithme de Pan-Tompkins pour la détection des pics R
3. Implémenter l'algorithme des R peaks et des intervals RR
4. Tester l’implémentation avec les données fournies
5. Analyser les temps d’exécution et l’utilisation mémoire de l’implémentation 


### Temps d’exécution
Temps avec tous les échantillons :
- Premier lancement : 0.360 ms
- Deuxième lancement : 0.465 ms
- Troisième lancement : 0.417 ms
- Quatrième lancement : 0.392 ms
- Cinquième lancement : 0.436 ms

Pour une moyenne de 0.414 ms par exécution.

### Impact de la taille des données

Temps d’exécution pour 1000 échantillons :
- Premier lancement : 0.194 ms
- Deuxième lancement : 0.141 ms
- Troisième lancement : 0.178 ms
- Quatrième lancement : 0.174 ms
- Cinquième lancement : 0.151 ms
Moyenne : 0.167 ms par exécution.

Temps d’exécution pour 5000 échantillons :
- Premier lancement : 0.300 ms
- Deuxième lancement : 0.401 ms
- Troisième lancement : 0.361 ms
- Quatrième lancement : 0.377 ms
- Cinquième lancement : 0.392 ms
Moyenne : 0.366 ms par exécution.

L'algorithme utilisé semble être linéaire, car le temps d’exécution augmente proportionnellement à la taille des données.

## Conclusion
L'implémentation était presque complète, il y a un léger décalage dans les résultats obtenus par rapport à ceux attendus comme on peut le voir dans le graphique.

Il pourrait aussi avoir des améliorations possibles au niveau de l'optimisation de la mémoire ce qui réduirait le temps d’exécution.