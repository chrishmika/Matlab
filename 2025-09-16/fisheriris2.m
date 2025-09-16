load fisheriris
X = meas;
Y = species;

nFolds = 5;
cv = cvpartition(Y,'KFold',nFolds);
accuracy = zeros(nFolds,1);

for i = 1:nFolds
    %Training and testing
    trainIdx = training(cv , i);
    testIdx = test(cv,i);
    
    %Train kNN model
    model = fitcsvm(X(trainIdx,:),Y(trainIdx),'KernelFunction','linear');
    
    predictions = categorical(predict(model,X(testIdx,:)));
    
    accuracy(i) = sum(predictions == Y(testIdx))/numel(predictions);
    fprintf('Fold %d Accuracy: %.2f%%\n', i ,accuracy(i)*100); 
end

%overall performance
fprintf('\nAverage accuracy accross %d folds : %.2f%%\n',nFolds,mean(accuracy)*100);

