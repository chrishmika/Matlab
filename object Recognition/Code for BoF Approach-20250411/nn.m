function rate = nn(trData,teData)

mtr = size(trData,1);
mte = size(teData,1);

predict = [];
for j=1:mte %for each testing data
	d = [];
	y = teData(j,1:end-1);
	for i=1:mtr %for each training data
		d(i) = norm(y-trData(i,1:end-1));
	end
	[elt,ind] = min(d);
	predict(j) = trData(ind,end);
end

actual = teData(:,end);
rate = 100*sum(actual==predict')/mte;
	
	