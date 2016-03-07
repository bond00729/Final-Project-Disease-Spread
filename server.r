#Server for final project

#Setup and installation
library(plotly)
library(shiny)
library(dplyr)


shinyServer(function(input, output) {
  output$map <- renderPlotly({ 
    
  })
})