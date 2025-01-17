format ELF

extrn uname
extrn printf

section '.text' executable

public main
main:
	push ebp
	mov ebp, esp

	sub esp, 400

	lea ebx, [esp-4]
	push ebx
	call uname ;; uname

	lea eax, [esp]
	push eax
	push sysnameStr
	call printf ;; printf

	pop eax ;; align
	pop eax ;; align

	lea eax, [esp+65]
	push eax
	push hostnameStr
	call printf ;; printf

	pop eax ;; align

	lea eax, [esp+134]
	push eax
	push kernelStr
	call printf ;; printf

	lea eax, [esp+213-6]
	push eax
	push versionStr
	call printf



	mov eax, 0

	leave
	ret

section '.data' writable
	sysnameStr db "sysname: %s", 10, 0
	hostnameStr db "hostname: %s", 10, 0
	kernelStr db "kernel: %s", 10, 0
	versionStr db "version: %s", 10, 0
