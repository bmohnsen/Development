##ui.R
library(shiny)
shinyUI(
     pageWithSidebar(
          headerPanel("Short Essay Scoring"),
          sidebarPanel(
               h3('Scoring Prediction'),
               h4('You entered'),
               verbatimTextOutput("answer"),
               h4('The score for this entry is '),
               verbatimTextOutput("score")
          ),
     
          mainPanel(
               textInput('answer', 'What are two or more things you can do to create open space in an invasion sport? After entering your response, click on the Submit button to see your score.'),
               tags$style(type="text/css", "#answer {height:200px;}"),
               submitButton('Submit')
          )
     

     )
)