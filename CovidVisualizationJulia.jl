using CSV
using DataFrames
using Plots
using Dates

# Load the dataset
covid_data = CSV.read("synthetic_covid_data_realistic.csv", DataFrame)

# Convert Date from String to Date type
covid_data.Date = Date.(covid_data.Date, "yyyy-mm-dd")

# Plot cumulative cases over time for each country
p1 = plot(covid_data.Date, covid_data.Cases, label=covid_data.Country, title="Cumulative COVID-19 Cases Over Time", xlabel="Date", ylabel="Cumulative Cases", legend=:topright)
savefig(p1, "cumulative_cases_julia.png")

p2 = heatmap(vaccination_data.Dates, vaccination_data.Country, vaccination_data.VaccinationRate, title="Vaccination Rates Heatmap")
savefig(p2, "vaccination_rates_heatmap_julia.png")
