function extractSIFT(subjects,nImgs)

% subjects - Total number of subjects
% nImgs - Total number of images per subject

for sub = 1:subjects
    for imgs = 1:nImgs % number of images
        % extract SIFT descriptors
        fname = ['.\faces\s' int2str(sub) '\' int2str(imgs) '.pgm'];
        I = imread(fname);
        if length(size(I))==3
            I = rgb2gray(I);
        end
        I = single(I);
        [frames,descrips] = vl_sift(I);
        descrips = double(descrips');
        fname = ['.\descriptors\s' int2str(sub) '\' int2str(imgs) '.txt']; 
        save(fname, 'descrips', '-ASCII');
    end
end


