#1. Vector of named age.
#R code:
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31,
         27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 
         17, 37, 42, 53, 41, 51, 35, 24, 33, 41)
age

#2. R code for reciprocal of values of age.
recip_num <- 1/age
recip_num

#3. Assigning new age.
new_age <- c(age, 0, age)
new_age

#4. R code for sorting values of age.
sort(age)

#5. R code for the minimum and maximum value of age.
min(age)
max(age)

#6. R code for vector named data.
data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,
         2.5, 2.3, 2.4, 2.7)
data


#7. This R code generates a new vector for data 
#   where you double every value of the data.

data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,
          2.5, 2.3, 2.4, 2.7)
2*data

#8. Generate a sequence for the following scenario:

#8.1 R code for generating sequence of integers from 1 to 100.
seq(1:100)

#8.2
seq(20:60)

#8.3 R code for getting the mean of integers from 20 to 60.
mean(20:60)

#8.4 R code for getting the sum of integers from 51 to 91.
sum(51:91)

#8.5 R code for sequence of integers from 1 to 1000. 
seq(1:1000)

#8.
  #a. Total data points from 8.1 to 8.4
  sum(100, 41, 41, 41)
  
  #b. R code from 8.1 to 8.4
  seq(1:100)
  seq(20:60)
  mean(20:60)
  sum(51:91)
  
  #c. For 8.5 find only maximum data points until 10.
  max(1:10)
  
#9. R code for getting the integers between 1 and 100 that are not 
#   divisible by 3, 5 and 7 using filter option.
    Filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))
  
#10. A sequence backwards of the integers from 1 to 100.
  sort(1:100, decreasing = TRUE)
  
#11.	Sum of all the natural numbers below 25 that are multiples of 3 or 5.

      naturalnums <- (1:25)
      naturalnums
      sum((naturalnums)[((1:25)%%3 == 0) | ((1:25)%%5 == 0)])

#12. The output is an error for the reason that no value is assigned to 
#     object x and there is no object x after the operator plus.
      { x <- 0+ x + 5 + }
      
#13. R code for accessing individual elements of an atomic vector, 
#    one generally uses the x[i] construction. 
#    In this problem i replace object x into object score to access individual 
#    elements.
score <- c(72, 86, 92, 63, 88, 89, 91, 92, 75,75, 77)
score[2]
score[3] 
      
  
#14. Create a vector a = c(1,2,NA,4,NA,6,7) and
#    change the NA to 999 using the codes print(a,na.print="-999").
# R code:
  a = c(1,2,NA,4,NA,6,7)
  print(a,na.print="-999")
  
#15. This R code will ask your name and age. 
#    It will also display both in the final result.
  
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ") 
print(paste("My name is",name, "and I am",age ,"years old.")) 
print(R.version.string)
  
  
  
