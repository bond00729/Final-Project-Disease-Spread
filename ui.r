#UI for final project

#Setup and installation
library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  # Main title panel
  titlePanel("Spread of Diseases Worldwide"),
  
  # Declare a sidebar layout
  sidebarLayout(
    
    # Put sidebar elements in here
    sidebarPanel(
      sliderInput("Year", "Year:", min = 1991, max = 2014, value = 2000),
      checkboxGroupInput("Disease", label = h3("Disease"), 
                         choices = c("Buruli Ulcer" = "Buruli Ulcer",
                                     "Black Fever (Leishmaniasis)" = "Leishmaniasis",
                                     "HAT" = "HAT",
                                     "Leprosy" = "Leprosy",
                                     "Malaria" = "Malaria",
                                     "River Blindness" = "River Blindness"))
    ),
    
    #Put main stuff in here
    mainPanel(
    )
  )
))