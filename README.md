Acceso a la presentacion y avance del proyecto https://docs.google.com/document/d/1ZAMC8PKRu5ygaMElUB_ZJ3SAGEwB2vDRrzdfdzAtMbQ/edit?usp=sharing
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


```python
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
```
Codigo python
```python
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
```

Lo que necesitaba es hacer que el programa pueda seguir pidiendo informacion hasta que de la correcta
```python
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
```
13/05/2023
Ahora para que nos de numeros entre 0 y 1
```python
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
```

De esta manera no funciona bien
```python
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
```
Ahora toca continuar con generarlo en un solo while 
Dio el mismo resultado
```python
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
```
Ahora solo se modifico el return, para ponerlo en el ultimo condicional
```python
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
```
Ahora que junte todos los valores que se requieren, al terminar la funcion con return termina, y con yield, solo se puede si es iterable. 
Por tanto se buscara que sea por el otro lado, que continue dentro del ultimo else
```python
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)

        gen1 = str(input("Coloque el nombre del gen 1: "))
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
            
        gen2 = str(input("Coloque el nombre del gen 2: "))
        tasagen2 = float(input("Coloque la tasa de mutacion del gen 2: "))
        log = tasagen2 >= 0 and tasagen2 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
    
        gen3 = str(input("Coloque el nombre del gen 3: "))
        tasagen3 = float(input("Coloque la tasa de mutacion del gen 3: "))
        log = tasagen3 >= 0 and tasagen3 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
            yield x, gen1, tasagen1, gen2, tasagen2, gen3, tasagen3
    print("x: ",x, "gen1", gen1, "tasagen1", tasagen1, "gen2", gen2, "tasagen2", tasagen2, "gen3", gen3, "tasagen3", tasagen3)
```
Ya que ahora podemos terminar una funcion y llamar a otra ahora solo queda condicionar mas, para el tamaño de la secuencia, asi como de otros factores
```python
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)

        gen1 = str(input("Coloque el nombre del gen 1: "))
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
            
        gen2 = str(input("Coloque el nombre del gen 2: "))
        tasagen2 = float(input("Coloque la tasa de mutacion del gen 2: "))
        log = tasagen2 >= 0 and tasagen2 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
    
        gen3 = str(input("Coloque el nombre del gen 3: "))
        tasagen3 = float(input("Coloque la tasa de mutacion del gen 3: "))
        log = tasagen3 >= 0 and tasagen3 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
            return x, gen1, tasagen1, gen2, tasagen2, gen3, tasagen3

#Una vez termina la funcion, hacemos otra funcion para que continue el proceso

def TargetSigue(x, gen1, tasagen1, gen2, tasagen2, gen3, tasagen3):
    print(x, gen1, tasagen1, gen2, tasagen2, gen3, tasagen3)

# Procedemos a que se guarden los valores y que actuen ambas funciones en una sola corrida    
x, gen1, tasagen1, gen2, tasagen2, gen3, tasagen3 = Targetseq()
TargetSigue(x, gen1, tasagen1, gen2, tasagen2, gen3, tasagen3)
```
# Codigo original, no terminado pero avanzado
```python
# Trabajo de codigo 13/05/2023


# Libro en donde se va a poner todo el codigo sobre el simulador de la evolucion
# Contamos con PURINAS = ADENINA (A) y GUANINA (G)
# Contamos con PIRIMIDINAS = CITOSINA (C) y [[TIMINA (T) y URACILO (U)]]
# Las tasas de mutacion seran colocadas en este rango [0,1]
# Las secuencias van a tener un tamaño minimo de 201
    # La razon de estas 200, es que estamos considerando un genoma con minimo 3 genes, por lo que si fuese un gen, podria considerarse hasta tamaño de 50bp, pero no es el caso
import random

def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    while True:
        x = float(input("Coloque el tamaño de su secuencia"))
        log = x % 1 != 0
        if log == True:
            print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
        else:
            print("Ya es entero", x)

        gen1 = str(input("Coloque el nombre del gen 1: "))
        tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: "))
        log = tasagen1 >= 0 and tasagen1 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
            
        gen2 = str(input("Coloque el nombre del gen 2: "))
        tasagen2 = float(input("Coloque la tasa de mutacion del gen 2: "))
        log = tasagen2 >= 0 and tasagen2 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
    
        gen3 = str(input("Coloque el nombre del gen 3: "))
        tasagen3 = float(input("Coloque la tasa de mutacion del gen 3: "))
        log = tasagen3 >= 0 and tasagen3 <= 1
        if log == False:
            print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
        else:
            print("Excelente, si es una tasa viable")
            return x, [gen1, tasagen1], [gen2, tasagen2], [gen3, tasagen3]
    

        
# Procedemos a tomar la secuencia, la cual sera corregida de tamaño, respetanto la cantidad de aminoacidos por triplete de bases
    if x < 201:
        x = 201
        aa = x/3
        long = "Corregimos a una longitud del genoma: " + x + "\n" + "Con una cantidad de aminoacidos: " + aa
        print(long)
    else:
        # Debemos de buscar la manera de que el programa puede utilizar una manera de que el tamaño es funcional y si no para despues corregir
         if (x % 3) == 0: #(sin residuos)
                aa = x/3
                long = "Con una longitud del genoma: " + x + "\n" + "y una cantidad de aminoacidos: " + aa
                print(long)

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
```
14/05/2023
Hice una modificacion para tener salida
```python
# Ahora se quiere comprobar que tambien se va a regresar si no se agrega nada de informacion
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x == "":
            print("Si quieres salir, solo escribe 'exit' y si quieres continuar, escribe un tamaño")
        elif x == "exit":
            print("Has salido del programa")
            return
        else:
            x = float(x)
            log = x % 1 != 0
            if log == True:
                print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
            else:
                print("Ya es entero", x)
Targetseq()
```
Avance final de la logica, aunque falta corregir aun, sobre todo la parte de abajo
```python
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x == "":
            print("Si quieres salir, solo escribe (*) y si quieres continuar, escribe un tamaño")
        elif x == "*":
            print("Has salido del programa")
            return
        else:
            x = float(x)
            log = x % 1 != 0
            if log == True:
                print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
            else:
                if x < 201:
                    x = 201
                    print(x)
                    break
                else:
                    y = x/3 == int(x/3) #Establece si el valor que se divide es entero, si no lo es dara False
                # Para saber si por el numero de genes da un numero entero para jugar con eso en la secuencia
                # La logica es que al decir que no es un real
                    if y == True:
                        print(x)
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                        while True:
                            logicaMenor = debajo/3 == int(debajo/3)
                            logicaMayor = arriba/3 == int(arriba/3)
                            if logicaMenor == True:
                                x = debajo
                                print(x)
                                break
                            if logicaMayor == True:
                                x = arriba
                                print(x)
                                break
                            else:
                                debajo = x - 1
                                arriba = x + 1
                        break
                           
                            
#Ya solo falta darle detalles a lo de arriba y a corregir a lo de abajo

# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta gen1.
    n = 0
    while n >= 0 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen 1: "))
            if gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
            elif gen == "*":
                print("Has salido del programa")
                return
            else:
                break
        print(gen)
# Aqui falta correogir, porque el * no se puede convertir a real, entonces de tener una entrada 
# tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: ")), la dividimos
# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta tasagen1.
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()
            if tasagen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe la tasa que pertenezca [0,1]")
            elif tasagen == "*":
                print("Has salido del programa")
                return
            else:
                if '/' in tasagen:
                    numerador, denominador = tasagen.split('/')
                    valor = float(numerador) / float(denominador)
                    print(valor)
                    log = valor >= 0 and valor <= 1
                    if log == False:
                        print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    else:
                        print("Excelente, si es una tasa viable", valor)
                        break
                
                else:
                    tasagen = float(tasagen)
                    log = tasagen >= 0 and tasagen <= 1
                    if log == False:
                        print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    else:
                        print("Excelente, si es una tasa viable", tasagen)
                        n += 1
# Para hacer menos codigo, se decidira crear un diccionario y por tanto ir guardando los datos
```

#####################################################################################################################################

