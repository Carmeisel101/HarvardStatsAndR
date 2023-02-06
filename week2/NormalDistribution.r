# library(downloader) 
# url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
# filename <- basename(url)
# download(url, destfile=filename)
# x <- unlist( read.csv(filename) )

set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}

print(paste("The average of the sample means is: ", mean(averages5)))
print(paste("The average of the sample means is: ", mean(averages50)))

# make a histogram of averages5 and averages50 and compare them next to each other
par(mfrow=c(1,2))
hist(averages5, main="averages5", xlab="mean", col="red")
hist(averages50, main="averages50", xlab="mean", col="blue")

# the proportion of data points that are between 23 and 25 for average50
print(paste("The proportion of data points that are between 23 and 25 for average50 is: ", 
            mean(averages50 > 23 & averages50 < 25)))

# Math way
stdv <- sd(averages50)
mean <- mean(averages50)

f <- function(x) {
    out <- (1/(stdv*sqrt(2*pi)))*exp(-(1/2)*((x-mean)/(stdv))^2)
}
prop <- integrate(f, lower=23, upper=25)
print(paste("The proportion of data points that are between 23 and 25 for average50 is (Math way): ", 
            prop$value))

# the proportion of data points that are between 23 and 25 in a normal distribution with an average of 23.9 and standard deviation of 0.43
print(paste("The proportion of data points that are between 23 and 25 in a normal distribution with an average of 23.9 and standard deviation of 0.43 is: ", 
            pnorm(25, mean=23.9, sd=0.43) - pnorm(23, mean=23.9, sd=0.43)))

# library(downloader) 
# url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
# filename <- basename(url)
# download(url, destfile=filename)
# dat <- read.csv(filename) 

dat <- na.omit(dat)
dat_male <- dat[dat$Sex == "M", ]
dat_maleControl <- dat_male[dat_male$Diet == "chow", ]
# print(dat_maleControl)
print(mean(dat_maleControl$Bodyweight))
library(rafalib)
print(popsd(dat_maleControl$Bodyweight))

set.seed(1)
sample <- sample(dat_maleControl$Bodyweight, 25)
print(paste("The sample mean is: ", mean(sample)))

dat_maleHF <- dat_male[dat_male$Diet == "hf", ]
print(mean(dat_maleHF$Bodyweight))
print(popsd(dat_maleHF$Bodyweight))

set.seed(1)
sampleY <- sample(dat_maleHF$Bodyweight, 25)
print(paste("The sample mean is: ", sampleY))

x_bar <- mean(dat_maleControl$Bodyweight)
y_bar <- mean(dat_maleHF$Bodyweight)

diff <- abs(x_bar - y_bar)

X_bar <- mean(sample)
Y_bar <- mean(sampleY)

Diff <- abs(X_bar - Y_bar)

diffDiff <- abs(diff - Diff)
print(paste("The difference between the difference in the population means and the difference in the sample means is: ", diffDiff))


dat_female <- dat[dat$Sex == "F", ]
dat_femaleControl <- dat_female[dat_female$Diet == "chow", ]
dat_femaleHF <- dat_female[dat_female$Diet == "hf", ]

x_bar <- mean(dat_femaleControl$Bodyweight)
y_bar <- mean(dat_femaleHF$Bodyweight)

diff <- abs(x_bar - y_bar)

set.seed(2)
Fsample <- sample(dat_femaleControl$Bodyweight, 25)
set.seed(2)
FsampleY <- sample(dat_femaleHF$Bodyweight, 25)

X_bar <- mean(Fsample)
Y_bar <- mean(FsampleY)

Diff <- abs(X_bar - Y_bar)

diffDiff <- abs(diff - Diff)

print(paste("The difference between the difference in the population means and the difference in the sample means is: ", diffDiff))

# Central Limit Theorem

# library(downloader) 
# url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
# filename <- basename(url)
# download(url, destfile=filename)
# data <- na.omit( read.csv(filename) )

# print(data)

# the proportion are within 1 standard deviation of the mean
print(paste("The proportion are within 1 standard deviation of the mean is: ", 
            mean(data$Bodyweight > mean(data$Bodyweight) - popsd(data$Bodyweight) & data$Bodyweight < mean(data$Bodyweight) + popsd(data$Bodyweight))))

# the proportion are within 2 standard deviations of the mean
print(paste("The proportion are within 2 standard deviations of the mean is: ", 
            mean(data$Bodyweight > mean(data$Bodyweight) - 2*popsd(data$Bodyweight) & data$Bodyweight < mean(data$Bodyweight) + 2*popsd(data$Bodyweight))))


# the proportion are within 3 standard deviations of the mean
print(paste("The proportion are within 3 standard deviations of the mean is: ", 
            mean(data$Bodyweight > mean(data$Bodyweight) - 3*popsd(data$Bodyweight) & data$Bodyweight < mean(data$Bodyweight) + 3*popsd(data$Bodyweight))))

data_y <- data[data$Diet == "chow", ]
data_y <- data_y[data_y$Sex == "M", ]

# the proportion are within 1 standard deviation of the mean
print(paste("The proportion are within 1 standard deviation of the mean is: ", 
            mean(data_y$Bodyweight > mean(data_y$Bodyweight) - popsd(data_y$Bodyweight) & data_y$Bodyweight < mean(data_y$Bodyweight) + popsd(data_y$Bodyweight))))

# the proportion are within 2 standard deviations of the mean
print(paste("The proportion are within 2 standard deviations of the mean is: ", 
            mean(data_y$Bodyweight > mean(data_y$Bodyweight) - 2*popsd(data_y$Bodyweight) & data_y$Bodyweight < mean(data_y$Bodyweight) + 2*popsd(data_y$Bodyweight))))

# the proportion are within 3 standard deviations of the mean

print(paste("The proportion are within 3 standard deviations of the mean is: ", 
            mean(data_y$Bodyweight > mean(data_y$Bodyweight) - 3*popsd(data_y$Bodyweight) & data_y$Bodyweight < mean(data_y$Bodyweight) + 3*popsd(data_y$Bodyweight))))

# install.packages("dplyr")
library(dplyr)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
print(mean(avgs))
print(popsd(avgs))