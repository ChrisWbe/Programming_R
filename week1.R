#Semana 1 getting started and R Nuts and Bolts

myFunction = function(){
  x = rnorm(100)
  mean(x)
}

secondFunction = function(x){
  x + rnorm(length(x))
}


x = 1:20 #Operador : se usa para crear una secuencia
x = c(0.5,0.6) #numeric
x = c(T,F) #logical
x = c("a","b","c") #character
x = 9:29 #integer
x = c(1+0i,2+4i) #complex

x = vector("numeric",length = 10)
x
class(x)
as.logical(x)
as.character(x)
as.numeric(x)

#Listas
x = list(1,"a",T,1+4i)
x[[2]]

#Matrices
m = matrix(1:6,nrow = 2, ncol = 3) # las matrices se construyen por columnas
m
dim(m)
attributes(m)

#pueden crearse de la siguiente forma 
m = 1:10
m
dim(m) = c(2,5)
m

#concatenando filas y columnas
x = 1:3
y = 10:12
rbind(x,y)

#Un factor es un tipo especial de vector
x = factor(c("yes","yes","no","yes","no"))
x
table(x)
unclass(x)
attr(x,"levels")

x = factor(c("yes","yes","no","yes","no"), levels = c("yes","no"))
x

#NAN -> operaciones matematicas indefinidas, NA -> cualquier otro caso
x = c(1,2,NA,NaN,4)
is.na(x)
is.nan(x)

#DataFrame utilizado para almacenar datos tabulados, tipo especial de lista en el cual cada elemento de la lista tiene la misma longitud
x = data.frame(foo=1:4, bar=c(T,T,F,F))
class(x)
x
nrow(x)
ncol(x)

#no solo a los data frames se les puede asignar nombres a los objetos o columnas
x=1:3
names(x)
names(x) = c("foo","bar","norf")
x
names(x)

x = list(a=1,b=2,c=3)
x
x$a

m = matrix(1:4, nrow=2, ncol=2)
dimnames(m) = list(c("a","b"),c("d","e"))
m

#dput muestra los metadatos asociados a un objeto, crea codigo en R que puede reconstruir un objeto en R
y = data.frame(a=1, b="a")
dput(y)
y
dput(y, file="Programming_R/y.R") #Almaceno los metadatos del objeto
new.y = dget("Programming_R/y.R") #Extraigo los metadatos y recostruyo el objeto nuevamente
new.y


#dump realiza lo mismo que dput pero con mas objetos a la vez
x = "foo"

dump(c("x","y"), file="Programming_R/data.R")
rm(x,y)
source("Programming_R/data.R")
y
x


#Existen funciones para abir conexiones con el "mundo exterior"
con = file("Programming_R/data.R", "r")
x = readLines(con, 1)
x
close(con)

con = url("https://www.jhsph.edu/", "r")
x = readLines(con, 10)
head(x)

#subsetting (subconfiguracion)
x = c("a","b","c","d","a")
x[1]

u = x>"a"
u
x[u]

#subsetting-list
x = list(foo=1:4, bar=0.6, baz="Hello")
x[1]
x$foo
x[[1]]

x[c(1,3)]

#subsetting-matrices
x = matrix(1:6,2,3)
x
x[1,2]
x[1,]
x[,1, drop=F] #Permite obtener el valor en el formato original del que viene, osea una matriz

#subsetting-partial matching (coincidencia parcial)
x = list(aardvark=1:5)
x$a
x[["a"]]
x[["a", exact=F]]

#subsetting-removing missing values
x = c(1,2,NA,4,NA,5)
bad = is.na(x)
x[!bad] # se eliminan los datos faltantes

y = c("a","b",NA,"d",NA,"f")
good = complete.cases(x,y)
good
x[good]
y[good]


#Vectorized operations
x = 1:4
y = 6:9
x>2
x>=2
y==8
x*y
x/y

x=matrix(1:4,2,2); y=matrix(rep(10,4),2,2)

x*y #Multiplica elemento a elemento
x/y
x%*%y #Multiplicacion matricial

#Solucion Quiz1
"
x = 4L
> class(x)
[1] "integer"
> x = (4,"a",T)
Error: inesperado ',' in "x = (4,"
> x = c(4,"a",T)
> class(x)
[1] "character"
> x <- c(1,3, 5) 
> y <- c(3, 2, 10)
> cbind(x,y)
x  y
[1,] 1  3
[2,] 3  2
[3,] 5 10
> class(cbind(x,y))
[1] "matrix" "array" 
> x <- list(2, "a", "b", V)
Error: objeto 'V' no encontrado
> x <- list(2, "a", "b", T)
> class(x[[1]])
[1] "numeric"
> x[[1]]
[1] 2
> x[1
    + ]
[[1]]
[1] 2