# 21/05/2023
Parte 1 finalizada del codigo
```python
# Modificación de código, Fecha: 21/05/2023
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x == "":
            print("Si quieres salir, solo escribe (*) y si quieres continuar, escribe un tamaño")
        elif x == "*":
            print("Has salido del programa")
            return
        else:
            x = float(x)
            log = x % 1 != 0
            if log == True:
                print("No es entero", x, "Numeros enteros son 1, 2, 3 hasta 1000 y mas")
            else:
                if x < 201:
                    x = 201
                    print(x)
                    break
                else:
                    y = x/3 == int(x/3) #Establece si el valor que se divide es entero, si no lo es dara False
                # Para saber si por el numero de genes da un numero entero para jugar con eso en la secuencia
                # La logica es que al decir que no es un real
                    if y == True:
                        print(x)
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                        while True:
                            logicaMenor = debajo/3 == int(debajo/3)
                            logicaMayor = arriba/3 == int(arriba/3)
                            if logicaMenor == True:
                                x = debajo
                                print(x)
                                break
                            if logicaMayor == True:
                                x = arriba
                                print(x)
                                break
                            else:
                                debajo = x - 1
                                arriba = x + 1
                        break
                           
                            
#Ya solo falta darle detalles a lo de arriba y a corregir a lo de abajo

# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta gen1.
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
            elif gen == "*":
                print("Has salido del programa")
                return
            else:
                break
        print(gen)
# Aqui falta correogir, porque el * no se puede convertir a real, entonces de tener una entrada 
# tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: ")), la dividimos
# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta tasagen1.
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()
            if tasagen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe la tasa que pertenezca [0,1]")
            elif tasagen == "*":
                print("Has salido del programa")
                return
            else:
                if '/' in tasagen:
                    numerador, denominador = tasagen.split('/')
                    valor = float(numerador) / float(denominador)
                    print(valor)
                    log = valor >= 0 and valor <= 1
                    if log == False:
                        print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    else:
                        print("Excelente, si es una tasa viable", valor)
                        n += 1
                        break
                
                else:
                    tasagen = float(tasagen)
                    log = tasagen >= 0 and tasagen <= 1
                    if log == False:
                        print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    else:
                        print("Excelente, si es una tasa viable", tasagen)
                        n += 1
                        break
# Para hacer menos codigo, se decidira crear un diccionario y por tanto ir guardando los datos
Targetseq()
```
Ahora con este codigo nos va a ayudar mucho a la parte de diferenciar si es un digito, decimal o cadena, para aplicarla en el codigo
```python
x = input("pon algo ")
if x.isdigit():
    print("Es un numero entero", x)
elif x.replace(".", "").isnumeric(): 
    print("es decimal ",x)
else:
    print(x)
```

Hasta este punto se busco la manera de que el programa siguiera funcionando una vez que se terminara de evaluar.
```python
# Ahora simulamos el inicio
while True:
    x = input("pon algo ") #Pretendemos que coloque un valor
    if x.isdigit(): #Evalua que es un entero, por que al ser correcto continua...
        print("Es un numero entero", x) 
        x = int(x) #Ahora que ya se sabe que es un valor entero, el input se convierte a un valor entero
    elif x.replace(".", "").isnumeric(): # Si es un valor con decimal, pretende redondear el valor colocado
        print("es decimal ",x)
        print("Por favor coloca un numero entero") # Obligamos a que la persona ponga un numero que sea entero
        continue
    elif x=="*":
        print("este es para salir") # SALITE
    else:
        print(x) # Hasta este punto el querer regresar hasta que se ponga un numero entero
        continue
    
    print(x*2) # Aqui vemos como actua el numero fuera de los condionales
    break # Una vez acabamos, cerramos el bucle y continuamos a evaluar las variables guardadas
print("numero final ", x) #Al finall si te imprime el valor entero x que pones 
```
Solo falta aplicarlo en las demas partes del codigo

```python
# Modificación de código, Fecha: 21/05/2023
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)

        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201)
                continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
                  
        if x < 201:
            x = 201
            print(x)
            break
        else:
            y = x/3 == int(x/3) #Establece si el valor que se divide es entero, si no lo es dara False
            # Para saber si por el numero de genes da un numero entero para jugar con eso en la secuencia
            # La logica es que al decir que no es un real
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        print(x)
                        break
                    if logicaMayor == True:
                        x = arriba
                        print(x)
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
                           
                            
#Ya solo falta darle detalles a lo de arriba y a corregir a lo de abajo

# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta gen1.
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                break
            elif gen == "*":
                print("Has salido del programa")
                return
            else:
                break
        print(gen)
# Aqui falta correogir, porque el * no se puede convertir a real, entonces de tener una entrada 
# tasagen1 = float(input("Coloque la tasa de mutacion del gen 1: ")), la dividimos
# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta tasagen1.
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()
            if tasagen == "" or tasagen == str(tasagen):
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe la tasa que pertenezca [0,1]")
                break
            elif tasagen == "*":
                print("Has salido del programa")
                return
            else:
                if '/' in tasagen:
                    numerador, denominador = tasagen.split('/')
                    valor = float(numerador) / float(denominador)
                    print(valor)
                    log = valor >= 0 and valor <= 1
                    if log == False:
                        print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    else:
                        print("Excelente, si es una tasa viable", valor)
                        n += 1
                        b
                        
                        reak
                
                else:
                    tasagen = float(tasagen)
                    log = tasagen >= 0 and tasagen <= 1
                    if log == False:
                        print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    else:
                        print("Excelente, si es una tasa viable", tasagen)
                        n += 1
                        break
    return Datos
# Para hacer menos codigo, se decidira crear un diccionario y por tanto ir guardando los datos
Targetseq()


#Ahora que ya tenemos el formato de todos los genes y nombres asi como de tasas, buscaremos imprimir todos esos datos y manipularlos
```
Falta agregar depurar los datos cuando se agrega valores con un cero al inicio ej: 023,030 etc,
Falta corregir para cuando meten valores repetidos, poner la condicion de que le falta corregir, porque ya agrego ese dato
```python
# Modificación de código, Fecha: 22/05/2023
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)

        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
                  
        if x < 201:
            x = 201
            print(x)
            break
        else:
            y = x/3 == int(x/3) #Establece si el valor que se divide es entero, si no lo es dara False
            # Para saber si por el numero de genes da un numero entero para jugar con eso en la secuencia
            # La logica es que al decir que no es un real
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        print(x)
                        break
                    if logicaMayor == True:
                        x = arriba
                        print(x)
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
                           
                            
#Ya solo falta darle detalles a lo de arriba y a corregir a lo de abajo

# Para seguir preguntado, debiamos agregar otro while si en todo caso se debia repetir la pregunta gen1.
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return
            else:
                break
        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()
            if tasagen.isdigit(): #Evalua que es un entero, por que al ser correcto continua...
                print("Es un numero entero", x) 
                if tasagen == 1 or tasagen == 0:
                    tasagen = float(tasagen)
                    Datos[gen] = tasagen
                elif tasagen < 0 or tasagen > 1:
                    continue #Ahora que ya se sabe que es un valor entero, el input se convierte a un valor entero
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric(): # Si es un valor con decimal, pretende redondear el valor colocado
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    n += 1
                    break
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x) # Hasta este punto el querer regresar hasta que se ponga un numero entero
                continue
        continue

    return Datos
Targetseq()
```
Con esto sabemos que si hay algun valor que se guardo en el diccionario

```python
# Diccionario de ejemplo
diccionario = {'clave1': 'valor1', 'clave2': 'valor2', 'clave3': 'valor3'}

# Pedir el input al usuario
input_usuario = input("Ingrese un valor: ")

# Verificar si el valor está en el diccionario
for clave, valor in diccionario.items():
    if valor == input_usuario:
        print(f"El valor {input_usuario} está asociado a la clave {clave}")
        break
else:
    print("El valor no está en el diccionario")

```

AVANCE

```python
# Modificación de código, Fecha: 22/05/2023
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
                  
        if x < 201:
            x = 201
            print(x)
            break
        else:
            y = x/3 == int(x/3) #Establece si el valor que se divide es entero, si no lo es dara False
            # Para saber si por el numero de genes da un numero entero para jugar con eso en la secuencia
            # La logica es que al decir que no es un real
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        print(x)
                        break
                    if logicaMayor == True:
                        x = arriba
                        print(x)
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
#######################################################################################################################
            gen, tasa in Datos.items():
                if genes == gen:
                    print(f"El gen {gen} está asociado a la tasa {tasa}, por favor coloca otro nombre de un gen")
                    continue
                else:
                    print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                    break
                
###########################################################################################################################  
            if gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return
            else:
                break
        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit(): #Evalua que es un entero, por que al ser correcto continua...
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    continue #Ahora que ya se sabe que es un valor entero, el input se convierte a un valor entero
                else:
                    Datos[gen] = tasagen
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric(): # Si es un valor con decimal, pretende redondear el valor colocado
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    n += 1
                    break
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x) # Hasta este punto el querer regresar hasta que se ponga un numero entero
                continue
        continue

    return Datos
Targetseq()
```


