library(tidyverse)


df <- read_csv("source_data/hotel_bookings.csv")
df[is.na(df)] = 0
df %>% write_csv("derived_data/hotel_bookings_preprocessed.csv")


