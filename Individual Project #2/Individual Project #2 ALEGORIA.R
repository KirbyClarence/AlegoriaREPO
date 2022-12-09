#-------------------------------------------------------------------------------
#                           Individual Project #2
#-------------------------------------------------------------------------------

# Extract 10000 tweets from Twitter using twitteR package including retweets.
# Subset the retweets and the original tweets into a separate file
# Plot the retweets and the original tweets using bar graph in vertical manner.
# Include legends


library(wordcloud)
library(plotly)
library(tm)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(twitteR)

# Keys & Tokens.
CONSUMER_KEY <- "hEcNuzgnHrshkQgxRZZqZU4UP"
CONSUMER_SECRET <- "NjQoP9cmAl7DnvGXGq4d23QEb6kz5GByRWJ1Zl0iEsPHvYtcPC"
ACCESS_TOKEN <-  "1595059769857171456-TO716H2jwL0mAsNYqw6Ap1NE6bNyFX"
ACCESS_SECRET <-  "TTdaYHcKFAFKMigtV5V7QorRSExCVmuNihaX9k9DHw5H1"

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)


# Extracting MESSI Tweets.
messiTweets <- searchTwitter("#MESSI", n=10000, lang="en", since="2022-12-2", 
                             until="2022-12-9", retryOnRateLimit = 120)
messiTweets

 
# Converting List Data to Data Frame.
messiTweetsDF <- twListToDF(messiTweets)


# Save Data Frame File.
save(messiTweetsDF,file = "MessiTweetsDF.Rdata")


# Load Data Frame File.
load(file = "MessiTweetsDF.Rdata")


# Checking For Missing Values In a Data Frame.
sappData <- sapply(messiTweetsDF, function(x) sum(is.na(x)))
sappData


#Tweets
# Subsetting Using the dplyr() Package.
twEEts <- messiTweetsDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
twEEts


# Grouping the Data Created.
twEEts %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt_data <- twEEts %>%  mutate(Created_At_Round = created %>% 
                                 round(units = 'hours') %>% as.POSIXct())
crt_data

mini <- twEEts %>% pull(created) %>% min()
mini 
maxi <- twEEts %>% pull(created) %>% max()
maxi


# Plot on tweets by time using the library(plotly) and ggplot().
plotData <- ggplot(crt_data, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

plotData %>% ggplotly()

#-------------------------------------------------------------------------------

#Retweets

subtwEEts <- messiTweetsDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
subtwEEts


# Grouping the Data Created.
subtwEEts %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt2 <- subtwEEts %>%  mutate(Created_At_Round = created %>% 
                              round(units = 'hours') %>% as.POSIXct())
crt2

mini <- subtwEEts %>% pull(created) %>% min()
mini 
maxi <- subtwEEts %>% pull(created) %>% max()
maxi


# Plot on tweets by time using the library(plotly) and ggplot().
plotData <- ggplot(crt2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

plotData %>% ggplotly()

