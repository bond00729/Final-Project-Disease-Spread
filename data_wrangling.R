leprosy <- remove_no_data(read.csv("data/Leprosy.csv"))
leishmaniasis <- remove_no_data(read.csv("data/Leishmaniasis.csv"))
malaria <- remove_no_data(read.csv("data/Malaria.csv"))
HAT <- remove_no_data(read.csv("data/Human_African_Trypanosomiasis.csv"))
onchocerciasis <- remove_no_data(read.csv("data/Onchocerciasis.csv"))

buruli_ulcer <- remove_no_data(read.csv("data/Buruli_Ulcer.csv")) %>% 
  mutate(Code = c('AGO', 'AUS', 'BEN', 'BRA', 'BFA', 'CIV', 'CMR', 'CAF', 'CHN', 
                  'COG', 'COD', 'GNQ', 'GAB', 'GHA', 'GIN', 'IDN', 'JPN', 'KEN', 
                  'KIR', 'LBR', 'MWI', 'MYS', 'MEX', 'NGA', 'PNG', 'PER', 'SEN', 
                  'SLE', 'SSD', 'LKA', 'SUR', 'TGO', 'UGA'))

Codes <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')

remove_no_data <- function(df) {
  for (i in 1:nrow(df)) {
    for (j in 1:ncol(df)) {
      if(df[i, j] == "No data" || df[i, j] == "" || df[i, j] == 'No PC required') {
        df[i, j] = NA
      }
    }
  }
  return(df)
}