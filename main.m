clear; clc; close all;

% Configure webcam, pause for five seconds, get background image
camera = webcam('EOS Webcam Utility');
pause(5);
bg = flip(snapshot(camera), 1);
% figure(1); subplot(1, 3, 1); imshow(bg); title("Background");

[rows, columns, colChannels] = size(bg);

columns = columns / 2;

last = get(gcf, 'CurrentKey');
tStart = tic;
while last ~= 'e'
    im = flip(snapshot(camera), 1);
    im = bg - im;
    % figure(1); subplot(1, 3, 2); imshow(im); title("Subtracted");
    im = rgb2gray(im);
    im = imbinarize(im);
%     im = bwareaopen(im, 10000);
%     im = imfill(im, 'holes');
    % figure(1); subplot(1, 3, 3); imshow(im); title("B & W");
    imshowpair(bg, im, 'montage');
    last = get(gcf, 'CurrentKey');
    if toc(tStart) >= 5
        disp("Hello");
        newBg = flip(snapshot(camera), 1);
        bg(1:1, columns:columns + columns - 1) = newBg(1:1, columns: 2 * columns - 1);
        tStart = tic;
    end
end

close all;