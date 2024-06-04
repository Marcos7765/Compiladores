#include "base.h"
#include <string.h>

void zeraMatriz(uint8_t** matriz){
	//bzero é basicamente isso nas implementações que vi
	//enquanto que isso se traduz quase pro código em c.c
	memset(matriz[0], 0, size*size*sizeof(uint8_t));
}

int main(){
	uint8_t** A = initMatriz();
	zeraMatriz(A);
	limpaMatriz(A);
	return 0;
}
