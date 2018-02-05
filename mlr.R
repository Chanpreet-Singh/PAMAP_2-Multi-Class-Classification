
library(ggord)
library(dplyr)
library(devtools)
library(VIM)
library(plyr)
library(tidyr)
library(purrr)
library(ggplot2)
library(MASS)
library(nnet)
library(klaR)
library(caret)
library(Zelig)
library(randomForest)
library(mice)

set.seed(234)

train <- sample(1:nrow(omitted_data),nrow(omitted_data)*0.7)

pamap_train <- omitted_data[train,]

pamap_test <- omitted_data[-train,]

P3<-multinom(V1~.,data=pamap_train,na.action = na.omit)

pred<-predict(P3,pamap_test)

print(P3)

confusionMatrix(pred,pamap_test$V1)

out <- capture.output(confusionMatrix(pred,pamap_test$V1))

cat("My title", out, file="mlr_confusion_matrix.txt", sep="n", append=TRUE)
