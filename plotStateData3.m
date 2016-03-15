function  plotStateData( X, y , name)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

yaxis = 'M HH Inc. 07-14';
x1 = 'Pop 14';
x2 = 'Pop 10 1'; 
x3 = 'Pop 10 2'; 
x4 = 'Num veterans';
x5 = 'Housing Units';
x6 = 'Private non farm employment';
x7 = 'Num firms';
x8 = 'Manufacturing shipments';
x9 = 'Retail sales';
x10 = 'Accom and food sales';
x11 = '% foreign born';
x12 = 'High school or higher';
x13 = 'BA degree or higher';
x14 = '% below poverty line';
x15 = '% women owned firms';
xaxes = {x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15};
numplots = size(xaxes, 1);
for i=1:numplots
    x = X(:,i);
    plotX1X2_nameaxes2(4, 4, i, name, x, y , xaxes(i), yaxis);
end
end

