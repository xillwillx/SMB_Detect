.386
.model flat, stdcall
option casemap: none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\shell32.inc
include \masm32\include\wsock32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\shell32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\wsock32.lib
includelib \masm32\lib\masm32.lib

.data
 usage   db  "                                    ",13,10,\
             "[*]------------------------------[*]",13,10,\
             "[*]       XP/2K OS Detector      [*]",13,10,\
             "[*]    by: illwill & phr0stic    [*]",13,10,\
             "[*]------------------------------[*]",13,10,13,10,0
usage2   db  "[*] Usage:   detect.exe <ip>     [*]",13,10,\
             "[*] Example: detect 192.168.0.2  [*]",13,10,0
 req1    db 00h,00h,00h,85h,0FFh,53h,4Dh,42h,72h,00h,00h,00h,00h,18h,53h,0C8h,00h,00h ; 18
         db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0FFh,0FEh,00h,00h,00h,00h,00h,62h ; 20
         db 00h,02h,50h,43h,20h,4Eh,45h,54h,57h,4Fh,52h,4Bh,20h,50h,52h,4Fh,47h,52h,41h,4Dh,20h ; 21
         db 31h,2Eh,30h,00h,02h,4Ch,41h,4Eh,4Dh,41h,4Eh,31h,2Eh,30h,00h,02h,57h ; 17
         db 69h,6Eh,64h,6Fh,77h,73h,20h,66h,6Fh,72h,20h,57h,6Fh,72h,6Bh,67h,72h,6Fh,75h,70h,73h,20h,33h ; 23 
         db 2Eh,31h,61h,00h,02h,4Ch,4Dh,31h,2Eh,32h,58h,30h,30h,32h,00h ; 15
         db 02h,4Ch,41h,4Eh,4Dh,41h,4Eh,32h,2Eh,31h,00h,02h,4Eh,54h,20h,4Ch,4Dh,20h,30h,2Eh,31h,32h,00 ; 23


 req2    db 00h,00h,00h,0A4h,0FFh,53h,4Dh,42h,73h,00h,00h,00h,00h,18h,07h,0C8h,00h,00h,00h,00h,00h
         db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0FFh,0FEh,00h,00h,10h,00h,0Ch,0FFh
         db 00h,0A4h,00h,04h,11h,0Ah,00h,00h,00h,00h,00h,00h,00h,20h,00h,00h,00h,00h,00h,0D4h
         db 00h,00h,80h,69h,00h,4Eh,54h,4Ch,4Dh,53h,53h,50h,00h,01h,00h,00h,00h,97h
         db 82h,08h,0E0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,57h
         db 00h,69h,00h,6Eh,00h,64h,00h,6Fh,00h,77h,00h,73h,00h,20h,00h,32h,00h
         db 30h,00h,30h,00h,30h,00h,20h,00h,32h,00h,31h,00h,39h,00h,35h
         db 00h,00h,00h,57h,00h,69h,00h,6Eh,00h,64h,00h,6Fh,00h,77h,00h,73h,00h,20h,00h,32h,00h
         db 30h,00h,30h,00h,30h,00h,20h,00h,35h,00h,2Eh,00h,30h,00h,00h,00h,00h,00


 req3    db 00h,00h,00h,0DAh,0FFh,53h,4Dh,42h,73h,00h,00h,00h,00h,18h,07h,0C8h,00h,00h,00h,00h ; 20
         db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0FFh,0FEh,00h,08h,20h,00h,0Ch,0FFh ; 18
         db 00h,0DAh,00h,04h,11h,0Ah,00h,00h,00h,00h,00h,00h,00h,57h,00h,00h,00h,00h,00h,0D4h ; 20
         db 00h,00h,80h,9Fh,00h,4Eh,54h,4Ch,4Dh,53h,53h,50h,00h,03h,00h,00h,00h,01h ; 18
         db 00h,01h,00h,46h,00h,00h,00h,00h,00h,00h,00h,47h,00h,00h,00h,00h,00h,00h,00h,40h,00h ; 21
         db 00h,00h,00h,00h,00h,00h,40h,00h,00h,00h,06h,00h,06h,00h,40h,00h,00h ; 17
         db 00h,10h,00h,10h,00h,47h,00h,00h,00h,15h,8Ah,88h,0E0h,48h,00h,4Fh,00h,44h,00h ; 19
         db 00h,81h,19h,6Ah,7Ah,0F2h,0E4h,49h,1Ch,28h,0AFh,30h,25h,74h,10h,67h,53h,57h,00h ; 19
         db 69h,00h,6Eh,00h,64h,00h,6Fh,00h,77h,00h,73h,00h,20h,00h,32h,00h,30h,00h,30h ; 19
         db 00h,30h,00h,20h,00h,32h,00h,31h,00h,39h,00h,35h,00h,00h,00h,57h,00h,69h,00h ; 19
         db 6Eh,00h,64h,00h,6Fh,00h,77h,00h,73h,00h,20h,00h,32h,00h,30h,00h,30h,00h,30h ;19
         db 00h,20h,00h,35h,00h,2Eh,00h,30h,00h,00h,00h,00h,00 ; 13
 STARTme   db "[+] Finding Host %s",0Dh,0Ah,0
 HostYay   db "[+] Connected to %s",0Dh,0Ah,0
 HostErr   db "[-] Cannot connect to %s",0Dh,0Ah,0
 LoginRcv  db "[+] %s",0Dh,0Ah,0
 win2k     db "[?] The box seems to be Windows 2000",0Dh,0Ah,0
 winxp     db "[?] The box seems to be Windows XP",0Dh,0Ah,0
 SendError db "[-] Socket Error When Sending Data.",0Dh,0Ah,0
 RcvError  db "[-] Socket Error When Receiving Data.",0Dh,0Ah,0
 bytesent  db "[+] Bytes Sent: %ld",0Dh,0Ah,0

