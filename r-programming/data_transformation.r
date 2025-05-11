## install packages
install.packages("dplyr")

## load package
library(dplyr)

## read csv file into RStudio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE)

View(imdb)

## review data structure
glimpse(imdb)

## print head (default = first 6 row) and tail of data
head(imdb)
head(imdb, 10)
tail(imdb)
tail(imdb, 10)

## select column
head(imdb)
names(imdb)
# first argument is data, after that is column name
select(imdb, MOVIE_NAME, RATING)
# use index instead of column name
select(imdb, 1, 5)
#rename column by newname = original name
select(imdb, movie_name = MOVIE_NAME, release_year = YEAR)

## pipe operator
head(imdb)
imdb %>% 
  select(movie_name = MOVIE_NAME, release_year = YEAR)
# it is like you pull of df and then putback to the first argument
imdb %>% 
  select(movie_name = MOVIE_NAME, release_year = YEAR) %>% head(10)
# select column then thow to the new function like head
# create data pipeline and throw the result to next function

## filter data
filter(imdb, SCORE >= 9.0)
# use pipe operator
imdb %>% filter (SCORE >= 9.0)

# change column name
names(imdb) <- tolower(names(imdb))

# select then filter
imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9)

# more than 1 condition
imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000)

# or operator
imdb %>%
  select(movie_name, year, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9.0)

# shortcut for or
imdb %>%
  select(movie_name, year, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

## filter string character
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(rating == "PG-13")

# but filter only exact match
# some row has more than one genre
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))

imdb %>%
  select(movie_name) %>%
  filter(grepl("The", imdb$movie_name))

## create new columns
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film","Short Film")) %>%
  head(10)
  
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_update = score + 0.1) %>%
  head(10)

## create in same column it will show only updated column
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score = score + 0.1) %>%
  head(10)

## arrange data
head(imdb)

imdb %>%
  arrange(length) %>%
  head(10)

# descending order
imdb %>%
  arrange(desc(length)) %>%
  head(10)

imdb %>%
  arrange(rating, desc(length))
  head ()
  
## summarise and group_by
imdb %>%
  summarise(mean_length = mean(length))

## can sunnarise more than one
## stat_name = function_name(column_name)
imdb %>%
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())

imdb %>%
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())

## filter blank
imdb %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())


## join data

favourite_files <- data.frame(id = c(5, 10, 25, 30, 98))

favourite_files %>% 
  inner_join(imdb, by = c("id" = "no"))

## write csv file (export result)
imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)

## need to put in object
imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)

imdb_prep <- imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)

## export-file
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)
          
          
