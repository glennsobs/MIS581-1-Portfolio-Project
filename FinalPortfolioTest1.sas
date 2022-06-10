libname frack '/home/u38803789/SASUniversityEdition/myfolders/sasuser.38/';

proc import datafile='/home/u38803789/SASUniversityEdition/myfolders/sasuser.38/OperatorCount.csv'
	out=frack
	dbms=csv
	replace;

	/*h0 is based on 16% of the average number of spills, 20*/

proc ttest data=frack sides=u alpha=.05 h0=3;
	var Incidents;

run;