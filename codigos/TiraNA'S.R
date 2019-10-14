data <- data.frame(x1 = c(9, 6, NA, 9, 2, 5, NA),     # Column with 2 missing values
                   x2 = c(NA, 5, 2, 1, 5, 8, 0),      # Column with 1 missing values
                   x3 = c(1, 3, 5, 7, 9, 7, 5))       # Column without missing values
data   
data_omit <- na.omit(data)                            # Apply na.omit in R
data_omit  
