a = imread('1-1.jpeg');

% Turn the input image into a binary image.
bw = a < 100;
imshow(bw)
title('Image with Circles')

% Calculate properties of regions in the image and return the data in a table.
stats = regionprops('table',a,'all')

% Get centers and radii of the circles.
% centers = stats.Centroid;
% diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
% radii = diameters/2;

% Plot the circles.
% hold on
% viscircles(centers,radii);
% hold off