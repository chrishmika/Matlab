function accuracy = OVASVMs(data,N)

% N : number of classes

[trainData,teData] = splitData(data);
%[trainData,teData] = scaleData(trData,teData);
[trData,valData] = splitData(trainData);

A=1:N; %generate Class numbers for N vs All classifiers

%training tho model
C = [2^-10 2^-9 2^-8 2^-7 2^-6 2^-5 2^-4 2^-3 2^-2 2^-1 2^0 2^1 2^2 2^3 2^4 2^5 2^6 2^7 2^8 2^9 2^10 ];

%C = [2^-10:????:2^10]

accuracy = [];

for i = 1:length(C)
    options = svmlopt('C',C(i),'Verbosity',0);
    predict=[];
    
    for class = 1:N
        %Training
        Model = [int2str(A(class)),'VsAll'];
        x = invertData(trData,A(class));
        y = x(1,end);
        x(:,end) = [];
        svmlwrite('SVMLTrain',x,y);
        svm_learn(options,'SVMLTrain',Model);
        
        %validation
        xval = invertData(valData,A(class));
        yval = xval(:,end);
        xval(:,end) = [];
        svmlwtite('SVMLVal',xval,yval);
        ModelOutput = ['Output',int2str(A(class)),'VsAll']; %its a name of the model that we use 1vsAll
        svm_classify(options,'SVMLVal',Model,ModelOutput);
        svmpredict = svmlread(ModelOutput);
        predict = [predict,svmpredict];
    end %end for class
    
    accutacy(i) = WinnerTakesAll(valData,predict,A);
end %end for i

[elt,ind] = max(accuracy); %[value, position]
cOpt = C(ind) %optimal C === best C


%testing using optimal C

options = svmlopt('c',cOpt,'Verbosity',0);
predict = [];

for class = 1:N
     Model = [int2str(A(class)),'VsAll'];
     x = invertData(trData,A(class));
     y = x(1,end);
     x(:,end) = [];
     svmlwrite('SVMLTrain',x,y);
     svm_learn(options,'SVMLTrain',Model);
     
     xtest = invertData(teData,A(class));
     ytest = xtest(:,end);
     xtest(:,end) = [];
     svmlwtite('SVMLTest',xtest,ytest);
     ModelOutput = ['Output',int2str(A(class)),'VsAll']; %its a name of the model that we use 1vsAll
     svm_classify(options,'SVMLTest',Model,ModelOutput);
     svmpredict = svmlread(ModelOutput);
     predict = [predict,svmpredict];
end %end for class

accuracy = WinnerTakesAll(teData,predict,A);
    
     