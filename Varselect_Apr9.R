library(lars)
library(matrixStats)
library(glmnet)
library(caret)
library(randomForest)
library(dplyr)

setwd("~/Desktop/CSE6643/project") 

### use lasso to select variables
mydata = read.csv("OnlineNewsPopularity.csv",header=TRUE)
x <- as.matrix(mydata[,3:60])
y <- as.vector(mydata[,61])
#cv.glmnet(x,y)
rs <- lars(x,y)


#### analysis on selected data
mydata = read.csv('varselected.csv', header = T)
mydata <- mydata[mydata$shares > 9,]

trainIndex <- createDataPartition(mydata$shares, p = .75,list=FALSE)
train<-mydata[trainIndex,]
test<-mydata[-trainIndex,]

# log transformation on shares(range is too large)
train$shares <- log10(train$shares)
#test$shares <- log10(test$shares)
# train$self_reference_min_shares <- log10(train$self_reference_min_shares)
# train$self_reference_avg_sharess <- log10(train$self_reference_avg_sharess)
# train$kw_max_avg <- log10(train$kw_max_avg)
# train$kw_avg_avg <- log10(train$kw_avg_avg)

# perform linear regression
model = lm(shares~.,data=train )
summary(model)
y_pred <- as.matrix(predict(model, newdata= test))
y_pred <- 10^y_pred #anti log transform pred 
rmse <- sqrt(mean((y_pred - test$shares)^2)) #calculate error
#a<-10^median(test$shares)
#b<-median(10^test$shares)

#install.packages('Matrix')
#library(Matrix)
#y <- qr(train)
#y$rank
