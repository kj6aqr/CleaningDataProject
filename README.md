# CleaningDataProject

Purposes of run_analysis.R is to devolve two raw datasets from 10299x563 to a more manageable dataset of 180x81.  Full description of the output table is described in codebook.rmd.

# Algorithm description

1. Initially, the data files [train|test]/X_[train|test].txt are read, which contain the bulk of the data.
2. The categories are read from features.txt, and applied to the column names of test_set and training_set.
3. These two sets are filtered to remove everything except the mean() and std() columns, reducing the dataset width at this point from 561 to 79 variables.
4. The activities are read from [train|test]/y_[train|test].txt and added to the datasets as "Activity"
5. The subjects are read from [train|test]/subject_[train|test].txt and added to the datasets as "Subject"
6. The test and training datasets are then concatenated.  This dataset will be 10299x81.
7. Labels for the activities are read from activity_labels.txt, and replace the activity IDs in the Activity column.
8. The data is then aggregated into the means for each (activity,subject) pair, reducing the final dataset to 180x81.