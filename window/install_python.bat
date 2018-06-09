:: install by powershell
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.6.3/python-3.6.3.exe','%USERPROFILE%\Desktop\python-3.6.3.exe')"

:: run service 
%USERPROFILE%\Desktop\python-3.6.3.exe