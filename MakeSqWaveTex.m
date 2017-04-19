function [sqwavetex]=MakeSqWaveTex(s,freq,phase,contrast,tilt)
% function []=MakeSqWaveTex(s,freq,phase,contrast,tilt)
if ~exist('s','var')  || isempty(s)
    s=50;
end

if ~exist('freq','var') || isempty(freq)
    freq=0.05;
end

if ~exist('phase','var') || isempty(phase)
    phase=180/2;
end

if ~exist('contrast','var') || isempty(contrast)
    contrast=255;
end

if ~exist('tilt','var') || isempty(tilt)
    tilt     = 90;
end


try
    res      = 2*[s s];      %resolution
    sf       = freq;
    [gab_x, gab_y] = meshgrid(0:(res(1)-1), 0:(res(2)-1));
    a        = cos(deg2rad(tilt))*sf*360;
    b        = sin(deg2rad(tilt))*sf*360;
    sqWave  = square(deg2rad(a*(gab_x) + b*(gab_y)+phase));
%     figure(1)
%     plot(sqWave,'-k')
    
    sqwavetex=contrast.*sqWave';
%     figure(2)
%     imshow(sqwavetex)

catch err
    disp('error creating square wave texture')
    rethrow(err)
end
end