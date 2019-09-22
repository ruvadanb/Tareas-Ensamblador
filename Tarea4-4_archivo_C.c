#include <stdio.h>
int suma();

int main(int a)
{
    setbuf(stdout,NULL);
    int n=0;
    int i;
    int resultado=1;
    for(i=0;i<n;i++){
        resultado=multiplicacion(resultado);
    }
    return 0;
}

int multiplicacion (int a){
    int c=0;
    c=2*a;
    return c;
}

