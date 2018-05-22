//****************************************************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.29.09.2016, Forms textual presentation fixed by MistHill
//****************************************************************************
unit FFluxCdn;

interface

uses
  SysUtils, Classes,dialogs;

type
  TFluxCdn = class(TFileStream)
    function sub_004B696C():string;//(?:TFluxCdn; ?:PShortString);
    procedure sub_004B6A80(buffer : String);//(?:TFluxCdn; ?:ShortString);
  end;

implementation

//004B696C
function TFluxCdn.sub_004B696C():string;//(?:TFluxCdn; ?:PShortString);
var
  count : byte;
  Bufferx:string;
  xx:PAnsiChar;
  //p:PAnsiString;
begin
  //p      := @Buffer;
  Read(count,1);
 SetLength(result,count);
 Read(result[1],count);
 {if(count > 0 ) then
 begin

 end;  }
{*
 004B696C    push        ebp
 004B696D    mov         ebp,esp
 004B696F    add         esp,0FFFFFDF0
 004B6975    push        ebx
 004B6976    push        esi
 004B6977    push        edi
 004B6978    xor         ecx,ecx
 004B697A    mov         dword ptr [ebp-208],ecx
 004B6980    mov         dword ptr [ebp-20C],ecx
 004B6986    mov         esi,edx
 004B6988    mov         ebx,eax
 004B698A    xor         eax,eax
 004B698C    push        ebp
 004B698D    push        4B6A6F
 004B6992    push        dword ptr fs:[eax]
 004B6995    mov         dword ptr fs:[eax],esp
 004B6998    lea         edx,[ebp-2]
 004B699B    mov         ecx,1
 004B69A0    mov         eax,ebx
 004B69A2    mov         edi,dword ptr [eax]
 004B69A4    call        dword ptr [edi+4]
 004B69A7    xor         ecx,ecx
 004B69A9    mov         cl,byte ptr [ebp-2]
 004B69AC    lea         edx,[ebp-201]
 004B69B2    mov         eax,ebx
 004B69B4    mov         ebx,dword ptr [eax]
 004B69B6    call        dword ptr [ebx+4]
 004B69B9    mov         byte ptr [ebp-102],0
 004B69C0    mov         bl,byte ptr [ebp-2]
 004B69C3    test        bl,bl
>004B69C5    jbe         004B6A44
 004B69C7    mov         byte ptr [ebp-1],1
 004B69CB    lea         eax,[ebp-208]
 004B69D1    lea         edx,[ebp-102]
 004B69D7    call        @LStrFromString
 004B69DC    lea         eax,[ebp-208]
 004B69E2    push        eax
 004B69E3    lea         eax,[ebp-210]
 004B69E9    xor         edx,edx
 004B69EB    mov         dl,byte ptr [ebp-1]
 004B69EE    dec         edx
 004B69EF    cmp         edx,0FE
>004B69F5    jbe         004B69FC
 004B69F7    call        @BoundErr
 004B69FC    inc         edx
 004B69FD    mov         dl,byte ptr [ebp+edx-202]
 004B6A04    mov         byte ptr [eax+1],dl
 004B6A07    mov         byte ptr [eax],1
 004B6A0A    lea         edx,[ebp-210]
 004B6A10    lea         eax,[ebp-20C]
 004B6A16    call        @LStrFromString
 004B6A1B    mov         edx,dword ptr [ebp-20C]
 004B6A21    pop         eax
 004B6A22    call        @LStrCat
 004B6A27    mov         edx,dword ptr [ebp-208]
 004B6A2D    lea         eax,[ebp-102]
 004B6A33    mov         ecx,0FF
 004B6A38    call        @LStrToString
 004B6A3D    inc         byte ptr [ebp-1]
 004B6A40    dec         bl
>004B6A42    jne         004B69CB
 004B6A44    mov         eax,esi
 004B6A46    lea         edx,[ebp-102]
 004B6A4C    call        @PStrCpy
 004B6A51    xor         eax,eax
 004B6A53    pop         edx
 004B6A54    pop         ecx
 004B6A55    pop         ecx
 004B6A56    mov         dword ptr fs:[eax],edx
 004B6A59    push        4B6A76
 004B6A5E    lea         eax,[ebp-20C]
 004B6A64    mov         edx,2
 004B6A69    call        @LStrArrayClr
 004B6A6E    ret
>004B6A6F    jmp         @HandleFinally
>004B6A74    jmp         004B6A5E
 004B6A76    pop         edi
 004B6A77    pop         esi
 004B6A78    pop         ebx
 004B6A79    mov         esp,ebp
 004B6A7B    pop         ebp
 004B6A7C    ret
*}
end;

//004B6A80
procedure TFluxCdn.sub_004B6A80(buffer : String);//(?:TFluxCdn; ?:ShortString);
var
  count:Byte;
begin
  count:=Length(buffer);
  WriteBuffer(count,1);
  WriteBuffer(buffer[1],count);
{*
 004B6A80    push        ebx
 004B6A81    push        esi
 004B6A82    push        edi
 004B6A83    add         esp,0FFFFFEFC
 004B6A89    mov         esi,edx
 004B6A8B    lea         edi,[esp+1]
 004B6A8F    push        ecx
 004B6A90    xor         ecx,ecx
 004B6A92    mov         cl,byte ptr [esi]
 004B6A94    inc         ecx
 004B6A95    rep movs    byte ptr [edi],byte ptr [esi]
 004B6A97    pop         ecx
 004B6A98    mov         ebx,eax
 004B6A9A    mov         al,byte ptr [esp+1]
 004B6A9E    mov         byte ptr [esp],al
 004B6AA1    test        cl,cl
>004B6AA3    je          004B6AB3
 004B6AA5    mov         edx,esp
 004B6AA7    mov         ecx,1
 004B6AAC    mov         eax,ebx
 004B6AAE    call        TStream.WriteBuffer
 004B6AB3    xor         ecx,ecx
 004B6AB5    mov         cl,byte ptr [esp+1]
 004B6AB9    lea         edx,[esp+2]
 004B6ABD    mov         eax,ebx
 004B6ABF    call        TStream.WriteBuffer
 004B6AC4    add         esp,104
 004B6ACA    pop         edi
 004B6ACB    pop         esi
 004B6ACC    pop         ebx
 004B6ACD    ret
*}
end;

end.