import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
covid_data = pd.read_csv('synthetic_covid_data_realistic.csv')
covid_data['Date'] = pd.to_datetime(covid_data['Date'])

# Calculate per capita metrics
covid_data['CasesPerCapita'] = covid_data['Cases'] / 100000
covid_data['DeathsPerCapita'] = covid_data['Deaths'] / 100000
covid_data['VaccinationRate'] = covid_data['Vaccination'] / 100000

# Set the style
sns.set(style="whitegrid")

# Vaccination rate vs. Cases Per Capita
plt.figure(figsize=(14, 8))
sns.scatterplot(data=covid_data, x='VaccinationRate', y='CasesPerCapita', hue='Country', style='Country', alpha=0.6)
plt.title('Vaccination Rate vs. Cases Per Capita by Country')
plt.xlabel('Vaccination Rate (per 100,000 people)')
plt.ylabel('Cases Per Capita')
plt.legend(title='Country')
plt.tight_layout()
plt.savefig('vaccination_vs_cases_per_capita_python.png')
plt.show()

# Vaccination rate vs. Deaths Per Capita
plt.figure(figsize=(14, 8))
sns.scatterplot(data=covid_data, x='VaccinationRate', y='DeathsPerCapita', hue='Country', style='Country', alpha=0.6)
plt.title('Vaccination Rate vs. Deaths Per Capita by Country')
plt.xlabel('Vaccination Rate (per 100,000 people)')
plt.ylabel('Deaths Per Capita')
plt.legend(title='Country')
plt.tight_layout()
plt.savefig('vaccination_vs_deaths_per_capita_python.png')
plt.show()
