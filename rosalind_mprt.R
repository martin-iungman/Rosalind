library(magrittr)
ids=readLines("rosalind_mprt.txt")
ids2=sub("_.+$", "", ids)
url=paste0("https://rest.uniprot.org/uniprotkb/",ids2,".fasta")
file=paste0(ids, ".fasta")

output=c()
for( i in 1:length(ids)){
  download.file(url[i],file[i])
  seq=readLines(file[i])[-1]%>%paste0(collapse = "")
  seq=strsplit(seq,"")[[1]]
  kmers=sapply(1:(length(seq)-3), function(x){seq[x:(x+3)]%>%paste0(collapse = "")})
  pos=grep("^N.(?<!P)(S|T).(?<!P)", kmers, perl = T) # N{P}[ST]{P}
  if(length(pos)>0){
    output=append(output,
                 c(ids[i], 
                 paste(pos, collapse=" ")))
  }
  
}
writeLines(print(paste(output, collapse = "\n")), "rosalind_mprt_res.txt")
file.remove(file)


