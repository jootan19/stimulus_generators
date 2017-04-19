function [tex] = MakeCheckeredBoard(texH,texW,pxpersq,startColor)
% Makes binary checkered box image
%   [USAGE]
%           [INPUT]         [FORMAT]        [COMMENTS]
%           --------------------------------------------
%           texH            INT             texture Height
%           texW            INT             texture Width
%           pxpersq         INT             num pixels per square
%           startColor      STR             Color of top left hand corner square ['w' or 'b']
%
% version history
% 18 feb 2014 wrote it - joo

if ~exist('texH','var') || isempty(texH);
    texH    = 500;  % texture height
end
if ~exist('texW','var') || isempty(texW);
    texW    = 500;  % texture width
end
if ~exist('pxpersq','var') || isempty(pxpersq);
    pxpersq = 50;
end
if ~exist('startColor','var') || isempty(startColor);
    startColor = 'w';
end

try
    numcol  = texW/pxpersq;
    numrow  = texH/pxpersq;
    tex = zeros(texW,texH,1);
    for x = 1:numcol
        for y = 1:numrow
            if mod(x,2)==1
                if mod(y,2)==1
                    xfrom = (x-1) * pxpersq + 1;
                    xto   = xfrom + pxpersq - 1;
                    yfrom = (y-1) * pxpersq + 1;
                    yto   = yfrom + pxpersq - 1;
                    tex(yfrom:yto,xfrom:xto,:) = 1;
                end
            else
                if mod(y,2)==0
                    xfrom = (x-1) * pxpersq + 1;
                    xto   = xfrom + pxpersq - 1;
                    yfrom = (y-1) * pxpersq + 1;
                    yto   = yfrom + pxpersq - 1;
                    tex(yfrom:yto,xfrom:xto,:) = 1;
                    
                end
            end
        end
    end
    if strcmpi(startColor , 'b')
        tex = imcomplement(tex);
    end
    
    
catch err
    sca
    fprintf('\n\n Error generating checkered board \n\n')
    rethrow(err)
end