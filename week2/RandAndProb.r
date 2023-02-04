# library(downloader) 
# url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
# filename <- basename(url)
# download(url, destfile=filename)
# x <- unlist( read.csv(filename) )

RNGkind("Mersenne-Twister", "Inversion", "Rejection")
print(paste("The average of the bodyweights is: ", mean(x)))


# library(downloader) 
# url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
# filename_y<- basename(url)
# download(url, destfile=filename_y)
# y <- unlist( read.csv(filename_y) )

# print(y)
sample_means <- rep(0, 1000)
set.seed(1)
# for loop to take random sample of 5, 1000 times
for (i in 1:1000) {
  # take a random sample of 5
  sample <- sample(y, 5)
  # calculate the mean of the sample
  sample_mean <- mean(sample)
  # store the sample mean in a vector
  sample_means[i] <- sample_mean
}

print(paste("The average of the sample means is: ", mean(sample_means)))
# the proportion of sample means that are more than 1 gram away from the population mean
print(paste("The proportion of sample means that are more than 1 gram away from the population mean is: ", 
            mean(abs(sample_means - mean(x)) > 1)))


sample_means_2 <- rep(0, 10000)
set.seed(1)
# for loop to take random sample of 5, 1000 times
for (i in 1:10000) {
  # take a random sample of 5
  sample <- sample(y, 5)
  # calculate the mean of the sample
  sample_mean <- mean(sample)
  # store the sample mean in a vector
  sample_means_2[i] <- sample_mean
}

print(paste("The average of the sample means is: ", mean(sample_means_2)))
# the proportion of sample means that are more than 1 gram away from the population mean
print(paste("The proportion of sample means (of 10,000) that are more than 1 gram away from the population mean is: ", 
            mean(abs(sample_means_2 - mean(x)) > 1)))


#Probability 
# install.packages("gapminder")
library(gapminder)
data(gapminder)
# print(class(gapminder))
year_1952 <- gapminder[gapminder$year == 1952, ]
print(year_1952)
# create data frame df, with lifeExp and country columns
df <- data.frame(year_1952$lifeExp, year_1952$country)
# rename the columns
colnames(df) <- c("lifeExp", "country")
print(df)

a <- 40
prop1 <- mean(df$lifeExp <= a)
print(paste("The proportion of countries with life expectancy less than or equal to 40 is: ", prop1))
