#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

extern void asm_func(void);
// result size: int8  -> int16, uint8  -> int16
//		int16 -> int32, uint16 -> int32
uint16_t a, b, c;
int32_t divisible, result;
int64_t divider;
int main(void) {
	printf("Expression: (22/c + 3*b) / (36 - a*c/3)\n");
	printf("Enter a (0..65535): ");
	scanf("%hu", &a);
	printf("Enter b (0..65535): ");
	scanf("%hu", &b);
	printf("Enter NONZERO c (1..65535): ");
	scanf("%hu", &c);

	if (c == 0) {
		printf("Entered invalid value!\n");
		exit(1);
	}
	divisible = 22 / c + 3 * b;
	divider = (long int) a * c;
	divider = 36 - divider / 3;
	if (divider != 0) {
		result = divisible / divider; 
		printf("((C code)) Dividing %d by %ld. Result is %d\n", divisible, (long) divider, result);
	} else {
		printf("Error: division by zero!\n"); // a=36,b=0,c=3
		exit(2);
	}

	asm_func();
	printf("((ASM code)) Dividing %u by %i. Result is %i\n", divisible, divider, result);
	return 0;	
}
