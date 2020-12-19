Account moved to: https://gitlab.com/illwill 



# SMB_Detect
2k/XP Detect - some old code to detect OS version on a network

            Os Detector 1.0
              by: illwill 
      optimization and bugfix: phr0stic
      born on 7/4/05 [fireworks bitch!]

 4kb app that detects if an OS is 2k or XP by connecting to port 445 of that machine.

How to:
either test on yourself by running from the console or try on a lan or within a shell
on a comprimised machine to get into the next box on the lan :D

ex.
```
C:\>detect.exe 127.0.0.1
[*]------------------------------[*]
[*]       XP/2K OS Detector      [*]
[*]    by: illwill & phr0stic    [*]
[*]------------------------------[*]

[+] Finding Host 127.0.0.1
[+] Connected to 127.0.0.1
[+] Bytes Sent: 222
[?] The box seems to be Windows XP
```
```
C:\>detect.exe 192.168.1.2
[*]------------------------------[*]
[*]       XP/2K OS Detector      [*]
[*]    by: illwill & phr0stic    [*]
[*]------------------------------[*]

[+] Finding Host 127.0.0.1
[+] Connected to 127.0.0.1
[+] Bytes Sent: 222
[?] The box seems to be Windows 2000
```


code should work fine .. maybe if im not lazy ill try to figure out nt/2k3 too
xillwillx@yahoo.com
-EOF

