setwd("C:/Users/gaffar/Desktop/WineAnalysis/Wine Analy")

#check the working directory
getwd()

library(readr)

#read the wine dataset
wine<-read_csv("wine.csv")

#check the variable name types 
str(wine)

#summary of the wine dataset
summary(wine)

#create another column with class variables  in numerals
class_num <- factor(wine$Class, levels=c("one","two","three"), labels=c(0,1,2))

#add the column with the present dataset
wine<- cbind(wine,class_num)

#check the variable name types 
str(wine)

#rename columns
colnames(wine)[1] <- "Al"
colnames(wine)[2] <- "Mal"
colnames(wine)[4] <- "Alc"
colnames(wine)[6] <- "TotP"
colnames(wine)[7] <- "Flav"
colnames(wine)[8] <- "NFlav"
colnames(wine)[9] <- "Pro"
colnames(wine)[12] <- "OD" 
colnames(wine)[5]<-"Mg"
colnames(wine)[10] <- "Color"
colnames(wine)[13] <- "Prl"

#round off code (not in use here)
#is.num <- sapply(wine, is.numeric)
#wine[is.num] <- lapply(wine[is.num], round, 0)


library(ggplot2)

# finding correlation between various variables

library(GGally)

wine_tmp <- wine[,1:13]

# Function to return points and geom_smooth
# allow for the method to be changed
my_fn <- function(data, mapping, method="loess", ...){
  p <- ggplot(data = data, mapping = mapping) + 
    geom_point() + 
    geom_smooth(method=method, ...)
  p
}

wine$class_num <- as.numeric(wine$class_num)

#Default loess curve    
#curve gives the correlation between various variables
ggpairs(wine_tmp[1:13], lower = list(continuous = my_fn))

#different graphs are plotted
g1 = ggplot(data = wine, aes(wine$Al)) +  
  geom_bar(position="dodge") + facet_wrap(~class_num) 

g2 = ggplot(data = wine, aes(wine$`Mal`)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g3 = ggplot(data = wine, aes(wine$Ash)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g4 = ggplot(data = wine, aes(wine$`Alc`)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g5 = ggplot(data = wine, aes(wine$Mg)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g6 = ggplot(data = wine, aes(wine$`TotP`)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g7 = ggplot(data = wine, aes(wine$Flav)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g8 = ggplot(data = wine, aes(wine$`Nflav`)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g9 = ggplot(data = wine, aes(wine$Pro)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g10 = ggplot(data = wine, aes(wine$Color)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g11 = ggplot(data = wine, aes(wine$Hue)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g12 = ggplot(data = wine, aes(wine$OD)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

g13 = ggplot(data = wine, aes(wine$Prl)) +
  geom_histogram(stat="count") + facet_wrap(~class_num)

# 2 variables are plooted with respect to their classes

k1 <- ggplot(data=wine, aes(wine$Flav,wine$TotP , color=wine$class_num)) + geom_point()

k2 <- ggplot(data=wine, aes(wine$OD,wine$TotP , color=wine$class_num)) + geom_point()

k3 <- ggplot(data=wine, aes(wine$OD,wine$Flav , color=wine$class_num)) + geom_point()

#factorise class_num to begin modeling
wine$class_num <- as.factor(wine$class_num)

set.seed(40)

#split data into training and test sets
rows <- sample(nrow(wine))
wine <- wine[rows,]
split <- round(nrow(wine) * .70)
train <- wine[1:split,]
test <- wine[(split + 1):nrow(wine),]

library(gbm)

#gbmpackage is being used because there are 3 variables in the Class column

library(caret)

set.seed(20)

fitControl <- trainControl(method="repeatedcv",
                           number=3,
                           repeats=3,
                           verboseIter=TRUE)
set.seed(85)
model <- train(class_num ~ . -Class, data=train,
                method="gbm",
                trControl=fitControl,verbose=FALSE)

#summary of model to see relative influence
summary(model, order=TRUE)

#predicting the values 

Predict <- predict(model, test)

#combining the columns

output <- cbind(test, Predict)


#computing the model accuracy:

conf <- table(test$class_num, Predict)
acc <- sum(diag(conf))/sum(conf)
acc

library(randomForest)

# define the control using a random forest selection function

control <- rfeControl(functions=rfFuncs, method="cv", number=10)

# run the RFE algorithm

results <- rfe(wine[,1:13], wine$class_num,  sizes=c(1:13), rfeControl=control)
# summarize the results

print(results)

# list the chosen features

predictors(results)

# plot the results

plot(results, type="p")

#plot shows the variables with high relative influence
plot(varImp(model),top=5)


#Model after feature selection

fitControl <- trainControl(method="repeatedcv",
                           number=3,
                           repeats=3,
                           verboseIter=TRUE)
set.seed(5)
model2 <- train(class_num ~ Color + Prl  + Flav + OD + Al + Hue -Class, data=train,
               method="gbm",
               trControl=fitControl,
                verbose=FALSE)

#Preditions
predict2 <- predict(model2, test)

#Computing for accuracy:
conf <- table(test$class_num, predict2)
acc2 <- sum(diag(conf))/sum(conf)
acc2


