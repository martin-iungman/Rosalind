txt=readLines("rosalind_ini6.txt")
#txt="We tried list and we tried dicts also we tried Zen"
txt=strsplit(txt, split=" ")%>%unlist()
words=unique(txt)

for(i in words){
  cat(paste(i, grep(i, txt)%>%length()), file="rosalind_ini6_res.txt", append=T, sep="\n")
}
