% clc; close all; clear all;
function out = red_interpolation(input)
% load('Macbeth_5_mosaiced.mat');

Red_mosaiced = double(input);

[row, col] = size(Red_mosaiced);
count_r = 0;
% filling up the sibling, same step at binary tree
for i = 3: row-2
    for j = 3:col-2
        if ((mod(i,2) == 1 && mod(j,2) == 0))
            if mod(count_r,2) == 0 % at Magenta
            Red_mosaiced(i,j) = 0.5 * (Red_mosaiced(i,j+2) + Red_mosaiced(i,j-2));
            end
            count_r = count_r +1;
        end
    end
end
% fill up the diagonals one step up in the binary tree

for i = 2: row-1
    for j = 2:col-1
        if (mod(i,2) == 0 && mod(j,2) == 1)
            Red_mosaiced(i,j) = 0.25 * (Red_mosaiced(i-1,j-1) + Red_mosaiced(i+1,j-1) + Red_mosaiced(i-1,j+1) + Red_mosaiced(i+1,j+1));
        end
    end
end

% finally feel up everything else
for i = 2: row-1
    for j = 2:col-1
        if ((mod(i,2) == 0 && mod(j,2) == 0)||(mod(i,2) == 1 && mod(j,2) == 1))
            Red_mosaiced(i,j) = 0.25 * (Red_mosaiced(i-1,j) + Red_mosaiced(i+1,j) + Red_mosaiced(i,j-1) + Red_mosaiced(i,j+1));
        else
            Red_mosaiced(i,j) = Red_mosaiced(i,j);
        end
    end
end


% imshow(uint8(Red_mosaiced));
out = uint8(Red_mosaiced);