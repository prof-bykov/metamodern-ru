# Prof.Bykov's R - Simple plot with ggplot2

# Lab goals
#   Read a datafile into R
#   Learn how to work with ggplot2

# Check your working directory
getwd()

# If necessary, set your working directory
setwd("/home/R")

# Read data into a dataframe called Scopus
Metamodern <- read.table("Metamodern.txt", header = T) 

# If necessary, view data
View(Metamodern)

# If necessary, edit data 
edit(Metamodern)

# How to calculate total number of publications?
sum(Metamodern$Publ)

# If necessary, install package "ggplot2"
install.packages("ggplot2")

#Load ggplot2 library 
library(ggplot2)

#Build a simple plot with ggplot2
ggplot(data = Metamodern, aes(x = Year, y = Publ)) + 
geom_point()

#Adding title, subtitle, LM, labels, size, and labs
ggplot(Metamodern, aes(x = Year, y = Publ)) + 
geom_text(aes(label = Publ, vjust= 2.0)) +
geom_point(size = 5) + 
geom_smooth(formula = y ~ x, method = "lm") +
labs(title = "Научные публикации о метамодернизме на русском языке",
	subtitle = "По данным Google Scholar (2010-2024 гг.)",
	x = "Годы", 
	y = "Количество публикаций")

#Saving in 300dpi
ggsave("Metamodern.png", dpi = 300)

#How to build regression model
publ.regression <- lm(Year ~ Publ, data=Metamodern)

#Run summary for regression model
#How to reed the results use https://youtu.be/wsi0jg_gH28?si=ho0S2fvUenVOvy74 
summary(publ.regression)

#Super simple plot
plot(Metamodern$Year, Metamodern$Publ) 
abline(publ.regression, col="blue")
