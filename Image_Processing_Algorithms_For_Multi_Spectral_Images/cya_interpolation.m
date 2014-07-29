% clc; close all; clear all;
function out = cya_interpolation(input)
% load('Macbeth_5_mosaiced.mat');

Cya_mosaiced = double(input);

[row, col] = size(Cya_mosaiced);
count_b = 0;
% filling up the sibling, same step at binary tree
for i = 3: row-2
    for j = 3:col-2
        if ((mod(i,2) == 0 && mod(j,2) == 1))
            if mod(count_b,2) == 1 % at Magenta
            Cya_mosaiced(i,j) = 0.5 * (Cya_mosaiced(i,j+2) + Cya_mosaiced(i,j-2));
            end
            count_b = count_b +1;
        end
    end
end
% fill up the diagonals one step up in the binary tree

for i = 2: row-1
    for j = 2:col-1
        if (mod(i,2) == 1 && mod(j,2) == 0)
            Cya_mosaiced(i,j) = 0.25 * (Cya_mosaiced(i-1,j-1) + Cya_mosaiced(i+1,j-1) + Cya_mosaiced(i-1,j+1) + Cya_mosaiced(i+1,j+1));
        end
    end
end

% finally feel up everything else
for i = 2: row-1
    for j = 2:col-1
        if ((mod(i,2) == 0 && mod(j,2) == 0)||(mod(i,2) == 1 && mod(j,2) == 1))
            Cya_mosaiced(i,j) = 0.25 * (Cya_mosaiced(i-1,j) + Cya_mosaiced(i+1,j) + Cya_mosaiced(i,j-1) + Cya_mosaiced(i,j+1));
        else
            Cya_mosaiced(i,j) = Cya_mosaiced(i,j);
        end
    end
end
% 
% 
% imshow(uint8(Cya_mosaiced));
out = uint8(Cya_mosaiced);