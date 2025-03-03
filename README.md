# RDP config merge and launch
Launch RDP with your personal .rdp template merged with .rdp file supplied on cmdline. 

> [!IMPORTANT]
> This script requires [PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows) or later.

> - [How it works](#how-it-works)
> - [Installation](#installation)
> - [Usage](#usage)
> - [Requirements](#requirements)


## How it works
When used as the default program for .rdp files in Windows, the script `wrapper.cmd`
will perform the following actions upon called with a .rdp file as the first parameter:

1. `wrapper.cmd` will launch the `launch-rdp.ps1` script with parameters defined inside `wrapper.cmd` and the supplied cmdline prameter.
2. `launch-rdp.ps1` will merge your RDP configuration template with the .rdp file supplied as a command line parameter.
3. `launch-rdp.ps1` will start a RDP session with the merged configuration.


## Installation
1. [Download](https://github.com/lunndal/launch-rdp/archive/refs/heads/main.zip) or clone the scripts in this folder to a local directory on your Windows computer.
2. Change the variables inside `wrapper.cmd` to reflect your personal setup.
3. _Optionally_ edit the template `template-example.rdp`
4. _Optionally_ Associate .rdp files with the `wrapper.cmd` script.
5. _Optionally_ allow your browser to open .rdp files immediately after download.


## Usage
There are two use cases for the scripts:

- Run `launch-rdp.ps1` from command line (`Get-Help -Detailed launch-rdp.ps1`)
- Associate .rdp files with the `wrapper.cmd` script, and optionally allow browser to automatically open .rdp files.


## Getting the window size right
A .rdp configuration file offers three parameters to configure the remote desktop resolution and the local client windows size and position. 
It can sometimes be a little tricky to get these right. [This thread](https://superuser.com/questions/665400/getting-rdp-to-honor-width-and-height-parameters) can help.
Please note [the comment](https://superuser.com/questions/665400/getting-rdp-to-honor-width-and-height-parameters#comment1949148_665413) about getting rid of any scroll bars that might appear.


# Requirements
This script requires [PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows) or later.
