

@ECHO OFF
SET a=%~1
ECHO %a%

IF [%a%]==[] ( mshta javascript:alert^("You must drag and drop your putty generated public key over the bat file. Close it and retry."^);close^(^);  ) 


set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%


set /p serverAddress="Enter Server Address: "

set /p username="Enter Username: "

set a=%a:C:=/c%
set "a=%a:\=/%"

@echo scp "%a%" %username%@%serverAddress%:~/temp.pub%NL% ssh -t %username%@%serverAddress% "mkdir -p .ssh;cd ~/.ssh; chmod 700 ~/.ssh; ssh-keygen -i -f ../temp.pub > temp_os.pub;  cat temp_os.pub >> authorized_keys; chmod 600 ~/.ssh/authorized_keys;chown %username% authorized_keys; rm ~/temp.pub; rm temp_os.pub; exit;"> temp.sh

sh temp.sh

set mypath=%cd%

del "%mypath%\temp.sh"