.data?
	IPAddress  db 128 dup(?)
	buffer     db 128 dup(?)
	sock       dd ?
	sin        sockaddr_in <?>
	wsadata		 WSADATA <?>
	buff_sock  db 1600 dup (?)

.code
@@start:
	invoke GetCL, 1, addr IPAddress
	cmp eax, 1
	jnz @@usage
  invoke StdOut, addr usage
	invoke WSAStartup, 101h, offset wsadata
	test eax, eax
	jnz @@start
	invoke socket, AF_INET, SOCK_STREAM, 0
	mov sock, eax
	mov sin.sin_family, AF_INET
	invoke htons, 445
	mov sin.sin_port, ax
	invoke inet_addr, addr IPAddress
	mov sin.sin_addr, eax
	invoke wsprintf, addr buffer, addr STARTme, addr IPAddress
	invoke StdOut, addr buffer
	invoke connect, sock, addr sin, sizeof sin
	cmp eax, SOCKET_ERROR
	jz @@connect_err
	invoke wsprintf,addr buffer,addr HostYay,addr IPAddress
	invoke StdOut, addr buffer

	invoke send, sock, addr req1, 137, 0
	invoke RtlZeroMemory, addr buff_sock, sizeof buff_sock
	invoke recv, sock, addr buff_sock, sizeof buff_sock, 0
	test eax, eax
	jle @@recv_err
	invoke send, sock, addr req2, 168, 0
	invoke RtlZeroMemory, addr buff_sock, sizeof buff_sock
	invoke recv, sock, addr buff_sock, sizeof buff_sock, 0
	test eax, eax
	jle @@recv_err
	invoke send, sock, addr req3, 222, 0
	invoke wsprintf, addr buffer, addr bytesent, eax
	invoke StdOut, addr buffer
	invoke RtlZeroMemory, addr buff_sock, sizeof buff_sock
	invoke recv, sock, addr buff_sock, sizeof buff_sock, 0
	test eax, eax
	jle @@recv_err
	mov al, [byte ptr buff_sock+68]
	cmp al, '0'
	je @@2k
	invoke StdOut, addr winxp
	jmp @@err

@@2k:
	invoke StdOut, addr win2k
	jmp @@err

@@recv_err:
	invoke StdOut, addr RcvError
	jmp @@err

@@send_err:
	invoke StdOut, addr SendError
	jmp @@err

@@connect_err:
	invoke wsprintf,addr buffer,addr HostErr,addr IPAddress
	invoke	StdOut,addr buffer
	jmp @@err

@@usage:
	invoke StdOut, addr usage
  invoke StdOut, addr usage2
	

@@err:
	invoke closesocket, sock
	invoke WSACleanup
	invoke ExitProcess, 0
	ret
end @@start
