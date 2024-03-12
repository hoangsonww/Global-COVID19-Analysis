library(tidyverse)
library(lubridate)
library(forecast)
library(ggplot2)

# Load the dataset
covid_data <- read.csv("synthetic_covid_data_realistic.csv")

# Preprocessing
covid_data$Date <- as.Date(covid_data$Date)
selected_country_data <- filter(covid_data, Country == "United States")

# Time Series Decomposition
cases_ts <- ts(selected_country_data$Cases, frequency = 12)
decomposed_cases <- stl(cases_ts, s.window = "periodic")
plot(decomposed_cases)

# Autocorrelation Analysis
acf(cases_ts)
pacf(cases_ts)

# Save the decomposition plot and ACF, PACF plots
ggsave("cases_decomposition.png")
ggsave("cases_acf_pacf.png")
