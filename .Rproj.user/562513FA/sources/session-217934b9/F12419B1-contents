
library(dplyr)
library(lubridate)
library(data.table)

calculate_index_price <- function(deals, index_type) {
  
  month_lookup <- setNames(1:12, toupper(month.abb))
  # Add a proper date for delivery based on DELIVERY MONTH and DELIVERY YEAR
  deals <- deals %>%
    mutate(delivery_month_num = month_lookup[toupper(`DELIVERY MONTH`)],
           delivery_date = make_date(`DELIVERY YEAR`, delivery_month_num, 1))
  
  # Filter deals based on index type
  if (index_type == "COAL2") {
    filtered_deals <- deals %>%
      filter(`DELIVERY LOCATION` %in% c("ARA", "AMS", "ROT", "ANT"))
  } else if (index_type == "COAL4") {
    filtered_deals <- deals %>%
      filter(`COMMODITY SOURCE LOCATION` == "South Africa")
  } else {
    stop("Invalid index type")
  }
  
  # Filter deals with delivery within 180 days of the deal date
  filtered_deals <- filtered_deals %>%
    mutate(deal_date = dmy(`DEAL DATE`),
           delivery_within_180_days = delivery_date <= (deal_date + 180)) %>%
    filter(delivery_within_180_days) %>%
    group_by(deal_date=as.character(deal_date)) %>%
    summarise(index_price = sum(PRICE * VOLUME) / sum(VOLUME), .groups = 'drop')
  
  return(filtered_deals)
}