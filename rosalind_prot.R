codon_table=read.delim("codon_table.txt.txt", sep="\t")

rna=readLines("rosalind_prot.txt")
#rna="AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"
rna=strsplit(rna,"")
n.codons=lengths(rna)/3
id=rep(seq(1,n.codons), times=rep(3, times=n.codons))

aa_code=vector(length=n.codons)
for(i in 1:n.codons){
  cod=unlist(rna)[id==i]
  cod[cod=="U"]="T"
  cod=cod%>%paste0(collapse="")
  aa=codon_table$Letter[codon_table$Codon==cod]
  if(aa=="O") {
    aa_code=aa_code[-i]
    break
  }
  aa_code[i]=aa
  
}
paste0(aa_code, collapse="")
