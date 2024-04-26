> cleveland <- read.csv("C:/Users/Aleesha/Desktop/Materials/S3/Data
mining/project/processed.cleveland.data", header=FALSE)
> View(cleveland)
> columns <- colnames(cleveland)
> for (column in columns) {
+ cleveland[[column]] <- ifelse(trimws(cleveland[[column]]) == "?",
NA, cleveland[[column]])}
> colSums(is.na(cleveland))
V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14
 0 0 0 0 0 0 0 0 0 0 0 4 2 0
> unique_values <- unique(cleveland$V12)
> unique_value
Error: object 'unique_value' not found
> unique_values <- unique(cleveland$V12)
> unique_values
[1] "0.0" "3.0" "2.0" "1.0" NA
> frequency <- table(cleveland$V12)
> mode <- names(frequency)[which.max(frequency)]
> print(mode)
[1] "0.0"
> cleveland$V12[is.na(cleveland$V12)] <- mode
> colSums(is.na(cleveland))
V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14
 0 0 0 0 0 0 0 0 0 0 0 0 2 0
> median_value <- median(cleveland$V13,
+ na.rm = TRUE)
> cleveland$V13 <- ifelse(is.na(cleveland$V13),
median_value,cleveland$V13)
> colSums(is.na(cleveland))
V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14
 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> library(dplyr)
>
> table(cleveland$V2)
0 1
97 206
> table(cleveland$V3)
 1 2 3 4
23 50 86 144
> str(cleveland)
'data.frame': 303 obs. of 14 variables:
$ V1 : num 63 67 67 37 41 56 62 57 63 53 ...
$ V2 : num 1 1 1 1 0 1 0 0 1 1 ...
$ V3 : num 1 4 4 3 2 2 4 4 4 4 ...
$ V4 : num 145 160 120 130 130 120 140 120 130 140 ...
$ V5 : num 233 286 229 250 204 236 268 354 254 203 ...
$ V6 : num 1 0 0 0 0 0 0 0 0 1 ...
$ V7 : num 2 2 2 0 2 0 2 0 2 2 ...
$ V8 : num 150 108 129 187 172 178 160 163 147 155 ...
$ V9 : num 0 1 1 0 0 0 0 1 0 1 ...
$ V10: num 2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
$ V11: num 3 2 2 3 1 1 3 1 2 3 ...
$ V12: chr "0.0" "3.0" "2.0" "0.0" ...
$ V13: chr "6.0" "3.0" "7.0" "3.0" ...
$ V14: int 0 2 1 0 0 0 3 0 2 1 ...
> mutate(cleveland$V14,fct_lump(cleveland$V14, other_level = "1"))
Error in UseMethod("mutate") :
 no applicable method for 'mutate' applied to an object of class
"c('integer', 'numeric')"
> cleveland <- cleveland %>%
+ mutate(V14 = fct_lump(as.factor(V14), other_level = "1"))
> table(cleveland$V14)
 0 1
164 139
> str(cleveland)
'data.frame': 303 obs. of 14 variables:
$ V1 : num 63 67 67 37 41 56 62 57 63 53 ...
$ V2 : num 1 1 1 1 0 1 0 0 1 1 ...
$ V3 : num 1 4 4 3 2 2 4 4 4 4 ...
$ V4 : num 145 160 120 130 130 120 140 120 130 140 ...
$ V5 : num 233 286 229 250 204 236 268 354 254 203 ...
$ V6 : num 1 0 0 0 0 0 0 0 0 1 ...
$ V7 : num 2 2 2 0 2 0 2 0 2 2 ...
$ V8 : num 150 108 129 187 172 178 160 163 147 155 ...
$ V9 : num 0 1 1 0 0 0 0 1 0 1 ...
$ V10: num 2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
$ V11: num 3 2 2 3 1 1 3 1 2 3 ...
$ V12: chr "0.0" "3.0" "2.0" "0.0" ...
$ V13: chr "6.0" "3.0" "7.0" "3.0" ...
$ V14: Factor w/ 2 levels "0","1": 1 2 2 1 1 1 2 1 2 2 ...
> cleveland$V14
 [1] 0 1 1 0 0 0 1 0 1 1 0 0 1 0 0 0 1 0 0 0 0 0 1 1 1 0 0 0 0 1 0 1 1 0
0 0 1 1 1 0 1 0 0 0 1 1 0 1 0 0 0 0 1 0
[55] 1 1 1 1 0 0 1 0 1 0 1 1 1 0 1 1 0 1 1 1 1 0 1 0 0 1 0 0 0 1 0 0 0 0
0 0 0 1 0 0 0 1 1 1 0 0 0 0 0 0 1 0 1 1
[109] 1 1 1 1 0 1 1 0 0 0 1 1 1 1 0 1 1 0 1 1 0 0 0 0 0 0 0 0 1 1 1 0 0 1
0 1 0 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0 0 1
[163] 0 0 0 0 0 0 1 0 1 0 1 0 1 1 0 1 0 0 1 1 0 0 1 0 0 1 1 1 0 1 1 1 0 1
0 0 0 1 0 0 0 0 0 1 1 1 0 1 0 1 0 1 1 0
[217] 0 0 0 0 0 0 0 1 1 0 0 0 1 1 0 1 1 0 0 1 1 1 0 0 0 0 0 1 0 1 1 1 1 0
0 1 0 0 0 0 0 0 0 1 0 1 0 0 1 1 1 1 1 0
[271] 1 0 1 0 1 0 0 0 1 0 1 0 1 0 1 1 1 0 0 0 1 0 1 1 1 0 1 1 1 1 1 1 0
Levels: 0 1
> cleveland$V12 = as.numeric(as.factor(cleveland$V12))
> str(cleveland)
'data.frame': 303 obs. of 14 variables:
$ V1 : num 63 67 67 37 41 56 62 57 63 53 ...
$ V2 : num 1 1 1 1 0 1 0 0 1 1 ...
$ V3 : num 1 4 4 3 2 2 4 4 4 4 ...
$ V4 : num 145 160 120 130 130 120 140 120 130 140 ...
$ V5 : num 233 286 229 250 204 236 268 354 254 203 ...
$ V6 : num 1 0 0 0 0 0 0 0 0 1 ...
$ V7 : num 2 2 2 0 2 0 2 0 2 2 ...
$ V8 : num 150 108 129 187 172 178 160 163 147 155 ...
$ V9 : num 0 1 1 0 0 0 0 1 0 1 ...
$ V10: num 2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
$ V11: num 3 2 2 3 1 1 3 1 2 3 ...
$ V12: num 1 4 3 1 1 1 3 1 2 1 ...
$ V13: chr "6.0" "3.0" "7.0" "3.0" ...
$ V14: Factor w/ 2 levels "0","1": 1 2 2 1 1 1 2 1 2 2 ...
#----------------exploratory data analysis and visualisation
> library(ggplot2)
> library(ggplot2)
> ggplot(cleveland, aes(x = V1, fill = V14)) +
+ geom_bar() +
+ labs(title = "Distribution of Target vs Age",
+ x = "Age",
+ y = "Count") +
+ theme_minimal() +
+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
library(ggplot2)
> target_counts <- table(cleveland$V14)
> target_counts
 0 1
164 139
ggplot(plot_data, aes(x = Target, y = Count, fill = Target)) +
+ geom_bar(stat = "identity") +
+ labs(title = "Total Population and Target Distribution",
+ x = "Target",
+ y = "Count") +
+ theme_minimal() +
+ theme(axis.text.x = element_text(angle = 0, hjust = 1))
> library(corrplot)
> corrplot(correlation_matrix, method = "square", order = "original",
addCoef.col = "black",number.cex = 0.5)
>
> library(ggplot2)
> age.plot <- ggplot(cleveland, mapping = aes(x = V1, fill = V14)) +
+ geom_histogram() +
+ facet_wrap(vars(V14)) +
+ labs(title = "Prevelance of Heart Disease Across Age", x = "Age
(years)", y = "Count", fill = "Heart Disease")
> age.plot
> library(ggplot2)
> sex.plot <- ggplot(cleveland, mapping = aes(x = V2, fill = V14)) +
+ geom_bar(position = "fill") + labs(x = "Sex", y = "Proportion", fill
= "Heart Disease") +
+ theme(axis.text.x = element_text(size = 12), axis.title.x =
element_text(size = 12),
+ axis.title.y = element_text(size = 12), axis.text.y =
element_text(size = 12))
> sex.plot
#decision tree
> library(caTools)
> set.seed(1200000)
> split = sample.split(cleveland$V14, SplitRatio = 0.7)
> training_set = subset(cleveland, split == TRUE)
> test_set = subset(cleveland, split == FALSE)
> training_set[,c(1,4,5,8,10,12)] =
scale(training_set[,c(1,4,5,8,10,12)])
> test_set[,c(1,4,5,8,10,12)] = scale(test_set[,c(1,4,5,8,10,12)])
> library(rpart)
> classifier = rpart(formula = V14 ~ ., control= rpart.control(minsplit =
20, cp = 0.01, maxdepth= 30),
+ data = training_set)
> y_pred = predict(classifier, newdata = test_set[-14], type = 'class')
> rpart.plot(classifier)
> cm = table(test_set[, 14], y_pred)
> confusionMatrix(cm)
Confusion Matrix and Statistics
 y_pred
 0 1
 0 44 5
 1 8 34

 Accuracy : 0.8571
 95% CI : (0.7681, 0.9217)
 No Information Rate : 0.5714
 P-Value [Acc > NIR] : 4.434e-09

 Kappa : 0.7111

Mcnemar's Test P-Value : 0.5791

 Sensitivity : 0.8462
 Specificity : 0.8718
 Pos Pred Value : 0.8980
 Neg Pred Value : 0.8095
 Prevalence : 0.5714
 Detection Rate : 0.4835
 Detection Prevalence : 0.5385
 Balanced Accuracy : 0.8590

 'Positive' Class : 0

> accuracy <- sum(diag(cm)) / sum(cm)
> accuracy
[1] 0.8571429
> precision <- diag(cm) / rowSums(cm)
> precision
 0 1
0.8979592 0.8095238
> mean(precision)
[1] 0.8537415
> recall <- diag(cm) / colSums(cm)
> recall
 0 1
0.8461538 0.8717949
> mean(recall)
[1] 0.8589744
> set.seed(1200000)
> split = sample.split(cleveland$V14, SplitRatio = 0.8)
> training_set = subset(cleveland, split == TRUE)
> test_set = subset(cleveland, split == FALSE)
> training_set[,c(1,4,5,8,10,12)] =
scale(training_set[,c(1,4,5,8,10,12)])
> test_set[,c(1,4,5,8,10,12)] = scale(test_set[,c(1,4,5,8,10,12)])
> library(rpart)
> classifier = rpart(formula = V14 ~ ., control= rpart.control(minsplit =
20, cp = 0.01, maxdepth= 30),
+ data = training_set)
> y_pred = predict(classifier, newdata = test_set[-14], type = 'class')
> rpart.plot(classifier)
> cm = table(test_set[, 14], y_pred)
> confusionMatrix(cm)
Confusion Matrix and Statistics
 y_pred
 0 1
 0 28 5
 1 8 20

 Accuracy : 0.7869
 95% CI : (0.6632, 0.8814)
 No Information Rate : 0.5902
 P-Value [Acc > NIR] : 0.0009634

 Kappa : 0.5674
Mcnemar's Test P-Value : 0.5790997

 Sensitivity : 0.7778
 Specificity : 0.8000
 Pos Pred Value : 0.8485
 Neg Pred Value : 0.7143
 Prevalence : 0.5902
 Detection Rate : 0.4590
 Detection Prevalence : 0.5410
 Balanced Accuracy : 0.7889

 'Positive' Class : 0

> accuracy <- sum(diag(cm)) / sum(cm)
> print(accuracy)
[1] 0.7868852
> precision <- diag(cm) / rowSums(cm)
> precision
 0 1
0.8484848 0.7142857
> print(precision)
 0 1
0.8484848 0.7142857
> mean(precision)
[1] 0.7813853
> recall <- diag(cm) / colSums(cm)
> recall
 0 1
0.7777778 0.8000000
> mean(recall)
[1] 0.7888889
> library(e1071)
> library(caTools)
> library(caret)
> split <- sample.split(cleveland, SplitRatio = 0.7)
> train_cl <- subset(cleveland, split == "TRUE")
> test_cl <- subset(cleveland, split == "FALSE")
> set.seed(1234)
> classifier_cl <- naiveBayes(V14 ~ ., data = train_cl)
> classifier_cl
Naive Bayes Classifier for Discrete Predictors
Call:
naiveBayes.default(x = X, y = Y, laplace = laplace)
A-priori probabilities:
Y
 0 1
0.5206186 0.4793814
Conditional probabilities:
 V1
Y [,1] [,2]
 0 52.80198 10.092591
 1 56.56989 8.283559
 V2
Y [,1] [,2]
 0 0.5841584 0.4953247
 1 0.8172043 0.3885938
 V3
Y [,1] [,2]
 0 2.683168 0.9688209
 1 3.602151 0.8094521
 V4
Y [,1] [,2]
 0 131.1287 17.41934
 1 134.6022 18.63152
 V5
Y [,1] [,2]
 0 242.9208 55.70991
 1 255.5806 49.46745
 V6
Y [,1] [,2]
 0 0.0990099 0.3001650
 1 0.1827957 0.3885938
 V7
Y [,1] [,2]
 0 0.7821782 0.9757455
 1 1.2043011 0.9731073
 V8
Y [,1] [,2]
 0 158.8812 19.64601
 1 139.8172 21.74004
 V9
Y [,1] [,2]
 0 0.1485149 0.3573832
 1 0.6021505 0.4921069
 V10
Y [,1] [,2]
 0 0.6712871 0.8666414
 1 1.6365591 1.2452331
 V11
Y [,1] [,2]
 0 1.425743 0.6220375
 1 1.870968 0.5561085
 V12
Y [,1] [,2]
 0 1.247525 0.5367670
 1 2.043011 0.9881249
 V13
Y 3.0 6.0 7.0
 0 0.80198020 0.05940594 0.13861386
 1 0.24731183 0.10752688 0.64516129
> y_pred <- predict(classifier_cl, newdata = test_cl)
> cm <- table(test_cl$V14, y_pred)
> confusionMatrix(cm)
Confusion Matrix and Statistics
 y_pred
 0 1
 0 55 8
 1 13 33

 Accuracy : 0.8073
 95% CI : (0.7207, 0.8766)
 No Information Rate : 0.6239
 P-Value [Acc > NIR] : 2.748e-05

 Kappa : 0.5992

Mcnemar's Test P-Value : 0.3827

 Sensitivity : 0.8088
 Specificity : 0.8049
 Pos Pred Value : 0.8730
 Neg Pred Value : 0.7174
 Prevalence : 0.6239
 Detection Rate : 0.5046
 Detection Prevalence : 0.5780
 Balanced Accuracy : 0.8069

 'Positive' Class : 0

> precision <- diag(cm) / rowSums(cm)
> precision
 0 1
0.8730159 0.7173913
> mean(precision)
[1] 0.7952036
> recall <- diag(cm) / colSums(cm)
> recall
 0 1
0.8088235 0.8048780
> mean(rrecall)
Error: object 'rrecall' not found
> mean(recall)
[1] 0.8068508
> set.seed(1234)
> split <- sample.split(cleveland, SplitRatio = 0.8)
> train_cl <- subset(cleveland, split == "TRUE")
> test_cl <- subset(cleveland, split == "FALSE")
> classifier_cl <- naiveBayes(V14 ~ ., data = train_cl)
> classifier_cl
Naive Bayes Classifier for Discrete Predictors
Call:
naiveBayes.default(x = X, y = Y, laplace = laplace)
A-priori probabilities:
Y
 0 1
0.5606695 0.4393305
Conditional probabilities:
 V1
Y [,1] [,2]
 0 52.67164 9.884123
 1 56.80000 8.054382
 V2
Y [,1] [,2]
 0 0.5820896 0.4950660
 1 0.8095238 0.3945601
 V3
Y [,1] [,2]
 0 2.776119 0.9064663
 1 3.533333 0.8777886
 V4
Y [,1] [,2]
 0 129.4776 16.39719
 1 134.6381 19.06069
 V5
Y [,1] [,2]
 0 242.7313 56.81472
 1 250.4571 48.90848
 V6
Y [,1] [,2]
 0 0.1268657 0.3340713
 1 0.1809524 0.3868252
 V7
Y [,1] [,2]
 0 0.8134328 0.9823090
 1 1.1904762 0.9716683
 V8
Y [,1] [,2]
 0 158.3358 19.60970
 1 138.5333 23.72643
 V9
Y [,1] [,2]
 0 0.1268657 0.3340713
 1 0.5333333 0.5012804
 V10
Y [,1] [,2]
 0 0.5649254 0.7658361
 1 1.6076190 1.3489095
 V11
Y [,1] [,2]
 0 1.395522 0.5883411
 1 1.847619 0.5847575
 V12
Y [,1] [,2]
 0 1.261194 0.636356
 1 2.209524 1.071441
 V13
Y 3.0 6.0 7.0
 0 0.79850746 0.03731343 0.16417910
 1 0.25714286 0.10476190 0.63809524
> y_pred <- predict(classifier_cl, newdata = test_cl)
> cm <- table(test_cl$V14, y_pred)
> confusionMatrix(cm)
Confusion Matrix and Statistics
 y_pred
 0 1
 0 26 4
 1 7 27

 Accuracy : 0.8281
 95% CI : (0.7132, 0.911)
 No Information Rate : 0.5156
 P-Value [Acc > NIR] : 1.84e-07

 Kappa : 0.6569
Mcnemar's Test P-Value : 0.5465

 Sensitivity : 0.7879
 Specificity : 0.8710
 Pos Pred Value : 0.8667
 Neg Pred Value : 0.7941
 Prevalence : 0.5156
 Detection Rate : 0.4062
 Detection Prevalence : 0.4688
 Balanced Accuracy : 0.8294

 'Positive' Class : 0
> precision <- diag(cm) / rowSums(cm)
> precision
 0 1
0.8666667 0.7941176
> mean(precision)
[1] 0.8303922
> recall <- diag(cm) / colSums(cm)
> recall
 0 1
0.7878788 0.8709677
> mean(recall)
[1] 0.8294233
 
