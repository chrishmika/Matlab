function featVectors = histogramming(subjects,sImgs,eImgs,codebook)

K = size(codebook,1);
ftVec = [];


for sub = 1:subjects
    hist = [];
    lbl = [];
    for imgs = sImgs:eImgs
        h = zeros(1,K); 
        % load SIFT descriptors
        fname = ['.\descriptors\s' int2str(sub) '\' int2str(imgs) '.txt'];
        descrips = load(fname);
        
        %histogramming   
        for descriptor = 1:size(descrips,1)
            for codeword = 1:K
               d(codeword) = norm(descrips(descriptor,:)-codebook(codeword,:));
            end
            [elt,index] = min(d);
            h(index) = h(index) + 1;
        end
        hist = [hist; h];
    end
    lbl = [lbl;sub*ones(eImgs-sImgs+1,1)];
    hist = [hist lbl];
    ftVec = [ftVec; hist];
end

featVectors = ftVec;



