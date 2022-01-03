
# A Statistical Model to Predict the Equity Price of Google Inc.

## Introduction
Google is a multinational technology company that specializes in Internet-related services and products. The company is part of the Information Technology sector and Internet Software & Services industry. The model is both explanatory and predictive. Stock investors and investment bankers will be interested in this research.

### Methodology

The dataset used for this research is time series and contains 10 observations. The graphical techniques used to build this model were histogram, time series and scatter plots; the analytical methods were descriptive statistics, correlation matrix, and linear regression. Eqn. 1, 2, and 3 depict the functional specification, population regression equation, and sample regression equation, respectively. The following results were obtained using the statistical program R.
>
	Eqn. 1 Price = f (eps, bvps, cfps) 
	Eqn. 2 Price = α + βeps*EPS + βbvps*BVPS+ βcfps*CFPS 
	Eqn. 3 Price = a + beps*EPS + bbvps*BVPS+ bcfps*CFPS
>

### Results

a. Fig. 1, Fig. 2, Fig. 3, and Fig. 4 display histograms for both the dependent and independent variables. Fig. 1 and Fig.4 are skewed to the right. Fig. 3 is symmetrical, and Fig. 2 is skewed to the left.

![image](https://user-images.githubusercontent.com/87792252/147893837-949c8793-675d-4a5c-a1ef-e6f53580a1ef.png)

b. Fig. 5, 6, 7, 8 are time series plots for dependent and independent variables. All four graphs show upward trend over the period of 10 years from 2005 to 2014.

![image](https://user-images.githubusercontent.com/87792252/147893849-2e39bb0d-1441-444b-bcca-178b947327d9.png)

c. Fig. 9, Fig. 10, and Fig. 11 display scatterplots of the price with eps, bvps, and cfps.  
These plots show a strong, positive, nonlinear association between the dependent and independent variables. There are outliers in all the graphs, though these graphs agree with the hypothesis.

![image](https://user-images.githubusercontent.com/87792252/147893860-5520e7af-0e10-49ae-acdb-27ca31eb3c82.png)
![image](https://user-images.githubusercontent.com/87792252/147893862-37046a53-df89-4188-8c06-6a3dd663fcd4.png)
![image](https://user-images.githubusercontent.com/87792252/147893864-da752173-ba0a-4036-909b-b5b69c395bb4.png)

d.	Table 1 is descriptive statistics table.

Table 1 Descriptive Statistics

|Name  | obs | max  | min | mean  | median | mode  | var | std | skew  | kurt |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |

name	obs	max	min	mean	median	mode	var	std	skew	kurt
price	10	560.897	153.974	331.456	316.776	207.631	16862.758	129.857	0.522	2.466
eps	10	19.167	2.512	11.238	11.691	2.512	34.218	5.85	-0.062	1.582
bvps	10	153.638	16.087	73.566	64.367	16.087	2113.571	45.974	0.386	1.962
cfps	10	27.563	1.792	13.922	13.492	1.792	82.13	9.063	0.123	1.719
