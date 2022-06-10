libname frack '/home/u38803789/SASUniversityEdition/myfolders/sasuser.38/';

proc import datafile='/home/u38803789/SASUniversityEdition/myfolders/sasuser.38/SpillsToReportOutliers.csv'
	out=frack
	dbms=csv
	replace;

proc sql;
	select count(distinct Operator) as distinctop
	from frack;
quit;

/* h3 with outliers removed */

proc ttest data=frack sides=u alpha=.05 h0=7;
	var DaystoReport;
 
run;