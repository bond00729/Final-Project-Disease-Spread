leprosy <- remove_no_data(read.csv("data/Leprosy.csv"))
leishmaniasis <- remove_no_data(read.csv("data/Leishmaniasis.csv"))
malaria <- remove_no_data(read.csv("data/Malaria.csv"))
HAT <- remove_no_data(read.csv("data/Human_African_Trypanosomiasis.csv"))
onchocerciasis <- remove_no_data(read.csv("data/Onchocerciasis.csv"))
buruli_ulcer <- remove_no_data(read.csv("data/Buruli_Ulcer.csv"))


remove_no_data <- function(df) {
  for (i in 1:nrow(df)) {
    for (j in 1:ncol(df)) {
      if(df[i, j] == "No data" || df[i, j] == "") {
        df[i, j] = NA
      }
    }
  }
  return(df)
}