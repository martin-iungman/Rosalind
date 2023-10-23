str1=readLines("rosalind_hamm.txt")[[1]]
str2=readLines("rosalind_hamm.txt")[[2]]
sum(unlist(strsplit(str1,""))!=unlist(strsplit(str2,"")))
