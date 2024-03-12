* Set the LIBNAME to your data directory;
libname covid_data 'synthetic_covid_data_realistic.csv';

* Import the CSV file into SAS;
proc import datafile='synthetic_covid_data_realistic.csv'
    out=covid_data.covid_analysis
    dbms=csv
    replace;
run;

* Time Series Plot of COVID-19 Deaths Over Time by Country;
proc sgplot data=covid_data.covid_analysis;
    series x=Date y=Deaths / group=Country;
    xaxis label="Date";
    yaxis label="Total Deaths";
    title "COVID-19 Deaths Over Time by Country";
run;

* Time Series Plot of Vaccination Rates Over Time by Country;
proc sgplot data=covid_data.covid_analysis;
    series x=Date y=Vaccination / group=Country;
    xaxis label="Date";
    yaxis label="Vaccination Rate";
    title "Vaccination Rates Over Time by Country";
run;
