format binary as 'exe' 
use64 


EntryPoint:
	db 'MZ'		; pop r10 			; r10 <- ExitProcess Address from stack

			; mov rax, 0001866400004550h
	dw 0B848h	; mov rax
	dd 00004550h	; Signature PE\0\0
	dw 8664h	; Machine
	dw 0001h	; NumberOfSections

	nop
	nop
	nop
	nop		; TimeDateStamp

	nop
	nop
	nop
	nop		; PointerToSymbolTable

	nop
	nop
	nop
	nop		; NumberOfSymbols


	nop		
	db 05h		; SizeOfOptionalHeader		; multiple of 8 not too large not too small

			; add eax, 20B002F		; zeros the high dword of rax
	dw 002fh	; Characteristics		; must be bit 1=1 bit 13=0
	dw 020Bh	; PE32+	Magic

	nop		; MajorLinkerVersion
	nop		; MinorLinkerVersion

	nop
	nop
	nop 
	nop		; SizeOfCode

	nop
	nop
	nop
	nop		; SizeOfInitializedData

	nop
	nop
	nop             ; SizeOfUninitializedData
	db 5h		
			; add eax, 0			; zeros the high dword of rax
	dd 0		; AddressOfEntryPoint

	nop
	nop
	dw 0B848h	; BaseOfCode
                        ; mov rax, 0000000100000000h	; rax <- EntryPoint

	dq 0000000100000000h	; ImageBase		; must be multiple of 64k

			; add al, 0
                        ; add byte ptr ds:[rax],al
	dd 4		; SectionAlignment	; e_lfanew ;PE hdr start offset

			; add al, 0
                        ; add byte ptr ds:[rax],al
	dd 4		; FileAlignment

	nop
	nop		; MajorOperatingSystemVersiom

	nop
	nop		; MinorOperatingSystemVersion

	nop
	nop		; MajorImageVersion

	nop
	nop		; MinorImageVersion


	; below add eax, xx xx xx 00 h        this instruction zeros  high dword of rax 
	dw 5		; >3.1 or 4  MajorSubsystemVersion
	dw 0h		; MinorSubsystemVersion
	
;	dd 0h		; Win32VersionValue	;	reserved, must be zero
	db 0
	nop
	nop
	nop

;	dd 208h;077000000h	; SizeOfImage
 	nop
	nop
	db 0ebh 
	db 0; jmp next inst


;	dd 200h ;076ffffffh; 0200h	; SizeOfHeaders  !!!! make it 0 to run on w8???
 	nop
	nop
	db 4h; 		0ebh 
	db 0; add al,0		jmp next inst


	nop
	nop
	nop
	db 05h	; CheckSum		add eax,

	dw 0002h 	; Subsystem	2-GUI 3-CUI
	dw 0		; DllCharacteristics
	

	dq 05909090h;1000h	; SizeOfStackReserve	; PE32+		; dd in PE32
	dq 05909090h;1000h	; SizeOfStackCommit	; PE32+
	dq 05909090h;10000h	; SizeOfHeapReserve	; PE32+
	dq 05909090h;0		; SizeOfHeapCommit	; PE32+

	
;	dd 0		;! LoaderFlags		;	reserved, must be zero
 	nop
	nop
	nop	
	db 05h


	dd 0; 0ffffffffh ; was 0		; NumberofRvaAndSizes	



;Cont:

	dd 90909090h ;dd 0;0ffffffffh	; Export Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0		; Import Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0		; Resource Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Exception Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Security Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Base Relocation Table Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Debug Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Architecture Specific Data Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; RVA of GlobalPtr Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0		; TLS Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0		; Load Configuration Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;	dd 0		; Bound Import Directory Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Import Address Table Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0;0ffffffffh	; Delay Load Import Descriptors Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	dd 90909090h ;dd 0		; COM runtime Descriptors Address and Size
	dd 90909090h ;dd 0;0ffffffffh

	;dd 90909090h ;dd 0;0ffffffffh;0		; reserved "must be 0"
	;dd 0;0ffffffffh
	nop
	nop

;	times 122 db 90h
;	times 122 db 0h
;Cont:
	push r10   	; ExitProcess
	push 2ah
	pop rax
	ret