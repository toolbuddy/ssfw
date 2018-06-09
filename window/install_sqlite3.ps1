# Gain Admin Permission
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Step 1: Install build-tools
npm install  --global --production windows-build-tools

# Step 2: Need to install python 3
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.6.3/python-3.6.3.exe','%USERPROFILE%\Desktop\python-3.6.3.exe')"
%USERPROFILE%\Desktop\python-3.6.3.exe

# Step 3: Rebuild the sqlite3 deps (Make sure u r under project repo)
electron-rebuild -f -w sqlite3

# Force build from source :
#   npm install sqlite3 --build-from-source=sqlite3
# Installing an app that depends on sqlite3:
#   npm install --build-from-source=sqlite3