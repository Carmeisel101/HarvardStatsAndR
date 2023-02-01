# # install.packages("languageserver")
# install.packages("rafalib")
# library(rafalib)

# print hello world
# print("Hello World")

#  To clear the console press: Ctrl + L

# install.packages("swirl")
# library(swirl)

# print the version of R
# v <- R.Version()
# print(v)

# Create a numeric vector containing the numbers 2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23.
x <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
print(x)

# find average of x
print("mean")
print(mean(x))

steps = 25
print(paste("steps = ", steps))

# for loop in range of steps with step size of 1 that finds the sum of the squares of the numbers from 1 to steps
n = 0
for (i in 1:steps) {
  n = n + i^2
}

print(paste("sum of squares = ", n))

# grab the cars dataset
data(cars)
# print(cars)
print(paste("cars mean distance = ", mean(cars$dist)))

print(paste("row = ", which(cars$dist == 85))

