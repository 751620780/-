@echo off & title ��ִ���ļ�ǩ������
PUSHD "%~DP0" && CD /D "%~DP0"
IF EXIST "%Public%"> NUL 2>&1 REG QUERY "HKU\S-1-5-19\Environment"
IF NOT %errorlevel% EQU 0 (
IF EXIST "%Public%" powershell.exe -windowstyle hidden -noprofile "Start-Process '%~dpnx0' -Verb RunAs")
title ��ִ���ļ�ǩ������
@echo off & cls
set /p n=������testcer�д����ߵ�����:
::����testcer
makecert.exe -sv testcer.pvk -r -n "CN=%n%" testcer.cer
::����������testcer
certmgr.exe /c /add testcer.cer /s root
cert2spc.exe testcer.cer testcer.spc
set /p p=��������ղ����õ�����:
::��ȡpfxtestcer
pvk2pfx.exe -pvk testcer.pvk -pi %p% -spc testcer.spc -pfx testcer.pfx -f
set /p e=��������Ҫǩ���Ŀ�ִ���ļ�����:
::ǩ��
signtool.exe sign /f testcer.pfx /fd SHA256 /p %p% "%e%"
::�Ӹ�ʱ���
signtool.exe timestamp /td SHA256 /tr http://rfc3161timestamp.globalsign.com/advanced "%e%"
pause