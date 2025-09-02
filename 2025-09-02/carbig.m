load carbig

%create a table with selected features
tbl = table(Horsepower,Weight,Acceleration,Cylinders,MPG);

disp('First 5 rows of dataset');
head(tbl,5)

disp('Summary statistics')
summary(tbl)

%%handeling missing values
%counting missing valuess
disp('Number of missing values per columns')
disp(sum(ismissing(tbl)))

%opt1 remove rows with missing
tbl_clean = rmmissing(tbl);
fprintf('After removing missing values %d row remain \n', height(tbl_clean))

%opt2 fill missings
tbl_fill = fillmissing(tbl,'linear');
fprintf('After filling missing values %d row remain \n', height(tbl_fill))
disp(sum(ismissing(tbl_fill)))

%%Normalization and standardization

%extract features(excluding target MPG for now)
X = tbl_clean{:,{'Horsepower','Weight','Acceleration'}};

X_norm = normalize(X,'range');

%Standardization
X_std=zscore(X);
