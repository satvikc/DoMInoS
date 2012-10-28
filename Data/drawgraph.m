% get accuracies 
k = [1,2,5,10,20,50,100,150,200,500];
a = [];
for i=k
    l = load(['knnoutput_',num2str(i),'.mat']);
    a = [a  l.accuracy];
end

figure(1);
plot(k,a);
title('KNN accuracy');
xlabel('k');
ylabel('accuracy');
plot2svg('knnaccuracy.svg');