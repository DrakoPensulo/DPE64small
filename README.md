>
>; DPE64small.asm   Aug 05, 2017 (c) DrakoPensulo
>
>; A smallest PE32+ executable (x64) - every byte executed
>
>;
> 
>; Features:
>
>;  - Windows Vista/7/8/10/11 compatible
>
>;  - Size: 268 bytes (an executable file on x64 Windows cannot be smaller)
>
>;  - Every byte executed
>
>;  - No sections
>
>;  - No Data Directories (in particular no imports and no TLS callbacks)
>
>;  - Null Entrypoint
>
>;  - Exits with code 0x2a (this executable does nothing else than that)
>
>;
>
>;
>
>; Compile using FASM (https://flatassembler.net)  command line: fasm.exe DPE64small.asm
>
>;
>
>;
>
>;
>
>; GitHub: https://github.com/DrakoPensulo/DPE64small
>
>; Blog post: https://drakopensulo.wordpress.com/2017/08/06/smallest-pe-executable-x64-with-every-byte-executed/
>
>;
>
>; Update Aug 17, 2018
>
>; Update Aug 18, 2018
>
>; Update Aug 03, 2022 Windows 11 compatibility added.


           00000000   4D 5A 48 B8 50 45 00 00 64 86 01 00 90 90 90 90  MZH¸PE..d..
           00000010   90 90 90 90 90 90 90 90 90 05 2F 00 0B 02 90 90  ./...
           00000020   90 90 90 90 90 90 90 90 90 90 90 05 00 00 00 00  .....
           00000030   90 90 48 B8 00 00 00 00 01 00 00 00 04 00 00 00  H¸............
           00000040   04 00 00 00 90 90 90 90 90 90 90 90 05 00 00 00  ........
           00000050   00 90 90 90 90 90 EB 00 90 90 04 00 90 90 90 05  .ë....
           00000060   02 00 00 00 90 90 90 05 00 00 00 00 90 90 90 05  ..........
           00000070   00 00 00 00 90 90 90 05 00 00 00 00 90 90 90 05  ..........
           00000080   00 00 00 00 90 90 90 05 00 00 00 00 90 90 90 90  .........
           00000090   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           000000A0   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           000000B0   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           000000C0   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           000000D0   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           000000E0   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           000000F0   90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
           00000100   90 90 90 90 90 90 41 52 6A 2A 58 C3              ARj*XÃ
