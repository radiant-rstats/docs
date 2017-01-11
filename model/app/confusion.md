> Evaluate model classification using the confusion matrix

To download the table as a csv-files click the top download button on the right of your screen. To download the plots at a png file click the lower download icon on the right of your screen.

#### Response variable

The outcome, or response, variable of interest. This should be binary variable, either a factor or an integer with two value (i.e., 0 and 1).

#### Choose level

The level in the response variable that is considered a _success_. For example, purchase or buyer is equal to `yes`.

#### Predictor

Select one or more variables that can be used to _predict_ the chosen level in the response variable. This could be a variable, an RFM index, or predicted values from a model (e.g., from a logistic regression estimated using _Model > Logistic regression (GLM)_ or a Neural Network estimated using _Model > Neural Network (ANN)_).

#### Margin & Cost

Enter the `Margin` for each sale and the estimated `Cost` per contact (e.g., mailing costs or opportunity cost of email or text). For example, if the margin on a sale is \$10 (excluding the contact cost) and the contact cost is \$1 enter 10 and 1 in the `Margin` and `Cost` input windows.

#### Show results for

If a `filter` is active (e.g., set in the _Data > View_ tab) generate results for `All` data, `Training` data, `Validation` data, or `Both` training and validation data. If no filter is active calculations are applied to all data.

#### The confusion matrix

The probabilities provided by the predictors are first converted to a class (e.g., a positive or negative prediction) using the `Margin` and `Cost` information provided. It will be profitable to contact a customer if predicted probability of response exceeds `Cost / Margin`. For example, if the break-even response rate is 0.1 and the predicted probability of response is 0.25 that customer will be assigned the label _Positive_. If, on the other hand, the predicted probability does not exceed the break-even response rate a customer will be assigned a _Negative_ label.

Once each prediction has been converted to a class label (i.e., Positive or Negative) the result is compared to the values of the response variable. The following key measures are shown in the generated table for each predictor.

Label                    | Description
------------------------ | ------------------------------------------------------------------
TP (True Positive)       | The positive prediction matches the positive outcome in the data
FP (False Positive)      | A positive prediction but a negative outcome in the data
TN (True Negative)       | The negative prediction matches the negative outcome in the data
FN (False Negative)      | A negative prediction but a positive outcome in the data
total                    | Total number of observations (i.e., TP + FP + TN + FN)
TPR (True Positive Rate) | Of all positive outcomes, what proportion received a positive prediction (i.e., TP / (TP + FN)). Also known as _sensitivity_ or _recall_
TNR (True Negative Rate) | Of all negative outcomes, what proportion received a negative prediction (i.e., TN / (TN + FP)). Also known as _specificity_
precision                | Of all positive predictions, what proportion has a positive outcome in the data (i.e., TP / (TP + FP))
accuracy                 | Of all outcomes, what proportion was correctly predicted as either positive or negative (i.e., (TP + TN) / total)
kappa                    | Corrects the accuracy measure for the probability of generating a correct prediction purely by chance

<!-- Only ... are plotted by default. It is possible to customize the plotted results _R > Report_. For example, ... -->
<!--
http://www.dataschool.io/simple-guide-to-confusion-matrix-terminology/
http://lab.rady.ucsd.edu/sawtooth/RBusinessAnalytics/logit_models.html
-->
