# ProyectoBiologiaSistemas
***Hola, aqui pondre mi proyecto.***

# Simulacion de la evolucion
# Toma de decisiones
# Interaccion humana y pensamientos

Poner lo leido y referencia

14 y 18 de abril
## Simulacion de la evolucion 
Yo voy a hacer un simulador de la evolucion sintetico, en el que consista en tomar todas las variables bioticas y abioticas posibles y sus combinaciones.
  Los demas apuntes sobre como se va a realizar las combinaciones se tienen en una hoja de libreta en la casa. **Recordar ver esa hoja**

Tendremos un sistema sintetico que solo sera basado en una bacteria X
  - El modelo va ser realizado en Python
  - Considerara cada uno de las variables abioticas
    1. Temperatura
    2. pH
    3. Humedad
    4. sustrato
    5. Gases
    6. mutagenicos
    7. metales y su disponibilidad
    etc
  - Considerará cada una de las variables bioticas
    1. Interaccion bacteria-bacteria
    2. Interaccion bacteria-hongo
    3. Interaccion bacteria-animal o planta
    4. Metabolitos
    5. Compuestos organicos
    6. enzimas
    7. proteinas
    8. virus
    9. otros patogenos


   - Mecanismos moleculares
   1. Reparacion
   2. Replicacion
   3. Duplicacion
   4. Nivel de expresion
   5. Funcion (fundamental o no fundamental)
   6. Influencia de metabolitos
   7. Epigenetica

  - Actividad del investigado
    1. Caza
    2. Infeccion
    3. Depredacion
    4. Muerte

  - Percibira 
    1. El crecimiento
    2. tasa de expresion
    3. tasa de mutacion
    4. tiempo
    5. El azar sera relacionado con la cuantica y como ejemplo se tomara una semilla de numeros random

  - Exportara
    1. Mutaciones
    2. locacion de la mutacion
    3. frecuencia
    4. graficos de todo lo posible
    5. relacion gen mutacion
    6. relacion no gen a mutacion

El codigo de python se basara en condiciones aleatorias o funciones aleatorias que estaran condicionadas a las probabilidades que se generen tambien de forma aleatoria. Por lo que cada uno de los procesos se validara por si mismo en la que se vaya sumando, se tomada otras condiciones para determinar donde y cuantos nucleotidos se va a cambiar, eliminar o duplicar.
1. Habra regiones que se consideraran genes y habra otras que no lo sean.
2. Considerara adicion de genes.
3. Considerara donde son las regiones promotoras, regiones reguladoras, accion de TF.
4. Habra regiones que se modifiquen mas que otras.
5. Habra regiones que sean mas conservadas o seleccion neutra.
6. Habra lugares que mutaran hasta fijarse.
7. Habra mutaciones que no se fijaran.

**LEER** https://www.cell.com/fulltext/S0092-8674%2812%2900776-3

