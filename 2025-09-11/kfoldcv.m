load fisheriris
X = meas;
Y = species;

nFolds = 5;
cv = cvpartition(Y,'KFold',nFolds);
accuracy = zeros(nFolds,1);

for i = 1:nFolds
    %Training and test indices
    trainIdx = training(cv,i);
    testIdx = test(cv, i);
    
    %train kNN model
    model = fitcknn(X(trainIdx,:),Y(trainIdx),'NumNeighbors',5);
    
    %Prediction
    predictions = categorical(predict(model,X(trainIdx,:)));
    
    %evalueation
    accuracy(i) = sum(predictions == Y(testIdx)) / numel(predictions);
    fprintd('Fld %d Accuracy %.2f%%\n',i,accuracy(i)*100);
end

%overall performance
fprintf('\nAverage accuracy accross %d folds: %.2f%%\n',nFolds,mean(accuracy)*100);