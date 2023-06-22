@ECHO off

:: Permisão de Admin
:-------------------------------------
REM  --> Permisos
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> Sem permissões
if '%errorlevel%' NEQ '0' (
    echo Solicitar privilegios administrativos
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin	
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

CHCP 65001 > nul

:senha
color 9
mode 72,16
cls
title Password 
echo.
echo.
echo.
echo              ▓██   ██▓    ▒█████     ▓█████▄     ▄▄▄      
echo               ▒██  ██▒   ▒██▒  ██▒   ▒██▀ ██▌   ▒████▄    
echo                ▒██ ██░   ▒██░  ██▒   ░██   █▌   ▒██  ▀█▄  
echo                ░ ▐██▓░   ▒██   ██░   ░▓█▄   ▌   ░██▄▄▄▄██ 
echo                ░ ██▒▓░   ░ ████▓▒░   ░▒████▓     ▓█   ▓██▒
echo                 ██▒▒▒    ░ ▒░▒░▒░     ▒▒▓  ▒     ▒▒   ▓▒█░
echo               ▓██ ░▒░      ░ ▒ ▒░     ░ ▒  ▒      ▒   ▒▒ ░
echo               ▒ ▒ ░░     ░ ░ ░ ▒      ░ ░  ░      ░   ▒   
echo               ░ ░            ░ ░        ░             ░  ░
echo               ░ ░                     ░                   
echo.
set "psCommand=powershell -Command "$pword = read-Host 'Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
if %password%== Horion (goto menu) else (goto password)
cls
	
:menu
set v=[32m
set s=[1;32m
set r=[0m
	CLS
	TITLE YodaPrivate
	COLOR 2
	mode 112 , 40
	ECHO    USUARIO: %username% 
	ECHO    COMPUTADOR: %computername% 
	ECHO    DATA: %date%   %time%
	ECHO:                                                                      

echo.
echo.
echo %s%                ▓██   ██▓ ▒█████  ▓█████▄  ▄▄▄                                             
echo %s%                 ▒██  ██▒▒██▒  ██▒▒██▀ ██▌▒████▄                                           
echo %s%                  ▒██ ██░▒██░  ██▒░██   █▌▒██  ▀█▄                                         
echo %s%                  ░ ▐██▓░▒██   ██░░▓█▄   ▌░██▄▄▄▄██                                        
echo %s%                  ░ ██▒▓░░ ████▓▒░░▒████▓  ▓█   ▓██▒                                       
echo %s%                   ██▒▒▒ ░ ▒░▒░▒░  ▒▒▓  ▒  ▒▒   ▓▒█░                                       
echo %s%                 ▓██ ░▒░   ░ ▒ ▒░  ░ ▒  ▒   ▒   ▒▒ ░                                       
echo %s%                 ▒ ▒ ░░  ░ ░ ░ ▒   ░ ░  ░   ░   ▒                                          
echo %s%                 ░ ░         ░ ░     ░          ░  ░                                       
echo %s%                 ░ ░               ░                    
echo.
echo.      												                                                                                                                                     
echo                 %r% [ %s% 1 %r% ] %s% WHID %r%                 %r% [ %s% 4 %r% ] %s% Powershell %r%                %r% [ %s% 7 %r% ] %s% Detecções gerais %r%
echo.
echo.                                                                        
echo                 %r% [ %s% 2 %r% ] %s% Journal (Fsutil) %r%     %r% [ %s% 5 %r% ] %s% pastas e caminhos %r%         %r% [ %s% 8 %r% ] %s% DPS/EXPLORER %r%
echo.
echo.                                                                        
echo                 %r% [ %s% 3 %r% ] %s% Procesos %r%             %r% [ %s% 6 %r% ] %s% Macros %r%                    %r% [ %s% 9 %r% ] %s% Creditos %r%                                                                           
echo.                                                                           
echo %s%                           ██████  ▄████▄   ▄▄▄       ███▄    █  ███▄    █ ▓█████  ██▀███  
echo %s%                         ▒██    ▒ ▒██▀ ▀█  ▒████▄     ██ ▀█   █  ██ ▀█   █ ▓█   ▀ ▓██ ▒ ██▒
echo %s%                         ░ ▓██▄   ▒▓█    ▄ ▒██  ▀█▄  ▓██  ▀█ ██▒▓██  ▀█ ██▒▒███   ▓██ ░▄█ ▒
echo %s%                           ▒   ██▒▒▓▓▄ ▄██▒░██▄▄▄▄██ ▓██▒  ▐▌██▒▓██▒  ▐▌██▒▒▓█  ▄ ▒██▀▀█▄  
echo %s%                         ▒██████▒▒▒ ▓███▀ ░ ▓█   ▓██▒▒██░   ▓██░▒██░   ▓██░░▒████▒░██▓ ▒██▒
echo %s%                         ▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░
echo %s%                         ░ ░▒  ░ ░  ░  ▒     ▒   ▒▒ ░░ ░░   ░ ▒░░ ░░   ░ ▒░ ░ ░  ░  ░▒ ░ ▒░
echo %s%                         ░  ░  ░  ░          ░   ▒      ░   ░ ░    ░   ░ ░    ░     ░░   ░ 
echo %s%                               ░  ░ ░            ░  ░         ░          ░    ░  ░   ░     
echo %s%                                  ░     


::Estrutura do menu
	SET /p opcion=%s%Opition%r%:%s%
	
	ECHO ------------------------------
	IF %opcion% EQU 1 GOTO INFO
	IF %opcion% EQU 2 GOTO FSUTIL
	IF %opcion% EQU 3 GOTO PROCESOS
	IF %opcion% EQU 4 GOTO POWERSHELLOG
	IF %opcion% EQU 5 GOTO FOLDERS
	IF %opcion% EQU 6 GOTO MACROS
	IF %opcion% EQU 7 GOTO DETECTIONS
	IF %opcion% EQU 8 GOTO SCREENSHARE
	IF %opcion% EQU 9 GOTO exit
	IF %opcion% EQU Bypass GOTO Bypass


:: 	MENOS QUE 1 E MAIOR QUE 12 = OPÇÃO INVÁLIDA 
	IF %opcion% LSS 1 GOTO ERROR
	IF %opcion% GTR 12 GOTO ERROR
echo Pon un numero valido
timeout /NOBREAK /T 3 >nul
cls
goto MENU 



:: Informação do pc
:INFO
CLS	
TITLE Informação
mode 100,18

ECHO.   	
ECHO.  
echo                                   ::   .: .::    .   .::::: :::: ::::-.  
echo                                   ,;;   ;;,';;,  ;;  ;;;'   ;;;  ;;,   `';,
echo                                  ,[[[,,,[[[ '[[, [[, [['    [[[  `[[     [[
echo                                  "$$$"""$$$   Y$c$$$c$P     $$$   $$,    $$
echo                                  888   "88o   "88"888       888   888-,o8P'
echo                                   MMM    YMM   "M "M"       MMM   MMMMP"`  
echo.
echo.              
echo.
SET /p opcionhwid=[4m[97m[[91mNome D[93m[91mo Jogador[97m][0m[93m►[39m
SET WEBHOOK_URL=https://discord.com/api/webhooks/923423900111609886/Ex6g6sg--TkFdo6g9z-47Gw9UbOJmihHUIDbzdoBhGnYacgYNO6OUv2wRGlvxeyclquc
goto hwid

::::::::::::::::::::::::::::::::::::::::::::::::: Hwid :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Hwid


md %USERPROFILE%\Desktop\PCINFO
cd %USERPROFILE%\Desktop\PCINFO

echo Nombre del usuario    : %UserName% > %USERPROFILE%\Desktop\PCINFO\HWID.txt
echo Nombre del Computador : %ComputerName% >> %USERPROFILE%\Desktop\PCINFO\HWID.txt
echo Dominio               : %UserDomain% >> %USERPROFILE%\Desktop\PCINFO\HWID.txt

goto :other
:other
Powershell "wmic path win32_computersystemproduct get uuid" >> %USERPROFILE%\Desktop\PCINFO\"HWID.txt"
Powershell "getmac" >> %USERPROFILE%\Desktop\PCINFO\"HWID.txt"
Powershell "Get-WmiObject -Class Win32_Processor -ComputerName. | Select-Object -Property ProcessorId*" >> %USERPROFILE%\Desktop\PCINFO\"HWID.txt"
cd "%USERPROFILE%\Desktop\PCINFO\"
cls
start %USERPROFILE%\Desktop\PCINFO\"HWID.txt"
cls
ECHO              HWID registrado com sucesso no Weebhook    			 
ECHO.  	
echo Pressione uma tecla para retornar ao menu 				 
PAUSE>nul
GOTO menu
cls


:FSUTIL
COLOR 9
mode 120,30
cls
echo                                             MMMMK;.cllllllllllllllllc, 'xNMMMMMMMMMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMx.  ,kWMMMMMMMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMx.   .c0WMMMMMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMx.     .lKMMMMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMO,.......;KMMMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMWNXXXXXK:'OMMMM
echo                                             MMNKd.;O000000000000000000000000O;.dKNMM
echo                                             MK:.  ..''''...'...  ..'...'''''..  .:KM
echo                                             Mx.  ;OKOOOOl.'x0l. .c0k, ;OKOOOOc   .xM
echo                                             Mx.  :NNo'''.  ;0NdoOXK:  cNXl'''.   .xM
echo                                             Mx.  :NW0ddd,   ,0WWMK;   cNWOddd,   .xM
echo                                             Mx.  cNNkccc.   :KNNMXc   cNNxcc:.   .xM
echo                                             Mx.  cNNo,',.  cXXlckKXl. cNXo,',.   .xM
echo                                             Mk.  ,k0OOkOo.,xO:  .;kk; ;O0OOkOo.  .xM
echo                                             MXl.. .''''''.'''.....'''..''''''. ..lKM
echo                                             MMWXx.:0XXXXXXXXXXXXXXXXXXXXXXXX0:.xXWMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMMMMMMMMNc'OMMMM
echo                                             MMMMO'cNMMMMMMMMMMMMMMMMMMMMMMMMNc'OMMMM
echo                                             MMMMO',xkkkkkkkkkkkkkkkkkkkkkkkkx,'OMMMM
echo                                             MMMMK;                            ;KMMMM
echo.   
echo.
echo                 %r% [ %s% 1 %r% ] %s% .exe %r%     %r% [ %s% 4 %r% ] %s% .txt %r%                  %r% [ %s% 7 %r% ] %s% Prefetch %r%
echo.
echo.                                                                        
echo                 %r% [ %s% 2 %r% ] %s% .bat %r%     %r% [ %s% 5 %r% ] %s% ArquivosBorrados %r%      %r% [ %s% 8 %r% ] %s% Todos %r%      %r% [ %s% 10 %r% ] %s% Menu %r%
echo.
echo.                                                                        
echo                 %r% [ %s% 3 %r% ] %s% .dll %r%     %r% [ %s% 6 %r% ] %s% .jar %r%                  %r% [ %s% 9 %r% ] %s% Outros %r%
echo.  
echo.
SET /p x=[4m[97m[[91mEscolha[93m[91m uma opção[97m][0m[93m►[92m 
if=%x%==1 goto exe
if=%x%==2 goto bat
if=%x%==3 goto dll
if=%x%==4 goto log
if=%x%==5 goto dele
if=%x%==6 goto newna
if=%x%==7 goto oldna
if=%x%==8 goto all
if=%x%==9 goto Outros
if=%x%==10 goto MENU

:: 	MENOR QUE 1 Y MAYOR QUE 10 = OPÇÃO INVALIDA 
	IF %x% LSS 1 GOTO ERROR
	IF %x% GTR 10 GOTO ERROR
	
cls
color E
echo PUT A VALID NUMBER!
timeout /NOBREAK /T 3 >nul
cls
goto Fsutil




:other
@echo off
echo.
echo.
echo [90mColoque o tipo de arquivo que deseja ver, deve incluir o ponto e depois a extensão, EXEMPLO: .mp4
set /p C:= ^>^>^>
fsutil usn readjournal  c: csv | findstr /i /C:%C:%  >> other.txt
start other.txt
pause
del other.txt
goto Fsutil

:exe
fsutil usn readjournal  c: csv | findstr /i /C:.exe  >> exe.txt
start exe.txt
pause  
del exe.txt
goto Fsutil

:bat
fsutil usn readjournal  c: csv | findstr /i /C:.bat  >> bat.txt
start bat.txt
pause  
del bat.txt
goto Fsutil

:dll
fsutil usn readjournal  c: csv | findstr /i /C:.dll  >> dll.txt
start dll.txt
pause  
del dll.txt
goto Fsutil

:txt
fsutil usn readjournal  c: csv | findstr /i /C:.txt  >> text.txt
start text.txt
pause  
del text.txt
goto Fsutil

:dele
fsutil usn readjournal  c: csv | findstr /i /C:.exe  | findstr /i /c:0x00000200 >> Deletedfiles.txt
start Deletedfiles.txt
pause
del Deletedfiles.txt
goto Fsutil

:newna
fsutil usn readjournal  c: csv | findstr /i /C:.jar >> jar.txt 
start jar.txt 
pause  
del jar.txt
goto Fsutil

:oldna
fsutil usn readjournal  c: csv | findstr /i /C:.pf  >> prefetch.txt 
start prefetch.txt
pause  
del prefetch.txt
goto Fsutil

:all
fsutil usn readjournal  c: csv | findstr /i /C:.dll >> dll.txt
fsutil usn readjournal  c: csv | findstr /i /C:.exe  | findstr /i /c:0x00000200 >> Deletedfiles.txt
fsutil usn readjournal  c: csv | findstr /i /C:.exe  | findstr /i /c:0x00001000 >> jar.txt 
fsutil usn readjournal  c: csv | findstr /i /C:.exe  | findstr /i /c:0x00002000 >> prefetch.txt
fsutil usn readjournal  c: csv | findstr /i /C:.exe  >> exe.txt
fsutil usn readjournal  c: csv | findstr /i /C:.bat >> bat.txt
fsutil usn readjournal  c: csv > text.txt
start dll.txt
start Deletedfiles.txt
start jar.txt
start prefetch.txt
start exe.txt
start bat.txt
start text.txt
pause 
del dll.txt
del Deletedfiles.txt
del jar.txt
del prefetch.txt
del exe.txt
del bat.txt
del log.log
goto Fsutil
CLS


:PROCESOS 
cls
title Procesos
mode 91,39
echo.                                                                                                                                                                                                                                                          
Echo      [36m_/_/      _/    _/   _/_/_/_/  _/_/_/    _/      _/  _/_/_/  _/      _/    _/_/_/   
Echo   _/     _/    _/    _/  _/        _/    _/    _/  _/      _/    _/_/    _/  _/          
Echo  _/   _/_/    _/    _/  _/_/_/    _/_/_/        _/        _/    _/  _/  _/  _/  _/_/     
Echo  [34m_/    _/    _/    _/  _/        _/    _/      _/        _/    _/    _/_/  _/    _/      
Echo   _/_/  _/    _/_/    _/_/_/_/  _/    _/      _/      _/_/_/  _/      _/    _/_/_/[37m        
echo.                                                                                  
echo.
Echo                                                         Verificando Procesos
echo.
echo.
echo Se algum desses serviços for detectado como "Parado", ele deve ser banido.  
echo.
ping localhost -n 4 >nul 
echo                            [36mDPS[37m 
ECHO.
SC QUERY DPS 
ping localhost -n 2 >nul 
ECHO.
echo                            [36mPcasvc[37m
ECHO.
SC query Pcasvc 
ping localhost -n 2 >nul 
ECHO.
echo                            [36mDiagtrack[37m
ECHO.
SC query Diagtrack 
ping localhost -n 2 >nul 
ECHO.
ECHO                            [34mSysMain[37m
ECHO.
sc query Sysmain 
ping localhost -n 2 >nul 
ECHO.
ECHO                            [34mEventlog[37m
ECHO.
sc query eventlog 
ping localhost -n 2 >nul 
ECHO.
ECHO                            [34mSgrmBroker[37m
ECHO.
sc query sgrmbroker 
ping localhost -n 2 >nul 
echo.
pause>nul

GOTO MENU


:POWERSHELLOG
cls
TITLE Powershell History
color 2
mode 107,32
echo.
echo.
ECHO                            MMMMWO:................................,
ECHO                            MMMMO. ...............................  
ECHO                            MMMNl  ';;;'..';;;;;;;;;;;;;;;;;;;;;;'  
ECHO                            MMMO' .,;;;'.  .,;;;;;;;;;;;;;;;;;;;,. .
ECHO                            MMWl  ';;;;;,..  .,;;;;;;;;;;;;;;;;;'  l
ECHO                            MM0' .,;;;;;;;,.  ..',;;;;;;;;;;;;;,. .O
ECHO                            MWo  .;;;;;;;;;;,.   ..,;;;;;;;;;;;'  cN
ECHO                            MK, .,;;;;;;;;;;;;'    .,;;;;;;;;;;. .kM
ECHO                            Wd. .;;;;;;;;;;,'..   .';;;;;;;;;;'  cNM
ECHO                            K; .,;;;;;;;;,..  ..',;;;;;;;;;;;;. .kMM
ECHO                            x. .;;;;;;,..  ..';;;;;;;;;;;;;;;,. :XMM
ECHO                            ; .,;;;,'.   .',;;,''''''''',;;;;. .xMMM
ECHO                            . .;;,..  ..,;;;;,.         .,;;,. ;KMMM
ECHO                              ';;,...',;;;;;;,'''''''''',,;,. .dWMMM
ECHO                               ............................  .cXMMMM
echo.
echo. 
echo. Método usado para executar cheats através do powershell, execute todas as rotas que estão neste arquivo. 
echo.
echo. 
echo Pressione uma letra para abrir o arquivo de histórico
echo.
pause>nul
START %USERPROFILE%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
PAUSE>nul
Goto MENU

:FOLDERS
cls
Title Folders
Color 2
mode 161 , 30




echo                                                                                dddddddd                                                         
echo                     FFFFFFFFFFFFFFFFFFFFFF                 lllllll             d::::::d                                                         
echo                     F::::::::::::::::::::F                 l:::::l             d::::::d                                                         
echo                     F::::::::::::::::::::F                 l:::::l             d::::::d                                                         
echo                     FF::::::FFFFFFFFF::::F                 l:::::l             d:::::d                                                          
echo                       F:::::F       FFFFFF   ooooooooooo    l::::l     ddddddddd:::::d     eeeeeeeeeeee    rrrrr   rrrrrrrrr       ssssssssss   
echo                       F:::::F              oo:::::::::::oo  l::::l   dd::::::::::::::d   ee::::::::::::ee  r::::rrr:::::::::r    ss::::::::::s  
echo                       F::::::FFFFFFFFFF   o:::::::::::::::o l::::l  d::::::::::::::::d  e::::::eeeee:::::eer:::::::::::::::::r ss:::::::::::::s 
echo                       F:::::::::::::::F   o:::::ooooo:::::o l::::l d:::::::ddddd:::::d e::::::e     e:::::err::::::rrrrr::::::rs::::::ssss:::::s
echo                       F:::::::::::::::F   o::::o     o::::o l::::l d::::::d    d:::::d e:::::::eeeee::::::e r:::::r     r:::::r s:::::s  ssssss 
echo                       F::::::FFFFFFFFFF   o::::o     o::::o l::::l d:::::d     d:::::d e:::::::::::::::::e  r:::::r     rrrrrrr   s::::::s      
echo                       F:::::F             o::::o     o::::o l::::l d:::::d     d:::::d e::::::eeeeeeeeeee   r:::::r                  s::::::s   
echo                       F:::::F             o::::o     o::::o l::::l d:::::d     d:::::d e:::::::e            r:::::r            ssssss   s:::::s 
echo                     FF:::::::FF           o:::::ooooo:::::ol::::::ld::::::ddddd::::::dde::::::::e           r:::::r            s:::::ssss::::::s
echo                     F::::::::FF           o:::::::::::::::ol::::::l d:::::::::::::::::d e::::::::eeeeeeee   r:::::r            s::::::::::::::s 
echo                     F::::::::FF            oo:::::::::::oo l::::::l  d:::::::::ddd::::d  ee:::::::::::::e   r:::::r             s:::::::::::ss  
echo                     FFFFFFFFFFF              ooooooooooo   llllllll   ddddddddd   ddddd    eeeeeeeeeeeeee   rrrrrrr              sssssssssss    
echo.
echo.
echo                 %r% [ %s% 1 %r% ] %s% Temp %r%         %r% [ %s% 4 %r% ] %s% Recent %r%               %r% [ %s% 7 %r% ] %s% Hidden icons %r%
echo.
echo.
echo                 %r% [ %s% 2 %r% ] %s% Prefetch %r%     %r% [ %s% 5 %r% ] %s% UsageLogs %r%            %r% [ %s% 8 %r% ] %s% Crash Dumps %r%      %r% [ %s% 10 %r% ] %s% Menu %r%
echo.
echo.
echo                 %r% [ %s% 3 %r% ] %s% 2temp %r%        %r% [ %s% 6 %r% ] %s% Recycle bin %r%          %r% [ %s% 9 %r% ] %s% Documents %r%
echo.  
SET /p x=[4m[97m[[91mFol[93m[91mders[97m][0m[93m►[92m 
if=%x%==1 goto temp
if=%x%==2 goto prefetch
if=%x%==3 goto temp2
if=%x%==4 goto recent
if=%x%==5 goto usagelogs
if=%x%==6 goto recyclebin
if=%x%==7 goto hidden
if=%x%==8 goto crash
if=%x%==9 goto documents
if=%x%==10 goto MENU

:: 	MENOR QUE 1 Y MAYOR QUE 10 = OPCÃO INVALIDA 
	IF %x% LSS 1 GOTO ERROR
	IF %x% GTR 10 GOTO ERROR
:TEMP
cls 
title Temp
color 2
echo Buscar: JnativeHook, Cheat Engine Icons, Cheat Engine.
echo.
echo Presione uma tecla para continuar
pause>nul
start C:\Windows\Temp
echo.
echo Presione qualquer tecla para voltar ao menu
pause>nul
goto FOLDERS

:prefetch
cls 
title Prefetch
color 2
echo Buscar: Buscar algum tipo de sospechoso executável.
echo.
echo Presione uma tecla para continuar
start C:\Windows\Prefetch
echo.
echo Pressione qualquer tecla para retornar ao menu
pause>nul
goto FOLDERS

:TEMP2
cls 
title Temp
color 2
echo Buscar: JnativeHook, Cheat Engine Icons, Cheat Engine.
echo.
echo Presione uma tecla para continuar
pause>nul
start %userprofile%\AppData\Local\Temp
echo Presione qualquer tecla para voltar ao menu
pause>nul
echo.
goto FOLDERS

:recent
cls 
title Recent
color 2
echo Buscar: Qualquer tipo de arquivo modificado antes da SS deveria ser banido. 
echo.
echo Presione uma tecla para continuar
pause>nul
start %userprofile%\AppData\Roaming\Microsoft\Windows\Recent
echo Presione qualquer tecla para voltar ao menu
pause>nul
goto FOLDERS

:usagelogs
cls 
title UsageLogs
color 2
echo Buscar: Qualquier arquivo cheat revisar data de modificação
echo.
echo Presione uma tecla para continuar
pause>nul
start %userprofile%\AppData\Local\Microsoft\CLR_v4.0\UsageLogs\
echo Presione qualquer tecla para voltar ao menu
echo.
pause>nul
goto FOLDERS

:recyclebin
cls 
title RecycleBin
color 2
echo Revise a data de modificação do papel, lembre-se de que tudo o que foi modificado após o congelamento é banido
echo.
echo Presione uma tecla para continuar
pause>nul
start C:$Recycle.bin
echo Presione qualquer tecla para voltar ao menu
echo.
pause>nul
goto FOLDERS

:hidden
cls 
title Hidden Icons
color 2
echo                       Esta rota nos servirá para encontrar AutoHotkey e algum tipo de gravador e software de mouse
echo.
echo Presione uma tecla para continuar
pause>nul
start explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}
echo Presione qualquer tecla para voltar ao menu
echo.
pause>nul
goto FOLDERS

:crash
cls 
title CrashDumps
color 2
echo 	Veja se há algum registro sobre o travamento dos cheats
echo.
echo Presione uma tecla para continuar
pause>nul
start %userprofile%\AppData\Local\CrashDumps
echo Presione qualquer tecla para voltar ao menu
echo.
pause>nul
goto FOLDERS

:documents
cls 
title Documents
color 2
echo Buscar: Software de mouses, My Cheat Tables (No caso de ter esta pasta, ela deve ser banida, pois confirmaria o uso do Cheat Engine)
echo.
echo Presione uma tecla para continuar
pause>nul
start documents
echo Presione qualquer tecla para voltar ao menu
pause>nul
goto FOLDERS


:Menu
GOTO MENU













:MACROS
title MACROS
mode 102,27
COLOR 4
cls

echo.
echo                    ███▄ ▄███▓ ▄▄▄       ▄████▄   ██▀███   ▒█████    ██████ 
echo                   ▓██▒▀█▀ ██▒▒████▄    ▒██▀ ▀█  ▓██ ▒ ██▒▒██▒  ██▒▒██    ▒ 
echo                   ▓██    ▓██░▒██  ▀█▄  ▒▓█    ▄ ▓██ ░▄█ ▒▒██░  ██▒░ ▓██▄   
echo                   ▒██    ▒██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▒██▀▀█▄  ▒██   ██░  ▒   ██▒
echo                   ▒██▒   ░██▒ ▓█   ▓██▒▒ ▓███▀ ░░██▓ ▒██▒░ ████▓▒░▒██████▒▒
echo                   ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░
echo                   ░  ░      ░  ▒   ▒▒ ░  ░  ▒     ░▒ ░ ▒░  ░ ▒ ▒░ ░ ░▒  ░ ░
echo                   ░      ░     ░   ▒   ░          ░░   ░ ░ ░ ░ ▒  ░  ░  ░  
echo                          ░         ░  ░░ ░         ░         ░ ░        ░  
echo                                        ░                                   
echo.
echo                                    [31m[ 1 ] Logitech
echo                                    [31m[ 2 ] GloriusModel0
echo                                    [31m[ 3 ] Xenon00
echo                                    [33m[ 4 ] Bloomdy7
echo                                    [33m[ 5 ] Razer
echo                                    [32m[ 6 ] Corsair
echo                                    [32m[ 7 ] RedDragon
echo                                    [34m[ 8 ] Coolermaster
echo                                    [34m[ 9 ] Roccat
echo                                    [34m[ 10 ] Steelseries
echo                                    [35m[ 11 ] Alienware
echo                                    [35m[ 12 ] MotorSpeed
echo                                    [36m[ 13 ] Menu
echo                                    [36m[ 14 ] Todos

SET /p x=[4m[97m[[91mMa[93m[91mcro[97m][0m[93m►[92m 
if=%x%==1 goto Logitech
if=%x%==2 goto GloriusModel0
if=%x%==3 goto Xenon	
if=%x%==4 goto Bloody7
if=%x%==5 goto Razer
if=%x%==6 goto Corsair
if=%x%==7 goto Redragon
if=%x%==8 goto CoolerMaster
if=%x%==9 goto roccat
if=%x%==10 goto Steelseries
if=%x%==11 goto Alienware
if=%x%==12 goto MotorSpeed
if=%x%==13 goto ret
if=%x%==14 goto all 

:: 	MENOR QUE 1 Y MAYOR QUE 10 = OPÇÃO INVALIDA 
	IF %x% LSS 1 GOTO ERROR
	IF %x% GTR 14 GOTO ERROR
	

goto MACROS
:Logitech
cls
echo h
if exist %userprofile%\AppData\local\lghub (start %userprofile%\AppData\local\lghub) else (goto notexist)
echo Directorio  C:\usuarios\*Usuario del pc*\AppData\local\LGHUB\
echo.
echo Veja a data de modificação das configurações
echo.
pause
goto MACROS

:GloriusModel0
cls 
if exist %userprofile%\AppData\local\BY-COMBO2 (start %userprofile%\AppData\local\BY-COMBO2) else (goto notexist)
echo Directorio C:\Users\*Usuario del pc*\appdata\local\BY-COMBO2
echo.
echo Veja a data de modificação da pasta Mac
echo.
pause
goto MACROS

:Xenon
cls 
if exist "C:\Program Files (x86)\Xenon200" (explorer "C:\Program Files (x86)\Xenon200\") else (goto notexist)
echo Directorio C:\Program Files (x86)\Xenon200\
echo.
echo Olhe a data na pasta de configuração
echo.
pause
goto MACROS

:Bloody7
cls 
if exist "C:\Program Files (x86)\bloody7" (explorer "C:\Program Files (x86)\bloody7") else (goto notexist)
echo.
echo C:\program files (x86)\bloody7\bloody7\userlog\mouse\
echo.
echo Verifique a data de modificação do arquivo
echo.
pause
goto MACROS

:Razer
cls
if exist %userprofile%\AppData\local\razer\synapse3 (start %userprofile%\AppData\local\razer\synapse3) else (goto notexist)
echo.
echo C:\ProgramData\Razer\Synapse Accounts
echo C:\Users\*Usuario del pc*\appdata\local\razer\synapse3\log
echo C:\Users\*Usuario del pc*\AppData\Local\Razer\Razer central\Account\RZR_uniqueid
echo.
echo Veja a data de modificação dos arquivos, veja a data de modificação de Emily3
echo.
pause
goto MACROS

:Corsair
cls
if exist %userprofile%\AppData\roaming\corsair\CUE (start %userprofile%\AppData\roaming\corsair\CUE) else (goto notexist)
echo.
echo C:\users\%USERNAME%\appdata\corsair\CUE
echo.
echo Verifique a data de modificação do arquivo
echo.
pause
goto MACROS

:Redragon
cls
if exist "C:\Users\%USERNAME%\Documents\" (start C:\Users\%USERNAME%\Documents\) else (goto notexist)
echo.
echo C:\Users\%USERNAME%\Documents\
echo.
echo Encontre a pasta RedDragon. Observe a data de modificação dos arquivos e iremos para a seção MacroDB para verificar se possui algum tipo de macro
echo.
pause
goto MACROS

:CoolerMaster
cls
if exist "C:\ProgramData\CoolerMaster\PORTAL\config\" (start C:\ProgramData\CoolerMaster\PORTAL\config\) else (goto notexist)
echo.
echo C:\ProgramData\CoolerMaster\PORTAL\config\
echo.
echo Veja a data de modificação dos arquivos, verifique a data de modificação de mm710 / mm710
echo.
pause
goto MACROS



:Roccat
cls
if exist "C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\" (start "C:\Users\%USERNAME%\AppData\Roaming\ROCCAT\SWARM\) else (goto notexist)
echo %userprofile%\AppData\Roaming\ROCCAT\SWARM\
echo.
echo Veja a data de modificação do arquivo de configurações
echo.
pause
goto MACROS

:Steelseries
cls
if exist "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\" (start C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\) else (goto notexist)
echo.
echo C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Local Storage\leveldb\
echo C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\
echo.
echo Observe a data de modificação do arquivo de variável Exemplo 000003.log / 00000x.log (x depende do número com a data de modificação mais recente)
echo.
pause
goto MACROS

:Alienware
cls
if exist "C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata" (start C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata) else (goto notexist)
echo.
echo C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata
echo.
echo Observe a data de modificação do arquivo .JSON
echo.
pause
goto MACROS

:MotorSpeed
cls
if exist "C:\Program Files\Gaming MouseV30" (start C:\Program Files\Gaming MouseV30) else (goto notexist)
echo.
echo C:\Program Files\Gaming MouseV30
echo.
echo Veja a data de modificação do arquivo "Record.ini"
echo.
pause
goto MACROS

:notexist2
echo A pasta não existe




:all
cls
title Todas as pastas.
echo Pesquisando todas as pastas...
Echo. 
echo.

echo Buscando Logitech...
if exist %userprofile%\AppData\local\lghub (start %userprofile%\AppData\local\lghub) else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto x200)
echo Directorio  C:\usuarios\*Usuario del pc*\AppData\local\LGHUB\
echo Veja a data de modificação das configurações
echo.
pause 


:x200
echo Buscando Xenon200...
if exist "C:\Program Files (x86)\Xenon200" (explorer "C:\Program Files (x86)\Xenon200\") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto bl7)
echo Directorio C:\Program Files (x86)\Xenon200\
echo.
echo Olhe a data na pasta de configuração
echo.
pause

:bl7
echo Buscando Bloody7...
if exist "C:\Program Files (x86)\bloody7" (explorer "C:\Program Files (x86)\bloody7") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto raz)
echo.
echo C:\program files (x86)\bloody7\bloody7\userlog\mouse\
echo.
echo Verifique a data de modificação do arquivo
echo.
pause

:raz
echo Buscando Razer...
if exist %userprofile%\AppData\local\razer\synapse3 (start "%userprofile%\AppData\local\razer\synapse3") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto cor)
echo.
echo C:\ProgramData\Razer\Synapse Accounts
echo C:\Users\*Usuario del pc*\appdata\local\razer\synapse3\log
echo C:\Users\*Usuario del pc*\AppData\Local\Razer\Razer central\Account\RZR_uniqueid
echo.
echo Veja a data de modificação dos arquivos, veja a data de modificação de Emily3 
echo.
pause

:cor
echo Buscando Corsair...
if exist %userprofile%\AppData\roaming\corsair\CUE (start "%userprofile%\AppData\roaming\corsair\CUE") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto redg)
echo.
echo C:\users\%USERNAME%\appdata\corsair\CUE
echo.
echo Veja a data de modificação dos arquivos
echo.
pause

:redg
echo Buscando RedDragon...
if exist "C:\Users\%username%\AppData\Roaming\REDRAGON\GamingMouse" (start "C:\Users\%username%\AppData\Roaming\REDRAGON\GamingMouse") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto gmo)
echo.
echo C:\Users\%username%\AppData\Roaming\REDRAGON\GamingMouse
echo.
echo Encontre a pasta RedDragon. Veja a data de modificação do arquivo "Config.ini", "Macro.ini"
echo.
pause

:gmo
echo Buscando GloriousModelO/D...
if exist %userprofile%\AppData\local\BY-COMBO2 (start %userprofile%\AppData\local\BY-COMBO2) else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto redgm711)
echo Directorio C:\Users\*Usuario del pc*\appdata\local\BY-COMBO2
echo.
echo Veja a data de modificação da pasta Mac
echo.
pause

:redgm711
echo Buscando RedDragonM711...
if exist "C:\Users\%USERNAME%\Documents\M711 Gaming Mouse" (start "C:\Users\%USERNAME%\Documents\M711 Gaming Mouse") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto cool)
echo.
echo C:\Users\%USERNAME%\Documents\M711 Gaming Mouse
echo.
echo Veja o arquivo com a extensão MacroN e sua data de modificação 
echo.
pause

:cool
echo Buscando CoolerMaster...
if exist "C:\ProgramData\CoolerMaster\PORTAL\config\" (explorer C:\ProgramData\CoolerMaster\PORTAL\config\) else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto roc)
echo.
echo C:\ProgramData\CoolerMaster\PORTAL\config\
echo.
echo Veja a data de modificação dos arquivos, verifique a data de modificação de mm710 / mm710
echo.
pause

:roc
echo Buscando Roccat...
if exist "C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\" (start "C:\Users\%USERNAME%\AppData\Roaming\ROCCAT\SWARM\") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto stee)
echo %userprofile%\AppData\Roaming\ROCCAT\SWARM\
echo.
echo Veja a data de modificação do arquivo de configurações
echo.
pause

:stee
echo Buscando Steelseries...
if exist "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\" (start "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto alw)
echo.
echo C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Local Storage\leveldb\
echo C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\
echo.
echo Observe a data de modificação do arquivo de variável Exemplo 000003.log / 00000x.log (x depende do número com a data de modificação mais recente)
echo.
pause

:alw
echo Buscando Allienware
if exist "C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata" (explorer "C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata") else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & goto moto)
echo.
echo C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata
echo.
echo Confirme a data de modificação do arquivo .JSON
echo.
pause


:moto
echo Buscando MotorSpeed
if exist "C:\Program Files\Gaming MouseV30" (explorer C:\Program Files\Gaming MouseV30) else (ping localhost -n 2 >nul & echo A pasta não foi encontrada & echo. & pause & goto menu)
echo.
echo C:\Program Files\Gaming MouseV30
echo.
echo Veja a data de modificação do arquivo "Record.ini"	
echo.
pause
goto MACROS


:notexist
cls
echo.
echo [34;4;101m
echo A PASTA NÃO EXISTE
echo [0m
echo [32m
pause
goto MACROS

:DETECTIONS

cls                        
title Detections
color 2
mode 83,24
Echo 8888888b.           888                     888    d8b   
ping localhost -n 1.5 >nul
echo 888  "Y88b          888                     888    Y8P          
ping localhost -n 1.5 >nul                  
echo 888    888          888                     888                                   
echo 888    888  .d88b.  888888 .d88b.   .d8888b 888888 888  .d88b.  88888b.  .d8888b  
ping localhost -n 1.5 >nul
echo 888    888 d8P  Y8b 888   d8P  Y8b d88P"    888    888 d88""88b 888 "88b 88K      
ping localhost -n 1.5 >nul
echo 888    888 88888888 888   88888888 888      888    888 888  888 888  888 "Y8888b.
ping localhost -n 1.5 >nul 
echo 888  .d88P Y8b.     Y88b. Y8b.     Y88b.    Y88b.  888 Y88..88P 888  888      X88 
ping localhost -n 1.5 >nul
echo 8888888P"   "Y8888   "Y888 "Y8888   "Y8888P  "Y888 888  "Y88P"  888  888  88888P'
ping localhost -n 1.5 >nul
echo.
echo.                                                                          
echo                 %r% [ %s% 1 %r% ] %s% Dps Scan %r%           %r% [ %s% 4 %r% ] %s% MsMpeng Scan %r%                
echo.
echo                 %r% [ %s% 2 %r% ] %s% Pcasvc Scan %r%        %r% [ %s% 5 %r% ] %s% Diagtrack Scan %r%      
echo.
echo.
echo                 %r% [ %s% 3 %r% ] %s% Regedit %r%            %r% [ %s% 6 %r% ] %s% Menu %r%           
echo.
echo.  
SET /p x=[4m[97m[[91mDete[93m[91mction[97m][0m[93m►[92m 
if=%x%==1 goto DPS
if=%x%==2 goto PCA
if=%x%==3 goto RG2
if=%x%==4 goto MSM
if=%x%==5 goto DIAG
if=%x%==6 goto MENU   

:DPS













:RG2
title Regedit Scan  
mode 144 , 26
cls                                                                                                                                                                                                                          

echo.
echo                      ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄ 
echo                     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌
echo                     ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌
echo                     ▐░▌       ▐░▌▐░▌          ▐░▌          ▐░▌          ▐░▌          ▐░▌       ▐░▌▐░▌▐░▌    ▐░▌
echo                     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌ ▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌          ▐░█▄▄▄▄▄▄▄█░▌▐░▌ ▐░▌   ▐░▌
echo                     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌▐░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌          ▐░░░░░░░░░░░▌▐░▌  ▐░▌  ▐░▌
echo                     ▐░█▀▀▀▀█░█▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░▌ ▀▀▀▀▀▀█░▌ ▀▀▀▀▀▀▀▀▀█░▌▐░▌          ▐░█▀▀▀▀▀▀▀█░▌▐░▌   ▐░▌ ▐░▌
echo                     ▐░▌     ▐░▌  ▐░▌          ▐░▌       ▐░▌          ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌
echo                     ▐░▌      ▐░▌ ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌ ▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌▐░▌     ▐░▐░▌
echo                     ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░▌      ▐░░▌
echo                      ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀        ▀▀                                                                                            
echo.
echo.
echo                 %r% [ %s% 1 %r% ] %s% Cheats %r%                 %r% [ %s% 4 %r% ] %s% Cheat Engine  %r%                
echo.
echo.                                                                        
echo                 %r% [ %s% 2 %r% ] %s% AutoClicks %r%             %r% [ %s% 5 %r% ] %s% Menu %r%         
echo.
echo.                                                                        
echo                 %r% [ %s% 3 %r% ] %s% Macros %r%             
echo.
echo.
echo.
echo.
SET /p scanoption=[4m[97m[[91mOpç[93m[91mão[97m][0m[93m►[37m 
if=%scanoption%==1 goto cheatss
if=%scanoption%==2 goto autoclickss
if=%scanoption%==3 goto macross
if=%scanoption%==4 goto cheatengine
if=%scanoption%==5 goto MENU  

:cheatss
cls 
Title 	Buscando Registros
echo                                                       Buscando Registros 


echo [33m[ 1 ] Nitr0 , IMEU (Auto Updating Hooks)[37m

REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000ca0b0091060c0001000000000000000000000a7322000050bb64edddacd5010000000000000000020000002800000000000000000000000000000000000000000000001C0B0000000000000100000001000000 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004c01 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004401 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000420A /t REG_BINARY /d /v /s 
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000003801 /t REG_BINARY /d /v /s 
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000B800 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 63555CB4FF5ED701000000000000000000000000020000 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000008C01000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004E01000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000005601000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000005801000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000008201000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000007201000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000008C01000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000F406000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000607000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001207000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004E01000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000007A0A
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004401
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004201
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001801
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000A01
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000401
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000F801
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000EE00
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000E800
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000DE00
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000C800
ping localhost -n 1.5 >nul 

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000B400
ping localhost -n 3 >nul 
echo.
echo.
echo.
echo [33m[ 2 ] Ambrosial , Injectores[37m 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f  53414350010000000000000007000000280000000060FE00000000000
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000000034FE000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000000024FE000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000007200010000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000000024FE000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000006E00010000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000000060FE000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000640B000000
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001205000000000001000000000000000000000A6322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004E02000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000005604000000000001000000000000000000000A7322000050BB64EDDDACD501
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000AC06
ping localhost -n 2 >nul 
echo.
echo.
echo.
echo [33m[ 3 ] Injectores[37m
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000ac31 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000006c31 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000002c31 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000ce03 /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000024fe /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000050000001000000000000000000000000000000000000
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000885E /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000905E /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000985E /t REG_BINARY /d /v /s
ping localhost -n 1.5 >nul 
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000A65E /t REG_BINARY /d /v /s
ping localhost -n 2 >nul 
echo.
echo.
echo.

echo [33m[ 4 ] Cheats funcionales [37m
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000A205
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000E207
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000800E
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000002C01
ping localhost -n 2 >nul 
echo.
echo.
echo.
echo [33m[ 5 ] Otros [37m
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004215
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000003014 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000B60D 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000DA0B 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000009805 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000002C01 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000ce03 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000024fe 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000500000010000000000000000000000000000000000000000200000028000000000000000000004000000000000000000000000000000000E9E50700000000000100000001000000 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000885E
ping localhost -n 1.5 >nul  
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000905E 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000985E 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000A65E 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000BC0D 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000009A04
ping localhost -n 1.5 >nul  
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000009004 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000380C 
ping localhost -n 1.5 >nul 
rEG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000820E 
ping localhost -n 1.5 >nul 
rEG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000007A16 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000280E 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000AC0E 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000280E 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 63555CB4FF5ED701000000000000000000000000020000 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000007A0A 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004401 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004201 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001801 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000A01 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000401 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000F801
ping localhost -n 1.5 >nul  
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000EE00 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000E800 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000DE00 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000C800 
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000B400 
ping localhost -n 1.5 >nul 
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000007401 
ping localhost -n 1.5 >nul 
echo. 
pause 
Title Escaneamento Finalizado...
goto rg2 

:autoclickss	
cls & title Escaneando... 




echo [33m[ 1 ] Autoclickers Genericos [37m
echo.
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000005400
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000005E65
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000BC06
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000003D300D
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000003D300D0003090E0001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000003D300D0003090E0001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000008E610001BDB110001
echo.
echo.
echo [33m[ 2 ] Autoclickers Genericos [37m
echo.
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004006
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000001E0D
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000003A26
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A93B0D
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A93B0D00A0720D0001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000020590600BFD4060001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A93B0D00A0720D0001
ping localhost -n 1.5 >nul 
echo.
echo.
echo [33m[ 3 ] Autoclickers Genericos[37m 
echo.
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000E000
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000E000001BB8010001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000008606
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000000827
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000082700690E270001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000080C70E0026370F0001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000C0280E00EC320E0001
ping localhost -n 1.5 >nul 
echo.
echo.
echo [33m[ 4 ] Autoclickers Genericos[37m 
echo.
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000DA07
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000DA0700216008
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000003600
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000005C09
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000009801
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000E003000000000001
ping localhost -n 1.5 >nul 


title Escaneamento Completado 
echo.
echo.
echo.
echo                                         888888888,                               
echo                                    88882 88   488 8888p                          
echo                                 488,     88    88     4884                       
echo                               #88        88    88        88,                     
echo                              884         88    88         288                    
echo                             88P          88    88          h82                   
echo                             88           88    88           88                                     
echo                             88           882  888           88                   
echo                             8888888888888888888888888888888888                   
echo                             88                              88                   
echo                             88                              88                                    
echo                             88                              88                   
echo                             88                              88                   
echo                             .88                            88                    
echo                              .88                          88                     
echo                                888                      888                      
echo                                  8884                8882                        
echo                                     .888888#442888888
pause>nul
goto rg2 




:macross
cls
Title Buscando registros de macros
Echo [33mMacrosGamer[37m
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 53414350010000000000000007000000280000000E5808000000000001
ping localhost -n 1.5 >nul 
echo.
echo.
echo.
echo.
Echo [33mAutoHotkey[37m
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000F213000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000002614000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000F213000000000001
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000840D
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004A12
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000FC0B
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000CE0D
ping localhost -n 1.5 >nul 
echo.
echo.
echo.
echo.
echo [33mXMouse[37m
ping localhost -n 1.5 >nul 
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000F8B21900FBCC190001
ping localhost -n 1.5 >nul 
echo.
echo.
echo.
pause>nul
GOTO rg2




:cheatengine 
cls & title Escaneando... 
echo [ 1 ] Cheat Engine (Todas versões)
echo.
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000070BE04000000000001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000448A000000000001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000B80805005E5B050001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000018090500DD7B050001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000F02705005CDC050001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000882805004BA3050001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A89C1F015689200101
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000102E5F0177BC5F0101
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000684D8301B630840101
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000018050500E7AE050001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A0FB04004738050001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000090DD05008B9F060001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000F0C83E000000000001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000098130600F247060001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000F0C83E000000000001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000004666000000000001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000018A175000B64760001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000B8066700FC73670001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000018477900D7157A0001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000F0137E00A08F7E0001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A855B10050FCB10001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000B011B700B293B70001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000B04DEA00C98CEA0001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000B035EA00221AEB0001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000284E83
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000284E83019AC5830101
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000088F602
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000088F60200FCC4030001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000090DD05
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000090DD0500D9BA060001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A855B1
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A855B10050FCB10001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A8DBE2
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A8DBE200BF7CE30001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A8C5E2
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A8C5E200532DE30001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000008830
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000000D03F
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A04125
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 5341435001000000000000000700000028000000A0412500F14B250001
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000060E803
ping localhost -n 1.5 >nul 
echo.
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 534143500100000000000000070000002800000060E80300EDC2040001
ping localhost -n 1.5 >nul 
echo.
title Escaneo Completado 
echo.                                                                                                                                                                                                                                                                                                             
echo                                  222228   88888888   8282225                     
echo                                288888888888844444888888888888x                   
echo                            .8    .844444884444444448884444488                     
echo                          22822888884888448888888888444888888,                    
echo                        .8888888888888848.           788888888                    
echo                         x888888888888                   8888                     
echo                           888888888                                              
echo                      .222888888888882222222222222222,                            
echo                      .888888888888888888888888888888222222                       
echo                      .28888888888888888888888888888,                             
echo                           888888882                                              
echo                         2288888888822                  .2222.                    
echo                         22888888888822227           222222222                    
echo                          228882828882222222222222222222288228                    
echo                                 2222222222222222222222222222                     
echo                                2822222222222222222222222222224                   
echo                                  222222   22222222   .22222.                   
                                        
pause>nul
goto RG2


:SCREENSHARE
 cls   

mode 100,20
color 4
 echo.
 echo             %r%[ %s%YodaScanner %r%]
 echo.
 echo %s%coloque a %r%[%s% -s dps/explorer/Minecraft %r%]%s% file abaixo:
 echo.                
ECHO               ____     ____   
ECHO              6MMMMb\  6MMMMb\ 
ECHO             6M'    ` 6M'    ` 
ECHO             MM       MM       
ECHO             YM.      YM.      
ECHO              YMMMMb   YMMMMb  
ECHO                  `Mb      `Mb 
ECHO                   MM       MM 
ECHO                   MM       MM 
ECHO             L    ,M9 L    ,M9 
ECHO             MYMMMM9  MYMMMM9  
echo.
     
 set /p link= %s%File %r%: 
 goto :ScanningDPS

:ScanningDPS
color 4
mode 100,20
 echo.
 echo             %r%[ %s%YodaScanner %r%]
 echo.
 echo              %r%- [ %s%Scanneando... %r%] -
echo.
timeout /t 3 /nobreak > nul  
goto SS
cls

:SS
cls 
color 4
mode 100,20
 echo.
 echo             %r%[ %s%YodaScanner %r%]
 echo.
 echo                %r%- [ %s%Results %r%] -%s%

 >nul findstr /c:"2021/10/04:02:34:44" %link%   && (  
  echo - Nitro Found!              2021/10/04:02:34:44                 
 echo.   
 )  

 >nul findstr /c:"2022/02/09:21:06:42!8813b" %link%   && (  
  echo - Nitro Found!              discord.exe                 
 echo.   
 )  

 >nul findstr /c:"DISCORD.EXE-C43D32C1.pf" %link%   && (  
  echo - Nitro Found!              discord.exe                 
 echo.   
 )


>nul findstr /c:"2023/04/01:22:42:20!0!" %link%   && (  
  echo - Nitro Found!              2021/10/04:02:34:44                 
 echo.   ex 
)  
 
>nul findstr /c:".EXE-2135E028.pf" %link%   && (  
  echo - Nitro Found!              2021/10/04:02:34:44                 
 echo.   ex 
)  

 >nul findstr /c:"2022/02/09:21:04:46" %link%   && (  
  echo - Nitro Found!              2022/02/09:21:04:46                                     
 echo.   
 )   

 >nul findstr /c:"2013/06/28:14:45:44" %link%   && (  
  echo - Nitro Found!              2013/06/28:14:45:44           
 echo.   
 )   

 >nul findstr /c:"2020/10/17:20:53:53" %link%   && (  
  echo - Nitro Found!              2020/10/17:20:53:53              
 echo.   
 )   

 >nul findstr /c:"!2097/05/05:21:18:12!" %link%   && (  
  echo - Ambrosial Found!          !2097/05/05:21:18:12!               
 echo.   
 )  

 >nul findstr /c:"(github.com/disepi/ambrosial)" %link%   && (  
  echo - Ambrosial Found!          !2097/05/05:21:18:12!               
 echo.   
 )  

>nul findstr /c:"FSUTIL.EXE-0B55CC80.pf" %link%   && (  
  echo - DeleteJournal  Found!          !2097/05/05:21:18:12!               
 echo.   
 )

>nul findstr /c:"WHATSAPP.EXE-2EA2947B.pf" %link%   && (  
  echo - Nitr0  Found!          !2097/05/05:21:18:12!               
 echo.   
 )  

 >nul findstr /c:"!2019/07/30:08:52:45!" %link%   && (  
  echo - SSfucker Found!        !2019/07/30:08:52:45!          
 echo.   
 )  

 >nul findstr /c:"!2017/11/19:17:14:16!" %link%   && (  
  echo - StringCleaner Found!        !2017/11/19:17:14:16!           
 echo.   
 )  

 >nul findstr /c:"!2022/03/29:14:22:05!" %link%   && (  
  echo - StringCleaner Found!        !2022/03/29:14:22:05!              
 echo.   
 )  

 >nul findstr /c:"!2022/03/29:14:22:05!" %link%   && (  
  echo - StringCleaner Found!        !2022/03/29:14:22:05!              
 echo.   
 )  

 >nul findstr /c:"!2020/12/23:20:17:13!" %link%   && (  
  echo - StringCleaner Found!        !2020/12/23:20:17:13!            
 echo.   
 )

 >nul findstr /c:"!2022/03/29:14:22:05!" %link%   && (  
  echo - StringCleaner Found!        !2022/03/29:14:22:05!              
 echo.   
 )  

 >nul findstr /c:"2021/10/04:02:34:44" %link%   && (  
  echo - Nitro Found!              2021/10/04:02:34:44                 
 echo.   
 )  

 >nul findstr /c:"!2022/04/22:00:14:56!" %link%   && (  
  echo - Nitro Found!              2021/10/04:02:34:44                 
 echo.   
 )  

 >nul findstr /c:"!2022/04/22:00:14:56!" %link%   && (  
  echo - Hanzai Found!              !2022/04/22:00:14:56!                
 echo.   
 )  

 >nul findstr /c:"!2022/04/28:11:30:42!" %link%   && (  
  echo - Hanzai Found!             !2022/04/28:11:30:42!             
 echo.   
 )  

 >nul findstr /c:"!2022/05/31:23:57:21!" %link%   && (  
  echo - AutoClicker Found!        !2022/05/31:23:57:21!              
 echo.   
 )  

 >nul findstr /c:"!2022/05/29:15:06:27!0!" %link%   && (  
  echo - Hanzai Found!             !2022/04/28:11:30:42!             
 echo.   
 )  

 >nul findstr /c:"2020/05/13:10:10:19!19" %link%   && (  
  echo - X-MOUSE BUTTON Found!     2020/05/13:10:10:19!19            
 echo.   
 )  

 >nul findstr /c:"!2021/10/22:23:44:09!" %link%   && (  
  echo - Apollo Found!             !2021/10/22:23:44:09!            
 echo.   
 )  

 >nul findstr /c:"!2022/04/28:11:30:42!" %link%   && (  
  echo - Horion Found!             !2022/04/28:11:30:42!            
 echo.   
 )  

 >nul findstr /c:"Horion: 1.19.50 - Release build" %link%   && (  
  echo - Horion Found!         Horion.dll                   
 echo.   
 ) 

 >nul findstr /c:"!2022/05/22:07:43:59!" %link%   && (  
  echo - CND Free Found!            !2022/05/22:07:43:59!            
 echo.   
 ) 

 >nul findstr /c:"2022/03/29:14:22:05!0!" %link%   && (  
  echo - SetFileDate Found!       2022/03/29:14:22:05!0!
 echo.   
 )

>nul findstr /c:"2021/01/06:22:17:18" %link%   && (  
  echo - BulkFileChanger Found!  2021/01/06:22:17:18
 echo.   
 )

>nul findstr /c:"2021/01/28:01:56:52" %link%   && (  
  echo - IObit Unlocker Found!   2021/01/28:01:56:52
 echo.   
 )

>nul findstr /c:"2022/04/07:11:40:03" %link%   && (  
  echo - CCleaner1 Found!        2022/04/07:11:40:03
 echo.   
 )

>nul findstr /c:"2022/04/07:11:38:19" %link%   && (  
  echo - CCleaner2 Found!        2022/04/07:11:38:19
 echo.   
 )

>nul findstr /c:"!2022/04/18:05:28:15!" %link%   && (  
  echo - Strike Found!      2021/05/14:13:20:22 
 echo.   
 )

>nul findstr /c:"2021/05/14:13:20:22" %link%   && (  
  echo - AutoClicker Found!      2021/05/14:13:20:22 
 echo.   
 )

>nul findstr /c:"2021/05/14:13:20:22" %link%   && (  
  echo - AutoClicker Found!      2021/05/14:13:20:22 
 echo.   
 )

>nul findstr /c:"2021/05/14:13:20:22" %link%   && (  
  echo - AutoClicker Found!      2021/05/14:13:20:22 
 echo.   
 )

>nul findstr /c:"2021/05/14:13:20:22" %link%   && (  
  echo - AutoClicker Found!      2021/05/14:13:20:22
 echo.   
 )

>nul findstr /c:"!2053/10/30:11:10:53!0!" %link%   && (  
  echo - AutoClicker Found!      !2053/10/30:11:10:53
 echo.   
 )

>nul findstr /c:"!2088/12/06:18:47:45!0!" %link%   && (  
  echo - AutoClicker Found!      !2088/12/06:18:47:45
 echo.   
 )

>nul findstr /c:"!2076/04/20:03:50:49!0!" %link%   && (  
  echo - AutoClicker Found!      !2076/04/20:03:50:49
 echo.   
 )

>nul findstr /c:"2049/03/21:07:41:32!0!" %link%   && (  
  echo - AutoClicker Found!      2049/03/21:07:41:32!0!
 echo.   
 )

>nul findstr /c:"!2066/02/11:18:29:55!0!" %link%   && (  
  echo - AutoClicker Found!      !2066/02/11:18:29:55
 echo.   
 )

>nul findstr /c:"!2078/12/05:04:31:45!0!" %link%   && (  
  echo - AutoClicker Found!      !2078/12/05:04:31:45!0!
 echo.   
 )

 >nul findstr /c:"2019/03/14:20:01:24!" %link%   && (  
  echo - AutoClicker.exe Found!  2019/03/14:20:01:24!
 echo.   
 )

>nul findstr /c:"!2061/08/28:13:59:22!0!" %link%   && (  
  echo - AutoClicker.exe Found!  !2061/08/28:13:59:22
 echo.   
 )

 >nul findstr /c:"2016/05/30:16:33:32" %link%   && (  
  echo - GS-AutoClicker Found!    2016/05/30:16:33:32
 echo.   
 )

 >nul findstr /c:"2016/05/30:16:33:32" %link%   && (  
  echo - X-MouseButtom Found!    2016/05/30:16:33:32
 echo.   
 )

 >nul findstr /c:"2016/04/02:03:20:09" %link%   && (  
  echo - SetupClicker Found!    2016/04/02:03:20:09
 echo.   
 )

 >nul findstr /c:"2021/12/28:18:02:37" %link%   && (  
  echo - AutoClicker Found!   2021/12/28:18:02:37
 echo.   
 )

 >nul findstr /c:"1970/01/01:00:00:00!647f2!" %link%   && (  
  echo - Cheat Engine Found!      1970/01/01:00:00:00!647f2!
 echo.   
 )   

 >nul findstr /c:"2064/10/12:00:11:10!0!" %link%   && (  
  echo - Legit Loader Found!       2064/10/12:00:11:10!0!
 echo.   
 )   

 >nul findstr /c:"2045/05/31:22:12:48!52148f!" %link%   && (  
  echo - XanaxClient Found!        2045/05/31:22:12:48!52148f!
 echo.   
 )   

 >nul findstr /c:"2013/06/28:14:45:44" %link%   && (  
  echo - NoRecoil Community Z Found!      2013/06/28:14:45:44  
 echo.   
 )   

 >nul findstr /c:"2043/10/22:08:32:37!0!" %link%   && (  
  echo - PurpleReg found!         2043/10/22:08:32:37!0!
 echo.   
 )   

 >nul findstr /c:"2009/09/12:05:55:41" %link%   && (  
  echo - WinRap found! (Usado para esconder programas executados)   
 echo.   
 )   

 >nul findstr /c:"2020/10/27:18:17:33" %link%   && (  
  echo - Regedit v1.exe found     2020/10/27:18:17:33
 echo.   
 )   

 >nul findstr /c:"2021/12/06:14:26:36" %link%   && (  
  echo - EliteRegedit found       2021/12/06:14:26:36
 echo.   
 )   

 >nul findstr /c:"2012/07/13:22:47:16" %link%   && (  
  echo - CleanUp Royale found (Clear Regedit)   
 echo.   
 )   

 >nul findstr /c:"2021/05/27:00:14:17" %link%   && (  
  echo - Cero Regedit Found   
 echo.   
 )   

 >nul findstr /c:"2021/12/06:14:27:16" %link%   && (  
  echo - JhonNet premium Found   
 echo.   
 )   

 >nul findstr /c:"2021/05/09:04:34:32" %link%   && (  
  echo - FakeLag clumsy Found   
 echo.   
 )   

 >nul findstr /c:"2021/04/13:01:31:19" %link%   && (  
  echo - Lunar Academy Bypass Found!   
 echo.   
 )   

 >nul findstr /c:"2018/04/28:15:32:22" %link%   && (  
  echo - Remove Strings Found!   
 echo.   
)
 >nul findstr /c:"2021/10/04:02:34:44" %link%   && (   
  echo - Nitro Found!              2021/10/04:02:34:44                  
 echo.    
 )    
 >nul findstr /c:"2021/12/24:03:46:26" %link%   && (   
  echo - Nitro Found!              2021/12/24:03:46:26              
 echo.    
 )    
 >nul findstr /c:"2022/02/09:21:04:46" %link%   && (   
  echo - Nitro Found!              2022/02/09:21:04:46                                      
 echo.    
 )    
 >nul findstr /c:"2013/06/28:14:45:44" %link%   && (   
  echo - Nitro Found!              2013/06/28:14:45:44            
 echo.    
 )    
 >nul findstr /c:"2020/10/17:20:53:53" %link%   && (   
  echo - Nitro Found!              2020/10/17:20:53:53               
 echo.    
 )    
 >nul findstr /c:"!2097/05/05:21:18:12!" %link%   && (   
  echo - Ambrosial Found!          !2097/05/05:21:18:12!                
 echo.    
 )   
 >nul findstr /c:"!2019/07/30:08:52:45!" %link%   && (   
  echo - SSfucker Found!        !2019/07/30:08:52:45!           
 echo.    
 )   
 >nul findstr /c:"!2017/11/19:17:14:16!" %link%   && (   
  echo - StringCleaner Found!        !2017/11/19:17:14:16!            
 echo.    
 )   
 >nul findstr /c:"!2022/03/29:14:22:05!" %link%   && (   
  echo - StringCleaner Found!        !2022/03/29:14:22:05!               
 echo.    
 )   
 >nul findstr /c:"!2022/03/29:14:22:05!" %link%   && (   
  echo - StringCleaner Found!        !2022/03/29:14:22:05!               
 echo.    
 )   
 >nul findstr /c:"!2020/12/23:20:17:13!" %link%   && (   
  echo - StringCleaner Found!        !2020/12/23:20:17:13!             
 echo.    
 ) 
 >nul findstr /c:"!2022/03/29:14:22:05!" %link%   && (   
  echo - StringCleaner Found!        !2022/03/29:14:22:05!               
 echo.    
 )   
 >nul findstr /c:"2021/10/04:02:34:44" %link%   && (   
  echo - Nitro Found!              2021/10/04:02:34:44                  
 echo.    
 )   
 >nul findstr /c:"!2022/04/22:00:14:56!" %link%   && (   
  echo - Nitro Found!              2021/10/04:02:34:44                  
 echo.    
 )   
 >nul findstr /c:"!2022/04/22:00:14:56!" %link%   && (   
  echo - Hanzai Found!              !2022/04/22:00:14:56!                 
 echo.    
 )   
 >nul findstr /c:"!2022/04/28:11:30:42!" %link%   && (   
  echo - Hanzai Found!             !2022/04/28:11:30:42!              
 echo.    
 )   
 >nul findstr /c:"!2022/05/31:23:57:21!" %link%   && (   
  echo - AutoClicker Found!        !2022/05/31:23:57:21!               
 echo.    
 )   
 >nul findstr /c:"!2022/05/29:15:06:27!0!" %link%   && (   
  echo - Hanzai Found!             !2022/04/28:11:30:42!              
 echo.    
 )   
 >nul findstr /c:"2020/05/13:10:10:19!19" %link%   && (   
  echo - X-MOUSE BUTTON Found!     2020/05/13:10:10:19!19             
 echo.    
 )   
 >nul findstr /c:"!2021/10/22:23:44:09!" %link%   && (   
  echo - Apollo Found!             !2021/10/22:23:44:09!             
 echo.    
 )   
 >nul findstr /c:"!2022/04/28:11:30:42!" %link%   && (   
  echo - Horion Found!             !2022/04/28:11:30:42!             
 echo.    
 )   
 >nul findstr /c:"Horion" %link%   && (   
  echo - Horion.dll Found!         Horion.dll                    
 echo.    
 )  
 >nul findstr /c:"!2022/05/22:07:43:59!" %link%   && (   
  echo - CND Free Found!                           
 echo.    
 )  
 >nul findstr /c:"2022/03/29:14:22:05!0!" %link%   && (   
  echo - SetFileDate Found!       2022/03/29:14:22:05!0! 
 echo.    
 ) 
>nul findstr /c:"2021/01/06:22:17:18" %link%   && (   
  echo - BulkFileChanger Found!  2021/01/06:22:17:18 
 echo.    
 ) 
>nul findstr /c:"2021/01/28:01:56:52" %link%   && (   
  echo - IObit Unlocker Found!   2021/01/28:01:56:52 
 echo.    
 ) 
>nul findstr /c:"2022/04/07:11:40:03" %link%   && (   
  echo - CCleaner1 Found!        2022/04/07:11:40:03 
 echo.    
 ) 
>nul findstr /c:"2022/04/07:11:38:19" %link%   && (   
  echo - CCleaner2 Found!        2022/04/07:11:38:19 
 echo.    
 ) 
>nul findstr /c:"!2022/04/18:05:28:15!" %link%   && (   
  echo - Strike Found!      2021/05/14:13:20:22  
 echo.    
 ) 
>nul findstr /c:"2021/05/14:13:20:22" %link%   && (   
  echo - AutoClicker Found!      2021/05/14:13:20:22  
 echo.    
 ) 
>nul findstr /c:"2021/05/14:13:20:22" %link%   && (   
  echo - AutoClicker Found!      2021/05/14:13:20:22  
 echo.    
 ) 
>nul findstr /c:"2021/05/14:13:20:22" %link%   && (   
  echo - AutoClicker Found!      2021/05/14:13:20:22  
 echo.    
 ) 
>nul findstr /c:"2021/05/14:13:20:22" %link%   && (   
  echo - AutoClicker Found!      2021/05/14:13:20:22 
 echo.    
 ) 
 >nul findstr /c:"2019/03/14:20:01:24!" %link%   && (   
  echo - AutoClicker.exe Found!  2019/03/14:20:01:24! 
 echo.    
 ) 
 >nul findstr /c:"2016/05/30:16:33:32" %link%   && (   
  echo - GS-AutoClicker Found!    2016/05/30:16:33:32 
 echo.    
 ) 
 >nul findstr /c:"2016/05/30:16:33:32" %link%   && (   
  echo - X-MouseButtom Found!    2016/05/30:16:33:32 
 echo.    
 ) 
 >nul findstr /c:"2016/04/02:03:20:09" %link%   && (   
  echo - SetupClicker Found!    2016/04/02:03:20:09 
 echo.    
 ) 
 >nul findstr /c:"2021/12/28:18:02:37" %link%   && (   
  echo - AutoClicker Found!   2021/12/28:18:02:37 
 echo.    
 ) 
 >nul findstr /c:"1970/01/01:00:00:00!647f2!" %link%   && (   
  echo - Cheat Engine Found!    
 echo.    
 )    
 >nul findstr /c:"2064/10/12:00:11:10!0!" %link%   && (   
  echo - Legit Loader Found!    
 echo.    
 )    
 >nul findstr /c:"2045/05/31:22:12:48!52148f!" %link%   && (   
  echo - XanaxClient Found!    
 echo.    
 )    
 >nul findstr /c:"2013/06/28:14:45:44" %link%   && (   
  echo - NoRecoil Community Z Found!    
 echo.    
 )    
 >nul findstr /c:"2043/10/22:08:32:37!0!" %link%   && (   
  echo - PurpleReg found!    
 echo.    
 )    
 >nul findstr /c:"2009/09/12:05:55:41" %link%   && (   
  echo - WinRap found! (Usado para esconder programas executados)    
 echo.    
 )    
 >nul findstr /c:"2020/10/27:18:17:33" %link%   && (   
  echo - Regedit v1.exe found    
 echo.    
 )    
 >nul findstr /c:"2021/12/06:14:26:36" %link%   && (   
  echo - EliteRegedit found    
 echo.    
 )    
 >nul findstr /c:"2012/07/13:22:47:16" %link%   && (   
  echo - CleanUp Royale found (Clear Regedit)    
 echo.    
 )    
 >nul findstr /c:"2021/05/27:00:14:17" %link%   && (   
  echo - Cero Regedit Found    
 echo.    
 )        
 >nul findstr /c:"2022/01/13:18:57:52" %link%   && (   
  echo - JhonNet exclusive Found    
 echo.    
 )    
 >nul findstr /c:"2021/12/06:14:27:16" %link%   && (   
  echo - JhonNet premium Found    
 echo.    
 )    
 >nul findstr /c:"2021/05/09:04:34:32" %link%   && (   
  echo - FakeLag clumsy Found    
 echo.    
 )    
 >nul findstr /c:"2021/04/13:01:31:19" %link%   && (   
  echo - Lunar Academy Bypass Found!    
 echo.    
 )    
 >nul findstr /c:"2018/04/28:15:32:22" %link%   && (   
  echo - Remove Strings Found!    
 echo.    
 )    

 echo            %s%Voltar %r%[ %s%1 %r%]
set /p o=
if %o%==1 goto MENU

pause



:ret

GOTO Menu


:ERROR
	ECHO  ======================================
	ECHO * Opção errada, escolha outra opção. *
	ECHO  ======================================
	PAUSE 
	GOTO menu


:exit
cls
TITLE Creditos [YodaCotoco]
COLOR 9
mode 59 , 20
echo.
echo.
echo              ──────▄▀▄─────▄▀▄
echo              ─────▄█░░▀▀▀▀▀░░█▄
echo              ─▄▄──█░░░░░░░░░░░█──▄▄
echo              █▄▄█─█░░▀░░┬░░▀░░█─█▄▄█ 
echo.
echo                     Yoda#0471
echo                     polarr#6680
echo                     Misterioso#0985
echo.
pause>nul
goto MENU


Del %~0 

Del %~0 




:Bypass

chcp 65001
mode 49,7
color a
title Bypass by Kenzosan Store
cls
echo ██████╗ ██╗   ██╗██████╗  █████╗ ███████╗███████╗
echo ██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝
echo ██████╔╝ ╚████╔╝ ██████╔╝███████║███████╗███████╗
echo ██╔══██╗  ╚██╔╝  ██╔═══╝ ██╔══██║╚════██║╚════██║
echo ██████╔╝   ██║   ██║     ██║  ██║███████║███████║
echo ╚═════╝    ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝
ping localhost -n 4 >nul
mode 120,30
del /s /f /q %USERPROFILE%\appdata\local\temp.
rmdir /s /q %userprofile%\AppData\Roaming\Microsoft\Windows\Recent
del /s /f /q %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations.
ping n- 2 127.0.0.1>nul
cls
color a
mode 40,5
echo ----------------------------------------
echo Foram apagadas 30 porcento!
echo ----------------------------------------
ping n- 2 127.0.0.1>nul
cls
color a
echo ----------------------------------------
echo         Clearing now regedit!
echo ----------------------------------------
ping n- 2 127.0.0.1>nul
cls
color a
ping n- 2 127.0.0.1>nul
mode 120,30
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU /f
reg delete HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings /f
reg delete C:HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist /f
reg delete HKEY_USERS\S-1-5-21-388864338-3198854620-2322039091-1001\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs /f
ping n- 2 127.0.0.1>nul
cls
mode 40,5
echo ----------------------------------------
echo Foram apagadas 99 porcento das strings.
echo ----------------------------------------
ping n- 2 127.0.0.1>nul
mode 120,30
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{9E04CAB2-CC14-11DF-BB8C-A2F1DED72085}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{A3D53349-6E61-4557-8FC7-0028EDCEEBF6}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{B267E3AD-A825-4A09-82B9-EEC22AA3B847}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{BCB48336-4DDD-48FF-BB0B-D3190DACB3E2}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{CAA59E3C-4792-41A5-9909-6A6A8D32490E}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{F2A1CB5A-E3CC-4A2E-AF9D-505A7009D442}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{F4E57C4B-2036-45F0-A9AB-443BCFE33D9F}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist{FA99DFC7-6AC2-453A-A5E2-5E2AFF4507BD}\Count" /v "
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "
taskkill /f /im SgrmBroker.exe
cls
color a
exit

Del %~0 

Del %~0 
