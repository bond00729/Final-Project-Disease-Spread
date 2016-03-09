#UI for final project

#Setup and installation
library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  #Main title panel
  titlePanel("Spread of Diseases Worldwide"),
  
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
      uiOutput('description1'),
      selectInput("disease2", label = h3("Choose another disease"), 
                  choices = list("Buruli Ulcer" = "Buruli_Ulcer", "Human African Trypanosomiasis" = "Human_African_Trypanosomiasis", 
                                 "Leishmaniasis" = "Leishmaniasis", "Leprosy" = "Leprosy",
                                 "Malaria" = "Malaria", "Onchocerciasis" = "Onchocerciasis"), 
                  selected = "Human_African_Trypanosomiasis"),
      uiOutput('description2')
      
    ),
    
    #Put main stuff in here
    mainPanel(
      plotlyOutput('map'),
      plotlyOutput('map2')
    )
  )
))