Hasta este momento ya se logro hacer que al programa pudiese detectar el nombre repetido de la lista.
Hasta es puto vamos a considerar que si se escribe gen1 es diferente que Gen1 o que GEn1 o que GEN1, seran las diferentes formas de que un mismo gen se puede detectar pero que a lo mejor se quiere probar algo etc
```python
# Modificación de código, Fecha: 26/05/2023
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
                  
        if x < 201:
            x = 201
            print(x)
            break
        else:
            y = x/3 == int(x/3) #Establece si el valor que se divide es entero, si no lo es dara False
            # Para saber si por el numero de genes da un numero entero para jugar con eso en la secuencia
            # La logica es que al decir que no es un real
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        print(x)
                        break
                    if logicaMayor == True:
                        x = arriba
                        print(x)
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue # Hasta este punto ya se logro modificar las condicionales para que pudiese detectar si habia alguno ahi que ya existia
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                break  
            if gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return
            else:
                break
        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit(): #Evalua que es un entero, por que al ser correcto continua...
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    continue #Ahora que ya se sabe que es un valor entero, el input se convierte a un valor entero
                else:
                    Datos[gen] = tasagen
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric(): # Si es un valor con decimal, pretende redondear el valor colocado
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    n += 1
                    break
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x) # Hasta este punto el querer regresar hasta que se ponga un numero entero
                continue
        continue

    return Datos
Targetseq()
```
Se le dio un ligero retoque a esta parte del codigo, para que se considerara todas las condicionales
Pero ahora, solo falta corregir lo de la tasa de mutacion, se queda en bucle pidiendo de nuevo el valor sin salirse.
```python
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue # Hasta este punto ya se logro modificar las condicionales para que pudiese detectar si habia alguno ahi que ya existia
            elif gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return        
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                break  
```
Ya corregimos la parte para que solo pida tres genes y tambien para resolver el bucle cuando se ponia nada ("")
```python

        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit(): #Evalua que es un entero, por que al ser correcto continua...
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    n += 1
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    print("Una tasa pertence entre 0 y 1")
                    continue #Ahora que ya se sabe que es un valor entero, el input se convierte a un valor entero
                else:
                    Datos[gen] = tasagen
                    n += 1
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric(): # Si es un valor con decimal, pretende redondear el valor colocado
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    n += 1
                    break
            elif tasagen=="":
                print("Por favor coloque una tasa entre 0 y 1 o escribe '*' para salir") # SALITE
                continue
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x) # Hasta este punto el querer regresar hasta que se ponga un numero entero
                continue
        continue

    return Datos  
```
Ya se le agrego la generacion de nucletidos de manera aletoria, ademmas de pequeñas modificaciones
```python
# Modificación de código, Fecha: 27/05/2023
import random
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
                  
        if x < 201:
            x = 201
            print(x)
            Datos["Tamaño de la secuencia"] = x
            break
        else:
            y = x/3 == int(x/3)
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        Datos["Tamaño de la secuencia"] = x
                        break
                    if logicaMayor == True:
                        x = arriba
                        Datos["Tamaño de la secuencia"] = x
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue 
            elif gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return        
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                break  

        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit():
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    n += 1
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    print("Una tasa pertence entre 0 y 1")
                    continue
                else:
                    Datos[gen] = tasagen
                    n += 1
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric():
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    n += 1
                    break
            elif tasagen=="":
                print("Por favor coloque una tasa entre 0 y 1 o escribe '*' para salir")
                continue
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x)
                continue
        continue
    
    # Ahora se pretende que el programa te de la secuencia y te de el tamaño de los genes
    seq = ""
    NucleoATGC = "ATGC"
    n = 0
    while n <= x:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
    
    # Ahora que ya tenemos la secuencia de referencia formada, empezaremos a definir de manera aleatoria los tamaños de las secuencias
    # Para ello lo que añadiremos es de acuerdo al tamaño, utilizaremos de 3 en tres, el proceso de seleccion de los genes
    ## HAY QUE CONSIDERAR QUE TODOS LOS GENES + SUS PROMOTORES TENDRAN EL MISMO TAMAÑO, LO QUE CAMBIA ES LA TASA Y EL GEN
    
    
Targetseq()
```
28/05/2023
Pequeña prueba, para ver como se adaptan las claves de un diccionario
```python
import pandas as pd
dicprueba = {'3': 1.0, 'tres': 0.0, '3¡0': 1.0, '93': 0.2}
print(dicprueba.keys())
print(list(dicprueba.keys()))
print(type(dicprueba.keys()))



# Datos para el DataFrame
data = {
    'Nombre': list(dicprueba.keys()),
    'Edad': [25, 30, 28, 32],
    'Ciudad': ['Madrid', 'Barcelona', 'Sevilla', 'Valencia']
}

# Crear DataFrame
df = pd.DataFrame(data)

# Imprimir el DataFrame
print(df)
```
Pequeño punto de partida para continuar
```python
# Modificación de código, Fecha: 28/05/2023
import random
import pandas as pd
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    genes = []
    tasas = []
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
            break
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
    while True:                  
        if x < 201:
            x = 201
            print(x)
            Datos["Tamaño de la secuencia"] = x
            break
        else:
            y = x/3 == int(x/3)
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        Datos["Tamaño de la secuencia"] = x
                        break
                    if logicaMayor == True:
                        x = arriba
                        Datos["Tamaño de la secuencia"] = x
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue 
            elif gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return        
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                genes.append(gen)
                break  

        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit():
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    print("Una tasa pertence entre 0 y 1")
                    continue
                else:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    tasas.append(valor)
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric():
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
            elif tasagen=="":
                print("Por favor coloque una tasa entre 0 y 1 o escribe '*' para salir")
                continue
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x)
                continue
        continue
    
    # Ahora se pretende que el programa te de la secuencia y te de el tamaño de los genes
    seq = ""
    NucleoATGC = "ATGC"
    l = x - 1
    n = 0
    while n <= l:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
    
    # Ahora que ya tenemos la secuencia de referencia formada, empezaremos a definir de manera aleatoria los tamaños de las secuencias
    # Para ello lo que añadiremos es de acuerdo al tamaño, utilizaremos de 3 en tres, el proceso de seleccion de los genes
    ## HAY QUE CONSIDERAR QUE TODOS LOS GENES + SUS PROMOTORES TENDRAN EL MISMO TAMAÑO, LO QUE CAMBIA ES LA TASA Y EL GEN
    
    # Definimos la longitus de los genes
    posgen = (x/3) - 1 # CONSERVAMOS EL NUMERO ORIGINAL PARA HACER LA OPERACION DE POSICION
    # DE REFERENCIA, X = 201, pero se divide y resta -1, queda 66
    inicial = [] 
    final = [] # CREAMOS DOS LISTAS PARA ALMACENAR LAS OPERACIONES DE LAS POSICIONES DE LOS GENES
    n = 1
    while n <= 3:
        if n == 1:
            inicial.append(0) # Se agrega inmediatamente hasta la posicion inicial del gen 1 (se agrega 0)
            final.append(posgen) # para tambien agregar la posicion final del gen 1 (se agrega 66)
            posgen_i = posgen + 1 # Mas pronto de lo que canta un gallo, se le suma para 67
            posgen_f = posgen_i + posgen # Ahora tambien suma 67 + 66 = 133
            n += 1
            continue # Hace que se regrese al bucle para inicial con 67 y finalizar con 133 para el gen 2
        else: #Como el valor de n ya no es 1, ahora es 2, por lo que entra al else
            inicial.append(posgen_i) # Mete el valor 67 de haber regresado de nuevo del bucle
            final.append(posgen_f) # Mete el valor 133 final del gen 
            posgen_i = posgen_f + 1 # Ahora suma 133 del final del gen 1 mas 1
            posgen_f = posgen_i + posgen # Asi como se guardo 134 se suman de nuevo los 66 para tener 200
            n += 1
            continue # Vuelve a regresar para ejecutar el bucle para solo entrar al else y adicionar 134 y 200
        break
    print(list(Datos.keys()))
    print(genes)
    print(tasas)
    print(inicial)
    print(final)
    # Ahora solo como extra solo guardamos las secuencias de los genes para que sean visibles
    fragmentos = []
    n = 0
    while n <= 2:
        frg = seq[int(inicial[n]):int(final[n])]
        fragmentos.append(frg)
        n += 1
    # Seleccion de tamaño de promotores 
    promotores = []
    for i in inicial:
        if x < 403:
            longprom = [6, 9, 12]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
        elif x > 404 and x < 604:
            longprom = [6, 9, 12, 15]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
        elif x > 605 and x < 1000:
            longprom = [6, 9, 12, 15, 18, 21]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
            
    fragpromotor = []
    n = 0
    while n <= 2:
        frg_p = seq[int(inicial[n]):int(promotores[n])]
        fragpromotor.append(frg_p)
        n += 1

    # Procedemos a guardar el diccionario original, para poder modificar
    genoma = {
    'promotor+gen': genes,
    'Pos_ini':inicial,
    'Pos_fin':final,
    'Tasa gen': tasas,
    'Fragmentos genes': fragmentos,
    'ini_prom': inicial,
    'fin_prom': promotores,
    'Frag_promotor': fragpromotor
    }
    df = pd.DataFrame(genoma)
    return Datos, seq, len(seq), df

Targetseq()
```
29/05/2023
Ahora ya modificamos para agregar nuevos valores que contemplan las secuencias del promotor y del gen
```python
# Modificación de código, Fecha: 29/05/2023
import random
import pandas as pd
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    genes = []
    tasas = []
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
            break
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
    while True:                  
        if x < 201:
            x = 201
            print(x)
            Datos["Tamaño de la secuencia"] = x
            break
        else:
            y = x/3 == int(x/3)
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        Datos["Tamaño de la secuencia"] = x
                        break
                    if logicaMayor == True:
                        x = arriba
                        Datos["Tamaño de la secuencia"] = x
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue 
            elif gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return        
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                genes.append(gen)
                break  

        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit():
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    print("Una tasa pertence entre 0 y 1")
                    continue
                else:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    tasas.append(valor)
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric():
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
            elif tasagen=="":
                print("Por favor coloque una tasa entre 0 y 1 o escribe '*' para salir")
                continue
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x)
                continue
        continue
    
    # Ahora se pretende que el programa te de la secuencia y te de el tamaño de los genes
    seq = ""
    NucleoATGC = "ATGC"
    l = x - 1
    n = 0
    while n <= l:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
    
    # Ahora que ya tenemos la secuencia de referencia formada, empezaremos a definir de manera aleatoria los tamaños de las secuencias
    # Para ello lo que añadiremos es de acuerdo al tamaño, utilizaremos de 3 en tres, el proceso de seleccion de los genes
    ## HAY QUE CONSIDERAR QUE TODOS LOS GENES + SUS PROMOTORES TENDRAN EL MISMO TAMAÑO, LO QUE CAMBIA ES LA TASA Y EL GEN
    
    # Definimos la longitus de los genes
    posgen = (x/3) - 1 # CONSERVAMOS EL NUMERO ORIGINAL PARA HACER LA OPERACION DE POSICION
    # DE REFERENCIA, X = 201, pero se divide y resta -1, queda 66
    inicial = [] 
    final = [] # CREAMOS DOS LISTAS PARA ALMACENAR LAS OPERACIONES DE LAS POSICIONES DE LOS GENES
    n = 1
    while n <= 3:
        if n == 1:
            inicial.append(0) # Se agrega inmediatamente hasta la posicion inicial del gen 1 (se agrega 0)
            final.append(posgen) # para tambien agregar la posicion final del gen 1 (se agrega 66)
            posgen_i = posgen + 1 # Mas pronto de lo que canta un gallo, se le suma para 67
            posgen_f = posgen_i + posgen # Ahora tambien suma 67 + 66 = 133
            n += 1
            continue # Hace que se regrese al bucle para inicial con 67 y finalizar con 133 para el gen 2
        else: #Como el valor de n ya no es 1, ahora es 2, por lo que entra al else
            inicial.append(posgen_i) # Mete el valor 67 de haber regresado de nuevo del bucle
            final.append(posgen_f) # Mete el valor 133 final del gen 
            posgen_i = posgen_f + 1 # Ahora suma 133 del final del gen 1 mas 1
            posgen_f = posgen_i + posgen # Asi como se guardo 134 se suman de nuevo los 66 para tener 200
            n += 1
            continue # Vuelve a regresar para ejecutar el bucle para solo entrar al else y adicionar 134 y 200
        break

################################################################################################
    # Ahora solo como extra solo guardamos las secuencias de los genes para que sean visibles
    fragmentos = []
    n = 0
    while n <= 2:
        frg = seq[int(inicial[n]):int(final[n])] # Recortamos los valores de las secuencias que son promotor + gen
        fragmentos.append(frg) 
        n += 1
################################################################################################
    # Seleccion de tamaño de promotores 
    promotores = []
    for i in inicial:
        if x < 403: # De las listas, se procede a tomar los valores iniciales
            longprom = [6, 9, 12]
            tino = random.choice(longprom)
            promotor = i + tino # Con el valor incial se hace la suma de la longitud del promotor, igual para los 3 valores
            promotores.append(promotor) # Se agrega el final del promotor, de cada uno de los genes
        elif x > 404 and x < 604:
            longprom = [6, 9, 12, 15]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
        elif x > 605 and x < 1000:
            longprom = [6, 9, 12, 15, 18, 21]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
################################################################################################
    fragpromotor = []
    fragensinprom = []
    n = 0
    while n <= 2: # Ahora que ya se tienen las coordenadas de las secuencias, recortamos.
        frg_p = seq[int(inicial[n]):int(promotores[n])] # Asi definimos de la secuencia la longitud del promotor
        fragpromotor.append(frg_p)
        frg_g = seq[int(promotores[n]):int(final[n])] # Tomando en cuenta que al inicio del gen, se recorta en la posicion del final del promotor
        fragensinprom.append(frg_g)        
        n += 1
###########################################################################################################
# Ahora toca definir los nucleotidos que seran conservados tanto en el promotor como en el gen
# EN PROMOTOR
###########################################################################################################
    print("Aqui estan los nombres de los genes y tamaño de la secuencia",list(Datos.keys()))
    print("Aqui se muestra el nombre de los genes",genes)
    print("Aqui se muestran las tasas correspondintes",tasas)
    print("Aqui se muestra el inicio de gen + promotor",inicial)
    print("Aqui se muestra el fin de gen + promotor",final)
    print("Aqui se muestra el inicio de promotor",inicial)
    print("Aqui se muestra el fin de promotor", promotores)
    print("Aqui se muestra el inicio de solo el gen", gensinprom)
    print("Aqui se muestra el fin de solo el gen", final)
    
    # Procedemos a guardar el diccionario original, para poder modificar
    genoma = {
    'promotor+gen': genes,
    'Pos_ini':inicial,
    'Pos_fin':final,
    'Tasa gen': tasas,
    'Fragmentos genes': fragmentos,
    'ini_prom': inicial,
    'fin_prom': promotores,
    'Frag_promotor': fragpromotor,
    'ini_gen': gensinprom,
    'fin_gen': final,
    'gen': fragensinprom
    }
    df = pd.DataFrame(genoma)
    return Datos, seq, len(seq), df

Targetseq()
```
30/05/2023
Se modifico parte de la seleccion puntos de conservacion
1. Pendientes, va ser almacenar los nucleotidos de dichas posiciones
2. Establecer un porcentaje de conservacion de manera aletoria para el gen
3. Empezar a crear las poblacione de manera aletaoria con dichos andamios (regiones conservadas)
4. Definir funcion de mutacion depues del cruce
5. Definir funcion fitness por similitud a la secuencia objetivo
```python
### Modificación de código, Fecha: 30/05/2023
import random
import pandas as pd
def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    genes = []
    tasas = []
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
            break
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
    while True:                  
        if x < 201:
            x = 201
            print(x)
            Datos["Tamaño de la secuencia"] = x
            break
        else:
            y = x/3 == int(x/3)
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        Datos["Tamaño de la secuencia"] = x
                        break
                    if logicaMayor == True:
                        x = arriba
                        Datos["Tamaño de la secuencia"] = x
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue 
            elif gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return        
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                genes.append(gen)
                break  

        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit():
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    print("Una tasa pertence entre 0 y 1")
                    continue
                else:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    tasas.append(valor)
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric():
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
            elif tasagen=="":
                print("Por favor coloque una tasa entre 0 y 1 o escribe '*' para salir")
                continue
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x)
                continue
        continue
    
    # Ahora se pretende que el programa te de la secuencia y te de el tamaño de los genes
    seq = ""
    NucleoATGC = "ATGC"
    l = x - 1
    n = 0
    while n <= l:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
    
    # Ahora que ya tenemos la secuencia de referencia formada, empezaremos a definir de manera aleatoria los tamaños de las secuencias
    # Para ello lo que añadiremos es de acuerdo al tamaño, utilizaremos de 3 en tres, el proceso de seleccion de los genes
    ## HAY QUE CONSIDERAR QUE TODOS LOS GENES + SUS PROMOTORES TENDRAN EL MISMO TAMAÑO, LO QUE CAMBIA ES LA TASA Y EL GEN
    
    # Definimos la longitus de los genes
    posgen = (x/3) - 1 # CONSERVAMOS EL NUMERO ORIGINAL PARA HACER LA OPERACION DE POSICION
    # DE REFERENCIA, X = 201, pero se divide y resta -1, queda 66
    inicial = [] 
    final = [] # CREAMOS DOS LISTAS PARA ALMACENAR LAS OPERACIONES DE LAS POSICIONES DE LOS GENES
    n = 1
    while n <= 3:
        if n == 1:
            inicial.append(0) # Se agrega inmediatamente hasta la posicion inicial del gen 1 (se agrega 0)
            final.append(posgen) # para tambien agregar la posicion final del gen 1 (se agrega 66)
            posgen_i = posgen + 1 # Mas pronto de lo que canta un gallo, se le suma para 67
            posgen_f = posgen_i + posgen # Ahora tambien suma 67 + 66 = 133
            n += 1
            continue # Hace que se regrese al bucle para inicial con 67 y finalizar con 133 para el gen 2
        else: #Como el valor de n ya no es 1, ahora es 2, por lo que entra al else
            inicial.append(posgen_i) # Mete el valor 67 de haber regresado de nuevo del bucle
            final.append(posgen_f) # Mete el valor 133 final del gen 
            posgen_i = posgen_f + 1 # Ahora suma 133 del final del gen 1 mas 1
            posgen_f = posgen_i + posgen # Asi como se guardo 134 se suman de nuevo los 66 para tener 200
            n += 1
            continue # Vuelve a regresar para ejecutar el bucle para solo entrar al else y adicionar 134 y 200
        break

################################################################################################
    # Ahora solo como extra solo guardamos las secuencias de los genes para que sean visibles
    fragmentos = []
    n = 0
    while n <= 2:
        frg = seq[int(inicial[n]):int(final[n])] # Recortamos los valores de las secuencias que son promotor + gen
        fragmentos.append(frg) 
        n += 1
################################################################################################
    # Seleccion de tamaño de promotores 
    promotores = []
    for i in inicial:
        if x < 403: # De las listas, se procede a tomar los valores iniciales
            longprom = [6, 9, 12]
            tino = random.choice(longprom)
            promotor = i + tino # Con el valor incial se hace la suma de la longitud del promotor, igual para los 3 valores
            promotores.append(promotor) # Se agrega el final del promotor, de cada uno de los genes
        elif x > 404 and x < 604:
            longprom = [6, 9, 12, 15]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
        elif x > 605 and x < 1000:
            longprom = [6, 9, 12, 15, 18, 21]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
################################################################################################
    fragpromotor = []
    fragensinprom = []
    n = 0
    while n <= 2: # Ahora que ya se tienen las coordenadas de las secuencias, recortamos.
        frg_p = seq[int(inicial[n]):int(promotores[n])] # Asi definimos de la secuencia la longitud del promotor
        fragpromotor.append(frg_p)
        frg_g = seq[int(promotores[n]):int(final[n])] # Tomando en cuenta que al inicio del gen, se recorta en la posicion del final del promotor
        fragensinprom.append(frg_g)        
        n += 1

        
###########################################################################################################
# Ahora toca definir los nucleotidos que seran conservados tanto en el promotor como en el gen
# EN PROMOTOR
# Tomaremos esta condicional, por tamaño de promotor [6, 9, 12, 15, 18, 21]
# Les correspondera que los pares, mitad se conservara y los impares mas de la mitad se conserva: [3, 5, 6, 8, 9, 11]
    Conservados_Promotor = {}
    # Para ello delimitaremos el valor de las que se seleccionara de manera aleatoria los nucleotidos a conservar
    # Modificación de código, Fecha: 30/05/2023
    #Ya solo falta crear un diccionario para relacionar nombre con promotor
    poseqPromconservar = [] # Este sera para almacenar la posiciones que va a conservar
    longitudes_prom = [6, 9, 12, 15, 18, 21]
    No_conservados = [3, 5, 6, 8, 9, 11]
    for i, j in zip(genes, fragpromotor): # Donde guardamos el nombre de los genes, secuencia del promotor, Longitud promotor, No de conservados
        long = len(j) # Toma la secuencia y le calcula su longitud
        guarda = longitudes_prom.index(long) # Ahora comprobamos en que posicion se encuentra, para saber cuantos se van a conservar
        Conserva = No_conservados[guarda] # Define cuantos se van a conservar
        JuntarPgen = "".join(["P_",i]) # Aqui solo se le adhiere el P que indica el nombre del promotor
        postemp = [] # Este servira para almacenar las posiciones de cada uno de los nucleortidos del promotor
        for a, b in enumerate(j):
            postemp.append(a) #Aqui solo lo que hara es guardar las posiciones de cada uno de los nucleotidos
        select = random.sample(postemp,Conserva)
        Conservados_Promotor[JuntarPgen] = select
        
    
###########################################################################################################
# Ahora toca definir los nucleotidos que seran conservados tanto en el promotor como en el gen
# EN GEN
# Tomaremos esta condicional, por tamaño de promotor [6, 9, 12, 15, 18, 21]
# Les correspondera que los pares, mitad se conservara y los impares mas de la mitad se conserva: [3, 5, 6, 8, 9, 11]
    Conservados_Promotor = {}
    # Para ello delimitaremos el valor de las que se seleccionara de manera aleatoria los nucleotidos a conservar
    # Modificación de código, Fecha: 30/05/2023
    #Ya solo falta crear un diccionario para relacionar nombre con promotor
    poseqPromconservar = [] # Este sera para almacenar la posiciones que va a conservar
    longitudes_prom = [6, 9, 12, 15, 18, 21]
    No_conservados = [3, 5, 6, 8, 9, 11]
    for i, j in zip(genes, fragpromotor): # Donde guardamos el nombre de los genes, secuencia del promotor, Longitud promotor, No de conservados
        long = len(j) # Toma la secuencia y le calcula su longitud
        guarda = longitudes_prom.index(long) # Ahora comprobamos en que posicion se encuentra, para saber cuantos se van a conservar
        Conserva = No_conservados[guarda] # Define cuantos se van a conservar
        JuntarPgen = "".join(["P_",i]) # Aqui solo se le adhiere el P que indica el nombre del promotor
        postemp = [] # Este servira para almacenar las posiciones de cada uno de los nucleortidos del promotor
        for a, b in enumerate(j):
            postemp.append(a) #Aqui solo lo que hara es guardar las posiciones de cada uno de los nucleotidos
        select = random.sample(postemp,Conserva)
        Conservados_Promotor[JuntarPgen] = select
        
    
###########################################################################################################
    print("Aqui estan los nombres de los genes y tamaño de la secuencia",list(Datos.keys()))
    print("Aqui se muestra el nombre de los genes",genes)
    print("Aqui se muestran las tasas correspondintes",tasas)
    print("Aqui se muestra el inicio de gen + promotor",inicial)
    print("Aqui se muestra el fin de gen + promotor",final)
    print("Aqui se muestra el inicio de promotor",inicial)
    print("Aqui se muestra el fin de promotor", promotores)
    print("Aqui se muestra el inicio de solo el gen", promotores)
    print("Aqui se muestra el fin de solo el gen", final)
    print("Aqui se muestra el nombre de promotor y posiciones a consevar", Conservados_Promotor)
    
    # Procedemos a guardar el diccionario original, para poder modificar
    genoma = {
    'promotor+gen': genes,
    'Pos_ini':inicial,
    'Pos_fin':final,
    'Tasa gen': tasas,
    'Fragmentos genes': fragmentos,
    'ini_prom': inicial,
    'fin_prom': promotores,
    'Frag_promotor': fragpromotor,
    'ini_gen': promotores,
    'fin_gen': final,
    'gen': fragensinprom
    }
    
    df = pd.DataFrame(genoma)
    return Datos, seq, len(seq), df

Targetseq()
```
31/05/2023
Avanzamos esto
```python
###########################################################################################################
# Modificación de código, Fecha: 31/05/2023
# Ahora toca definir los nucleotidos que seran conservados tanto en el promotor como en el gen
# EN GEN
# Tomaremos esta condicional, por tamaño de promotor [6, 9, 12, 15, 18, 21]
# Les correspondera que los pares, mitad se conservara y los impares mas de la mitad se conserva: [3, 5, 6, 8, 9, 11]
    Conservados_Gen = {}
    # Para ello delimitaremos el valor de las que se seleccionara de manera aleatoria los nucleotidos a conservar
    
    #Ya solo falta crear un diccionario para relacionar nombre con promotor
    poseqGENconservar = [] # Este sera para almacenar la posiciones que va a conservar
    
    ####################
    rango = range(2, 24) #queda pendiente definir a que rango
    #####################
    
    for k, i in zip(genes, fragensinprom): # Donde guardamos la secuencia del gen, secuencia del promotor
        genpos = []
        for a, b in enumerate(i):
            genpos.append(a)
        #random = random.choice(rango)
        lon = len(i)
        if lon < 235: # Se calculo max(x) = 1000 y min(x) = 403 numero intermedio es round((1000 - 403)/2) + 403 = 702
            # Ya que solo queremos dividir entre 2 la cantidad de nucleotidos a guardar, tomamos 702/3 = 234 es el tamaño del gen
            # Pusimos 235 para que quepa en el minimo el valor de 234
            rand = random.choice(range(2, 11)) # Solo hara que conserve una cantida de nucleotido de 2 a 11
        else:
            rand = random.choice(range(11, 24)) # Solo hara que conserve una cantida de nucleotido de 11 a 24    
        select = random.sample(genpos,rand)
        Conservados_Gen[k] = select
#############################################
```
Corregimos y agregamos esta parte del codigo
```python
    ################################################################################################3
    #Tambien se quieren saber las posiciones 31/05/2023
    listseq=[]
    seqposicion=[]
    for i, j in enumerate(seq):
        listseq.append(j)
        seqposicion.append(i)
    ################################################################################################3
    #31/05/2023 CORRECCION
    # Ahora que ya tenemos la secuencia de referencia formada, empezaremos a definir de manera aleatoria los tamaños de las secuencias
    # Para ello lo que añadiremos es de acuerdo al tamaño, utilizaremos de 3 en tres, el proceso de seleccion de los genes
    ## HAY QUE CONSIDERAR QUE TODOS LOS GENES + SUS PROMOTORES TENDRAN EL MISMO TAMAÑO, LO QUE CAMBIA ES LA TASA Y EL GEN
    
    # Definimos la longitus de los genes
    posgen = (x/3) #Eliminamos - 1 y con la referencia 201, al dividirlo en 3 queda 67
    inicial = [] 
    final = [] # CREAMOS DOS LISTAS PARA ALMACENAR LAS OPERACIONES DE LAS POSICIONES DE LOS GENES
    n = 1
    while n <= 3:
        if n == 1:
            inicial.append(0) # Se agrega inmediatamente hasta la posicion inicial del gen 1 (se agrega 0)
            final.append(posgen) # para tambien agregar la posicion final del gen 1 (se agrega 67) para que delimite del nucleotido del 0 a 66
            posgen_i = posgen # Se conserva la posicion final en la inical del siguiente gen
            posgen_f = posgen_i + posgen # Ahora tambien suma 67 + 67 = 134
            n += 1
            continue # Hace que se regrese al bucle para inicial con 67 (considera la pos 67) para finalizar con 134 para el gen 2
        else: #Como el valor de n ya no es 1, ahora es 2, por lo que entra al else
            inicial.append(posgen_i) # Mete el valor 67 de haber regresado de nuevo del bucle
            final.append(posgen_f) # Mete el valor 134 final del gen (por lo que el gen considera de 67 a 133 en posicion
            posgen_i = posgen_f # Ahora guarda 134 en posicion inicial del gen 3
            posgen_f = posgen_i + posgen # Asi como se guardo 134 se suman de nuevo los 67 para tener 201
            n += 1
            continue # Vuelve a regresar para ejecutar el bucle para solo entrar al else y adicionar 134 y 201 (que al parecer el software corrige y considera de 134 a 200).
        break

################################################################################################
```
Arreglo final para la secuencia objetivo
- Solo falta definir los puntos de donde van a influir independientemente las tasas
- Y crear las secuenencias de manera aleatoria
- Realizar la funcion fitness
- Con ello tambien hacer que el programa hagas las cruzas
- Mutaciones y encuentre la forma de guardar los metadatos de frecuencia, fijacion, mutacion.

