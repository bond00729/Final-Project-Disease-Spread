#Server for final project

#Setup and installation
library(plotly)
library(shiny)
library(dplyr)
source("data_wrangling.R")

shinyServer(function(input, output) {
  output$map <- renderPlotly({ 
    
    # light grey boundaries
    l <- list(color = toRGB("black"), width = 0.5)
    
    # specify map projection/options
    g <- list(
      showframe = FALSE,
      showcoastlines = TRUE,
      projection = list(type = 'Mercator')
    )
    
    plot_ly(HAT, z = X2012, text = Country, locations = Country, locationmode = "country names", type = 'choropleth',
            color = X2012, colors = 'Reds', marker = list(line = l),
            colorbar = list(title = 'Number of Cases')) %>%
      layout(title = 'Spread of Diseases Worldwide',
             geo = g)
  })
})