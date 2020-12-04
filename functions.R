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

#subsetting
x = c("a","b","c","d","a")
x[1]

u = x>"a"
u
x[u]