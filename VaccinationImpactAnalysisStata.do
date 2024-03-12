* Generate per capita metrics for cases, deaths, and vaccination rates
gen CasesPerCapita = Cases / 100000
gen DeathsPerCapita = Deaths / 100000
gen VaccinationRate = Vaccination / 100000

* Scatter plot for vaccination rate vs. cases per capita by country
scatter CasesPerCapita VaccinationRate, by(Country) title("Vaccination Rate vs. Cases Per Capita by Country")
graph export "vaccination_vs_cases_per_capita_stata.png", replace

* Scatter plot for vaccination rate vs. deaths per capita by country
scatter DeathsPerCapita VaccinationRate, by(Country) title("Vaccination Rate vs. Deaths Per Capita by Country")
graph export "vaccination_vs_deaths_per_capita_stata.png", replace
