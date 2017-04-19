function [texout] = RGBNoise2(dot_sz,ndots_col,ndots_row)
% creates random RGB noise texture

if ~exist('dot_sz','var') || isempty(dot_sz)
    dot_sz = 3;
end
if ~exist('ndots_col','var') || isempty(ndots_col)
    ndots_col = 100;
end
if ~exist('ndots_row','var') || isempty(ndots_row)
    ndots_row = 100;
end

mask = zeros(ndots_row,ndots_col);
r = zeros(ndots_row*dot_sz,ndots_col*dot_sz);
g = r;
b = r;

randidx = randperm(numel(mask));
for ii = 1:numel(mask)
    clrid = mod(ii,3)+1;
    mask(randidx(ii)) = clrid;
end
mask = kron(mask,ones(dot_sz,dot_sz));

r(mask==1) = 255;
g(mask==2) = 255;
b(mask==3) = 255;

texout = cat(3,r,g,b);

