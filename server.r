#Server for final project

#Setup and installation
library(plotly)
library(shiny)
library(dplyr)
source("data_wrangling.R")

plotDisease <- function(df, year, dfName){
  # light grey boundaries
  l <- list(color = toRGB("black"), width = 0.5)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = TRUE,
    projection = list(type = 'Mercator')
  )
  
  plot_ly(na.omit(df), z = as.numeric(eval(parse(text = year))), text = as.vector(Country), locations = as.vector(Country), locationmode = 'country names', type = 'choropleth',
          color = as.numeric(eval(parse(text = year))), colors = 'Reds', marker = list(line = l),
          colorbar = list(title = 'Number of Cases')) %>%
    layout(title = gsub('_', ' ', dfName, fixed = TRUE),
           geo = g)
}

shinyServer(function(input, output) {
  
  BuruliDesc <- 'Buruli ulcer is a disease caused by infection with the organism Mycobacterium ulcerans mainly affecting 
  skin but also affecting bone in certain cases. It's found mainly in tropical areas such as West Africa and 
  Australia. It often results in swelling of affected areas, and large ulcers in later stages. (Mayo Clinic)'
  HATDesc <- 'Human African Tyrpanosomiasis is a disease transmitted to human through bites from tsetse flies which are found
  only in rural Africa. Late stages of the disease include behavior changes, confusion, and poor coordination. 
  (Mayo Clinic)'
  LeisDesc <- 'Black Fever is a disease caused by infection spread by sandfly bites affecting internal organs such as the spleen, liver, 
  and bone marrow. It is most common in India. Symptoms may include fever, weight loss, and swelling of spleen or liver. 
  (Mayo Clinic)'
  LepDesc <- 'Leprosy is a rare diseases caused by infection with the bacterium Mycobacterium leprae. 80% of cases are found in India, Indonesia, Myanmar, Brazil, and Nigeria. 
  It mainly affects skin and peripheral and symptoms include pale or red skin lesiobs, reduced sensation, and numbness. (Mayo Clinic)'
  MalDesc <- 'Malaria is a disease caused by a plasmodium parasite, transmitted through mosquito bites. Symptoms are chills, fever, and sweating.
  About half of the world's population is at risk with large areas of Africa, South Asia, South America, the Middle East and others 
  among the most common locations of outbreaks. (Mayo Clinic & Center for Disease Control and Prevention)'
  OnchDesc <- 'Onchocerciasis is a parasitic, tropical disease spread by repeated bites from infected black flies. It's most common in remote African villages. 
  Symptoms usually don't appear for one to two years after infection, but include skin nodules, itching, eye infections, and blindness. (Mayo Clinic)'
  
  createText1 <- eventReactive(input$disease1,  {
    if (input$disease1 == "Buruli_Ulcer") {
      return(BuruliDesc)
    }
    if (input$disease1 == "Human_African_Trypanosomiasis") {
      return(HATDesc)
    }
    if (input$disease1 == "Leishmaniasis") {
      return(LeisDesc)
    }
    if (input$disease1 == "Leprosy") {
      return(LepDesc)
    }
    if (input$disease1 == "Malaria") {
      return(MalDesc)
    }
    if (input$disease1 == "Onchocerciasis") {
      return(OnchDesc)
    }
  })
  
  createText2 <- eventReactive(input$disease2,  {
    if (input$disease2 == "Buruli_Ulcer") {
      return(BuruliDesc)
    }
    if (input$disease2 == "Human_African_Trypanosomiasis") {
      return(HATDesc)
    }
    if (input$disease2 == "Leishmaniasis") {
      return(LeisDesc)
    }
    if (input$disease2 == "Leprosy") {
      return(LepDesc)
    }
    if (input$disease2 == "Malaria") {
      return(MalDesc)
    }
    if (input$disease2 == "Onchocerciasis") {
      return(OnchDesc)
    }
  })
  
  output$map <- renderPlotly({
    A <- paste0('X', input$Year)
    Name1 <- input$disease1
    Dis1 <- eval(parse(text = Name1))
    plotDisease(Dis1, A, Name1)
  })
  
  output$map2 <- renderPlotly({
    B <- paste0('X', input$Year)
    Name2 <- input$disease2
    Dis2 <- eval(parse(text = Name2))
    plotDisease(Dis2, B, Name2)
  })
  
  output$description1 <- renderUI({
    helpText(createText1())
  })
  
  output$description2 <- renderUI({
    helpText(createText2())
  })
})