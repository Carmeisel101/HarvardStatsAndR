library(dplyr)
library(rafalib)

set.seed(1)
n <- 100
sides <- 6
p <- 1/sides
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
# qqnorm(zs)
# abline(0,1) #confirm it's well approximated with normal distribution
print(mean(abs(zs) > 2))

# Quiz

# library(downloader) 
# url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
# filename <- basename(url)
# download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# print(x)
set.seed(1)
# for loop to take random sample of 50, 1000 times, and calculate the mean of the sample
sample_means <- rep(0, 1000)
for (i in 1:1000) {
  # take a random sample of 50
  sample <- sample(x, 50)
  # calculate the mean of the sample
  sample_mean <- mean(sample)
  # store the sample mean in a vector
  sample_means[i] <- sample_mean
}



# proportion of sample means that are more than 1 gram away from the population mean
print(paste("The proportion of sample means that are more than 1 gram away from the population mean is: ", 
            mean(abs(sample_means - mean(x)) > 1)))

library(gapminder)
data(gapminder)
print(head(gapminder))
year_1952 <- gapminder[gapminder$year == 1952, ]

# proportion of countries with life expectancy between 40 and 60 years
print(paste("The proportion of countries with life expectancy between 40 and 60 years is: ", 
            mean(year_1952$lifeExp >= 40 & year_1952$lifeExp <= 60)))

