#Analysis
install.packages("tidyverse")

#import library
library(tidyverse)

#to view the HollywoodsMostProfitableStories dataset
view(hwdata)  #hwdata is the shortname of the HollywoodsMostProfitableStories

#check datatypes
str(hwdata)

#check dimension 
dim(hwdata)    #74 rows and 8 columns

#check missing values
colSums(is.na(hwdata))

#drop missing values
#There is no specific column has more than 50 % or 100% null or values to drop

#Remove specific rows with null or missing values
hwdata<-na.omit(hwdata)

#check dimension
dim(hwdata)    #70 rows and 8 columns -  rows are removed 

#Using filter method to  filter rows with empty cell from the data frame based on specified conditions.
hwdata<-hwdata %>%  filter(!row_number() %in% c(38))


#check dimension
dim(hwdata)    #69 rows and 8 columns - 5 rows are removed

#to view the Hollywood dataset after removing the rows with null or missing values ie na
view(hwdata)


#check for duplicates
#remove duplicated rows based on a given column

hwdata<-hwdata %>% distinct(Film, .keep_all = TRUE)
dim(hwdata)

#second method
hwdata<-hwdata[!duplicated(hwdata$Film), ]

#round off the Profitability column values to 2 places
hwdata$Profitability<-round(hwdata$Profitability,digit=2)

#round off the Worldwide.Gross column values to 2 places
hwdata$Worldwide.Gross<-round(hwdata$Worldwide.Gross,digit=2)

#To view the top 5 rows of the HollywoodsMostProfitableStories 
head(hwdata)

#To view the entire table of the HollywoodsMostProfitableStories
view(hwdata)

#To find outliers
#import ggplot2 library
library(ggplot2)

#Create a boxplot that highlights the outliers
ggplot(hwdata,aes(x=Profitability, y=Worldwide.Gross)) +geom_boxplot(outlier.colour= "red",outlier.shape= 1)+scale_x_continuous(labels = scales::comma)+coord_cartesian(ylim= c(0,1000))

#Remove outliers in 'Profitability'
Q1 <- quantile(hwdata$Profitability, .25)
Q3 <- quantile(hwdata$Profitability, .75)

#Interquartile range

IQR <- IQR(hwdata$Profitability)

#Apply 1.5 rule to remove the ouliers
no_outliers <- subset(hwdata, hwdata$Profitability> (Q1 - 1.5*IQR) & hwdata$Profitability< (Q3 + 1.5*IQR))

#Check dimension after removing outliers in profitability
dim(no_outliers) #64 rows and 8 columns

#Remove outliers in Worldwide.Gross
Q1<-quantile(hwdata$Worldwide.Gross,.25)
Q3<-quantile(hwdata$Worldwide.Gross,.75)

#interquartile range - Worldwide.Gross
IQR<-IQR(hwdata$Worldwide.Gross)

#Apply 1.5 rule to eliminate the outliers
hwdata1 <- subset(hwdata, hwdata$Worldwide.Gross> (Q1 - 1.5*IQR) & hwdata$Worldwide.Gross< (Q3 + 1.5*IQR))         

#check dimensions after removing outliers
dim(hwdata1)  # 65 rows and 8 columns
view(hwdata1)

# To Do a Summary Statistics/Univariate Analysis using appropriate code.
#summary statistics 
summary(no_outliers)
summary(hwdata1)

#bivariate analysis using Profitability and Worldwide.Gross column
ggplot(hwdata1, aes(x=Worldwide.Gross, y=Profitability)) + geom_point(colour="blue")+ scale_y_continuous(labels=scales::comma)+coord_cartesian(ylim = c(0, 100))
ggplot(no_outliers, aes(x=Profitability, y=Worldwide.Gross)) + geom_point(colour="blue")+ scale_y_continuous(labels=scales::comma)+coord_cartesian(ylim = c(0, 300))

#Univariate analysis with Genre column
ggplot(hwdata1, aes(x=Genre)) + geom_bar(fill = 'darkgreen')+coord_cartesian(ylim = c(0, 50))
#Univariate analysis with Lead.studio column
ggplot(hwdata1, aes(x=Lead.Studio)) + geom_bar(fill = 'darkgreen')+coord_cartesian(ylim = c(0, 20))+theme(axis.text.x = element_text(angle = 90)) 

#scatterplot
ggplot(hwdata1, aes(x=Lead.Studio, y=Rotten.Tomatoes..)) + geom_point(colour="brown")+ scale_y_continuous(labels = scales::comma)+coord_cartesian(ylim = c(0, 110))+theme(axis.text.x = element_text(angle = 90))

#bar chart
ggplot(hwdata1, aes(x=Year)) + geom_bar(fill="brown")

#Export clean data
write.csv(no_outliers,"clean_df.csv")










