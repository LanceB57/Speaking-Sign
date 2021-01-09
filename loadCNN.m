load("CNN Info/Model 1/CNN.mat");
nnet = trainedNetwork_1;

function result = pred(net, pic)
    pic = imread("Data/personal/A.jpg");
    pic = rgb2gray(pic);
    pic = imresize(pic, [28, 28]);
    result = classify(net, pic);
end