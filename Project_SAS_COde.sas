/* Defining the filename */
FILENAME REFFILE '/home/u63531932/STAT305/ASSIGN1/Marketing Data A.xlsx';

/* Importing data */
PROC IMPORT DATAFILE=REFFILE
    DBMS=XLSX
    OUT=WORK.MARKETINGA
    REPLACE;       
    GETNAMES=YES;
RUN;

/* Check data structure */
PROC CONTENTS DATA=WORK.MARKETINGA; 
RUN;

/* View dataset */
%web_open_table(WORK.MARKETINGA);


/*-----------------------------------------------------------------------*/
/* CREATING A ONE-WAY TABLE  && SUMMARY MEASURES OF QUANTITATIVE         */                     
/*-----------------------------------------------------------------------*/

proc freq data=WORK.MARKETINGA;      /* dislaying one-way table*/
	tables Education Marital_Status AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 AcceptedCmp6;
	title "One-Way Tables For Categorical Variables";
run;

proc univariate data=WORK.MARKETINGA;      /* output the statistic measures for quantitative variables */
	var Income Teenhome MntWines MntFruits MntMeatProducts MntFishProducts MntSweetProducts;
	title "Summary Measures Of The Quantitative Variables";
run;

/*--------------------------------------------------------*/
/*			TWO-WAY TEST ASSOCIATION                      */                     
/*--------------------------------------------------------*/
/*H0: There is no association between education level and Acceptance of Campaign 6 */
/*H1: There is association between education level and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables Education*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Education Level and Response to Campaign 6";
run;	

/*H0: There is no association between Marital status and Acceptance of Campaign 6 */
/*H1: There is association between Marital status and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables Marital_Status*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Marital Status and Response to Campaign 6";
run;

/*H0: There is no association between Acceptance of Campaign 1 and Acceptance of Campaign 6 */
/*H1: There is association between Acceptance of Campaign 1 and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables AcceptedCmp1*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Acceptance of Campaign 1 and Response to Campaign 6";
run;


/*H0: There is no association between Accaptance of Campaign 2 and Acceptance of Campaign 6 */
/*H1: There is association between Acceptance of Campaign 2 and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables AcceptedCmp2*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Acceptance of Campaign 2 and Response to Campaign 6";
run;


/*H0: There is no association between Acceptance of Campaign 3 and Acceptance of Campaign 6 */
/*H1: There is association between Acceptance of Campaign 3 and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables AcceptedCmp3*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Acceptance of Campaign 3 and Response to Campaign 6";
run;

/*H0: There is no association between Acceptance of Campaign 4 and Acceptance of Campaign 6 */
/*H1: There is association between Acceptance of Campaign 4 and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables AcceptedCmp4*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Acceptance of Campaign 4 and Response to Campaign 6";
run;

/*H0: There is no association between Acceptance of Campaign 5 and Acceptance of Campaign 6 */
/*H1: There is association between Acceptance of Campaign 5 and Acceptance of Campaign 6*/
proc freq data=WORK.MARKETINGA;
	tables AcceptedCmp5*AcceptedCmp6 / chisq;
	title "Chi-square Test of Association Between Acceptance of Campaign 5 and Response to Campaign 6";
run;


/*--------------------------------------------------------*/
/*  LOGISTIC REGRESSION MODEL - FULL MODEL                */
/*--------------------------------------------------------*/

PROC LOGISTIC DATA=WORK.MARKETINGA;
    CLASS 
        Education (REF='Basic')
        Marital_Status (REF='Married')
        AcceptedCmp1 (REF='No')
        AcceptedCmp2 (REF='No')
        AcceptedCmp3 (REF='No')
        AcceptedCmp4 (REF='No')
        AcceptedCmp5 (REF='No')
        / PARAM=REF;

    MODEL AcceptedCmp6(event='Yes') = 
        Education
        Marital_Status
        Income
        Teenhome
        MntWines
        MntFruits
        MntMeatProducts
        MntFishProducts
        MntSweetProducts
        AcceptedCmp1
        AcceptedCmp2
        AcceptedCmp3
        AcceptedCmp4
        AcceptedCmp5
        / lackfit;
        title "Full Logistic Regression Model";
RUN;


/*--------------------------------------------------------*/
/*  LOGISTIC REGRESSION MODEL - REDUCED 1 MODEL           */
/*--------------------------------------------------------*/

PROC LOGISTIC DATA=WORK.MARKETINGA;
    CLASS 
        Education (REF='Basic')
        Marital_Status (REF='Married')
        AcceptedCmp1 (REF='No')
        AcceptedCmp3 (REF='No')
        AcceptedCmp4 (REF='No')
        AcceptedCmp5 (REF='No')
        / PARAM=REF;

    MODEL AcceptedCmp6(event='Yes') = 
        Education
        Marital_Status
        Income
        Teenhome
        MntMeatProducts
        AcceptedCmp1
        AcceptedCmp3
        AcceptedCmp4
        AcceptedCmp5
        / lackfit;
        title "REDUCED 1 Logistic Regression Model";
RUN;











