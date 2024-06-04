#include "base.h"

void zeraMatriz(uint8_t** matriz){
	uint8_t* temp =  &matriz[0][0];
	int tot = size*size;
	for (int i = 0; i<tot; i++){
		*temp++ = 0;
	}
}

int main(){
	uint8_t** A = initMatriz();
	zeraMatriz(A);
	limpaMatriz(A);
	return 0;
}
