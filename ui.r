#UI for final project

#Setup and installation
library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(theme = "bootstrap.css",
      
      #Adding CSS to webpage
      tags$head(
        tags$style(HTML("
          @import url('//fonts.googleapis.com/css?family=Cinzel:400,900');
          
          h1, h2 {
            font-family: 'Cinzel', serif;
            text-align: center;
          }

          h1 {
            font-weight: 700;
          }

          h2 {
            font-weight: 400;
            font-size: 16pt;
          }
          
          .help-block {
            font-size: 11pt;
          }
          
          .plot-container plotly > div{
            width: 75%
          }

          .control-label {
            font-size: 16pt
          }
       ")),
        tags$title("Spread of Diseases Worldwide")
      ),
                  
      #Main title panel
      tags$h1("Spread of Diseases Worldwide (2005-2013)"),
      headerPanel(h2("By Brandon Mar, Brendan Powers, Matthew Bond, and Markos Mezegbu")),
      tags$p("hello world"),
      #Declared a sidebar layout
      sidebarLayout(
        
      #Added sidebar elements in here
      sidebarPanel(
        sliderInput("Year", "Year:", min = 2005, max = 2013, value = 2005, sep = ""),
        selectInput("disease1", label = h3("Choose a disease"), 
                    choices = list("Buruli Ulcer" = "Buruli_Ulcer", "Human African Trypanosomiasis" = "Human_African_Trypanosomiasis", 
                   "Leishmaniasis" = "Leishmaniasis", "Leprosy" = "Leprosy",
                   "Malaria" = "Malaria", "Onchocerciasis" = "Onchocerciasis"), 
        selected = "Buruli_Ulcer"),
        tags$br(),
        uiOutput('description1'),
        
        tags$br(),
        tags$br(),
        selectInput("disease2", label = h3("Choose another disease"), 
                    choices = list("Buruli Ulcer" = "Buruli_Ulcer", "Human African Trypanosomiasis" = "Human_African_Trypanosomiasis", 
                                   "Leishmaniasis" = "Leishmaniasis", "Leprosy" = "Leprosy",
                                   "Malaria" = "Malaria", "Onchocerciasis" = "Onchocerciasis"), 
                    selected = "Human_African_Trypanosomiasis"),
        tags$br(),
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