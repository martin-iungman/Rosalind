file=readLines("rosalind_cons.txt")
ids=file[grep("^>", file)]%>%sub("^>", replacement="", x=.)
file1=file%>%paste0(collapse = "")
file1=gsub(paste0(ids, collapse = "|"), "", file1)
file1=strsplit(file1, ">")



dna_list=lapply(unlist(file1)[-1],function(x)strsplit(x,""))

profile=function(dna){
  A=rep(0, times=length(dna))
  C=rep(0, times=length(dna))
  G=rep(0, times=length(dna))
  T=rep(0, times=length(dna))
  
  A[which(dna=="A")]=A[which(dna=="A")]+1
  C[which(dna=="C")]=C[which(dna=="C")]+1
  G[which(dna=="G")]=G[which(dna=="G")]+1
  T[which(dna=="T")]=T[which(dna=="T")]+1
  return(rbind(A,C,G,T))
}

matrix=lapply(dna_list, function(x) profile(unlist(x)))
matrix=Reduce("+", matrix)
consenso=rownames(matrix)[apply(matrix,2,which.max)]
consenso=paste0(consenso, collapse = "")
