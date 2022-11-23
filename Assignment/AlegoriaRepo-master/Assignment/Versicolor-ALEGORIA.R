#--------------------------------------------------------------
#                         VERSICOLOR
#--------------------------------------------------------------

#1. Data(iris)

data <- data.frame(iris)
data


#2. Subset the iris set into 3 files per-species.

subset2 <- subset(data, Species == 'versicolor' )
subset2


#3. Get total mean for each species.

sepalL <- iris$Sepal.Length[51:100]
sepalL

sepalW <- iris$Sepal.Width[51:100]
sepalW 

petalL <- iris$Petal.Length[51:100]
petalL

petalW <- iris$Petal.Width[51:100]
petalW

versicolor <- c(sepalL, sepalW, petalL, petalW)
versicolor

mean(versicolor)


#4. Get the mean of each characteristics of the 
#   species using mean().

mean(sepalL)
mean(sepalW)
mean(petalL)
mean(petalW)

