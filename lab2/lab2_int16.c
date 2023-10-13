#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
extern void asm_func(void);

int16_t a, b;
int32_t result;

int main() {
	printf("Enter a (-32768..32767): ");
	scanf("%hd", &a);
	printf("Enter b (-32768..32767) NOT ZERO!): ");
	scanf("%hd", &b);
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
