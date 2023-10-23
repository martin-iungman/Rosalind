codon_table=read.delim("codon_table.txt.txt", sep="\t")
codon_summ=codon_table%>%group_by(Letter)%>%summarise(n=n())

string=readLines("rosalind_mrna.txt")%>%gsub("\n","",.)%>%paste0("O")%>%strsplit("")%>%unlist()
string_summ=string%>%as_factor()%>%summary()


res=data.frame(counts=string_summ, Letter=names(string_summ))%>%left_join(codon_summ)
#mod(prod(res$n[1:3]^res$counts[1:3]), 1E6) #numero demasiado grande

n=1E6
b=1
#for(i in 1:nrow(res)){
#  b=b*res$n[i]^res$counts[i]%%n  #numeros intermedios demasiado grandes llevan a redondeos intermedios
#}


for(i in 1:length(string)){
  b=(b*codon_summ$n[which(codon_summ$Letter==string[i])])%%n
}
b
