library(caTools)
library(caret)
library(rpart)
library(rpart.plot)
library(ggplot2)

df_tree=read.csv('./derived_data/hotel_bookings_preprocessed1.csv')
set.seed(1234)
sample <- sample(2, nrow(df_tree), replace = T, prob = c(.7, .3))
train=subset(df_tree,sample==1)
test=subset(df_tree,sample==2)

formula=is_canceled ~ hotel+lead_time+ 
  arrival_date_week_number+
  stays_in_weekend_nights+stays_in_week_nights+adults+children+
  is_repeated_guest+previous_cancellations+
  previous_bookings_not_canceled+booking_changes+
  deposit_type+days_in_waiting_list+adr+
  required_car_parking_spaces+total_of_special_requests
dtree <-
  rpart(formula,
        data = train,
        method = "class",
        parms = list(split = "information")
  )

png('./figures/decision_tree.png')
b<-prp(dtree, type=2, extra=104, fallen.leaves = TRUE, main="Decision Tree")
dev.off()

dtree.pred <- predict(dtree, test, type = "class")
accuracy <-
  table(test$is_canceled,
        dtree.pred,
        dnn = c("Actual", "Predicted"))
accuracy
accuracy_1 <- sum(diag(accuracy) / sum(accuracy))
accuracy_1
