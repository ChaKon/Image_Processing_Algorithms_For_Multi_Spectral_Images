clc; close all; clear all;

load('Macbeth_5_mosaiced.mat');

green = green_interpolation(Macbeth_5_mosaiced(:,:,1));
red = red_interpolation(Macbeth_5_mosaiced(:,:,2));
mag = mag_interpolation(Macbeth_5_mosaiced(:,:,3));
blu = blu_interpolation(Macbeth_5_mosaiced(:,:,4));
cya = cya_interpolation(Macbeth_5_mosaiced(:,:,5));

Macbeth_5_bilinear_demosaiced = cat(3, green, red, mag, blu, cya);
save('Macbeth_5_bilinear_demosaiced.mat', 'Macbeth_5_bilinear_demosaiced');

load('flowers_5_mosaiced.mat');
 
green = green_interpolation(flowers_5_mosaiced(:,:,1));
red = red_interpolation(flowers_5_mosaiced(:,:,2));
mag = mag_interpolation(flowers_5_mosaiced(:,:,3));
blu = blu_interpolation(flowers_5_mosaiced(:,:,4));
cya = cya_interpolation(flowers_5_mosaiced(:,:,5));
 
flowers_5_bilinear_demosaiced = cat(3, green, red, mag, blu, cya);
save('flowers_5_bilinear_demosaiced.mat', 'flowers_5_bilinear_demosaiced');

load('feathers_5_mosaiced.mat');
 
green = green_interpolation(feathers_5_mosaiced(:,:,1));
red = red_interpolation(feathers_5_mosaiced(:,:,2));
mag = mag_interpolation(feathers_5_mosaiced(:,:,3));
blu = blu_interpolation(feathers_5_mosaiced(:,:,4));
cya = cya_interpolation(feathers_5_mosaiced(:,:,5));
 
feathers_5_bilinear_demosaiced = cat(3, green, red, mag, blu, cya);
save('feathers_5_bilinear_demosaiced.mat', 'feathers_5_bilinear_demosaiced');

load('balloons_5_mosaiced.mat');
 
green = green_interpolation(balloons_5_mosaiced(:,:,1));
red = red_interpolation(balloons_5_mosaiced(:,:,2));
mag = mag_interpolation(balloons_5_mosaiced(:,:,3));
blu = blu_interpolation(balloons_5_mosaiced(:,:,4));
cya = cya_interpolation(balloons_5_mosaiced(:,:,5));
 
balloons_5_bilinear_demosaiced = cat(3, green, red, mag, blu, cya);
save('balloons_5_bilinear_demosaiced.mat', 'balloons_5_bilinear_demosaiced');

