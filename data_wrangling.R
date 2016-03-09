leprosy <- remove_no_data(read.csv("data/Leprosy.csv", stringsAsFactors = FALSE))
leishmaniasis <- remove_no_data(read.csv("data/Leishmaniasis.csv", stringsAsFactors = FALSE))
malaria <- remove_no_data(read.csv("data/Malaria.csv", stringsAsFactors = FALSE))
HAT <- remove_no_data(read.csv("data/Human_African_Trypanosomiasis.csv", stringsAsFactors = FALSE))
onchocerciasis <- remove_no_data(read.csv("data/Onchocerciasis.csv", stringsAsFactors = FALSE))
buruli_ulcer <- remove_no_data(read.csv("data/Buruli_Ulcer.csv", stringsAsFactors = FALSE))

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