;In last example we have opened calc.exe with the help of windows api
;and we are entering in the next level
;so spawnining a messagebox with the help of windows api
;the messagebox function is present in user32.dll 
;so first we have to load user32.dll
;for that we use LoadLibrary function present in kernel32.dll
global _start

_start:
	xor ebx,ebx
	mov eax, fs:[ebx+0x30]
	mov eax, [eax+0xc]
	mov eax, [eax+0x14]
	mov eax, [eax]
	mov eax, [eax]
	mov eax, [eax]
	mov ebx, [eax+0x10]
	
	mov edx, [ebx+0x3c]	
	add edx, ebx
	mov edx, [edx+0x78]	
	add edx, ebx
	mov esi, [edx+0x20]
	add esi, ebx
	xor ecx, ecx
	

getproc:
	inc ecx
	lodsd
	add eax, ebx
	cmp dword [eax], 0x50746547 
	jnz getproc
	cmp dword [eax+0x4],  0x41636F72
	jnz getproc
	cmp dword [eax+0x8], 0x65726464
	jnz getproc
	
getprocadd:
	mov esi, [edx+0x24]
	add esi, ebx
	mov cx, [esi+ecx*2]
	dec ecx
	mov esi, [edx+0x1c]
	add esi, ebx
	mov edx, [esi+ecx*4]
	add edx, ebx
	mov ebp, edx
	
loadlibrary:
	xor ecx, ecx
	push ecx
	push 0x41797261
	push 0x7262694C
	push 0x64616F4C
	push esp
	push ebx
	call edx
	
getuser32:
	push 0x61616C6C
	sub dword [esp+2], 0x6161
	push  0x642E3233
	push 0x72657355
	push esp
	call eax
msg:
	sub esp, 64
	push 0x6141786F
	sub word[esp+0x3], 0x61
	push 0x42656761
	push 0x7373654D
	push esp
	push eax
	call ebp
		
msgbox:	xor ecx,ecx
	
	push 0x61616161	
	mov edi, esp
	push 0x41414141
	mov esi, esp
	push ecx
	push edi
	push esi
	push ecx
	call eax
	

ExitProcess:	
	push 0x61737365
	sub word[esp+0x3], 0x61
	push 0x636F7250
	push 0x74697845		
	push esp
	push ebx
	call ebp
exit:	
	xor ecx, ecx	
	push ecx
	call eax
	
	
	
	

	

	

