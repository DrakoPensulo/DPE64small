format binary as 'exe' 
use64 


EntryPoint:
	db 'MZ'		; pop r10 			; r10 <- Address from stack, return to BaseThreadInitThunk which calls RtlExitUserThread

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
	db 05h		; SizeOfOptionalHeader		; must be multiple of 8 not too large not too small

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
	dd 4		; SectionAlignment and e_lfanew	; PE header offset in file

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


			; add eax, 0			; this instruction zeros  high dword of rax 
	dw 5		; MajorSubsystemVersion		; >3.1 or 4  
	dw 0h		; MinorSubsystemVersion

	db 0
	nop
	nop
	nop		; Win32VersionValue		

 	nop
	nop
	db 0ebh		; jmp 0 
	db 0		; SizeOfImage 			; MSB has to be small


 	nop
	nop
	db 4h		; add al,0
	db 0		; SizeOfHeaders			; SizeOfHeaders has to be < ImageOfImage

	nop
	nop
	nop
	db 05h		; CheckSum
			; add eax, 2

	dw 0002h 	; Subsystem	2-GUI 3-CUI
	dw 0		; DllCharacteristics
	
	nop
	nop
	nop
	db 05h	        ; add eax, 0	
	dd 0		; SizeOfStackReserve dq 05909090h	; upper dword has to be 0, MSB of lower dword has to be small

	nop
	nop
	nop
	db 05h	        ; add eax, 0	
	dd 0		; SizeOfStackCommit dq 05909090h	; upper dword has to be 0, MSB of lower dword has to be small

	nop
	nop
	nop
	db 05h	        ; add eax, 0	
	dd 0		; SizeOfHeapReserve dq 05909090h	; upper dword has to be 0, MSB of lower dword has to be small

	nop
	nop
	nop
	db 05h	        ; add eax, 0	
	dd 0		; SizeOfHeapCommit dq 05909090h	; upper dword has to be 0, MSB of lower dword has to be small

	
 	nop
	nop
	nop	
	db 05h		; LoaderFlags

			; add eax, 0
	dd 0		; NumberofRvaAndSizes	

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Export Directory Address and Size

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Import Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Resource Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Exception Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Security Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Base Relocation Table Address and Size

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Debug Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Architecture Specific Data Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; RVA of GlobalPtr Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; TLS Directory Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Load Configuration Directory Address and Size

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Bound Import Directory Address and Size

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Import Address Table Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; Delay Load Import Descriptors Address and Size


	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop	; COM runtime Descriptors Address and Size


	nop
	nop
	push r10   	
	push 2ah
	pop rax
	ret	; Reserved Descriptor