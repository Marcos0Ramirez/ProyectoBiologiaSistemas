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
13/05/2023
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
Ahora toca continuar con generarlo en un solo while 
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
Ahora que junte todos los valores que se requieren, al terminar la funcion con return termina, y con yield, solo se puede si es iterable. 
Por tanto se buscara que sea por el otro lado, que continue dentro del ultimo else
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
~~~
Ya que ahora podemos terminar una funcion y llamar a otra ahora solo queda condicionar mas, para el tamaño de la secuencia, asi como de otros factores
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
~~~
# Codigo original, no terminado pero avanzado
~~~
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
~~~
14/05/2023
Hice una modificacion para tener salida
~~~
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
~~~
Avance final de la logica, aunque falta corregir aun, sobre todo la parte de abajo
~~~
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
~~~

#####################################################################################################################################

# 21/05/2023
Parte 1 finalizada del codigo
~~~
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
~~~
Ahora con este codigo nos va a ayudar mucho a la parte de diferenciar si es un digito, decimal o cadena, para aplicarla en el codigo
~~~
x = input("pon algo ")
if x.isdigit():
    print("Es un numero entero", x)
elif x.replace(".", "").isnumeric(): 
    print("es decimal ",x)
else:
    print(x)
~~~

Hasta este punto se busco la manera de que el programa siguiera funcionando una vez que se terminara de evaluar.
~~~
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
~~~
Solo falta aplicarlo en las demas partes del codigo

~~~
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
~~~



# Referencias
## Greenwell, R. N., Angus, J. E., & Finck, M. (1995). Optimal mutation probability for genetic algorithms. Mathematical and Computer Modelling, 21(8), 1-11. {#ref1}
