#--------------------------------------------------------------
#                           SETOSA
#--------------------------------------------------------------

#1. Data(iris)

data <- data.frame(iris)
data


#2. Subset the iris set into 3 files per-species.

subset1 <- subset(data, Species == 'setosa' )
subset1


#3. Get total mean for each species.

sepalL <- iris$Sepal.Length[1:50]
sepalL

sepalW <- iris$Sepal.Width[1:50]
sepalW 

petalL <- iris$Petal.Length[1:50]
petalL

petalW <- iris$Petal.Width[1:50]
petalW

setosa <- c(sepalL, sepalW, petalL, petalW)
setosa

mean(setosa)


#4. Get the mean of each characteristics of the species 
#   using mean().

mean(sepalL) 
mean(sepalW)
mean(petalL)
mean(petalW)

