library(tidyverse)
library(ggplot2)


hotel_data1 <- read_csv("derived_data/hotel_bookings_preprocessed.csv")
plot1 <- ggplot(hotel_data1, aes(x=arrival_date_year,fill=hotel))+
         geom_bar()

plot2<- hotel_data1 %>%
  mutate(arrival_date_month = factor(arrival_date_month, #factor categorizes the data, stores as levels.
                                     levels = month.name
  )) %>%
  count(hotel, arrival_date_month,) %>%
  group_by(hotel) %>%
  mutate(proportion = n / sum(n)) %>%
  ggplot(aes(arrival_date_month, proportion,fill= arrival_date_month)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::percent_format())+
  facet_wrap(~hotel, nrow = 2)



ggsave("figures/city_hotel_vs_resort_hotel.png",plot=plot1)
ggsave("figures/city_hotel_vs_resort_hotel_month.png",plot=plot2)
