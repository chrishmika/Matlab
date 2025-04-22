
function CB = constructCodebook(subjects,nTrImgs,K)

CB = [];

for sub = 1:subjects
    descrips = [];
    for imgs = 1:nTrImgs % number of training images
        % load SIFT descriptors
        fname = ['.\descriptors\s' int2str(sub) '\' int2str(imgs) '.txt'];
        d = load(fname);
        descrips = [descrips;d];
    end
    
    %Constructing category-specific codebook
    tic
    [idx,C] = kmeans(descrips,K);
    toc
    
    %Concatenating category-specific codebook
    CB = [CB;C]; 
end
   
