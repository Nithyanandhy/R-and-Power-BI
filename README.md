# R-and-Power-BI - Hollywoods Most profitable stories

I've performed various data cleaning, data exploration, and visualization steps using R programming and Power BI to analyze the performance of Hollywood movie​s released in 2007-2012.​. Here's a summary of the steps I've taken:

## Data Loading and Initial Exploration:
- Loaded the tidyverse library.
- Used view(hwdata) to view the dataset.
- Checked data types using str(hwdata).
- Checked dimensions using dim(hwdata).
- Checked for missing values using colSums(is.na(hwdata))

## Data Cleaning:

- Removed rows with missing values using na.omit(hwdata).
- Removed specific rows based on condition using hwdata %>% filter(!row_number() %in% c(38)).
- Removed duplicate rows based on the "Film" column using hwdata %>% distinct(Film, .keep_all = TRUE)
  
## Data Transformation:

- Rounded "Profitability" and "Worldwide.Gross" columns using round().
  
## Data Visualization:

- Used ggplot2 for visualizations.
- Created a box plot to visualize outliers in "Profitability" and "Worldwide.Gross".
   ![image](https://github.com/Nithyanandhy/R-and-Power-BI/assets/61016606/4c0e68b7-e83a-4a93-91f9-542ea5d2c33a)

- Removed outliers based on the 1.5*IQR rule.
- Created scatter plots and bar charts to visualize relationships between various columns.
![image](https://github.com/Nithyanandhy/R-and-Power-BI/assets/61016606/f99798ee-2551-46e0-a9b2-153253f4f41a)![image](https://github.com/Nithyanandhy/R-and-Power-BI/assets/61016606/94efd381-bf9e-43b0-9e0e-f5df6e3fb1bd)

## Export the clean data

- Exported the cleaned data to a CSV file named "clean_df.csv" using write.csv().

## Power BI for data visualization

 I've imported the clean data of "HollywoodsMostProfitableStories" into Power BI, I have performed various analyses and created visualizations to gain insights from the data.

![Power BI Dashboard - HollyWoods Most Profitable Stories](https://github.com/Nithyanandhy/R-and-Power-BI/assets/61016606/088151ac-55d3-4c5c-a64b-ad173856193c)

 
Here's a step-by-step guide on what I have done in Power BI:

### Load Data:
- Open Power BI Desktop.
- Click on "Home" tab and select "Get Data."
- Choose your data source (CSV, Excel, etc.) and import the clean dataset.
  
### Data Modeling:

- Define relationships between tables if you have multiple tables in your dataset. In this case, you probably have one main table for the Hollywood data.
  
### Create Visualizations:

- Drag and dropped fields from the dataset onto the "Fields" pane to create visualizations.
- Explored various types of visualizations such as bar charts, line charts, scatter plots, and more.
- Created a scatter plot to visualize the relationship between profitability and gross revenue.
- Created bar charts to visualize the distribution of films across different genres and lead studios.
- Average Rotten Tomatoes Ratings Analysis per genre
- Created a bar chart to show the distribution of films across different release years.
  
### Dashboards and Reports:

- Organized visualizations into dashboards

### Formatting and Design:

- Formatted the visualizations, added titles, labels, and legends to make them more informative and visually appealing.
- Ensured a consistent color scheme of blue shades and fonts.

### Publish

Once your report is ready, you can save it and share it as a Power BI file (.pbix).
You can also publish the report to the Power BI service for online sharing and collaboration.
  
