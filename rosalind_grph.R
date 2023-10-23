k=3

file=readLines("rosalind_grph.txt")
fasta_ids=file[grep("^>", file)]%>%sub("^>", replacement="", x=.)
file1=file%>%paste0(collapse = "")
file1=gsub(paste0(fasta_ids, collapse = "|"), "", file1)
file1=strsplit(file1, ">")
file1=unlist(file1)[-1]

pre=lapply(file1, function(x){
  strsplit(x,"")[[1]][1:k]%>%paste0(collapse = "")
})
suff=lapply(file1, function(x){
  strsplit(x,"")[[1]][(nchar(x)-k+1):nchar(x)]%>%paste0(collapse = "")
})

suff_ids=c()
pre_ids=c()
for(i in 1:length(suff)){
  ids=grep(suff[i], pre)
  ids=ids[ids!=i]
  #ids=ids[-ids==i]
  if(length(ids)>0){
    suff_ids=append(suff_ids,rep(fasta_ids[i],times=length(ids)))
    pre_ids=append(pre_ids,fasta_ids[ids])
  }
}
paste(suff_ids,pre_ids)%>%writeLines("rosalind_grph_res.txt")
