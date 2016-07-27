clear;
close all;

origRes    = 2000; 
x          = .5*origRes - 250;
finalRes   = 200;
im         = 255*ones(origRes); % white background
im(x:x+500, x:x+500) = 1; % central black square
if(0)
    % at 24fps
    movement = repmat( 5*[ones(1,1) -ones(1,1)], 1, 24 ); % movement in horizontal direction (pixels)
else
    % at 100fps with aliasing
    movement = repmat( 5*[ones(1,4) -ones(1,4)], 1, 100 ); % movement in horizontal direction (pixels)
    x = [1:length(movement)];
    x2 = [1:5:length(movement)];
    movement = interp1(x,movement,x2);
end

% make movie
M = zeros( finalRes, finalRes, length(movement) );
c = 1;
for m = movement
    im = circshift(im, m, 2); %shifts by m along dimension 2
    M(:,:,c) = imresize(im, [finalRes finalRes] );
    c = c + 1;
end

% scale intensities into [0,255]
M = M - min(M(:));
M = 255 * M / max(M(:));

% play and save movie
vidObj = VideoWriter('3Hz,2000px_aliased.avi');
vidObj.FrameRate = 24;
open(vidObj);
 
for c = 1 : size(M,3)
    frame = M(:,:,c)/255;
    frame = min(frame,1); % to deal with floating-point error
    writeVideo(vidObj, frame);
    imagesc( M(:,:,c), [0 255] );
    axis image off;
    colormap gray;
    drawnow;
end
close(vidObj);
