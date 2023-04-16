## Dado la cantidad de numeros que de entre 

Nodes <- function(n,p){
  library(ggplot2)
  if (n>2) {
  Red_aleatoria <- data.frame() #Te da un Dataframe
  for (a in 1:n) { #Dentro de este bucle hace el llamado a la fila i
    for (b in 1:n) { #Dentro de este bucle hace el llamado de la columna j
  aleatorio <- runif(n, min = 0, max = 1) #Lanza un numero aleatorio
  for (i in aleatorio) {
  if (i <= p) { #Condiciona a que si dentro del la probabilidad, hace que si te asigne un numero 1 o -1
    regulacion <- runif(n, min = 0, max = 1) #Lanza un numero aleatorio
    for (j in regulacion) {
    if (j <= p) { #Ahora es para ver si te lanza un numero 1 o -1
      Red_aleatoria[a,b] <- 1
    } else {
      Red_aleatoria[a,b] <- -1
    }
  }
  } else {
    Red_aleatoria[a,b] <- 0 #Como cayo arriba de la probabilidad p, entonces te lanza un 0
  }
    }
    }
  }
  # Se procede a calcular P(k) para saber el numero de uniones que tiene cada nodo o conocido como el numero de vecinos
  #Por lo que para ello el contar de la fila es cuando la flecha se dirige del numero i al j
  names(Red_aleatoria) <- 1:n #Cada una de las columnas son renombradas
  print(Red_aleatoria)
  vecinos_alpha <- c()
  k <- c()
  for (i in 1:n) {
    for (j in 1:n) {
      fila = Red_aleatoria[i,j]
      columna = Red_aleatoria[j,i]
      flechas = ((fila != 0) || (columna != 0))
      #print(flechas)
      if (flechas != FALSE) {
        vecinos_alpha <- c(vecinos_alpha, flechas)
      }
    }
    k <- c(k, length(vecinos_alpha))
    vecinos_alpha <- NULL
    }
  #print(k)
  contar_unos <- c()
  t = 1
  while (t <= n) {
    for (recorrer in t:n) {
      fila = Red_aleatoria[t,recorrer]
      columna = Red_aleatoria[recorrer,t]
      total_k =(fila != 0) || (columna != 0)
      if (total_k == TRUE) {
        contar_unos <- c(contar_unos, total_k)
      }
    }
    t = t + 1
  }
  #print(contar_unos)
  dataPk <- c()
  TOTAL <- length(contar_unos)
  for (q in k) {
    dataPk <- c(dataPk,q/TOTAL)
  }
  #print(dataPk)
  ks <- data.frame(k = k, Pk = dataPk)
  print(ks)
  GRAPH_Pk <- ggplot(data = ks, aes(x = 1:n,y = dataPk)) +
    geom_point()+
    labs(title = "Distribucion de P(x)", x = "nodos",y = "P(k)")
  
  show(GRAPH_Pk)
  # Condicional n
  Triangulos_vector <- c()
  Cant_Triangulos <- c()
  for (N1 in 1:n) {
    for (N2 in 1:n) {
      triavance = 1
      for (N3 in 1:n) {
        if (N1 != N2) {
          if (N2 != N3) {
            if (N1 != N3) { # Lo que va a seguir con las condicionales es que va a contar todas aquellas interacciones en las que se incluyen i
            if ((Red_aleatoria[N1,N2] == 1 & Red_aleatoria[N1,N3] == 1 & Red_aleatoria[N2,N3] == 1)|
              (Red_aleatoria[N1,N2] == 1 & Red_aleatoria[N1,N3] == 1 & Red_aleatoria[N3,N2] == 1)|
              (Red_aleatoria[N1,N2] == 1 & Red_aleatoria[N3,N1] == 1 & Red_aleatoria[N2,N3] == 1)|
              (Red_aleatoria[N1,N2] == 1 & Red_aleatoria[N3,N1] == 1 & Red_aleatoria[N3,N2] == 1)|
              (Red_aleatoria[N2,N1] == 1 & Red_aleatoria[N1,N3] == 1 & Red_aleatoria[N2,N3] == 1)|
              (Red_aleatoria[N2,N1] == 1 & Red_aleatoria[N1,N3] == 1 & Red_aleatoria[N3,N2] == 1)|
              (Red_aleatoria[N2,N1] == 1 & Red_aleatoria[N3,N1] == 1 & Red_aleatoria[N2,N3] == 1)|
              (Red_aleatoria[N2,N1] == 1 & Red_aleatoria[N3,N1] == 1 & Red_aleatoria[N3,N2] == 1)) {
              Triangulos_vector <- c(Triangulos_vector, TRUE)
          }}}
        }
      }
    }
    Cant_Triangulos <- c(Cant_Triangulos,length(Triangulos_vector))
    Triangulos_vector <- NULL
  }
ks$Triangulos <- Cant_Triangulos
print(ks)
Cluster_nodo <- c()
i = 1
while (i <= n) {
  Cluster = (2*ks[i,3])/(ks[i,1]*(ks[i,1] - 1))
  Cluster_nodo <- c(Cluster_nodo, Cluster)
  i = i + 1
}
ks$Clustering_k <- Cluster_nodo
print(ks)

GRAPH_Clustering <- ggplot(data = ks, aes(x = 1:n,y = Cluster_nodo)) +
  geom_point()+
  labs(title = "Distribucion de Clustering", x = "nodos",y = "Clustering")

show(GRAPH_Clustering)
  }else{
    print("Manito, solo se puede numeros enteros arriba de 2")
  }
}