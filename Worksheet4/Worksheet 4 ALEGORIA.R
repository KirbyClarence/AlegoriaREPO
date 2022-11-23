#-------------------------------------------------------------------------------
#                               Worksheet 4
#-------------------------------------------------------------------------------
library(dplyr)
library(readr)
library(data.table)

# 1. The table below shows the data about shoe size and height. 
#   Create a data frame.

Shoe_size <- c(6.5, 9.0, 8.5, 8.5, 10.5, 7.0, 9.5, 9.0, 
               13.0, 7.5, 10.5, 8.5, 12.0, 10.5, 13.0,
               11.5, 8.5, 5.0, 10.0, 6.5, 7.5, 8.5, 10.5 
               ,8.5, 10.5, 11.0, 9.0, 13.0)

Height <- c(66.0, 68.0, 64.5, 65.0, 70.0, 64.0, 70.0, 
            71.0, 72.0, 64.0, 74.5, 67.0, 71.0, 71.0, 
            77.0, 72.0, 59.0, 62.0, 72.0, 66.0, 64.0, 
            67.0,73.0, 69.0, 72.0, 70.0, 69.0, 70.0)

Gender <- c("F","F","F","F","M","F","M","F","M",
            "M","M","F","M","M","M","M","F","F",
            "M","F","M","M","M","F","M","M","M","M")

table <- data.frame(Shoe_size, Height, Gender)
table

# a. Describe the data.

#    The table presents data, and every row on the table consists 
#    of shoe size, height, and gender, which are aligned to form data 
#    about the specific participant.


# b. Find the mean of shoe size and height of the respondents.
#    Copy the codes and results.

summary(table)
mean(Shoe_size)
mean(Height)

# c. Is there a relationship between shoe size and height? Why?

#    Based on the said table, yes. The reason that the dataset confirms this 
#    linear correlation. In general, as shoe size increases, height increases. 
#    Taller people need larger feet since they need a larger base for balance. 
#    Shorter people tend to have smaller feet since they require a smaller base. 


# 2. Construct character vector months to a factor with factor() and assign the 
#    result to factor_months_vector. Print out factor_months_vector and assert 
#    that R prints out the factor levels below the actual values.

months_vector <- c("March", "April", "January", "November", "January", 
                   "September", "October", "September", "November", "August", 
                   "January", "November", "November", "February", "May", 
                   "August", "July", "December", "August","August","September", 
                   "November", "February", "April")

factor_months <- factor(months_vector)
factor_months


#3. Then check the summary() of the months_vector and factor_months_vector. |
#   Interpret the results of both vectors. Are they both equally useful in this 
#   case?

summary(months_vector)
summary(factor_months)


# 4. Create a vector and factor for the table below.
new_order_data <- c("East","West","North")
factor_order_data <- factor(new_order_data)
factor_order_data


#5. Enter the data below in Excel with file name = import_march.csv

# a. Import the excel file into the Environment Pane using read.table() function.
#    Write the code.

getwd()

import <- read.table("import_march.csv", header= TRUE, sep= ",")
import

# b. View the dataset. Write the code and its result.

#Code:
import <- read.table("import_march.csv", header= TRUE, sep= ",")
import

#Result:
#Students Strategy.1 Strategy.2 Strategy.3
#1                   8         10          8
#2     Male          4          8          6
#3                   0          6          4
#4                  14          4         15
#5   Female         10          2         12
#6                   6          0          9


