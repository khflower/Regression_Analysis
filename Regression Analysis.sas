data GG.data;
	set WORK.IMPORT8;
run;

data GG.data2;
	set WORK.IMPORT8;
run;

data GG.data3;
	set WORK.IMPORT1;
run;


data qqq;
	set GG.data;
run;

data www;
	set GG.data2;
run;

data eee;
	set GG.data3;
run;


PROC CORR DATA=QQQ;
	VAR TIME APP_USER BOX_SALES MONTH_CORONIC;
RUN;

proc corr data = mlr nosimple;
var x1-x5;
run;

proc reg data=qqq;
	
	model mobile_sales= time app_user box_sales month_coronic /vif ;
run;


data qqq1;
set qqq;


 IF  TIME < 18          THEN T=0;
 ELSE                          T=1;
run;

data a11;
set a1;


 IF  TIME < 18          THEN T=0;
 ELSE                          T=1;
run;

proc reg data=a11;
	
	model mobile_sales= time app_user box_sales month_coronic /vif ;
	by T;
run;

data qqq2;
set qqq;

month_coronic_dif=dif(month_coronic);
mobile_sales_dif=dif(mobile_sales);
run;

proc gplot data=qqq2;
	plot month_coronic_dif*time;
run;


proc gplot data=qqq2;
	plot mobile_sales_dif*time;
run;


proc print data=qqq2;
run;


proc gplot data=qqq2;
	plot month_coronic_dif*time;
run;



proc reg data=qqq1;
	
	model mobile_sales= time app_user box_sales month_coronic /vif ;
	by T;
run;


proc gplot data=qqq;
	plot app_user*time;
run;

proc gplot data=qqq;
	plot month_coronic*time;
run;

data a1;
set qqq;
if _n_=25 then delete;
run;



PROC AUTOREG DATA=DATA.DF;
	MODEL MOBILE_SALES= TIME APP_USER BOX_SALES MONTH_CORONIC;
RUN;

proc autoreg data=a1;
	model mobile_sales= time app_user box_sales month_coronic;
run;



data a2;
set a1;
month_coronic_dif=dif(month_coronic);
mobile_sales_dif=dif(mobile_sales);
run;

proc gplot data=a2;
	plot month_coronic_dif*time;
run;

data b1;
set www;
if _n_=25 then delete;
run;

data c1;
set eee;
if _n_=25 then delete;
run;

data a11;
set a1;
if _n_=24 then delete;
run;



proc print data=a1;
run;
proc sgplot data=qqq;
	
	series x= time y=mobile_sales ;
run;
proc sgplot data=a1;
	series x=time y=mobile_sales ;
run;

proc gplot data=a1;
	plot mobile_sales*time;
run;

proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic /vif;
run;

proc reg data=a1;
	model mobile_sales= time box_sales month_coronic /vif;
run;

proc reg data=a1;
	model mobile_sales= time box_sales month_coronic_log /vif;
run;

proc autoreg data=a1 plots all;
	model mobile_sales= time box_sales month_coronic_log;
run;

proc reg data=a1;
	model mobile_sales= time box_sales month_coronic_log /vif;
	test time=0;
run;
proc reg data=a1;
	model mobile_sales= time box_sales month_coronic_log /dwprob;
run;

proc autoreg data=a1 plots all;
	model mobile_sales= time box_sales month_coronic_log ;
run;

proc reg data=a1;
	model mobile_sales= time box_sales month_coronic_log /dwprob;
run;

proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic_log /vif;
run;

proc reg data=a1;
	
	model mobile_sales= time app_user box_sales month_cul_coronic /vif;
run;


proc autoreg data=a1 plots=all;
	
	model mobile_sales= time box_sales month_coronic_log /DWPROB;
run;

proc reg data=a1;
	
	model mobile_sales= time app_user box_sales month_coronic /selection=backward;
run;



proc reg data=b1;
	model mobile_sales= time app_user box_sales month_coronic /vif;
run;

proc reg data=b1;
	model mobile_sales= app_user /vif;
run;




proc reg data=b1;
	model mobile_sales = time app_user_root box_sales month_coronic_root / vif;
run;

proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic_root / vif;
run;

data a2;
set a1;

app_user2=1/app_user;
am=app_user*month_coronic;


run;

data a2;
set a1;


 IF  TIME < 13          THEN T=0;
 ELSE                          T=1;
