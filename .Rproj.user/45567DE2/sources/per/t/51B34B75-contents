library(tidyverse)
library(lubridate)
library(ggplot2)

# Load the dataset
covid_data <- read.csv("synthetic_covid_data_realistic.csv")

# Convert Date to Date type and calculate per capita metrics
covid_data$Date <- as.Date(covid_data$Date)
covid_data <- covid_data %>%
  mutate(CasesPerCapita = Cases / 100000,
         DeathsPerCapita = Deaths / 100000,
         VaccinationRate = Vaccination / 100000)

# Plot vaccination rates vs. cases/deaths per capita
ggplot(covid_data, aes(x=VaccinationRate, y=CasesPerCapita, color=Country)) +
  geom_point(alpha=0.5) +
  geom_smooth(method="lm") +
  facet_wrap(~Country, scales="free") +
  theme_minimal() +
  labs(title="Vaccination Rate vs. Cases Per Capita by Country",
       x="Vaccination Rate (per 100,000 people)",
       y="Cases Per Capita")

# Additionally, for deaths per capita
ggplot(covid_data, aes(x=VaccinationRate, y=DeathsPerCapita, color=Country)) +
  geom_point(alpha=0.5) +
  geom_smooth(method="lm") +
  facet_wrap(~Country, scales="free") +
  theme_minimal() +
  labs(title="Vaccination Rate vs. Deaths Per Capita by Country",
       x="Vaccination Rate (per 100,000 people)",
       y="Deaths Per Capita")

# Save the plots
ggsave("vaccination_vs_cases_per_capita.png", width=10, height=6)
ggsave("vaccination_vs_deaths_per_capita.png", width=10, height=6)
