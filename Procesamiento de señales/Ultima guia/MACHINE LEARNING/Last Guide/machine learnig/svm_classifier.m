function svmStruct = svm_classifier(meas_1,meas_2,label)

%%
tic;


%% Create data, a two-column matrix
data   = [meas_1, meas_2];

species = cellstr(label);

%% From the species vector, create a new column vector, groups, to classify data into two groups: Setosa and non-Setosa.
groups = ismember(species,'NP')


%% Randomly select training and test sets.
[train, test] = crossvalind('holdOut',groups);
cp = classperf(groups);

%% Use the svmtrain function to train an SVM classifier using a radial basis function and plot the grouped data.
%svmStruct = svmtrain(data(train,:),groups(train),'showplot',true);
svmStruct = svmtrain(data(train,:),groups(train),'showplot',true,'kernel_function','rbf');


%% Classify the test set using a support vector machine.
classes = svmclassify(svmStruct,data(test,:),'showplot',true);


%% Evaluate the performance of the classifier.
classperf(cp,classes,test);
cp.CorrectRate

toc;
