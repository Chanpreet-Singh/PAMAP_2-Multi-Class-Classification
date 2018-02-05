library(MASS)
library(klaR)

omitted_data$V1<-as.factor(omitted_data$V1)

pamap_data <- omitted_data

pamap_data <- na.omit(pamap_data)

train <- sample(1:nrow(pamap_data),nrow(pamap_data)*0.7)

pamap_train <- pamap_data[train,]

pamap_test <- pamap_data[-train,]

fit <- lda(V1~.,data=pamap_train)

pred <- predict(fit,pamap_test)

predict_class <- pred$class

pred_table <- table(predict_class, pamap_test$V1)

mean(predict_class==pamap_test$V1,na.rm=T)

print(pred_table)

partimat(V1~.,data=pamap_data,method="lda")

plot(fit)
