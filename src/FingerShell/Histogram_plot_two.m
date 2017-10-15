function [] = Histogram_plot_two(a,b)
%This function plots two histograms  in the same plot with red and green
%colours
[y1,x1]=hist(a,20);
bar(x1,y1,'r');grid;hold on;
[y1,x1]=hist(b,20);
bar(x1,y1,'g');grid;
hold off;
end

