#include <stdint.h>
#include <stdlib.h>
#define size 46340

uint8_t** initMatriz(){
	uint8_t** res = malloc(size*sizeof(uint8_t*));
	uint8_t* temp = malloc(size*size*sizeof(uint8_t));
	for (int i = 0; i < size; i++){
		res[i] = temp+(i*size);
	}
	return res;
}

void limpaMatriz(uint8_t** matriz){
	free(matriz[0]);
	free(matriz);
}
