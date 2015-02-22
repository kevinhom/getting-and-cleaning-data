# Coursera Getting and Cleaning Data Course Project

This script starts with the assumption that the Samsung data is available in the working directory in an unzipped UCI HAR Dataset folder and that the dplyr library is installed in the user's R UI. The script, 'run_analysis.R', generates a tidy data text file that meets the principles of the Getting and Cleaning Data course project. The script takes locally sourced, downloaded data from the UCI Human Activity Recognition Using Smartphones Data Set (source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and converts the raw data set into one file that summarizes the averages of each measurement variable for each activity/subject. Specifically, for the script, its goals are to:

1) Merge the training and the test sets to create one data set;

2) Extract only the measurements on the mean and standard deviation for each measurement; 

3) Use descriptive activity names to name the activities in the data set;

4) Appropriately label the data set with descriptive variable names;

5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. 

As the assignment dictates, only the mean and standard deviation for each measurement were extracted. Only original, non-derived, measurement patterns were included (e.g., Body Acceleration). In the original 'features_info.txt', it described the variables as:

mean(): Mean value

std(): Standard deviation

...

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Mean and standard deviation are self-explanatory, but I decided to remove meanFreq() variables because these variables were averages of other frequency components. Another reason was that I also did not know the weights the UCI team used to calculate these mean frequency values.

For this particular script, I chose variables of independent measurements of activity/subject actions in order to make the measurement data have 1:1 matching to the subject/activity per line (thus the data set is considered wide format).

I renamed the measurement variables to R readable cases and corrected some errors in the original features because I felt that would make it easier to see the data was tidy (e.g., symbols like -,(, or ) are not R valid names). Some manual cleaning for the names is done in the script (for some tough cases from the original 'features.txt'), but those lines can be skipped if the 'measurement_names.txt' is imported into the script. The file, 'Codebook.md', contains descriptions of all the variables used in the tidy data set.

The resulting file from the script, 'tidyset.txt', is a product from achieving Goal #5. The file summarizes the data for each subject/activity and averages each measurement. This file can be found in the master branch of this Github repository as well as on my Coursera project submission page.

Closing thoughts:

WARNING: MAY NOT WORK FOR ALL COMPUTERS - You can use the following lines of code to read the 'tidyset.txt' file into R:

address <- "https://github.com/lemonkiwi/getting-and-cleaning-data/blob/master/tidyset.txt"

address <- sub("^https", "http", address)

data <- read.table(url(address), header = TRUE) #if you use some other way of saving the file than a default write.table, this step will be different

View(data)


Please note that the very raw data from the Inertial folder were not utilized since the Test and Train X and Y data in the source data set already had transformed this data into somewhat usable format. 

For more information about the variables, please see 'Codebook.md' in the Github repository.

For more information about tidy data, see the course project discussion: https://class.coursera.org/getdata-011/forum/thread?thread_id=248

To learn more about the origin of the data, please reference the paper below: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
