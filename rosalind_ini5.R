txt=readLines("rosalind_ini5.txt")
writeLines(txt[seq(1, length(txt))%%2==0], "I5_res.txt")
