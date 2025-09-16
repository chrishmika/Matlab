data={
'sunny','warm','normal','string','warm','same','yes';
'sunny','warm','high','string','warm','same','yes';
'rainy','cold','normal','string','warm','change','no';
'sunny','warm','normal','string','cool','change','yes';
};

%initialize the most specific hypothesis
attributes = size(data,2)-1;
hypothesis = repmat('0',2,attributes);
%disp(hypothesis )

%FIND-S algorithm
for i = 1:size(data,1)
    if strcmp(data{i,end},'yes')
        if all(hypothesis == '0')
            for j = 1:attributes
                hypothesis(j)= data{1,j}(1);
                temp_hypothesis{j} = data{i,j};
            end
        else
            %generalize hypothesis were needed
            for j= 1:attributes
                if ~strcmp(temp_hypothesis{j},data{i,j})
                    temp_hypothesis{j}='?';
                end
            end
        end
    end
end

disp('Final Hypothesis using FIND-S')
disp(temp_hypothesis)