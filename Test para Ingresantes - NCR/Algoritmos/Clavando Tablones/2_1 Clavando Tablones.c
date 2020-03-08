#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
//Declaración de la funcion Solution, que recibe 3 arreglos no vacios de indice 0, y 2 enteros mayores a 0
int solution (int [], int [], int, int [], int);

void main(){
    int N,M;
    printf("Cuantas tablas se deben clavar? ");
    scanf("%d",&N);
    fflush(stdin);
    printf("\nCuantos clavos estan disponibles? ");
    scanf("%d",&M);
    fflush(stdin);
    int A[100],B[100],C[100];
    //Se asume que N y M son mayores a 0
    solution(A,B,N,C,M);


}

int solution (int A[], int B[], int N, int C[], int M){
    int lengthTable = N;
    int lengthNails = M;
    int i;
    printf("\n\n");
    //Llenado del arreglo A (Inicio de tablones) y B (Fin de tablones) con enteros mayores a 0
    for (i=0; i<=lengthTable-1; i++){
        printf("Ingrese el inicio de la tabla %d: ", i+1);
        scanf("%d",&A[i]);
        fflush(stdin);
        //Se verifica qie A[i] es un entero mayor a 0, asumiendo que se ingresa un entero
        while (A[i]<1){
            printf("Valor inválido. Ingreselo nuevamente: ");
            scanf("%d",&A[i]);
            fflush(stdin);
        }
        printf("Ingrese el final de la tabla %d: ", i+1);
        scanf("%d",&B[i]);
        fflush(stdin);
        //Se verifica qie A[i] es un entero mayor a 0 y mayor o igual a A[i], asumiendo que se ingresa un entero
        while (B[i]<1 || B[i]<=A[i]){
            printf("Valor inválido. Ingreselo nuevamente: ");
            scanf("%d",&B[i]);
            fflush(stdin);
        }
    }
    //Llenado del arreglo C (Clavos) con enteros mayores a 0
    for (i=0; i<=lengthNails-1; i++){
        printf("Ingrese posicion del clavo %d: ", i+1);
        scanf("%d",&C[i]);
        fflush(stdin);
        //Se obtiene el rango de los tablones (el valor más alto de B, y el valor más bajo de A)
        int mayor, menor;
        mayor = B[0];
        menor = A[0];
        int x;
        for (x=0; x<lengthTable; x++){
            if (B[x]> mayor){
                mayor=B[x];
            }
            if (A[x]< menor){
                menor=A[x];
            }
        }
        //Se verifica qie C[i] es un entero mayor a 0 y posible dentro del rango de tablones, asumiendo que se ingresa un entero
        while (C[i]<1 || C[i]<menor || C[i]>mayor){
            printf("Valor inválido. Ingreselo nuevamente: ");
            scanf("%d",&C[i]);
            fflush(stdin);
        }
        //Se verifica qie C[i] no se repita
        for (x=0; x<lengthNails; x++){
            if(C[x]==C[i] && x!=i){
                printf("Valor inválido. Ingreselo nuevamente: ");
                scanf("%d",&C[i]);
                fflush(stdin);
                break;
            }
        }
    }
    int j,k;
    int posible = 1,count=0;
    //Se verifica que sea posible clavar todos los tablones
    for (i=0; i<=lengthTable-1; i++){
        for (k=0; k<=lengthNails-1; k++){
            //Si existe un clavo que clave el tablón actual, aumenta un contador
            if (C[k]>=A[i] && C[k]<=B[i]){
                count++;
            }
        }
        //Si el contador no aumentó, significa que para el tablón actual no existe clavo que pueda clavarse.
        //Caso contrario, se reinicia el contador y continua el bucle con el siguiente tablón
        if (count==0){
            posible = 0;
            i=lengthTable;
        }else{
            count = 0;
        }
    }
    int over=0, counter=0;
    //En caso de ser posible clavar todos los tablones, se verifica la cantidad minima de clavos secuenciales que se necesita para dicha acción
    if(posible == 1){
        int statusT[100];
        int m;
        //Relleno de el arreglo "statusT" con 0's en las posiciones a utilizar
        for (m=0;m<=lengthTable-1;m++){
            statusT[m]=0;
        }
        //Se verifica en orden cada clavo, y las tablas que clava el mismo
        for (k=0; k<=lengthNails-1; k++){
            for (i=0; i<=lengthTable-1; i++){
                //Si el clavo actual está dentro del rango de la tabla actual, se le asigna el estado 1 a statusT[i] (tabla "i" clavada)
                if (C[k]>=A[i] && C[k]<=B[i]){
                    statusT[i] = 1;
                }
            }
            //El contador de pasos aumenta, ya que se clavó un clavo
            counter++;
            int l;
            //se verifica que todos los tablones estén clavados. En ese caso, "over" valdra lo mismo que la cantidad de tablones
            for (l=0;l<lengthTable;l++){
                if (statusT[l]==1){
                    over++;
                }
            }
            //Si "over" vale lo mismo que la cantidad de tablones, se finaliza la función, pues ya fueron todas las tablas clavadas
            if (over==lengthTable){
                //la funcion retorna el valor del contador de pasos
                return counter;
            }else{
                //en caso contrario se reinicia "over" y se continua con el bucle
                over=0;
            }
        }
    }else{
        return -1;
    }

}
