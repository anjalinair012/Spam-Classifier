This project aims at classifying mails into spam and non spam using an SVM.

Files included in this project are:
	spam_file:This file generates the .mat dataset used for training and testing of the SVM
	spam_main:The main code to train the SVM and make predictions
	processEmail: This function processes the body of an email and returns a list of indices of the words contained in the email
	emailFeatures: This function takes a word indices vector and produces a feature vector from it
	readFile: return contents of the file passed to it
	porterStemmer:Function to stem the words passed
	getVocalList: return a list of words from the vocab.txt file
	vocab.txt: a text file of word or characters one might find often in spam mail.
	emailSample2,spamSample1,spamSample2 - Text files containing contents of a mail on which one can make predictions after training 	and testng the SVM
	dataset: a Folder containing spam and non spam emails. finaldata.mat is created from this dataset. source: 	http://spamassassin.apache.org/old/publiccorpus/



Spam_file creates the finaldata.mat from around 2000 emails in the dataset folder. This would take around 10 hours on an i5 8GB ram processing. If you wish you can directly use the finaldata.mat file included in this project. In which case, you may skip running spam_file
Following this run spam_main file.
