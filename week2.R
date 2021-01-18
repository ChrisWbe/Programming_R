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
