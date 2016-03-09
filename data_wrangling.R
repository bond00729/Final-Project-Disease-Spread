#data retrieved from WHO database

Leprosy <- remove_no_data(read.csv("data/Leprosy.csv", stringsAsFactors = FALSE))
Leishmaniasis <- remove_no_data(read.csv("data/Leishmaniasis.csv", stringsAsFactors = FALSE))
Malaria <- remove_no_data(read.csv("data/Malaria.csv", stringsAsFactors = FALSE))
Human_African_Trypanosomiasis <- remove_no_data(read.csv("data/Human_African_Trypanosomiasis.csv", stringsAsFactors = FALSE))
Onchocerciasis <- remove_no_data(read.csv("data/Onchocerciasis.csv", stringsAsFactors = FALSE))
Buruli_Ulcer <- remove_no_data(read.csv("data/Buruli_Ulcer.csv", stringsAsFactors = FALSE))

remove_no_data <- function(df) {
  for (i in 1:nrow(df)) {
    for (j in 1:ncol(df)) {
      if(df[i, j] == "No data" || df[i, j] == "" || df[i, j] == 'No PC required') {
        df[i, j] = NA
      }
      df[i, j] <- gsub(' ', '', df[i, j], fixed = TRUE)
    }
  }
  return(df)
}