set /p e=��������Ҫǩ���Ŀ�ִ���ļ�����:
::ǩ��
signtool.exe sign /f testcer.pfx /fd SHA256 /p 123456 "%e%"
::�Ӹ�ʱ���
signtool.exe timestamp /td SHA256 /tr http://rfc3161timestamp.globalsign.com/advanced "%e%"
pause