library(shiny)
suppressPackageStartupMessages({
  library(tidyverse)
  library(stringr)
})

#' Source ngram matching function
source("ngram.R")

#' Define UI f
ui <- fluidPage(

  # Application title
  titlePanel("Next word Prediction Model"),
  p("This shiny that takes an  phrase that has been inputted (could be multiple words) in a text box and then outputs a prediction of the next word."),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h2("Instructions:"),
      h5("1. Enter a word or words in the text box."),
      h5("2. The predicted next word prints underneath it in blue."),
      h5("3. A question mark means no prediction given"),
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("predict",
                 textInput("user_input", h3("Your Input:"),
                           value = "Your words"),
                 h3("Predicted Next Word:"),
                 h4(em(span(textOutput("ngram_output"), style="color:blue")))),

      )
    )
  )
)
