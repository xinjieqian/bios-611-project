library(tidyverse)


df <- read_csv("source_data/hotel_bookings.csv")
df[is.na(df)] = 0

df %>% write_csv("derived_data/hotel_bookings_preprocessed.csv")


df1 = df %>% select(-country,-agent,-company,-arrival_date_year,-arrival_date_month,
                   -arrival_date_day_of_month,-babies,-meal,
                   -market_segment,-distribution_channel,-customer_type,
                   -reservation_status,-reserved_room_type,-assigned_room_type,
                   -reservation_status_date)

df1 %>% write_csv("derived_data/hotel_bookings_preprocessed1.csv")