app_user2=1/app_user;
am=app_user*month_coronic;
app_user3=app_user*app_user;
app_user4=int(app_user*(1/100));
month_coronic2=int(month_coronic*(1/100));
month_coronic2_root=sqrt(month_coronic2);
app_user5 = sqrt(sqrt(app_user));
box_sales_root = sqrt(box_sales);
mobile_sales_root= sqrt(mobile_sales);
run;

proc reg data=c1;
	model mobile_sales= time app_user box_sales month_coronic_root /vif;
run;



proc reg data=a2;
	model mobile_sales=time app_user box_sales_root month_coronic_root /vif;
run;


proc reg data=a2;
	model mobile_sales_root=time app_user box_sales month_coronic_root /vif;
run;


proc reg data=a2;
	model mobile_sales_root=time app_user box_sales month_coronic_root /vif;
run;

proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic /vif;
run;
proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic_log /vif;
run;
proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic_log /vif;
run;

proc reg data=a1;
	model mobile_sales= time box_sales month_coronic /vif;
run;
proc reg data=a1;
	model mobile_sales= time box_sales month_coronic_log /vif dwprob;
run;

proc reg data=a1;
	model mobile_sales=month_coronic /vif;
run;


proc reg data=a2;
	model mobile_sales= time box_sales APP_USER MONTH_CORONIC_root/ vif;
	by T;
run;

PROC AUTOREG DATA=a2; 
 MODEL MOBILE_SALES =APP_USER;  
RUN;


PROC AUTOREG DATA=DF_TIME_DIVIDE; 
 MODEL MOBILE_SALES = MONTH_CORONIC APP_USER BOX_SALES;  
 BY T;
RUN;


proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic_root / vif;
run;
proc reg data=a2;
	model mobile_sales= time box_sales  am / vif;
run;
proc reg data=a1;
	model mobile_sales= time app_user box_sales month_coronic /vif;
run;




data a2;
set a1;
time = time;
run;

proc reg data=a2;
	
	model mobile_sales= time app_user box_sales month_coronic_root /vif;
run;


proc reg data=a1;
	
	model mobile_sales= time box_sales month_coronic_root / vif;
run;

proc reg data=a1;
	
	model mobile_sales= time box_sales month_coronic / vif;
run;

proc autoreg data=a1 plots=all;
	
	model mobile_sales= time app_user box_sales month_coronic_root /DWPROB;
run;


proc autoreg data=qqq plots=all;
	
	model mobile_sales= time ;
run;

proc autoreg data=qqq plots=all;
	
	model mobile_sales=app_user;
run;

proc autoreg data=qqq plots=all;
	
	model mobile_sales=box_sales;
run;

proc autoreg data=qqq plots=all;
	
	model mobile_sales=month_coronic;
run;

proc autoreg data=qqq plots=all;
	
	model mobile_sales=time app_user box_sales month_coronic;
run;



data www;
	set GG.data2;
run;

data qqq2;

	set a1;
	
	
	 app_user_1 = LAG(app_user);
 	 DIF_app_user = app_user - app_user_1;
 	 app_user_d=dif(app_user);
 	 box_sales_d=dif(box_sales);
 	 month_coronic_d = dif(month_coronic);
 	 
 	 if time < 2021.4166663 then T=1;
	 else T=2;
 	 
run;

proc gplot data=qqq2;
	plot app_user_d * time;
run;

proc gplot data=qqq2;
	plot box_sales_d * time;
run;
proc gplot data=qqq2;
	plot month_coronic_d * time;
run;

proc gplot data=qqq2;
	plot month_coronic * time;
run;
proc gplot data=qqq;
	plot app_user*time;
run;

proc gplot data=www;
	plot app_user*time;
run;


proc autoreg data=qqq;
	model  app_user = time/Chow=(14 15 16 17 18 19 20 21); /*21년 3월 부터 21년 10월*/
run;

proc gplot data=qqq;
	plot month_coronic*time;
run;

proc gplot data=qqq;
	plot month_cul_coronic*time;
run;

proc gplot data=qqq;
	plot box_sales*time;
run;

proc gplot data=qqq;
	plot box_count*time;
run;



proc autoreg data=www plots=all;
	
	model mobile_sales= time app_user_root box_sales month_coronic ;
run;

proc autoreg data=qqq plots=all;
	
	model mobile_sales= time app_user_log box_sales month_coronic ;
run;

proc autoreg data=qqq2 plots=all;
	
	model mobile_sales= time app_user_log box_sales month_coronic; BY T ;
run;


proc autoreg data=qqq plots=all;
	model mobile_sales= month_coronic ; 
run;

proc corr data =a1 nosimple;
var time app_user box_sales month_coronic;
run;
