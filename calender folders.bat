@echo off & setlocal
set year=%1
if "%year%"=="" set /p year=Year? 
if "%year%"=="" goto :eof
set /a mod=year %% 400
if %mod%==0 set leap=1 && goto :mkyear
set /a mod=year %% 100
if %mod%==0 set leap=0 && goto :mkyear
set /a mod=year %% 4
if %mod%==0 set leap=1 && goto :mkyear
set leap=0

:mkyear
call :mkmonth 01 Jan 31
call :mkmonth 02 Feb 28+leap
call :mkmonth 03 Mar 31
call :mkmonth 04 Apr 30
call :mkmonth 05 May 31
call :mkmonth 06 Jun 30
call :mkmonth 07 Jul 31
call :mkmonth 08 Aug 31
call :mkmonth 09 Sep 30
call :mkmonth 10 Oct 31
call :mkmonth 11 Nov 30
call :mkmonth 12 Dec 31
goto :eof

:mkmonth
set month=%1
set mname=%2
set /a ndays=%3
for /l %%d in (1,1,9)        do mkdir %year%\%month%-%mname%\%month%-0%%d
for /l %%d in (10,1,%ndays%) do mkdir %year%\%month%-%mname%\%month%-%%d