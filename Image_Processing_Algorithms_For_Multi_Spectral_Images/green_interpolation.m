% clc; close all; clear all;
function out = green_interpolation(input)
% load('Macbeth_5_mosaiced.mat');

Green_mosaiced = double(input);

[row, col] = size(Green_mosaiced);

for i = 2: row-1
    for j = 2:col-1
        if ((mod(i,2) == 1 && mod(j,2) == 0)||(mod(i,2) == 0 && mod(j,2) == 1))
            Green_mosaiced(i,j) = 0.25 * (Green_mosaiced(i-1,j) + Green_mosaiced(i+1,j) + Green_mosaiced(i,j-1) + Green_mosaiced(i,j+1));
        end
    end
end

% imshow(uint8(Green_mosaiced));
out = uint8(Green_mosaiced);
