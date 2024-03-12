library(tidyverse)
library(lubridate)
library(ggplot2)

# Load the dataset
covid_data <- read.csv("synthetic_covid_data_realistic.csv")

# Convert Date column to Date type
covid_data$Date <- as.Date(covid_data$Date)

# Growth curve of cases and deaths for each country
covid_data %>%
  gather(key = "Condition", value = "Count", Cases, Deaths) %>%
  group_by(Country, Condition) %>%
  mutate(CumulativeCount = cumsum(Count)) %>%
  ggplot(aes(x = Date, y = CumulativeCount, color = Country)) +
  geom_line() +
  facet_wrap(~Condition, scales = "free_y") +
  labs(title = "Growth Curve of COVID-19 Cases and Deaths",
       x = "Date",
       y = "Cumulative Count") +
  theme_minimal()
