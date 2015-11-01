kmax=1000                  #when *dx will get largest length
dx=0.1                     #amount of each step, allows more accuracy of strategies
A=matrix(0,kmax,kmax)      #the payoff matrix: the result of what happens when x faces y
V=20                       #amount you get from winning
numI = 150                 #number of iterations
d=.5                       #amount of population that dies each round
tplot=2

xAxis=numeric(kmax)

for(i in 1:kmax)
{
  xAxis[i]=i/10
}

pauseit <- function(x) { p1 <- proc.time() 
                         Sys.sleep(x) 
                         proc.time() - p1
}

#Everything is added by kmax*dx to ensure that there are no negatives
for(x in 1:kmax)
{
  #my strategy is x; my opponents is y
  
  #the cases when y<x meaning that x won after y rounds
  for(y in 1:x)
  {
    if(y==x){}
    else
    {
      A[x,y]=V-y*dx+kmax*dx
    }
    
  }
  
  #the cases when y>x meaning that x lost after x rounds
  for(y in x:kmax)
  {
      #They tie meaning they split the prize
    if(y==x)
    {
      A[x,y]=V/2-x*dx+kmax*dx
    }
    else
    {
      A[x,y]=-x*dx+kmax*dx
    }
  }
}

#The Nash Equilibrium
nash=numeric(kmax)
for(i in 1:kmax)
{
  nash[i]=1/V*exp(-i*dx/V)
}

sNash = sum(nash)
for(i in 1:kmax)
{
  nash[i]=nash[i]/sNash
}

p=matrix(0,kmax,numI)
p[,1]=1/kmax

#initial plot
plot(xAxis,p[,1],ylim=c(0,.01),type="b",xlab="Cost",ylab="Frequency")
lines(xAxis,nash,col="red",lwd=2.5)  
text(89,.0095,"time = ")
text(97,.0095,"0")
pauseit(1.0)

for(i in 2:numI)
{
    #the population of a certain strategy at time i is determined by the death rate (d), previous population level, and analysis of performance of that strategy against the current population of organisms
  p[,i]=(1-d)*p[,i-1]+d*p[,i-1]*(A%*%p[,i-1])/sum(p[,i-1]*A%*%p[,i-1])
  
  if(i%%tplot==0)
  {
    plot(xAxis,p[,i],ylim=c(0,.01),type="b",xlab="Cost",ylab="Frequency")
    lines(xAxis,nash,col="red",lwd=2.5)  
    text(89,.0095,"time = ")
    text(97,.0095,i)
    pauseit(0.05)
  }
}
