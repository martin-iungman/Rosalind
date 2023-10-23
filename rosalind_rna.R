dna=readLines("rosalind_rna.txt")
#dna="AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
dna=strsplit(dna, split="")%>%unlist()
rna=dna
rna[grep("T",dna)]="U"
rna=paste0(rna, collapse ="")
print(rna)
dna