### 22/04/2023
A partir de aqui, la informacion que se coloque aqui, es para registrar cada una de las modificaciones y logica dentro del codigo python
Este [link](https://docs.google.com/document/d/1YDm086PFRrov0miDkIycMEBP3UxLSZK-4tMIfxQiSrc/edit?usp=sharing) sera para un Google docs que llevara toda la informacion consultada, el desenlace de las ideas, asi como diagramas o bocetos que se hagan en una libreta o hoja de papel.

Codigo python


~~~
# Libro en donde se va a poner todo el codigo sobre el simulador de la evolucion
# Contamos con PURINAS = ADENINA (A) y GUANINA (G)
# Contamos con PIRIMIDINAS = CITOSINA (C) y [[TIMINA (T) y URACILO (U)]]
# Trabajo de codigo 10/05/2023
import random

def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    x = int(input("Coloque el tamaño de su secuencia"))
    gen1 = str(input("Coloque el nombre del gen 1: "))
    tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: ")
    gen2 = str(input("Coloque el nombre del gen 2: "))
    tasagen2 = float(input("Coloque la tasa de mutacion del gen 2: ")
    gen3 = str(input("Coloque el nombre del gen 3: "))
    tasagen3 = float(input("Coloque la tasa de mutacion del gen 3: ")
# Ahora lo que haremos es que tomaremos estos datos y de forma aleatoria tomaremoa las posiciones y la longitu del gen, tambnien debemo de tomar un tamño minimo de la secuencia, tambien lo que vamos a hacer es corregir los codontes en cuanto al tamaño, asi como otra parte imprimiremos los datos.
    info_inicial = {"tamaño de la secuencia objetivo": 1, "gen 1" : gen1, "tasa de mutacion 1": tasagen1, "gen 2" : gen2, "tasa de mutacion 2": tasagen2, "gen 3" : gen3, "tasa de mutacion 3": tasagen3}
    seq = ""
    NucleoATGC = "ATGC"
    n = 0
    while n <= x:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
    return seq
~~~
Codigo python
~~~
# Trabajo de codigo 12/05/2023


# Libro en donde se va a poner todo el codigo sobre el simulador de la evolucion
# Contamos con PURINAS = ADENINA (A) y GUANINA (G)
# Contamos con PIRIMIDINAS = CITOSINA (C) y [[TIMINA (T) y URACILO (U)]]
# Las tasas de mutacion seran colocadas en este rango [0,1]
# Las secuencias van a tener un tamaño minimo de 200
    # La razon de estas 200, es que estamos considerando un genoma con minimo 3 genes, por lo que si fuese un gen, podria considerarse hasta tamaño de 50bp, pero no es el caso
import random

def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    x = int(input("Coloque el tamaño de su secuencia"))
    gen1 = str(input("Coloque el nombre del gen 1: "))
    tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
    gen2 = str(input("Coloque el nombre del gen 2: "))
    tasagen2 = float(input("Coloque la tasa de mutacion del gen 2: "))
    gen3 = str(input("Coloque el nombre del gen 3: "))
    tasagen3 = float(input("Coloque la tasa de mutacion del gen 3: "))
# Procedemos a tomar la secuencia, la cual sera corregida de tamaño, respetanto la cantidad de aminoacidos por triplete de bases
    if x >= 200:
        if (x % 2) == 0:
            print("mantiene el  tamaño")
        else:
            x += 1

    info_inicial = {"tamaño de la secuencia objetivo": x, "gen 1" : gen1, "tasa de mutacion 1": tasagen1, "gen 2" : gen2, "tasa de mutacion 2": tasagen2, "gen 3" : gen3, "tasa de mutacion 3": tasagen3}

# Ahora definimos el tamaño de cada uno de los genes, donde cada gen tendra un tamaño  puede ser igual o similar, dependera de la aleatoriedad
# Para ello condicionaremos a que no se sobrelapen, por lo que debera de haber una manera de colocar numero aleatorios, pero que las secuencias no se sobrelapen
# Tambien por fines practicos, el tamaño de los genes tendran un tamaño proporcional al tamaño del genoma
    sizes = "" # Definimos donde vamos a guardar los numeros aleatorios
    # Sin antes vamos a definir una funcion en donde se definira un tamaño minimo y maximo de las secuencias que sea entre un 10% a 35
    while kopf == True:
        n = 
        while :
            num = random.randint(
            sizes += 
            n += 1
    
    seq = ""
    NucleoATGC = "ATGC"
    n = 0
    while n <= x:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
    return seq
# Ahora que creamos la secuencia, vamos a proceder a dividir la secuencia en pequeñas partes
~~~

Lo que necesitaba es hacer que el programa pueda seguir pidiendo informacion hasta que de la correcta
~~~
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)
            return x

En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos
Coloque el tamaño de su secuencia 0.258903485048302
0.258903485048302
No es entero 0.258903485048302 Numeros enteros son 1, 2, 3 hasta 1000 y mas
Coloque el tamaño de su secuencia 0.174892789473927438
0.17489278947392745
No es entero 0.17489278947392745 Numeros enteros son 1, 2, 3 hasta 1000 y mas
Coloque el tamaño de su secuencia 2.23895893454
2.23895893454
No es entero 2.23895893454 Numeros enteros son 1, 2, 3 hasta 1000 y mas
Coloque el tamaño de su secuencia 50000000
50000000.0
Ya es entero 50000000.0
50000000.0


En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos
Coloque el tamaño de su secuencia 1
1.0
Ya es entero 1.0
1.0
~~~
Ahora para que nos de numeros entre 0 y 1
~~~
def tasa():
    while True:
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("Uy pa, como que no le atinaste pa, intentalo de nuevo")
        else:
            print("Excelente si es una tasa viable")
            return tasagen1
            
Coloque la tasa de mutacion del gen 1:  2
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque la tasa de mutacion del gen 1:  3
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque la tasa de mutacion del gen 1:  4
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque la tasa de mutacion del gen 1:  5
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque la tasa de mutacion del gen 1:  6
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque la tasa de mutacion del gen 1:  7
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque la tasa de mutacion del gen 1:  1
Excelente si es una tasa viable
1.0
~~~

De esta manera no funciona bien
~~~
# Ahora si lo intentamos en conjunto
def funcion():
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)
            return x
    while True:
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("Uy pa, como que no le atinaste pa, intentalo de nuevo")
        else:
            print("Excelente si es una tasa viable")
            return tasagen1
            
funcion()
Coloque el tamaño de su secuencia 2
Ya es entero 2.0
2.0         
~~~
Dio el mismo resultado
~~~
# Ahora si lo intentamos en conjunto
def funcion():
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)
            return x
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("Uy pa, como que no le atinaste pa, intentalo de nuevo")
        else:
            print("Excelente si es una tasa viable")
            return tasagen1

funcion()    
Coloque el tamaño de su secuencia 19
Ya es entero 19.0
19.0
~~~
Ahora solo se modifico el return, para ponerlo en el ultimo condicional
~~~
# Ahora si lo intentamos en conjunto
def funcion():
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("Uy pa, como que no le atinaste pa, intentalo de nuevo")
        else:
            print("Excelente si es una tasa viable")
            return x, tasagen1
            
funcion()
Coloque el tamaño de su secuencia 12
Ya es entero 12.0
Coloque la tasa de mutacion del gen 1:  2
Uy pa, como que no le atinaste pa, intentalo de nuevo
Coloque el tamaño de su secuencia 3
Ya es entero 3.0
Coloque la tasa de mutacion del gen 1:  0.5
Excelente si es una tasa viable
(3.0, 0.5)
~~~


Ahora toca continuar con generarlo en un solo while 
# Referencias
## Greenwell, R. N., Angus, J. E., & Finck, M. (1995). Optimal mutation probability for genetic algorithms. Mathematical and Computer Modelling, 21(8), 1-11. {#ref1}
