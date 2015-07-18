This project includes the following files:
	server.R
	ui.R
	temp.txt
	essay_score.Rmd
	model1.rda
	question.csv


The question.csv shows the original data used to create the model.

The essay_score.Rmd file shows the creation of the model for scoring the essays.
	A number of different models were explored (e.g., randomForest) before selecting this model.

The model1.rda is the exported model for use by server.R
The temp.txt file is the list of variables and it is used by server.R to set up the data frame.


The server.R and ui.R files were posted on the shinyapp.io site so that the program runs.
	Additionally model1.rda and temp.txt were uploaded to support the server.R file.