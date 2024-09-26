set.seed(20240926)
## Generate a data frame with a variable that has
## very large numbers (above 10 ^ 9)
df <- data.frame(
    large_num = runif(10, min = 1e10, max = 1e14)
)
## Print automatically displays large numbers
## using the scientific notation where
## 1e3 means 1 * 10^3
## 1e9 means 1 * 10^9
df
df$large_num[1]


library("dplyr")
## Transform the numbers by dividing by 1 billion
## (aka 1,000,000,000).
## As an aside, billions in Mexico are
## 1,000,000,000,000
df2 <- mutate(df,
    large_num = large_num / 1000000000)
## The numbers are small enough that R doesn't
## use the e syntax anymore
df2

## Don't overwrite "large_num"
## and use the 1e syntax
df3 <- mutate(df,
    large_num_new_name = large_num / 1e9)
df3
identical(df2$large_num, df3$large_num_new_name)
