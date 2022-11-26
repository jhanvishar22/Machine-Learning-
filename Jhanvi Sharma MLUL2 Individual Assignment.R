library(plyr)
library(dplyr)
library(readxl)
library(Matrix)
library(stringr)
library(arules)
library(reshape2)
library(arulesViz)
library(data.table)
library(splitstackshape)


databig <- read_excel("C:/Users/22jha/OneDrive/Desktop/IMB575_Individual_Assignmnet.xls")
View(databig)

sum(is.na (databig))

#there are no null values, we can proceed with analysis

dbasket <- split(databig$Description, databig$Order)
transation <- as(dbasket, 'transactions')

## QUestion 6 solution

row1 = apriori (transation, parameter=list (support=0.1, confidence = 0.6,minlen = 2))
inspect(head(sort(row1, by="lift")))


## Question 8

datacust <- databig[databig$Member == 'M12050',]
View(datacust)

custbas <- split(databig$Description, databig$Order)
custrans <- as(custbas, 'transactions')
View(custrans)

row2 = apriori (custrans, parameter=list (support=0.006, confidence = 0.9,minlen = 2))
inspect(head(sort(row2, by="lift")))



