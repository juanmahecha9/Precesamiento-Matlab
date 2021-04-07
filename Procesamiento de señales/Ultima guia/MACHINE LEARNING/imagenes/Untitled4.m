% List out the category values in use.
categories = [0; 1];

% Get the number of vectors belonging to each category.
vecsPerCat = getVecsPerCat(X, y, categories);

% Compute the fold sizes for each category.
foldSizes = computeFoldSizes(vecsPerCat, 10);

% Randomly sort the vectors in X, then organize them by category.
[X_sorted, y_sorted] = randSortAndGroup(X, y, categories);

% For each round of cross-validation...
for (roundNumber = 1 : 10)

% Select the vectors to use for training and cross validation.
[X_train, y_train, X_val, y_val] = getFoldVectors(X_sorted, y_sorted, categories, vecsPerCat, foldSizes, roundNumber);

% Train the classifier on the training set, X_train y_train
% .....................

% Measure the classification accuracy on the validation set.
% .....................

end