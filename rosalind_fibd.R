n=95
m=19

tot=c(1,1)
offs=c(1,0)
ad=c(0,1)

for(i in 3:n){
  offs[i]=ad[i-1]
  if(m>=i){
    ad[i]=ad[i-1]+offs[i-1]
  }else{
    ad[i]=ad[i-1]+offs[i-1]-offs[i-m]
  }
  
  tot[i]=offs[i]+ad[i]
}
prettyNum(tot[n], scientific=F,digits=21)

#dio incorrecto