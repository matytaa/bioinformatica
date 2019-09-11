# Dynamic Programming
[UNTREF] Repo para la materia Bioinformática 

Realizar el alineamiento de las secuencias ACGTCAT contra TCATGCA
Ejecutar el siguiente comando en la consola RStudio
```
find_lcs('ACGTCAT','TCATGCA')
```
Salida por consola
```
$lcs

[1] "AGCA"

$length

[1] 4

$score
    T C A T G C A
  0 0 0 0 0 0 0 0
A 0 0 0 1 1 1 1 1
C 0 0 1 1 1 1 2 2
G 0 0 1 1 1 2 2 2
T 0 1 1 1 2 2 2 2
C 0 1 2 2 2 2 3 3
A 0 1 2 3 3 3 3 4
T 0 1 2 3 4 4 4 4

$backtrack
     T    C    A    T    G    C    A   
  "" ""   ""   ""   ""   ""   ""   ""  
A "" "|"  "|"  "\\" "--" "--" "--" "--"
C "" "|"  "\\" "|"  "|"  "|"  "\\" "--"
G "" "|"  "|"  "|"  "|"  "\\" "|"  "|" 
T "" "\\" "|"  "|"  "\\" "|"  "|"  "|" 
C "" "|"  "\\" "--" "|"  "|"  "\\" "--"
A "" "|"  "|"  "\\" "--" "--" "|"  "\\"
T "" "|"  "|"  "|"  "\\" "--" "--" "|" 
```
