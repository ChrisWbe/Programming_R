#Estructuras de control
#if-else
x<-5
if(x>3){
  y<-10
}else{
  y<-0
}

y<-if(x>3){
  10
}else{
  0
}

#For loops
for(i in 1:10){
  print(i)
}

x<-matrix(1:6, 2,3)
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

#White loops
count<-0
while(count<10){
  print(count)
  count <- count + 1
}


#Functions
add2<-function(x,y){
  x+y
}
add2(1,2)

above10<-function(x){
  x[x>10]
}

above10(c(1:20))

above<-function(x,n=10){
  x[x>n]
}

above(c(1:20),19)

columnmean<-function(y, removeNA=T){
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(y[,i], na.rm = removeNA)
  }
  means
}

f = function(a, b){
  a^2
}
f(2)

myplot = function(x,y,type="l",...){ #se usa para indicar un numero variable de argumentos
  plot(x,y,type=type,...)
}

args(paste)
paste("a","b",sep = ":")

#Alcance (Lexical scoping)
make.power = function(n){
  pow = function(X){
    X^n
  }
  pow
}
cube = make.power(3)
square = make.power(2)
cube(3) #27
square(3) #9

y=10
f = function(x){
  y=2
  y^2 + g(x)
}

g = function(x){
  print(y)
  x*y
}
f(3)

#Dates and Times
x = as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

#Times in R
x = Sys.time()
x
p = as.POSIXlt(x)
names(unclass(p))
p$sec

x = Sys.time()
x ##ya se encuentra en formato POSIXct
unclass(x) # como la lista no posee los campos de POSIXlt, para obtener sec debe convertirse a dicho formato
p = as.POSIXlt(x)
p$sec

datestring = c("January 10, 2012 10:40", "December 9, 2011 9:10")
x = strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

x = as.Date("2012-03-01")
y = as.Date("2012-02-28")
x-y
x = as.POSIXct("2012-10-25 01:00:00")
y = as.POSIXct("2012-10-25 013:00:00", tz = "GMT")
y-x

#Quiz 2
cube <- function(x, n) {
  x^3
}
cube(3)

x <- 1:10
if(x > 5) {
  x <- 0
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
y

h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}



#Tarea numero 1
source("Programming_R/ProgrammingAssignment1/pollutantmean.R")
pollutantmean("Programming_R/ProgrammingAssignment1/specdata","nitrate")

source("Programming_R/ProgrammingAssignment1/complete.R")
cc = complete("Programming_R/ProgrammingAssignment1/specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
source("Programming_R/ProgrammingAssignment1/corr.R")
cr = corr("Programming_R/ProgrammingAssignment1/specdata",2000)
n <- length(cr)                
cr <- corr("Programming_R/ProgrammingAssignment1/specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))