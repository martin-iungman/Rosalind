file=readLines("rosalind_cons.txt")
ids=file[grep("^>", file)]%>%sub("^>", replacement="", x=.)
file1=file%>%paste0(collapse = "")
file1=gsub(paste0(ids, collapse = "|"), "", file1)
file1=unlist(strsplit(file1, ">"))[-1]

file1=list("AATTKFJVJVKUCAGC","IIIIAGCKAGAVJ","HAGCOO")

sep=lapply(file1,function(x)strsplit(x, ""))

min.len=min(unlist(lapply(file1,nchar)))
min.len_file=which.min(unlist(lapply(file1,nchar)))

for(j in seq(min.len, 1)){
  for(i in 1:(min.len-j+1)){
    t=paste0(sep[[min.len_file]][[1]],collapse="")
    match=length(grep(t,file1))
    if(match==length(file1)){ 
      print("listo") 
      break}
  }
}
