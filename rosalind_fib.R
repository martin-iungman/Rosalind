n=30
k=2

pairs=c(1,1)
for (i in 1:(n-2)){
  val=pairs[length(pairs)]+k*pairs[length(pairs)-1]
  pairs=append(pairs,val )
}
pairs
