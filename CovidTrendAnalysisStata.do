cd "Your/Path/Here"

use synthetic_covid_data_realistic.csv, clear

gen Date_dt = date(Date, "YMD")

* Create line plots for cases and deaths over time by country
foreach var in Cases Deaths {
    tsset Date_dt
    tsline `var' if Country == "United States", title("United States COVID-19 `var' Over Time") name(US_`var', replace)
    tsline `var' if Country == "Brazil", title("Brazil COVID-19 `var' Over Time") name(Brazil_`var', replace)
    tsline `var' if Country == "India", title("India COVID-19 `var' Over Time") name(India_`var', replace)
    tsline `var' if Country == "Russia", title("Russia COVID-19 `var' Over Time") name(Russia_`var', replace)
    tsline `var' if Country == "United Kingdom", title("United Kingdom COVID-19 `var' Over Time") name(UK_`var', replace)
}

* Graph export commands (adjust file paths as needed)
graph export "covid_cases_over_time_stata.png", replace
graph export "covid_deaths_over_time_stata.png", replace
