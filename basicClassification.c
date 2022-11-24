#include <stdio.h>
#include <math.h>
#include "NumClass.h"


int isPrime(int i){
    int temp = sqrt(i);
    int prime = 0;
    
    if( i == 0 || i == 1){
       prime = 1;
    }
    
    for (int j = 2; j <= temp; j++) {
        if (i % j == 0){
            prime = 1;
            break;
        }
    }
    
    if (prime == 0){
        return 1;
    }
    return 0;
}



int fact(int n){
    int theFactorial = 1;
    for (int i = 1; i <= n; i++) {
        theFactorial*=i;
    }
    return theFactorial;
}

int isStrong(int i){
    int temp = i;
    int temp2;
    int sum = 0;
    int factorial;
    
    while (temp != 0){
        temp2 = temp % 10;
        factorial = fact(temp2);
        temp /=10;
        sum += factorial;
    }
    if(sum == i){
        return 1;
    }
    return 0;
}
