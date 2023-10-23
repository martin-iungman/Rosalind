k=6 #gen
N=18 #min AaBb
sum=c()
for(i in N:2^k){
sum=append(sum,(factorial(2^k)/(factorial(i)*factorial(2^k-i)))*(0.25^i)*0.75^(2^k-i))} #binomial con p=0.25 y q=0.75
sum
sum(sum)
