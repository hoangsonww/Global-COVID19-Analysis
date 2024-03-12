library(tidyverse)
library(lubridate)
library(ggplot2)

# Load the dataset
covid_data <- read.csv("synthetic_covid_data_realistic.csv")

# Convert Date column to Date type
covid_data$Date <- as.Date(covid_data$Date)

# Vaccination rate visualization
covid_data %>%
  select(Country, Date, Vaccination) %>%
  group_by(Country) %>%
  mutate(PercentageVaccinated = Vaccination / max(Vaccination) * 100) %>%
  ggplot(aes(x = Date, y = PercentageVaccinated, color = Country)) +
  geom_line() +
  labs(title = "COVID-19 Vaccination Progress by Country",
       x = "Date",
       y = "Percentage of Population Vaccinated") +
  theme_minimal()
