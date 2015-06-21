# Shiny App on Deaths due to Malaria
*ShinyApp Project for Data Products (Coursera Data Sc Specialization)*

## Data
This App uses the data reported by the [WHO] [1] on the number of reported deaths due to Malaria in 82 countries during the period 2010-2012.  

## App Structure 

### The UI
The App takes two inputs (Year and Threshold) and displays:  

- A plot of the number of deaths due to Malaria in all the countries whose count exceeds the selected threshold. The range of thresholds shown in the App was selected based on the third quartile values for the entire dataset. The largest proportion of cases (~90%) occurs in a few countries, thus the quartile was chosen to represent the countries with the most cases  
- A table of the countries included in the plot  
- A statistical summary of the number of deaths in the selected year. This summary is intended to guide the user to have a perspective of the global trends for a particular year  

For more information about advances in Malaria, trends, control, diagnosis and treatment, consult the [Global Health Observatory] [2]

### The Server  
Once the entire databse (2000-2012) is read, the app subsets the data isolating only the desired year. This first subset is used to claculate the yearly summary.

A second subset is taken based on the selected threshold, this subset is passed to the plot and talbe sections.  

## Additional documentation 
The presentation file reviews in more detail the motivation and intended impact of this preliminary analysis. 



[1]: http://apps.who.int/gho/data/node.main.A1367?lang=en "WHO"   
[2]: http://www.who.int/gho/malaria/en/ "Global Health Observatory"