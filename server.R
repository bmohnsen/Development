##server.R
library(shiny)
library(SnowballC)
library(tm)
library(stats)
library(plyr)
load("model1.rda")
scoring <- function(answer) {
     temp <- read.table("temp.txt")
     ans_df <- t(temp)
     colnames(ans_df) <- ans_df[1,]
     ans_df = ans_df[-1,]
     
     answer <- removePunctuation(answer)
     answer <- tolower(answer)
     review_source <- VectorSource(answer)
     corpus <- Corpus(review_source)
     corpus <- tm_map(corpus, removeWords, stopwords("english"))
     corpus <- tm_map(corpus, stemDocument)
     ans <- DocumentTermMatrix(corpus)
     ans2 <- as.matrix(ans)
     ans3 <- as.data.frame(ans2)
     
     ans_df1 <- as.data.frame(ans_df)
     ans_test <- rbind.fill(ans_df1, ans3)
     cols <- c(1:ncol(ans_test))
     ans_test[cols] <- as.numeric(as.matrix(ans_test[cols]))
     ans_test[is.na(ans_test)] <- 0   
     score <- predict(model1, ans_test)
     
     score <- round(score)
     score
}
     
shinyServer(
     function(input,output) {
          output$answer <- renderPrint({input$answer})
          output$score <- renderPrint({scoring(input$answer)})
     }
          
)


