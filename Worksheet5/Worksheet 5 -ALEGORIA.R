#-------------------------------------------------------------------------------
#                               Worksheet 5
#-------------------------------------------------------------------------------

#1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.

#Course Year 2019 - 2020
#  1st     |     80      
#  2nd     |     75     
#  3rd     |     70       
#  4th     |     60       

#a. Plot the data using a bar graph. Write the codes and copy the result.

date1 <- c("1st", "2nd", "3rd", "4th")
date2 <- c(80,75,70,60)

graph<- barplot(date2, names.arg = date1, col = "green")


#b. Using the same table, label the barchart with
#Title = ” Enrollment of BS Computer Science
#horizontal axis = “Curriculum Year” and
#vertical axis = “number of students”

graph<- barplot(date2, names.arg = date1, 
                main = "Enrollment of BS Computer Science", 
                ylab = "Number of Students", xlab = "Curriculum Year", 
                col = "green")


#2. The monthly income of De Jesus family was spent on the following:
#   60% on Food, 10% on electricity, 5% for savings, and
#   25% for other miscellaneous expenses.

#a. Create a table for the above scenario.
#   Write the codes and its result.

  expences <- c("Food", "Electricity", "Savings", "Miscellaneous_expenses")
  spent <- c(60, 10, 5, 25)

Mdata <- data.frame(expences, spent)
Mdata
Mdata2 <- table(Mdata)
Mdata2

#b. Plot the data using a pie chart. Add labels, colors and legend.
#   Write the codes and its result.

pie_data <- c( 60, 10, 5, 25)

Pdata <- round(pie_data/sum(pie_data)*100,1)
Pdata <- paste(Pdata, "%", sep = " ")

piechart <- pie( pie_data, labels = Pdata, cex = 0.5, col = rainbow(4), main = 
                   "De Jesus Family Monthly Expenses")
legend("topright", c("Food", "Electricity", "Savings", "Miscellaneous"),
       cex = 0.5 , fill =rainbow(4))
    
#3. Open the mtcars dataset.
    
data("mtcars")
dset <- mtcars$mpg
dset
    

#a. Create a simple histogram specifically for mpg (miles per gallon) variable.
#   Use $ to select the mpg only. Write the codes and its result.
#   Note: breaks= controls the number of bins.

dataset1 <-hist(dset, xlab="Miles Per Gallon",
                  main="Histogram of mpg")
    
    
#b. Colored histogram with different number of bins.
dataset2 <-hist(dset, breaks=12, col="red", xlab="Miles Per Gallon",
                  main="Histogram of MPG")
    
    
#c. Add a Normal Curve. Copy the result.
    
dataset3 <-hist(dset, breaks=12, col="red", xlab="Miles Per Gallon",
         main="Histogram with Normal Curve")
         xfit<-seq(min(dset),max(dset),length=40)
         yfit<-dnorm(xfit,mean=mean(dset),sd=sd(dset))
         yfit <- yfit*diff(dataset3$mids[1:2])*length(dset)
         lines(xfit, yfit, col="blue", lwd=2)
    
    
#4. Open the iris dataset. Create a subset for each species.
    
#a. Write the codes and its result.
         
data("iris")
seto <- subset(iris, Species == "setosa")
versi <- subset(iris, Species == "versicolor")
virgi <- subset(iris, Species == "virginica")
    

#b. Get the mean for every characteristics of each species using colMeans().
#   Write the codes and its result.
    
#   Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])
    
seto <- subset(iris, Species == "setosa")
setosa <- colMeans(seto[sapply(seto,is.numeric)])
setosa

versi <- subset(iris, Species == "versicolor")
versicolor <- colMeans(versi[sapply(versi,is.numeric)])
versicolor

virgi <- subset(iris, Species == "virginica")
virginica <- colMeans(virgi[sapply(virgi,is.numeric)])
virginica
    
#c. Combine all species by using rbind()
#   The table should be look like this:

#   Sepal.Length Sepal.Width Petal.Length Petal.Width
#   setosa
#   versicolor
#   virginica
    
table <- rbind(setosa, versicolor, virginica)
table
    
    
#d. From the data in 4-c: Create the barplot().
#   Write the codes and its result.
#   The barplot should be like this.

barplot(table, beside = TRUE,
        main = "Iris Mean",
        xlab = "Characteristics",
        ylab = "Mean Scores",
        col = c("red","green","blue"))

    #Figure 1: Iris Data using Barplot
    
