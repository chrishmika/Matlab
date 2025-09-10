load carbig
tbl = table(Horsepower,Weight,Acceleration,Cylinders,MPG);
tbl_clean = rmmissing(tbl);
X = tbl_clean{:,{'Horsepower','Weight','Acceleration'}};
X_norm = normalize(X,'range');
X_std=zscore(X);

subplot(1,2,1);histogram(X(:,1));title('Original Hoursepower');
subplot(1,2,2);histogram(X_std(:,1));title('Standardised Horsepower');

tbl_clean.Cylinders = categorical(tbl_clean.Cylinders);
cyl_encoded = dummyvar(tbl_clean.Cylinders);
disp(cyl_encoded(1:5,:));

corrVals = corr(tbl_clean{:,{'Horsepower','Weight','Acceleration'}},tbl_clean.MPG,'Rows','complete');

disp('Correlation of feature with MPG:');
disp(array2table(corrVals,'VariableNames',{'Correlation'},'RowNames',{'Horsepower','Weight','Acceleration'}));