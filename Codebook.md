The 'run_analysis.R' script uses the mean and standard deviation variables from these features to create a readable tidy data set. The resulting file from the script, 'tidyset.txt', summarizes the mean and standard deviation of each measurement (using their averages) for each subject/activity in a tidy data format.

What does a tidy data set mean? It means that:

1) Each variable you measure should be in one column;

2) Each different observation of that variable should be in a different row;

3) There should be one talbe for each "kind" of variable;

4) If you have multiple tables, they should include a column in the table that allows them to be linked.

[courtesy of Jeff Leek's "Getting and Cleaning Data" Coursera course. https://github.com/jtleek/datasharing]


=================
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Note: Features are normalized and are within the range of [-1,1]. *Normalized = relative changes*

't' = time; 'f' = frequency

tBodyAcc-XYZ = Body Linear Acceleration

tGravityAcc-XYZ = Gravitational Acceleration

tBodyAccJerk-XYZ = Body Acceleration (Jerk)

tBodyGyro-XYZ = Body Angular Velocity

tBodyGyroJerk-XYZ = Body Angular Acceleration (Jerk)

tBodyAccMag = Body Acceleration magnitude

tGravityAccMag = Gravitational Acceleration magnitude

tBodyAccJerkMag = Body Linear Acceleration (Jerk) magnitude

tBodyGyroMag = Body Angular Velocity magnitude

tBodyGyroJerkMag = Body Angular Acceleration (Jerk) magnitude

fBodyAcc-XYZ = FFT Body Linear Acceleration

fBodyAccJerk-XYZ = FFT Body Linear Acceleration (Jerk)

fBodyGyro-XYZ = FFT Body Angular Velocity

fBodyAccMag = FFT Body Linear Acceleration magnitude

fBodyAccJerkMag = FFT Body Linear Acceleration (Jerk) magnitude

fBodyGyroMag = FFT Body Angular Velocity magnitude

fBodyGyroJerkMag = FFT Body Angular Acceleration (Jerk) magnitude


In the 'run_analysis.R' script, only the mean and standard deviation of the measurements needed to be used. However, since the characters '()' and several other non-alphanumeric symbols are not valid to use for names in R, the script removes these characters to better suit the data for analysis within R. The set of variables that were estimated from these signals are: 

mean(): Mean value (USED FOR 'run_analysis.R' SCRIPT)

std(): Standard deviation (USED FOR 'run_analysis.R' SCRIPT)

-------------

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

------------

The angle() variables were not used, but important to note. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'measurement_names.txt' in the Github repository or from 'features.txt' from the source data. See the 'README.md' for more information.