> x <- 1: 4;<- 2: 3
Error: unexpected assignment in "<-"
> x <- 1: 4;y<- 2: 3
> x+y
[1] 3 5 5 7
> class(x+y)
[1] "integer"
> x <- c (17, 14, 4, 5, 13, 12, 10) 
> x[x>10]==4
[1] FALSE FALSE FALSE FALSE
> x
[1] 17 14  4  5 13 12 10
> x[x==4]>10
[1] FALSE
> x[x==4]
[1] 4
> x[x>10]
[1] 17 14 13 12
> x[x>10]==4
[1] FALSE FALSE FALSE FALSE
> x[x>=11]<-4
> datos = read.csv("Programming_R/hw1_data.csv")
> View(datos)
> head(datos,2)
Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
> length(x)
[1] 7
> nrow(x)
NULL
> class(datos)
[1] "data.frame"
> nrow(datos)
[1] 153
> tail(datos,2)
Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30
> datos[47,"Ozone"]
[1] 21
> is.na(datos[,"Ozone"])
[1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[18] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
[35]  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
[52]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[69] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
[86] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[103]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
[120] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[137] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
> x = is.na(datos[,"Ozone"])
> length(x[x==T])
[1] 37
> ozone = datos[x,][,"Ozone"]
> head(ozone)
[1] NA NA NA NA NA NA
> ozone = datos[!x,][,"Ozone"]
> head(ozone)
[1] 41 36 12 18 28 23
> mean(ozone)
[1] 42.12931
> View(datos)
> ozone.31 = datos("Ozone">31)
Error in datos("Ozone" > 31) : no se pudo encontrar la función "datos"
> ozone.31 = datos[,"Ozone">31]
> View(ozone.31)
> datos[,"Ozone"]
[1]  41  36  12  18  NA  28  23  19   8  NA   7  16  11  14  18  14  34   6  30  11   1  11   4  32  NA
[26]  NA  NA  23  45 115  37  NA  NA  NA  NA  NA  NA  29  NA  71  39  NA  NA  23  NA  NA  21  37  20  12
[51]  13  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA 135  49  32  NA  64  40  77  97  97  85  NA  10  27  NA
[76]   7  48  35  61  79  63  16  NA  NA  80 108  20  52  82  50  64  59  39   9  16  78  35  66 122  89
[101] 110  NA  NA  44  28  65  NA  22  59  23  31  44  21   9  NA  45 168  73  NA  76 118  84  85  96  78
[126]  73  91  47  32  20  23  21  24  44  21  28   9  13  46  18  13  24  16  13  23  36   7  14  30  NA
[151]  14  18  20
> datos[,"Ozone"]>31
[1]  TRUE  TRUE FALSE FALSE    NA FALSE FALSE FALSE FALSE    NA FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[18] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE    NA    NA    NA FALSE  TRUE  TRUE  TRUE    NA    NA    NA
[35]    NA    NA    NA FALSE    NA  TRUE  TRUE    NA    NA FALSE    NA    NA FALSE  TRUE FALSE FALSE FALSE
[52]    NA    NA    NA    NA    NA    NA    NA    NA    NA    NA  TRUE  TRUE  TRUE    NA  TRUE  TRUE  TRUE
[69]  TRUE  TRUE  TRUE    NA FALSE FALSE    NA FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE    NA    NA  TRUE
[86]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE    NA
[103]    NA  TRUE FALSE  TRUE    NA FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE    NA  TRUE  TRUE  TRUE    NA
[120]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
[137] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE    NA FALSE FALSE FALSE
> ozone.31 = datos[,"Ozone"]>31
> temperatura.90 = datos[,"Temp"]>90
> dataTemp = datos
> dataTemp = datos[!x,][ozone.31,][temperatura.90,]
> View(dataTemp)
> x = is.na(dataTemp)
> dataTemp = dataTemp[!x,]
> mean(dataTemp[,"Solar.R"])
[1] NA
> solar.R=dataTemp[,"Solar.R"]
> solar.R[x!=NA]
[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[35] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[69] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
> solar.R[x==NA]
[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[35] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[69] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
> is.na(solar.R)
[1]  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[18]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
> solar.R[!is.na(solar.R)]
[1] 255  24  14
> mean(Solar.R[!is.na(solar.R)])
Error in mean(Solar.R[!is.na(solar.R)]) : objeto 'Solar.R' no encontrado
> mean(solar.R[!is.na(solar.R)])
[1] 97.66667
> datosTem
Error: objeto 'datosTem' no encontrado
> is.na(datos[,"Ozone"])
[1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[18] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
[35]  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
[52]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[69] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
[86] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[103]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
[120] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[137] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
> x = is.na(datos[,"Ozone"])
> dataTemp = datos[!x,]
> x = is.na(datos[,"Solar.R"])
> dataTemp = datos[!x,]
> x = is.na(datos[,"Temp"])
> dataTemp = datos[!x,]
> x = is.na(datos[,"Ozone"])
> dataTemp = datos[!x,]
> x = is.na(dataTemp[,"Solar.R"])
> dataTemp = dataTemp[!x,]
> x = is.na(dataTemp[,"Temp"])
> dataTemp = dataTemp[!x,]
> x = dataTemp[,"Ozone">31]
> View(x)
> x = dataTemp[,"Ozone"]>31
> dataTemp = dataTemp[x,]
> x = dataTemp[,"Temp"]>90
> dataTemp = dataTemp[x,]
> mean(dataTemp[,"Solar.R"])
[1] 212.8
> x = datos[,"Month"]==6
> dataTemp = datos[x,]
> mean(dataTemp[,"Temp"])
[1] 79.1
> x = datos[,"Month"]==5
> dataTemp = datos[x,]
> x = is.na(datos[,"Month"])
> dataTemp = dataTemp[!x,]
> dataTemp = datos[,"Month"]==5
> x = datos[,"Month"]==5
> dataTemp = datos
> dataTemp = dataTemp[!x,]
> x = datos[,"Month"]==5
> dataTemp = datos[x,]
> x = is.na(dataTemp[,"Ozone"])
> dataTemp = dataTemp[!x,][,"Ozone"]
> max(dataTemp)
[1] 115"
