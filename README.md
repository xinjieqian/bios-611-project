## Introduction

This project aims on hotel demand data, which is a dataset found on Kaggle and here is its link: 
https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand.
The dataset contains booking information for a city hotel and a resort hotel and includes information 
such as when the booking was made, length of stay, the number of adults, children, and the number of 
available parking spaces, among other things. It has 32 variables and approximately 119000 
observations. 

In this project, I will do analysis on some interesting problems, for example: 
when is the best time of year to book a hotel room? Or what is the optimal length of stay in order to get 
the best daily rate? And my main target is to predict whether or not a booking is cancelled.

## Using This Repository
You'll need Docker and the ability to run Docker as your current user.

You'll need to build the container:
```{}
docker image build -t 611project
```
And we can run docker container using the following command:
```{}
docker run -v $(pwd):/home/rstudio -e PASSWORD=goodjob -p 8787:8787 -t 611project
```