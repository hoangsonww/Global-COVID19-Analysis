library(tidyverse)
library(lubridate)
library(forecast)
library(ggplot2)

# Load the dataset
covid_data <- read.csv("synthetic_covid_data_realistic.csv")

# Preprocessing
covid_data$Date <- as.Date(covid_data$Date)
vaccination_data <- filter(covid_data, Country == "India") %>%
  select(Date, Vaccination) %>%
  arrange(Date)

# Create a time series object
vaccination_ts <- ts(vaccination_data$Vaccination, start = c(2020, 1), frequency = 12)

# Split data into training and test sets
train_end <- length(vaccination_ts) * 0.8
train_ts <- window(vaccination_ts, end = train_end)
test_ts <- window(vaccination_ts, start = train_end + 1)

# Linear Model
lm_model <- tslm(train_ts ~ trend)
summary(lm_model)

# ARIMA Model
auto_arima_model <- auto.arima(train_ts, seasonal = TRUE)
summary(auto_arima_model)

# Forecasting
lm_forecast <- forecast(lm_model, h = length(test_ts))
auto_arima_forecast <- forecast(auto_arima_model, h = length(test_ts))

# Plot the forecasts
plot(lm_forecast)
lines(auto_arima_forecast$fitted, col = 'red')
legend("topright", legend=c("LM Forecast", "ARIMA Forecast"), col=c("black", "red"), lty=1)

# Save the forecast plot
ggsave("vaccination_forecast_comparison.png")
