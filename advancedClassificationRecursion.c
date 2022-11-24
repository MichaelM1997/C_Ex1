#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int isPalindromeRec(int arr[],int start,int end){
    if(start<end){
        if(arr[start]==arr[end]){
            return isPalindromeRec(arr,start+1,end-1);
        }
        return 0;
    }
return 1;
}

int isPalindrome(int i){
    int size=log10(i);
    int arr [size+1];
    int count=0;
    int num=i;
    while(num>0){
        arr[count]=num%10;
        num/=10;
        count++;
    }
    if(isPalindromeRec(arr,0,count-1) == 1){
    	return 1;
    }
	return 0;
}

int isArmstrongRec(int i,int arr [], int index,int end, int total){
    if(index==end){
        if(total==i){
            return 1;
        }
        else {
            return 0;
        }
    }
    total=total+pow(arr[index],end);
    return isArmstrongRec(i,arr,index+1,end,total);
}

int isArmstrong(int i){
    int size=log10(i);
    int arr[size+1];
    int count=0;
    int num=i;
    while(num>0){
        arr[count]=num%10;
        num/=10;
        count++;
    }
    if(isArmstrongRec(i,arr,0,count,0) == 1){
    	return 1;
    }
return 0;
}
