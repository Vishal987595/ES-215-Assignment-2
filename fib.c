#include <stdio.h>
#include <time.h>

int Fibonacci(long long unsigned int *arr, int n)
{
	for (int i = 0; i < n; i++) {
        if (i<=1){
            arr[i] = 1;
        }
        else {
            arr[i] = arr[i-1] + arr[i-2]; 
        }	
	}
    return 0;
}


int main(){
    clock_t t;
    t = clock();
    unsigned long long int n = 100;
    unsigned long long int arr[(unsigned long long int)n];

    Fibonacci (arr, n);

    int i;
    for (i=0;i<n;i++){
        printf("[%d  %llu] ",i+1, arr[i]);
    }
    

    t = clock() - t;
    double time_taken = ((double)t)/CLOCKS_PER_SEC;
    printf("\nTime taken is: %f",time_taken);
}

// 94th number onwards the data type is unable to handle it.
