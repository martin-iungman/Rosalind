file=readLines("rosalind_gc.txt")
ids=file[grep("^>", file)]%>%sub("^>", replacement="", x=.)
file1=file%>%paste0(collapse = "")
file1=gsub(paste0(ids, collapse = "|"), "", file1)
file1=strsplit(file1, ">")

gc=function(dna){
  dna=unlist(strsplit(dna, split=""))
  gc=grep("G|C",dna)%>%length()
  return(100*gc/length(dna))
}
gc_list=unlist(lapply(unlist(file1)[-1], gc))

ids[which.max(gc_list)]
gc_list[which.max(gc_list)]

