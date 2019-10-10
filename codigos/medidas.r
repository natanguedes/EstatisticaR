idade <- c(78, 78, 76, 75, 77, 78, 77, 78, 79, 75, 75,76)
idade

mean(idade)
median(idade)
getmode(idade)

# Create the function para calcular a moda.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(1,1,1,3,1,2,3,4,1,5,5,3,2,3)

# Calculate the mode using the user function.
result <- getmode(v)
print(result)
