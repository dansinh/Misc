# Load packages
library(rvest)
library(tidyverse)

# Scrap data from Wiki page
house <- read_html("https://en.wikipedia.org/wiki/Current_members_of_the_United_States_House_of_Representatives")
reps <- house %>%
  html_node("#mw-content-text > div > table:nth-child(18)") %>%
  html_table()
reps <- reps[, -c(3)]

senate <- read_html("https://en.wikipedia.org/wiki/Current_members_of_the_United_States_Senate")
senators <- senate %>%
  html_node("#mw-content-text > div > table:nth-child(16)") %>%
  html_table()
senators <- senators[, c(2, 4:8)]

# Save results
save.image("Congress.RData")
