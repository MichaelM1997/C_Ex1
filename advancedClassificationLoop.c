#include <stdio.h>
#include <math.h>
#include "NumClass.h"


int isPalindrome(int i){
    int temp = i;
    int rev = 0;
    int r;
    
    while(temp != 0){
        r = temp % 10;
        rev = rev * 10 + r;
        temp /= 10;
    }
    
    if (i == rev){
        return 1;
    }
    
return 0;
    
}

int isArmstrong(int i){
	int num = i;
	int cd = 0;
	int count = 0;
	
	while(num > 0){
		cd++;
		num /=10;
	}
	
	num = i;
	int a = cd;
	while(a > 0){
		count += pow(num%10,cd);
		num /=10;
		a--;
	}
	if(count == i){
		return 1;
	}
	
	return 0;
}

