function ie=jmerode(I,M)
% Erode binary image I with a 3x3 structure mask M

ie=conv2(I,M,'same');
ie=fix(ie+.001);
ie=uint8(ie);