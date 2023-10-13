#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
extern void asm_func(void);

uint16_t a, b;
int32_t result;

int main() {
	printf("Enter a (0..65535): ");
	scanf("%hu", &a);
	printf("Enter b (1..65535, NOT ZERO!): ");
	scanf("%hu", &b);
	if (a < b) {
		result = 64 / b - a;
	} else if (a == b) {
		result = 88;
	} else {
		result = (a - 99) / b;
	}
	printf("((C code)) Result is %i\n", result);
	asm_func();
	printf("((ASM code)) Result is %i\n", result);
	return 0;
}
