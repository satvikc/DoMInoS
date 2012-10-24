%% KNN classification 
k=10;
% loading training data 

training_data = [];
training_classes = [];
test_data = [];
test_classes = [];

disp('Loading Data');

for i=1:9
    decade = 1910 + 10*i;
    l = load(['training_data_',num2str(decade)]);
    training_data = [training_data ; l.data(:,2:end)];
    training_classes = [training_classes ; ones(size(l.data,1),1)*decade];
    m = load(['test_data_',num2str(decade)]);
    test_data = [test_data ; m.data(:,2:end)];
    test_classes = [test_classes ; ones(size(m.data,1),1)*decade];
    clear('m','l');
end

% KNN classification

disp('Beginning KNN classification');
classes = knnclassify(test_data,training_data,training_classes,10);

diff = classes - test_classes;
count = sum(diff(:)==0);
accuracy = count * 100 / length(classes)
