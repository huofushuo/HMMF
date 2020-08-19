function R = MSF(I)
r = size(I,1);
c = size(I,2);
N = size(I,4);

W = ones(r,c,N);

%compute the measures and combines them into a weight map

W = W.*contrast(I);%contrast_parm;

%normalize weights: make sure that weights sum to one for each pixel
W = W + 1e-12; %avoids division by zero
W = W./repmat(sum(W,3),[1 1 N]);


pyr = gaussian_pyramid(zeros(r,c,1));
nlev = length(pyr); 

%multiresolution blending
for i = 1:N
    % construct pyramid from each input image
	pyrW = gaussian_pyramid(W(:,:,i),nlev);
	pyrI = laplacian_pyramid(I(:,:,1,i),nlev);
    for l = 1:(nlev)
        pyr{l} = pyr{l} + pyrW{l}.*pyrI{l};
    end

end

R(:,:,1) = reconstruct_laplacian_pyramid(pyr);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% contrast measure
function C = contrast(I)
h = [0 1 0; 1 -4 1; 0 1 0]; % laplacian filter
N = size(I,4);
C = zeros(size(I,1),size(I,2),N);
for i = 1:N
    C(:,:,i) = abs(imfilter(I(:,:,1,i),h,'replicate'));
end





