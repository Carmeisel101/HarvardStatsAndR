
data_dir <- "/Users/carlosmeisel/Cloud/Code/Projects/HarvardStatsAndR/Week1/data"
# load skew.Rdata file in data directory
skew <-load(file.path(data_dir, "skew.RData"))
print(skew)
print(dim(dat))

mat <- par(mfrow=c(3,3))

# loop through columns and display on qqnorm plot at a tiem 
for (i in 1:ncol(dat)) {
  qqnorm(dat[,i])
  qqline(dat[,i])
}
# print column names of dat
print(colnames(dat))

# load the insect spray dataset
print((InsectSprays))
# make a boxplot of the insect spray data
boxplot(count ~ spray, data=InsectSprays, main="Insect Spray", xlab="Spray", ylab="Count")
# boxplot(values ~ factor)
# boxplot(split(values, factor))

# inspect the types of spary used
print(unique(InsectSprays$spray))

# install.packages("UsingR")
# library(UsingR)
print(nym.2002)

# make a df of the male nym.2002 data
boxplot(time ~ gender, data = nym.2002, main = "nym.2002", xlab = "Gender", ylab = "Time")

females = nym.2002[nym.2002$gender == "Female", ]
males = nym.2002[nym.2002$gender == "Male", ]

hist(females$time, main = "females", xlab = "Time", ylab = "Frequency")
hist(males$time, main = "males", xlab = "Time", ylab = "Frequency")


# Quiz 
# install.packages("dslabs")
library(dslabs)
library(dplyr)
data("heights")
h<-heights$height
print(h)
hist(h, main = "heights", xlab = "Height", ylab = "Frequency")
boxplot(h, main = "heights", xlab = "Height", ylab = "Frequency")


print(summarise(heights, mean = mean(height), sd = sd(height), median = median(height), min = min(height), max = max(height)))

