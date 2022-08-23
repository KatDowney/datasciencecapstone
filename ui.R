
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Next Word Prediction"),
  h6("it may take several seconds"),

  # Sidebar with a slider input for number of n gram
  sidebarLayout(
    sidebarPanel(

      sliderInput(
        inputId =  "Ngram",
        label = "Select N fsor Ngram:",
        min = 1,
        max = 20,
        value = 3,
        step = 1
      ),
      textInput("inputString", "Enter a word or multiple words here",value = "Shall I"),
      submitButton("Submit", icon("refresh"))

    ),
    mainPanel(
      h2("Predicted Next Word"),
      strong("Entered Word(s):"),
      tags$style(type='text/css', '#text1 {background-color: rgba(255,255,0,0.40); color: blue;}'),
      textOutput('text1'),
      br(),
      strong("Predicted Word Options:"),
      textOutput("prediction"),
      br(),
      strong("What n-gram are we using?:"),
      tags$style(type='text/css', '#text2 {background-color: rgba(255,255,0,0.40); color: black;}'),
      textOutput('text2')
    )
  )
))
