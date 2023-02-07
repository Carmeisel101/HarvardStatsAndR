
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
print(head(babies))

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
print(popsd(bwt.nonsmoke))
print(popsd(bwt.smoke))

set.seed(1)
n <- 25
nonsmoke <- sample(bwt.nonsmoke, n)
smoke <- sample(bwt.smoke, n)
# t-statistic
T <- t.test(nonsmoke, smoke, alternative="two.sided", var.equal=TRUE)
print(T)

# p-value
print(T$p.value)
tval <- T$statistic
print(1-(pnorm(abs(tval))-pnorm(-abs(tval))))
# null hypothesis


# Confidence interval
N <- 25
set.seed(1)
dat.ns <- sample(bwt.nonsmoke, N) 
dat.s <- sample(bwt.smoke, N) 
print(qt(0.995,48)*sqrt( sd( dat.ns)^2/N + sd( dat.s)^2/N ))
##note that if you define dat.s before dat.ns, you get a different answer
##due to sampling randomness
##tolerance is set to accept both answers

B <- 10000
alpha <- 0.05
set.seed(1)
N <- 5
res_list<- replicate(B, {
  ns_sample <- sample(bwt.nonsmoke, N)
  s_sample <- sample(bwt.smoke, N)
  pval <- t.test(ns_sample, s_sample)$p.value
  return(alpha > pval) # this returns logical (i.e., TRUE if pval is smaller than 0.05 = alpha), and stores in the vector res_list.
})
print(mean(res_list) ) # this is the proportion of times we reject the null hypothesis

pval_calc <- function(N) {
  ns_sample <- sample(bwt.nonsmoke, N)
  s_sample <- sample(bwt.smoke, N)
  pval <- t.test(ns_sample, s_sample)$p.value
  return(pval)
}

Ns <- c(30,60,90,120)
B <- 10000
alpha <- 0.05
res_list <- vector('double',length(Ns))
for (i in seq_along(Ns)) {
  res_list[[i]] <- mean(replicate(B, pval_calc(Ns[[i]])) < alpha)
}
names(res_list) <- Ns
print(res_list) # sample size of 60 gives power of 80%

pval_calc <- function(N) {
  ns_sample <- sample(bwt.nonsmoke, N)
  s_sample <- sample(bwt.smoke, N)
  pval <- t.test(ns_sample, s_sample)$p.value
  return(pval)
}

Ns <- c(30,60,90,120)
B <- 10000
alpha <- 0.01
res_list <- vector('double',length(Ns))
for (i in seq_along(Ns)) {
  res_list[[i]] <- mean(replicate(B, pval_calc(Ns[[i]])) < alpha)
}
names(res_list) <- Ns
print(res_list) # sample size of 90 gives power of 80%

# Permutation test
babies <- read.table("babies.txt", header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% dplyr::select(bwt) %>% unlist
bwt.smoke <- filter(babies, smoke==1) %>% dplyr::select(bwt) %>% unlist

N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)

dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
mean(smokersstar)-mean(nonsmokersstar)

N <- 10

set.seed(1)
nonsmokers <- sample(bwt.nonsmoke,N)
smokers <- sample(bwt.smoke,N)
obs <- mean(smokers) - mean(nonsmokers)

dat <- c(smokers,nonsmokers)
shuffle <- sample(dat) 
smokersstar <- shuffle[1:N] 
nonsmokersstar <- shuffle[(N+1):(2*N)] 
mean(smokersstar)-mean(nonsmokersstar)

set.seed(1)
avgdiff <- replicate(1000, {
  dat <- c(smokers,nonsmokers)
  shuffle <- sample(dat) 
  smokersstar <- shuffle[1:N] 
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  return(mean(smokersstar)-mean(nonsmokersstar))
})


print((sum(abs(avgdiff) > abs(obs)) + 1) / (length(avgdiff) + 1))

