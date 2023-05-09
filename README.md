
# Dataset Description
#### Data from February 2020 to February 2022 were used, and the dependent variable was set as mobile shopping transactions, the number of monthly COVID-19 confirmed cases, monthly courier sales, and the cumulative active users of the top five mobile shopping mall applications.

#### For mobile shopping mall transactions, the "Online Shopping Trend Survey" report released every month by the National Statistical Office was used, and monthly data of shopping mall sales were used based on shopping malls with annual sales of more than 24 million.

#### In the case of COVID-19 data, data from the Korea Centers for Disease Control and Prevention's disease and health integrated management system, which accurately and quickly provides COVID-19-related data, were used as monthly data using date data.

#### Monthly parcel delivery sales used monthly living logistics statistics of the National Logistics Integrated Information System, and data were collected by designating the base year from February 2020 to February 2022.




# 분석 방법
#####  After checking the trend for each variable, volatility was confirmed through the difference between the previous time difference and the current time difference.
##### For isodispersion, resolve with log conversion
##### Since then, the following review has been conducted on the four basic assumptions of OLS: linearity, independence, equal dispersion, and normality.
##### normality - Shapiro-Wilk
##### homoskedasticity - Goldfeld-Quandt 
##### independence - Durbin-watson
##### linearity - Residual plot



