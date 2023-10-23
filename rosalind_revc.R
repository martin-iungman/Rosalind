dna=readLines("rosalind_revc.txt")
#dna="ATCGGGA"
rev_compl=function(dna){
  dna=unlist(strsplit(dna, ""))
  rev_compl=c()
  for(i in 0:(length(dna)-1)){
    if(dna[length(dna)-i] =="A"){rev_compl[i+1]="T"}
    if(dna[length(dna)-i] =="C"){rev_compl[i+1]="G"}
    if(dna[length(dna)-i] =="T"){rev_compl[i+1]="A"}
    if(dna[length(dna)-i] =="G"){rev_compl[i+1]="C"}
  }
  return(paste0(rev_compl, collapse=""))
}

rev_compl(dna)
