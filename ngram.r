library(tm)

getCorpus <- function(){
  #Load Data
  con <- file("data/final/en_US/en_US.news.txt", open="r")
  news_text <- readLines(con); close(con)

  con <- file("data/final/en_US/en_US.blogs.txt", open="r")
  blogs_text <- readLines(con); close(con)

  con <- file("data/final/en_US/en_US.twitter.txt", open="r")
  twit_text <- readLines(con); close(con)
  rm(con)

  #Sampling
  set.seed(2510)
  blogs_text <- sample(blogs_text, size =100)
  news_text <- sample(news_text, size = 100)
  twit_text <- sample(twit_text, size = 100)

  # Union corpora
  corpora <- c(news_text,blogs_text,twit_text)
  corpora <-  iconv(corpora, to ="utf-8")
  corpora <- VectorSource(corpora)
  corpora <- VCorpus(corpora)

  corpora <- preprocess(corpora)
  corpora
}

preprocess <- function(text){
  toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
  text <- tm_map(text, toSpace, "/|@|//|$|:|:)|*|&|!|?|_|-|#|")
  text <- tm_map(text, removeNumbers)
  text <- tm_map(text, content_transformer(tolower))
  text <- tm_map(text, removePunctuation)
  text <- tm_map(text, stemDocument)
  text <- tm_map(text, stripWhitespace)
  text
}

saveRDS(getCorpus(),'data/corpus2.RData')

