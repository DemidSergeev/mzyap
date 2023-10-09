#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
extern void asm_func(void);
// result size: int8  -> int16, uint8  -> int16
//		int16 -> int32, uint16 -> int32
int8_t a, b, c;
int16_t divisible, divider, result;
int main(void) {
	a = b = c = divisible = divider = result = 0;
	printf("Expression: (22/c + 3*b) / (36 - a*c/3)\n");
	printf("Enter a (-128..+127): ");
	scanf("%hhi", &a);
	printf("Enter b (-128..+127): ");
	scanf("%hhi", &b);
	printf("Enter NONZERO c (-128..+127): ");
	scanf("%hhi", &c);
	if (c == 0) {
		printf("Entered invalid value!\n");
		exit(1);
	}
	divisible = 22 / c + 3 * b;
	divider = 36 - a * c / 3;
	if (divider != 0) {
		result = divisible / divider; 
		printf("((C code)) Dividing %hi by %hi. Result is %hi\n", divisible, divider, result);
	} else {
		printf("Error: division by zero!\n"); // a=36,b=0,c=3
		exit(2);
	}

	asm_func();
	printf("((ASM code)) Dividing %hi by %hi. Result is %hi\n", divisible, divider, result);
	return 0;	
}
