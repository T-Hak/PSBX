library("caret")
data(iris)

#Update set seed
set.seed(999)

#Model : Decision Tree
trainIndex <- createDataPartition(iris$Species, p = 0.8,
                                  list = FALSE,
                                  times = 1)
train <- iris[ trainIndex,]
test  <- iris[-trainIndex,]

#Cross validation
fitControl <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 5)

#Train the model
decision_tree <- train(Species ~., data = train, method = "rpart",
               trControl = fitControl)
#Summarize the results
decision_tree

#build confusion matrix
predictions <- predict(decision_tree, test)
confusionMatrix(predictions, test$Species)

confusion_matrix <- as.data.frame(table(predictions, test$Species))
names(confusion_matrix) = c("Actual","Predicted","Freq")

#compute frequency of actual categories
actual = as.data.frame(table(test$Species))
names(actual) = c("Actual","ActualFreq")

#calculate percentage of test cases based on actual frequency
confusion = merge(confusion_matrix, actual, by=c("Actual"))
confusion$Percent = confusion$Freq/confusion$ActualFreq*100

#render plot
# we use three different layers
# first we draw tiles and fill color based on percentage of test cases
tile <- ggplot() +
  geom_tile(aes(x=Actual, y=Predicted,fill=Percent),data=confusion, color="black",size=0.1) +
  labs(x="Actual",y="Predicted")
tile = tile + 
  geom_text(aes(x=Actual,y=Predicted, label=sprintf("%.1f", Percent)),data=confusion, size=3, colour="black") +
  scale_fill_gradient(low="grey",high="red")

# lastly we draw diagonal tiles. We use alpha = 0 so as not to hide previous layers but use size=0.3 to highlight border
tile = tile + 
  geom_tile(aes(x=Actual,y=Predicted),data=subset(confusion, as.character(Actual)==as.character(Predicted)), color="black",size=0.3, fill="black", alpha=0) 

#render
tile

#Decision Tree & Leafs
library(rpart)
model <- rpart(Species ~., data = iris)
par(xpd = NA) # otherwise on some devices the text is clipped
plot(model)
text(model, digits = 3)

