# defining outcome, exposures

outcome_model <- 'bact'

exposures_model <- names(train)[grepl("spectrum", names(train))]


outcome_and_exposure_model <- as.formula(
  paste( paste(outcome_model ,'~'
        , paste(exposures_model, collapse = " + ") )
  )
)

# Machine learning methods
gbmFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "gbm",
                trControl = fitControl,
                verbose = T,
                metric = "ROC" ## Specify which metric to optimize
)
svmFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "svmRadial",
                trControl = fitControl,
                preProc = c("center", "scale"),
                tuneLength = 8,
                metric = "ROC" ## Specify which metric to optimize
)
rfFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "rf",
                trControl = fitControl,
                verbose = T,
                metric = "ROC" ## Specify which metric to optimize
)
xgbFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "xgbTree",
                trControl = fitControl,
                verbose = T,
                metric = "ROC" ## Specify which metric to optimize
)
nnFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "nnet",
                trControl = fitControl,
                verbose = T,
                metric = "ROC" ## Specify which metric to optimize
)
lrFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "LogitBoost",
                trControl = fitControl,
                verbose = T,
                metric = "ROC" ## Specify which metric to optimize
)
gamFit <- train( outcome_and_exposure_model
                ,data = train,
                method = "gam",
                trControl = fitControl,
                verbose = T,
                metric = "ROC" ## Specify which metric to optimize
)