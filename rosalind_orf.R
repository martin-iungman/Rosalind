dna=readLines("rosalind_orf.txt")
codon_table=read.delim("codon_table.txt.txt", sep="\t")
#dna="AGCCATGTAGCTAACTCAGGTTACATGGGGATGACCCCGCGACTTGGATTAGAGTCTCTTTTGGAATAAGCCTGAATGATCCGAGTAGCATCTCAG"
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


dna=dna[-1]%>%paste0(collapse = "")

dna_list=list(dna,
     strsplit(dna, "")[[1]][-1]%>%paste0(collapse = ""), 
     strsplit(dna, "")[[1]][-c(1,2)]%>%paste0(collapse = ""),
     rev_compl(dna),
     strsplit(rev_compl(dna), "")[[1]][-1]%>%paste0(collapse = ""),
     strsplit(rev_compl(dna), "")[[1]][-c(1,2)]%>%paste0(collapse = ""))

orf=c()
for(a in 1:length(dna_list)){
  codons=strsplit(gsub("([[:alnum:]]{3})","\\1 ",dna_list[[a]])," ")[[1]]
  trans=codon_table$Letter[match(codons, codon_table$Codon)]
  start=which(trans=="M")
  end=which(trans=="O")
  for(i in start){
    if(any(end>i)){
      orf=append(orf,paste0(trans[i:(min(end[end>i])-1)], collapse = ""))
    }
  }
}

writeLines(paste0(unique(orf), collapse="\n"), "rosalind_orf_res.txt")
