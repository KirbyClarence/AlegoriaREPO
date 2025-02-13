#-------------------------------------------------------------------------------
#                                 Worksheet 6
#-------------------------------------------------------------------------------


#Use the dataset mpg

library(ggplot2)
#to get the mpg dataset, load the ggplot package first
data(mpg)
as.data.frame(data(mpg)) #converting from list to data frame

#use of glimpse() - much tidier compared to str()
library(dplyr) #glimpse() is a function under dplyr package

mpgdata <- glimpse(mpg)
as.data.frame(mpgdata)

#Example. graph using ggplot()
ggplot(mpg, aes(cty, hwy)) +
  geom_point()


# 1. How many columns are in mpg dataset? How about the number of rows? 
#    Show the codes and its result.

# There are 234 rows and 11 columns

#Code:
mpgdata <- glimpse(mpg)
as.data.frame(mpgdata) 
nrow(mpgdata)

ncol(mpgdata)


# 2. Which manufacturer has the most models in this data set? Which model has 
#    the most variations? Ans:

manuf_count <- mpgdata %>% group_by(manufacturer) %>%
count()
manuf_count


colnames(manuf_count) <- c("Manufacturer","Counts")
manuf_count

# a. Group the manufacturers and find the unique models. 
#    Copy the codes and result.

unique_mods <- mpgdata %>% group_by(manufacturer, model) %>%
distinct() %>% count()
unique_mods

colnames(unique_mods) <- c("Manufacturer", "Model","Counts")
unique_mods

# b. Graph the result by using plot() and ggplot(). 
#    Write the codes and its result.

qplot(model, data = mpg,geom = "bar", fill=manufacturer)

ggplot(mpg, aes(model, manufacturer)) + geom_point()


# 3. Same dataset will be used. You are going to show the relationship of the 
#    model and the manufacturer.

mpgdata <- mpg
manufmod <- mpgdata %>% group_by(manufacturer, model) %>%
distinct() %>% count()
manufmod

colnames(manufmod) <- c("Manufacturer", "Model")
manufmod

# a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?

ggplot(mpg, aes(model, manufacturer)) + geom_point()

#geometric point graph of mpg(model and manufacturer)

# b. For you, is it useful? If not, how could you modify the data to make it 
#    more informative?

ggplot(mpg, aes(model, manufacturer)) + 
  geom_point() +
  geom_jitter()

# 4. Using the pipe (%>%), group the model and get the number of cars per model. 
#    Show codes and its result.

mpgdataset <- mpgdata %>% group_by(model) %>% count()
mpgdataset

colnames(mpgdataset) <- c("Model","Counts")
mpgdataset

# a. Plot using the geom_bar() + coord_flip() just like what is shown below. 
#    Show codes and its result.

qplot(model,data = mpg,main = "Number of Cars per Model", xlab = "Model",
  ylab = "Number of Cars", geom = "bar", fill = manufacturer) +
  coord_flip()

# b. Use only the top 20 observations. Show code and results.

mpgdataset <- mpg %>% group_by(model)%>%
  tally(sort = TRUE)
mpgdataset


# 5. Plot the relationship between cyl - number of cylinders and 
#    displ - engine displacement using geom_point with aesthetic 
#    colour = engine displacement. Title should be
#    “Relationship between No. of Cylinders and Engine Displacement”.

# a. Show the codes and its result.

ggplot(data = mpg , mapping = aes(x = displ, y = cyl, main = "Relationship 
                                  between No of Cylinders and 
                                  Engine Displacement")) + 
      geom_point(mapping=aes(colour = "engine displacement")) 

# b. How would you describe its relationship?

# Answer:
#    Based on my data, the relationship between cyl and displ is shown through 
#    the jittered graph and the pink dots in a horizontal position represent 
#    the engine displacement. 


# 6. Get the total number of observations for drv - type of drive train 
#    (f = front-wheel drive, r = rear wheel drive, 4 = 4wd) and 
#    class - type of class (Example: suv, 2seater, etc.).

#    Plot using the geom_tile() where the number of observations for class be 
#    used as a fill for aesthetics.
# a. Show the codes and its result for the narrative in #6.

ggplot(data = mpg, mapping = aes(x = drv, y = class)) +
  geom_point(mapping=aes(color=class)) + 
  geom_tile()

# b. Interpret the result.

# Answer:
#    Based on the mapping graph, the drv represents the x-axis, and the class 
#    represents the y-axis. As you noticed, the areas in the graph that are 
#    mapped are occupied by black shades.


# 7. Discuss the difference between these codes. 
#    Its outputs for each are shown below.

# Code #1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))


# Code #2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

  
# 8. Try to run the command ?mpg. What is the result of this command?

?mpg
# Answer:
#    The result of the command shows the data on the help tab about fuel economy 
#    from 1999 to 2008 for 38 popular models.

# a. Which variables from mpg dataset are categorical?

# Answer:
#    The categorical variables in the mpg dataset are manufacturer, model, 
#    trans (type of transmission), drv (front-wheel drive, rear-wheel, 4wd), 
#    fl (fuel type), and class (type of car). 

# b. Which are continuous variables?

# Answer:
#    In contrast, the continuous variables in the mpg dataset are 
#    displ (engine displacement, in litres), year (year of manufacture), 
#    cyl (number of cylinders), cty (city miles per gallon), 
#    and hwy (highway miles per gallon).

# c. Plot the relationship between displ (engine displacement) and hwy
#    (highway miles per gallon). Mapped it with a continuous variable you have 
#    identified in #5-b. What is its result? Why it produced such output?

# Code: 
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()

# Answer: 
#    City miles per gallon, or cty, is a continuous variable. 
#    The continuous variable employs a scale that ranges from light to 
#    dark blue instead of distinct colors.


# 9. Plot the relationship between displ (engine displacement) and hwy
#    (highway miles per gallon) using geom_point(). Add a trend line over the 
#    existing plot using geom_smooth() with se = FALSE. 
#    Default method is “loess”

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE)


# 10. Using the relationship of displ and hwy, add a trend line over 
#     existing plot. Set these = FALSE to remove the confidence interval and 
#     method = lm to check for linear modeling.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE)

