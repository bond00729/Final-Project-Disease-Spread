#UI for final project

#Setup and installation
library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  # Main title panel
  titlePanel("World Disease Spread"),
  
  # Declare a sidebar layout
  sidebarLayout(
    
    # Put sidebar elements in here
    sidebarPanel(
      selectInput("dis", label = h3("Disease"), 
                  choices = list(), 
                  selected = '')
    ),
    
    #Put main stuff in here
    mainPanel(
      plotlyOutput('map')
    )
  )
))