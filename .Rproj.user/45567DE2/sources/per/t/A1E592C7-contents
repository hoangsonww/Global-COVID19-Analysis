library(tidyverse)
library(lubridate)
library(ggplot2)

# Load the dataset
covid_data <- read.csv("synthetic_covid_data_realistic.csv")

# Convert Date to Date type
covid_data$Date <- as.Date(covid_data$Date)

# Plot total cases and deaths over time for each country
covid_data %>%
  gather(key="Condition", value="Count", Cases, Deaths) %>%
  ggplot(aes(x=Date, y=Count, color=Country)) +
  geom_line() +
  facet_wrap(~Condition, scales="free_y") +
  theme_minimal() +
  labs(title="COVID-19 Cases and Deaths Over Time",
       x=NULL, y="Count",
       color="Country")

# Save the plot
ggsave("covid_trends_over_time.png", width=10, height=6)
