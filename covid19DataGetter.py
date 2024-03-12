countries = ["United States", "Brazil", "India", "Russia", "United Kingdom"]
country_populations = {"United States": 331002651, "Brazil": 212559417, "India": 1380004385, "Russia": 145934462, "United Kingdom": 67886011}

data_realistic = []

def simulate_cases(start_val, end_val, length):
    return np.abs(np.sin(np.linspace(0, 5, length)) * np.linspace(start_val, end_val, length) + np.random.normal(0, start_val / 10, length)).astype(int)

for country in countries:
    population = country_populations[country]

    cases = simulate_cases(population * 0.0001, population * 0.05, len(dates))
    deaths = (cases * np.random.uniform(0.01, 0.05)).astype(int)
    recovered = (cases - deaths)
    vaccination = np.clip(simulate_cases(0, population, len(dates)), 0, population)

    for date, case, death, recover, vaccinate in zip(dates, cases, deaths, recovered, vaccination):
        data_realistic.append([country, date, case, death, recover, vaccinate])

covid_data_realistic = pd.DataFrame(data_realistic, columns=['Country', 'Date', 'Cases', 'Deaths', 'Recovered', 'Vaccination'])

covid_data_realistic_csv_path = "/mnt/data/synthetic_covid_data_realistic.csv"
covid_data_realistic.to_csv(covid_data_realistic_csv_path, index=False)

covid_data_realistic_csv_path
