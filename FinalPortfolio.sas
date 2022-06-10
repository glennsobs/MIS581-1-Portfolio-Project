libname frack '/home/u38803789/SASUniversityEdition/myfolders/sasuser.38/';

proc import datafile='/home/u38803789/SASUniversityEdition/myfolders/sasuser.38/SpillsV5.csv'
	out=frack
	dbms=csv
	replace;

proc sql;
	select count(distinct Operator) as distinctop
	from frack;
quit;

proc freq data=frack order=freq;
table Operator;
run;


proc means chartype qrange p95 mean median mode kurtosis t nmiss skew std data=frack;

proc univariate all data = frack;

/*h1*/
proc freq data=frack;
table Operator /CHISQ all; 
	
/*h2*/
proc glm data=frack;
	class FacilityType;
	model SpillType = FacilityType;

/*h3*/ 	
proc ttest data=frack sides=u alpha=.05 h0=7;
	var DaystoReport;

 /* h4*/
proc logistic data=frack;
	model CurrentLandUse = livestock PublicByway ResidenceOrOccupiedStructure SurfaceWaterSupplyArea WatersoftheState;

run;

