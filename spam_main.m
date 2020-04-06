%Thisis the main file.The dataset we created is first loaded and then split into train and test set by ratio 70:30

load('finaldata.mat');
[m,n]=size(X);
perm=randperm(m);
train_size=round(0.7*m);
Xtrain=X(perm(1:train_size),:);
ytrain=y(perm(1:train_size),:);
Xtest=X(perm((train_size+1):end),:);
ytest=y(perm((train_size+1):end),:);

%Optimum C is chosen after training it with multiple values and comparing the results.
C=0.1;

model=svmtrain(ytrain, Xtrain, cstrcat('-t 0 -c ',num2str(C)));

[ptrain_label]=svmpredict(ytrain,Xtrain,model);

train_accuracy=mean(double(ytrain==ptrain_label))*100;
fprintf('train accuracy is %f\n',train_accuracy);

[ptest_label]=svmpredict(ytest,Xtest,model);

test_accuracy=mean(double(ptest_label==ytest))*100;
fprintf('test accuracy is %f\n',test_accuracy);

%We pass a new spam sample and see the prediction by our model
content=readFile('spamSample1.txt');
word_indices=processEmail(content);
x=emailFeatures(word_indices);

%pass a random value for label to svmpredict. The accuracy returned by this function would not be relaible but the prediction isn't effected
val=svmpredict([0],x,model);

fprintf('Mail is classified as %d\n',val);