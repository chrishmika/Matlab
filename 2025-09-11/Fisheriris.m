load fisheriris
X = meas;
y = species;

%Train test Split
cv = cvpartition(y,'HoldOut',0.3);
Xtrain = X(training(cv),:);
ytrain = y(training(cv),:);
Xtest = X(test(cv),:);
ytest = y(test(cv),:);

%Train Knn model
Mdl = fitcknn(Xtrain,ytrain,'NumNeighbors',3);

%prediction
ypred = predict(Mdl,Xtest);

%Evaluation
acc = sum(strcmp(ypred,ytest))/numel(ytest);
fprintf('Accuracy: %.2f%%\n',acc*100);