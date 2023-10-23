txt=readLines("rosalind_dna.txt")
#txt="AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
txt=strsplit(txt, split="")%>%unlist()
bases=c("A","C","G","T")

a=c()
for(i in bases){
  a=append(a,grep(i, txt)%>%length())
}
print(a)
