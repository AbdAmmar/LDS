#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
    // Vérification des arguments
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <nombre_iterations>\n", argv[0]);
        return 2;
    }

    // Conversion de l'argument (chaîne -> entier long)
    long N = strtol(argv[1], NULL, 10);

    // Vérification que N est positif
    if (N < 0) {
        fprintf(stderr, "Erreur : Le nombre d'itérations doit être positif.\n");
        return 2;
    }

    double somme = 0.0;
    double terme;

    // Boucle de calcul
    for (long i = 0; i <= N; i++) {
        terme = pow(-1, i) / (2.0 * i + 1.0);
        somme += terme;
    }

    // Calcul final et affichage
    double pi = somme * 4.0;
    printf("Approximation de Pi (%ld itérations) : %.15f\n", N, pi);

    return 0;
}