Resultados que comprueban que los metadatos de la secuencia objetivo se corroboran correctamente para su posterior uso en la poblacion
[data_prueba]()
```python
### Modificación de código, Fecha: 31/05/2023
import random
import pandas as pd



def Targetseq():
    print("En este programa solo se va a colocar como muestra 3 genes, pero en un futuro se pensara para una cantidad necesaria de genes en lo que se pueda automatizar con bases de datos")
    Datos = {}
    genes = []
    tasas = []
    while True:
        x = input("Coloque el tamaño de su secuencia")
        if x.isdigit():
            print("Es un numero entero", x)
            x = int(x)
            break
        elif x.replace(".", "").isnumeric(): 
            print("es decimal ",x,"por favor coloque un numero entero >201")
            continue
        elif x == "*":
            print("Has salido del programa")
            return        
        else:
            print("Si quieres salir, solo escribe (*) y si quieres continuar, debe poner un numero entero entre 201 a mas")
            print("Debe poner un numero entero entre 201 a mas")
            continue
    while True:                  
        if x < 201:
            x = 201
            print(x)
            Datos["Tamaño de la secuencia"] = x
            break
        else:
            y = x/3 == int(x/3)
            if y == True:
                print(x)
                break
            else:
                debajo = x - 1
                arriba = x + 1
                while True:
                    logicaMenor = debajo/3 == int(debajo/3)
                    logicaMayor = arriba/3 == int(arriba/3)
                    if logicaMenor == True:
                        x = debajo
                        Datos["Tamaño de la secuencia"] = x
                        break
                    if logicaMayor == True:
                        x = arriba
                        Datos["Tamaño de la secuencia"] = x
                        break
                    else:
                        debajo = x - 1
                        arriba = x + 1
                break
    n = 1
    while n >= 1 and n <=3:
        while True:
            gen = str(input("Coloque el nombre del gen: "))
            if (gen in Datos.keys()):
                print(f"El gen {gen} ya existe, por favor asegura que estas en lo correcto")
                continue 
            elif gen == "":
                print("Si quieres salir, solo escribe solo asterisco (*) y si quieres continuar, escribe el nombre del gen")
                continue
            elif gen == "*":
                print("Has salido del programa")
                return        
            else:
                print("A partir de aqui es que se agrega los valores y se procede a evaluar con las demas condicionales")
                genes.append(gen)
                break  

        print(gen)
        while True:
            print("Coloque la tasa de mutacion del gen ", gen)
            tasagen = input()         
            if tasagen.isdigit():
                print("Es un numero entero", x)
                tasagen = float(tasagen)
                if tasagen == 1 or tasagen == 0:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
                elif tasagen < 0.0 or tasagen > 1.0:
                    print("Una tasa pertence entre 0 y 1")
                    continue
                else:
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
            elif '/' in tasagen:
                numerador, denominador = tasagen.split('/')
                valor = float(numerador) / float(denominador)
                print(valor)
                log = valor >= 0 and valor <= 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", valor)
                    Datos[gen] = valor
                    tasas.append(valor)
                    n += 1
                    break
            elif tasagen.replace(".", "").isnumeric():
                print("es decimal ", tasagen)
                tasagen = float(tasagen)
                log = tasagen > 0 and tasagen < 1
                if log == False:
                    print("intentalo de nuevo, debe ser un numero real que pertencezca a [0,1]")
                    continue
                else:
                    print("Excelente, si es una tasa viable", tasagen)
                    Datos[gen] = tasagen
                    tasas.append(tasagen)
                    n += 1
                    break
            elif tasagen=="":
                print("Por favor coloque una tasa entre 0 y 1 o escribe '*' para salir")
                continue
            elif tasagen=="*":
                print("este es para salir") # SALITE
                return
            else:
                print(x)
                continue
        continue
    
    # Ahora se pretende que el programa te de la secuencia y te de el tamaño de los genes
    seq = ""
    NucleoATGC = "ATGC"
    l = x - 1
    n = 0
    while n <= l:
        alea = random.randint(0,3)
        N = NucleoATGC[alea]
        seq += str(N)
        n += 1
        
    ################################################################################################3
    #Tambien se quieren saber las posiciones 31/05/2023
    listseq=[]
    seqposicion=[]
    for i, j in enumerate(seq):
        listseq.append(j)
        seqposicion.append(i)
    ################################################################################################3
    #31/05/2023 CORRECCION
    # Ahora que ya tenemos la secuencia de referencia formada, empezaremos a definir de manera aleatoria los tamaños de las secuencias
    # Para ello lo que añadiremos es de acuerdo al tamaño, utilizaremos de 3 en tres, el proceso de seleccion de los genes
    ## HAY QUE CONSIDERAR QUE TODOS LOS GENES + SUS PROMOTORES TENDRAN EL MISMO TAMAÑO, LO QUE CAMBIA ES LA TASA Y EL GEN
    
    # Definimos la longitus de los genes
    posgen = (x/3) #Eliminamos - 1 y con la referencia 201, al dividirlo en 3 queda 67
    inicial = [] 
    final = [] # CREAMOS DOS LISTAS PARA ALMACENAR LAS OPERACIONES DE LAS POSICIONES DE LOS GENES
    n = 1
    while n <= 3:
        if n == 1:
            inicial.append(0) # Se agrega inmediatamente hasta la posicion inicial del gen 1 (se agrega 0)
            final.append(posgen) # para tambien agregar la posicion final del gen 1 (se agrega 67) para que delimite del nucleotido del 0 a 66
            posgen_i = posgen # Se conserva la posicion final en la inical del siguiente gen
            posgen_f = posgen_i + posgen # Ahora tambien suma 67 + 67 = 134
            n += 1
            continue # Hace que se regrese al bucle para inicial con 67 (considera la pos 67) para finalizar con 134 para el gen 2
        else: #Como el valor de n ya no es 1, ahora es 2, por lo que entra al else
            inicial.append(posgen_i) # Mete el valor 67 de haber regresado de nuevo del bucle
            final.append(posgen_f) # Mete el valor 134 final del gen (por lo que el gen considera de 67 a 133 en posicion
            posgen_i = posgen_f # Ahora guarda 134 en posicion inicial del gen 3
            posgen_f = posgen_i + posgen # Asi como se guardo 134 se suman de nuevo los 67 para tener 201
            n += 1
            continue # Vuelve a regresar para ejecutar el bucle para solo entrar al else y adicionar 134 y 201 (que al parecer el software corrige y considera de 134 a 200).
        break

################################################################################################
    # Ahora solo como extra solo guardamos las secuencias de los genes para que sean visibles
    fragmentos = []
    n = 0
    while n <= 2:
        frg = seq[int(inicial[n]):int(final[n])] # Recortamos los valores de las secuencias que son promotor + gen
        fragmentos.append(frg) 
        n += 1
################################################################################################
    # Seleccion de tamaño de promotores 
    promotores = []
    for i in inicial:
        if x < 403: # De las listas, se procede a tomar los valores iniciales
            longprom = [6, 9, 12]
            tino = random.choice(longprom)
            promotor = i + tino # Con el valor incial se hace la suma de la longitud del promotor, igual para los 3 valores
            promotores.append(promotor) # Se agrega el final del promotor, de cada uno de los genes
        elif x > 404 and x < 604:
            longprom = [6, 9, 12, 15]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
        elif x > 605 and x < 1000:
            longprom = [6, 9, 12, 15, 18, 21]
            tino = random.choice(longprom)
            promotor = i + tino
            promotores.append(promotor)
################################################################################################
    fragpromotor = []
    fragensinprom = []
    n = 0
    while n <= 2: # Ahora que ya se tienen las coordenadas de las secuencias, recortamos.
        frg_p = seq[int(inicial[n]):int(promotores[n])] # Asi definimos de la secuencia la longitud del promotor
        fragpromotor.append(frg_p)
        frg_g = seq[int(promotores[n]):int(final[n])] # Tomando en cuenta que al inicio del gen, se recorta en la posicion del final del promotor
        fragensinprom.append(frg_g)        
        n += 1

        
###########################################################################################################
# Ahora toca definir los nucleotidos que seran conservados tanto en el promotor como en el gen
# EN PROMOTOR
# Tomaremos esta condicional, por tamaño de promotor [6, 9, 12, 15, 18, 21]
# Les correspondera que los pares, mitad se conservara y los impares mas de la mitad se conserva: [3, 5, 6, 8, 9, 11]
    Conservados_Promotor = {}
    # Para ello delimitaremos el valor de las que se seleccionara de manera aleatoria los nucleotidos a conservar
    # Modificación de código, Fecha: 30/05/2023
    #Ya solo falta crear un diccionario para relacionar nombre con promotor
    poseqPromconservar = [] # Este sera para almacenar la posiciones que va a conservar
    longitudes_prom = [6, 9, 12, 15, 18, 21]
    No_conservados = [3, 5, 6, 8, 9, 11]
    for i, j in zip(genes, fragpromotor): # Donde guardamos el nombre de los genes, secuencia del promotor, Longitud promotor, No de conservados
        long = len(j) # Toma la secuencia y le calcula su longitud
        guarda = longitudes_prom.index(long) # Ahora comprobamos en que posicion se encuentra, para saber cuantos se van a conservar
        Conserva = No_conservados[guarda] # Define cuantos se van a conservar
        JuntarPgen = "".join(["P_",i]) # Aqui solo se le adhiere el P que indica el nombre del promotor
        postemp = [] # Este servira para almacenar las posiciones de cada uno de los nucleortidos del promotor
        for a, b in enumerate(j):
            postemp.append(a) #Aqui solo lo que hara es guardar las posiciones de cada uno de los nucleotidos
        select = random.sample(postemp,Conserva)
        Conservados_Promotor[JuntarPgen] = select
        
    
###########################################################################################################
# Modificación de código, Fecha: 31/05/2023
# Ahora toca definir los nucleotidos que seran conservados tanto en el promotor como en el gen
# EN GEN
# Tomaremos esta condicional, por tamaño de promotor [6, 9, 12, 15, 18, 21]
# Les correspondera que los pares, mitad se conservara y los impares mas de la mitad se conserva: [3, 5, 6, 8, 9, 11]
    Conservados_Gen = {}
    # Para ello delimitaremos el valor de las que se seleccionara de manera aleatoria los nucleotidos a conservar
    
    #Ya solo falta crear un diccionario para relacionar nombre con promotor
    poseqGENconservar = [] # Este sera para almacenar la posiciones que va a conservar
    
    ####################
    rango = range(2, 24) #queda pendiente definir a que rango
    #####################
    
    for k, i in zip(genes, fragensinprom): # Donde guardamos la secuencia del gen, secuencia del promotor
        genpos = []
        for a, b in enumerate(i):
            genpos.append(a)
        #random = random.choice(rango)
        lon = len(i)
        if lon < 235: # Se calculo max(x) = 1000 y min(x) = 403 numero intermedio es round((1000 - 403)/2) + 403 = 702
            # Ya que solo queremos dividir entre 2 la cantidad de nucleotidos a guardar, tomamos 702/3 = 234 es el tamaño del gen
            # Pusimos 235 para que quepa en el minimo el valor de 234
            rand = random.choice(range(2, 11)) # Solo hara que conserve una cantida de nucleotido de 2 a 11
        else:
            rand = random.choice(range(11, 24)) # Solo hara que conserve una cantida de nucleotido de 11 a 24    
        select = random.sample(genpos,rand)
        Conservados_Gen[k] = select
               
        
########################################################################################
    # Enumeramos la secuencia original, ademas consideramos los limites que ya definimos
    conservacion_final = []
    cons_sinmodi=[]
    Nuconservados=[]
    
    lista = [Conservados_Promotor, Conservados_Gen]
    lista2p = [inicial, promotores]
    lista3 = [fragpromotor, fragensinprom]
    n = 0
    r = 1
    while n < 6:
        elemento = lista[n % len(lista)] #0 y par es Conservados_Promotor, impares son Conservados_Gen
        orden = list(elemento.values()) # Diccionario llama los valores (listas)
        elemento2p = lista2p[n % len(lista)]
        elemento3 = lista3[n % len(lista)]
        if n == 0:
            
            #print("1",orden[0]) #Le habla a la primera lista
            conservacion_final.extend(sorted(orden[n])) 
            cons_sinmodi.extend(sorted(orden[n])) 
            #print("2",conservacion_final) # Misma que orden 0 pero adicionada
            #print("3",cons_sinmodi) # Misma que orden 0 pero adicionada, por eso son 3 veces.
            for i in sorted(orden[n]):
                li = elemento3[n]
                Nuconservados.append(li[i])
            n += 1
            
        else:
            if elemento == Conservados_Gen:
                #print("4",elemento)
                numeracion = []
                k = n - r
                #print("5",orden[k]) # n = 1 entonces k = 0, primera lista en Conservado_gen
                #print("6",elemento3[k]) # Secuencia
                #print("7",elemento2p[k]) #si elemento2p(Valor final del promotor, pero incial del gen)[k]
                for i, j in enumerate(elemento3[k]):
                    o = i in sorted(orden[k])
                    m = elemento2p[k] + i
                    if o == True:
                        print(i,j)
                        numeracion.append(int(m))
                        Nuconservados.append(j)
                        #print("8",numeracion,i,o,m) 
                #print("numeracion", numeracion)
                #print("orden",sorted(orden[k]))
                conservacion_final.extend(numeracion)
                cons_sinmodi.extend(sorted(orden[k]))
                n += 1
            elif elemento == Conservados_Promotor:
                #print("9",elemento)
                numeracion = []
                k = n - r
                #print("10",orden[k]) # n = 1 entonces k = 0, primera lista en Conservado_gen
                #print("11",elemento3[k]) # Secuencia
                #print("12",elemento2p[k]) #si elemento2p(Valor final del promotor, pero incial del gen)[k]
                for i, j in enumerate(elemento3[k]):
                    o = i in sorted(orden[k])
                    m = elemento2p[k] + i
                    if o == True:
                        print(i,j)
                        numeracion.append(int(m))
                        Nuconservados.append(j)
                        #print("13",numeracion,i,o,m) 
                #print("numeracion", numeracion)
                #print("orden",sorted(orden[k]))
                conservacion_final.extend(numeracion)
                cons_sinmodi.extend(sorted(orden[k]))
                n += 1
                r += 1 # Faltaba contemplar que debia ir sumando, porque 
                # Promotor 1: n = 0 agrega los valores iniciales
                # Gen1: n = 1 y r = 1, entra k = n - r = 0, agarra el primer gen.
                # Promotor 2: n = 2, r = 1 y k = 1. Luego de ser evaluado, suma 1 a r
                # Gen2: n = 3, r = 2 y k =1, agarra el segundo gen.
                # Promotor 3: n = 4, r = 2 y k = 2. Luego de ser evaluado, suma 1 a r
                # Gen3: n = 5, r = 3 y k = 2, agarra el tercer gen.
    Recopilados=[]        
    for i in conservacion_final:
        sq = seq[i]
        Recopilados.append(sq)           
###########################################################################################################

#    print("Aqui estan los nombres de los genes y tamaño de la secuencia",list(Datos.keys()))
#    print("Aqui se muestra el nombre de los genes",genes)
#    print("Aqui se muestran las tasas correspondintes",tasas)
#    print("Aqui se muestra el inicio de gen + promotor",inicial)
#    print("Aqui se muestra el fin de gen + promotor",final)
#    print("Aqui se muestra el inicio de promotor",inicial)
#    print("Aqui se muestra el fin de promotor", promotores)
#    print("Aqui se muestra el inicio de solo el gen", promotores)
#    print("Aqui se muestra el fin de solo el gen", final)
#    print("Aqui se muestra el nombre de promotor y posiciones a consevar", Conservados_Promotor)
#    print("Aqui se muestra el nombre de gen y posiciones a consevar", Conservados_Gen)
#    print("secuencia objetivo", seq)
#    print("posiciones por nucleotido",seqposicion)
#    print("Aqui se muestra posicion original a conservar",conservacion_final)
#    print("Aqui se muestra posicion acorde al fragmento",cons_sinmodi)
#    print("Conservados provenientes de los fragmentos",Nuconservados)
#    print("Recopilados desde la secuencia original",Recopilados)
    
    with open("./OBJe.txt", 'w') as archivo:
        archivo.write("Aqui estan los nombres de los genes y tamaño de la secuencia" + "\n" + str(list(Datos.keys())) + "\n" + "\n" +
    "Aqui se muestra el nombre de los genes" + "\n" + str(genes) + "\n" + "\n" +
    "Aqui se muestran las tasas correspondintes" + "\n" + str(tasas) + "\n" + "\n" +
    "Aqui se muestra el inicio de gen + promotor" + "\n" + str(inicial) + "\n" + "\n" +
    "Aqui se muestra el fin de gen + promotor" + "\n" + str(final) + "\n" + "\n" +
    "Aqui se muestra el inicio de promotor" + "\n" + str(inicial) + "\n" + "\n" +
    "Aqui se muestra el fin de promotor" + "\n" + str(promotores) + "\n" + "\n" +
    "Aqui se muestra el inicio de solo el gen" + "\n" + str(promotores) + "\n" + "\n" +
    "Aqui se muestra el fin de solo el gen" + "\n" + str(final) + "\n" + "\n" +
    "Aqui se muestra el nombre de promotor y posiciones a consevar" + "\n" + str(Conservados_Promotor) + "\n" + "\n" +
    "Aqui se muestra el nombre de gen y posiciones a consevar" + "\n" + str(Conservados_Gen) + "\n" + "\n" +
    "secuencia objetivo" + "\n" + str(seq) + "\n" + "\n" +
    "posiciones por nucleotido" + "\n" + str(seqposicion) + "\n" + "\n" +
    "Aqui se muestra posicion original a conservar" + "\n" + str(conservacion_final) + "\n" + "\n" +
    "Aqui se muestra posicion acorde al fragmento" + "\n" + str(cons_sinmodi) + "\n" + "\n" +
    "Conservados provenientes de los fragmentos" + "\n" + str(Nuconservados) + "\n" + "\n" +
    "Recopilados desde la secuencia original" + "\n" + str(Recopilados)+ "\n" + "\n" +
    "Longitud de los conservados, proveniente de (conservacion_final)" +  "\n" + str(len(conservacion_final))+ "\n" + "\n" +
    "Longitud de los conservados, proveniente de (conservacion_final)"+ "\n" + str(len(Nuconservados)))
    # Procedemos a guardar el diccionario original, para poder modificar
    genoma = {
    'promotor+gen': genes,
    'Pos_ini':inicial,
    'Pos_fin':final,
    'Tasa gen': tasas,
    'Fragmentos genes': fragmentos,
    'ini_prom': inicial,
    'fin_prom': promotores,
    'Frag_promotor': fragpromotor,
    'ini_gen': promotores,
    'fin_gen': final,
    'gen': fragensinprom
    }
    
    df = pd.DataFrame(genoma)
    #df.to_excel("./objetivo.xlsx", index=False)
    df.to_csv("./objetivo.txt", sep='\t', index=False)
    return Datos, seq, len(seq), df
Targetseq()
```

```python
```

```python
```

```python
```

```python
```

```python
```

```python
```
```python
```
```python
```
```python
```
```python
```
```python
```
```python
```

# Referencias
## Greenwell, R. N., Angus, J. E., & Finck, M. (1995). Optimal mutation probability for genetic algorithms. Mathematical and Computer Modelling, 21(8), 1-11. {#ref1}
