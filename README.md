# Michelin-Star-restaurants
Data analysis on Michelin Star restaurants. The projects complete and detailed explanation can be found in my website: https://joseanmarsol.com/portfolio/michelin-star-restaurants-worldwide/

## Introduction and scope
The Michelin Guides are a series of guide books that have been published by the French tyre company Michelin since 1904. The Guide awards up to three Michelin stars for excellence to a select few establishments. The acquisition or loss of a star can have dramatic effects on the success of a restaurant.

With this project I intend to answer the following questions:

- How are the restaurants awarded with michelin stars (1, 2 or 3) distributed along the world?
- What types of cuisines do they practice?

## Data collection
The intention was to work with a dataset which included, at least, a list of the Michelin Star restaurants, their locations and the number of stars. I tried to check if there were available datasets in Kaggle, with unsuccesfull results. Therefore, as it was not sensitive information, I decided to get the data directly by scrapping the Michelin Guide website, using in Python and libraries BeautifulSoup, requests and Pandas to structure the data.

## Data cleaning and analysis
Once the data was scrapped and strucutred, it was uploaded into a sql database. Using SQLserver I cleaned the scrapped data and run a few analysis with it.

## Data visualization
The cleaned data is exported as Excel and with Tableau the data ius visualized.

