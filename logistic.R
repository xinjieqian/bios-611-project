library(caTools)
library(caret)
library(ggplot2)

newhotels=read.csv('derived_data/hotel_bookings_preprocessed1.csv')

set.seed(1234)
sample <- sample(2, nrow(newhotels), replace = T, prob = c(.7, .3))
#sample=sample.split(newhotels,SplitRatio=0.90)
train=subset(newhotels,sample==1)
test=subset(newhotels,sample==2)

formula=is_canceled ~ hotel+lead_time+ 
  arrival_date_week_number+
  stays_in_weekend_nights+stays_in_week_nights+adults+children+
  is_repeated_guest+previous_cancellations+
  previous_bookings_not_canceled+booking_changes+
  deposit_type+days_in_waiting_list+adr+
  required_car_parking_spaces+total_of_special_requests
model=glm(formula,data=train,family=binomial(link="logit"))
summary(model)
pred=predict(model,test,type='response')
pred=as.factor(ifelse(pred>0.5,1,0))
confusionMatrix(pred,as.factor(test$is_canceled))

var<-varImp(model, scale = FALSE)
var
write.csv(var, file = "./derived_data/varimp.csv")