# install.packages("languageserver")
# install.packages("rafalib")
# library(rafalib)


# Create a numeric vector containing the numbers 2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23.
# x <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
# print(x)

# # find average of x
# print("mean")
# print(mean(x))

# steps = 25
# print(paste("steps = ", steps))

# # for loop in range of steps with step size of 1 that finds the sum of the squares of the numbers from 1 to steps
# n = 0
# for (i in 1:steps) {
#   n = n + i^2
# }

# print(paste("sum of squares = ", n))

# # grab the cars dataset
# data(cars)
# # print(cars)
# print(paste("cars mean distance = ", mean(cars$dist)))

# print(paste("row = ", which(cars$dist == 85))



# Exercise 1
# find the directory of where the this script is located

data_dir = "/Users/carlosmeisel/Cloud/Code/Projects/HarvardStatsAndR/Week1/data"
mice = read.csv(paste(data_dir, "/femaleMiceWeights.csv", sep=""))
print(mice)
print(mice[12, 2])
mice_weightcol = mice$Bodyweight
print(mice_weightcol[11])
# number of mice in dataset
print(paste("number of mice = ", length(mice_weightcol)))
# extract the rows of mice where diet = "hf"
hf_mice = mice[mice$Diet == "hf", ]
print(hf_mice)
# average weight of mice on high fat diet
print(paste("average weight of mice on high fat diet = ", mean(hf_mice$Bodyweight)))

print(sample(hf_mice$Bodyweight, 1))

