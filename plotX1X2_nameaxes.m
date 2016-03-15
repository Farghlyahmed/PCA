function plotX1X2_nameaxes( subplotsx, subplotsy, posplot, name, x, y , xaxis, yaxis)
% Plots a scatter chart of x1 and x2
%   
a = 5;
subplot(subplotsx,subplotsy,posplot)
scatter(x,y,'b.')
xlabel(xaxis)
ylabel(yaxis)
title(name)
%limits = [-0.3 0.3 -0.3 0.3];
%axis(limits)

end

