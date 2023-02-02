



# Exercise 2
data_dir <- "/Users/carlosmeisel/Cloud/Code/Projects/HarvardStatsAndR/Week1/data"
msleep <- read.csv(paste(data_dir, "/msleep_ggplot2.csv", sep=""))
print(msleep)

print(paste("the type of object msleep is = ", class(msleep)))

# find the column that contains primates
primates <- msleep[msleep$order == "Primates", ]
print(primates)

print(paste("number of rowa in primates = ", nrow(primates)))

print(paste("class of primates = ", class(primates)))

var <- (select(primates, name, sleep_total))
print(class(var))

# compute the average sleep time for primates
print(paste("average sleep time for primates = ", mean(primates$sleep_total)))
