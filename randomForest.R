library(plyr)
library(randomForest)
library(caret)


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
library(e1071)

sampled2<-as.data.frame(omitted_data)

sampled2<-na.omit(sampled2)

sampled2$v1<-as.factor(sampled2$V1)


set.seed(123)
train <- sample(1:nrow(sampled2),nrow(sampled2)*0.7)


pamap_train <- sampled2[train,]

pamap_test <- sampled2[-train,]

set.seed(222)

rf<-randomForest(V1~.,data=pamap_train,ntree=50,na.action = na.exclude)

pred_rf <- predict(rf,pamap_test)

print(pred_rf)

print(rf)

summary(rf)

confusionMatrix(pred_rf,pamap_test$V1)

pred_table <- table(pred_rf, pamap_test$V1)

mean(predict_class==pamap_test$V1,na.rm=T)

print(pred_table)

p1<-predict(rf,pamap_train)
confusionMatrix(p1,pamap_train$V1)
