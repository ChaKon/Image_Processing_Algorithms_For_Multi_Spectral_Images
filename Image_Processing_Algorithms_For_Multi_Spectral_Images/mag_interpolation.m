% clc; close all; clear all;
function out = mag_interpolation(input)
% load('Macbeth_5_mosaiced.mat');

Mag_mosaiced = double(input);

[row, col] = size(Mag_mosaiced);
count_r = 0;
% filling up the sibling, same step at binary tree
for i = 3: row-2
    for j = 3:col-2
        if ((mod(i,2) == 1 && mod(j,2) == 0))
            if mod(count_r,2) == 1 % at Magenta
            Mag_mosaiced(i,j) = 0.5 * (Mag_mosaiced(i,j+2) + Mag_mosaiced(i,j-2));
            end
            count_r = count_r +1;
        end
    end
end
% fill up the diagonals one step up in the binary tree

for i = 2: row-1
    for j = 2:col-1
        if (mod(i,2) == 0 && mod(j,2) == 1)
            Mag_mosaiced(i,j) = 0.25 * (Mag_mosaiced(i-1,j-1) + Mag_mosaiced(i+1,j-1) + Mag_mosaiced(i-1,j+1) + Mag_mosaiced(i+1,j+1));
        end
    end
end

% finally feel up everything else
for i = 2: row-1
    for j = 2:col-1
        if ((mod(i,2) == 0 && mod(j,2) == 0)||(mod(i,2) == 1 && mod(j,2) == 1))
            Mag_mosaiced(i,j) = 0.25 * (Mag_mosaiced(i-1,j) + Mag_mosaiced(i+1,j) + Mag_mosaiced(i,j-1) + Mag_mosaiced(i,j+1));
        else
            Mag_mosaiced(i,j) = Mag_mosaiced(i,j);
        end
    end
end

out = uint8(Mag_mosaiced);
% imshow(uint8(Mag_mosaiced));