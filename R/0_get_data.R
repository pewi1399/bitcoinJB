library(dplyr)
library(jsonlite)
bitcoin <- read.csv2("data/golddata.csv", header = TRUE)

names(bitcoin) <- c("Date", "ClosePrice")

bitcoin <-
  bitcoin %>% 
  filter(!is.na(ClosePrice))

bitcoin$Date <- substr(as.character(bitcoin$Date), 1, 10)

writeLines(paste0("var data = ", toJSON(bitcoin)), "data/coindata.js")
