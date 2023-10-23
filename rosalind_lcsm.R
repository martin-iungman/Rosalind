file=readLines("rosalind_lcsm.txt")
ids=file[grep("^>", file)]%>%sub("^>", replacement="", x=.)
file1=file%>%paste0(collapse = "")
file1=gsub(paste0(ids, collapse = "|"), "", file1)
file1=unlist(strsplit(file1, ">"))[-1]

#file1=list("AATTKFJVJVKUCAGC","IIIIAGCKAGAVJ","HAGCOO")

sep=lapply(file1,function(x)strsplit(x, ""))

min.len=min(unlist(lapply(file1,nchar)))
min.len_file=which.min(unlist(lapply(file1,nchar)))

for(j in seq(min.len, 1)){ #j es el tamano del kmer
  for(i in 1:(min.len-j+1)){ #i es la posicion 
    t=paste0(sep[[min.len_file]][[1]][seq(i,(i+j-1))],collapse="")
    match=length(grep(t,file1))
    if(match==length(file1)){ 
      stop(paste("el patron es",t ))}
  }
}

####### No funciono bien, pero esta otra opcion si:

library(seqinr)
#Read all fasta sequences
fasL <- read.fasta("rosalind_lcsm.txt")
#Convert to a vector of seq-strings
allS <- toupper(unname(sapply(fasL, paste, collapse = "")))
#Order so that the shortest seq is nr 1
allS <- allS[order(nchar(allS), allS)]

#Check if a motif in one seq exists in all seqs
mot <- ""  #motif-string
j = 1  #start of substring
i = 0  #increased length of substring
while(j <= nchar(allS[1])-nchar(mot)) { 
  for(i in nchar(mot):nchar(allS[1])) 
  { 
    if(names(summary(grepl(substr(allS[1], j, j+i), allS)))[2] != "FALSE" & nchar(substr(allS[1], j, j+i)) > nchar(mot)) 
    {
      mot <- substr(allS[1], j, j+i)  #longest motif
    } else break
  }
  j <- j+1
}

print(mot, quote = FALSE)
