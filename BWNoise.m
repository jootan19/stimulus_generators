function [texout] = BWNoise(dot_sz,ndots_col,ndots_row,amt_white)
% creates random bw noise texture

if ~exist('dot_sz','var') || isempty(dot_sz)
    dot_sz = 3;
end
if ~exist('ndots_col','var') || isempty(ndots_col)
    ndots_col = 100;
end
if ~exist('ndots_row','var') || isempty(ndots_row)
    ndots_row = 100;
end
if ~exist('amt_white','var') || isempty(amt_white)
    amt_white = 0.5;
end

texout = zeros(ndots_row,ndots_col);
dotidx = randperm(numel(texout));
texout(dotidx(1:round(amt_white*dotidx))) = 255;
texout = kron(texout,ones(dot_sz,dot_sz));
% imshow(texout)