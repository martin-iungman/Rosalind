a=22
b=16
c=20
n=a+b+c
#prob c*c
cc=(c/n)*(c-1)/(n-1)
ccP=cc*1
#prob b*c
bc=(b/n)*(c/(n-1))+(c/n)*(b/(n-1))
bcP=bc*0.5
#prob b*b
bb=(b/n)*(b-1)/(n-1)
bbP=bb*0.25

(prob_dom=1-(ccP+bcP+bbP))
