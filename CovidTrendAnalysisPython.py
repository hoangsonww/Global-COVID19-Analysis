import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
covid_data = pd.read_csv('synthetic_covid_data_realistic.csv')
covid_data['Date'] = pd.to_datetime(covid_data['Date'])

# Set the style
sns.set(style="whitegrid")

# Plot cases over time
plt.figure(figsize=(14, 8))
sns.lineplot(data=covid_data, x='Date', y='Cases', hue='Country')
plt.title('COVID-19 Cases Over Time by Country')
plt.ylabel('Total Cases')
plt.xlabel('Date')
plt.xticks(rotation=45)
plt.legend(title='Country')
plt.tight_layout()
plt.savefig('covid_cases_over_time_python.png')
plt.show()

# Plot deaths over time
plt.figure(figsize=(14, 8))
sns.lineplot(data=covid_data, x='Date', y='Deaths', hue='Country')
plt.title('COVID-19 Deaths Over Time by Country')
plt.ylabel('Total Deaths')
plt.xlabel('Date')
plt.xticks(rotation=45)
plt.legend(title='Country')
plt.tight_layout()
plt.savefig('covid_deaths_over_time_python.png')
plt.show()
