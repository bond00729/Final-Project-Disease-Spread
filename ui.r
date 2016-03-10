#UI for final project

#Setup and installation
library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(theme = "bootstrap.css",
      
      #Adding CSS to webpage
      tags$head(
        tags$style(HTML("
          @import url('//fonts.googleapis.com/css?family=Hind:400,900');

          h1, h2 {
            font-family: 'Hind', serif;
            text-align: center;
          }

          h1 {
            font-weight: 700;
          }

          h2 {
            font-weight: 400;
            font-size: 16pt;
          }
          
          h4 {
            font-style: italic
          }

          .help-block {
            font-size: 11pt;
          }
          
          .plot-container plotly > div{
            width: 75%
          }
  
          p {
            margin-top: 20px;
            margin-left: 15%;
            margin-right: 15%;
            margin-bottom: 20px;
          }

          .control-label {
            font-size: 16pt
          }
       ")),
        tags$title("Spread of Diseases Worldwide")
      ),
                  
      #Main title panel
      tags$h1("Spread of Diseases Worldwide (2005-2013)"),
      tags$p("Using data from the World Health Organization (WHO), we have created visual representations of
             diseases that affect people worldwide. Using the data, we have been able to answer many of our
             own questions, such as where the diseases occur most frequently, if downward
             trends have been occuring, and more. With this tool we've created, anyone can find answers to
             many of their own questions regarding diseases throughout the world."),
      #Declared a sidebar layout
      sidebarLayout(
        
      #Added sidebar elements in here
      sidebarPanel(
        sliderInput("Year", "Year", min = 2005, max = 2013, value = 2005, sep = ""),
        selectInput("disease1", label = h3("Choose a disease"), 
                    choices = list("Buruli Ulcer" = "Buruli_Ulcer", "Human African Trypanosomiasis" = "Human_African_Trypanosomiasis", 
                   "Leishmaniasis" = "Leishmaniasis", "Leprosy" = "Leprosy",
                   "Malaria" = "Malaria", "Onchocerciasis" = "Onchocerciasis"), 
        selected = "Buruli_Ulcer"),
        tags$br(),
        tags$h4("About"),
        uiOutput('description1'),
        tags$br(),
        selectInput("disease2", label = h3("Choose another disease"), 
                    choices = list("Buruli Ulcer" = "Buruli_Ulcer", "Human African Trypanosomiasis" = "Human_African_Trypanosomiasis", 
                                   "Leishmaniasis" = "Leishmaniasis", "Leprosy" = "Leprosy",
                                   "Malaria" = "Malaria", "Onchocerciasis" = "Onchocerciasis"), 
                    selected = "Human_African_Trypanosomiasis"),
        tags$br(),
        tags$h4("About"),
        uiOutput('description2'),
        tags$br(),
        tags$br()
    ),
    
    #Put main stuff in here
    mainPanel(
      plotlyOutput('map'),
      tags$br(),
      plotlyOutput('map2')
    )
  )
))