//****************************************************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.29.09.2016, Forms textual presentation fixed by MistHill
//****************************************************************************
unit _FichierCdn;

interface

uses
  SysUtils, Classes, Dialogs, FFluxCdn, Grids;

type
  TFielddata = class
    value: string;
  private
    function GetAsInteger: Longint;
    procedure SetAsInteger(const PValue: Longint);
    function GetAsFloat: Double;
    procedure SetAsFloat(const PValue: Double);
    function GetPoint: string;
    procedure SetPoint(const Value: string);
  public
    property AsInteger: Longint read GetAsInteger write SetAsInteger;
    property AsFloat: Double read GetAsFloat write SetAsFloat;
    property Point: String read GetPoint write SetPoint;
  end;

  TFichierCdn = class(TObject)
  private
    function GetCells(ALigne, ACol, ARow: Integer): TFielddata;
    procedure SetCells(ALigne, ACol, ARow: Integer; const Value: TFielddata);
    function GetCell(ALigne, ACol, ARow: Integer): string;
    procedure SetCell(ALigne, ACol, ARow: Integer; const Value: string);
    function nbr_eleve_read: Integer;
    procedure nbr_eleve_write(const Value: Integer);
  public
    NLigne, NCol, NRow, Ninfo: integer;
    data: array of array of array of string; //array[0..512 * 512 * 512] of string;
    filename: TFileName; //fC
    f948: Boolean; //f948
    f949: byte; //f949
      //==============
    Enseignant: string;
    classe: string;
    Etablissement: string;
    matiere: string;
    Ascolaire: string;
    remarque: string;
    organisation: string;
    nbre_org: Integer;
    nom_org: TStringList;
    SerieNote: array of TStringList;
    //nbr_eleve: Integer;
    nom_eleve: TStringList;
    Appreciation: TStringList;
    date_nais: TStringList;
    sexe: TStringList;
    Redoublant: TStringList;
    nbr_note: array[0..512] of Integer;
    points: TStringList;
    etat1: string;
    etat2: string;
    etat3: string;
    etat4: string;
    etat5: string;
    inconnu1: string;
    inconnu2: string;
    inconnu3: string;
  //=============
    procedure SelectAllRange(ARow: Longint);
    procedure save;
    procedure sub_004C8280; //(?:?; ?:?; ?:?; ?:?; ?:?);
    constructor Create(filename: TFilename); //(?:?; ?:?; ?:?);
    property nbr_eleve :  Integer read nbr_eleve_read write nbr_eleve_write;
    property Cellss[ALigne, ACol, ARow: Integer]: TFielddata read GetCells write SetCells;
    property Cells[ALigne, ACol, ARow: Integer]: string read GetCell write SetCell;
    function min(v1, v2: Integer): real;
    function max(v1, v2: Integer): real;
    function moy(v1, v2: Integer): real;
    function Ecart(v1, v2: Integer): real;
    function NoteMoy(v1, v2: Integer): real;
    function NoteMoyClass(v1, v2: Integer): real;
    //procedure sub_004BE5E0(?:?; ?:TFluxCdn);
   { procedure sub_004BE8FC(?:TFichierCdn; ?:PShortString);
    procedure sub_004BE914(?:TFichierCdn; ?:PShortString);
    procedure sub_004BE92C(?:TFichierCdn; ?:PShortString);
    procedure sub_004BE944(?:TFichierCdn; ?:PShortString);
    procedure sub_004BE95C(?:dword; ?:PShortString);
    //procedure sub_004BE974(?:dword; ?:?);
    procedure sub_004BE988(?:dword; ?:PShortString);
    //function sub_004BE9E0(?:TFichierCdn):?;
    //procedure sub_004BE9EC(?:TFichierCdn; ?:?; ?:PShortString);
    //function sub_004BEA4C(?:TFichierCdn):?;
    //function sub_004BEA58(?:TFichierCdn):?;
    procedure sub_004BEA64(?:TFichierCdn; ?:dword; ?:ShortString);
    //function sub_004BEAC4(?:TFichierCdn):?;
    //function sub_004BEAD0(?:dword; ?:dword):?;
    //function sub_004BEB40(?:dword; ?:?; ?:?):?;
    //procedure sub_004BEC04(?:?; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004BED04(?:dword; ?:dword; ?:Single; ?:?);
    //procedure sub_004BED2C(?:dword; ?:dword; ?:dword; ?:?);
    //procedure sub_004BED7C(?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004BEDCC(?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004BEE1C(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004BEE6C(?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004BEEBC(?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004BEF0C(?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004BEF5C(?:dword; ?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004BEF84(?:?; ?:?);
    procedure sub_004BEFD0(?:TFichierCdn; ?:PShortString);
    procedure sub_004BF004(?:TFichierCdn; ?:PShortString);
    procedure sub_004BF038(?:TFichierCdn; ?:PShortString);
    procedure sub_004BF06C(?:TFichierCdn; ?:PShortString);
    procedure sub_004BF0A0(?:TFichierCdn; ?:PShortString);
    procedure sub_004BF0D4(?:TFichierCdn);
    //procedure sub_004BF258(?:dword; ?:ShortString; ?:?);
    procedure sub_004BF544(?:TFichierCdn; ?:TStringList);
    procedure sub_004BF64C(?:TFichierCdn; ?:TStringList);
    //procedure sub_004BF7F0(?:TFichierCdn; ?:Integer; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004BFC58(?:dword; ?:?; ?:?);
    //procedure sub_004BFD68(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004C0070(?:?; ?:?);
    //procedure sub_004C0134(?:?; ?:?);
    //procedure sub_004C01F8(?:TFichierCdn; ?:AnsiString; ?:?; ?:?; ?:?);
    //procedure sub_004C0C88(?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C0E24(?:?);
    //procedure sub_004C0E5C(?:dword; ?:?; ?:?);
    //procedure sub_004C0EC8(?:dword; ?:?; ?:?);
    //procedure sub_004C0F34(?:dword; ?:?; ?:?);
    //function sub_004C0FA0(?:dword; ?:dword; ?:?):?;
    //procedure sub_004C1074(?:TFichierCdn; ?:dword; ?:?; ?:?);
    procedure sub_004C1158(?:dword; ?:dword);
    //procedure sub_004C14C8(?:dword; ?:ShortString; ?:?; ?:?);
    //procedure sub_004C1954(?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004C213C(?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C2410(?:dword; ?:ShortString; ?:Integer; ?:?);
    //procedure sub_004C2AF4(?:?; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C2B38(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004C2C00(?:TFichierCdn; ?:dword; ?:dword; ?:?; ?:?);
    //procedure sub_004C2D10(?:TFichierCdn; ?:?; ?:dword; ?:?; ?:?);
    //procedure sub_004C2E60(?:dword; ?:ShortString; ?:?; ?:?);
    //function sub_004C3134(?:dword; ?:?):?;
    //procedure sub_004C32B4(?:dword; ?:?; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C3678(?:dword; ?:?; ?:?);
    //procedure sub_004C3798(?:dword; ?:dword; ?:?; ?:?);
    procedure sub_004C3908(?:TFichierCdn; ?:PShortString);
    procedure sub_004C3920(?:TFichierCdn; ?:PShortString);
    //function sub_004C3954(?:dword):?;
    //procedure sub_004C3958(?:dword; ?:?; ?:Single; ?:?);
    //procedure sub_004C3B54(?:dword; ?:?; ?:Single; ?:?);
    //procedure sub_004C3D1C(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004C3EA4(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004C40D4(?:dword; ?:?; ?:Single; ?:?);
    //procedure sub_004C42D4(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004C451C(?:dword; ?:?; ?:?; ?:?);
    //function sub_004C4778(?:dword):?;
    procedure sub_004C4784(?:dword);
    //function sub_004C4790(?:dword):?;
    //procedure sub_004C47E8(?:dword; ?:?; ?:?);
    //procedure sub_004C48BC(?:dword; ?:dword; ?:?);
    //procedure sub_004C4990(?:dword; ?:?; ?:?);
    //procedure sub_004C4B20(?:dword; ?:?; ?:?);
    procedure sub_004C4CBC(?:TFichierCdn);
    procedure sub_004C4CC8(?:TFichierCdn; ?:PShortString);
    //function sub_004C4D44(?:?):?;
    //function sub_004C5078(?:dword; ?:?; ?:?; ?:?; ?:?; ?:?):?;
    //procedure sub_004C5E04(?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C5F08(?:?; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C5FF8(?:?; ?:?; ?:?);
    //function sub_004C6030(?:?; ?:?; ?:?; ?:?):Boolean;
    //procedure sub_004C6080(?:?; ?:?; ?:?);
    //procedure sub_004C6144(?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C61E4(?:?; ?:?; ?:?; ?:?);
    //function sub_004C62E8(?:?; ?:?; ?:?):?;
    procedure sub_004C63C8(?:TFichierCdn);
    //procedure sub_004C64CC(?:dword; ?:ShortString; ?:?);
    //function sub_004C6654(?:?):Boolean;
    function sub_004C6680(?:dword):Boolean;
    //function sub_004C66A8(?:?; ?:?; ?:?):?;
    procedure 'bêta 2';
    procedure 'bêta 4';
    procedure 'bêta 6';
    //procedure sub_004C6E9C(?:?; ?:?; ?:?);
	}
    
    {//procedure sub_004C8880(?:?);
    //function sub_004C8AD8(?:?):?;
    //function sub_004C8AE0(?:?):?;
    //function sub_004C8AE8(?:TFichierCdn):?;
    //procedure sub_004C8AF4(?:dword; ?:?; ?:PShortString);
    procedure sub_004C8B54(?:TFichierCdn; ?:PShortString);
    //function sub_004C8BAC(?:TFichierCdn):?;
    procedure sub_004C8BB8(?:TFichierCdn; ?:dword; ?:PShortString);
    //procedure sub_004C8C2C(?:dword; ?:?; ?:PShortString);
    //procedure sub_004C8CB8(?:?; ?:?; ?:PShortString);
    //function sub_004C8D68(?:?):?;
    //procedure sub_004C8D84(?:?; ?:?; ?:PShortString);
    //procedure sub_004C8DF8(?:TFichierCdn; ?:?; ?:?);
    //function sub_004C8E50(?:TFichierCdn; ?:dword):?;
    //function sub_004C8EC8(?:dword; ?:?; ?:?; ?:?):?;
    //procedure sub_004C8F6C(?:dword; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C8FB0(?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C9280(?:dword; ?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C92C4(?:?; ?:?; ?:?; ?:?);
    //procedure sub_004C9594(?:dword; ?:?; ?:?; ?:?);
    //procedure sub_004C9708(?:dword; ?:?; ?:?; ?:?);  }
  end;

var
  FichierCdn1: TFichierCdn;

implementation

uses Math;

//004BE5E0
{*procedure sub_004BE5E0(?:?; ?:TFluxCdn);
begin
 004BE5E0    push        ebp
 004BE5E1    mov         ebp,esp
 004BE5E3    add         esp,0FFFFFEF8
 004BE5E9    push        ebx
 004BE5EA    push        esi
 004BE5EB    push        edi
 004BE5EC    xor         ecx,ecx
 004BE5EE    mov         dword ptr [ebp-108],ecx
 004BE5F4    mov         ebx,edx
 004BE5F6    mov         esi,eax
 004BE5F8    xor         eax,eax
 004BE5FA    push        ebp
 004BE5FB    push        4BE753
 004BE600    push        dword ptr fs:[eax]
 004BE603    mov         dword ptr fs:[eax],esp
 004BE606    mov         cl,1
 004BE608    mov         edx,4BE764
 004BE60D    mov         eax,ebx
 004BE60F    call        004B6A80
 004BE614    mov         cl,1
 004BE616    mov         edx,4BE774
 004BE61B    mov         eax,ebx
 004BE61D    call        004B6A80
 004BE622    lea         edx,[ebp-104]
 004BE628    mov         eax,esi
 004BE62A    call        004BE8FC
 004BE62F    lea         edx,[ebp-104]
 004BE635    mov         cl,1
 004BE637    mov         eax,ebx
 004BE639    call        004B6A80
 004BE63E    mov         cl,1
 004BE640    lea         edx,[esi+510]
 004BE646    mov         eax,ebx
 004BE648    call        004B6A80
 004BE64D    lea         edx,[ebp-104]
 004BE653    mov         eax,esi
 004BE655    call        004BE92C
 004BE65A    lea         edx,[ebp-104]
 004BE660    mov         cl,1
 004BE662    mov         eax,ebx
 004BE664    call        004B6A80
 004BE669    lea         edx,[ebp-104]
 004BE66F    mov         eax,esi
 004BE671    call        004BE944
 004BE676    lea         edx,[ebp-104]
 004BE67C    mov         cl,1
 004BE67E    mov         eax,ebx
 004BE680    call        004B6A80
 004BE685    mov         cl,1
 004BE687    mov         edx,4BE778
 004BE68C    mov         eax,ebx
 004BE68E    call        004B6A80
 004BE693    mov         eax,esi
 004BE695    call        004BEA58
 004BE69A    and         eax,0FF
 004BE69F    lea         edx,[ebp-108]
 004BE6A5    call        IntToStr
 004BE6AA    mov         edx,dword ptr [ebp-108]
 004BE6B0    lea         eax,[ebp-104]
 004BE6B6    mov         ecx,0FF
 004BE6BB    call        @LStrToString
 004BE6C0    lea         edx,[ebp-104]
 004BE6C6    mov         cl,1
 004BE6C8    mov         eax,ebx
 004BE6CA    call        004B6A80
 004BE6CF    mov         eax,esi
 004BE6D1    call        004BEA58
 004BE6D6    mov         edi,eax
 004BE6D8    and         edi,0FF
 004BE6DE    test        edi,edi
>004BE6E0    jle         004BE71B
 004BE6E2    mov         dword ptr [ebp-4],1
 004BE6E9    lea         ecx,[ebp-104]
 004BE6EF    mov         edx,dword ptr [ebp-4]
 004BE6F2    cmp         edx,0FF
>004BE6F8    jbe         004BE6FF
 004BE6FA    call        @BoundErr
 004BE6FF    mov         eax,esi
 004BE701    call        004BEA64
 004BE706    lea         edx,[ebp-104]
 004BE70C    mov         cl,1
 004BE70E    mov         eax,ebx
 004BE710    call        004B6A80
 004BE715    inc         dword ptr [ebp-4]
 004BE718    dec         edi
>004BE719    jne         004BE6E9
 004BE71B    mov         esi,13
 004BE720    mov         cl,1
 004BE722    mov         edx,4BE7C4;'0'
 004BE727    mov         eax,ebx
 004BE729    call        004B6A80
 004BE72E    dec         esi
>004BE72F    jne         004BE720
 004BE731    mov         dl,1
 004BE733    mov         eax,ebx
 004BE735    mov         ecx,dword ptr [eax]
 004BE737    call        dword ptr [ecx-4]
 004BE73A    xor         eax,eax
 004BE73C    pop         edx
 004BE73D    pop         ecx
 004BE73E    pop         ecx
 004BE73F    mov         dword ptr fs:[eax],edx
 004BE742    push        4BE75A
 004BE747    lea         eax,[ebp-108]
 004BE74D    call        @LStrClr
 004BE752    ret
>004BE753    jmp         @HandleFinally
>004BE758    jmp         004BE747
 004BE75A    pop         edi
 004BE75B    pop         esi
 004BE75C    pop         ebx
 004BE75D    mov         esp,ebp
 004BE75F    pop         ebp
 004BE760    ret
end;*}

//004BE7C8
constructor TFichierCdn.Create(filename: TFilename);//(?:?; ?:?; ?:?);
begin
  inherited create;
  NLigne := 0;
  NCol := 0;
  NRow := 0;
  Ninfo:=16;
  Self.filename := filename;
  //data:=TStringSparseList.Create(SPALarge);
  sub_004C8280;
end;

//004BE8FC
{procedure sub_004BE8FC(?:TFichierCdn; ?:PShortString);
begin
{*
 004BE8FC    push        ebx
 004BE8FD    push        esi
 004BE8FE    mov         esi,edx
 004BE900    mov         ebx,eax
 004BE902    mov         eax,esi
 004BE904    lea         edx,[ebx+410]
 004BE90A    call        @PStrCpy
 004BE90F    pop         esi
 004BE910    pop         ebx
 004BE911    ret
*}
//end;

//004BE914
//procedure sub_004BE914(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BE914    push        ebx
 004BE915    push        esi
 004BE916    mov         esi,edx
 004BE918    mov         ebx,eax
 004BE91A    mov         eax,esi
 004BE91C    lea         edx,[ebx+510]
 004BE922    call        @PStrCpy
 004BE927    pop         esi
 004BE928    pop         ebx
 004BE929    ret
*}
////end;

//004BE92C
//procedure sub_004BE92C(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BE92C    push        ebx
 004BE92D    push        esi
 004BE92E    mov         esi,edx
 004BE930    mov         ebx,eax
 004BE932    mov         eax,esi
 004BE934    lea         edx,[ebx+610]
 004BE93A    call        @PStrCpy
 004BE93F    pop         esi
 004BE940    pop         ebx
 004BE941    ret
*}
//end;

//004BE944
//procedure sub_004BE944(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BE944    push        ebx
 004BE945    push        esi
 004BE946    mov         esi,edx
 004BE948    mov         ebx,eax
 004BE94A    mov         eax,esi
 004BE94C    lea         edx,[ebx+710]
 004BE952    call        @PStrCpy
 004BE957    pop         esi
 004BE958    pop         ebx
 004BE959    ret
*}
//end;

//004BE95C
////procedure sub_004BE95C(?:dword; ?:PShortString);
//begin
{*
 004BE95C    push        ebx
 004BE95D    push        esi
 004BE95E    mov         esi,edx
 004BE960    mov         ebx,eax
 004BE962    mov         eax,esi
 004BE964    lea         edx,[ebx+810]
 004BE96A    call        @PStrCpy
 004BE96F    pop         esi
 004BE970    pop         ebx
 004BE971    ret
*}
//end;

//004BE974
{*////procedure sub_004BE974(?:dword; ?:?);
begin
 004BE974    push        ebx
 004BE975    push        esi
 004BE976    mov         esi,edx
 004BE978    mov         ebx,eax
 004BE97A    mov         eax,esi
 004BE97C    mov         edx,dword ptr [ebx+0C]
 004BE97F    call        @LStrAsg
 004BE984    pop         esi
 004BE985    pop         ebx
 004BE986    ret
//end;*}

//004BE988
////procedure sub_004BE988(?:dword; ?:PShortString);
//begin
{*
 004BE988    push        ebp
 004BE989    mov         ebp,esp
 004BE98B    push        0
 004BE98D    push        ebx
 004BE98E    push        esi
 004BE98F    mov         esi,edx
 004BE991    mov         ebx,eax
 004BE993    xor         eax,eax
 004BE995    push        ebp
 004BE996    push        4BE9D4
 004BE99B    push        dword ptr fs:[eax]
 004BE99E    mov         dword ptr fs:[eax],esp
 004BE9A1    lea         edx,[ebp-4]
 004BE9A4    mov         eax,dword ptr [ebx+918]
 004BE9AA    call        004B6CC4
 004BE9AF    mov         edx,dword ptr [ebp-4]
 004BE9B2    mov         eax,esi
 004BE9B4    mov         ecx,0FF
 004BE9B9    call        @LStrToString
 004BE9BE    xor         eax,eax
 004BE9C0    pop         edx
 004BE9C1    pop         ecx
 004BE9C2    pop         ecx
 004BE9C3    mov         dword ptr fs:[eax],edx
 004BE9C6    push        4BE9DB
 004BE9CB    lea         eax,[ebp-4]
 004BE9CE    call        @LStrClr
 004BE9D3    ret
>004BE9D4    jmp         @HandleFinally
>004BE9D9    jmp         004BE9CB
 004BE9DB    pop         esi
 004BE9DC    pop         ebx
 004BE9DD    pop         ecx
 004BE9DE    pop         ebp
 004BE9DF    ret
*}
//end;

//004BE9E0
{*function sub_004BE9E0(?:TFichierCdn):?;
begin
 004BE9E0    mov         eax,dword ptr [eax+918]
 004BE9E6    call        004B6CD8
 004BE9EB    ret
//end;*}

//004BE9EC
{*////procedure sub_004BE9EC(?:TFichierCdn; ?:?; ?:PShortString);
begin
 004BE9EC    push        ebp
 004BE9ED    mov         ebp,esp
 004BE9EF    push        0
 004BE9F1    push        ebx
 004BE9F2    push        esi
 004BE9F3    push        edi
 004BE9F4    mov         edi,ecx
 004BE9F6    mov         ebx,edx
 004BE9F8    mov         esi,eax
 004BE9FA    xor         eax,eax
 004BE9FC    push        ebp
 004BE9FD    push        4BEA3D
 004BEA02    push        dword ptr fs:[eax]
 004BEA05    mov         dword ptr fs:[eax],esp
 004BEA08    lea         ecx,[ebp-4]
 004BEA0B    mov         edx,ebx
 004BEA0D    mov         eax,dword ptr [esi+918]
 004BEA13    call        004B6CF4
 004BEA18    mov         edx,dword ptr [ebp-4]
 004BEA1B    mov         eax,edi
 004BEA1D    mov         ecx,0FF
 004BEA22    call        @LStrToString
 004BEA27    xor         eax,eax
 004BEA29    pop         edx
 004BEA2A    pop         ecx
 004BEA2B    pop         ecx
 004BEA2C    mov         dword ptr fs:[eax],edx
 004BEA2F    push        4BEA44
 004BEA34    lea         eax,[ebp-4]
 004BEA37    call        @LStrClr
 004BEA3C    ret
>004BEA3D    jmp         @HandleFinally
>004BEA42    jmp         004BEA34
 004BEA44    pop         edi
 004BEA45    pop         esi
 004BEA46    pop         ebx
 004BEA47    pop         ecx
 004BEA48    pop         ebp
 004BEA49    ret
//end;*}

//004BEA4C
{*function sub_004BEA4C(?:TFichierCdn):?;
begin
 004BEA4C    mov         eax,dword ptr [eax+918]
 004BEA52    call        004B6D34
 004BEA57    ret
//end;*}

//004BEA58
{*function sub_004BEA58(?:TFichierCdn):?;
begin
 004BEA58    mov         eax,dword ptr [eax+91C]
 004BEA5E    call        004B6FB0
 004BEA63    ret
//end;*}

//004BEA64
////procedure sub_004BEA64(?:TFichierCdn; ?:dword; ?:ShortString);
//begin
{*
 004BEA64    push        ebp
 004BEA65    mov         ebp,esp
 004BEA67    push        0
 004BEA69    push        ebx
 004BEA6A    push        esi
 004BEA6B    push        edi
 004BEA6C    mov         edi,ecx
 004BEA6E    mov         ebx,edx
 004BEA70    mov         esi,eax
 004BEA72    xor         eax,eax
 004BEA74    push        ebp
 004BEA75    push        4BEAB5
 004BEA7A    push        dword ptr fs:[eax]
 004BEA7D    mov         dword ptr fs:[eax],esp
 004BEA80    lea         ecx,[ebp-4]
 004BEA83    mov         edx,ebx
 004BEA85    mov         eax,dword ptr [esi+91C]
 004BEA8B    call        004B6FCC
 004BEA90    mov         edx,dword ptr [ebp-4]
 004BEA93    mov         eax,edi
 004BEA95    mov         ecx,0FF
 004BEA9A    call        @LStrToString
 004BEA9F    xor         eax,eax
 004BEAA1    pop         edx
 004BEAA2    pop         ecx
 004BEAA3    pop         ecx
 004BEAA4    mov         dword ptr fs:[eax],edx
 004BEAA7    push        4BEABC
 004BEAAC    lea         eax,[ebp-4]
 004BEAAF    call        @LStrClr
 004BEAB4    ret
>004BEAB5    jmp         @HandleFinally
>004BEABA    jmp         004BEAAC
 004BEABC    pop         edi
 004BEABD    pop         esi
 004BEABE    pop         ebx
 004BEABF    pop         ecx
 004BEAC0    pop         ebp
 004BEAC1    ret
*}
//end;

//004BEAC4
{*function sub_004BEAC4(?:TFichierCdn):?;
begin
 004BEAC4    mov         eax,dword ptr [eax+91C]
 004BEACA    call        004B700C
 004BEACF    ret
//end;*}

//004BEAD0
{*function sub_004BEAD0(?:dword; ?:dword):?;
begin
 004BEAD0    push        ebp
 004BEAD1    mov         ebp,esp
 004BEAD3    push        0
 004BEAD5    push        ebx
 004BEAD6    push        esi
 004BEAD7    mov         ebx,edx
 004BEAD9    mov         esi,eax
 004BEADB    xor         eax,eax
 004BEADD    push        ebp
 004BEADE    push        4BEB31
 004BEAE3    push        dword ptr fs:[eax]
 004BEAE6    mov         dword ptr fs:[eax],esp
 004BEAE9    lea         ecx,[ebp-4]
 004BEAEC    xor         edx,edx
 004BEAEE    mov         dl,bl
 004BEAF0    sub         edx,1
>004BEAF3    jno         004BEAFA
 004BEAF5    call        @IntOver
 004BEAFA    mov         eax,dword ptr [esi+920]
 004BEB00    mov         ebx,dword ptr [eax]
 004BEB02    call        dword ptr [ebx+0C]
 004BEB05    mov         eax,dword ptr [ebp-4]
 004BEB08    call        StrToInt
 004BEB0D    cmp         eax,0FF
>004BEB12    jbe         004BEB19
 004BEB14    call        @BoundErr
 004BEB19    mov         ebx,eax
 004BEB1B    xor         eax,eax
 004BEB1D    pop         edx
 004BEB1E    pop         ecx
 004BEB1F    pop         ecx
 004BEB20    mov         dword ptr fs:[eax],edx
 004BEB23    push        4BEB38
 004BEB28    lea         eax,[ebp-4]
 004BEB2B    call        @LStrClr
 004BEB30    ret
>004BEB31    jmp         @HandleFinally
>004BEB36    jmp         004BEB28
 004BEB38    mov         eax,ebx
 004BEB3A    pop         esi
 004BEB3B    pop         ebx
 004BEB3C    pop         ecx
 004BEB3D    pop         ebp
 004BEB3E    ret
//end;*}

//004BEB40
{*function sub_004BEB40(?:dword; ?:?; ?:?):?;
begin
 004BEB40    push        ebp
 004BEB41    mov         ebp,esp
 004BEB43    add         esp,0FFFFFFF0
 004BEB46    push        ebx
 004BEB47    push        esi
 004BEB48    push        edi
 004BEB49    xor         ebx,ebx
 004BEB4B    mov         dword ptr [ebp-10],ebx
 004BEB4E    mov         byte ptr [ebp-5],cl
 004BEB51    mov         dword ptr [ebp-4],eax
 004BEB54    xor         eax,eax
 004BEB56    push        ebp
 004BEB57    push        4BEBF2
 004BEB5C    push        dword ptr fs:[eax]
 004BEB5F    mov         dword ptr fs:[eax],esp
 004BEB62    xor         eax,eax
 004BEB64    mov         dword ptr [ebp-0C],eax
 004BEB67    xor         ebx,ebx
 004BEB69    mov         bl,dl
 004BEB6B    sub         ebx,1
>004BEB6E    jno         004BEB75
 004BEB70    call        @IntOver
 004BEB75    test        ebx,ebx
>004BEB77    jle         004BEBB1
 004BEB79    mov         esi,1
 004BEB7E    lea         ecx,[ebp-10]
 004BEB81    mov         edx,esi
 004BEB83    sub         edx,1
>004BEB86    jno         004BEB8D
 004BEB88    call        @IntOver
 004BEB8D    mov         eax,dword ptr [ebp-4]
 004BEB90    mov         eax,dword ptr [eax+920]
 004BEB96    mov         edi,dword ptr [eax]
 004BEB98    call        dword ptr [edi+0C]
 004BEB9B    mov         eax,dword ptr [ebp-10]
 004BEB9E    call        StrToInt
 004BEBA3    add         dword ptr [ebp-0C],eax
>004BEBA6    jno         004BEBAD
 004BEBA8    call        @IntOver
 004BEBAD    inc         esi
 004BEBAE    dec         ebx
>004BEBAF    jne         004BEB7E
 004BEBB1    mov         edx,dword ptr [ebp-0C]
 004BEBB4    sub         edx,1
>004BEBB7    jno         004BEBBE
 004BEBB9    call        @IntOver
 004BEBBE    xor         eax,eax
 004BEBC0    mov         al,byte ptr [ebp-5]
 004BEBC3    add         edx,eax
>004BEBC5    jno         004BEBCC
 004BEBC7    call        @IntOver
 004BEBCC    mov         eax,dword ptr [ebp-4]
 004BEBCF    mov         eax,dword ptr [eax+924]
 004BEBD5    call        TStringGrid.GetCols
 004BEBDA    mov         ebx,eax
 004BEBDC    xor         eax,eax
 004BEBDE    pop         edx
 004BEBDF    pop         ecx
 004BEBE0    pop         ecx
 004BEBE1    mov         dword ptr fs:[eax],edx
 004BEBE4    push        4BEBF9
 004BEBE9    lea         eax,[ebp-10]
 004BEBEC    call        @LStrClr
 004BEBF1    ret
>004BEBF2    jmp         @HandleFinally
>004BEBF7    jmp         004BEBE9
 004BEBF9    mov         eax,ebx
 004BEBFB    pop         edi
 004BEBFC    pop         esi
 004BEBFD    pop         ebx
 004BEBFE    mov         esp,ebp
 004BEC00    pop         ebp
 004BEC01    ret
//end;*}

//004BEC04
{*////procedure sub_004BEC04(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004BEC04    push        ebp
 004BEC05    mov         ebp,esp
 004BEC07    push        0
 004BEC09    push        0
 004BEC0B    push        0
 004BEC0D    push        ebx
 004BEC0E    push        esi
 004BEC0F    push        edi
 004BEC10    mov         byte ptr [ebp-2],cl
 004BEC13    mov         byte ptr [ebp-1],dl
 004BEC16    mov         esi,eax
 004BEC18    xor         eax,eax
 004BEC1A    push        ebp
 004BEC1B    push        4BECF1
 004BEC20    push        dword ptr fs:[eax]
 004BEC23    mov         dword ptr fs:[eax],esp
 004BEC26    xor         ebx,ebx
 004BEC28    xor         eax,eax
 004BEC2A    mov         al,byte ptr [ebp-1]
 004BEC2D    sub         eax,1
>004BEC30    jno         004BEC37
 004BEC32    call        @IntOver
 004BEC37    cmp         eax,0FF
>004BEC3C    jbe         004BEC43
 004BEC3E    call        @BoundErr
 004BEC43    test        al,al
>004BEC45    jbe         004BEC96
 004BEC47    mov         byte ptr [ebp-4],al
 004BEC4A    mov         byte ptr [ebp-3],1
 004BEC4E    lea         ecx,[ebp-8]
 004BEC51    xor         edx,edx
 004BEC53    mov         dl,byte ptr [ebp-3]
 004BEC56    sub         edx,1
>004BEC59    jno         004BEC60
 004BEC5B    call        @IntOver
 004BEC60    mov         eax,dword ptr [esi+920]
 004BEC66    mov         edi,dword ptr [eax]
 004BEC68    call        dword ptr [edi+0C]
 004BEC6B    mov         eax,dword ptr [ebp-8]
 004BEC6E    call        StrToInt
 004BEC73    xor         edx,edx
 004BEC75    mov         dl,bl
 004BEC77    add         eax,edx
>004BEC79    jno         004BEC80
 004BEC7B    call        @IntOver
 004BEC80    cmp         eax,0FF
>004BEC85    jbe         004BEC8C
 004BEC87    call        @BoundErr
 004BEC8C    mov         ebx,eax
 004BEC8E    inc         byte ptr [ebp-3]
 004BEC91    dec         byte ptr [ebp-4]
>004BEC94    jne         004BEC4E
 004BEC96    lea         eax,[ebp-0C]
 004BEC99    push        eax
 004BEC9A    xor         edx,edx
 004BEC9C    mov         dl,bl
 004BEC9E    sub         edx,1
>004BECA1    jno         004BECA8
 004BECA3    call        @IntOver
 004BECA8    xor         eax,eax
 004BECAA    mov         al,byte ptr [ebp-2]
 004BECAD    add         edx,eax
>004BECAF    jno         004BECB6
 004BECB1    call        @IntOver
 004BECB6    xor         ecx,ecx
 004BECB8    mov         cl,byte ptr [ebp+0C]
 004BECBB    mov         eax,dword ptr [esi+924]
 004BECC1    call        TStringGrid.GetCells
 004BECC6    mov         edx,dword ptr [ebp-0C]
 004BECC9    mov         eax,dword ptr [ebp+8]
 004BECCC    mov         ecx,0FF
 004BECD1    call        @LStrToString
 004BECD6    xor         eax,eax
 004BECD8    pop         edx
 004BECD9    pop         ecx
 004BECDA    pop         ecx
 004BECDB    mov         dword ptr fs:[eax],edx
 004BECDE    push        4BECF8
 004BECE3    lea         eax,[ebp-0C]
 004BECE6    mov         edx,2
 004BECEB    call        @LStrArrayClr
 004BECF0    ret
>004BECF1    jmp         @HandleFinally
>004BECF6    jmp         004BECE3
 004BECF8    pop         edi
 004BECF9    pop         esi
 004BECFA    pop         ebx
 004BECFB    mov         esp,ebp
 004BECFD    pop         ebp
 004BECFE    ret         8
//end;*}

//004BED04
{*////procedure sub_004BED04(?:dword; ?:dword; ?:Single; ?:?);
begin
 004BED04    push        ebp
 004BED05    mov         ebp,esp
 004BED07    push        ecx
 004BED08    push        ebx
 004BED09    push        esi
 004BED0A    mov         byte ptr [ebp-1],cl
 004BED0D    mov         ebx,edx
 004BED0F    mov         esi,eax
 004BED11    push        0
 004BED13    mov         eax,dword ptr [ebp+8]
 004BED16    push        eax
 004BED17    mov         cl,byte ptr [ebp-1]
 004BED1A    mov         edx,ebx
 004BED1C    mov         eax,esi
 004BED1E    call        004BEC04
 004BED23    pop         esi
 004BED24    pop         ebx
 004BED25    pop         ecx
 004BED26    pop         ebp
 004BED27    ret         4
//end;*}

//004BED2C
{*////procedure sub_004BED2C(?:dword; ?:dword; ?:dword; ?:?);
begin
 004BED2C    push        ebp
 004BED2D    mov         ebp,esp
 004BED2F    push        ecx
 004BED30    push        ebx
 004BED31    push        esi
 004BED32    mov         byte ptr [ebp-1],cl
 004BED35    mov         ebx,edx
 004BED37    mov         esi,eax
 004BED39    mov         eax,esi
 004BED3B    call        004BEA58
 004BED40    and         eax,0FF
 004BED45    mov         edx,dword ptr ds:[615B30];^gvar_006178FB
 004BED4B    movzx       edx,byte ptr [edx]
 004BED4E    add         eax,edx
>004BED50    jno         004BED57
 004BED52    call        @IntOver
 004BED57    cmp         eax,0FF
>004BED5C    jbe         004BED63
 004BED5E    call        @BoundErr
 004BED63    push        eax
 004BED64    mov         eax,dword ptr [ebp+8]
 004BED67    push        eax
 004BED68    mov         cl,byte ptr [ebp-1]
 004BED6B    mov         edx,ebx
 004BED6D    mov         eax,esi
 004BED6F    call        004BEC04
 004BED74    pop         esi
 004BED75    pop         ebx
 004BED76    pop         ecx
 004BED77    pop         ebp
 004BED78    ret         4
//end;*}

//004BED7C
{*////procedure sub_004BED7C(?:dword; ?:dword; ?:?; ?:?);
begin
 004BED7C    push        ebp
 004BED7D    mov         ebp,esp
 004BED7F    push        ecx
 004BED80    push        ebx
 004BED81    push        esi
 004BED82    mov         byte ptr [ebp-1],cl
 004BED85    mov         ebx,edx
 004BED87    mov         esi,eax
 004BED89    mov         eax,esi
 004BED8B    call        004BEA58
 004BED90    and         eax,0FF
 004BED95    mov         edx,dword ptr ds:[615B2C];^gvar_006178FC
 004BED9B    movzx       edx,byte ptr [edx]
 004BED9E    add         eax,edx
>004BEDA0    jno         004BEDA7
 004BEDA2    call        @IntOver
 004BEDA7    cmp         eax,0FF
>004BEDAC    jbe         004BEDB3
 004BEDAE    call        @BoundErr
 004BEDB3    push        eax
 004BEDB4    mov         eax,dword ptr [ebp+8]
 004BEDB7    push        eax
 004BEDB8    mov         cl,byte ptr [ebp-1]
 004BEDBB    mov         edx,ebx
 004BEDBD    mov         eax,esi
 004BEDBF    call        004BEC04
 004BEDC4    pop         esi
 004BEDC5    pop         ebx
 004BEDC6    pop         ecx
 004BEDC7    pop         ebp
 004BEDC8    ret         4
//end;*}

//004BEDCC
{*////procedure sub_004BEDCC(?:dword; ?:dword; ?:?; ?:?);
begin
 004BEDCC    push        ebp
 004BEDCD    mov         ebp,esp
 004BEDCF    push        ecx
 004BEDD0    push        ebx
 004BEDD1    push        esi
 004BEDD2    mov         byte ptr [ebp-1],cl
 004BEDD5    mov         ebx,edx
 004BEDD7    mov         esi,eax
 004BEDD9    mov         eax,esi
 004BEDDB    call        004BEA58
 004BEDE0    and         eax,0FF
 004BEDE5    mov         edx,dword ptr ds:[615BF0];^gvar_006178FD
 004BEDEB    movzx       edx,byte ptr [edx]
 004BEDEE    add         eax,edx
>004BEDF0    jno         004BEDF7
 004BEDF2    call        @IntOver
 004BEDF7    cmp         eax,0FF
>004BEDFC    jbe         004BEE03
 004BEDFE    call        @BoundErr
 004BEE03    push        eax
 004BEE04    mov         eax,dword ptr [ebp+8]
 004BEE07    push        eax
 004BEE08    mov         cl,byte ptr [ebp-1]
 004BEE0B    mov         edx,ebx
 004BEE0D    mov         eax,esi
 004BEE0F    call        004BEC04
 004BEE14    pop         esi
 004BEE15    pop         ebx
 004BEE16    pop         ecx
 004BEE17    pop         ebp
 004BEE18    ret         4
//end;*}

//004BEE1C
{*////procedure sub_004BEE1C(?:dword; ?:?; ?:?; ?:?);
begin
 004BEE1C    push        ebp
 004BEE1D    mov         ebp,esp
 004BEE1F    push        ecx
 004BEE20    push        ebx
 004BEE21    push        esi
 004BEE22    mov         byte ptr [ebp-1],cl
 004BEE25    mov         ebx,edx
 004BEE27    mov         esi,eax
 004BEE29    mov         eax,esi
 004BEE2B    call        004BEA58
 004BEE30    and         eax,0FF
 004BEE35    mov         edx,dword ptr ds:[61618C];^gvar_006178FE
 004BEE3B    movzx       edx,byte ptr [edx]
 004BEE3E    add         eax,edx
>004BEE40    jno         004BEE47
 004BEE42    call        @IntOver
 004BEE47    cmp         eax,0FF
>004BEE4C    jbe         004BEE53
 004BEE4E    call        @BoundErr
 004BEE53    push        eax
 004BEE54    mov         eax,dword ptr [ebp+8]
 004BEE57    push        eax
 004BEE58    mov         cl,byte ptr [ebp-1]
 004BEE5B    mov         edx,ebx
 004BEE5D    mov         eax,esi
 004BEE5F    call        004BEC04
 004BEE64    pop         esi
 004BEE65    pop         ebx
 004BEE66    pop         ecx
 004BEE67    pop         ebp
 004BEE68    ret         4
//end;*}

//004BEE6C
{*////procedure sub_004BEE6C(?:dword; ?:dword; ?:?; ?:?);
begin
 004BEE6C    push        ebp
 004BEE6D    mov         ebp,esp
 004BEE6F    push        ecx
 004BEE70    push        ebx
 004BEE71    push        esi
 004BEE72    mov         byte ptr [ebp-1],cl
 004BEE75    mov         ebx,edx
 004BEE77    mov         esi,eax
 004BEE79    mov         eax,esi
 004BEE7B    call        004BEA58
 004BEE80    and         eax,0FF
 004BEE85    mov         edx,dword ptr ds:[615D80];^gvar_006178FF
 004BEE8B    movzx       edx,byte ptr [edx]
 004BEE8E    add         eax,edx
>004BEE90    jno         004BEE97
 004BEE92    call        @IntOver
 004BEE97    cmp         eax,0FF
>004BEE9C    jbe         004BEEA3
 004BEE9E    call        @BoundErr
 004BEEA3    push        eax
 004BEEA4    mov         eax,dword ptr [ebp+8]
 004BEEA7    push        eax
 004BEEA8    mov         cl,byte ptr [ebp-1]
 004BEEAB    mov         edx,ebx
 004BEEAD    mov         eax,esi
 004BEEAF    call        004BEC04
 004BEEB4    pop         esi
 004BEEB5    pop         ebx
 004BEEB6    pop         ecx
 004BEEB7    pop         ebp
 004BEEB8    ret         4
//end;*}

//004BEEBC
{*////procedure sub_004BEEBC(?:dword; ?:dword; ?:?; ?:?);
begin
 004BEEBC    push        ebp
 004BEEBD    mov         ebp,esp
 004BEEBF    push        ecx
 004BEEC0    push        ebx
 004BEEC1    push        esi
 004BEEC2    mov         byte ptr [ebp-1],cl
 004BEEC5    mov         ebx,edx
 004BEEC7    mov         esi,eax
 004BEEC9    mov         eax,esi
 004BEECB    call        004BEA58
 004BEED0    and         eax,0FF
 004BEED5    mov         edx,dword ptr ds:[6162DC];^gvar_00617900
 004BEEDB    movzx       edx,byte ptr [edx]
 004BEEDE    add         eax,edx
>004BEEE0    jno         004BEEE7
 004BEEE2    call        @IntOver
 004BEEE7    cmp         eax,0FF
>004BEEEC    jbe         004BEEF3
 004BEEEE    call        @BoundErr
 004BEEF3    push        eax
 004BEEF4    mov         eax,dword ptr [ebp+8]
 004BEEF7    push        eax
 004BEEF8    mov         cl,byte ptr [ebp-1]
 004BEEFB    mov         edx,ebx
 004BEEFD    mov         eax,esi
 004BEEFF    call        004BEC04
 004BEF04    pop         esi
 004BEF05    pop         ebx
 004BEF06    pop         ecx
 004BEF07    pop         ebp
 004BEF08    ret         4
//end;*}

//004BEF0C
{*////procedure sub_004BEF0C(?:dword; ?:dword; ?:?; ?:?);
begin
 004BEF0C    push        ebp
 004BEF0D    mov         ebp,esp
 004BEF0F    push        ecx
 004BEF10    push        ebx
 004BEF11    push        esi
 004BEF12    mov         byte ptr [ebp-1],cl
 004BEF15    mov         ebx,edx
 004BEF17    mov         esi,eax
 004BEF19    mov         eax,esi
 004BEF1B    call        004BEA58
 004BEF20    and         eax,0FF
 004BEF25    mov         edx,dword ptr ds:[6162F0];^gvar_00617901
 004BEF2B    movzx       edx,byte ptr [edx]
 004BEF2E    add         eax,edx
>004BEF30    jno         004BEF37
 004BEF32    call        @IntOver
 004BEF37    cmp         eax,0FF
>004BEF3C    jbe         004BEF43
 004BEF3E    call        @BoundErr
 004BEF43    push        eax
 004BEF44    mov         eax,dword ptr [ebp+8]
 004BEF47    push        eax
 004BEF48    mov         cl,byte ptr [ebp-1]
 004BEF4B    mov         edx,ebx
 004BEF4D    mov         eax,esi
 004BEF4F    call        004BEC04
 004BEF54    pop         esi
 004BEF55    pop         ebx
 004BEF56    pop         ecx
 004BEF57    pop         ebp
 004BEF58    ret         4
//end;*}

//004BEF5C
{*////procedure sub_004BEF5C(?:dword; ?:dword; ?:?; ?:?; ?:?);
begin
 004BEF5C    push        ebp
 004BEF5D    mov         ebp,esp
 004BEF5F    push        ecx
 004BEF60    push        ebx
 004BEF61    push        esi
 004BEF62    mov         byte ptr [ebp-1],cl
 004BEF65    mov         ebx,edx
 004BEF67    mov         esi,eax
 004BEF69    mov         al,byte ptr [ebp+0C]
 004BEF6C    push        eax
 004BEF6D    mov         eax,dword ptr [ebp+8]
 004BEF70    push        eax
 004BEF71    mov         cl,byte ptr [ebp-1]
 004BEF74    mov         edx,ebx
 004BEF76    mov         eax,esi
 004BEF78    call        004BEC04
 004BEF7D    pop         esi
 004BEF7E    pop         ebx
 004BEF7F    pop         ecx
 004BEF80    pop         ebp
 004BEF81    ret         8
//end;*}

//004BEF84
{*////procedure sub_004BEF84(?:?; ?:?);
begin
 004BEF84    push        ebp
 004BEF85    mov         ebp,esp
 004BEF87    push        ecx
 004BEF88    push        ebx
 004BEF89    mov         dword ptr [ebp-4],edx
 004BEF8C    mov         ebx,eax
 004BEF8E    mov         eax,dword ptr [ebp-4]
 004BEF91    call        @LStrAddRef
 004BEF96    xor         eax,eax
 004BEF98    push        ebp
 004BEF99    push        4BEFC5
 004BEF9E    push        dword ptr fs:[eax]
 004BEFA1    mov         dword ptr fs:[eax],esp
 004BEFA4    lea         eax,[ebx+0C]
 004BEFA7    mov         edx,dword ptr [ebp-4]
 004BEFAA    call        @LStrAsg
 004BEFAF    xor         eax,eax
 004BEFB1    pop         edx
 004BEFB2    pop         ecx
 004BEFB3    pop         ecx
 004BEFB4    mov         dword ptr fs:[eax],edx
 004BEFB7    push        4BEFCC
 004BEFBC    lea         eax,[ebp-4]
 004BEFBF    call        @LStrClr
 004BEFC4    ret
>004BEFC5    jmp         @HandleFinally
>004BEFCA    jmp         004BEFBC
 004BEFCC    pop         ebx
 004BEFCD    pop         ecx
 004BEFCE    pop         ebp
 004BEFCF    ret
//end;*}

//004BEFD0
////procedure sub_004BEFD0(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BEFD0    push        ebx
 004BEFD1    push        esi
 004BEFD2    push        edi
 004BEFD3    add         esp,0FFFFFF00
 004BEFD9    mov         esi,edx
 004BEFDB    lea         edi,[esp]
 004BEFDE    xor         ecx,ecx
 004BEFE0    mov         cl,byte ptr [esi]
 004BEFE2    inc         ecx
 004BEFE3    rep movs    byte ptr [edi],byte ptr [esi]
 004BEFE5    mov         ebx,eax
 004BEFE7    mov         byte ptr [ebx+8],1
 004BEFEB    lea         eax,[ebx+410]
 004BEFF1    mov         edx,esp
 004BEFF3    call        @PStrCpy
 004BEFF8    add         esp,100
 004BEFFE    pop         edi
 004BEFFF    pop         esi
 004BF000    pop         ebx
 004BF001    ret
*}
//end;

//004BF004
////procedure sub_004BF004(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BF004    push        ebx
 004BF005    push        esi
 004BF006    push        edi
 004BF007    add         esp,0FFFFFF00
 004BF00D    mov         esi,edx
 004BF00F    lea         edi,[esp]
 004BF012    xor         ecx,ecx
 004BF014    mov         cl,byte ptr [esi]
 004BF016    inc         ecx
 004BF017    rep movs    byte ptr [edi],byte ptr [esi]
 004BF019    mov         ebx,eax
 004BF01B    mov         byte ptr [ebx+8],1
 004BF01F    lea         eax,[ebx+510]
 004BF025    mov         edx,esp
 004BF027    call        @PStrCpy
 004BF02C    add         esp,100
 004BF032    pop         edi
 004BF033    pop         esi
 004BF034    pop         ebx
 004BF035    ret
*}
//end;

//004BF038
////procedure sub_004BF038(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BF038    push        ebx
 004BF039    push        esi
 004BF03A    push        edi
 004BF03B    add         esp,0FFFFFF00
 004BF041    mov         esi,edx
 004BF043    lea         edi,[esp]
 004BF046    xor         ecx,ecx
 004BF048    mov         cl,byte ptr [esi]
 004BF04A    inc         ecx
 004BF04B    rep movs    byte ptr [edi],byte ptr [esi]
 004BF04D    mov         ebx,eax
 004BF04F    mov         byte ptr [ebx+8],1
 004BF053    lea         eax,[ebx+610]
 004BF059    mov         edx,esp
 004BF05B    call        @PStrCpy
 004BF060    add         esp,100
 004BF066    pop         edi
 004BF067    pop         esi
 004BF068    pop         ebx
 004BF069    ret
*}
//end;

//004BF06C
////procedure sub_004BF06C(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BF06C    push        ebx
 004BF06D    push        esi
 004BF06E    push        edi
 004BF06F    add         esp,0FFFFFF00
 004BF075    mov         esi,edx
 004BF077    lea         edi,[esp]
 004BF07A    xor         ecx,ecx
 004BF07C    mov         cl,byte ptr [esi]
 004BF07E    inc         ecx
 004BF07F    rep movs    byte ptr [edi],byte ptr [esi]
 004BF081    mov         ebx,eax
 004BF083    mov         byte ptr [ebx+8],1
 004BF087    lea         eax,[ebx+710]
 004BF08D    mov         edx,esp
 004BF08F    call        @PStrCpy
 004BF094    add         esp,100
 004BF09A    pop         edi
 004BF09B    pop         esi
 004BF09C    pop         ebx
 004BF09D    ret
*}
//end;

//004BF0A0
////procedure sub_004BF0A0(?:TFichierCdn; ?:PShortString);
//begin
{*
 004BF0A0    push        ebx
 004BF0A1    push        esi
 004BF0A2    push        edi
 004BF0A3    add         esp,0FFFFFF00
 004BF0A9    mov         esi,edx
 004BF0AB    lea         edi,[esp]
 004BF0AE    xor         ecx,ecx
 004BF0B0    mov         cl,byte ptr [esi]
 004BF0B2    inc         ecx
 004BF0B3    rep movs    byte ptr [edi],byte ptr [esi]
 004BF0B5    mov         ebx,eax
 004BF0B7    mov         byte ptr [ebx+8],1
 004BF0BB    lea         eax,[ebx+810]
 004BF0C1    mov         edx,esp
 004BF0C3    call        @PStrCpy
 004BF0C8    add         esp,100
 004BF0CE    pop         edi
 004BF0CF    pop         esi
 004BF0D0    pop         ebx
 004BF0D1    ret
*}
//end;

//004BF0D4
////procedure sub_004BF0D4(?:TFichierCdn);
//begin
{*
 004BF0D4    push        ebx
 004BF0D5    push        esi
 004BF0D6    push        edi
 004BF0D7    push        ebp
 004BF0D8    mov         esi,eax
 004BF0DA    mov         eax,dword ptr [esi+944]
 004BF0E0    mov         edx,dword ptr [eax]
 004BF0E2    call        dword ptr [edx+40]
 004BF0E5    mov         eax,esi
 004BF0E7    call        004BE9E0
 004BF0EC    and         eax,0FF
 004BF0F1    imul        ebp,eax,2
>004BF0F4    jno         004BF0FB
 004BF0F6    call        @IntOver
 004BF0FB    test        ebp,ebp
>004BF0FD    jle         004BF11A
 004BF0FF    mov         edi,32
 004BF104    mov         edx,4BF248;'1'
 004BF109    mov         eax,dword ptr [esi+944]
 004BF10F    mov         ecx,dword ptr [eax]
 004BF111    call        dword ptr [ecx+34]
 004BF114    dec         edi
>004BF115    jne         004BF104
 004BF117    dec         ebp
>004BF118    jne         004BF0FF
 004BF11A    mov         eax,dword ptr [esi+940]
 004BF120    mov         edx,dword ptr [eax]
 004BF122    call        dword ptr [edx+40]
 004BF125    mov         eax,esi
 004BF127    call        004C4790
 004BF12C    mov         ebp,eax
 004BF12E    and         ebp,0FF
 004BF134    test        ebp,ebp
>004BF136    jle         004BF153
 004BF138    mov         ebx,0E
 004BF13D    mov         edx,4BF248;'1'
 004BF142    mov         eax,dword ptr [esi+940]
 004BF148    mov         ecx,dword ptr [eax]
 004BF14A    call        dword ptr [ecx+34]
 004BF14D    dec         ebx
>004BF14E    jne         004BF13D
 004BF150    dec         ebp
>004BF151    jne         004BF138
 004BF153    mov         eax,dword ptr [esi+920]
 004BF159    mov         edx,dword ptr [eax]
 004BF15B    call        dword ptr [edx+40]
 004BF15E    mov         eax,esi
 004BF160    call        004BE9E0
 004BF165    mov         ebp,eax
 004BF167    and         ebp,0FF
 004BF16D    test        ebp,ebp
>004BF16F    jle         004BF184
 004BF171    mov         edx,4BF254;'0'
 004BF176    mov         eax,dword ptr [esi+920]
 004BF17C    mov         ecx,dword ptr [eax]
 004BF17E    call        dword ptr [ecx+34]
 004BF181    dec         ebp
>004BF182    jne         004BF171
 004BF184    mov         eax,dword ptr [esi+928]
 004BF18A    mov         edx,dword ptr [eax]
 004BF18C    call        dword ptr [edx+40]
 004BF18F    mov         eax,dword ptr [esi+92C]
 004BF195    mov         edx,dword ptr [eax]
 004BF197    call        dword ptr [edx+40]
 004BF19A    mov         eax,dword ptr [esi+930]
 004BF1A0    mov         edx,dword ptr [eax]
 004BF1A2    call        dword ptr [edx+40]
 004BF1A5    mov         eax,dword ptr [esi+938]
 004BF1AB    mov         edx,dword ptr [eax]
 004BF1AD    call        dword ptr [edx+40]
 004BF1B0    mov         eax,dword ptr [esi+934]
 004BF1B6    mov         edx,dword ptr [eax]
 004BF1B8    call        dword ptr [edx+40]
 004BF1BB    mov         eax,esi
 004BF1BD    call        004BE9E0
 004BF1C2    mov         ebp,eax
 004BF1C4    and         ebp,0FF
 004BF1CA    test        ebp,ebp
>004BF1CC    jle         004BF205
 004BF1CE    mov         edi,32
 004BF1D3    xor         edx,edx
 004BF1D5    mov         eax,dword ptr [esi+928]
 004BF1DB    mov         ecx,dword ptr [eax]
 004BF1DD    call        dword ptr [ecx+34]
 004BF1E0    mov         eax,esi
 004BF1E2    call        004C8AE8
 004BF1E7    xor         ebx,ebx
 004BF1E9    mov         bl,al
 004BF1EB    test        ebx,ebx
>004BF1ED    jle         004BF1FF
 004BF1EF    xor         edx,edx
 004BF1F1    mov         eax,dword ptr [esi+92C]
 004BF1F7    mov         ecx,dword ptr [eax]
 004BF1F9    call        dword ptr [ecx+34]
 004BF1FC    dec         ebx
>004BF1FD    jne         004BF1EF
 004BF1FF    dec         edi
>004BF200    jne         004BF1D3
 004BF202    dec         ebp
>004BF203    jne         004BF1CE
 004BF205    mov         edi,32
 004BF20A    xor         edx,edx
 004BF20C    mov         eax,dword ptr [esi+930]
 004BF212    mov         ecx,dword ptr [eax]
 004BF214    call        dword ptr [ecx+34]
 004BF217    mov         edx,4BF248;'1'
 004BF21C    mov         eax,dword ptr [esi+934]
 004BF222    mov         ecx,dword ptr [eax]
 004BF224    call        dword ptr [ecx+34]
 004BF227    xor         edx,edx
 004BF229    mov         eax,dword ptr [esi+938]
 004BF22F    mov         ecx,dword ptr [eax]
 004BF231    call        dword ptr [ecx+34]
 004BF234    dec         edi
>004BF235    jne         004BF20A
 004BF237    mov         byte ptr [esi+8],1
 004BF23B    pop         ebp
 004BF23C    pop         edi
 004BF23D    pop         esi
 004BF23E    pop         ebx
 004BF23F    ret
*}
//end;

//004BF258
{*////procedure sub_004BF258(?:dword; ?:ShortString; ?:?);
begin
 004BF258    push        ebp
 004BF259    mov         ebp,esp
 004BF25B    add         esp,0FFFFFDE0
 004BF261    push        ebx
 004BF262    push        esi
 004BF263    push        edi
 004BF264    xor         ebx,ebx
 004BF266    mov         dword ptr [ebp-220],ebx
 004BF26C    mov         dword ptr [ebp-21C],ebx
 004BF272    mov         dword ptr [ebp-218],ebx
 004BF278    mov         dword ptr [ebp-214],ebx
 004BF27E    mov         dword ptr [ebp-210],ebx
 004BF284    mov         dword ptr [ebp-20C],ebx
 004BF28A    mov         dword ptr [ebp-208],ebx
 004BF290    mov         esi,ecx
 004BF292    lea         edi,[ebp-204]
 004BF298    xor         ecx,ecx
 004BF29A    mov         cl,byte ptr [esi]
 004BF29C    inc         ecx
 004BF29D    rep movs    byte ptr [edi],byte ptr [esi]
 004BF29F    mov         esi,edx
 004BF2A1    lea         edi,[ebp-104]
 004BF2A7    xor         ecx,ecx
 004BF2A9    mov         cl,byte ptr [esi]
 004BF2AB    inc         ecx
 004BF2AC    rep movs    byte ptr [edi],byte ptr [esi]
 004BF2AE    mov         esi,eax
 004BF2B0    xor         eax,eax
 004BF2B2    push        ebp
 004BF2B3    push        4BF51D
 004BF2B8    push        dword ptr fs:[eax]
 004BF2BB    mov         dword ptr fs:[eax],esp
 004BF2BE    lea         eax,[ebp-208]
 004BF2C4    lea         edx,[ebp-104]
 004BF2CA    call        @LStrFromString
 004BF2CF    mov         edx,dword ptr [ebp-208]
 004BF2D5    mov         eax,dword ptr [esi+918]
 004BF2DB    call        004B6D38
 004BF2E0    lea         eax,[ebp-20C]
 004BF2E6    lea         edx,[ebp-104]
 004BF2EC    call        @LStrFromString
 004BF2F1    mov         eax,dword ptr [ebp-20C]
 004BF2F7    call        004BA3F8
 004BF2FC    mov         edx,eax
 004BF2FE    mov         eax,dword ptr [esi+918]
 004BF304    call        004B6D84
 004BF309    lea         eax,[ebp-210]
 004BF30F    lea         edx,[ebp-204]
 004BF315    call        @LStrFromString
 004BF31A    mov         edx,dword ptr [ebp-210]
 004BF320    mov         eax,dword ptr [esi+914]
 004BF326    call        004C9AA0
 004BF32B    lea         eax,[ebp-214]
 004BF331    lea         edx,[ebp-204]
 004BF337    call        @LStrFromString
 004BF33C    mov         eax,dword ptr [ebp-214]
 004BF342    call        004BCF84
 004BF347    mov         edx,eax
 004BF349    mov         eax,dword ptr [esi+914]
 004BF34F    call        004C9A84
 004BF354    mov         eax,dword ptr [esi+920]
 004BF35A    mov         edx,dword ptr [eax]
 004BF35C    call        dword ptr [edx+40]
 004BF35F    lea         eax,[ebp-218]
 004BF365    lea         edx,[ebp-104]
 004BF36B    call        @LStrFromString
 004BF370    mov         eax,dword ptr [ebp-218]
 004BF376    call        004BA3F8
 004BF37B    mov         edx,dword ptr [eax]
 004BF37D    call        dword ptr [edx+14]
 004BF380    test        eax,eax
>004BF382    jle         004BF39C
 004BF384    mov         dword ptr [ebp-4],eax
 004BF387    mov         edx,4BF534;'0'
 004BF38C    mov         eax,dword ptr [esi+920]
 004BF392    mov         ecx,dword ptr [eax]
 004BF394    call        dword ptr [ecx+34]
 004BF397    dec         dword ptr [ebp-4]
>004BF39A    jne         004BF387
 004BF39C    mov         eax,dword ptr [esi+928]
 004BF3A2    mov         edx,dword ptr [eax]
 004BF3A4    call        dword ptr [edx+40]
 004BF3A7    mov         eax,dword ptr [esi+92C]
 004BF3AD    mov         edx,dword ptr [eax]
 004BF3AF    call        dword ptr [edx+40]
 004BF3B2    mov         eax,dword ptr [esi+930]
 004BF3B8    mov         edx,dword ptr [eax]
 004BF3BA    call        dword ptr [edx+40]
 004BF3BD    mov         eax,dword ptr [esi+938]
 004BF3C3    mov         edx,dword ptr [eax]
 004BF3C5    call        dword ptr [edx+40]
 004BF3C8    mov         eax,dword ptr [esi+934]
 004BF3CE    mov         edx,dword ptr [eax]
 004BF3D0    call        dword ptr [edx+40]
 004BF3D3    mov         eax,dword ptr [esi+940]
 004BF3D9    mov         edx,dword ptr [eax]
 004BF3DB    call        dword ptr [edx+40]
 004BF3DE    mov         eax,dword ptr [esi+944]
 004BF3E4    mov         edx,dword ptr [eax]
 004BF3E6    call        dword ptr [edx+40]
 004BF3E9    lea         eax,[ebp-21C]
 004BF3EF    lea         edx,[ebp-104]
 004BF3F5    call        @LStrFromString
 004BF3FA    mov         eax,dword ptr [ebp-21C]
 004BF400    call        004BA3F8
 004BF405    mov         edx,dword ptr [eax]
 004BF407    call        dword ptr [edx+14]
 004BF40A    imul        eax,eax,2
>004BF40D    jno         004BF414
 004BF40F    call        @IntOver
 004BF414    test        eax,eax
>004BF416    jle         004BF438
 004BF418    mov         dword ptr [ebp-4],eax
 004BF41B    mov         edi,32
 004BF420    mov         edx,4BF540;'1'
 004BF425    mov         eax,dword ptr [esi+944]
 004BF42B    mov         ecx,dword ptr [eax]
 004BF42D    call        dword ptr [ecx+34]
 004BF430    dec         edi
>004BF431    jne         004BF420
 004BF433    dec         dword ptr [ebp-4]
>004BF436    jne         004BF41B
 004BF438    mov         eax,esi
 004BF43A    call        004C4790
 004BF43F    and         eax,0FF
 004BF444    test        eax,eax
>004BF446    jle         004BF468
 004BF448    mov         dword ptr [ebp-4],eax
 004BF44B    mov         ebx,0E
 004BF450    mov         edx,4BF540;'1'
 004BF455    mov         eax,dword ptr [esi+940]
 004BF45B    mov         ecx,dword ptr [eax]
 004BF45D    call        dword ptr [ecx+34]
 004BF460    dec         ebx
>004BF461    jne         004BF450
 004BF463    dec         dword ptr [ebp-4]
>004BF466    jne         004BF44B
 004BF468    lea         eax,[ebp-220]
 004BF46E    lea         edx,[ebp-104]
 004BF474    call        @LStrFromString
 004BF479    mov         eax,dword ptr [ebp-220]
 004BF47F    call        004BA3F8
 004BF484    mov         edx,dword ptr [eax]
 004BF486    call        dword ptr [edx+14]
 004BF489    test        eax,eax
>004BF48B    jle         004BF4C9
 004BF48D    mov         dword ptr [ebp-4],eax
 004BF490    mov         edi,32
 004BF495    xor         edx,edx
 004BF497    mov         eax,dword ptr [esi+928]
 004BF49D    mov         ecx,dword ptr [eax]
 004BF49F    call        dword ptr [ecx+34]
 004BF4A2    mov         eax,esi
 004BF4A4    call        004C8AE8
 004BF4A9    xor         ebx,ebx
 004BF4AB    mov         bl,al
 004BF4AD    test        ebx,ebx
>004BF4AF    jle         004BF4C1
 004BF4B1    xor         edx,edx
 004BF4B3    mov         eax,dword ptr [esi+92C]
 004BF4B9    mov         ecx,dword ptr [eax]
 004BF4BB    call        dword ptr [ecx+34]
 004BF4BE    dec         ebx
>004BF4BF    jne         004BF4B1
 004BF4C1    dec         edi
>004BF4C2    jne         004BF495
 004BF4C4    dec         dword ptr [ebp-4]
>004BF4C7    jne         004BF490
 004BF4C9    mov         edi,32
 004BF4CE    xor         edx,edx
 004BF4D0    mov         eax,dword ptr [esi+930]
 004BF4D6    mov         ecx,dword ptr [eax]
 004BF4D8    call        dword ptr [ecx+34]
 004BF4DB    mov         edx,4BF540;'1'
 004BF4E0    mov         eax,dword ptr [esi+934]
 004BF4E6    mov         ecx,dword ptr [eax]
 004BF4E8    call        dword ptr [ecx+34]
 004BF4EB    xor         edx,edx
 004BF4ED    mov         eax,dword ptr [esi+938]
 004BF4F3    mov         ecx,dword ptr [eax]
 004BF4F5    call        dword ptr [ecx+34]
 004BF4F8    dec         edi
>004BF4F9    jne         004BF4CE
 004BF4FB    mov         byte ptr [esi+8],1
 004BF4FF    xor         eax,eax
 004BF501    pop         edx
 004BF502    pop         ecx
 004BF503    pop         ecx
 004BF504    mov         dword ptr fs:[eax],edx
 004BF507    push        4BF524
 004BF50C    lea         eax,[ebp-220]
 004BF512    mov         edx,7
 004BF517    call        @LStrArrayClr
 004BF51C    ret
>004BF51D    jmp         @HandleFinally
>004BF522    jmp         004BF50C
 004BF524    pop         edi
 004BF525    pop         esi
 004BF526    pop         ebx
 004BF527    mov         esp,ebp
 004BF529    pop         ebp
 004BF52A    ret
//end;*}

//004BF544
////procedure sub_004BF544(?:TFichierCdn; ?:TStringList);
//begin
{*
 004BF544    push        ebp
 004BF545    mov         ebp,esp
 004BF547    add         esp,0FFFFFFF0
 004BF54A    push        ebx
 004BF54B    push        esi
 004BF54C    push        edi
 004BF54D    xor         ecx,ecx
 004BF54F    mov         dword ptr [ebp-0C],ecx
 004BF552    mov         dword ptr [ebp-10],ecx
 004BF555    mov         dword ptr [ebp-4],edx
 004BF558    mov         esi,eax
 004BF55A    xor         eax,eax
 004BF55C    push        ebp
 004BF55D    push        4BF63B
 004BF562    push        dword ptr fs:[eax]
 004BF565    mov         dword ptr fs:[eax],esp
 004BF568    mov         eax,dword ptr [ebp-4]
 004BF56B    mov         edx,dword ptr [eax]
 004BF56D    call        dword ptr [edx+14]
 004BF570    mov         ebx,eax
 004BF572    mov         eax,esi
 004BF574    call        004BEA58
 004BF579    and         eax,0FF
 004BF57E    cmp         ebx,eax
>004BF580    jge         004BF58C
 004BF582    mov         eax,dword ptr [ebp-4]
 004BF585    mov         edx,dword ptr [eax]
 004BF587    call        dword ptr [edx+14]
>004BF58A    jmp         004BF598
 004BF58C    mov         eax,esi
 004BF58E    call        004BEA58
 004BF593    and         eax,0FF
 004BF598    mov         ebx,eax
 004BF59A    sub         ebx,1
>004BF59D    jno         004BF5A4
 004BF59F    call        @IntOver
 004BF5A4    test        ebx,ebx
>004BF5A6    jl          004BF5E8
 004BF5A8    inc         ebx
 004BF5A9    mov         dword ptr [ebp-8],0
 004BF5B0    lea         eax,[ebp-0C]
 004BF5B3    push        eax
 004BF5B4    lea         ecx,[ebp-10]
 004BF5B7    mov         edx,dword ptr [ebp-8]
 004BF5BA    mov         eax,dword ptr [ebp-4]
 004BF5BD    mov         edi,dword ptr [eax]
 004BF5BF    call        dword ptr [edi+0C]
 004BF5C2    mov         eax,dword ptr [ebp-10]
 004BF5C5    mov         ecx,0A
 004BF5CA    xor         edx,edx
 004BF5CC    call        @LStrCopy
 004BF5D1    mov         ecx,dword ptr [ebp-0C]
 004BF5D4    mov         edx,dword ptr [ebp-8]
 004BF5D7    mov         eax,dword ptr [esi+930]
 004BF5DD    mov         edi,dword ptr [eax]
 004BF5DF    call        dword ptr [edi+20]
 004BF5E2    inc         dword ptr [ebp-8]
 004BF5E5    dec         ebx
>004BF5E6    jne         004BF5B0
 004BF5E8    mov         byte ptr [esi+8],1
 004BF5EC    mov         eax,esi
 004BF5EE    call        004BE9E0
 004BF5F3    xor         ebx,ebx
 004BF5F5    mov         bl,al
 004BF5F7    test        ebx,ebx
>004BF5F9    jle         004BF620
 004BF5FB    mov         edi,1
 004BF600    mov         edx,edi
 004BF602    cmp         edx,0FF
>004BF608    jbe         004BF60F
 004BF60A    call        @BoundErr
 004BF60F    mov         cl,1
 004BF611    mov         eax,dword ptr [esi+918]
 004BF617    call        004B6E84
 004BF61C    inc         edi
 004BF61D    dec         ebx
>004BF61E    jne         004BF600
 004BF620    xor         eax,eax
 004BF622    pop         edx
 004BF623    pop         ecx
 004BF624    pop         ecx
 004BF625    mov         dword ptr fs:[eax],edx
 004BF628    push        4BF642
 004BF62D    lea         eax,[ebp-10]
 004BF630    mov         edx,2
 004BF635    call        @LStrArrayClr
 004BF63A    ret
>004BF63B    jmp         @HandleFinally
>004BF640    jmp         004BF62D
 004BF642    pop         edi
 004BF643    pop         esi
 004BF644    pop         ebx
 004BF645    mov         esp,ebp
 004BF647    pop         ebp
 004BF648    ret
*}
//end;

//004BF64C
////procedure sub_004BF64C(?:TFichierCdn; ?:TStringList);
//begin
{*
 004BF64C    push        ebx
 004BF64D    push        esi
 004BF64E    push        edi
 004BF64F    push        ebp
 004BF650    push        ecx
 004BF651    mov         dword ptr [esp],edx
 004BF654    mov         esi,eax
 004BF656    mov         edx,dword ptr [esp]
 004BF659    mov         eax,dword ptr [esi+91C]
 004BF65F    call        004B70B0
 004BF664    mov         eax,dword ptr [esi+944]
 004BF66A    mov         edx,dword ptr [eax]
 004BF66C    call        dword ptr [edx+40]
 004BF66F    mov         eax,esi
 004BF671    call        004BE9E0
 004BF676    and         eax,0FF
 004BF67B    imul        edi,eax,2
>004BF67E    jno         004BF685
 004BF680    call        @IntOver
 004BF685    test        edi,edi
>004BF687    jle         004BF6A4
 004BF689    mov         ebx,32
 004BF68E    mov         edx,4BF7EC;'1'
 004BF693    mov         eax,dword ptr [esi+944]
 004BF699    mov         ecx,dword ptr [eax]
 004BF69B    call        dword ptr [ecx+34]
 004BF69E    dec         ebx
>004BF69F    jne         004BF68E
 004BF6A1    dec         edi
>004BF6A2    jne         004BF689
 004BF6A4    mov         eax,dword ptr [esi+940]
 004BF6AA    mov         edx,dword ptr [eax]
 004BF6AC    call        dword ptr [edx+40]
 004BF6AF    mov         eax,esi
 004BF6B1    call        004C4790
 004BF6B6    mov         edi,eax
 004BF6B8    and         edi,0FF
 004BF6BE    test        edi,edi
>004BF6C0    jle         004BF6DD
 004BF6C2    mov         ebx,0E
 004BF6C7    mov         edx,4BF7EC;'1'
 004BF6CC    mov         eax,dword ptr [esi+940]
 004BF6D2    mov         ecx,dword ptr [eax]
 004BF6D4    call        dword ptr [ecx+34]
 004BF6D7    dec         ebx
>004BF6D8    jne         004BF6C7
 004BF6DA    dec         edi
>004BF6DB    jne         004BF6C2
 004BF6DD    mov         eax,dword ptr [esi+928]
 004BF6E3    mov         edx,dword ptr [eax]
 004BF6E5    call        dword ptr [edx+40]
 004BF6E8    mov         eax,dword ptr [esi+92C]
 004BF6EE    mov         edx,dword ptr [eax]
 004BF6F0    call        dword ptr [edx+40]
 004BF6F3    mov         eax,dword ptr [esi+930]
 004BF6F9    mov         edx,dword ptr [eax]
 004BF6FB    call        dword ptr [edx+40]
 004BF6FE    mov         eax,dword ptr [esi+938]
 004BF704    mov         edx,dword ptr [eax]
 004BF706    call        dword ptr [edx+40]
 004BF709    mov         eax,dword ptr [esi+934]
 004BF70F    mov         edx,dword ptr [eax]
 004BF711    call        dword ptr [edx+40]
 004BF714    mov         eax,esi
 004BF716    call        004BE9E0
 004BF71B    mov         edi,eax
 004BF71D    and         edi,0FF
 004BF723    test        edi,edi
>004BF725    jle         004BF767
 004BF727    mov         eax,dword ptr [esp]
 004BF72A    mov         edx,dword ptr [eax]
 004BF72C    call        dword ptr [edx+14]
 004BF72F    mov         ebp,eax
 004BF731    test        ebp,ebp
>004BF733    jle         004BF764
 004BF735    xor         edx,edx
 004BF737    mov         eax,dword ptr [esi+928]
 004BF73D    mov         ecx,dword ptr [eax]
 004BF73F    call        dword ptr [ecx+34]
 004BF742    mov         eax,esi
 004BF744    call        004C8AE8
 004BF749    xor         ebx,ebx
 004BF74B    mov         bl,al
 004BF74D    test        ebx,ebx
>004BF74F    jle         004BF761
 004BF751    xor         edx,edx
 004BF753    mov         eax,dword ptr [esi+92C]
 004BF759    mov         ecx,dword ptr [eax]
 004BF75B    call        dword ptr [ecx+34]
 004BF75E    dec         ebx
>004BF75F    jne         004BF751
 004BF761    dec         ebp
>004BF762    jne         004BF735
 004BF764    dec         edi
>004BF765    jne         004BF727
 004BF767    mov         eax,dword ptr [esp]
 004BF76A    mov         edx,dword ptr [eax]
 004BF76C    call        dword ptr [edx+14]
 004BF76F    mov         edi,eax
 004BF771    test        edi,edi
>004BF773    jle         004BF7A2
 004BF775    xor         edx,edx
 004BF777    mov         eax,dword ptr [esi+930]
 004BF77D    mov         ecx,dword ptr [eax]
 004BF77F    call        dword ptr [ecx+34]
 004BF782    mov         edx,4BF7EC;'1'
 004BF787    mov         eax,dword ptr [esi+934]
 004BF78D    mov         ecx,dword ptr [eax]
 004BF78F    call        dword ptr [ecx+34]
 004BF792    xor         edx,edx
 004BF794    mov         eax,dword ptr [esi+938]
 004BF79A    mov         ecx,dword ptr [eax]
 004BF79C    call        dword ptr [ecx+34]
 004BF79F    dec         edi
>004BF7A0    jne         004BF775
 004BF7A2    mov         byte ptr [esi+8],1
 004BF7A6    mov         eax,esi
 004BF7A8    call        004BE9E0
 004BF7AD    mov         edi,eax
 004BF7AF    and         edi,0FF
 004BF7B5    test        edi,edi
>004BF7B7    jle         004BF7DE
 004BF7B9    mov         ebx,1
 004BF7BE    mov         edx,ebx
 004BF7C0    cmp         edx,0FF
>004BF7C6    jbe         004BF7CD
 004BF7C8    call        @BoundErr
 004BF7CD    mov         cl,1
 004BF7CF    mov         eax,dword ptr [esi+918]
 004BF7D5    call        004B6E84
 004BF7DA    inc         ebx
 004BF7DB    dec         edi
>004BF7DC    jne         004BF7BE
 004BF7DE    pop         edx
 004BF7DF    pop         ebp
 004BF7E0    pop         edi
 004BF7E1    pop         esi
 004BF7E2    pop         ebx
 004BF7E3    ret
*}
//end;

//004BF7F0
{*////procedure sub_004BF7F0(?:TFichierCdn; ?:Integer; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004BF7F0    push        ebp
 004BF7F1    mov         ebp,esp
 004BF7F3    add         esp,0FFFFF8D4
 004BF7F9    push        ebx
 004BF7FA    push        esi
 004BF7FB    push        edi
 004BF7FC    xor         ebx,ebx
 004BF7FE    mov         dword ptr [ebp-72C],ebx
 004BF804    mov         dword ptr [ebp-728],ebx
 004BF80A    mov         dword ptr [ebp-724],ebx
 004BF810    mov         dword ptr [ebp-720],ebx
 004BF816    mov         dword ptr [ebp-71C],ebx
 004BF81C    mov         dword ptr [ebp-718],ebx
 004BF822    mov         dword ptr [ebp-714],ebx
 004BF828    mov         esi,dword ptr [ebp+0C]
 004BF82B    lea         edi,[ebp-710]
 004BF831    push        ecx
 004BF832    xor         ecx,ecx
 004BF834    mov         cl,byte ptr [esi]
 004BF836    inc         ecx
 004BF837    rep movs    byte ptr [edi],byte ptr [esi]
 004BF839    pop         ecx
 004BF83A    mov         esi,dword ptr [ebp+10]
 004BF83D    lea         edi,[ebp-610]
 004BF843    push        ecx
 004BF844    xor         ecx,ecx
 004BF846    mov         cl,byte ptr [esi]
 004BF848    inc         ecx
 004BF849    rep movs    byte ptr [edi],byte ptr [esi]
 004BF84B    pop         ecx
 004BF84C    mov         esi,dword ptr [ebp+14]
 004BF84F    lea         edi,[ebp-510]
 004BF855    push        ecx
 004BF856    xor         ecx,ecx
 004BF858    mov         cl,byte ptr [esi]
 004BF85A    inc         ecx
 004BF85B    rep movs    byte ptr [edi],byte ptr [esi]
 004BF85D    pop         ecx
 004BF85E    mov         esi,dword ptr [ebp+18]
 004BF861    lea         edi,[ebp-410]
 004BF867    push        ecx
 004BF868    xor         ecx,ecx
 004BF86A    mov         cl,byte ptr [esi]
 004BF86C    inc         ecx
 004BF86D    rep movs    byte ptr [edi],byte ptr [esi]
 004BF86F    pop         ecx
 004BF870    mov         esi,dword ptr [ebp+1C]
 004BF873    lea         edi,[ebp-310]
 004BF879    push        ecx
 004BF87A    xor         ecx,ecx
 004BF87C    mov         cl,byte ptr [esi]
 004BF87E    inc         ecx
 004BF87F    rep movs    byte ptr [edi],byte ptr [esi]
 004BF881    pop         ecx
 004BF882    mov         esi,dword ptr [ebp+20]
 004BF885    lea         edi,[ebp-210]
 004BF88B    push        ecx
 004BF88C    xor         ecx,ecx
 004BF88E    mov         cl,byte ptr [esi]
 004BF890    inc         ecx
 004BF891    rep movs    byte ptr [edi],byte ptr [esi]
 004BF893    pop         ecx
 004BF894    mov         esi,ecx
 004BF896    lea         edi,[ebp-110]
 004BF89C    xor         ecx,ecx
 004BF89E    mov         cl,byte ptr [esi]
 004BF8A0    inc         ecx
 004BF8A1    rep movs    byte ptr [edi],byte ptr [esi]
 004BF8A3    mov         byte ptr [ebp-1],dl
 004BF8A6    mov         edi,eax
 004BF8A8    xor         eax,eax
 004BF8AA    push        ebp
 004BF8AB    push        4BFC1C
 004BF8B0    push        dword ptr fs:[eax]
 004BF8B3    mov         dword ptr fs:[eax],esp
 004BF8B6    mov         eax,dword ptr [edi+924]
 004BF8BC    mov         dword ptr [ebp-10],eax
 004BF8BF    xor         eax,eax
 004BF8C1    mov         dword ptr [ebp-0C],eax
 004BF8C4    mov         eax,edi
 004BF8C6    call        004BE9E0
 004BF8CB    mov         esi,eax
 004BF8CD    and         esi,0FF
 004BF8D3    test        esi,esi
>004BF8D5    jle         004BF905
 004BF8D7    mov         ebx,1
 004BF8DC    mov         edx,ebx
 004BF8DE    cmp         edx,0FF
>004BF8E4    jbe         004BF8EB
 004BF8E6    call        @BoundErr
 004BF8EB    mov         eax,edi
 004BF8ED    call        004BEAD0
 004BF8F2    and         eax,0FF
 004BF8F7    add         dword ptr [ebp-0C],eax
>004BF8FA    jno         004BF901
 004BF8FC    call        @IntOver
 004BF901    inc         ebx
 004BF902    dec         esi
>004BF903    jne         004BF8DC
 004BF905    mov         edx,dword ptr [ebp-0C]
 004BF908    add         edx,1
>004BF90B    jno         004BF912
 004BF90D    call        @IntOver
 004BF912    mov         eax,dword ptr [ebp-10]
 004BF915    call        TCustomGrid.SetColCount
 004BF91A    mov         eax,edi
 004BF91C    call        004BEA58
 004BF921    xor         edx,edx
 004BF923    mov         dl,al
 004BF925    mov         eax,[00616030];^gvar_00617902
 004BF92A    movzx       eax,byte ptr [eax]
 004BF92D    add         edx,eax
>004BF92F    jno         004BF936
 004BF931    call        @IntOver
 004BF936    mov         eax,dword ptr [ebp-10]
 004BF939    call        TCustomGrid.SetRowCount
 004BF93E    xor         eax,eax
 004BF940    mov         dword ptr [ebp-8],eax
 004BF943    movzx       esi,byte ptr [ebp-1]
 004BF947    test        esi,esi
>004BF949    jle         004BF979
 004BF94B    mov         ebx,1
 004BF950    mov         edx,ebx
 004BF952    cmp         edx,0FF
>004BF958    jbe         004BF95F
 004BF95A    call        @BoundErr
 004BF95F    mov         eax,edi
 004BF961    call        004BEAD0
 004BF966    and         eax,0FF
 004BF96B    add         dword ptr [ebp-8],eax
>004BF96E    jno         004BF975
 004BF970    call        @IntOver
 004BF975    inc         ebx
 004BF976    dec         esi
>004BF977    jne         004BF950
 004BF979    cmp         dword ptr [ebp-8],0
>004BF97D    jle         004BF9B0
 004BF97F    mov         ebx,dword ptr [ebp-0C]
 004BF982    mov         esi,dword ptr [ebp-8]
 004BF985    sub         esi,ebx
>004BF987    jg          004BF9DD
 004BF989    dec         esi
 004BF98A    mov         edx,ebx
 004BF98C    sub         edx,1
>004BF98F    jno         004BF996
 004BF991    call        @IntOver
 004BF996    mov         eax,dword ptr [ebp-10]
 004BF999    call        TStringGrid.GetCols
 004BF99E    mov         ecx,eax
 004BF9A0    mov         edx,ebx
 004BF9A2    mov         eax,dword ptr [ebp-10]
 004BF9A5    call        TStringGrid.SetCols
 004BF9AA    dec         ebx
 004BF9AB    inc         esi
>004BF9AC    jne         004BF98A
>004BF9AE    jmp         004BF9DD
 004BF9B0    mov         ebx,dword ptr [ebp-0C]
 004BF9B3    cmp         ebx,1
>004BF9B6    jl          004BF9DD
 004BF9B8    mov         edx,ebx
 004BF9BA    sub         edx,1
>004BF9BD    jno         004BF9C4
 004BF9BF    call        @IntOver
 004BF9C4    mov         eax,dword ptr [ebp-10]
 004BF9C7    call        TStringGrid.GetCols
 004BF9CC    mov         ecx,eax
 004BF9CE    mov         edx,ebx
 004BF9D0    mov         eax,dword ptr [ebp-10]
 004BF9D3    call        TStringGrid.SetCols
 004BF9D8    dec         ebx
 004BF9D9    test        ebx,ebx
>004BF9DB    jne         004BF9B8
 004BF9DD    mov         edx,dword ptr [ebp-8]
 004BF9E0    mov         eax,dword ptr [ebp-10]
 004BF9E3    call        TStringGrid.GetCols
 004BF9E8    mov         edx,dword ptr [eax]
 004BF9EA    call        dword ptr [edx+40];TStrings.Clear
 004BF9ED    lea         eax,[ebp-714]
 004BF9F3    lea         edx,[ebp-110]
 004BF9F9    call        @LStrFromString
 004BF9FE    mov         eax,dword ptr [ebp-714]
 004BFA04    push        eax
 004BFA05    xor         ecx,ecx
 004BFA07    mov         edx,dword ptr [ebp-8]
 004BFA0A    mov         eax,dword ptr [ebp-10]
 004BFA0D    call        TStringGrid.SetCells
 004BFA12    mov         eax,edi
 004BFA14    call        004BEA58
 004BFA19    xor         ebx,ebx
 004BFA1B    mov         bl,al
 004BFA1D    lea         eax,[ebp-718]
 004BFA23    lea         edx,[ebp-210]
 004BFA29    call        @LStrFromString
 004BFA2E    mov         eax,dword ptr [ebp-718]
 004BFA34    push        eax
 004BFA35    mov         ecx,dword ptr ds:[615B30];^gvar_006178FB
 004BFA3B    movzx       ecx,byte ptr [ecx]
 004BFA3E    add         ecx,ebx
>004BFA40    jno         004BFA47
 004BFA42    call        @IntOver
 004BFA47    mov         edx,dword ptr [ebp-8]
 004BFA4A    mov         eax,dword ptr [ebp-10]
 004BFA4D    call        TStringGrid.SetCells
 004BFA52    lea         eax,[ebp-71C]
 004BFA58    lea         edx,[ebp-310]
 004BFA5E    call        @LStrFromString
 004BFA63    mov         eax,dword ptr [ebp-71C]
 004BFA69    push        eax
 004BFA6A    mov         ecx,dword ptr ds:[615B2C];^gvar_006178FC
 004BFA70    movzx       ecx,byte ptr [ecx]
 004BFA73    add         ecx,ebx
>004BFA75    jno         004BFA7C
 004BFA77    call        @IntOver
 004BFA7C    mov         edx,dword ptr [ebp-8]
 004BFA7F    mov         eax,dword ptr [ebp-10]
 004BFA82    call        TStringGrid.SetCells
 004BFA87    lea         eax,[ebp-720]
 004BFA8D    lea         edx,[ebp-410]
 004BFA93    call        @LStrFromString
 004BFA98    mov         eax,dword ptr [ebp-720]
 004BFA9E    push        eax
 004BFA9F    mov         ecx,dword ptr ds:[615BF0];^gvar_006178FD
 004BFAA5    movzx       ecx,byte ptr [ecx]
 004BFAA8    add         ecx,ebx
>004BFAAA    jno         004BFAB1
 004BFAAC    call        @IntOver
 004BFAB1    mov         edx,dword ptr [ebp-8]
 004BFAB4    mov         eax,dword ptr [ebp-10]
 004BFAB7    call        TStringGrid.SetCells
 004BFABC    lea         eax,[ebp-724]
 004BFAC2    lea         edx,[ebp-510]
 004BFAC8    call        @LStrFromString
 004BFACD    mov         eax,dword ptr [ebp-724]
 004BFAD3    push        eax
 004BFAD4    mov         ecx,dword ptr ds:[61618C];^gvar_006178FE
 004BFADA    movzx       ecx,byte ptr [ecx]
 004BFADD    add         ecx,ebx
>004BFADF    jno         004BFAE6
 004BFAE1    call        @IntOver
 004BFAE6    mov         edx,dword ptr [ebp-8]
 004BFAE9    mov         eax,dword ptr [ebp-10]
 004BFAEC    call        TStringGrid.SetCells
 004BFAF1    lea         eax,[ebp-728]
 004BFAF7    lea         edx,[ebp-610]
 004BFAFD    call        @LStrFromString
 004BFB02    mov         eax,dword ptr [ebp-728]
 004BFB08    push        eax
 004BFB09    mov         ecx,dword ptr ds:[615D80];^gvar_006178FF
 004BFB0F    movzx       ecx,byte ptr [ecx]
 004BFB12    add         ecx,ebx
>004BFB14    jno         004BFB1B
 004BFB16    call        @IntOver
 004BFB1B    mov         edx,dword ptr [ebp-8]
 004BFB1E    mov         eax,dword ptr [ebp-10]
 004BFB21    call        TStringGrid.SetCells
 004BFB26    lea         eax,[ebp-72C]
 004BFB2C    lea         edx,[ebp-710]
 004BFB32    call        @LStrFromString
 004BFB37    mov         eax,dword ptr [ebp-72C]
 004BFB3D    push        eax
 004BFB3E    mov         ecx,dword ptr ds:[6162DC];^gvar_00617900
 004BFB44    movzx       ecx,byte ptr [ecx]
 004BFB47    add         ecx,ebx
>004BFB49    jno         004BFB50
 004BFB4B    call        @IntOver
 004BFB50    mov         edx,dword ptr [ebp-8]
 004BFB53    mov         eax,dword ptr [ebp-10]
 004BFB56    call        TStringGrid.SetCells
 004BFB5B    cmp         byte ptr [ebp+8],0
>004BFB5F    je          004BFB85
 004BFB61    push        4BFC34;'Oral'
 004BFB66    mov         ecx,dword ptr ds:[6162F0];^gvar_00617901
 004BFB6C    movzx       ecx,byte ptr [ecx]
 004BFB6F    add         ecx,ebx
>004BFB71    jno         004BFB78
 004BFB73    call        @IntOver
 004BFB78    mov         edx,dword ptr [ebp-8]
 004BFB7B    mov         eax,dword ptr [ebp-10]
 004BFB7E    call        TStringGrid.SetCells
>004BFB83    jmp         004BFBA7
 004BFB85    push        4BFC44;'Ecrit'
 004BFB8A    mov         ecx,dword ptr ds:[6162F0];^gvar_00617901
 004BFB90    movzx       ecx,byte ptr [ecx]
 004BFB93    add         ecx,ebx
>004BFB95    jno         004BFB9C
 004BFB97    call        @IntOver
 004BFB9C    mov         edx,dword ptr [ebp-8]
 004BFB9F    mov         eax,dword ptr [ebp-10]
 004BFBA2    call        TStringGrid.SetCells
 004BFBA7    mov         dl,byte ptr [ebp-1]
 004BFBAA    mov         eax,edi
 004BFBAC    call        004C0070
 004BFBB1    mov         byte ptr [edi+8],1
 004BFBB5    mov         eax,dword ptr [edi+918]
 004BFBBB    mov         cl,1
 004BFBBD    mov         dl,byte ptr [ebp-1]
 004BFBC0    call        004B6E84
 004BFBC5    mov         eax,dword ptr [edi+940]
 004BFBCB    mov         edx,dword ptr [eax]
 004BFBCD    call        dword ptr [edx+40]
 004BFBD0    mov         eax,edi
 004BFBD2    call        004C4790
 004BFBD7    mov         esi,eax
 004BFBD9    and         esi,0FF
 004BFBDF    test        esi,esi
>004BFBE1    jle         004BFBFE
 004BFBE3    mov         ebx,0E
 004BFBE8    mov         eax,dword ptr [edi+940]
 004BFBEE    mov         edx,4BFC54;'1'
 004BFBF3    mov         ecx,dword ptr [eax]
 004BFBF5    call        dword ptr [ecx+34]
 004BFBF8    dec         ebx
>004BFBF9    jne         004BFBE8
 004BFBFB    dec         esi
>004BFBFC    jne         004BFBE3
 004BFBFE    xor         eax,eax
 004BFC00    pop         edx
 004BFC01    pop         ecx
 004BFC02    pop         ecx
 004BFC03    mov         dword ptr fs:[eax],edx
 004BFC06    push        4BFC23
 004BFC0B    lea         eax,[ebp-72C]
 004BFC11    mov         edx,7
 004BFC16    call        @LStrArrayClr
 004BFC1B    ret
>004BFC1C    jmp         @HandleFinally
>004BFC21    jmp         004BFC0B
 004BFC23    pop         edi
 004BFC24    pop         esi
 004BFC25    pop         ebx
 004BFC26    mov         esp,ebp
 004BFC28    pop         ebp
 004BFC29    ret         1C
//end;*}

//004BFC58
{*////procedure sub_004BFC58(?:dword; ?:?; ?:?);
begin
 004BFC58    push        ebx
 004BFC59    push        esi
 004BFC5A    push        edi
 004BFC5B    push        ebp
 004BFC5C    push        ecx
 004BFC5D    mov         ebx,ecx
 004BFC5F    mov         byte ptr [esp],dl
 004BFC62    mov         esi,eax
 004BFC64    mov         edi,dword ptr [esi+924]
 004BFC6A    mov         ebp,ebx
 004BFC6C    and         ebp,0FF
 004BFC72    sub         ebp,1
>004BFC75    jno         004BFC7C
 004BFC77    call        @IntOver
 004BFC7C    mov         edx,ebp
 004BFC7E    mov         eax,edi
 004BFC80    call        TStringGrid.GetCols
 004BFC85    mov         edx,dword ptr [eax]
 004BFC87    call        dword ptr [edx+40];TStrings.Clear
 004BFC8A    mov         eax,ebp
 004BFC8C    cmp         eax,0FF
>004BFC91    jbe         004BFC98
 004BFC93    call        @BoundErr
 004BFC98    mov         edx,dword ptr [edi+204]
 004BFC9E    sub         edx,2
>004BFCA1    jno         004BFCA8
 004BFCA3    call        @IntOver
 004BFCA8    cmp         edx,0FF
>004BFCAE    jbe         004BFCB5
 004BFCB0    call        @BoundErr
 004BFCB5    sub         dl,al
>004BFCB7    jb          004BFCE9
 004BFCB9    inc         edx
 004BFCBA    mov         byte ptr [esp+1],dl
 004BFCBE    mov         bl,al
 004BFCC0    xor         edx,edx
 004BFCC2    mov         dl,bl
 004BFCC4    add         edx,1
>004BFCC7    jno         004BFCCE
 004BFCC9    call        @IntOver
 004BFCCE    mov         eax,edi
 004BFCD0    call        TStringGrid.GetCols
 004BFCD5    mov         ecx,eax
 004BFCD7    xor         edx,edx
 004BFCD9    mov         dl,bl
 004BFCDB    mov         eax,edi
 004BFCDD    call        TStringGrid.SetCols
 004BFCE2    inc         ebx
 004BFCE3    dec         byte ptr [esp+1]
>004BFCE7    jne         004BFCC0
 004BFCE9    mov         edx,dword ptr [edi+204]
 004BFCEF    sub         edx,1
>004BFCF2    jno         004BFCF9
 004BFCF4    call        @IntOver
 004BFCF9    mov         eax,edi
 004BFCFB    call        TCustomGrid.SetColCount
 004BFD00    mov         dl,byte ptr [esp]
 004BFD03    mov         eax,esi
 004BFD05    call        004C0134
 004BFD0A    mov         byte ptr [esi+8],1
 004BFD0E    mov         cl,1
 004BFD10    mov         dl,byte ptr [esp]
 004BFD13    mov         eax,dword ptr [esi+918]
 004BFD19    call        004B6E84
 004BFD1E    mov         eax,dword ptr [esi+940]
 004BFD24    mov         edx,dword ptr [eax]
 004BFD26    call        dword ptr [edx+40]
 004BFD29    mov         eax,esi
 004BFD2B    call        004C4790
 004BFD30    test        al,al
>004BFD32    jbe         004BFD54
 004BFD34    mov         byte ptr [esp+1],al
 004BFD38    mov         bl,0E
 004BFD3A    mov         edx,4BFD64;'1'
 004BFD3F    mov         eax,dword ptr [esi+940]
 004BFD45    mov         ecx,dword ptr [eax]
 004BFD47    call        dword ptr [ecx+34]
 004BFD4A    dec         bl
>004BFD4C    jne         004BFD3A
 004BFD4E    dec         byte ptr [esp+1]
>004BFD52    jne         004BFD38
 004BFD54    pop         edx
 004BFD55    pop         ebp
 004BFD56    pop         edi
 004BFD57    pop         esi
 004BFD58    pop         ebx
 004BFD59    ret
//end;*}

//004BFD68
{*////procedure sub_004BFD68(?:dword; ?:?; ?:?; ?:?);
begin
 004BFD68    push        ebp
 004BFD69    mov         ebp,esp
 004BFD6B    add         esp,0FFFFF7EC
 004BFD71    push        ebx
 004BFD72    push        esi
 004BFD73    push        edi
 004BFD74    xor         ebx,ebx
 004BFD76    mov         dword ptr [ebp-814],ebx
 004BFD7C    mov         dword ptr [ebp-710],ebx
 004BFD82    mov         byte ptr [ebp-2],cl
 004BFD85    mov         byte ptr [ebp-1],dl
 004BFD88    mov         esi,eax
 004BFD8A    xor         eax,eax
 004BFD8C    push        ebp
 004BFD8D    push        4C004C
 004BFD92    push        dword ptr fs:[eax]
 004BFD95    mov         dword ptr fs:[eax],esp
 004BFD98    mov         dl,1
 004BFD9A    mov         eax,[004120B8];TStringList
 004BFD9F    call        TObject.Create;TStringList.Create
 004BFDA4    mov         dword ptr [ebp-8],eax
 004BFDA7    mov         eax,esi
 004BFDA9    call        004BEA58
 004BFDAE    test        al,al
>004BFDB0    jbe         004BFDF1
 004BFDB2    mov         byte ptr [ebp-9],al
 004BFDB5    mov         bl,1
 004BFDB7    push        ebx
 004BFDB8    lea         eax,[ebp-810]
 004BFDBE    push        eax
 004BFDBF    mov         cl,byte ptr [ebp-2]
 004BFDC2    mov         dl,byte ptr [ebp-1]
 004BFDC5    mov         eax,esi
 004BFDC7    call        004BEF5C
 004BFDCC    lea         edx,[ebp-810]
 004BFDD2    lea         eax,[ebp-710]
 004BFDD8    call        @LStrFromString
 004BFDDD    mov         edx,dword ptr [ebp-710]
 004BFDE3    mov         eax,dword ptr [ebp-8]
 004BFDE6    mov         ecx,dword ptr [eax]
 004BFDE8    call        dword ptr [ecx+34];TStringList.Add
 004BFDEB    inc         ebx
 004BFDEC    dec         byte ptr [ebp-9]
>004BFDEF    jne         004BFDB7
 004BFDF1    lea         eax,[ebp-109]
 004BFDF7    push        eax
 004BFDF8    mov         cl,byte ptr [ebp-2]
 004BFDFB    mov         dl,byte ptr [ebp-1]
 004BFDFE    mov         eax,esi
 004BFE00    call        004BED04
 004BFE05    lea         eax,[ebp-209]
 004BFE0B    push        eax
 004BFE0C    mov         cl,byte ptr [ebp-2]
 004BFE0F    mov         dl,byte ptr [ebp-1]
 004BFE12    mov         eax,esi
 004BFE14    call        004BED2C
 004BFE19    lea         eax,[ebp-309]
 004BFE1F    push        eax
 004BFE20    mov         cl,byte ptr [ebp-2]
 004BFE23    mov         dl,byte ptr [ebp-1]
 004BFE26    mov         eax,esi
 004BFE28    call        004BED7C
 004BFE2D    lea         eax,[ebp-409]
 004BFE33    push        eax
 004BFE34    mov         cl,byte ptr [ebp-2]
 004BFE37    mov         dl,byte ptr [ebp-1]
 004BFE3A    mov         eax,esi
 004BFE3C    call        004BEDCC
 004BFE41    lea         eax,[ebp-509]
 004BFE47    push        eax
 004BFE48    mov         cl,byte ptr [ebp-2]
 004BFE4B    mov         dl,byte ptr [ebp-1]
 004BFE4E    mov         eax,esi
 004BFE50    call        004BEE1C
 004BFE55    lea         eax,[ebp-609]
 004BFE5B    push        eax
 004BFE5C    mov         cl,byte ptr [ebp-2]
 004BFE5F    mov         dl,byte ptr [ebp-1]
 004BFE62    mov         eax,esi
 004BFE64    call        004BEE6C
 004BFE69    lea         eax,[ebp-709]
 004BFE6F    push        eax
 004BFE70    mov         cl,byte ptr [ebp-2]
 004BFE73    mov         dl,byte ptr [ebp-1]
 004BFE76    mov         eax,esi
 004BFE78    call        004BEEBC
 004BFE7D    lea         eax,[ebp-810]
 004BFE83    push        eax
 004BFE84    mov         cl,byte ptr [ebp-2]
 004BFE87    mov         dl,byte ptr [ebp-1]
 004BFE8A    mov         eax,esi
 004BFE8C    call        004BEF0C
 004BFE91    lea         eax,[ebp-810]
 004BFE97    mov         edx,4C005C;'Oral'
 004BFE9C    xor         ecx,ecx
 004BFE9E    mov         cl,byte ptr [eax]
 004BFEA0    inc         ecx
 004BFEA1    call        @AStrCmp
 004BFEA6    sete        al
 004BFEA9    lea         edx,[ebp-209]
 004BFEAF    push        edx
 004BFEB0    lea         edx,[ebp-309]
 004BFEB6    push        edx
 004BFEB7    lea         edx,[ebp-409]
 004BFEBD    push        edx
 004BFEBE    lea         edx,[ebp-509]
 004BFEC4    push        edx
 004BFEC5    lea         edx,[ebp-609]
 004BFECB    push        edx
 004BFECC    lea         edx,[ebp-709]
 004BFED2    push        edx
 004BFED3    push        eax
 004BFED4    lea         ecx,[ebp-109]
 004BFEDA    mov         dl,byte ptr [ebp+8]
 004BFEDD    mov         eax,esi
 004BFEDF    call        004BF7F0
 004BFEE4    mov         byte ptr [ebp-4],0
 004BFEE8    xor         eax,eax
 004BFEEA    mov         al,byte ptr [ebp-1]
 004BFEED    sub         eax,1
>004BFEF0    jno         004BFEF7
 004BFEF2    call        @IntOver
 004BFEF7    cmp         eax,0FF
>004BFEFC    jbe         004BFF03
 004BFEFE    call        @BoundErr
 004BFF03    test        al,al
>004BFF05    jbe         004BFF3D
 004BFF07    mov         byte ptr [ebp-9],al
 004BFF0A    mov         bl,1
 004BFF0C    mov         edx,ebx
 004BFF0E    mov         eax,esi
 004BFF10    call        004BEAD0
 004BFF15    and         eax,0FF
 004BFF1A    xor         edx,edx
 004BFF1C    mov         dl,byte ptr [ebp-4]
 004BFF1F    add         eax,edx
>004BFF21    jno         004BFF28
 004BFF23    call        @IntOver
 004BFF28    cmp         eax,0FF
>004BFF2D    jbe         004BFF34
 004BFF2F    call        @BoundErr
 004BFF34    mov         byte ptr [ebp-4],al
 004BFF37    inc         ebx
 004BFF38    dec         byte ptr [ebp-9]
>004BFF3B    jne         004BFF0C
 004BFF3D    xor         eax,eax
 004BFF3F    mov         al,byte ptr [ebp-2]
 004BFF42    xor         edx,edx
 004BFF44    mov         dl,byte ptr [ebp-4]
 004BFF47    add         eax,edx
>004BFF49    jno         004BFF50
 004BFF4B    call        @IntOver
 004BFF50    cmp         eax,0FF
>004BFF55    jbe         004BFF5C
 004BFF57    call        @BoundErr
 004BFF5C    mov         byte ptr [ebp-2],al
 004BFF5F    mov         cl,byte ptr [ebp-2]
 004BFF62    mov         dl,byte ptr [ebp-1]
 004BFF65    mov         eax,esi
 004BFF67    call        004BFC58
 004BFF6C    mov         dl,byte ptr [ebp+8]
 004BFF6F    mov         eax,esi
 004BFF71    call        004BEAD0
 004BFF76    mov         byte ptr [ebp-3],al
 004BFF79    mov         eax,esi
 004BFF7B    call        004BEA58
 004BFF80    test        al,al
>004BFF82    jbe         004BFFD6
 004BFF84    mov         byte ptr [ebp-9],al
 004BFF87    mov         bl,1
 004BFF89    push        ebx
 004BFF8A    lea         ecx,[ebp-814]
 004BFF90    xor         edx,edx
 004BFF92    mov         dl,bl
 004BFF94    sub         edx,1
>004BFF97    jno         004BFF9E
 004BFF99    call        @IntOver
 004BFF9E    mov         eax,dword ptr [ebp-8]
 004BFFA1    mov         edi,dword ptr [eax]
 004BFFA3    call        dword ptr [edi+0C];TStringList.Get
 004BFFA6    mov         edx,dword ptr [ebp-814]
 004BFFAC    lea         eax,[ebp-810]
 004BFFB2    mov         ecx,0FF
 004BFFB7    call        @LStrToString
 004BFFBC    lea         eax,[ebp-810]
 004BFFC2    push        eax
 004BFFC3    mov         cl,byte ptr [ebp-3]
 004BFFC6    mov         dl,byte ptr [ebp+8]
 004BFFC9    mov         eax,esi
 004BFFCB    call        004C1074
 004BFFD0    inc         ebx
 004BFFD1    dec         byte ptr [ebp-9]
>004BFFD4    jne         004BFF89
 004BFFD6    mov         byte ptr [esi+8],1
 004BFFDA    mov         cl,1
 004BFFDC    mov         dl,byte ptr [ebp-1]
 004BFFDF    mov         eax,dword ptr [esi+918]
 004BFFE5    call        004B6E84
 004BFFEA    mov         dl,1
 004BFFEC    mov         eax,dword ptr [ebp-8]
 004BFFEF    mov         ecx,dword ptr [eax]
 004BFFF1    call        dword ptr [ecx-4];TStringList.Destroy
 004BFFF4    mov         eax,dword ptr [esi+940]
 004BFFFA    mov         edx,dword ptr [eax]
 004BFFFC    call        dword ptr [edx+40]
 004BFFFF    mov         eax,esi
 004C0001    call        004C4790
 004C0006    test        al,al
>004C0008    jbe         004C0028
 004C000A    mov         byte ptr [ebp-9],al
 004C000D    mov         bl,0E
 004C000F    mov         edx,4C006C;'1'
 004C0014    mov         eax,dword ptr [esi+940]
 004C001A    mov         ecx,dword ptr [eax]
 004C001C    call        dword ptr [ecx+34]
 004C001F    dec         bl
>004C0021    jne         004C000F
 004C0023    dec         byte ptr [ebp-9]
>004C0026    jne         004C000D
 004C0028    xor         eax,eax
 004C002A    pop         edx
 004C002B    pop         ecx
 004C002C    pop         ecx
 004C002D    mov         dword ptr fs:[eax],edx
 004C0030    push        4C0053
 004C0035    lea         eax,[ebp-814]
 004C003B    call        @LStrClr
 004C0040    lea         eax,[ebp-710]
 004C0046    call        @LStrClr
 004C004B    ret
>004C004C    jmp         @HandleFinally
>004C0051    jmp         004C0035
 004C0053    pop         edi
 004C0054    pop         esi
 004C0055    pop         ebx
 004C0056    mov         esp,ebp
 004C0058    pop         ebp
 004C0059    ret         4
//end;*}

//004C0070
{*////procedure sub_004C0070(?:?; ?:?);
begin
 004C0070    push        ebp
 004C0071    mov         ebp,esp
 004C0073    push        0
 004C0075    push        0
 004C0077    push        0
 004C0079    push        ebx
 004C007A    push        esi
 004C007B    push        edi
 004C007C    mov         ebx,edx
 004C007E    mov         esi,eax
 004C0080    xor         eax,eax
 004C0082    push        ebp
 004C0083    push        4C0123
 004C0088    push        dword ptr fs:[eax]
 004C008B    mov         dword ptr fs:[eax],esp
 004C008E    lea         ecx,[ebp-8]
 004C0091    xor         edx,edx
 004C0093    mov         dl,bl
 004C0095    sub         edx,1
>004C0098    jno         004C009F
 004C009A    call        @IntOver
 004C009F    mov         eax,dword ptr [esi+920]
 004C00A5    mov         edi,dword ptr [eax]
 004C00A7    call        dword ptr [edi+0C]
 004C00AA    mov         eax,dword ptr [ebp-8]
 004C00AD    call        StrToInt
 004C00B2    cmp         eax,0FF
>004C00B7    jbe         004C00BE
 004C00B9    call        @BoundErr
 004C00BE    mov         byte ptr [ebp-1],al
 004C00C1    add         byte ptr [ebp-1],1
>004C00C5    jae         004C00CC
 004C00C7    call        @IntOver
 004C00CC    lea         edx,[ebp-0C]
 004C00CF    xor         eax,eax
 004C00D1    mov         al,byte ptr [ebp-1]
 004C00D4    call        IntToStr
 004C00D9    mov         ecx,dword ptr [ebp-0C]
 004C00DC    xor         edx,edx
 004C00DE    mov         dl,bl
 004C00E0    sub         edx,1
>004C00E3    jno         004C00EA
 004C00E5    call        @IntOver
 004C00EA    mov         eax,dword ptr [esi+920]
 004C00F0    mov         edi,dword ptr [eax]
 004C00F2    call        dword ptr [edi+20]
 004C00F5    mov         byte ptr [esi+8],1
 004C00F9    mov         cl,1
 004C00FB    mov         edx,ebx
 004C00FD    mov         eax,dword ptr [esi+918]
 004C0103    call        004B6E84
 004C0108    xor         eax,eax
 004C010A    pop         edx
 004C010B    pop         ecx
 004C010C    pop         ecx
 004C010D    mov         dword ptr fs:[eax],edx
 004C0110    push        4C012A
 004C0115    lea         eax,[ebp-0C]
 004C0118    mov         edx,2
 004C011D    call        @LStrArrayClr
 004C0122    ret
>004C0123    jmp         @HandleFinally
>004C0128    jmp         004C0115
 004C012A    pop         edi
 004C012B    pop         esi
 004C012C    pop         ebx
 004C012D    mov         esp,ebp
 004C012F    pop         ebp
 004C0130    ret
//end;*}

//004C0134
{*////procedure sub_004C0134(?:?; ?:?);
begin
 004C0134    push        ebp
 004C0135    mov         ebp,esp
 004C0137    push        0
 004C0139    push        0
 004C013B    push        0
 004C013D    push        ebx
 004C013E    push        esi
 004C013F    push        edi
 004C0140    mov         ebx,edx
 004C0142    mov         esi,eax
 004C0144    xor         eax,eax
 004C0146    push        ebp
 004C0147    push        4C01E7
 004C014C    push        dword ptr fs:[eax]
 004C014F    mov         dword ptr fs:[eax],esp
 004C0152    lea         ecx,[ebp-8]
 004C0155    xor         edx,edx
 004C0157    mov         dl,bl
 004C0159    sub         edx,1
>004C015C    jno         004C0163
 004C015E    call        @IntOver
 004C0163    mov         eax,dword ptr [esi+920]
 004C0169    mov         edi,dword ptr [eax]
 004C016B    call        dword ptr [edi+0C]
 004C016E    mov         eax,dword ptr [ebp-8]
 004C0171    call        StrToInt
 004C0176    cmp         eax,0FF
>004C017B    jbe         004C0182
 004C017D    call        @BoundErr
 004C0182    mov         byte ptr [ebp-1],al
 004C0185    sub         byte ptr [ebp-1],1
>004C0189    jae         004C0190
 004C018B    call        @IntOver
 004C0190    lea         edx,[ebp-0C]
 004C0193    xor         eax,eax
 004C0195    mov         al,byte ptr [ebp-1]
 004C0198    call        IntToStr
 004C019D    mov         ecx,dword ptr [ebp-0C]
 004C01A0    xor         edx,edx
 004C01A2    mov         dl,bl
 004C01A4    sub         edx,1
>004C01A7    jno         004C01AE
 004C01A9    call        @IntOver
 004C01AE    mov         eax,dword ptr [esi+920]
 004C01B4    mov         edi,dword ptr [eax]
 004C01B6    call        dword ptr [edi+20]
 004C01B9    mov         byte ptr [esi+8],1
 004C01BD    mov         cl,1
 004C01BF    mov         edx,ebx
 004C01C1    mov         eax,dword ptr [esi+918]
 004C01C7    call        004B6E84
 004C01CC    xor         eax,eax
 004C01CE    pop         edx
 004C01CF    pop         ecx
 004C01D0    pop         ecx
 004C01D1    mov         dword ptr fs:[eax],edx
 004C01D4    push        4C01EE
 004C01D9    lea         eax,[ebp-0C]
 004C01DC    mov         edx,2
 004C01E1    call        @LStrArrayClr
 004C01E6    ret
>004C01E7    jmp         @HandleFinally
>004C01EC    jmp         004C01D9
 004C01EE    pop         edi
 004C01EF    pop         esi
 004C01F0    pop         ebx
 004C01F1    mov         esp,ebp
 004C01F3    pop         ebp
 004C01F4    ret
//end;*}

//004C01F8
{*////procedure sub_004C01F8(?:TFichierCdn; ?:AnsiString; ?:?; ?:?; ?:?);
begin
 004C01F8    push        ebp
 004C01F9    mov         ebp,esp
 004C01FB    push        ecx
 004C01FC    mov         ecx,48
 004C0201    push        0
 004C0203    push        0
 004C0205    dec         ecx
>004C0206    jne         004C0201
 004C0208    push        ecx
 004C0209    xchg        ecx,dword ptr [ebp-4]
 004C020C    push        ebx
 004C020D    push        esi
 004C020E    push        edi
 004C020F    mov         esi,dword ptr [ebp+0C]
 004C0212    lea         edi,[ebp-117]
 004C0218    push        ecx
 004C0219    xor         ecx,ecx
 004C021B    mov         cl,byte ptr [esi]
 004C021D    inc         ecx
 004C021E    rep movs    byte ptr [edi],byte ptr [esi]
 004C0220    pop         ecx
 004C0221    mov         byte ptr [ebp-5],cl
 004C0224    mov         dword ptr [ebp-4],edx
 004C0227    mov         esi,eax
 004C0229    mov         eax,dword ptr [ebp-4]
 004C022C    call        @LStrAddRef
 004C0231    xor         eax,eax
 004C0233    push        ebp
 004C0234    push        4C0BA4
 004C0239    push        dword ptr fs:[eax]
 004C023C    mov         dword ptr fs:[eax],esp
 004C023F    xor         eax,eax
 004C0241    push        ebp
 004C0242    push        4C0B3F
 004C0247    push        dword ptr fs:[eax]
 004C024A    mov         dword ptr fs:[eax],esp
 004C024D    lea         edx,[ebp-218]
 004C0253    mov         eax,esi
 004C0255    call        004C8B54
 004C025A    lea         eax,[ebp-218]
 004C0260    mov         edx,4C0BB4;'Bulletins par défaut'
 004C0265    xor         ecx,ecx
 004C0267    mov         cl,byte ptr [eax]
 004C0269    inc         ecx
 004C026A    call        @AStrCmp
>004C026F    je          004C0275
 004C0271    mov         byte ptr [ebp+8],0
 004C0275    call        004BA2FC
 004C027A    test        al,al
>004C027C    je          004C029F
 004C027E    lea         ecx,[ebp-21C]
 004C0284    mov         edx,4C0BD4;'.bak'
 004C0289    mov         eax,dword ptr [ebp-4]
 004C028C    call        ChangeFileExt
 004C0291    mov         edx,dword ptr [ebp-21C]
 004C0297    mov         eax,dword ptr [ebp-4]
 004C029A    call        RenameFile
 004C029F    push        0FFFF
 004C02A4    mov         ecx,dword ptr [ebp-4]
 004C02A7    mov         dl,1
 004C02A9    mov         eax,[004B6904];TFluxCdn
 004C02AE    call        TFileStream.Create;TFluxCdn.Create
 004C02B3    mov         ebx,eax
 004C02B5    cmp         byte ptr [ebp-5],0
>004C02B9    je          004C02C9
 004C02BB    mov         edx,ebx
 004C02BD    mov         eax,esi
 004C02BF    call        004BE5E0
>004C02C4    jmp         004C0B20
 004C02C9    cmp         byte ptr [ebp-117],0
>004C02D0    jne         004C02FD
 004C02D2    mov         eax,esi
 004C02D4    call        004C6680
 004C02D9    test        al,al
>004C02DB    je          004C02ED
 004C02DD    mov         cl,1
 004C02DF    mov         edx,4C0BDC;'Carnet de notes'
 004C02E4    mov         eax,ebx
 004C02E6    call        004B6A80
>004C02EB    jmp         004C030C
 004C02ED    mov         cl,1
 004C02EF    mov         edx,4C0BEC;'Carnet de Notes'
 004C02F4    mov         eax,ebx
 004C02F6    call        004B6A80
>004C02FB    jmp         004C030C
 004C02FD    mov         cl,1
 004C02FF    lea         edx,[ebp-117]
 004C0305    mov         eax,ebx
 004C0307    call        004B6A80
 004C030C    mov         cl,1
 004C030E    mov         edx,4C0BFC;'2.3'
 004C0313    mov         eax,ebx
 004C0315    call        004B6A80
 004C031A    lea         edx,[ebp-218]
 004C0320    mov         eax,esi
 004C0322    call        004C3908
 004C0327    lea         edx,[ebp-218]
 004C032D    mov         cl,1
 004C032F    mov         eax,ebx
 004C0331    call        004B6A80
 004C0336    lea         edx,[ebp-218]
 004C033C    mov         eax,esi
 004C033E    call        004BE8FC
 004C0343    lea         edx,[ebp-218]
 004C0349    mov         cl,1
 004C034B    mov         eax,ebx
 004C034D    call        004B6A80
 004C0352    lea         edx,[ebp-218]
 004C0358    mov         eax,esi
 004C035A    call        004BE914
 004C035F    lea         edx,[ebp-218]
 004C0365    mov         cl,1
 004C0367    mov         eax,ebx
 004C0369    call        004B6A80
 004C036E    lea         edx,[ebp-218]
 004C0374    mov         eax,esi
 004C0376    call        004BE92C
 004C037B    lea         edx,[ebp-218]
 004C0381    mov         cl,1
 004C0383    mov         eax,ebx
 004C0385    call        004B6A80
 004C038A    lea         edx,[ebp-218]
 004C0390    mov         eax,esi
 004C0392    call        004BE944
 004C0397    lea         edx,[ebp-218]
 004C039D    mov         cl,1
 004C039F    mov         eax,ebx
 004C03A1    call        004B6A80
 004C03A6    lea         edx,[ebp-218]
 004C03AC    mov         eax,esi
 004C03AE    call        004BE95C
 004C03B3    lea         edx,[ebp-218]
 004C03B9    mov         cl,1
 004C03BB    mov         eax,ebx
 004C03BD    call        004B6A80
 004C03C2    lea         edx,[ebp-218]
 004C03C8    mov         eax,esi
 004C03CA    call        004BE988
 004C03CF    lea         edx,[ebp-218]
 004C03D5    mov         cl,1
 004C03D7    mov         eax,ebx
 004C03D9    call        004B6A80
 004C03DE    mov         eax,esi
 004C03E0    call        004BE9E0
 004C03E5    and         eax,0FF
 004C03EA    lea         edx,[ebp-220]
 004C03F0    call        IntToStr
 004C03F5    mov         edx,dword ptr [ebp-220]
 004C03FB    lea         eax,[ebp-218]
 004C0401    mov         ecx,0FF
 004C0406    call        @LStrToString
 004C040B    lea         edx,[ebp-218]
 004C0411    mov         cl,1
 004C0413    mov         eax,ebx
 004C0415    call        004B6A80
 004C041A    mov         eax,esi
 004C041C    call        004BE9E0
 004C0421    test        al,al
>004C0423    jbe         004C0453
 004C0425    mov         byte ptr [ebp-15],al
 004C0428    mov         byte ptr [ebp-6],1
 004C042C    lea         ecx,[ebp-218]
 004C0432    mov         dl,byte ptr [ebp-6]
 004C0435    mov         eax,esi
 004C0437    call        004BE9EC
 004C043C    lea         edx,[ebp-218]
 004C0442    mov         cl,1
 004C0444    mov         eax,ebx
 004C0446    call        004B6A80
 004C044B    inc         byte ptr [ebp-6]
 004C044E    dec         byte ptr [ebp-15]
>004C0451    jne         004C042C
 004C0453    mov         eax,esi
 004C0455    call        004BEA58
 004C045A    and         eax,0FF
 004C045F    lea         edx,[ebp-224]
 004C0465    call        IntToStr
 004C046A    mov         edx,dword ptr [ebp-224]
 004C0470    lea         eax,[ebp-218]
 004C0476    mov         ecx,0FF
 004C047B    call        @LStrToString
 004C0480    lea         edx,[ebp-218]
 004C0486    mov         cl,1
 004C0488    mov         eax,ebx
 004C048A    call        004B6A80
 004C048F    mov         eax,esi
 004C0491    call        004BEA58
 004C0496    test        al,al
>004C0498    jbe         004C04C8
 004C049A    mov         byte ptr [ebp-15],al
 004C049D    mov         byte ptr [ebp-6],1
 004C04A1    lea         ecx,[ebp-218]
 004C04A7    mov         dl,byte ptr [ebp-6]
 004C04AA    mov         eax,esi
 004C04AC    call        004BEA64
 004C04B1    lea         edx,[ebp-218]
 004C04B7    mov         cl,1
 004C04B9    mov         eax,ebx
 004C04BB    call        004B6A80
 004C04C0    inc         byte ptr [ebp-6]
 004C04C3    dec         byte ptr [ebp-15]
>004C04C6    jne         004C04A1
 004C04C8    mov         eax,esi
 004C04CA    call        004BE9E0
 004C04CF    test        al,al
>004C04D1    jbe         004C06BE
 004C04D7    mov         byte ptr [ebp-15],al
 004C04DA    mov         byte ptr [ebp-6],1
 004C04DE    mov         dl,byte ptr [ebp-6]
 004C04E1    mov         eax,esi
 004C04E3    call        004BEAD0
 004C04E8    and         eax,0FF
 004C04ED    lea         edx,[ebp-228]
 004C04F3    call        IntToStr
 004C04F8    mov         edx,dword ptr [ebp-228]
 004C04FE    lea         eax,[ebp-218]
 004C0504    mov         ecx,0FF
 004C0509    call        @LStrToString
 004C050E    lea         edx,[ebp-218]
 004C0514    mov         cl,1
 004C0516    mov         eax,ebx
 004C0518    call        004B6A80
 004C051D    mov         dl,byte ptr [ebp-6]
 004C0520    mov         eax,esi
 004C0522    call        004BEAD0
 004C0527    test        al,al
>004C0529    jbe         004C06B2
 004C052F    mov         byte ptr [ebp-16],al
 004C0532    mov         byte ptr [ebp-7],1
 004C0536    lea         eax,[ebp-218]
 004C053C    push        eax
 004C053D    mov         cl,byte ptr [ebp-7]
 004C0540    mov         dl,byte ptr [ebp-6]
 004C0543    mov         eax,esi
 004C0545    call        004BED04
 004C054A    lea         edx,[ebp-218]
 004C0550    mov         cl,1
 004C0552    mov         eax,ebx
 004C0554    call        004B6A80
 004C0559    mov         eax,esi
 004C055B    call        004BEA58
 004C0560    test        al,al
>004C0562    jbe         004C059A
 004C0564    mov         byte ptr [ebp-17],al
 004C0567    mov         byte ptr [ebp-8],1
 004C056B    mov         al,byte ptr [ebp-8]
 004C056E    push        eax
 004C056F    lea         eax,[ebp-218]
 004C0575    push        eax
 004C0576    mov         cl,byte ptr [ebp-7]
 004C0579    mov         dl,byte ptr [ebp-6]
 004C057C    mov         eax,esi
 004C057E    call        004BEF5C
 004C0583    lea         edx,[ebp-218]
 004C0589    mov         cl,1
 004C058B    mov         eax,ebx
 004C058D    call        004B6A80
 004C0592    inc         byte ptr [ebp-8]
 004C0595    dec         byte ptr [ebp-17]
>004C0598    jne         004C056B
 004C059A    mov         byte ptr [ebp-8],9
 004C059E    mov         cl,1
 004C05A0    mov         edx,4C0C00;'
 004C05A5    mov         eax,ebx
 004C05A7    call        004B6A80
 004C05AC    dec         byte ptr [ebp-8]
>004C05AF    jne         004C059E
 004C05B1    lea         eax,[ebp-218]
 004C05B7    push        eax
 004C05B8    mov         cl,byte ptr [ebp-7]
 004C05BB    mov         dl,byte ptr [ebp-6]
 004C05BE    mov         eax,esi
 004C05C0    call        004BED2C
 004C05C5    lea         edx,[ebp-218]
 004C05CB    mov         cl,1
 004C05CD    mov         eax,ebx
 004C05CF    call        004B6A80
 004C05D4    lea         eax,[ebp-218]
 004C05DA    push        eax
 004C05DB    mov         cl,byte ptr [ebp-7]
 004C05DE    mov         dl,byte ptr [ebp-6]
 004C05E1    mov         eax,esi
 004C05E3    call        004BED7C
 004C05E8    lea         edx,[ebp-218]
 004C05EE    mov         cl,1
 004C05F0    mov         eax,ebx
 004C05F2    call        004B6A80
 004C05F7    lea         eax,[ebp-218]
 004C05FD    push        eax
 004C05FE    mov         cl,byte ptr [ebp-7]
 004C0601    mov         dl,byte ptr [ebp-6]
 004C0604    mov         eax,esi
 004C0606    call        004BEDCC
 004C060B    lea         edx,[ebp-218]
 004C0611    mov         cl,1
 004C0613    mov         eax,ebx
 004C0615    call        004B6A80
 004C061A    lea         eax,[ebp-218]
 004C0620    push        eax
 004C0621    mov         cl,byte ptr [ebp-7]
 004C0624    mov         dl,byte ptr [ebp-6]
 004C0627    mov         eax,esi
 004C0629    call        004BEE1C
 004C062E    lea         edx,[ebp-218]
 004C0634    mov         cl,1
 004C0636    mov         eax,ebx
 004C0638    call        004B6A80
 004C063D    lea         eax,[ebp-218]
 004C0643    push        eax
 004C0644    mov         cl,byte ptr [ebp-7]
 004C0647    mov         dl,byte ptr [ebp-6]
 004C064A    mov         eax,esi
 004C064C    call        004BEE6C
 004C0651    lea         edx,[ebp-218]
 004C0657    mov         cl,1
 004C0659    mov         eax,ebx
 004C065B    call        004B6A80
 004C0660    lea         eax,[ebp-218]
 004C0666    push        eax
 004C0667    mov         cl,byte ptr [ebp-7]
 004C066A    mov         dl,byte ptr [ebp-6]
 004C066D    mov         eax,esi
 004C066F    call        004BEEBC
 004C0674    lea         edx,[ebp-218]
 004C067A    mov         cl,1
 004C067C    mov         eax,ebx
 004C067E    call        004B6A80
 004C0683    lea         eax,[ebp-218]
 004C0689    push        eax
 004C068A    mov         cl,byte ptr [ebp-7]
 004C068D    mov         dl,byte ptr [ebp-6]
 004C0690    mov         eax,esi
 004C0692    call        004BEF0C
 004C0697    lea         edx,[ebp-218]
 004C069D    mov         cl,1
 004C069F    mov         eax,ebx
 004C06A1    call        004B6A80
 004C06A6    inc         byte ptr [ebp-7]
 004C06A9    dec         byte ptr [ebp-16]
>004C06AC    jne         004C0536
 004C06B2    inc         byte ptr [ebp-6]
 004C06B5    dec         byte ptr [ebp-15]
>004C06B8    jne         004C04DE
 004C06BE    mov         eax,esi
 004C06C0    call        004BE9E0
 004C06C5    test        al,al
>004C06C7    jbe         004C0715
 004C06C9    mov         byte ptr [ebp-15],al
 004C06CC    mov         byte ptr [ebp-6],1
 004C06D0    mov         eax,esi
 004C06D2    call        004BEA58
 004C06D7    test        al,al
>004C06D9    jbe         004C070D
 004C06DB    mov         byte ptr [ebp-16],al
 004C06DE    mov         byte ptr [ebp-7],1
 004C06E2    lea         eax,[ebp-218]
 004C06E8    push        eax
 004C06E9    mov         cl,byte ptr [ebp-7]
 004C06EC    mov         dl,byte ptr [ebp-6]
 004C06EF    mov         eax,esi
 004C06F1    call        004C2B38
 004C06F6    lea         edx,[ebp-218]
 004C06FC    mov         cl,1
 004C06FE    mov         eax,ebx
 004C0700    call        004B6A80
 004C0705    inc         byte ptr [ebp-7]
 004C0708    dec         byte ptr [ebp-16]
>004C070B    jne         004C06E2
 004C070D    inc         byte ptr [ebp-6]
 004C0710    dec         byte ptr [ebp-15]
>004C0713    jne         004C06D0
 004C0715    mov         eax,esi
 004C0717    call        004C8D68
 004C071C    and         eax,0FF
 004C0721    lea         edx,[ebp-22C]
 004C0727    call        IntToStr
 004C072C    mov         edx,dword ptr [ebp-22C]
 004C0732    lea         eax,[ebp-218]
 004C0738    mov         ecx,0FF
 004C073D    call        @LStrToString
 004C0742    lea         edx,[ebp-218]
 004C0748    mov         cl,1
 004C074A    mov         eax,ebx
 004C074C    call        004B6A80
 004C0751    mov         eax,esi
 004C0753    call        004C8D68
 004C0758    test        al,al
>004C075A    jbe         004C078A
 004C075C    mov         byte ptr [ebp-15],al
 004C075F    mov         byte ptr [ebp-6],1
 004C0763    lea         ecx,[ebp-218]
 004C0769    mov         dl,byte ptr [ebp-6]
 004C076C    mov         eax,esi
 004C076E    call        004C8D84
 004C0773    lea         edx,[ebp-218]
 004C0779    mov         cl,1
 004C077B    mov         eax,ebx
 004C077D    call        004B6A80
 004C0782    inc         byte ptr [ebp-6]
 004C0785    dec         byte ptr [ebp-15]
>004C0788    jne         004C0763
 004C078A    cmp         byte ptr [ebp+8],0
>004C078E    jne         004C082E
 004C0794    lea         edx,[ebp-218]
 004C079A    mov         eax,esi
 004C079C    call        004C8B54
 004C07A1    lea         edx,[ebp-218]
 004C07A7    mov         cl,1
 004C07A9    mov         eax,ebx
 004C07AB    call        004B6A80
 004C07B0    mov         eax,esi
 004C07B2    call        004C8AE8
 004C07B7    and         eax,0FF
 004C07BC    lea         edx,[ebp-230]
 004C07C2    call        IntToStr
 004C07C7    mov         edx,dword ptr [ebp-230]
 004C07CD    lea         eax,[ebp-218]
 004C07D3    mov         ecx,0FF
 004C07D8    call        @LStrToString
 004C07DD    lea         edx,[ebp-218]
 004C07E3    mov         cl,1
 004C07E5    mov         eax,ebx
 004C07E7    call        004B6A80
 004C07EC    mov         eax,esi
 004C07EE    call        004C8AE8
 004C07F3    test        al,al
>004C07F5    jbe         004C0911
 004C07FB    mov         byte ptr [ebp-15],al
 004C07FE    mov         byte ptr [ebp-9],1
 004C0802    lea         ecx,[ebp-218]
 004C0808    mov         dl,byte ptr [ebp-9]
 004C080B    mov         eax,esi
 004C080D    call        004C8AF4
 004C0812    lea         edx,[ebp-218]
 004C0818    mov         cl,1
 004C081A    mov         eax,ebx
 004C081C    call        004B6A80
 004C0821    inc         byte ptr [ebp-9]
 004C0824    dec         byte ptr [ebp-15]
>004C0827    jne         004C0802
>004C0829    jmp         004C0911
 004C082E    lea         eax,[ebp-10]
 004C0831    mov         edx,4C0C0C;'Nouveaux bulletins du collège'
 004C0836    call        @LStrLAsg
 004C083B    lea         eax,[ebp-218]
 004C0841    mov         edx,dword ptr [ebp-10]
 004C0844    mov         ecx,0FF
 004C0849    call        @LStrToString
 004C084E    lea         edx,[ebp-218]
 004C0854    mov         cl,1
 004C0856    mov         eax,ebx
 004C0858    call        004B6A80
 004C085D    mov         eax,dword ptr [ebp-10]
 004C0860    call        004BCF84
 004C0865    mov         dword ptr [ebp-14],eax
 004C0868    mov         eax,dword ptr [ebp-14]
 004C086B    mov         edx,dword ptr [eax]
 004C086D    call        dword ptr [edx+14]
 004C0870    lea         edx,[ebp-234]
 004C0876    call        IntToStr
 004C087B    mov         edx,dword ptr [ebp-234]
 004C0881    lea         eax,[ebp-218]
 004C0887    mov         ecx,0FF
 004C088C    call        @LStrToString
 004C0891    lea         edx,[ebp-218]
 004C0897    mov         cl,1
 004C0899    mov         eax,ebx
 004C089B    call        004B6A80
 004C08A0    mov         eax,dword ptr [ebp-14]
 004C08A3    mov         edx,dword ptr [eax]
 004C08A5    call        dword ptr [edx+14]
 004C08A8    cmp         eax,0FF
>004C08AD    jbe         004C08B4
 004C08AF    call        @BoundErr
 004C08B4    test        al,al
>004C08B6    jbe         004C0909
 004C08B8    mov         byte ptr [ebp-15],al
 004C08BB    mov         byte ptr [ebp-9],1
 004C08BF    lea         ecx,[ebp-238]
 004C08C5    xor         edx,edx
 004C08C7    mov         dl,byte ptr [ebp-9]
 004C08CA    sub         edx,1
>004C08CD    jno         004C08D4
 004C08CF    call        @IntOver
 004C08D4    mov         eax,dword ptr [ebp-14]
 004C08D7    mov         edi,dword ptr [eax]
 004C08D9    call        dword ptr [edi+0C]
 004C08DC    mov         edx,dword ptr [ebp-238]
 004C08E2    lea         eax,[ebp-218]
 004C08E8    mov         ecx,0FF
 004C08ED    call        @LStrToString
 004C08F2    lea         edx,[ebp-218]
 004C08F8    mov         cl,1
 004C08FA    mov         eax,ebx
 004C08FC    call        004B6A80
 004C0901    inc         byte ptr [ebp-9]
 004C0904    dec         byte ptr [ebp-15]
>004C0907    jne         004C08BF
 004C0909    lea         eax,[ebp-14]
 004C090C    call        FreeAndNil
 004C0911    mov         eax,esi
 004C0913    call        004BE9E0
 004C0918    test        al,al
>004C091A    jbe         004C09DF
 004C0920    mov         byte ptr [ebp-15],al
 004C0923    mov         byte ptr [ebp-6],1
 004C0927    mov         eax,esi
 004C0929    call        004BEA58
 004C092E    test        al,al
>004C0930    jbe         004C09D3
 004C0936    mov         byte ptr [ebp-16],al
 004C0939    mov         byte ptr [ebp-7],1
 004C093D    cmp         byte ptr [ebp+8],0
>004C0941    jne         004C0986
 004C0943    mov         eax,esi
 004C0945    call        004C8AE8
 004C094A    test        al,al
>004C094C    jbe         004C09C7
 004C094E    mov         byte ptr [ebp-17],al
 004C0951    mov         byte ptr [ebp-9],1
 004C0955    mov         al,byte ptr [ebp-9]
 004C0958    push        eax
 004C0959    lea         eax,[ebp-218]
 004C095F    push        eax
 004C0960    mov         cl,byte ptr [ebp-7]
 004C0963    mov         dl,byte ptr [ebp-6]
 004C0966    mov         eax,esi
 004C0968    call        004C2C00
 004C096D    lea         edx,[ebp-218]
 004C0973    mov         cl,1
 004C0975    mov         eax,ebx
 004C0977    call        004B6A80
 004C097C    inc         byte ptr [ebp-9]
 004C097F    dec         byte ptr [ebp-17]
>004C0982    jne         004C0955
>004C0984    jmp         004C09C7
 004C0986    push        1
 004C0988    lea         eax,[ebp-218]
 004C098E    push        eax
 004C098F    mov         cl,byte ptr [ebp-7]
 004C0992    mov         dl,byte ptr [ebp-6]
 004C0995    mov         eax,esi
 004C0997    call        004C2C00
 004C099C    lea         edx,[ebp-218]
 004C09A2    mov         cl,1
 004C09A4    mov         eax,ebx
 004C09A6    call        004B6A80
 004C09AB    mov         cl,1
 004C09AD    mov         edx,4C0C00;'
 004C09B2    mov         eax,ebx
 004C09B4    call        004B6A80
 004C09B9    mov         cl,1
 004C09BB    mov         edx,4C0C00;'
 004C09C0    mov         eax,ebx
 004C09C2    call        004B6A80
 004C09C7    inc         byte ptr [ebp-7]
 004C09CA    dec         byte ptr [ebp-16]
>004C09CD    jne         004C093D
 004C09D3    inc         byte ptr [ebp-6]
 004C09D6    dec         byte ptr [ebp-15]
>004C09D9    jne         004C0927
 004C09DF    mov         eax,esi
 004C09E1    call        004BEA58
 004C09E6    test        al,al
>004C09E8    jbe         004C0A63
 004C09EA    mov         byte ptr [ebp-15],al
 004C09ED    mov         byte ptr [ebp-6],1
 004C09F1    lea         ecx,[ebp-218]
 004C09F7    mov         dl,byte ptr [ebp-6]
 004C09FA    mov         eax,esi
 004C09FC    call        004C8BB8
 004C0A01    lea         edx,[ebp-218]
 004C0A07    mov         cl,1
 004C0A09    mov         eax,ebx
 004C0A0B    call        004B6A80
 004C0A10    lea         ecx,[ebp-218]
 004C0A16    mov         dl,byte ptr [ebp-6]
 004C0A19    mov         eax,esi
 004C0A1B    call        004C8CB8
 004C0A20    lea         edx,[ebp-218]
 004C0A26    mov         cl,1
 004C0A28    mov         eax,ebx
 004C0A2A    call        004B6A80
 004C0A2F    mov         dl,byte ptr [ebp-6]
 004C0A32    mov         eax,esi
 004C0A34    call        004C8E50
 004C0A39    test        al,al
>004C0A3B    je          004C0A4D
 004C0A3D    mov         cl,1
 004C0A3F    mov         edx,4C0C2C;'R'
 004C0A44    mov         eax,ebx
 004C0A46    call        004B6A80
>004C0A4B    jmp         004C0A5B
 004C0A4D    mov         cl,1
 004C0A4F    mov         edx,4C0C00;'
 004C0A54    mov         eax,ebx
 004C0A56    call        004B6A80
 004C0A5B    inc         byte ptr [ebp-6]
 004C0A5E    dec         byte ptr [ebp-15]
>004C0A61    jne         004C09F1
 004C0A63    mov         eax,esi
 004C0A65    call        004C4D44
 004C0A6A    and         eax,0FF
 004C0A6F    lea         edx,[ebp-23C]
 004C0A75    call        IntToStr
 004C0A7A    mov         edx,dword ptr [ebp-23C]
 004C0A80    lea         eax,[ebp-218]
 004C0A86    mov         ecx,0FF
 004C0A8B    call        @LStrToString
 004C0A90    lea         edx,[ebp-218]
 004C0A96    mov         cl,1
 004C0A98    mov         eax,ebx
 004C0A9A    call        004B6A80
 004C0A9F    mov         eax,esi
 004C0AA1    call        004C8AD8
 004C0AA6    and         eax,0FF
 004C0AAB    lea         edx,[ebp-240]
 004C0AB1    call        IntToStr
 004C0AB6    mov         edx,dword ptr [ebp-240]
 004C0ABC    lea         eax,[ebp-218]
 004C0AC2    mov         ecx,0FF
 004C0AC7    call        @LStrToString
 004C0ACC    lea         edx,[ebp-218]
 004C0AD2    mov         cl,1
 004C0AD4    mov         eax,ebx
 004C0AD6    call        004B6A80
 004C0ADB    mov         eax,esi
 004C0ADD    call        004C8AE0
 004C0AE2    and         eax,0FF
 004C0AE7    lea         edx,[ebp-244]
 004C0AED    call        IntToStr
 004C0AF2    mov         edx,dword ptr [ebp-244]
 004C0AF8    lea         eax,[ebp-218]
 004C0AFE    mov         ecx,0FF
 004C0B03    call        @LStrToString
 004C0B08    lea         edx,[ebp-218]
 004C0B0E    mov         cl,1
 004C0B10    mov         eax,ebx
 004C0B12    call        004B6A80
 004C0B17    mov         dl,1
 004C0B19    mov         eax,ebx
 004C0B1B    mov         ecx,dword ptr [eax]
 004C0B1D    call        dword ptr [ecx-4];TFileStream.Destroy
 004C0B20    mov         edx,dword ptr [ebp-4]
 004C0B23    mov         eax,esi
 004C0B25    call        004BEF84
 004C0B2A    mov         byte ptr [esi+949],0
 004C0B31    mov         byte ptr [esi+8],0
 004C0B35    xor         eax,eax
 004C0B37    pop         edx
 004C0B38    pop         ecx
 004C0B39    pop         ecx
 004C0B3A    mov         dword ptr fs:[eax],edx
>004C0B3D    jmp         004C0B76
>004C0B3F    jmp         @HandleAnyException
 004C0B44    push        10
 004C0B46    push        4C0C30
 004C0B4B    lea         eax,[ebp-248]
 004C0B51    mov         ecx,dword ptr [ebp-4]
 004C0B54    mov         edx,4C0C5C;'Erreur dans l'enregistrement du fichier '
 004C0B59    call        @LStrCat3
 004C0B5E    mov         eax,dword ptr [ebp-248]
 004C0B64    call        @LStrToPChar
 004C0B69    push        eax
 004C0B6A    push        0
 004C0B6C    call        user32.MessageBoxA
 004C0B71    call        @DoneExcept
 004C0B76    xor         eax,eax
 004C0B78    pop         edx
 004C0B79    pop         ecx
 004C0B7A    pop         ecx
 004C0B7B    mov         dword ptr fs:[eax],edx
 004C0B7E    push        4C0BAB
 004C0B83    lea         eax,[ebp-248]
 004C0B89    mov         edx,0C
 004C0B8E    call        @LStrArrayClr
 004C0B93    lea         eax,[ebp-10]
 004C0B96    call        @LStrClr
 004C0B9B    lea         eax,[ebp-4]
 004C0B9E    call        @LStrClr
 004C0BA3    ret
>004C0BA4    jmp         @HandleFinally
>004C0BA9    jmp         004C0B83
 004C0BAB    pop         edi
 004C0BAC    pop         esi
 004C0BAD    pop         ebx
 004C0BAE    mov         esp,ebp
 004C0BB0    pop         ebp
 004C0BB1    ret         8
//end;*}

//004C0C88
{*////procedure sub_004C0C88(?:?; ?:?; ?:?; ?:?);
begin
 004C0C88    push        ebp
 004C0C89    mov         ebp,esp
 004C0C8B    add         esp,0FFFFFEEC
 004C0C91    push        ebx
 004C0C92    push        esi
 004C0C93    push        edi
 004C0C94    xor         ebx,ebx
 004C0C96    mov         dword ptr [ebp-114],ebx
 004C0C9C    mov         dword ptr [ebp-10C],ebx
 004C0CA2    mov         dword ptr [ebp-110],ebx
 004C0CA8    mov         dword ptr [ebp-108],ebx
 004C0CAE    mov         esi,dword ptr [ebp+8]
 004C0CB1    lea         edi,[ebp-104]
 004C0CB7    push        ecx
 004C0CB8    xor         ecx,ecx
 004C0CBA    mov         cl,byte ptr [esi]
 004C0CBC    inc         ecx
 004C0CBD    rep movs    byte ptr [edi],byte ptr [esi]
 004C0CBF    pop         ecx
 004C0CC0    mov         byte ptr [ebp-2],cl
 004C0CC3    mov         byte ptr [ebp-1],dl
 004C0CC6    mov         esi,eax
 004C0CC8    xor         eax,eax
 004C0CCA    push        ebp
 004C0CCB    push        4C0E13
 004C0CD0    push        dword ptr fs:[eax]
 004C0CD3    mov         dword ptr fs:[eax],esp
 004C0CD6    xor         ebx,ebx
 004C0CD8    xor         eax,eax
 004C0CDA    mov         al,byte ptr [ebp-1]
 004C0CDD    sub         eax,1
>004C0CE0    jno         004C0CE7
 004C0CE2    call        @IntOver
 004C0CE7    cmp         eax,0FF
>004C0CEC    jbe         004C0CF3
 004C0CEE    call        @BoundErr
 004C0CF3    test        al,al
>004C0CF5    jbe         004C0D4C
 004C0CF7    mov         byte ptr [ebp-4],al
 004C0CFA    mov         byte ptr [ebp-3],1
 004C0CFE    lea         ecx,[ebp-108]
 004C0D04    xor         edx,edx
 004C0D06    mov         dl,byte ptr [ebp-3]
 004C0D09    sub         edx,1
>004C0D0C    jno         004C0D13
 004C0D0E    call        @IntOver
 004C0D13    mov         eax,dword ptr [esi+920]
 004C0D19    mov         edi,dword ptr [eax]
 004C0D1B    call        dword ptr [edi+0C]
 004C0D1E    mov         eax,dword ptr [ebp-108]
 004C0D24    call        StrToInt
 004C0D29    xor         edx,edx
 004C0D2B    mov         dl,bl
 004C0D2D    add         eax,edx
>004C0D2F    jno         004C0D36
 004C0D31    call        @IntOver
 004C0D36    cmp         eax,0FF
>004C0D3B    jbe         004C0D42
 004C0D3D    call        @BoundErr
 004C0D42    mov         ebx,eax
 004C0D44    inc         byte ptr [ebp-3]
 004C0D47    dec         byte ptr [ebp-4]
>004C0D4A    jne         004C0CFE
 004C0D4C    cmp         byte ptr [esi+8],0
>004C0D50    jne         004C0DB1
 004C0D52    lea         eax,[ebp-10C]
 004C0D58    push        eax
 004C0D59    xor         edx,edx
 004C0D5B    mov         dl,bl
 004C0D5D    sub         edx,1
>004C0D60    jno         004C0D67
 004C0D62    call        @IntOver
 004C0D67    xor         eax,eax
 004C0D69    mov         al,byte ptr [ebp-2]
 004C0D6C    add         edx,eax
>004C0D6E    jno         004C0D75
 004C0D70    call        @IntOver
 004C0D75    xor         ecx,ecx
 004C0D77    mov         cl,byte ptr [ebp+0C]
 004C0D7A    mov         eax,dword ptr [esi+924]
 004C0D80    call        TStringGrid.GetCells
 004C0D85    mov         eax,dword ptr [ebp-10C]
 004C0D8B    push        eax
 004C0D8C    lea         eax,[ebp-110]
 004C0D92    lea         edx,[ebp-104]
 004C0D98    call        @LStrFromString
 004C0D9D    mov         edx,dword ptr [ebp-110]
 004C0DA3    pop         eax
 004C0DA4    call        @LStrCmp
 004C0DA9    sete        al
 004C0DAC    xor         al,1
 004C0DAE    mov         byte ptr [esi+8],al
 004C0DB1    lea         eax,[ebp-114]
 004C0DB7    lea         edx,[ebp-104]
 004C0DBD    call        @LStrFromString
 004C0DC2    mov         eax,dword ptr [ebp-114]
 004C0DC8    push        eax
 004C0DC9    xor         edx,edx
 004C0DCB    mov         dl,bl
 004C0DCD    sub         edx,1
>004C0DD0    jno         004C0DD7
 004C0DD2    call        @IntOver
 004C0DD7    xor         eax,eax
 004C0DD9    mov         al,byte ptr [ebp-2]
 004C0DDC    add         edx,eax
>004C0DDE    jno         004C0DE5
 004C0DE0    call        @IntOver
 004C0DE5    xor         ecx,ecx
 004C0DE7    mov         cl,byte ptr [ebp+0C]
 004C0DEA    mov         eax,dword ptr [esi+924]
 004C0DF0    call        TStringGrid.SetCells
 004C0DF5    xor         eax,eax
 004C0DF7    pop         edx
 004C0DF8    pop         ecx
 004C0DF9    pop         ecx
 004C0DFA    mov         dword ptr fs:[eax],edx
 004C0DFD    push        4C0E1A
 004C0E02    lea         eax,[ebp-114]
 004C0E08    mov         edx,4
 004C0E0D    call        @LStrArrayClr
 004C0E12    ret
>004C0E13    jmp         @HandleFinally
>004C0E18    jmp         004C0E02
 004C0E1A    pop         edi
 004C0E1B    pop         esi
 004C0E1C    pop         ebx
 004C0E1D    mov         esp,ebp
 004C0E1F    pop         ebp
 004C0E20    ret         8
//end;*}

//004C0E24
{*////procedure sub_004C0E24(?:?);
begin
 004C0E24    push        ebp
 004C0E25    mov         ebp,esp
 004C0E27    add         esp,0FFFFFF00
 004C0E2D    push        ebx
 004C0E2E    push        esi
 004C0E2F    push        edi
 004C0E30    mov         esi,dword ptr [ebp+8]
 004C0E33    lea         edi,[ebp-100]
 004C0E39    push        ecx
 004C0E3A    xor         ecx,ecx
 004C0E3C    mov         cl,byte ptr [esi]
 004C0E3E    inc         ecx
 004C0E3F    rep movs    byte ptr [edi],byte ptr [esi]
 004C0E41    pop         ecx
 004C0E42    push        0
 004C0E44    lea         ebx,[ebp-100]
 004C0E4A    push        ebx
 004C0E4B    call        004C0C88
 004C0E50    pop         edi
 004C0E51    pop         esi
 004C0E52    pop         ebx
 004C0E53    mov         esp,ebp
 004C0E55    pop         ebp
 004C0E56    ret         4
//end;*}

//004C0E5C
{*////procedure sub_004C0E5C(?:dword; ?:?; ?:?);
begin
 004C0E5C    push        ebp
 004C0E5D    mov         ebp,esp
 004C0E5F    add         esp,0FFFFFEFC
 004C0E65    push        ebx
 004C0E66    push        esi
 004C0E67    push        edi
 004C0E68    mov         esi,dword ptr [ebp+8]
 004C0E6B    lea         edi,[ebp-101]
 004C0E71    push        ecx
 004C0E72    xor         ecx,ecx
 004C0E74    mov         cl,byte ptr [esi]
 004C0E76    inc         ecx
 004C0E77    rep movs    byte ptr [edi],byte ptr [esi]
 004C0E79    pop         ecx
 004C0E7A    mov         byte ptr [ebp-1],cl
 004C0E7D    mov         ebx,edx
 004C0E7F    mov         esi,eax
 004C0E81    mov         eax,esi
 004C0E83    call        004BEA58
 004C0E88    and         eax,0FF
 004C0E8D    mov         edx,dword ptr ds:[615D80];^gvar_006178FF
 004C0E93    movzx       edx,byte ptr [edx]
 004C0E96    add         eax,edx
>004C0E98    jno         004C0E9F
 004C0E9A    call        @IntOver
 004C0E9F    cmp         eax,0FF
>004C0EA4    jbe         004C0EAB
 004C0EA6    call        @BoundErr
 004C0EAB    push        eax
 004C0EAC    lea         eax,[ebp-101]
 004C0EB2    push        eax
 004C0EB3    mov         cl,byte ptr [ebp-1]
 004C0EB6    mov         edx,ebx
 004C0EB8    mov         eax,esi
 004C0EBA    call        004C0C88
 004C0EBF    pop         edi
 004C0EC0    pop         esi
 004C0EC1    pop         ebx
 004C0EC2    mov         esp,ebp
 004C0EC4    pop         ebp
 004C0EC5    ret         4
//end;*}

//004C0EC8
{*////procedure sub_004C0EC8(?:dword; ?:?; ?:?);
begin
 004C0EC8    push        ebp
 004C0EC9    mov         ebp,esp
 004C0ECB    add         esp,0FFFFFEFC
 004C0ED1    push        ebx
 004C0ED2    push        esi
 004C0ED3    push        edi
 004C0ED4    mov         esi,dword ptr [ebp+8]
 004C0ED7    lea         edi,[ebp-101]
 004C0EDD    push        ecx
 004C0EDE    xor         ecx,ecx
 004C0EE0    mov         cl,byte ptr [esi]
 004C0EE2    inc         ecx
 004C0EE3    rep movs    byte ptr [edi],byte ptr [esi]
 004C0EE5    pop         ecx
 004C0EE6    mov         byte ptr [ebp-1],cl
 004C0EE9    mov         ebx,edx
 004C0EEB    mov         esi,eax
 004C0EED    mov         eax,esi
 004C0EEF    call        004BEA58
 004C0EF4    and         eax,0FF
 004C0EF9    mov         edx,dword ptr ds:[61618C];^gvar_006178FE
 004C0EFF    movzx       edx,byte ptr [edx]
 004C0F02    add         eax,edx
>004C0F04    jno         004C0F0B
 004C0F06    call        @IntOver
 004C0F0B    cmp         eax,0FF
>004C0F10    jbe         004C0F17
 004C0F12    call        @BoundErr
 004C0F17    push        eax
 004C0F18    lea         eax,[ebp-101]
 004C0F1E    push        eax
 004C0F1F    mov         cl,byte ptr [ebp-1]
 004C0F22    mov         edx,ebx
 004C0F24    mov         eax,esi
 004C0F26    call        004C0C88
 004C0F2B    pop         edi
 004C0F2C    pop         esi
 004C0F2D    pop         ebx
 004C0F2E    mov         esp,ebp
 004C0F30    pop         ebp
 004C0F31    ret         4
//end;*}

//004C0F34
{*////procedure sub_004C0F34(?:dword; ?:?; ?:?);
begin
 004C0F34    push        ebp
 004C0F35    mov         ebp,esp
 004C0F37    add         esp,0FFFFFEFC
 004C0F3D    push        ebx
 004C0F3E    push        esi
 004C0F3F    push        edi
 004C0F40    mov         esi,dword ptr [ebp+8]
 004C0F43    lea         edi,[ebp-101]
 004C0F49    push        ecx
 004C0F4A    xor         ecx,ecx
 004C0F4C    mov         cl,byte ptr [esi]
 004C0F4E    inc         ecx
 004C0F4F    rep movs    byte ptr [edi],byte ptr [esi]
 004C0F51    pop         ecx
 004C0F52    mov         byte ptr [ebp-1],cl
 004C0F55    mov         ebx,edx
 004C0F57    mov         esi,eax
 004C0F59    mov         eax,esi
 004C0F5B    call        004BEA58
 004C0F60    and         eax,0FF
 004C0F65    mov         edx,dword ptr ds:[6162DC];^gvar_00617900
 004C0F6B    movzx       edx,byte ptr [edx]
 004C0F6E    add         eax,edx
>004C0F70    jno         004C0F77
 004C0F72    call        @IntOver
 004C0F77    cmp         eax,0FF
>004C0F7C    jbe         004C0F83
 004C0F7E    call        @BoundErr
 004C0F83    push        eax
 004C0F84    lea         eax,[ebp-101]
 004C0F8A    push        eax
 004C0F8B    mov         cl,byte ptr [ebp-1]
 004C0F8E    mov         edx,ebx
 004C0F90    mov         eax,esi
 004C0F92    call        004C0C88
 004C0F97    pop         edi
 004C0F98    pop         esi
 004C0F99    pop         ebx
 004C0F9A    mov         esp,ebp
 004C0F9C    pop         ebp
 004C0F9D    ret         4
//end;*}

//004C0FA0
{*function sub_004C0FA0(?:dword; ?:dword; ?:?):?;
begin
 004C0FA0    push        ebp
 004C0FA1    mov         ebp,esp
 004C0FA3    add         esp,0FFFFFDFC
 004C0FA9    push        ebx
 004C0FAA    push        esi
 004C0FAB    push        edi
 004C0FAC    mov         esi,dword ptr [ebp+8]
 004C0FAF    lea         edi,[ebp-103]
 004C0FB5    push        ecx
 004C0FB6    xor         ecx,ecx
 004C0FB8    mov         cl,byte ptr [esi]
 004C0FBA    inc         ecx
 004C0FBB    rep movs    byte ptr [edi],byte ptr [esi]
 004C0FBD    pop         ecx
 004C0FBE    mov         byte ptr [ebp-2],cl
 004C0FC1    mov         byte ptr [ebp-1],dl
 004C0FC4    mov         esi,eax
 004C0FC6    lea         eax,[ebp-204]
 004C0FCC    push        eax
 004C0FCD    mov         cl,byte ptr [ebp-2]
 004C0FD0    mov         dl,byte ptr [ebp-1]
 004C0FD3    mov         eax,esi
 004C0FD5    call        004BEDCC
 004C0FDA    lea         eax,[ebp-204]
 004C0FE0    lea         edx,[ebp-103]
 004C0FE6    xor         ecx,ecx
 004C0FE8    mov         cl,byte ptr [eax]
 004C0FEA    inc         ecx
 004C0FEB    call        @AStrCmp
>004C0FF0    je          004C1019
 004C0FF2    mov         eax,esi
 004C0FF4    call        004BEA58
 004C0FF9    mov         ebx,eax
 004C0FFB    test        bl,bl
>004C0FFD    jbe         004C1019
 004C0FFF    mov         byte ptr [ebp-3],1
 004C1003    push        1
 004C1005    mov         cl,byte ptr [ebp-3]
 004C1008    mov         dl,byte ptr [ebp-1]
 004C100B    mov         eax,esi
 004C100D    call        004C61E4
 004C1012    inc         byte ptr [ebp-3]
 004C1015    dec         bl
>004C1017    jne         004C1003
 004C1019    mov         eax,esi
 004C101B    call        004BEA58
 004C1020    and         eax,0FF
 004C1025    mov         edx,dword ptr ds:[615BF0];^gvar_006178FD
 004C102B    movzx       edx,byte ptr [edx]
 004C102E    add         eax,edx
>004C1030    jno         004C1037
 004C1032    call        @IntOver
 004C1037    cmp         eax,0FF
>004C103C    jbe         004C1043
 004C103E    call        @BoundErr
 004C1043    push        eax
 004C1044    lea         eax,[ebp-103]
 004C104A    push        eax
 004C104B    mov         cl,byte ptr [ebp-2]
 004C104E    mov         dl,byte ptr [ebp-1]
 004C1051    mov         eax,esi
 004C1053    call        004C0C88
 004C1058    mov         cl,1
 004C105A    mov         dl,byte ptr [ebp-1]
 004C105D    mov         eax,dword ptr [esi+918]
 004C1063    call        004B6E84
 004C1068    pop         edi
 004C1069    pop         esi
 004C106A    pop         ebx
 004C106B    mov         esp,ebp
 004C106D    pop         ebp
 004C106E    ret         4
//end;*}

//004C1074
{*////procedure sub_004C1074(?:TFichierCdn; ?:dword; ?:?; ?:?);
begin
 004C1074    push        ebp
 004C1075    mov         ebp,esp
 004C1077    add         esp,0FFFFFDFC
 004C107D    push        ebx
 004C107E    push        esi
 004C107F    push        edi
 004C1080    mov         esi,dword ptr [ebp+8]
 004C1083    lea         edi,[ebp-102]
 004C1089    push        ecx
 004C108A    xor         ecx,ecx
 004C108C    mov         cl,byte ptr [esi]
 004C108E    inc         ecx
 004C108F    rep movs    byte ptr [edi],byte ptr [esi]
 004C1091    pop         ecx
 004C1092    mov         byte ptr [ebp-2],cl
 004C1095    mov         byte ptr [ebp-1],dl
 004C1098    mov         esi,eax
 004C109A    mov         bl,1
 004C109C    push        ebx
 004C109D    mov         al,byte ptr [ebp+0C]
 004C10A0    push        eax
 004C10A1    lea         eax,[ebp-204]
 004C10A7    push        eax
 004C10A8    mov         cl,byte ptr [ebp-2]
 004C10AB    mov         dl,byte ptr [ebp-1]
 004C10AE    mov         eax,esi
 004C10B0    call        004BEF5C
 004C10B5    lea         eax,[ebp-204]
 004C10BB    lea         edx,[ebp-102]
 004C10C1    xor         ecx,ecx
 004C10C3    mov         cl,byte ptr [eax]
 004C10C5    inc         ecx
 004C10C6    call        @AStrCmp
 004C10CB    sete        al
 004C10CE    xor         al,1
 004C10D0    push        eax
 004C10D1    mov         cl,byte ptr [ebp-2]
 004C10D4    mov         dl,byte ptr [ebp-1]
 004C10D7    mov         eax,esi
 004C10D9    call        004C5FF8
 004C10DE    inc         ebx
 004C10DF    cmp         bl,8
>004C10E2    jne         004C109C
 004C10E4    mov         al,byte ptr [ebp+0C]
 004C10E7    push        eax
 004C10E8    lea         eax,[ebp-204]
 004C10EE    push        eax
 004C10EF    mov         cl,byte ptr [ebp-2]
 004C10F2    mov         dl,byte ptr [ebp-1]
 004C10F5    mov         eax,esi
 004C10F7    call        004BEF5C
 004C10FC    lea         eax,[ebp-204]
 004C1102    lea         edx,[ebp-102]
 004C1108    xor         ecx,ecx
 004C110A    mov         cl,byte ptr [eax]
 004C110C    inc         ecx
 004C110D    call        @AStrCmp
 004C1112    sete        al
 004C1115    xor         al,1
 004C1117    push        eax
 004C1118    mov         cl,byte ptr [ebp+0C]
 004C111B    mov         dl,byte ptr [ebp-1]
 004C111E    mov         eax,esi
 004C1120    call        004C61E4
 004C1125    mov         al,byte ptr [ebp+0C]
 004C1128    push        eax
 004C1129    lea         eax,[ebp-102]
 004C112F    push        eax
 004C1130    mov         cl,byte ptr [ebp-2]
 004C1133    mov         dl,byte ptr [ebp-1]
 004C1136    mov         eax,esi
 004C1138    call        004C0C88
 004C113D    mov         cl,1
 004C113F    mov         dl,byte ptr [ebp-1]
 004C1142    mov         eax,dword ptr [esi+918]
 004C1148    call        004B6E84
 004C114D    pop         edi
 004C114E    pop         esi
 004C114F    pop         ebx
 004C1150    mov         esp,ebp
 004C1152    pop         ebp
 004C1153    ret         8
//end;*}

//004C1158
////procedure sub_004C1158(?:dword; ?:dword);
//begin
{*
 004C1158    push        ebp
 004C1159    mov         ebp,esp
 004C115B    add         esp,0FFFFFFE4
 004C115E    push        ebx
 004C115F    push        esi
 004C1160    push        edi
 004C1161    xor         ecx,ecx
 004C1163    mov         dword ptr [ebp-1C],ecx
 004C1166    mov         byte ptr [ebp-1],dl
 004C1169    mov         ebx,eax
 004C116B    xor         eax,eax
 004C116D    push        ebp
 004C116E    push        4C14AB
 004C1173    push        dword ptr fs:[eax]
 004C1176    mov         dword ptr fs:[eax],esp
 004C1179    mov         dl,1
 004C117B    mov         eax,[004120B8];TStringList
 004C1180    call        TObject.Create;TStringList.Create
 004C1185    mov         dword ptr [ebp-14],eax
 004C1188    mov         eax,ebx
 004C118A    call        004C4790
 004C118F    and         eax,0FF
 004C1194    test        eax,eax
>004C1196    jle         004C1259
 004C119C    mov         dword ptr [ebp-18],eax
 004C119F    mov         dword ptr [ebp-0C],1
 004C11A6    mov         eax,dword ptr [ebp-14]
 004C11A9    mov         edx,dword ptr [eax]
 004C11AB    call        dword ptr [edx+40];TStringList.Clear
 004C11AE    mov         esi,dword ptr [ebp-0C]
 004C11B1    sub         esi,1
>004C11B4    jno         004C11BB
 004C11B6    call        @IntOver
 004C11BB    mov         edx,esi
 004C11BD    mov         eax,dword ptr [ebx+924]
 004C11C3    call        TStringGrid.GetCols
 004C11C8    mov         edx,eax
 004C11CA    mov         eax,dword ptr [ebp-14]
 004C11CD    mov         ecx,dword ptr [eax]
 004C11CF    call        dword ptr [ecx+3C];TStrings.AddStrings
 004C11D2    xor         edx,edx
 004C11D4    mov         dl,byte ptr [ebp-1]
 004C11D7    mov         eax,dword ptr [ebp-14]
 004C11DA    mov         ecx,dword ptr [eax]
 004C11DC    call        dword ptr [ecx+44];TStringList.Delete
 004C11DF    mov         edx,esi
 004C11E1    mov         eax,dword ptr [ebx+924]
 004C11E7    call        TStringGrid.GetCols
 004C11EC    mov         edx,dword ptr [eax]
 004C11EE    call        dword ptr [edx+40];TStrings.Clear
 004C11F1    mov         eax,dword ptr [ebp-14]
 004C11F4    mov         edx,dword ptr [eax]
 004C11F6    call        dword ptr [edx+14];TStringList.GetCount
 004C11F9    mov         esi,eax
 004C11FB    test        esi,esi
>004C11FD    jle         004C124D
 004C11FF    mov         dword ptr [ebp-8],1
 004C1206    lea         ecx,[ebp-1C]
 004C1209    mov         edx,dword ptr [ebp-8]
 004C120C    sub         edx,1
>004C120F    jno         004C1216
 004C1211    call        @IntOver
 004C1216    mov         eax,dword ptr [ebp-14]
 004C1219    mov         edi,dword ptr [eax]
 004C121B    call        dword ptr [edi+0C];TStringList.Get
 004C121E    mov         eax,dword ptr [ebp-1C]
 004C1221    push        eax
 004C1222    mov         ecx,dword ptr [ebp-8]
 004C1225    sub         ecx,1
>004C1228    jno         004C122F
 004C122A    call        @IntOver
 004C122F    mov         edx,dword ptr [ebp-0C]
 004C1232    sub         edx,1
>004C1235    jno         004C123C
 004C1237    call        @IntOver
 004C123C    mov         eax,dword ptr [ebx+924]
 004C1242    call        TStringGrid.SetCells
 004C1247    inc         dword ptr [ebp-8]
 004C124A    dec         esi
>004C124B    jne         004C1206
 004C124D    inc         dword ptr [ebp-0C]
 004C1250    dec         dword ptr [ebp-18]
>004C1253    jne         004C11A6
 004C1259    mov         dl,1
 004C125B    mov         eax,dword ptr [ebp-14]
 004C125E    mov         ecx,dword ptr [eax]
 004C1260    call        dword ptr [ecx-4];TStringList.Destroy
 004C1263    mov         eax,dword ptr [ebx+924]
 004C1269    mov         edx,dword ptr [eax+234]
 004C126F    sub         edx,1
>004C1272    jno         004C1279
 004C1274    call        @IntOver
 004C1279    call        TCustomGrid.SetRowCount
 004C127E    mov         dl,byte ptr [ebp-1]
 004C1281    mov         eax,dword ptr [ebx+91C]
 004C1287    call        004B705C
 004C128C    mov         eax,ebx
 004C128E    call        004BE9E0
 004C1293    and         eax,0FF
 004C1298    test        eax,eax
>004C129A    jle         004C138F
 004C12A0    mov         dword ptr [ebp-18],eax
 004C12A3    mov         dword ptr [ebp-10],1
 004C12AA    mov         eax,ebx
 004C12AC    call        004BEA58
 004C12B1    mov         edi,eax
 004C12B3    and         edi,0FF
 004C12B9    mov         eax,dword ptr [ebp-10]
 004C12BC    sub         eax,1
>004C12BF    jno         004C12C6
 004C12C1    call        @IntOver
 004C12C6    imul        edi,eax
>004C12C9    jno         004C12D0
 004C12CB    call        @IntOver
 004C12D0    xor         eax,eax
 004C12D2    mov         al,byte ptr [ebp-1]
 004C12D5    sub         eax,1
>004C12D8    jno         004C12DF
 004C12DA    call        @IntOver
 004C12DF    add         edi,eax
>004C12E1    jno         004C12E8
 004C12E3    call        @IntOver
 004C12E8    mov         edx,edi
 004C12EA    mov         eax,dword ptr [ebx+928]
 004C12F0    mov         ecx,dword ptr [eax]
 004C12F2    call        dword ptr [ecx+44]
 004C12F5    mov         eax,ebx
 004C12F7    call        004C8AE8
 004C12FC    mov         esi,eax
 004C12FE    and         esi,0FF
 004C1304    test        esi,esi
>004C1306    jle         004C1383
 004C1308    mov         eax,ebx
 004C130A    call        004C8AE8
 004C130F    mov         edi,eax
 004C1311    and         edi,0FF
 004C1317    xor         eax,eax
 004C1319    mov         al,byte ptr [ebp-1]
 004C131C    sub         eax,1
>004C131F    jno         004C1326
 004C1321    call        @IntOver
 004C1326    imul        edi,eax
>004C1329    jno         004C1330
 004C132B    call        @IntOver
 004C1330    mov         eax,ebx
 004C1332    call        004BEA58
 004C1337    and         eax,0FF
 004C133C    mov         edx,dword ptr [ebp-10]
 004C133F    sub         edx,1
>004C1342    jno         004C1349
 004C1344    call        @IntOver
 004C1349    imul        edx
>004C134B    jno         004C1352
 004C134D    call        @IntOver
 004C1352    push        eax
 004C1353    mov         eax,ebx
 004C1355    call        004C8AE8
 004C135A    and         eax,0FF
 004C135F    pop         edx
 004C1360    imul        edx,eax
>004C1363    jno         004C136A
 004C1365    call        @IntOver
 004C136A    add         edi,edx
>004C136C    jno         004C1373
 004C136E    call        @IntOver
 004C1373    mov         edx,edi
 004C1375    mov         eax,dword ptr [ebx+92C]
 004C137B    mov         ecx,dword ptr [eax]
 004C137D    call        dword ptr [ecx+44]
 004C1380    dec         esi
>004C1381    jne         004C1308
 004C1383    inc         dword ptr [ebp-10]
 004C1386    dec         dword ptr [ebp-18]
>004C1389    jne         004C12AA
 004C138F    movzx       esi,byte ptr [ebp-1]
 004C1393    sub         esi,1
>004C1396    jno         004C139D
 004C1398    call        @IntOver
 004C139D    mov         edx,esi
 004C139F    mov         eax,dword ptr [ebx+930]
 004C13A5    mov         ecx,dword ptr [eax]
 004C13A7    call        dword ptr [ecx+44]
 004C13AA    mov         edx,esi
 004C13AC    mov         eax,dword ptr [ebx+938]
 004C13B2    mov         ecx,dword ptr [eax]
 004C13B4    call        dword ptr [ecx+44]
 004C13B7    mov         edx,esi
 004C13B9    mov         eax,dword ptr [ebx+934]
 004C13BF    mov         ecx,dword ptr [eax]
 004C13C1    call        dword ptr [ecx+44]
 004C13C4    mov         byte ptr [ebx+8],1
 004C13C8    mov         eax,ebx
 004C13CA    call        004BE9E0
 004C13CF    and         eax,0FF
 004C13D4    test        eax,eax
>004C13D6    jle         004C1407
 004C13D8    mov         dword ptr [ebp-18],eax
 004C13DB    mov         dword ptr [ebp-10],1
 004C13E2    mov         edx,dword ptr [ebp-10]
 004C13E5    cmp         edx,0FF
>004C13EB    jbe         004C13F2
 004C13ED    call        @BoundErr
 004C13F2    mov         cl,1
 004C13F4    mov         eax,dword ptr [ebx+918]
 004C13FA    call        004B6E84
 004C13FF    inc         dword ptr [ebp-10]
 004C1402    dec         dword ptr [ebp-18]
>004C1405    jne         004C13E2
 004C1407    mov         eax,dword ptr [ebx+944]
 004C140D    mov         edx,dword ptr [eax]
 004C140F    call        dword ptr [edx+40]
 004C1412    mov         eax,ebx
 004C1414    call        004BE9E0
 004C1419    and         eax,0FF
 004C141E    imul        eax,eax,2
>004C1421    jno         004C1428
 004C1423    call        @IntOver
 004C1428    test        eax,eax
>004C142A    jle         004C145A
 004C142C    mov         dword ptr [ebp-18],eax
 004C142F    mov         eax,ebx
 004C1431    call        004BEA58
 004C1436    mov         esi,eax
 004C1438    and         esi,0FF
 004C143E    test        esi,esi
>004C1440    jle         004C1455
 004C1442    mov         edx,4C14C4;'1'
 004C1447    mov         eax,dword ptr [ebx+944]
 004C144D    mov         ecx,dword ptr [eax]
 004C144F    call        dword ptr [ecx+34]
 004C1452    dec         esi
>004C1453    jne         004C1442
 004C1455    dec         dword ptr [ebp-18]
>004C1458    jne         004C142F
 004C145A    mov         eax,dword ptr [ebx+940]
 004C1460    mov         edx,dword ptr [eax]
 004C1462    call        dword ptr [edx+40]
 004C1465    mov         eax,ebx
 004C1467    call        004C4790
 004C146C    and         eax,0FF
 004C1471    test        eax,eax
>004C1473    jle         004C1495
 004C1475    mov         dword ptr [ebp-18],eax
 004C1478    mov         esi,0E
 004C147D    mov         edx,4C14C4;'1'
 004C1482    mov         eax,dword ptr [ebx+940]
 004C1488    mov         ecx,dword ptr [eax]
 004C148A    call        dword ptr [ecx+34]
 004C148D    dec         esi
>004C148E    jne         004C147D
 004C1490    dec         dword ptr [ebp-18]
>004C1493    jne         004C1478
 004C1495    xor         eax,eax
 004C1497    pop         edx
 004C1498    pop         ecx
 004C1499    pop         ecx
 004C149A    mov         dword ptr fs:[eax],edx
 004C149D    push        4C14B2
 004C14A2    lea         eax,[ebp-1C]
 004C14A5    call        @LStrClr
 004C14AA    ret
>004C14AB    jmp         @HandleFinally
>004C14B0    jmp         004C14A2
 004C14B2    pop         edi
 004C14B3    pop         esi
 004C14B4    pop         ebx
 004C14B5    mov         esp,ebp
 004C14B7    pop         ebp
 004C14B8    ret
*}
//end;

//004C14C8
{*////procedure sub_004C14C8(?:dword; ?:ShortString; ?:?; ?:?);
begin
 004C14C8    push        ebp
 004C14C9    mov         ebp,esp
 004C14CB    add         esp,0FFFFFCD0
 004C14D1    push        ebx
 004C14D2    push        esi
 004C14D3    push        edi
 004C14D4    xor         ebx,ebx
 004C14D6    mov         dword ptr [ebp-330],ebx
 004C14DC    mov         dword ptr [ebp-32C],ebx
 004C14E2    mov         dword ptr [ebp-328],ebx
 004C14E8    mov         dword ptr [ebp-324],ebx
 004C14EE    mov         dword ptr [ebp-320],ebx
 004C14F4    mov         esi,dword ptr [ebp+0C]
 004C14F7    lea         edi,[ebp-31C]
 004C14FD    push        ecx
 004C14FE    xor         ecx,ecx
 004C1500    mov         cl,byte ptr [esi]
 004C1502    inc         ecx
 004C1503    rep movs    byte ptr [edi],byte ptr [esi]
 004C1505    pop         ecx
 004C1506    mov         esi,ecx
 004C1508    lea         edi,[ebp-21C]
 004C150E    xor         ecx,ecx
 004C1510    mov         cl,byte ptr [esi]
 004C1512    inc         ecx
 004C1513    rep movs    byte ptr [edi],byte ptr [esi]
 004C1515    mov         esi,edx
 004C1517    lea         edi,[ebp-11C]
 004C151D    xor         ecx,ecx
 004C151F    mov         cl,byte ptr [esi]
 004C1521    inc         ecx
 004C1522    rep movs    byte ptr [edi],byte ptr [esi]
 004C1524    mov         ebx,eax
 004C1526    xor         eax,eax
 004C1528    push        ebp
 004C1529    push        4C1920
 004C152E    push        dword ptr fs:[eax]
 004C1531    mov         dword ptr fs:[eax],esp
 004C1534    mov         eax,ebx
 004C1536    call        004BEA58
 004C153B    cmp         al,32
>004C153D    jae         004C1902
 004C1543    mov         eax,dword ptr [ebx+924]
 004C1549    mov         edx,dword ptr [eax+234]
 004C154F    add         edx,1
>004C1552    jno         004C1559
 004C1554    call        @IntOver
 004C1559    call        TCustomGrid.SetRowCount
 004C155E    lea         eax,[ebp-320]
 004C1564    lea         edx,[ebp-11C]
 004C156A    call        @LStrFromString
 004C156F    mov         edx,dword ptr [ebp-320]
 004C1575    mov         eax,dword ptr [ebx+91C]
 004C157B    call        004B7010
 004C1580    mov         eax,dword ptr [ebx+91C]
 004C1586    call        004B700C
 004C158B    push        eax
 004C158C    lea         eax,[ebp-324]
 004C1592    lea         edx,[ebp-11C]
 004C1598    call        @LStrFromString
 004C159D    mov         edx,dword ptr [ebp-324]
 004C15A3    pop         eax
 004C15A4    mov         ecx,dword ptr [eax]
 004C15A6    call        dword ptr [ecx+50]
 004C15A9    mov         dword ptr [ebp-8],eax
 004C15AC    mov         dl,1
 004C15AE    mov         eax,[004120B8];TStringList
 004C15B3    call        TObject.Create;TStringList.Create
 004C15B8    mov         dword ptr [ebp-18],eax
 004C15BB    mov         eax,ebx
 004C15BD    call        004C4790
 004C15C2    and         eax,0FF
 004C15C7    test        eax,eax
>004C15C9    jle         004C169F
 004C15CF    mov         dword ptr [ebp-1C],eax
 004C15D2    mov         dword ptr [ebp-0C],1
 004C15D9    mov         eax,dword ptr [ebp-18]
 004C15DC    mov         edx,dword ptr [eax]
 004C15DE    call        dword ptr [edx+40];TStringList.Clear
 004C15E1    mov         esi,dword ptr [ebp-0C]
 004C15E4    sub         esi,1
>004C15E7    jno         004C15EE
 004C15E9    call        @IntOver
 004C15EE    mov         edx,esi
 004C15F0    mov         eax,dword ptr [ebx+924]
 004C15F6    call        TStringGrid.GetCols
 004C15FB    mov         edx,eax
 004C15FD    mov         eax,dword ptr [ebp-18]
 004C1600    mov         ecx,dword ptr [eax]
 004C1602    call        dword ptr [ecx+3C];TStrings.AddStrings
 004C1605    mov         edx,dword ptr [ebp-8]
 004C1608    add         edx,1
>004C160B    jno         004C1612
 004C160D    call        @IntOver
 004C1612    mov         ecx,4C1938;'abs'
 004C1617    mov         eax,dword ptr [ebp-18]
 004C161A    mov         edi,dword ptr [eax]
 004C161C    call        dword ptr [edi+54];TStringList.Insert
 004C161F    mov         edx,esi
 004C1621    mov         eax,dword ptr [ebx+924]
 004C1627    call        TStringGrid.GetCols
 004C162C    mov         edx,dword ptr [eax]
 004C162E    call        dword ptr [edx+40];TStrings.Clear
 004C1631    mov         eax,dword ptr [ebp-18]
 004C1634    mov         edx,dword ptr [eax]
 004C1636    call        dword ptr [edx+14];TStringList.GetCount
 004C1639    mov         esi,eax
 004C163B    test        esi,esi
>004C163D    jle         004C1693
 004C163F    mov         dword ptr [ebp-4],1
 004C1646    lea         ecx,[ebp-328]
 004C164C    mov         edx,dword ptr [ebp-4]
 004C164F    sub         edx,1
>004C1652    jno         004C1659
 004C1654    call        @IntOver
 004C1659    mov         eax,dword ptr [ebp-18]
 004C165C    mov         edi,dword ptr [eax]
 004C165E    call        dword ptr [edi+0C];TStringList.Get
 004C1661    mov         eax,dword ptr [ebp-328]
 004C1667    push        eax
 004C1668    mov         ecx,dword ptr [ebp-4]
 004C166B    sub         ecx,1
>004C166E    jno         004C1675
 004C1670    call        @IntOver
 004C1675    mov         edx,dword ptr [ebp-0C]
 004C1678    sub         edx,1
>004C167B    jno         004C1682
 004C167D    call        @IntOver
 004C1682    mov         eax,dword ptr [ebx+924]
 004C1688    call        TStringGrid.SetCells
 004C168D    inc         dword ptr [ebp-4]
 004C1690    dec         esi
>004C1691    jne         004C1646
 004C1693    inc         dword ptr [ebp-0C]
 004C1696    dec         dword ptr [ebp-1C]
>004C1699    jne         004C15D9
 004C169F    mov         eax,ebx
 004C16A1    call        004BE9E0
 004C16A6    and         eax,0FF
 004C16AB    test        eax,eax
>004C16AD    jle         004C17B2
 004C16B3    mov         dword ptr [ebp-1C],eax
 004C16B6    mov         dword ptr [ebp-10],1
 004C16BD    mov         eax,ebx
 004C16BF    call        004BEA58
 004C16C4    mov         edi,eax
 004C16C6    and         edi,0FF
 004C16CC    mov         eax,dword ptr [ebp-10]
 004C16CF    sub         eax,1
>004C16D2    jno         004C16D9
 004C16D4    call        @IntOver
 004C16D9    imul        edi,eax
>004C16DC    jno         004C16E3
 004C16DE    call        @IntOver
 004C16E3    add         edi,dword ptr [ebp-8]
>004C16E6    jno         004C16ED
 004C16E8    call        @IntOver
 004C16ED    xor         ecx,ecx
 004C16EF    mov         edx,edi
 004C16F1    mov         eax,dword ptr [ebx+928]
 004C16F7    mov         esi,dword ptr [eax]
 004C16F9    call        dword ptr [esi+54]
 004C16FC    mov         eax,ebx
 004C16FE    call        004C8AE8
 004C1703    mov         esi,eax
 004C1705    and         esi,0FF
 004C170B    test        esi,esi
>004C170D    jle         004C17A6
 004C1713    mov         dword ptr [ebp-14],1
 004C171A    mov         eax,ebx
 004C171C    call        004C8AE8
 004C1721    mov         edi,eax
 004C1723    and         edi,0FF
 004C1729    imul        edi,dword ptr [ebp-8]
>004C172D    jno         004C1734
 004C172F    call        @IntOver
 004C1734    mov         eax,dword ptr [ebp-14]
 004C1737    sub         eax,1
>004C173A    jno         004C1741
 004C173C    call        @IntOver
 004C1741    add         edi,eax
>004C1743    jno         004C174A
 004C1745    call        @IntOver
 004C174A    mov         eax,ebx
 004C174C    call        004BEA58
 004C1751    and         eax,0FF
 004C1756    mov         edx,dword ptr [ebp-10]
 004C1759    sub         edx,1
>004C175C    jno         004C1763
 004C175E    call        @IntOver
 004C1763    imul        edx
>004C1765    jno         004C176C
 004C1767    call        @IntOver
 004C176C    push        eax
 004C176D    mov         eax,ebx
 004C176F    call        004C8AE8
 004C1774    and         eax,0FF
 004C1779    pop         edx
 004C177A    imul        edx,eax
>004C177D    jno         004C1784
 004C177F    call        @IntOver
 004C1784    add         edi,edx
>004C1786    jno         004C178D
 004C1788    call        @IntOver
 004C178D    xor         ecx,ecx
 004C178F    mov         edx,edi
 004C1791    mov         eax,dword ptr [ebx+92C]
 004C1797    mov         edi,dword ptr [eax]
 004C1799    call        dword ptr [edi+54]
 004C179C    inc         dword ptr [ebp-14]
 004C179F    dec         esi
>004C17A0    jne         004C171A
 004C17A6    inc         dword ptr [ebp-10]
 004C17A9    dec         dword ptr [ebp-1C]
>004C17AC    jne         004C16BD
 004C17B2    lea         eax,[ebp-32C]
 004C17B8    lea         edx,[ebp-21C]
 004C17BE    call        @LStrFromString
 004C17C3    mov         ecx,dword ptr [ebp-32C]
 004C17C9    mov         edx,dword ptr [ebp-8]
 004C17CC    mov         eax,dword ptr [ebx+930]
 004C17D2    mov         esi,dword ptr [eax]
 004C17D4    call        dword ptr [esi+54]
 004C17D7    cmp         byte ptr [ebp+8],0
>004C17DB    je          004C17F2
 004C17DD    mov         ecx,4C1944;'R'
 004C17E2    mov         edx,dword ptr [ebp-8]
 004C17E5    mov         eax,dword ptr [ebx+938]
 004C17EB    mov         esi,dword ptr [eax]
 004C17ED    call        dword ptr [esi+54]
>004C17F0    jmp         004C1802
 004C17F2    xor         ecx,ecx
 004C17F4    mov         edx,dword ptr [ebp-8]
 004C17F7    mov         eax,dword ptr [ebx+938]
 004C17FD    mov         esi,dword ptr [eax]
 004C17FF    call        dword ptr [esi+54]
 004C1802    lea         eax,[ebp-330]
 004C1808    lea         edx,[ebp-31C]
 004C180E    call        @LStrFromString
 004C1813    mov         ecx,dword ptr [ebp-330]
 004C1819    mov         edx,dword ptr [ebp-8]
 004C181C    mov         eax,dword ptr [ebx+934]
 004C1822    mov         esi,dword ptr [eax]
 004C1824    call        dword ptr [esi+54]
 004C1827    mov         byte ptr [ebx+8],1
 004C182B    mov         eax,ebx
 004C182D    call        004BE9E0
 004C1832    and         eax,0FF
 004C1837    test        eax,eax
>004C1839    jle         004C186A
 004C183B    mov         dword ptr [ebp-1C],eax
 004C183E    mov         dword ptr [ebp-10],1
 004C1845    mov         edx,dword ptr [ebp-10]
 004C1848    cmp         edx,0FF
>004C184E    jbe         004C1855
 004C1850    call        @BoundErr
 004C1855    mov         cl,1
 004C1857    mov         eax,dword ptr [ebx+918]
 004C185D    call        004B6E84
 004C1862    inc         dword ptr [ebp-10]
 004C1865    dec         dword ptr [ebp-1C]
>004C1868    jne         004C1845
 004C186A    mov         dl,1
 004C186C    mov         eax,dword ptr [ebp-18]
 004C186F    mov         ecx,dword ptr [eax]
 004C1871    call        dword ptr [ecx-4];TStringList.Destroy
 004C1874    mov         eax,dword ptr [ebx+944]
 004C187A    mov         edx,dword ptr [eax]
 004C187C    call        dword ptr [edx+40]
 004C187F    mov         eax,ebx
 004C1881    call        004BE9E0
 004C1886    and         eax,0FF
 004C188B    imul        eax,eax,2
>004C188E    jno         004C1895
 004C1890    call        @IntOver
 004C1895    test        eax,eax
>004C1897    jle         004C18C7
 004C1899    mov         dword ptr [ebp-1C],eax
 004C189C    mov         eax,ebx
 004C189E    call        004BEA58
 004C18A3    mov         esi,eax
 004C18A5    and         esi,0FF
 004C18AB    test        esi,esi
>004C18AD    jle         004C18C2
 004C18AF    mov         edx,4C1950;'1'
 004C18B4    mov         eax,dword ptr [ebx+944]
 004C18BA    mov         ecx,dword ptr [eax]
 004C18BC    call        dword ptr [ecx+34]
 004C18BF    dec         esi
>004C18C0    jne         004C18AF
 004C18C2    dec         dword ptr [ebp-1C]
>004C18C5    jne         004C189C
 004C18C7    mov         eax,dword ptr [ebx+940]
 004C18CD    mov         edx,dword ptr [eax]
 004C18CF    call        dword ptr [edx+40]
 004C18D2    mov         eax,ebx
 004C18D4    call        004C4790
 004C18D9    and         eax,0FF
 004C18DE    test        eax,eax
>004C18E0    jle         004C1902
 004C18E2    mov         dword ptr [ebp-1C],eax
 004C18E5    mov         esi,0E
 004C18EA    mov         edx,4C1950;'1'
 004C18EF    mov         eax,dword ptr [ebx+940]
 004C18F5    mov         ecx,dword ptr [eax]
 004C18F7    call        dword ptr [ecx+34]
 004C18FA    dec         esi
>004C18FB    jne         004C18EA
 004C18FD    dec         dword ptr [ebp-1C]
>004C1900    jne         004C18E5
 004C1902    xor         eax,eax
 004C1904    pop         edx
 004C1905    pop         ecx
 004C1906    pop         ecx
 004C1907    mov         dword ptr fs:[eax],edx
 004C190A    push        4C1927
 004C190F    lea         eax,[ebp-330]
 004C1915    mov         edx,5
 004C191A    call        @LStrArrayClr
 004C191F    ret
>004C1920    jmp         @HandleFinally
>004C1925    jmp         004C190F
 004C1927    pop         edi
 004C1928    pop         esi
 004C1929    pop         ebx
 004C192A    mov         esp,ebp
 004C192C    pop         ebp
 004C192D    ret         8
//end;*}

//004C1954
{*////procedure sub_004C1954(?:dword; ?:dword; ?:?; ?:?);
begin
 004C1954    push        ebp
 004C1955    mov         ebp,esp
 004C1957    add         esp,0FFFFFCB4
 004C195D    push        ebx
 004C195E    push        esi
 004C195F    push        edi
 004C1960    xor         ebx,ebx
 004C1962    mov         dword ptr [ebp-34C],ebx
 004C1968    mov         dword ptr [ebp-348],ebx
 004C196E    mov         dword ptr [ebp-344],ebx
 004C1974    mov         dword ptr [ebp-340],ebx
 004C197A    mov         dword ptr [ebp-33C],ebx
 004C1980    mov         dword ptr [ebp-238],ebx
 004C1986    mov         dword ptr [ebp-234],ebx
 004C198C    mov         dword ptr [ebp-230],ebx
 004C1992    mov         dword ptr [ebp-22C],ebx
 004C1998    mov         dword ptr [ebp-228],ebx
 004C199E    mov         esi,dword ptr [ebp+0C]
 004C19A1    lea         edi,[ebp-224]
 004C19A7    push        ecx
 004C19A8    xor         ecx,ecx
 004C19AA    mov         cl,byte ptr [esi]
 004C19AC    inc         ecx
 004C19AD    rep movs    byte ptr [edi],byte ptr [esi]
 004C19AF    pop         ecx
 004C19B0    mov         esi,ecx
 004C19B2    lea         edi,[ebp-124]
 004C19B8    xor         ecx,ecx
 004C19BA    mov         cl,byte ptr [esi]
 004C19BC    inc         ecx
 004C19BD    rep movs    byte ptr [edi],byte ptr [esi]
 004C19BF    mov         byte ptr [ebp-1],dl
 004C19C2    mov         ebx,eax
 004C19C4    xor         eax,eax
 004C19C6    push        ebp
 004C19C7    push        4C211D
 004C19CC    push        dword ptr fs:[eax]
 004C19CF    mov         dword ptr fs:[eax],esp
 004C19D2    mov         dl,byte ptr [ebp-1]
 004C19D5    mov         eax,dword ptr [ebx+91C]
 004C19DB    call        004B705C
 004C19E0    lea         eax,[ebp-228]
 004C19E6    lea         edx,[ebp-124]
 004C19EC    call        @LStrFromString
 004C19F1    mov         edx,dword ptr [ebp-228]
 004C19F7    mov         eax,dword ptr [ebx+91C]
 004C19FD    call        004B7010
 004C1A02    mov         eax,dword ptr [ebx+91C]
 004C1A08    call        004B700C
 004C1A0D    push        eax
 004C1A0E    lea         eax,[ebp-22C]
 004C1A14    lea         edx,[ebp-124]
 004C1A1A    call        @LStrFromString
 004C1A1F    mov         edx,dword ptr [ebp-22C]
 004C1A25    pop         eax
 004C1A26    mov         ecx,dword ptr [eax]
 004C1A28    call        dword ptr [ecx+50]
 004C1A2B    mov         dword ptr [ebp-0C],eax
 004C1A2E    xor         esi,esi
 004C1A30    mov         eax,ebx
 004C1A32    call        004BE9E0
 004C1A37    and         eax,0FF
 004C1A3C    test        eax,eax
>004C1A3E    jle         004C1A84
 004C1A40    mov         dword ptr [ebp-24],eax
 004C1A43    mov         dword ptr [ebp-8],1
 004C1A4A    lea         ecx,[ebp-230]
 004C1A50    mov         edx,dword ptr [ebp-8]
 004C1A53    sub         edx,1
>004C1A56    jno         004C1A5D
 004C1A58    call        @IntOver
 004C1A5D    mov         eax,dword ptr [ebx+920]
 004C1A63    mov         edi,dword ptr [eax]
 004C1A65    call        dword ptr [edi+0C]
 004C1A68    mov         eax,dword ptr [ebp-230]
 004C1A6E    call        StrToInt
 004C1A73    add         esi,eax
>004C1A75    jno         004C1A7C
 004C1A77    call        @IntOver
 004C1A7C    inc         dword ptr [ebp-8]
 004C1A7F    dec         dword ptr [ebp-24]
>004C1A82    jne         004C1A4A
 004C1A84    mov         dl,1
 004C1A86    mov         eax,[004120B8];TStringList
 004C1A8B    call        TObject.Create;TStringList.Create
 004C1A90    mov         dword ptr [ebp-20],eax
 004C1A93    test        esi,esi
>004C1A95    jle         004C1B6B
 004C1A9B    mov         dword ptr [ebp-24],esi
 004C1A9E    mov         dword ptr [ebp-10],1
 004C1AA5    mov         eax,dword ptr [ebp-20]
 004C1AA8    mov         edx,dword ptr [eax]
 004C1AAA    call        dword ptr [edx+40];TStringList.Clear
 004C1AAD    mov         esi,dword ptr [ebp-10]
 004C1AB0    sub         esi,1
>004C1AB3    jno         004C1ABA
 004C1AB5    call        @IntOver
 004C1ABA    mov         edx,esi
 004C1ABC    mov         eax,dword ptr [ebx+924]
 004C1AC2    call        TStringGrid.GetCols
 004C1AC7    mov         edx,eax
 004C1AC9    mov         eax,dword ptr [ebp-20]
 004C1ACC    mov         ecx,dword ptr [eax]
 004C1ACE    call        dword ptr [ecx+3C];TStrings.AddStrings
 004C1AD1    mov         ecx,dword ptr [ebp-0C]
 004C1AD4    add         ecx,1
>004C1AD7    jno         004C1ADE
 004C1AD9    call        @IntOver
 004C1ADE    xor         edx,edx
 004C1AE0    mov         dl,byte ptr [ebp-1]
 004C1AE3    mov         eax,dword ptr [ebp-20]
 004C1AE6    mov         edi,dword ptr [eax]
 004C1AE8    call        dword ptr [edi+60];TStrings.Move
 004C1AEB    mov         edx,esi
 004C1AED    mov         eax,dword ptr [ebx+924]
 004C1AF3    call        TStringGrid.GetCols
 004C1AF8    mov         edx,dword ptr [eax]
 004C1AFA    call        dword ptr [edx+40];TStrings.Clear
 004C1AFD    mov         eax,dword ptr [ebp-20]
 004C1B00    mov         edx,dword ptr [eax]
 004C1B02    call        dword ptr [edx+14];TStringList.GetCount
 004C1B05    mov         esi,eax
 004C1B07    test        esi,esi
>004C1B09    jle         004C1B5F
 004C1B0B    mov         dword ptr [ebp-8],1
 004C1B12    lea         ecx,[ebp-234]
 004C1B18    mov         edx,dword ptr [ebp-8]
 004C1B1B    sub         edx,1
>004C1B1E    jno         004C1B25
 004C1B20    call        @IntOver
 004C1B25    mov         eax,dword ptr [ebp-20]
 004C1B28    mov         edi,dword ptr [eax]
 004C1B2A    call        dword ptr [edi+0C];TStringList.Get
 004C1B2D    mov         eax,dword ptr [ebp-234]
 004C1B33    push        eax
 004C1B34    mov         ecx,dword ptr [ebp-8]
 004C1B37    sub         ecx,1
>004C1B3A    jno         004C1B41
 004C1B3C    call        @IntOver
 004C1B41    mov         edx,dword ptr [ebp-10]
 004C1B44    sub         edx,1
>004C1B47    jno         004C1B4E
 004C1B49    call        @IntOver
 004C1B4E    mov         eax,dword ptr [ebx+924]
 004C1B54    call        TStringGrid.SetCells
 004C1B59    inc         dword ptr [ebp-8]
 004C1B5C    dec         esi
>004C1B5D    jne         004C1B12
 004C1B5F    inc         dword ptr [ebp-10]
 004C1B62    dec         dword ptr [ebp-24]
>004C1B65    jne         004C1AA5
 004C1B6B    mov         eax,dword ptr [ebp-20]
 004C1B6E    mov         edx,dword ptr [eax]
 004C1B70    call        dword ptr [edx+40];TStringList.Clear
 004C1B73    mov         eax,ebx
 004C1B75    call        004BEA58
 004C1B7A    and         eax,0FF
 004C1B7F    test        eax,eax
>004C1B81    jle         004C1BD5
 004C1B83    mov         dword ptr [ebp-24],eax
 004C1B86    mov         esi,1
 004C1B8B    xor         eax,eax
 004C1B8D    mov         al,byte ptr [ebp-1]
 004C1B90    cmp         esi,eax
>004C1B92    je          004C1BCF
 004C1B94    lea         ecx,[ebp-338]
 004C1B9A    mov         edx,esi
 004C1B9C    cmp         edx,0FF
>004C1BA2    jbe         004C1BA9
 004C1BA4    call        @BoundErr
 004C1BA9    mov         eax,ebx
 004C1BAB    call        004C8BB8
 004C1BB0    lea         edx,[ebp-338]
 004C1BB6    lea         eax,[ebp-238]
 004C1BBC    call        @LStrFromString
 004C1BC1    mov         edx,dword ptr [ebp-238]
 004C1BC7    mov         eax,dword ptr [ebp-20]
 004C1BCA    mov         ecx,dword ptr [eax]
 004C1BCC    call        dword ptr [ecx+34];TStringList.Add
 004C1BCF    inc         esi
 004C1BD0    dec         dword ptr [ebp-24]
>004C1BD3    jne         004C1B8B
 004C1BD5    mov         eax,dword ptr [ebx+930]
 004C1BDB    mov         edx,dword ptr [eax]
 004C1BDD    call        dword ptr [edx+40]
 004C1BE0    mov         edx,dword ptr [ebp-20]
 004C1BE3    mov         eax,dword ptr [ebx+930]
 004C1BE9    mov         ecx,dword ptr [eax]
 004C1BEB    call        dword ptr [ecx+3C]
 004C1BEE    lea         eax,[ebp-33C]
 004C1BF4    lea         edx,[ebp-224]
 004C1BFA    call        @LStrFromString
 004C1BFF    mov         ecx,dword ptr [ebp-33C]
 004C1C05    mov         edx,dword ptr [ebp-0C]
 004C1C08    mov         eax,dword ptr [ebx+930]
 004C1C0E    mov         esi,dword ptr [eax]
 004C1C10    call        dword ptr [esi+54]
 004C1C13    mov         eax,dword ptr [ebp-20]
 004C1C16    mov         edx,dword ptr [eax]
 004C1C18    call        dword ptr [edx+40];TStringList.Clear
 004C1C1B    mov         eax,ebx
 004C1C1D    call        004BEA58
 004C1C22    and         eax,0FF
 004C1C27    test        eax,eax
>004C1C29    jle         004C1C75
 004C1C2B    mov         dword ptr [ebp-24],eax
 004C1C2E    mov         esi,1
 004C1C33    xor         eax,eax
 004C1C35    mov         al,byte ptr [ebp-1]
 004C1C38    cmp         esi,eax
>004C1C3A    je          004C1C6F
 004C1C3C    mov         edx,esi
 004C1C3E    cmp         edx,0FF
>004C1C44    jbe         004C1C4B
 004C1C46    call        @BoundErr
 004C1C4B    mov         eax,ebx
 004C1C4D    call        004C8E50
 004C1C52    test        al,al
>004C1C54    je          004C1C65
 004C1C56    mov         edx,4C2138;'R'
 004C1C5B    mov         eax,dword ptr [ebp-20]
 004C1C5E    mov         ecx,dword ptr [eax]
 004C1C60    call        dword ptr [ecx+34];TStringList.Add
>004C1C63    jmp         004C1C6F
 004C1C65    xor         edx,edx
 004C1C67    mov         eax,dword ptr [ebp-20]
 004C1C6A    mov         ecx,dword ptr [eax]
 004C1C6C    call        dword ptr [ecx+34];TStringList.Add
 004C1C6F    inc         esi
 004C1C70    dec         dword ptr [ebp-24]
>004C1C73    jne         004C1C33
 004C1C75    mov         eax,dword ptr [ebx+938]
 004C1C7B    mov         edx,dword ptr [eax]
 004C1C7D    call        dword ptr [edx+40]
 004C1C80    mov         edx,dword ptr [ebp-20]
 004C1C83    mov         eax,dword ptr [ebx+938]
 004C1C89    mov         ecx,dword ptr [eax]
 004C1C8B    call        dword ptr [ecx+3C]
 004C1C8E    cmp         byte ptr [ebp+8],0
>004C1C92    je          004C1CA9
 004C1C94    mov         ecx,4C2138;'R'
 004C1C99    mov         edx,dword ptr [ebp-0C]
 004C1C9C    mov         eax,dword ptr [ebx+938]
 004C1CA2    mov         esi,dword ptr [eax]
 004C1CA4    call        dword ptr [esi+54]
>004C1CA7    jmp         004C1CB9
 004C1CA9    xor         ecx,ecx
 004C1CAB    mov         edx,dword ptr [ebp-0C]
 004C1CAE    mov         eax,dword ptr [ebx+938]
 004C1CB4    mov         esi,dword ptr [eax]
 004C1CB6    call        dword ptr [esi+54]
 004C1CB9    mov         eax,dword ptr [ebp-20]
 004C1CBC    mov         edx,dword ptr [eax]
 004C1CBE    call        dword ptr [edx+40];TStringList.Clear
 004C1CC1    mov         eax,ebx
 004C1CC3    call        004BE9E0
 004C1CC8    and         eax,0FF
 004C1CCD    test        eax,eax
>004C1CCF    jle         004C1D57
 004C1CD5    mov         dword ptr [ebp-24],eax
 004C1CD8    mov         dword ptr [ebp-14],1
 004C1CDF    mov         eax,ebx
 004C1CE1    call        004C8AE8
 004C1CE6    mov         esi,eax
 004C1CE8    and         esi,0FF
 004C1CEE    test        esi,esi
>004C1CF0    jle         004C1D4F
 004C1CF2    mov         dword ptr [ebp-18],1
 004C1CF9    mov         eax,dword ptr [ebp-18]
 004C1CFC    cmp         eax,0FF
>004C1D01    jbe         004C1D08
 004C1D03    call        @BoundErr
 004C1D08    push        eax
 004C1D09    lea         eax,[ebp-338]
 004C1D0F    push        eax
 004C1D10    mov         edx,dword ptr [ebp-14]
 004C1D13    cmp         edx,0FF
>004C1D19    jbe         004C1D20
 004C1D1B    call        @BoundErr
 004C1D20    mov         cl,byte ptr [ebp-1]
 004C1D23    mov         eax,ebx
 004C1D25    call        004C2C00
 004C1D2A    lea         edx,[ebp-338]
 004C1D30    lea         eax,[ebp-340]
 004C1D36    call        @LStrFromString
 004C1D3B    mov         edx,dword ptr [ebp-340]
 004C1D41    mov         eax,dword ptr [ebp-20]
 004C1D44    mov         ecx,dword ptr [eax]
 004C1D46    call        dword ptr [ecx+34];TStringList.Add
 004C1D49    inc         dword ptr [ebp-18]
 004C1D4C    dec         esi
>004C1D4D    jne         004C1CF9
 004C1D4F    inc         dword ptr [ebp-14]
 004C1D52    dec         dword ptr [ebp-24]
>004C1D55    jne         004C1CDF
 004C1D57    xor         edi,edi
 004C1D59    mov         eax,ebx
 004C1D5B    call        004BE9E0
 004C1D60    and         eax,0FF
 004C1D65    test        eax,eax
>004C1D67    jle         004C1E39
 004C1D6D    mov         dword ptr [ebp-24],eax
 004C1D70    mov         dword ptr [ebp-14],1
 004C1D77    mov         eax,ebx
 004C1D79    call        004C8AE8
 004C1D7E    mov         esi,eax
 004C1D80    and         esi,0FF
 004C1D86    test        esi,esi
>004C1D88    jle         004C1E18
 004C1D8E    mov         eax,ebx
 004C1D90    call        004C8AE8
 004C1D95    and         eax,0FF
 004C1D9A    xor         edx,edx
 004C1D9C    mov         dl,byte ptr [ebp-1]
 004C1D9F    sub         edx,1
>004C1DA2    jno         004C1DA9
 004C1DA4    call        @IntOver
 004C1DA9    imul        edx
>004C1DAB    jno         004C1DB2
 004C1DAD    call        @IntOver
 004C1DB2    push        eax
 004C1DB3    mov         eax,ebx
 004C1DB5    call        004BEA58
 004C1DBA    and         eax,0FF
 004C1DBF    mov         edx,dword ptr [ebp-14]
 004C1DC2    sub         edx,1
>004C1DC5    jno         004C1DCC
 004C1DC7    call        @IntOver
 004C1DCC    imul        edx
>004C1DCE    jno         004C1DD5
 004C1DD0    call        @IntOver
 004C1DD5    push        eax
 004C1DD6    mov         eax,ebx
 004C1DD8    call        004C8AE8
 004C1DDD    and         eax,0FF
 004C1DE2    pop         edx
 004C1DE3    imul        edx,eax
>004C1DE6    jno         004C1DED
 004C1DE8    call        @IntOver
 004C1DED    pop         eax
 004C1DEE    add         eax,edx
>004C1DF0    jno         004C1DF7
 004C1DF2    call        @IntOver
 004C1DF7    sub         eax,edi
>004C1DF9    jno         004C1E00
 004C1DFB    call        @IntOver
 004C1E00    mov         dword ptr [ebp-1C],eax
 004C1E03    mov         edx,dword ptr [ebp-1C]
 004C1E06    mov         eax,dword ptr [ebx+92C]
 004C1E0C    mov         ecx,dword ptr [eax]
 004C1E0E    call        dword ptr [ecx+44]
 004C1E11    dec         esi
>004C1E12    jne         004C1D8E
 004C1E18    mov         eax,ebx
 004C1E1A    call        004C8AE8
 004C1E1F    and         eax,0FF
 004C1E24    add         edi,eax
>004C1E26    jno         004C1E2D
 004C1E28    call        @IntOver
 004C1E2D    inc         dword ptr [ebp-14]
 004C1E30    dec         dword ptr [ebp-24]
>004C1E33    jne         004C1D77
 004C1E39    mov         eax,ebx
 004C1E3B    call        004BE9E0
 004C1E40    and         eax,0FF
 004C1E45    test        eax,eax
>004C1E47    jle         004C1F2F
 004C1E4D    mov         dword ptr [ebp-24],eax
 004C1E50    mov         dword ptr [ebp-14],1
 004C1E57    mov         eax,ebx
 004C1E59    call        004C8AE8
 004C1E5E    mov         esi,eax
 004C1E60    and         esi,0FF
 004C1E66    test        esi,esi
>004C1E68    jle         004C1F23
 004C1E6E    mov         dword ptr [ebp-18],1
 004C1E75    mov         eax,ebx
 004C1E77    call        004C8AE8
 004C1E7C    mov         edi,eax
 004C1E7E    and         edi,0FF
 004C1E84    imul        edi,dword ptr [ebp-0C]
>004C1E88    jno         004C1E8F
 004C1E8A    call        @IntOver
 004C1E8F    mov         eax,dword ptr [ebp-18]
 004C1E92    sub         eax,1
>004C1E95    jno         004C1E9C
 004C1E97    call        @IntOver
 004C1E9C    add         edi,eax
>004C1E9E    jno         004C1EA5
 004C1EA0    call        @IntOver
 004C1EA5    mov         eax,ebx
 004C1EA7    call        004BEA58
 004C1EAC    and         eax,0FF
 004C1EB1    mov         edx,dword ptr [ebp-14]
 004C1EB4    sub         edx,1
>004C1EB7    jno         004C1EBE
 004C1EB9    call        @IntOver
 004C1EBE    imul        edx
>004C1EC0    jno         004C1EC7
 004C1EC2    call        @IntOver
 004C1EC7    push        eax
 004C1EC8    mov         eax,ebx
 004C1ECA    call        004C8AE8
 004C1ECF    and         eax,0FF
 004C1ED4    pop         edx
 004C1ED5    imul        edx,eax
>004C1ED8    jno         004C1EDF
 004C1EDA    call        @IntOver
 004C1EDF    add         edi,edx
>004C1EE1    jno         004C1EE8
 004C1EE3    call        @IntOver
 004C1EE8    mov         dword ptr [ebp-1C],edi
 004C1EEB    lea         ecx,[ebp-344]
 004C1EF1    xor         edx,edx
 004C1EF3    mov         eax,dword ptr [ebp-20]
 004C1EF6    mov         edi,dword ptr [eax]
 004C1EF8    call        dword ptr [edi+0C];TStringList.Get
 004C1EFB    mov         ecx,dword ptr [ebp-344]
 004C1F01    mov         edx,dword ptr [ebp-1C]
 004C1F04    mov         eax,dword ptr [ebx+92C]
 004C1F0A    mov         edi,dword ptr [eax]
 004C1F0C    call        dword ptr [edi+54]
 004C1F0F    xor         edx,edx
 004C1F11    mov         eax,dword ptr [ebp-20]
 004C1F14    mov         ecx,dword ptr [eax]
 004C1F16    call        dword ptr [ecx+44];TStringList.Delete
 004C1F19    inc         dword ptr [ebp-18]
 004C1F1C    dec         esi
>004C1F1D    jne         004C1E75
 004C1F23    inc         dword ptr [ebp-14]
 004C1F26    dec         dword ptr [ebp-24]
>004C1F29    jne         004C1E57
 004C1F2F    mov         eax,dword ptr [ebp-20]
 004C1F32    mov         edx,dword ptr [eax]
 004C1F34    call        dword ptr [edx+40];TStringList.Clear
 004C1F37    mov         eax,ebx
 004C1F39    call        004BE9E0
 004C1F3E    and         eax,0FF
 004C1F43    test        eax,eax
>004C1F45    jle         004C1F99
 004C1F47    mov         dword ptr [ebp-24],eax
 004C1F4A    mov         dword ptr [ebp-14],1
 004C1F51    lea         eax,[ebp-338]
 004C1F57    push        eax
 004C1F58    mov         edx,dword ptr [ebp-14]
 004C1F5B    cmp         edx,0FF
>004C1F61    jbe         004C1F68
 004C1F63    call        @BoundErr
 004C1F68    mov         cl,byte ptr [ebp-1]
 004C1F6B    mov         eax,ebx
 004C1F6D    call        004C2B38
 004C1F72    lea         edx,[ebp-338]
 004C1F78    lea         eax,[ebp-348]
 004C1F7E    call        @LStrFromString
 004C1F83    mov         edx,dword ptr [ebp-348]
 004C1F89    mov         eax,dword ptr [ebp-20]
 004C1F8C    mov         ecx,dword ptr [eax]
 004C1F8E    call        dword ptr [ecx+34];TStringList.Add
 004C1F91    inc         dword ptr [ebp-14]
 004C1F94    dec         dword ptr [ebp-24]
>004C1F97    jne         004C1F51
 004C1F99    mov         eax,ebx
 004C1F9B    call        004BE9E0
 004C1FA0    and         eax,0FF
 004C1FA5    test        eax,eax
>004C1FA7    jle         004C201C
 004C1FA9    mov         dword ptr [ebp-24],eax
 004C1FAC    mov         dword ptr [ebp-14],1
 004C1FB3    mov         eax,ebx
 004C1FB5    call        004BEA58
 004C1FBA    and         eax,0FF
 004C1FBF    mov         edx,dword ptr [ebp-14]
 004C1FC2    sub         edx,1
>004C1FC5    jno         004C1FCC
 004C1FC7    call        @IntOver
 004C1FCC    imul        edx
>004C1FCE    jno         004C1FD5
 004C1FD0    call        @IntOver
 004C1FD5    xor         edx,edx
 004C1FD7    mov         dl,byte ptr [ebp-1]
 004C1FDA    sub         edx,1
>004C1FDD    jno         004C1FE4
 004C1FDF    call        @IntOver
 004C1FE4    add         eax,edx
>004C1FE6    jno         004C1FED
 004C1FE8    call        @IntOver
 004C1FED    mov         edx,dword ptr [ebp-14]
 004C1FF0    sub         edx,1
>004C1FF3    jno         004C1FFA
 004C1FF5    call        @IntOver
 004C1FFA    sub         eax,edx
>004C1FFC    jno         004C2003
 004C1FFE    call        @IntOver
 004C2003    mov         dword ptr [ebp-1C],eax
 004C2006    mov         edx,dword ptr [ebp-1C]
 004C2009    mov         eax,dword ptr [ebx+928]
 004C200F    mov         ecx,dword ptr [eax]
 004C2011    call        dword ptr [ecx+44]
 004C2014    inc         dword ptr [ebp-14]
 004C2017    dec         dword ptr [ebp-24]
>004C201A    jne         004C1FB3
 004C201C    mov         eax,ebx
 004C201E    call        004BE9E0
 004C2023    and         eax,0FF
 004C2028    test        eax,eax
>004C202A    jle         004C209B
 004C202C    mov         dword ptr [ebp-24],eax
 004C202F    mov         dword ptr [ebp-14],1
 004C2036    mov         eax,ebx
 004C2038    call        004BEA58
 004C203D    and         eax,0FF
 004C2042    mov         edx,dword ptr [ebp-14]
 004C2045    sub         edx,1
>004C2048    jno         004C204F
 004C204A    call        @IntOver
 004C204F    imul        edx
>004C2051    jno         004C2058
 004C2053    call        @IntOver
 004C2058    add         eax,dword ptr [ebp-0C]
>004C205B    jno         004C2062
 004C205D    call        @IntOver
 004C2062    mov         dword ptr [ebp-1C],eax
 004C2065    lea         ecx,[ebp-34C]
 004C206B    xor         edx,edx
 004C206D    mov         eax,dword ptr [ebp-20]
 004C2070    mov         esi,dword ptr [eax]
 004C2072    call        dword ptr [esi+0C];TStringList.Get
 004C2075    mov         ecx,dword ptr [ebp-34C]
 004C207B    mov         edx,dword ptr [ebp-1C]
 004C207E    mov         eax,dword ptr [ebx+928]
 004C2084    mov         esi,dword ptr [eax]
 004C2086    call        dword ptr [esi+54]
 004C2089    xor         edx,edx
 004C208B    mov         eax,dword ptr [ebp-20]
 004C208E    mov         ecx,dword ptr [eax]
 004C2090    call        dword ptr [ecx+44];TStringList.Delete
 004C2093    inc         dword ptr [ebp-14]
 004C2096    dec         dword ptr [ebp-24]
>004C2099    jne         004C2036
 004C209B    mov         byte ptr [ebx+8],1
 004C209F    mov         eax,ebx
 004C20A1    call        004BE9E0
 004C20A6    and         eax,0FF
 004C20AB    test        eax,eax
>004C20AD    jle         004C20DE
 004C20AF    mov         dword ptr [ebp-24],eax
 004C20B2    mov         dword ptr [ebp-14],1
 004C20B9    mov         edx,dword ptr [ebp-14]
 004C20BC    cmp         edx,0FF
>004C20C2    jbe         004C20C9
 004C20C4    call        @BoundErr
 004C20C9    mov         cl,1
 004C20CB    mov         eax,dword ptr [ebx+918]
 004C20D1    call        004B6E84
 004C20D6    inc         dword ptr [ebp-14]
 004C20D9    dec         dword ptr [ebp-24]
>004C20DC    jne         004C20B9
 004C20DE    mov         eax,ebx
 004C20E0    call        004C63C8
 004C20E5    mov         dl,1
 004C20E7    mov         eax,dword ptr [ebp-20]
 004C20EA    mov         ecx,dword ptr [eax]
 004C20EC    call        dword ptr [ecx-4];TStringList.Destroy
 004C20EF    xor         eax,eax
 004C20F1    pop         edx
 004C20F2    pop         ecx
 004C20F3    pop         ecx
 004C20F4    mov         dword ptr fs:[eax],edx
 004C20F7    push        4C2124
 004C20FC    lea         eax,[ebp-34C]
 004C2102    mov         edx,5
 004C2107    call        @LStrArrayClr
 004C210C    lea         eax,[ebp-238]
 004C2112    mov         edx,5
 004C2117    call        @LStrArrayClr
 004C211C    ret
>004C211D    jmp         @HandleFinally
>004C2122    jmp         004C20FC
 004C2124    pop         edi
 004C2125    pop         esi
 004C2126    pop         ebx
 004C2127    mov         esp,ebp
 004C2129    pop         ebp
 004C212A    ret         8
//end;*}

//004C213C
{*////procedure sub_004C213C(?:?; ?:?; ?:?; ?:?);
begin
 004C213C    push        ebp
 004C213D    mov         ebp,esp
 004C213F    add         esp,0FFFFFEA0
 004C2145    push        ebx
 004C2146    push        esi
 004C2147    push        edi
 004C2148    xor         ebx,ebx
 004C214A    mov         dword ptr [ebp-15C],ebx
 004C2150    mov         dword ptr [ebp-158],ebx
 004C2156    mov         dword ptr [ebp-154],ebx
 004C215C    mov         dword ptr [ebp-150],ebx
 004C2162    mov         byte ptr [ebp-6],cl
 004C2165    mov         byte ptr [ebp-5],dl
 004C2168    mov         dword ptr [ebp-4],eax
 004C216B    xor         eax,eax
 004C216D    push        ebp
 004C216E    push        4C23F7
 004C2173    push        dword ptr fs:[eax]
 004C2176    mov         dword ptr fs:[eax],esp
 004C2179    mov         cl,byte ptr [ebp-6]
 004C217C    mov         dl,byte ptr [ebp-5]
 004C217F    mov         eax,dword ptr [ebp-4]
 004C2182    call        004C62E8
 004C2187    test        al,al
>004C2189    je          004C23C7
 004C218F    xor         eax,eax
 004C2191    mov         dword ptr [ebp-38],eax
 004C2194    mov         dword ptr [ebp-34],eax
 004C2197    mov         word ptr [ebp-30],ax
 004C219B    xor         eax,eax
 004C219D    mov         dword ptr [ebp-48],eax
 004C21A0    mov         dword ptr [ebp-44],eax
 004C21A3    mov         word ptr [ebp-40],ax
 004C21A7    mov         dl,byte ptr [ebp-5]
 004C21AA    mov         eax,dword ptr [ebp-4]
 004C21AD    call        004BEAD0
 004C21B2    and         eax,0FF
 004C21B7    test        eax,eax
>004C21B9    jle         004C2340
 004C21BF    mov         dword ptr [ebp-4C],eax
 004C21C2    mov         dword ptr [ebp-0C],1
 004C21C9    lea         eax,[ebp-14C]
 004C21CF    push        eax
 004C21D0    mov         ebx,dword ptr [ebp-0C]
 004C21D3    cmp         ebx,0FF
>004C21D9    jbe         004C21E0
 004C21DB    call        @BoundErr
 004C21E0    mov         ecx,ebx
 004C21E2    mov         dl,byte ptr [ebp-5]
 004C21E5    mov         eax,dword ptr [ebp-4]
 004C21E8    call        004BEDCC
 004C21ED    lea         eax,[ebp-14C]
 004C21F3    mov         edx,4C2408;'oui'
 004C21F8    xor         ecx,ecx
 004C21FA    mov         cl,byte ptr [eax]
 004C21FC    inc         ecx
 004C21FD    call        @AStrCmp
>004C2202    jne         004C2334
 004C2208    xor         eax,eax
 004C220A    push        ebp
 004C220B    push        4C2308
 004C2210    push        dword ptr fs:[eax]
 004C2213    mov         dword ptr fs:[eax],esp
 004C2216    lea         eax,[ebp-14C]
 004C221C    push        eax
 004C221D    mov         eax,dword ptr [ebp-0C]
 004C2220    cmp         eax,0FF
>004C2225    jbe         004C222C
 004C2227    call        @BoundErr
 004C222C    mov         ecx,ebx
 004C222E    mov         dl,byte ptr [ebp-5]
 004C2231    mov         eax,dword ptr [ebp-4]
 004C2234    call        004BED7C
 004C2239    lea         edx,[ebp-14C]
 004C223F    lea         eax,[ebp-150]
 004C2245    call        @LStrFromString
 004C224A    mov         eax,dword ptr [ebp-150]
 004C2250    call        StrToFloat
 004C2255    fstp        tbyte ptr [ebp-18]
 004C2258    wait
 004C2259    lea         eax,[ebp-14C]
 004C225F    push        eax
 004C2260    mov         eax,dword ptr [ebp-0C]
 004C2263    cmp         eax,0FF
>004C2268    jbe         004C226F
 004C226A    call        @BoundErr
 004C226F    mov         ecx,ebx
 004C2271    mov         dl,byte ptr [ebp-5]
 004C2274    mov         eax,dword ptr [ebp-4]
 004C2277    call        004BED2C
 004C227C    lea         edx,[ebp-14C]
 004C2282    lea         eax,[ebp-154]
 004C2288    call        @LStrFromString
 004C228D    mov         eax,dword ptr [ebp-154]
 004C2293    call        StrToFloat
 004C2298    fstp        tbyte ptr [ebp-28]
 004C229B    wait
 004C229C    mov         al,byte ptr [ebp-6]
 004C229F    push        eax
 004C22A0    lea         eax,[ebp-14C]
 004C22A6    push        eax
 004C22A7    mov         eax,dword ptr [ebp-0C]
 004C22AA    cmp         eax,0FF
>004C22AF    jbe         004C22B6
 004C22B1    call        @BoundErr
 004C22B6    mov         ecx,ebx
 004C22B8    mov         dl,byte ptr [ebp-5]
 004C22BB    mov         eax,dword ptr [ebp-4]
 004C22BE    call        004BEF5C
 004C22C3    lea         edx,[ebp-14C]
 004C22C9    lea         eax,[ebp-158]
 004C22CF    call        @LStrFromString
 004C22D4    mov         eax,dword ptr [ebp-158]
 004C22DA    call        StrToFloat
 004C22DF    fld         tbyte ptr [ebp-18]
 004C22E2    fmulp       st(1),st
 004C22E4    fld         tbyte ptr [ebp-38]
 004C22E7    faddp       st(1),st
 004C22E9    fstp        tbyte ptr [ebp-38]
 004C22EC    wait
 004C22ED    fld         tbyte ptr [ebp-28]
 004C22F0    fld         tbyte ptr [ebp-18]
 004C22F3    fmulp       st(1),st
 004C22F5    fld         tbyte ptr [ebp-48]
 004C22F8    faddp       st(1),st
 004C22FA    fstp        tbyte ptr [ebp-48]
 004C22FD    wait
 004C22FE    xor         eax,eax
 004C2300    pop         edx
 004C2301    pop         ecx
 004C2302    pop         ecx
 004C2303    mov         dword ptr fs:[eax],edx
>004C2306    jmp         004C2334
>004C2308    jmp         @HandleOnException
 004C230D    dd          2
 004C2311    dd          00409B50;EConvertError
 004C2315    dd          004C2321
 004C2319    dd          004098E0;EMathError
 004C231D    dd          004C2328
 004C2321    call        @DoneExcept
>004C2326    jmp         004C2334
 004C2328    call        @DoneExcept
>004C232D    jmp         004C2334
 004C232F    call        @DoneExcept
 004C2334    inc         dword ptr [ebp-0C]
 004C2337    dec         dword ptr [ebp-4C]
>004C233A    jne         004C21C9
 004C2340    fld         tbyte ptr [ebp-48]
 004C2343    fcomp       dword ptr ds:[4C240C];0:Single
 004C2349    fnstsw      al
 004C234B    sahf
>004C234C    je          004C239D
 004C234E    call        004B9E48
 004C2353    mov         dword ptr [ebp-160],eax
 004C2359    fild        dword ptr [ebp-160]
 004C235F    fld         tbyte ptr [ebp-38]
 004C2362    fld         tbyte ptr [ebp-48]
 004C2365    fdivp       st(1),st
 004C2367    fmulp       st(1),st
 004C2369    add         esp,0FFFFFFF4
 004C236C    fstp        tbyte ptr [esp]
 004C236F    wait
 004C2370    lea         eax,[ebp-15C]
 004C2376    push        eax
 004C2377    mov         ecx,2
 004C237C    mov         edx,12
 004C2381    mov         al,2
 004C2383    call        FloatToStrF
 004C2388    mov         edx,dword ptr [ebp-15C]
 004C238E    mov         eax,dword ptr [ebp+8]
 004C2391    mov         ecx,0FF
 004C2396    call        @LStrToString
>004C239B    jmp         004C23A3
 004C239D    mov         eax,dword ptr [ebp+8]
 004C23A0    mov         byte ptr [eax],0
 004C23A3    mov         eax,dword ptr [ebp+8]
 004C23A6    push        eax
 004C23A7    mov         cl,byte ptr [ebp-6]
 004C23AA    mov         dl,byte ptr [ebp-5]
 004C23AD    mov         eax,dword ptr [ebp-4]
 004C23B0    call        004C6080
 004C23B5    push        0
 004C23B7    mov         cl,byte ptr [ebp-6]
 004C23BA    mov         dl,byte ptr [ebp-5]
 004C23BD    mov         eax,dword ptr [ebp-4]
 004C23C0    call        004C61E4
>004C23C5    jmp         004C23D9
 004C23C7    mov         eax,dword ptr [ebp+8]
 004C23CA    push        eax
 004C23CB    mov         cl,byte ptr [ebp-6]
 004C23CE    mov         dl,byte ptr [ebp-5]
 004C23D1    mov         eax,dword ptr [ebp-4]
 004C23D4    call        004C6144
 004C23D9    xor         eax,eax
 004C23DB    pop         edx
 004C23DC    pop         ecx
 004C23DD    pop         ecx
 004C23DE    mov         dword ptr fs:[eax],edx
 004C23E1    push        4C23FE
 004C23E6    lea         eax,[ebp-15C]
 004C23EC    mov         edx,4
 004C23F1    call        @LStrArrayClr
 004C23F6    ret
>004C23F7    jmp         @HandleFinally
>004C23FC    jmp         004C23E6
 004C23FE    pop         edi
 004C23FF    pop         esi
 004C2400    pop         ebx
 004C2401    mov         esp,ebp
 004C2403    pop         ebp
 004C2404    ret         4
//end;*}

//004C2410
{*////procedure sub_004C2410(?:dword; ?:ShortString; ?:Integer; ?:?);
begin
 004C2410    push        ebp
 004C2411    mov         ebp,esp
 004C2413    push        ecx
 004C2414    mov         ecx,4E
 004C2419    push        0
 004C241B    push        0
 004C241D    dec         ecx
>004C241E    jne         004C2419
 004C2420    push        ecx
 004C2421    xchg        ecx,dword ptr [ebp-4]
 004C2424    push        ebx
 004C2425    push        esi
 004C2426    push        edi
 004C2427    mov         esi,edx
 004C2429    lea         edi,[ebp-130]
 004C242F    push        ecx
 004C2430    xor         ecx,ecx
 004C2432    mov         cl,byte ptr [esi]
 004C2434    inc         ecx
 004C2435    rep movs    byte ptr [edi],byte ptr [esi]
 004C2437    pop         ecx
 004C2438    mov         ebx,ecx
 004C243A    mov         esi,eax
 004C243C    xor         eax,eax
 004C243E    push        ebp
 004C243F    push        4C2AC8
 004C2444    push        dword ptr fs:[eax]
 004C2447    mov         dword ptr fs:[eax],esp
 004C244A    xor         eax,eax
 004C244C    push        ebp
 004C244D    push        4C2A5E
 004C2452    push        dword ptr fs:[eax]
 004C2455    mov         dword ptr fs:[eax],esp
 004C2458    lea         eax,[ebp-134]
 004C245E    lea         edx,[ebp-130]
 004C2464    call        @LStrFromString
 004C2469    mov         eax,dword ptr [ebp-134]
 004C246F    call        StrToFloat
 004C2474    fstp        tbyte ptr [ebp-20]
 004C2477    wait
 004C2478    xor         eax,eax
 004C247A    mov         al,bl
 004C247C    cmp         eax,4
>004C247F    ja          004C2A54
 004C2485    jmp         dword ptr [eax*4+4C248C]
 004C2485    dd          004C24A0
 004C2485    dd          004C24B3
 004C2485    dd          004C2618
 004C2485    dd          004C2841
 004C2485    dd          004C29A8
 004C24A0    mov         eax,dword ptr [ebp+8]
 004C24A3    lea         edx,[ebp-130]
 004C24A9    call        @PStrCpy
>004C24AE    jmp         004C2A54
 004C24B3    fld         tbyte ptr [ebp-20]
 004C24B6    fmul        dword ptr ds:[4C2AD8];10:Single
 004C24BC    call        @FRAC
 004C24C1    fmul        dword ptr ds:[4C2AD8];10:Single
 004C24C7    call        @ROUND
 004C24CC    push        eax
 004C24CD    sar         eax,1F
 004C24D0    cmp         eax,edx
 004C24D2    pop         eax
>004C24D3    je          004C24DA
 004C24D5    call        @BoundErr
 004C24DA    mov         ebx,eax
 004C24DC    fld         tbyte ptr [ebp-20]
 004C24DF    fmul        dword ptr ds:[4C2AD8];10:Single
 004C24E5    call        @INT
 004C24EA    fstp        tbyte ptr [ebp-30]
 004C24ED    wait
 004C24EE    test        ebx,ebx
>004C24F0    jne         004C258C
 004C24F6    fld         tbyte ptr [ebp-30]
 004C24F9    fdiv        dword ptr ds:[4C2AD8];10:Single
 004C24FF    call        @FRAC
 004C2504    fcomp       dword ptr ds:[4C2ADC];0:Single
 004C250A    fnstsw      al
 004C250C    sahf
>004C250D    jne         004C254C
 004C250F    fld         tbyte ptr [ebp-30]
 004C2512    fdiv        dword ptr ds:[4C2AD8];10:Single
 004C2518    add         esp,0FFFFFFF4
 004C251B    fstp        tbyte ptr [esp]
 004C251E    wait
 004C251F    lea         eax,[ebp-138]
 004C2525    push        eax
 004C2526    xor         ecx,ecx
 004C2528    mov         edx,12
 004C252D    mov         al,2
 004C252F    call        FloatToStrF
 004C2534    mov         edx,dword ptr [ebp-138]
 004C253A    mov         eax,dword ptr [ebp+8]
 004C253D    mov         ecx,0FF
 004C2542    call        @LStrToString
>004C2547    jmp         004C2A54
 004C254C    fld         tbyte ptr [ebp-30]
 004C254F    fdiv        dword ptr ds:[4C2AD8];10:Single
 004C2555    add         esp,0FFFFFFF4
 004C2558    fstp        tbyte ptr [esp]
 004C255B    wait
 004C255C    lea         eax,[ebp-13C]
 004C2562    push        eax
 004C2563    mov         ecx,1
 004C2568    mov         edx,12
 004C256D    mov         al,2
 004C256F    call        FloatToStrF
 004C2574    mov         edx,dword ptr [ebp-13C]
 004C257A    mov         eax,dword ptr [ebp+8]
 004C257D    mov         ecx,0FF
 004C2582    call        @LStrToString
>004C2587    jmp         004C2A54
 004C258C    dec         ebx
 004C258D    sub         ebx,4
>004C2590    jae         004C25D2
 004C2592    fld         tbyte ptr [ebp-30]
 004C2595    fdiv        dword ptr ds:[4C2AD8];10:Single
 004C259B    add         esp,0FFFFFFF4
 004C259E    fstp        tbyte ptr [esp]
 004C25A1    wait
 004C25A2    lea         eax,[ebp-140]
 004C25A8    push        eax
 004C25A9    mov         ecx,1
 004C25AE    mov         edx,12
 004C25B3    mov         al,2
 004C25B5    call        FloatToStrF
 004C25BA    mov         edx,dword ptr [ebp-140]
 004C25C0    mov         eax,dword ptr [ebp+8]
 004C25C3    mov         ecx,0FF
 004C25C8    call        @LStrToString
>004C25CD    jmp         004C2A54
 004C25D2    fld         tbyte ptr [ebp-30]
 004C25D5    fadd        dword ptr ds:[4C2AE0];1:Single
 004C25DB    fdiv        dword ptr ds:[4C2AD8];10:Single
 004C25E1    add         esp,0FFFFFFF4
 004C25E4    fstp        tbyte ptr [esp]
 004C25E7    wait
 004C25E8    lea         eax,[ebp-144]
 004C25EE    push        eax
 004C25EF    mov         ecx,1
 004C25F4    mov         edx,12
 004C25F9    mov         al,2
 004C25FB    call        FloatToStrF
 004C2600    mov         edx,dword ptr [ebp-144]
 004C2606    mov         eax,dword ptr [ebp+8]
 004C2609    mov         ecx,0FF
 004C260E    call        @LStrToString
>004C2613    jmp         004C2A54
 004C2618    push        0
 004C261A    push        64
 004C261C    fld         tbyte ptr [ebp-20]
 004C261F    call        @TRUNC
 004C2624    call        @_llmulo
>004C2629    jno         004C2630
 004C262B    call        @IntOver
 004C2630    mov         dword ptr [ebp-14C],eax
 004C2636    mov         dword ptr [ebp-148],edx
 004C263C    fild        qword ptr [ebp-14C]
 004C2642    fld         tbyte ptr [ebp-20]
 004C2645    fmul        dword ptr ds:[4C2AE4];100:Single
 004C264B    fsubrp      st(1),st
 004C264D    call        @ROUND
 004C2652    push        eax
 004C2653    sar         eax,1F
 004C2656    cmp         eax,edx
 004C2658    pop         eax
>004C2659    je          004C2660
 004C265B    call        @BoundErr
 004C2660    mov         ebx,eax
 004C2662    mov         eax,ebx
 004C2664    sub         eax,0D
>004C2667    jae         004C26B7
 004C2669    fld         tbyte ptr [ebp-20]
 004C266C    call        @TRUNC
 004C2671    mov         dword ptr [ebp-14C],eax
 004C2677    mov         dword ptr [ebp-148],edx
 004C267D    fild        qword ptr [ebp-14C]
 004C2683    add         esp,0FFFFFFF4
 004C2686    fstp        tbyte ptr [esp]
 004C2689    wait
 004C268A    lea         eax,[ebp-150]
 004C2690    push        eax
 004C2691    xor         ecx,ecx
 004C2693    mov         edx,12
 004C2698    mov         al,2
 004C269A    call        FloatToStrF
 004C269F    mov         edx,dword ptr [ebp-150]
 004C26A5    mov         eax,dword ptr [ebp+8]
 004C26A8    mov         ecx,0FF
 004C26AD    call        @LStrToString
>004C26B2    jmp         004C2A54
 004C26B7    mov         eax,ebx
 004C26B9    add         eax,0FFFFFFF3
 004C26BC    sub         eax,19
>004C26BF    jae         004C2718
 004C26C1    fld         tbyte ptr [ebp-20]
 004C26C4    call        @TRUNC
 004C26C9    mov         dword ptr [ebp-14C],eax
 004C26CF    mov         dword ptr [ebp-148],edx
 004C26D5    fild        qword ptr [ebp-14C]
 004C26DB    fadd        dword ptr ds:[4C2AE8];0,25:Single
 004C26E1    add         esp,0FFFFFFF4
 004C26E4    fstp        tbyte ptr [esp]
 004C26E7    wait
 004C26E8    lea         eax,[ebp-154]
 004C26EE    push        eax
 004C26EF    mov         ecx,2
 004C26F4    mov         edx,12
 004C26F9    mov         al,2
 004C26FB    call        FloatToStrF
 004C2700    mov         edx,dword ptr [ebp-154]
 004C2706    mov         eax,dword ptr [ebp+8]
 004C2709    mov         ecx,0FF
 004C270E    call        @LStrToString
>004C2713    jmp         004C2A54
 004C2718    mov         eax,ebx
 004C271A    add         eax,0FFFFFFDA
 004C271D    sub         eax,19
>004C2720    jae         004C2779
 004C2722    fld         tbyte ptr [ebp-20]
 004C2725    call        @TRUNC
 004C272A    mov         dword ptr [ebp-14C],eax
 004C2730    mov         dword ptr [ebp-148],edx
 004C2736    fild        qword ptr [ebp-14C]
 004C273C    fadd        dword ptr ds:[4C2AEC];0,5:Single
 004C2742    add         esp,0FFFFFFF4
 004C2745    fstp        tbyte ptr [esp]
 004C2748    wait
 004C2749    lea         eax,[ebp-158]
 004C274F    push        eax
 004C2750    mov         ecx,1
 004C2755    mov         edx,12
 004C275A    mov         al,2
 004C275C    call        FloatToStrF
 004C2761    mov         edx,dword ptr [ebp-158]
 004C2767    mov         eax,dword ptr [ebp+8]
 004C276A    mov         ecx,0FF
 004C276F    call        @LStrToString
>004C2774    jmp         004C2A54
 004C2779    mov         eax,ebx
 004C277B    add         eax,0FFFFFFC1
 004C277E    sub         eax,19
>004C2781    jae         004C27DA
 004C2783    fld         tbyte ptr [ebp-20]
 004C2786    call        @TRUNC
 004C278B    mov         dword ptr [ebp-14C],eax
 004C2791    mov         dword ptr [ebp-148],edx
 004C2797    fild        qword ptr [ebp-14C]
 004C279D    fadd        dword ptr ds:[4C2AF0];0,75:Single
 004C27A3    add         esp,0FFFFFFF4
 004C27A6    fstp        tbyte ptr [esp]
 004C27A9    wait
 004C27AA    lea         eax,[ebp-15C]
 004C27B0    push        eax
 004C27B1    mov         ecx,2
 004C27B6    mov         edx,12
 004C27BB    mov         al,2
 004C27BD    call        FloatToStrF
 004C27C2    mov         edx,dword ptr [ebp-15C]
 004C27C8    mov         eax,dword ptr [ebp+8]
 004C27CB    mov         ecx,0FF
 004C27D0    call        @LStrToString
>004C27D5    jmp         004C2A54
 004C27DA    add         ebx,0FFFFFFA8
 004C27DD    sub         ebx,0C
>004C27E0    jae         004C2A54
 004C27E6    fld         tbyte ptr [ebp-20]
 004C27E9    call        @TRUNC
 004C27EE    add         eax,1
 004C27F1    adc         edx,0
>004C27F4    jno         004C27FB
 004C27F6    call        @IntOver
 004C27FB    mov         dword ptr [ebp-14C],eax
 004C2801    mov         dword ptr [ebp-148],edx
 004C2807    fild        qword ptr [ebp-14C]
 004C280D    add         esp,0FFFFFFF4
 004C2810    fstp        tbyte ptr [esp]
 004C2813    wait
 004C2814    lea         eax,[ebp-160]
 004C281A    push        eax
 004C281B    xor         ecx,ecx
 004C281D    mov         edx,12
 004C2822    mov         al,2
 004C2824    call        FloatToStrF
 004C2829    mov         edx,dword ptr [ebp-160]
 004C282F    mov         eax,dword ptr [ebp+8]
 004C2832    mov         ecx,0FF
 004C2837    call        @LStrToString
>004C283C    jmp         004C2A54
 004C2841    push        0
 004C2843    push        64
 004C2845    fld         tbyte ptr [ebp-20]
 004C2848    call        @TRUNC
 004C284D    call        @_llmulo
>004C2852    jno         004C2859
 004C2854    call        @IntOver
 004C2859    mov         dword ptr [ebp-14C],eax
 004C285F    mov         dword ptr [ebp-148],edx
 004C2865    fild        qword ptr [ebp-14C]
 004C286B    fld         tbyte ptr [ebp-20]
 004C286E    fmul        dword ptr ds:[4C2AE4];100:Single
 004C2874    fsubrp      st(1),st
 004C2876    call        @ROUND
 004C287B    push        eax
 004C287C    sar         eax,1F
 004C287F    cmp         eax,edx
 004C2881    pop         eax
>004C2882    je          004C2889
 004C2884    call        @BoundErr
 004C2889    mov         ebx,eax
 004C288B    mov         eax,ebx
 004C288D    sub         eax,19
>004C2890    jae         004C28E0
 004C2892    fld         tbyte ptr [ebp-20]
 004C2895    call        @TRUNC
 004C289A    mov         dword ptr [ebp-14C],eax
 004C28A0    mov         dword ptr [ebp-148],edx
 004C28A6    fild        qword ptr [ebp-14C]
 004C28AC    add         esp,0FFFFFFF4
 004C28AF    fstp        tbyte ptr [esp]
 004C28B2    wait
 004C28B3    lea         eax,[ebp-164]
 004C28B9    push        eax
 004C28BA    xor         ecx,ecx
 004C28BC    mov         edx,12
 004C28C1    mov         al,2
 004C28C3    call        FloatToStrF
 004C28C8    mov         edx,dword ptr [ebp-164]
 004C28CE    mov         eax,dword ptr [ebp+8]
 004C28D1    mov         ecx,0FF
 004C28D6    call        @LStrToString
>004C28DB    jmp         004C2A54
 004C28E0    mov         eax,ebx
 004C28E2    add         eax,0FFFFFFE7
 004C28E5    sub         eax,32
>004C28E8    jae         004C2941
 004C28EA    fld         tbyte ptr [ebp-20]
 004C28ED    call        @TRUNC
 004C28F2    mov         dword ptr [ebp-14C],eax
 004C28F8    mov         dword ptr [ebp-148],edx
 004C28FE    fild        qword ptr [ebp-14C]
 004C2904    fadd        dword ptr ds:[4C2AEC];0,5:Single
 004C290A    add         esp,0FFFFFFF4
 004C290D    fstp        tbyte ptr [esp]
 004C2910    wait
 004C2911    lea         eax,[ebp-168]
 004C2917    push        eax
 004C2918    mov         ecx,1
 004C291D    mov         edx,12
 004C2922    mov         al,2
 004C2924    call        FloatToStrF
 004C2929    mov         edx,dword ptr [ebp-168]
 004C292F    mov         eax,dword ptr [ebp+8]
 004C2932    mov         ecx,0FF
 004C2937    call        @LStrToString
>004C293C    jmp         004C2A54
 004C2941    add         ebx,0FFFFFFB5
 004C2944    sub         ebx,19
>004C2947    jae         004C2A54
 004C294D    fld         tbyte ptr [ebp-20]
 004C2950    call        @TRUNC
 004C2955    add         eax,1
 004C2958    adc         edx,0
>004C295B    jno         004C2962
 004C295D    call        @IntOver
 004C2962    mov         dword ptr [ebp-14C],eax
 004C2968    mov         dword ptr [ebp-148],edx
 004C296E    fild        qword ptr [ebp-14C]
 004C2974    add         esp,0FFFFFFF4
 004C2977    fstp        tbyte ptr [esp]
 004C297A    wait
 004C297B    lea         eax,[ebp-16C]
 004C2981    push        eax
 004C2982    xor         ecx,ecx
 004C2984    mov         edx,12
 004C2989    mov         al,2
 004C298B    call        FloatToStrF
 004C2990    mov         edx,dword ptr [ebp-16C]
 004C2996    mov         eax,dword ptr [ebp+8]
 004C2999    mov         ecx,0FF
 004C299E    call        @LStrToString
>004C29A3    jmp         004C2A54
 004C29A8    lea         eax,[ebp-270]
 004C29AE    push        eax
 004C29AF    mov         cl,3
 004C29B1    lea         edx,[ebp-130]
 004C29B7    mov         eax,esi
 004C29B9    call        004C2410
 004C29BE    lea         edx,[ebp-270]
 004C29C4    lea         eax,[ebp-170]
 004C29CA    call        @LStrFromString
 004C29CF    mov         eax,dword ptr [ebp-170]
 004C29D5    call        StrToFloat
 004C29DA    fstp        tbyte ptr [ebp-10]
 004C29DD    wait
 004C29DE    lea         eax,[ebp-274]
 004C29E4    lea         edx,[ebp-130]
 004C29EA    call        @LStrFromString
 004C29EF    mov         eax,dword ptr [ebp-274]
 004C29F5    call        StrToFloat
 004C29FA    fld         tbyte ptr [ebp-10]
 004C29FD    fcompp
 004C29FF    fnstsw      al
 004C2A01    sahf
>004C2A02    jae         004C2A41
 004C2A04    fld         tbyte ptr [ebp-10]
 004C2A07    fadd        dword ptr ds:[4C2AEC];0,5:Single
 004C2A0D    add         esp,0FFFFFFF4
 004C2A10    fstp        tbyte ptr [esp]
 004C2A13    wait
 004C2A14    lea         eax,[ebp-278]
 004C2A1A    push        eax
 004C2A1B    mov         ecx,1
 004C2A20    mov         edx,12
 004C2A25    mov         al,2
 004C2A27    call        FloatToStrF
 004C2A2C    mov         edx,dword ptr [ebp-278]
 004C2A32    mov         eax,dword ptr [ebp+8]
 004C2A35    mov         ecx,0FF
 004C2A3A    call        @LStrToString
>004C2A3F    jmp         004C2A54
 004C2A41    mov         eax,dword ptr [ebp+8]
 004C2A44    push        eax
 004C2A45    mov         cl,3
 004C2A47    lea         edx,[ebp-130]
 004C2A4D    mov         eax,esi
 004C2A4F    call        004C2410
 004C2A54    xor         eax,eax
 004C2A56    pop         edx
 004C2A57    pop         ecx
 004C2A58    pop         ecx
 004C2A59    mov         dword ptr fs:[eax],edx
>004C2A5C    jmp         004C2A8A
>004C2A5E    jmp         @HandleOnException
 004C2A63    dd          2
 004C2A67    dd          00409B50;EConvertError
 004C2A6B    dd          004C2A77
 004C2A6F    dd          004098E0;EMathError
 004C2A73    dd          004C2A7F
 004C2A77    mov         eax,dword ptr [ebp+8]
 004C2A7A    mov         byte ptr [eax],0
>004C2A7D    jmp         004C2A85
 004C2A7F    mov         eax,dword ptr [ebp+8]
 004C2A82    mov         byte ptr [eax],0
 004C2A85    call        @DoneExcept
 004C2A8A    xor         eax,eax
 004C2A8C    pop         edx
 004C2A8D    pop         ecx
 004C2A8E    pop         ecx
 004C2A8F    mov         dword ptr fs:[eax],edx
 004C2A92    push        4C2ACF
 004C2A97    lea         eax,[ebp-278]
 004C2A9D    mov         edx,2
 004C2AA2    call        @LStrArrayClr
 004C2AA7    lea         eax,[ebp-170]
 004C2AAD    mov         edx,9
 004C2AB2    call        @LStrArrayClr
 004C2AB7    lea         eax,[ebp-144]
 004C2ABD    mov         edx,5
 004C2AC2    call        @LStrArrayClr
 004C2AC7    ret
>004C2AC8    jmp         @HandleFinally
>004C2ACD    jmp         004C2A97
 004C2ACF    pop         edi
 004C2AD0    pop         esi
 004C2AD1    pop         ebx
 004C2AD2    mov         esp,ebp
 004C2AD4    pop         ebp
 004C2AD5    ret         4
//end;*}

//004C2AF4
{*////procedure sub_004C2AF4(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004C2AF4    push        ebp
 004C2AF5    mov         ebp,esp
 004C2AF7    add         esp,0FFFFFEFC
 004C2AFD    push        ebx
 004C2AFE    push        esi
 004C2AFF    mov         byte ptr [ebp-1],cl
 004C2B02    mov         ebx,edx
 004C2B04    mov         esi,eax
 004C2B06    mov         eax,dword ptr [ebp+8]
 004C2B09    push        eax
 004C2B0A    lea         eax,[ebp-104]
 004C2B10    push        eax
 004C2B11    mov         cl,byte ptr [ebp-1]
 004C2B14    mov         edx,ebx
 004C2B16    mov         eax,esi
 004C2B18    call        004C213C
 004C2B1D    lea         edx,[ebp-104]
 004C2B23    mov         cl,byte ptr [ebp+0C]
 004C2B26    mov         eax,esi
 004C2B28    call        004C2410
 004C2B2D    pop         esi
 004C2B2E    pop         ebx
 004C2B2F    mov         esp,ebp
 004C2B31    pop         ebp
 004C2B32    ret         8
//end;*}

//004C2B38
{*////procedure sub_004C2B38(?:dword; ?:?; ?:?; ?:?);
begin
 004C2B38    push        ebp
 004C2B39    mov         ebp,esp
 004C2B3B    add         esp,0FFFFFFF8
 004C2B3E    push        ebx
 004C2B3F    push        esi
 004C2B40    push        edi
 004C2B41    xor         ebx,ebx
 004C2B43    mov         dword ptr [ebp-8],ebx
 004C2B46    mov         byte ptr [ebp-2],cl
 004C2B49    mov         byte ptr [ebp-1],dl
 004C2B4C    mov         ebx,eax
 004C2B4E    xor         eax,eax
 004C2B50    push        ebp
 004C2B51    push        4C2BF0
 004C2B56    push        dword ptr fs:[eax]
 004C2B59    mov         dword ptr fs:[eax],esp
 004C2B5C    mov         eax,ebx
 004C2B5E    call        004BEA58
 004C2B63    mov         esi,eax
 004C2B65    and         esi,0FF
 004C2B6B    xor         eax,eax
 004C2B6D    mov         al,byte ptr [ebp-1]
 004C2B70    sub         eax,1
>004C2B73    jno         004C2B7A
 004C2B75    call        @IntOver
 004C2B7A    imul        esi,eax
>004C2B7D    jno         004C2B84
 004C2B7F    call        @IntOver
 004C2B84    xor         eax,eax
 004C2B86    mov         al,byte ptr [ebp-2]
 004C2B89    sub         eax,1
>004C2B8C    jno         004C2B93
 004C2B8E    call        @IntOver
 004C2B93    add         esi,eax
>004C2B95    jno         004C2B9C
 004C2B97    call        @IntOver
 004C2B9C    mov         eax,dword ptr [ebx+928]
 004C2BA2    mov         edx,dword ptr [eax]
 004C2BA4    call        dword ptr [edx+14]
 004C2BA7    cmp         esi,eax
>004C2BA9    jl          004C2BBA
 004C2BAB    xor         ecx,ecx
 004C2BAD    mov         edx,esi
 004C2BAF    mov         eax,dword ptr [ebx+928]
 004C2BB5    mov         edi,dword ptr [eax]
 004C2BB7    call        dword ptr [edi+54]
 004C2BBA    lea         ecx,[ebp-8]
 004C2BBD    mov         edx,esi
 004C2BBF    mov         eax,dword ptr [ebx+928]
 004C2BC5    mov         ebx,dword ptr [eax]
 004C2BC7    call        dword ptr [ebx+0C]
 004C2BCA    mov         edx,dword ptr [ebp-8]
 004C2BCD    mov         eax,dword ptr [ebp+8]
 004C2BD0    mov         ecx,0FF
 004C2BD5    call        @LStrToString
 004C2BDA    xor         eax,eax
 004C2BDC    pop         edx
 004C2BDD    pop         ecx
 004C2BDE    pop         ecx
 004C2BDF    mov         dword ptr fs:[eax],edx
 004C2BE2    push        4C2BF7
 004C2BE7    lea         eax,[ebp-8]
 004C2BEA    call        @LStrClr
 004C2BEF    ret
>004C2BF0    jmp         @HandleFinally
>004C2BF5    jmp         004C2BE7
 004C2BF7    pop         edi
 004C2BF8    pop         esi
 004C2BF9    pop         ebx
 004C2BFA    pop         ecx
 004C2BFB    pop         ecx
 004C2BFC    pop         ebp
 004C2BFD    ret         4
//end;*}

//004C2C00
{*////procedure sub_004C2C00(?:TFichierCdn; ?:dword; ?:dword; ?:?; ?:?);
begin
 004C2C00    push        ebp
 004C2C01    mov         ebp,esp
 004C2C03    add         esp,0FFFFFFF8
 004C2C06    push        ebx
 004C2C07    push        esi
 004C2C08    push        edi
 004C2C09    xor         ebx,ebx
 004C2C0B    mov         dword ptr [ebp-8],ebx
 004C2C0E    mov         byte ptr [ebp-2],cl
 004C2C11    mov         byte ptr [ebp-1],dl
 004C2C14    mov         ebx,eax
 004C2C16    xor         eax,eax
 004C2C18    push        ebp
 004C2C19    push        4C2CFF
 004C2C1E    push        dword ptr fs:[eax]
 004C2C21    mov         dword ptr fs:[eax],esp
 004C2C24    mov         eax,ebx
 004C2C26    call        004C8AE8
 004C2C2B    mov         esi,eax
 004C2C2D    and         esi,0FF
 004C2C33    xor         eax,eax
 004C2C35    mov         al,byte ptr [ebp-2]
 004C2C38    sub         eax,1
>004C2C3B    jno         004C2C42
 004C2C3D    call        @IntOver
 004C2C42    imul        esi,eax
>004C2C45    jno         004C2C4C
 004C2C47    call        @IntOver
 004C2C4C    xor         eax,eax
 004C2C4E    mov         al,byte ptr [ebp+0C]
 004C2C51    sub         eax,1
>004C2C54    jno         004C2C5B
 004C2C56    call        @IntOver
 004C2C5B    add         esi,eax
>004C2C5D    jno         004C2C64
 004C2C5F    call        @IntOver
 004C2C64    mov         eax,ebx
 004C2C66    call        004BEA58
 004C2C6B    mov         edi,eax
 004C2C6D    and         edi,0FF
 004C2C73    xor         eax,eax
 004C2C75    mov         al,byte ptr [ebp-1]
 004C2C78    sub         eax,1
>004C2C7B    jno         004C2C82
 004C2C7D    call        @IntOver
 004C2C82    imul        edi,eax
>004C2C85    jno         004C2C8C
 004C2C87    call        @IntOver
 004C2C8C    mov         eax,ebx
 004C2C8E    call        004C8AE8
 004C2C93    and         eax,0FF
 004C2C98    imul        edi,eax
>004C2C9B    jno         004C2CA2
 004C2C9D    call        @IntOver
 004C2CA2    add         esi,edi
>004C2CA4    jno         004C2CAB
 004C2CA6    call        @IntOver
 004C2CAB    mov         eax,dword ptr [ebx+92C]
 004C2CB1    mov         edx,dword ptr [eax]
 004C2CB3    call        dword ptr [edx+14]
 004C2CB6    cmp         esi,eax
>004C2CB8    jl          004C2CC9
 004C2CBA    xor         ecx,ecx
 004C2CBC    mov         edx,esi
 004C2CBE    mov         eax,dword ptr [ebx+92C]
 004C2CC4    mov         edi,dword ptr [eax]
 004C2CC6    call        dword ptr [edi+54]
 004C2CC9    lea         ecx,[ebp-8]
 004C2CCC    mov         edx,esi
 004C2CCE    mov         eax,dword ptr [ebx+92C]
 004C2CD4    mov         ebx,dword ptr [eax]
 004C2CD6    call        dword ptr [ebx+0C]
 004C2CD9    mov         edx,dword ptr [ebp-8]
 004C2CDC    mov         eax,dword ptr [ebp+8]
 004C2CDF    mov         ecx,0FF
 004C2CE4    call        @LStrToString
 004C2CE9    xor         eax,eax
 004C2CEB    pop         edx
 004C2CEC    pop         ecx
 004C2CED    pop         ecx
 004C2CEE    mov         dword ptr fs:[eax],edx
 004C2CF1    push        4C2D06
 004C2CF6    lea         eax,[ebp-8]
 004C2CF9    call        @LStrClr
 004C2CFE    ret
>004C2CFF    jmp         @HandleFinally
>004C2D04    jmp         004C2CF6
 004C2D06    pop         edi
 004C2D07    pop         esi
 004C2D08    pop         ebx
 004C2D09    pop         ecx
 004C2D0A    pop         ecx
 004C2D0B    pop         ebp
 004C2D0C    ret         8
//end;*}

//004C2D10
{*////procedure sub_004C2D10(?:TFichierCdn; ?:?; ?:dword; ?:?; ?:?);
begin
 004C2D10    push        ebp
 004C2D11    mov         ebp,esp
 004C2D13    add         esp,0FFFFFDE4
 004C2D19    push        ebx
 004C2D1A    push        esi
 004C2D1B    push        edi
 004C2D1C    xor         ebx,ebx
 004C2D1E    mov         dword ptr [ebp-108],ebx
 004C2D24    mov         dword ptr [ebp-21C],ebx
 004C2D2A    mov         dword ptr [ebp-10C],ebx
 004C2D30    mov         byte ptr [ebp-1],cl
 004C2D33    mov         ebx,edx
 004C2D35    mov         esi,eax
 004C2D37    xor         eax,eax
 004C2D39    push        ebp
 004C2D3A    push        4C2E4D
 004C2D3F    push        dword ptr fs:[eax]
 004C2D42    mov         dword ptr fs:[eax],esp
 004C2D45    mov         al,byte ptr [ebp+0C]
 004C2D48    push        eax
 004C2D49    lea         eax,[ebp-101]
 004C2D4F    push        eax
 004C2D50    mov         cl,byte ptr [ebp-1]
 004C2D53    mov         edx,ebx
 004C2D55    mov         eax,esi
 004C2D57    call        004C2AF4
 004C2D5C    xor         eax,eax
 004C2D5E    push        ebp
 004C2D5F    push        4C2E00
 004C2D64    push        dword ptr fs:[eax]
 004C2D67    mov         dword ptr fs:[eax],esp
 004C2D6A    lea         eax,[ebp-20C]
 004C2D70    push        eax
 004C2D71    mov         cl,byte ptr [ebp-1]
 004C2D74    mov         edx,ebx
 004C2D76    mov         eax,esi
 004C2D78    call        004C2B38
 004C2D7D    lea         edx,[ebp-20C]
 004C2D83    lea         eax,[ebp-10C]
 004C2D89    call        @LStrFromString
 004C2D8E    mov         eax,dword ptr [ebp-10C]
 004C2D94    call        StrToFloat
 004C2D99    fstp        tbyte ptr [ebp-218]
 004C2D9F    wait
 004C2DA0    lea         eax,[ebp-21C]
 004C2DA6    lea         edx,[ebp-101]
 004C2DAC    call        @LStrFromString
 004C2DB1    mov         eax,dword ptr [ebp-21C]
 004C2DB7    call        StrToFloat
 004C2DBC    fld         tbyte ptr [ebp-218]
 004C2DC2    faddp       st(1),st
 004C2DC4    add         esp,0FFFFFFF4
 004C2DC7    fstp        tbyte ptr [esp]
 004C2DCA    wait
 004C2DCB    lea         eax,[ebp-108]
 004C2DD1    push        eax
 004C2DD2    mov         ecx,2
 004C2DD7    mov         edx,12
 004C2DDC    mov         al,2
 004C2DDE    call        FloatToStrF
 004C2DE3    mov         edx,dword ptr [ebp-108]
 004C2DE9    mov         eax,dword ptr [ebp+8]
 004C2DEC    mov         ecx,0FF
 004C2DF1    call        @LStrToString
 004C2DF6    xor         eax,eax
 004C2DF8    pop         edx
 004C2DF9    pop         ecx
 004C2DFA    pop         ecx
 004C2DFB    mov         dword ptr fs:[eax],edx
>004C2DFE    jmp         004C2E24
>004C2E00    jmp         @HandleOnException
 004C2E05    dd          1
 004C2E09    dd          00409B50;EConvertError
 004C2E0D    dd          004C2E11
 004C2E11    mov         eax,dword ptr [ebp+8]
 004C2E14    lea         edx,[ebp-101]
 004C2E1A    call        @PStrCpy
 004C2E1F    call        @DoneExcept
 004C2E24    xor         eax,eax
 004C2E26    pop         edx
 004C2E27    pop         ecx
 004C2E28    pop         ecx
 004C2E29    mov         dword ptr fs:[eax],edx
 004C2E2C    push        4C2E54
 004C2E31    lea         eax,[ebp-21C]
 004C2E37    call        @LStrClr
 004C2E3C    lea         eax,[ebp-10C]
 004C2E42    mov         edx,2
 004C2E47    call        @LStrArrayClr
 004C2E4C    ret
>004C2E4D    jmp         @HandleFinally
>004C2E52    jmp         004C2E31
 004C2E54    pop         edi
 004C2E55    pop         esi
 004C2E56    pop         ebx
 004C2E57    mov         esp,ebp
 004C2E59    pop         ebp
 004C2E5A    ret         8
//end;*}

//004C2E60
{*////procedure sub_004C2E60(?:dword; ?:ShortString; ?:?; ?:?);
begin
 004C2E60    push        ebp
 004C2E61    mov         ebp,esp
 004C2E63    add         esp,0FFFFFCA0
 004C2E69    push        ebx
 004C2E6A    push        esi
 004C2E6B    push        edi
 004C2E6C    xor         ebx,ebx
 004C2E6E    mov         dword ptr [ebp-35C],ebx
 004C2E74    mov         dword ptr [ebp-358],ebx
 004C2E7A    mov         dword ptr [ebp-354],ebx
 004C2E80    mov         dword ptr [ebp-350],ebx
 004C2E86    mov         esi,edx
 004C2E88    lea         edi,[ebp-14C]
 004C2E8E    push        ecx
 004C2E8F    xor         ecx,ecx
 004C2E91    mov         cl,byte ptr [esi]
 004C2E93    inc         ecx
 004C2E94    rep movs    byte ptr [edi],byte ptr [esi]
 004C2E96    pop         ecx
 004C2E97    mov         byte ptr [ebp-5],cl
 004C2E9A    mov         dword ptr [ebp-4],eax
 004C2E9D    xor         eax,eax
 004C2E9F    push        ebp
 004C2EA0    push        4C311C
 004C2EA5    push        dword ptr fs:[eax]
 004C2EA8    mov         dword ptr fs:[eax],esp
 004C2EAB    xor         eax,eax
 004C2EAD    mov         dword ptr [ebp-38],eax
 004C2EB0    mov         dword ptr [ebp-34],eax
 004C2EB3    mov         word ptr [ebp-30],ax
 004C2EB7    xor         eax,eax
 004C2EB9    mov         dword ptr [ebp-48],eax
 004C2EBC    mov         dword ptr [ebp-44],eax
 004C2EBF    mov         word ptr [ebp-40],ax
 004C2EC3    mov         dl,byte ptr [ebp-5]
 004C2EC6    mov         eax,dword ptr [ebp-4]
 004C2EC9    call        004BEAD0
 004C2ECE    and         eax,0FF
 004C2ED3    test        eax,eax
>004C2ED5    jle         004C309B
 004C2EDB    mov         dword ptr [ebp-4C],eax
 004C2EDE    mov         dword ptr [ebp-0C],1
 004C2EE5    lea         eax,[ebp-24C]
 004C2EEB    push        eax
 004C2EEC    mov         ebx,dword ptr [ebp-0C]
 004C2EEF    cmp         ebx,0FF
>004C2EF5    jbe         004C2EFC
 004C2EF7    call        @BoundErr
 004C2EFC    mov         ecx,ebx
 004C2EFE    mov         dl,byte ptr [ebp-5]
 004C2F01    mov         eax,dword ptr [ebp-4]
 004C2F04    call        004BEDCC
 004C2F09    lea         eax,[ebp-24C]
 004C2F0F    mov         edx,4C312C;'oui'
 004C2F14    xor         ecx,ecx
 004C2F16    mov         cl,byte ptr [eax]
 004C2F18    inc         ecx
 004C2F19    call        @AStrCmp
>004C2F1E    jne         004C308F
 004C2F24    lea         eax,[ebp-34C]
 004C2F2A    push        eax
 004C2F2B    mov         eax,dword ptr [ebp-0C]
 004C2F2E    cmp         eax,0FF
>004C2F33    jbe         004C2F3A
 004C2F35    call        @BoundErr
 004C2F3A    mov         ecx,ebx
 004C2F3C    mov         dl,byte ptr [ebp-5]
 004C2F3F    mov         eax,dword ptr [ebp-4]
 004C2F42    call        004BEEBC
 004C2F47    lea         eax,[ebp-34C]
 004C2F4D    lea         edx,[ebp-14C]
 004C2F53    xor         ecx,ecx
 004C2F55    mov         cl,byte ptr [eax]
 004C2F57    inc         ecx
 004C2F58    call        @AStrCmp
>004C2F5D    jne         004C308F
 004C2F63    xor         eax,eax
 004C2F65    push        ebp
 004C2F66    push        4C3063
 004C2F6B    push        dword ptr fs:[eax]
 004C2F6E    mov         dword ptr fs:[eax],esp
 004C2F71    lea         eax,[ebp-24C]
 004C2F77    push        eax
 004C2F78    mov         eax,dword ptr [ebp-0C]
 004C2F7B    cmp         eax,0FF
>004C2F80    jbe         004C2F87
 004C2F82    call        @BoundErr
 004C2F87    mov         ecx,ebx
 004C2F89    mov         dl,byte ptr [ebp-5]
 004C2F8C    mov         eax,dword ptr [ebp-4]
 004C2F8F    call        004BED7C
 004C2F94    lea         edx,[ebp-24C]
 004C2F9A    lea         eax,[ebp-350]
 004C2FA0    call        @LStrFromString
 004C2FA5    mov         eax,dword ptr [ebp-350]
 004C2FAB    call        StrToFloat
 004C2FB0    fstp        tbyte ptr [ebp-18]
 004C2FB3    wait
 004C2FB4    lea         eax,[ebp-24C]
 004C2FBA    push        eax
 004C2FBB    mov         eax,dword ptr [ebp-0C]
 004C2FBE    cmp         eax,0FF
>004C2FC3    jbe         004C2FCA
 004C2FC5    call        @BoundErr
 004C2FCA    mov         ecx,ebx
 004C2FCC    mov         dl,byte ptr [ebp-5]
 004C2FCF    mov         eax,dword ptr [ebp-4]
 004C2FD2    call        004BED2C
 004C2FD7    lea         edx,[ebp-24C]
 004C2FDD    lea         eax,[ebp-354]
 004C2FE3    call        @LStrFromString
 004C2FE8    mov         eax,dword ptr [ebp-354]
 004C2FEE    call        StrToFloat
 004C2FF3    fstp        tbyte ptr [ebp-28]
 004C2FF6    wait
 004C2FF7    mov         al,byte ptr [ebp+0C]
 004C2FFA    push        eax
 004C2FFB    lea         eax,[ebp-24C]
 004C3001    push        eax
 004C3002    mov         eax,dword ptr [ebp-0C]
 004C3005    cmp         eax,0FF
>004C300A    jbe         004C3011
 004C300C    call        @BoundErr
 004C3011    mov         ecx,ebx
 004C3013    mov         dl,byte ptr [ebp-5]
 004C3016    mov         eax,dword ptr [ebp-4]
 004C3019    call        004BEF5C
 004C301E    lea         edx,[ebp-24C]
 004C3024    lea         eax,[ebp-358]
 004C302A    call        @LStrFromString
 004C302F    mov         eax,dword ptr [ebp-358]
 004C3035    call        StrToFloat
 004C303A    fld         tbyte ptr [ebp-18]
 004C303D    fmulp       st(1),st
 004C303F    fld         tbyte ptr [ebp-38]
 004C3042    faddp       st(1),st
 004C3044    fstp        tbyte ptr [ebp-38]
 004C3047    wait
 004C3048    fld         tbyte ptr [ebp-28]
 004C304B    fld         tbyte ptr [ebp-18]
 004C304E    fmulp       st(1),st
 004C3050    fld         tbyte ptr [ebp-48]
 004C3053    faddp       st(1),st
 004C3055    fstp        tbyte ptr [ebp-48]
 004C3058    wait
 004C3059    xor         eax,eax
 004C305B    pop         edx
 004C305C    pop         ecx
 004C305D    pop         ecx
 004C305E    mov         dword ptr fs:[eax],edx
>004C3061    jmp         004C308F
>004C3063    jmp         @HandleOnException
 004C3068    dd          2
 004C306C    dd          00409B50;EConvertError
 004C3070    dd          004C307C
 004C3074    dd          004098E0;EMathError
 004C3078    dd          004C3083
 004C307C    call        @DoneExcept
>004C3081    jmp         004C308F
 004C3083    call        @DoneExcept
>004C3088    jmp         004C308F
 004C308A    call        @DoneExcept
 004C308F    inc         dword ptr [ebp-0C]
 004C3092    dec         dword ptr [ebp-4C]
>004C3095    jne         004C2EE5
 004C309B    fld         tbyte ptr [ebp-48]
 004C309E    fcomp       dword ptr ds:[4C3130];0:Single
 004C30A4    fnstsw      al
 004C30A6    sahf
>004C30A7    je          004C30F8
 004C30A9    call        004B9E48
 004C30AE    mov         dword ptr [ebp-360],eax
 004C30B4    fild        dword ptr [ebp-360]
 004C30BA    fld         tbyte ptr [ebp-38]
 004C30BD    fld         tbyte ptr [ebp-48]
 004C30C0    fdivp       st(1),st
 004C30C2    fmulp       st(1),st
 004C30C4    add         esp,0FFFFFFF4
 004C30C7    fstp        tbyte ptr [esp]
 004C30CA    wait
 004C30CB    lea         eax,[ebp-35C]
 004C30D1    push        eax
 004C30D2    mov         ecx,2
 004C30D7    mov         edx,12
 004C30DC    mov         al,2
 004C30DE    call        FloatToStrF
 004C30E3    mov         edx,dword ptr [ebp-35C]
 004C30E9    mov         eax,dword ptr [ebp+8]
 004C30EC    mov         ecx,0FF
 004C30F1    call        @LStrToString
>004C30F6    jmp         004C30FE
 004C30F8    mov         eax,dword ptr [ebp+8]
 004C30FB    mov         byte ptr [eax],0
 004C30FE    xor         eax,eax
 004C3100    pop         edx
 004C3101    pop         ecx
 004C3102    pop         ecx
 004C3103    mov         dword ptr fs:[eax],edx
 004C3106    push        4C3123
 004C310B    lea         eax,[ebp-35C]
 004C3111    mov         edx,4
 004C3116    call        @LStrArrayClr
 004C311B    ret
>004C311C    jmp         @HandleFinally
>004C3121    jmp         004C310B
 004C3123    pop         edi
 004C3124    pop         esi
 004C3125    pop         ebx
 004C3126    mov         esp,ebp
 004C3128    pop         ebp
 004C3129    ret         8
//end;*}

//004C3134
{*function sub_004C3134(?:dword; ?:?):?;
begin
 004C3134    push        ebp
 004C3135    mov         ebp,esp
 004C3137    add         esp,0FFFFFECC
 004C313D    push        ebx
 004C313E    push        esi
 004C313F    xor         ecx,ecx
 004C3141    mov         dword ptr [ebp-134],ecx
 004C3147    mov         dword ptr [ebp-30],ecx
 004C314A    mov         byte ptr [ebp-1],dl
 004C314D    mov         esi,eax
 004C314F    xor         eax,eax
 004C3151    push        ebp
 004C3152    push        4C32A5
 004C3157    push        dword ptr fs:[eax]
 004C315A    mov         dword ptr fs:[eax],esp
 004C315D    mov         eax,esi
 004C315F    call        004BE9E0
 004C3164    xor         edx,edx
 004C3166    mov         dl,al
 004C3168    cmp         edx,0FF
>004C316E    jbe         004C3175
 004C3170    call        @BoundErr
 004C3175    mov         al,1
 004C3177    lea         ecx,[ebp-2C]
 004C317A    mov         ah,20
 004C317C    call        @SetRange
 004C3181    mov         al,byte ptr [ebp-1]
 004C3184    and         eax,0FF
 004C3189    bt          dword ptr [ebp-2C],eax
>004C318D    jae         004C31FC
 004C318F    mov         dl,1
 004C3191    mov         eax,[004120B8];TStringList
 004C3196    call        TObject.Create;TStringList.Create
 004C319B    mov         dword ptr [ebp-8],eax
 004C319E    mov         dl,1
 004C31A0    mov         eax,dword ptr [ebp-8]
 004C31A3    call        TStringList.SetSorted
 004C31A8    mov         eax,dword ptr [ebp-8]
 004C31AB    mov         byte ptr [eax+19],0;TStringList.FDuplicates:TDuplicates
 004C31AF    mov         dl,byte ptr [ebp-1]
 004C31B2    mov         eax,esi
 004C31B4    call        004BEAD0
 004C31B9    test        al,al
>004C31BB    jbe         004C31F4
 004C31BD    mov         byte ptr [ebp-9],al
 004C31C0    mov         bl,1
 004C31C2    lea         eax,[ebp-130]
 004C31C8    push        eax
 004C31C9    mov         ecx,ebx
 004C31CB    mov         dl,byte ptr [ebp-1]
 004C31CE    mov         eax,esi
 004C31D0    call        004BEEBC
 004C31D5    lea         edx,[ebp-130]
 004C31DB    lea         eax,[ebp-30]
 004C31DE    call        @LStrFromString
 004C31E3    mov         edx,dword ptr [ebp-30]
 004C31E6    mov         eax,dword ptr [ebp-8]
 004C31E9    mov         ecx,dword ptr [eax]
 004C31EB    call        dword ptr [ecx+34];TStringList.Add
 004C31EE    inc         ebx
 004C31EF    dec         byte ptr [ebp-9]
>004C31F2    jne         004C31C2
 004C31F4    mov         ebx,dword ptr [ebp-8]
>004C31F7    jmp         004C3284
 004C31FC    mov         dl,1
 004C31FE    mov         eax,[004120B8];TStringList
 004C3203    call        TObject.Create;TStringList.Create
 004C3208    mov         dword ptr [ebp-8],eax
 004C320B    mov         dl,1
 004C320D    mov         eax,dword ptr [ebp-8]
 004C3210    call        TStringList.SetSorted
 004C3215    mov         eax,dword ptr [ebp-8]
 004C3218    mov         byte ptr [eax+19],0;TStringList.FDuplicates:TDuplicates
 004C321C    mov         eax,esi
 004C321E    call        004BE9E0
 004C3223    test        al,al
>004C3225    jbe         004C3281
 004C3227    mov         byte ptr [ebp-9],al
 004C322A    mov         byte ptr [ebp-2],1
 004C322E    mov         dl,byte ptr [ebp-2]
 004C3231    mov         eax,esi
 004C3233    call        004BEAD0
 004C3238    test        al,al
>004C323A    jbe         004C3279
 004C323C    mov         byte ptr [ebp-0A],al
 004C323F    mov         bl,1
 004C3241    lea         eax,[ebp-130]
 004C3247    push        eax
 004C3248    mov         ecx,ebx
 004C324A    mov         dl,byte ptr [ebp-2]
 004C324D    mov         eax,esi
 004C324F    call        004BEEBC
 004C3254    lea         edx,[ebp-130]
 004C325A    lea         eax,[ebp-134]
 004C3260    call        @LStrFromString
 004C3265    mov         edx,dword ptr [ebp-134]
 004C326B    mov         eax,dword ptr [ebp-8]
 004C326E    mov         ecx,dword ptr [eax]
 004C3270    call        dword ptr [ecx+34];TStringList.Add
 004C3273    inc         ebx
 004C3274    dec         byte ptr [ebp-0A]
>004C3277    jne         004C3241
 004C3279    inc         byte ptr [ebp-2]
 004C327C    dec         byte ptr [ebp-9]
>004C327F    jne         004C322E
 004C3281    mov         ebx,dword ptr [ebp-8]
 004C3284    xor         eax,eax
 004C3286    pop         edx
 004C3287    pop         ecx
 004C3288    pop         ecx
 004C3289    mov         dword ptr fs:[eax],edx
 004C328C    push        4C32AC
 004C3291    lea         eax,[ebp-134]
 004C3297    call        @LStrClr
 004C329C    lea         eax,[ebp-30]
 004C329F    call        @LStrClr
 004C32A4    ret
>004C32A5    jmp         @HandleFinally
>004C32AA    jmp         004C3291
 004C32AC    mov         eax,ebx
 004C32AE    pop         esi
 004C32AF    pop         ebx
 004C32B0    mov         esp,ebp
 004C32B2    pop         ebp
 004C32B3    ret
//end;*}

//004C32B4
{*////procedure sub_004C32B4(?:dword; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004C32B4    push        ebp
 004C32B5    mov         ebp,esp
 004C32B7    add         esp,0FFFFFE8C
 004C32BD    push        ebx
 004C32BE    push        esi
 004C32BF    push        edi
 004C32C0    xor         ebx,ebx
 004C32C2    mov         dword ptr [ebp-174],ebx
 004C32C8    mov         dword ptr [ebp-170],ebx
 004C32CE    mov         dword ptr [ebp-16C],ebx
 004C32D4    mov         dword ptr [ebp-168],ebx
 004C32DA    mov         dword ptr [ebp-160],ebx
 004C32E0    mov         dword ptr [ebp-5C],ebx
 004C32E3    mov         byte ptr [ebp-6],cl
 004C32E6    mov         byte ptr [ebp-5],dl
 004C32E9    mov         dword ptr [ebp-4],eax
 004C32EC    xor         eax,eax
 004C32EE    push        ebp
 004C32EF    push        4C3660
 004C32F4    push        dword ptr fs:[eax]
 004C32F7    mov         dword ptr fs:[eax],esp
 004C32FA    mov         al,byte ptr [ebp+0C]
 004C32FD    sub         al,1
>004C32FF    jb          004C330C
>004C3301    je          004C3429
>004C3307    jmp         004C362F
 004C330C    xor         eax,eax
 004C330E    mov         dword ptr [ebp-10],eax
 004C3311    mov         dword ptr [ebp-0C],eax
 004C3314    mov         word ptr [ebp-8],ax
 004C3318    mov         byte ptr [ebp-52],0
 004C331C    mov         eax,dword ptr [ebp-4]
 004C331F    call        004BE9E0
 004C3324    test        al,al
>004C3326    jbe         004C33B3
 004C332C    mov         byte ptr [ebp-54],al
 004C332F    mov         byte ptr [ebp-51],1
 004C3333    xor         eax,eax
 004C3335    push        ebp
 004C3336    push        4C338E
 004C333B    push        dword ptr fs:[eax]
 004C333E    mov         dword ptr fs:[eax],esp
 004C3341    mov         al,byte ptr [ebp-6]
 004C3344    push        eax
 004C3345    lea         eax,[ebp-15C]
 004C334B    push        eax
 004C334C    mov         cl,byte ptr [ebp-5]
 004C334F    mov         dl,byte ptr [ebp-51]
 004C3352    mov         eax,dword ptr [ebp-4]
 004C3355    call        004C2D10
 004C335A    lea         edx,[ebp-15C]
 004C3360    lea         eax,[ebp-5C]
 004C3363    call        @LStrFromString
 004C3368    mov         eax,dword ptr [ebp-5C]
 004C336B    call        StrToFloat
 004C3370    fld         tbyte ptr [ebp-10]
 004C3373    faddp       st(1),st
 004C3375    fstp        tbyte ptr [ebp-10]
 004C3378    wait
 004C3379    add         byte ptr [ebp-52],1
>004C337D    jae         004C3384
 004C337F    call        @IntOver
 004C3384    xor         eax,eax
 004C3386    pop         edx
 004C3387    pop         ecx
 004C3388    pop         ecx
 004C3389    mov         dword ptr fs:[eax],edx
>004C338C    jmp         004C33AB
>004C338E    jmp         @HandleOnException
 004C3393    dd          1
 004C3397    dd          00409B50;EConvertError
 004C339B    dd          004C339F
 004C339F    call        @DoneExcept
>004C33A4    jmp         004C33AB
 004C33A6    call        @DoneExcept
 004C33AB    inc         byte ptr [ebp-51]
 004C33AE    dec         byte ptr [ebp-54]
>004C33B1    jne         004C3333
 004C33B3    cmp         byte ptr [ebp-52],0
>004C33B7    je          004C341E
 004C33B9    mov         eax,dword ptr [ebp+8]
 004C33BC    push        eax
 004C33BD    xor         eax,eax
 004C33BF    mov         al,byte ptr [ebp-52]
 004C33C2    mov         dword ptr [ebp-164],eax
 004C33C8    fild        dword ptr [ebp-164]
 004C33CE    fld         tbyte ptr [ebp-10]
 004C33D1    fdivrp      st(1),st
 004C33D3    add         esp,0FFFFFFF4
 004C33D6    fstp        tbyte ptr [esp]
 004C33D9    wait
 004C33DA    lea         eax,[ebp-160]
 004C33E0    push        eax
 004C33E1    mov         ecx,2
 004C33E6    mov         edx,12
 004C33EB    mov         al,2
 004C33ED    call        FloatToStrF
 004C33F2    mov         edx,dword ptr [ebp-160]
 004C33F8    lea         eax,[ebp-15C]
 004C33FE    mov         ecx,0FF
 004C3403    call        @LStrToString
 004C3408    lea         edx,[ebp-15C]
 004C340E    mov         cl,byte ptr [ebp+10]
 004C3411    mov         eax,dword ptr [ebp-4]
 004C3414    call        004C2410
>004C3419    jmp         004C362F
 004C341E    mov         eax,dword ptr [ebp+8]
 004C3421    mov         byte ptr [eax],0
>004C3424    jmp         004C362F
 004C3429    xor         eax,eax
 004C342B    mov         dword ptr [ebp-10],eax
 004C342E    mov         dword ptr [ebp-0C],eax
 004C3431    mov         word ptr [ebp-8],ax
 004C3435    xor         eax,eax
 004C3437    mov         dword ptr [ebp-50],eax
 004C343A    mov         dword ptr [ebp-4C],eax
 004C343D    mov         word ptr [ebp-48],ax
 004C3441    mov         eax,dword ptr [ebp-4]
 004C3444    call        004BE9E0
 004C3449    test        al,al
>004C344B    jbe         004C35B4
 004C3451    mov         byte ptr [ebp-54],al
 004C3454    mov         byte ptr [ebp-51],1
 004C3458    mov         dl,byte ptr [ebp-51]
 004C345B    mov         eax,dword ptr [ebp-4]
 004C345E    call        004BEAD0
 004C3463    test        al,al
>004C3465    jbe         004C35A8
 004C346B    mov         byte ptr [ebp-55],al
 004C346E    mov         byte ptr [ebp-53],1
 004C3472    lea         eax,[ebp-15C]
 004C3478    push        eax
 004C3479    mov         cl,byte ptr [ebp-53]
 004C347C    mov         dl,byte ptr [ebp-51]
 004C347F    mov         eax,dword ptr [ebp-4]
 004C3482    call        004BEDCC
 004C3487    lea         eax,[ebp-15C]
 004C348D    mov         edx,4C3670;'oui'
 004C3492    xor         ecx,ecx
 004C3494    mov         cl,byte ptr [eax]
 004C3496    inc         ecx
 004C3497    call        @AStrCmp
>004C349C    jne         004C359C
 004C34A2    xor         eax,eax
 004C34A4    push        ebp
 004C34A5    push        4C357F
 004C34AA    push        dword ptr fs:[eax]
 004C34AD    mov         dword ptr fs:[eax],esp
 004C34B0    mov         al,byte ptr [ebp-5]
 004C34B3    push        eax
 004C34B4    lea         eax,[ebp-15C]
 004C34BA    push        eax
 004C34BB    mov         cl,byte ptr [ebp-53]
 004C34BE    mov         dl,byte ptr [ebp-51]
 004C34C1    mov         eax,dword ptr [ebp-4]
 004C34C4    call        004BEF5C
 004C34C9    lea         edx,[ebp-15C]
 004C34CF    lea         eax,[ebp-168]
 004C34D5    call        @LStrFromString
 004C34DA    mov         eax,dword ptr [ebp-168]
 004C34E0    call        StrToFloat
 004C34E5    fstp        tbyte ptr [ebp-20]
 004C34E8    wait
 004C34E9    lea         eax,[ebp-15C]
 004C34EF    push        eax
 004C34F0    mov         cl,byte ptr [ebp-53]
 004C34F3    mov         dl,byte ptr [ebp-51]
 004C34F6    mov         eax,dword ptr [ebp-4]
 004C34F9    call        004BED2C
 004C34FE    lea         edx,[ebp-15C]
 004C3504    lea         eax,[ebp-16C]
 004C350A    call        @LStrFromString
 004C350F    mov         eax,dword ptr [ebp-16C]
 004C3515    call        StrToFloat
 004C351A    fstp        tbyte ptr [ebp-40]
 004C351D    wait
 004C351E    lea         eax,[ebp-15C]
 004C3524    push        eax
 004C3525    mov         cl,byte ptr [ebp-53]
 004C3528    mov         dl,byte ptr [ebp-51]
 004C352B    mov         eax,dword ptr [ebp-4]
 004C352E    call        004BED7C
 004C3533    lea         edx,[ebp-15C]
 004C3539    lea         eax,[ebp-170]
 004C353F    call        @LStrFromString
 004C3544    mov         eax,dword ptr [ebp-170]
 004C354A    call        StrToFloat
 004C354F    fstp        tbyte ptr [ebp-30]
 004C3552    wait
 004C3553    fld         tbyte ptr [ebp-20]
 004C3556    fld         tbyte ptr [ebp-30]
 004C3559    fmulp       st(1),st
 004C355B    fld         tbyte ptr [ebp-10]
 004C355E    faddp       st(1),st
 004C3560    fstp        tbyte ptr [ebp-10]
 004C3563    wait
 004C3564    fld         tbyte ptr [ebp-40]
 004C3567    fld         tbyte ptr [ebp-30]
 004C356A    fmulp       st(1),st
 004C356C    fld         tbyte ptr [ebp-50]
 004C356F    faddp       st(1),st
 004C3571    fstp        tbyte ptr [ebp-50]
 004C3574    wait
 004C3575    xor         eax,eax
 004C3577    pop         edx
 004C3578    pop         ecx
 004C3579    pop         ecx
 004C357A    mov         dword ptr fs:[eax],edx
>004C357D    jmp         004C359C
>004C357F    jmp         @HandleOnException
 004C3584    dd          1
 004C3588    dd          004094F8;Exception
 004C358C    dd          004C3590
 004C3590    call        @DoneExcept
>004C3595    jmp         004C359C
 004C3597    call        @DoneExcept
 004C359C    inc         byte ptr [ebp-53]
 004C359F    dec         byte ptr [ebp-55]
>004C35A2    jne         004C3472
 004C35A8    inc         byte ptr [ebp-51]
 004C35AB    dec         byte ptr [ebp-54]
>004C35AE    jne         004C3458
 004C35B4    fld         tbyte ptr [ebp-50]
 004C35B7    fcomp       dword ptr ds:[4C3674];0:Single
 004C35BD    fnstsw      al
 004C35BF    sahf
>004C35C0    je          004C3629
 004C35C2    mov         eax,dword ptr [ebp+8]
 004C35C5    push        eax
 004C35C6    call        004B9E48
 004C35CB    mov         dword ptr [ebp-164],eax
 004C35D1    fild        dword ptr [ebp-164]
 004C35D7    fld         tbyte ptr [ebp-10]
 004C35DA    fld         tbyte ptr [ebp-50]
 004C35DD    fdivp       st(1),st
 004C35DF    fmulp       st(1),st
 004C35E1    add         esp,0FFFFFFF4
 004C35E4    fstp        tbyte ptr [esp]
 004C35E7    wait
 004C35E8    lea         eax,[ebp-174]
 004C35EE    push        eax
 004C35EF    mov         ecx,2
 004C35F4    mov         edx,12
 004C35F9    mov         al,2
 004C35FB    call        FloatToStrF
 004C3600    mov         edx,dword ptr [ebp-174]
 004C3606    lea         eax,[ebp-15C]
 004C360C    mov         ecx,0FF
 004C3611    call        @LStrToString
 004C3616    lea         edx,[ebp-15C]
 004C361C    mov         cl,byte ptr [ebp+10]
 004C361F    mov         eax,dword ptr [ebp-4]
 004C3622    call        004C2410
>004C3627    jmp         004C362F
 004C3629    mov         eax,dword ptr [ebp+8]
 004C362C    mov         byte ptr [eax],0
 004C362F    xor         eax,eax
 004C3631    pop         edx
 004C3632    pop         ecx
 004C3633    pop         ecx
 004C3634    mov         dword ptr fs:[eax],edx
 004C3637    push        4C3667
 004C363C    lea         eax,[ebp-174]
 004C3642    mov         edx,4
 004C3647    call        @LStrArrayClr
 004C364C    lea         eax,[ebp-160]
 004C3652    call        @LStrClr
 004C3657    lea         eax,[ebp-5C]
 004C365A    call        @LStrClr
 004C365F    ret
>004C3660    jmp         @HandleFinally
>004C3665    jmp         004C363C
 004C3667    pop         edi
 004C3668    pop         esi
 004C3669    pop         ebx
 004C366A    mov         esp,ebp
 004C366C    pop         ebp
 004C366D    ret         0C
//end;*}

//004C3678
{*////procedure sub_004C3678(?:dword; ?:?; ?:?);
begin
 004C3678    push        ebp
 004C3679    mov         ebp,esp
 004C367B    add         esp,0FFFFFDF4
 004C3681    push        ebx
 004C3682    push        esi
 004C3683    push        edi
 004C3684    xor         ebx,ebx
 004C3686    mov         dword ptr [ebp-20C],ebx
 004C368C    mov         esi,dword ptr [ebp+8]
 004C368F    lea         edi,[ebp-108]
 004C3695    push        ecx
 004C3696    xor         ecx,ecx
 004C3698    mov         cl,byte ptr [esi]
 004C369A    inc         ecx
 004C369B    rep movs    byte ptr [edi],byte ptr [esi]
 004C369D    pop         ecx
 004C369E    mov         byte ptr [ebp-1],cl
 004C36A1    mov         ebx,edx
 004C36A3    mov         esi,eax
 004C36A5    xor         eax,eax
 004C36A7    push        ebp
 004C36A8    push        4C3785
 004C36AD    push        dword ptr fs:[eax]
 004C36B0    mov         dword ptr fs:[eax],esp
 004C36B3    mov         eax,esi
 004C36B5    call        004BEA58
 004C36BA    and         eax,0FF
 004C36BF    xor         edx,edx
 004C36C1    mov         dl,bl
 004C36C3    sub         edx,1
>004C36C6    jno         004C36CD
 004C36C8    call        @IntOver
 004C36CD    imul        edx
>004C36CF    jno         004C36D6
 004C36D1    call        @IntOver
 004C36D6    xor         edx,edx
 004C36D8    mov         dl,byte ptr [ebp-1]
 004C36DB    sub         edx,1
>004C36DE    jno         004C36E5
 004C36E0    call        @IntOver
 004C36E5    add         eax,edx
>004C36E7    jno         004C36EE
 004C36E9    call        @IntOver
 004C36EE    mov         dword ptr [ebp-8],eax
 004C36F1    lea         eax,[ebp-208]
 004C36F7    push        eax
 004C36F8    mov         cl,byte ptr [ebp-1]
 004C36FB    mov         edx,ebx
 004C36FD    mov         eax,esi
 004C36FF    call        004C2B38
 004C3704    lea         eax,[ebp-208]
 004C370A    lea         edx,[ebp-108]
 004C3710    xor         ecx,ecx
 004C3712    mov         cl,byte ptr [eax]
 004C3714    inc         ecx
 004C3715    call        @AStrCmp
>004C371A    je          004C376C
 004C371C    lea         eax,[ebp-20C]
 004C3722    lea         edx,[ebp-108]
 004C3728    call        @LStrFromString
 004C372D    mov         ecx,dword ptr [ebp-20C]
 004C3733    mov         edx,dword ptr [ebp-8]
 004C3736    mov         eax,dword ptr [esi+928]
 004C373C    mov         edi,dword ptr [eax]
 004C373E    call        dword ptr [edi+54]
 004C3741    mov         edx,dword ptr [ebp-8]
 004C3744    add         edx,1
>004C3747    jno         004C374E
 004C3749    call        @IntOver
 004C374E    mov         eax,dword ptr [esi+928]
 004C3754    mov         ecx,dword ptr [eax]
 004C3756    call        dword ptr [ecx+44]
 004C3759    mov         byte ptr [esi+8],1
 004C375D    mov         cl,1
 004C375F    mov         edx,ebx
 004C3761    mov         eax,dword ptr [esi+918]
 004C3767    call        004B6E84
 004C376C    xor         eax,eax
 004C376E    pop         edx
 004C376F    pop         ecx
 004C3770    pop         ecx
 004C3771    mov         dword ptr fs:[eax],edx
 004C3774    push        4C378C
 004C3779    lea         eax,[ebp-20C]
 004C377F    call        @LStrClr
 004C3784    ret
>004C3785    jmp         @HandleFinally
>004C378A    jmp         004C3779
 004C378C    pop         edi
 004C378D    pop         esi
 004C378E    pop         ebx
 004C378F    mov         esp,ebp
 004C3791    pop         ebp
 004C3792    ret         4
//end;*}

//004C3798
{*////procedure sub_004C3798(?:dword; ?:dword; ?:?; ?:?);
begin
 004C3798    push        ebp
 004C3799    mov         ebp,esp
 004C379B    add         esp,0FFFFFDF4
 004C37A1    push        ebx
 004C37A2    push        esi
 004C37A3    push        edi
 004C37A4    xor         ebx,ebx
 004C37A6    mov         dword ptr [ebp-20C],ebx
 004C37AC    mov         esi,dword ptr [ebp+0C]
 004C37AF    lea         edi,[ebp-108]
 004C37B5    push        ecx
 004C37B6    xor         ecx,ecx
 004C37B8    mov         cl,byte ptr [esi]
 004C37BA    inc         ecx
 004C37BB    rep movs    byte ptr [edi],byte ptr [esi]
 004C37BD    pop         ecx
 004C37BE    mov         byte ptr [ebp-1],cl
 004C37C1    mov         ebx,edx
 004C37C3    mov         esi,eax
 004C37C5    xor         eax,eax
 004C37C7    push        ebp
 004C37C8    push        4C38F6
 004C37CD    push        dword ptr fs:[eax]
 004C37D0    mov         dword ptr fs:[eax],esp
 004C37D3    mov         al,byte ptr [ebp+8]
 004C37D6    push        eax
 004C37D7    lea         eax,[ebp-208]
 004C37DD    push        eax
 004C37DE    mov         cl,byte ptr [ebp-1]
 004C37E1    mov         edx,ebx
 004C37E3    mov         eax,esi
 004C37E5    call        004C2C00
 004C37EA    lea         eax,[ebp-208]
 004C37F0    lea         edx,[ebp-108]
 004C37F6    xor         ecx,ecx
 004C37F8    mov         cl,byte ptr [eax]
 004C37FA    inc         ecx
 004C37FB    call        @AStrCmp
>004C3800    je          004C38DD
 004C3806    mov         eax,esi
 004C3808    call        004C8AE8
 004C380D    mov         edi,eax
 004C380F    and         edi,0FF
 004C3815    xor         eax,eax
 004C3817    mov         al,byte ptr [ebp-1]
 004C381A    sub         eax,1
>004C381D    jno         004C3824
 004C381F    call        @IntOver
 004C3824    imul        edi,eax
>004C3827    jno         004C382E
 004C3829    call        @IntOver
 004C382E    xor         eax,eax
 004C3830    mov         al,byte ptr [ebp+8]
 004C3833    sub         eax,1
>004C3836    jno         004C383D
 004C3838    call        @IntOver
 004C383D    add         edi,eax
>004C383F    jno         004C3846
 004C3841    call        @IntOver
 004C3846    mov         eax,esi
 004C3848    call        004BEA58
 004C384D    and         eax,0FF
 004C3852    xor         edx,edx
 004C3854    mov         dl,bl
 004C3856    sub         edx,1
>004C3859    jno         004C3860
 004C385B    call        @IntOver
 004C3860    imul        edx
>004C3862    jno         004C3869
 004C3864    call        @IntOver
 004C3869    push        eax
 004C386A    mov         eax,esi
 004C386C    call        004C8AE8
 004C3871    and         eax,0FF
 004C3876    pop         edx
 004C3877    imul        edx,eax
>004C387A    jno         004C3881
 004C387C    call        @IntOver
 004C3881    add         edi,edx
>004C3883    jno         004C388A
 004C3885    call        @IntOver
 004C388A    mov         dword ptr [ebp-8],edi
 004C388D    lea         eax,[ebp-20C]
 004C3893    lea         edx,[ebp-108]
 004C3899    call        @LStrFromString
 004C389E    mov         ecx,dword ptr [ebp-20C]
 004C38A4    mov         edx,dword ptr [ebp-8]
 004C38A7    mov         eax,dword ptr [esi+92C]
 004C38AD    mov         edi,dword ptr [eax]
 004C38AF    call        dword ptr [edi+54]
 004C38B2    mov         edx,dword ptr [ebp-8]
 004C38B5    add         edx,1
>004C38B8    jno         004C38BF
 004C38BA    call        @IntOver
 004C38BF    mov         eax,dword ptr [esi+92C]
 004C38C5    mov         ecx,dword ptr [eax]
 004C38C7    call        dword ptr [ecx+44]
 004C38CA    mov         byte ptr [esi+8],1
 004C38CE    mov         cl,1
 004C38D0    mov         edx,ebx
 004C38D2    mov         eax,dword ptr [esi+918]
 004C38D8    call        004B6E84
 004C38DD    xor         eax,eax
 004C38DF    pop         edx
 004C38E0    pop         ecx
 004C38E1    pop         ecx
 004C38E2    mov         dword ptr fs:[eax],edx
 004C38E5    push        4C38FD
 004C38EA    lea         eax,[ebp-20C]
 004C38F0    call        @LStrClr
 004C38F5    ret
>004C38F6    jmp         @HandleFinally
>004C38FB    jmp         004C38EA
 004C38FD    pop         edi
 004C38FE    pop         esi
 004C38FF    pop         ebx
 004C3900    mov         esp,ebp
 004C3902    pop         ebp
 004C3903    ret         8
//end;*}

//004C3908
////procedure sub_004C3908(?:TFichierCdn; ?:PShortString);
//begin
{*
 004C3908    push        ebx
 004C3909    push        esi
 004C390A    mov         esi,edx
 004C390C    mov         ebx,eax
 004C390E    mov         eax,esi
 004C3910    lea         edx,[ebx+310]
 004C3916    call        @PStrCpy
 004C391B    pop         esi
 004C391C    pop         ebx
 004C391D    ret
*}
//end;

//004C3920
////procedure sub_004C3920(?:TFichierCdn; ?:PShortString);
//begin
{*
 004C3920    push        ebx
 004C3921    push        esi
 004C3922    push        edi
 004C3923    add         esp,0FFFFFF00
 004C3929    mov         esi,edx
 004C392B    lea         edi,[esp]
 004C392E    xor         ecx,ecx
 004C3930    mov         cl,byte ptr [esi]
 004C3932    inc         ecx
 004C3933    rep movs    byte ptr [edi],byte ptr [esi]
 004C3935    mov         ebx,eax
 004C3937    lea         eax,[ebx+310]
 004C393D    mov         edx,esp
 004C393F    call        @PStrCpy
 004C3944    mov         byte ptr [ebx+8],1
 004C3948    add         esp,100
 004C394E    pop         edi
 004C394F    pop         esi
 004C3950    pop         ebx
 004C3951    ret
*}
//end;

//004C3954
{*function sub_004C3954(?:dword):?;
begin
 004C3954    mov         al,byte ptr [eax+8]
 004C3957    ret
//end;*}

//004C3958
{*////procedure sub_004C3958(?:dword; ?:?; ?:Single; ?:?);
begin
 004C3958    push        ebp
 004C3959    mov         ebp,esp
 004C395B    add         esp,0FFFFFEC8
 004C3961    push        ebx
 004C3962    push        esi
 004C3963    push        edi
 004C3964    xor         ebx,ebx
 004C3966    mov         dword ptr [ebp-138],ebx
 004C396C    mov         dword ptr [ebp-134],ebx
 004C3972    mov         dword ptr [ebp-30],ebx
 004C3975    mov         byte ptr [ebp-6],cl
 004C3978    mov         byte ptr [ebp-5],dl
 004C397B    mov         dword ptr [ebp-4],eax
 004C397E    xor         eax,eax
 004C3980    push        ebp
 004C3981    push        4C3B42
 004C3986    push        dword ptr fs:[eax]
 004C3989    mov         dword ptr fs:[eax],esp
 004C398C    push        1
 004C398E    mov         cl,byte ptr [ebp-6]
 004C3991    mov         dl,byte ptr [ebp-5]
 004C3994    mov         eax,dword ptr [ebp-4]
 004C3997    call        004C6030
 004C399C    test        al,al
>004C399E    je          004C3B08
 004C39A4    xor         eax,eax
 004C39A6    mov         dword ptr [ebp-28],eax
 004C39A9    lea         eax,[ebp-130]
 004C39AF    push        eax
 004C39B0    mov         cl,byte ptr [ebp-6]
 004C39B3    mov         dl,byte ptr [ebp-5]
 004C39B6    mov         eax,dword ptr [ebp-4]
 004C39B9    call        004BED2C
 004C39BE    lea         edx,[ebp-130]
 004C39C4    lea         eax,[ebp-30]
 004C39C7    call        @LStrFromString
 004C39CC    mov         eax,dword ptr [ebp-30]
 004C39CF    call        StrToFloat
 004C39D4    fstp        tbyte ptr [ebp-10]
 004C39D7    wait
 004C39D8    mov         eax,dword ptr [ebp-4]
 004C39DB    call        004BEA58
 004C39E0    and         eax,0FF
 004C39E5    test        eax,eax
>004C39E7    jle         004C3AA9
 004C39ED    mov         dword ptr [ebp-2C],eax
 004C39F0    mov         dword ptr [ebp-24],1
 004C39F7    xor         eax,eax
 004C39F9    push        ebp
 004C39FA    push        4C3A80
 004C39FF    push        dword ptr fs:[eax]
 004C3A02    mov         dword ptr fs:[eax],esp
 004C3A05    mov         eax,dword ptr [ebp-24]
 004C3A08    cmp         eax,0FF
>004C3A0D    jbe         004C3A14
 004C3A0F    call        @BoundErr
 004C3A14    push        eax
 004C3A15    lea         eax,[ebp-130]
 004C3A1B    push        eax
 004C3A1C    mov         cl,byte ptr [ebp-6]
 004C3A1F    mov         dl,byte ptr [ebp-5]
 004C3A22    mov         eax,dword ptr [ebp-4]
 004C3A25    call        004BEF5C
 004C3A2A    lea         edx,[ebp-130]
 004C3A30    lea         eax,[ebp-134]
 004C3A36    call        @LStrFromString
 004C3A3B    mov         eax,dword ptr [ebp-134]
 004C3A41    call        StrToFloat
 004C3A46    fstp        tbyte ptr [ebp-20]
 004C3A49    wait
 004C3A4A    fld         tbyte ptr [ebp-10]
 004C3A4D    fld         tbyte ptr [ebp-20]
 004C3A50    fcompp
 004C3A52    fnstsw      al
 004C3A54    sahf
>004C3A55    jae         004C3A6B
 004C3A57    mov         eax,dword ptr [ebp-20]
 004C3A5A    mov         dword ptr [ebp-10],eax
 004C3A5D    mov         eax,dword ptr [ebp-1C]
 004C3A60    mov         dword ptr [ebp-0C],eax
 004C3A63    mov         ax,word ptr [ebp-18]
 004C3A67    mov         word ptr [ebp-8],ax
 004C3A6B    add         dword ptr [ebp-28],1
>004C3A6F    jno         004C3A76
 004C3A71    call        @IntOver
 004C3A76    xor         eax,eax
 004C3A78    pop         edx
 004C3A79    pop         ecx
 004C3A7A    pop         ecx
 004C3A7B    mov         dword ptr fs:[eax],edx
>004C3A7E    jmp         004C3A9D
>004C3A80    jmp         @HandleOnException
 004C3A85    dd          1
 004C3A89    dd          00409B50;EConvertError
 004C3A8D    dd          004C3A91
 004C3A91    call        @DoneExcept
>004C3A96    jmp         004C3A9D
 004C3A98    call        @DoneExcept
 004C3A9D    inc         dword ptr [ebp-24]
 004C3AA0    dec         dword ptr [ebp-2C]
>004C3AA3    jne         004C39F7
 004C3AA9    cmp         dword ptr [ebp-28],0
>004C3AAD    jle         004C3ADA
 004C3AAF    mov         ax,word ptr [ebp-8]
 004C3AB3    push        eax
 004C3AB4    push        dword ptr [ebp-0C]
 004C3AB7    push        dword ptr [ebp-10]
 004C3ABA    lea         eax,[ebp-138]
 004C3AC0    call        FloatToStr
 004C3AC5    mov         edx,dword ptr [ebp-138]
 004C3ACB    mov         eax,dword ptr [ebp+8]
 004C3ACE    mov         ecx,0FF
 004C3AD3    call        @LStrToString
>004C3AD8    jmp         004C3AE0
 004C3ADA    mov         eax,dword ptr [ebp+8]
 004C3ADD    mov         byte ptr [eax],0
 004C3AE0    push        8
 004C3AE2    mov         eax,dword ptr [ebp+8]
 004C3AE5    push        eax
 004C3AE6    mov         cl,byte ptr [ebp-6]
 004C3AE9    mov         dl,byte ptr [ebp-5]
 004C3AEC    mov         eax,dword ptr [ebp-4]
 004C3AEF    call        004C5E04
 004C3AF4    push        1
 004C3AF6    push        0
 004C3AF8    mov         cl,byte ptr [ebp-6]
 004C3AFB    mov         dl,byte ptr [ebp-5]
 004C3AFE    mov         eax,dword ptr [ebp-4]
 004C3B01    call        004C5FF8
>004C3B06    jmp         004C3B1C
 004C3B08    push        8
 004C3B0A    mov         eax,dword ptr [ebp+8]
 004C3B0D    push        eax
 004C3B0E    mov         cl,byte ptr [ebp-6]
 004C3B11    mov         dl,byte ptr [ebp-5]
 004C3B14    mov         eax,dword ptr [ebp-4]
 004C3B17    call        004C5F08
 004C3B1C    xor         eax,eax
 004C3B1E    pop         edx
 004C3B1F    pop         ecx
 004C3B20    pop         ecx
 004C3B21    mov         dword ptr fs:[eax],edx
 004C3B24    push        4C3B49
 004C3B29    lea         eax,[ebp-138]
 004C3B2F    mov         edx,2
 004C3B34    call        @LStrArrayClr
 004C3B39    lea         eax,[ebp-30]
 004C3B3C    call        @LStrClr
 004C3B41    ret
>004C3B42    jmp         @HandleFinally
>004C3B47    jmp         004C3B29
 004C3B49    pop         edi
 004C3B4A    pop         esi
 004C3B4B    pop         ebx
 004C3B4C    mov         esp,ebp
 004C3B4E    pop         ebp
 004C3B4F    ret         4
//end;*}

//004C3B54
{*////procedure sub_004C3B54(?:dword; ?:?; ?:Single; ?:?);
begin
 004C3B54    push        ebp
 004C3B55    mov         ebp,esp
 004C3B57    add         esp,0FFFFFECC
 004C3B5D    push        ebx
 004C3B5E    push        esi
 004C3B5F    push        edi
 004C3B60    xor         ebx,ebx
 004C3B62    mov         dword ptr [ebp-134],ebx
 004C3B68    mov         dword ptr [ebp-30],ebx
 004C3B6B    mov         byte ptr [ebp-6],cl
 004C3B6E    mov         byte ptr [ebp-5],dl
 004C3B71    mov         dword ptr [ebp-4],eax
 004C3B74    xor         eax,eax
 004C3B76    push        ebp
 004C3B77    push        4C3D0A
 004C3B7C    push        dword ptr fs:[eax]
 004C3B7F    mov         dword ptr fs:[eax],esp
 004C3B82    push        2
 004C3B84    mov         cl,byte ptr [ebp-6]
 004C3B87    mov         dl,byte ptr [ebp-5]
 004C3B8A    mov         eax,dword ptr [ebp-4]
 004C3B8D    call        004C6030
 004C3B92    test        al,al
>004C3B94    je          004C3CD5
 004C3B9A    xor         eax,eax
 004C3B9C    mov         dword ptr [ebp-28],eax
 004C3B9F    xor         eax,eax
 004C3BA1    mov         dword ptr [ebp-10],eax
 004C3BA4    mov         dword ptr [ebp-0C],eax
 004C3BA7    mov         word ptr [ebp-8],ax
 004C3BAB    mov         eax,dword ptr [ebp-4]
 004C3BAE    call        004BEA58
 004C3BB3    and         eax,0FF
 004C3BB8    test        eax,eax
>004C3BBA    jle         004C3C76
 004C3BC0    mov         dword ptr [ebp-2C],eax
 004C3BC3    mov         dword ptr [ebp-24],1
 004C3BCA    xor         eax,eax
 004C3BCC    push        ebp
 004C3BCD    push        4C3C4D
 004C3BD2    push        dword ptr fs:[eax]
 004C3BD5    mov         dword ptr fs:[eax],esp
 004C3BD8    mov         eax,dword ptr [ebp-24]
 004C3BDB    cmp         eax,0FF
>004C3BE0    jbe         004C3BE7
 004C3BE2    call        @BoundErr
 004C3BE7    push        eax
 004C3BE8    lea         eax,[ebp-130]
 004C3BEE    push        eax
 004C3BEF    mov         cl,byte ptr [ebp-6]
 004C3BF2    mov         dl,byte ptr [ebp-5]
 004C3BF5    mov         eax,dword ptr [ebp-4]
 004C3BF8    call        004BEF5C
 004C3BFD    lea         edx,[ebp-130]
 004C3C03    lea         eax,[ebp-30]
 004C3C06    call        @LStrFromString
 004C3C0B    mov         eax,dword ptr [ebp-30]
 004C3C0E    call        StrToFloat
 004C3C13    fstp        tbyte ptr [ebp-20]
 004C3C16    wait
 004C3C17    fld         tbyte ptr [ebp-10]
 004C3C1A    fld         tbyte ptr [ebp-20]
 004C3C1D    fcompp
 004C3C1F    fnstsw      al
 004C3C21    sahf
>004C3C22    jbe         004C3C38
 004C3C24    mov         eax,dword ptr [ebp-20]
 004C3C27    mov         dword ptr [ebp-10],eax
 004C3C2A    mov         eax,dword ptr [ebp-1C]
 004C3C2D    mov         dword ptr [ebp-0C],eax
 004C3C30    mov         ax,word ptr [ebp-18]
 004C3C34    mov         word ptr [ebp-8],ax
 004C3C38    add         dword ptr [ebp-28],1
>004C3C3C    jno         004C3C43
 004C3C3E    call        @IntOver
 004C3C43    xor         eax,eax
 004C3C45    pop         edx
 004C3C46    pop         ecx
 004C3C47    pop         ecx
 004C3C48    mov         dword ptr fs:[eax],edx
>004C3C4B    jmp         004C3C6A
>004C3C4D    jmp         @HandleOnException
 004C3C52    dd          1
 004C3C56    dd          00409B50;EConvertError
 004C3C5A    dd          004C3C5E
 004C3C5E    call        @DoneExcept
>004C3C63    jmp         004C3C6A
 004C3C65    call        @DoneExcept
 004C3C6A    inc         dword ptr [ebp-24]
 004C3C6D    dec         dword ptr [ebp-2C]
>004C3C70    jne         004C3BCA
 004C3C76    cmp         dword ptr [ebp-28],0
>004C3C7A    jle         004C3CA7
 004C3C7C    mov         ax,word ptr [ebp-8]
 004C3C80    push        eax
 004C3C81    push        dword ptr [ebp-0C]
 004C3C84    push        dword ptr [ebp-10]
 004C3C87    lea         eax,[ebp-134]
 004C3C8D    call        FloatToStr
 004C3C92    mov         edx,dword ptr [ebp-134]
 004C3C98    mov         eax,dword ptr [ebp+8]
 004C3C9B    mov         ecx,0FF
 004C3CA0    call        @LStrToString
>004C3CA5    jmp         004C3CAD
 004C3CA7    mov         eax,dword ptr [ebp+8]
 004C3CAA    mov         byte ptr [eax],0
 004C3CAD    push        9
 004C3CAF    mov         eax,dword ptr [ebp+8]
 004C3CB2    push        eax
 004C3CB3    mov         cl,byte ptr [ebp-6]
 004C3CB6    mov         dl,byte ptr [ebp-5]
 004C3CB9    mov         eax,dword ptr [ebp-4]
 004C3CBC    call        004C5E04
 004C3CC1    push        2
 004C3CC3    push        0
 004C3CC5    mov         cl,byte ptr [ebp-6]
 004C3CC8    mov         dl,byte ptr [ebp-5]
 004C3CCB    mov         eax,dword ptr [ebp-4]
 004C3CCE    call        004C5FF8
>004C3CD3    jmp         004C3CE9
 004C3CD5    push        9
 004C3CD7    mov         eax,dword ptr [ebp+8]
 004C3CDA    push        eax
 004C3CDB    mov         cl,byte ptr [ebp-6]
 004C3CDE    mov         dl,byte ptr [ebp-5]
 004C3CE1    mov         eax,dword ptr [ebp-4]
 004C3CE4    call        004C5F08
 004C3CE9    xor         eax,eax
 004C3CEB    pop         edx
 004C3CEC    pop         ecx
 004C3CED    pop         ecx
 004C3CEE    mov         dword ptr fs:[eax],edx
 004C3CF1    push        4C3D11
 004C3CF6    lea         eax,[ebp-134]
 004C3CFC    call        @LStrClr
 004C3D01    lea         eax,[ebp-30]
 004C3D04    call        @LStrClr
 004C3D09    ret
>004C3D0A    jmp         @HandleFinally
>004C3D0F    jmp         004C3CF6
 004C3D11    pop         edi
 004C3D12    pop         esi
 004C3D13    pop         ebx
 004C3D14    mov         esp,ebp
 004C3D16    pop         ebp
 004C3D17    ret         4
//end;*}

//004C3D1C
{*////procedure sub_004C3D1C(?:dword; ?:?; ?:?; ?:?);
begin
 004C3D1C    push        ebp
 004C3D1D    mov         ebp,esp
 004C3D1F    add         esp,0FFFFFEE4
 004C3D25    push        ebx
 004C3D26    push        esi
 004C3D27    push        edi
 004C3D28    xor         ebx,ebx
 004C3D2A    mov         dword ptr [ebp-11C],ebx
 004C3D30    mov         dword ptr [ebp-18],ebx
 004C3D33    mov         byte ptr [ebp-6],cl
 004C3D36    mov         byte ptr [ebp-5],dl
 004C3D39    mov         dword ptr [ebp-4],eax
 004C3D3C    xor         eax,eax
 004C3D3E    push        ebp
 004C3D3F    push        4C3E94
 004C3D44    push        dword ptr fs:[eax]
 004C3D47    mov         dword ptr fs:[eax],esp
 004C3D4A    push        5
 004C3D4C    mov         cl,byte ptr [ebp-6]
 004C3D4F    mov         dl,byte ptr [ebp-5]
 004C3D52    mov         eax,dword ptr [ebp-4]
 004C3D55    call        004C6030
 004C3D5A    test        al,al
>004C3D5C    je          004C3E5F
 004C3D62    xor         eax,eax
 004C3D64    mov         dword ptr [ebp-10],eax
 004C3D67    mov         eax,dword ptr [ebp-4]
 004C3D6A    call        004BEA58
 004C3D6F    and         eax,0FF
 004C3D74    test        eax,eax
>004C3D76    jle         004C3E0F
 004C3D7C    mov         dword ptr [ebp-14],eax
 004C3D7F    mov         dword ptr [ebp-0C],1
 004C3D86    xor         eax,eax
 004C3D88    push        ebp
 004C3D89    push        4C3DE6
 004C3D8E    push        dword ptr fs:[eax]
 004C3D91    mov         dword ptr fs:[eax],esp
 004C3D94    mov         eax,dword ptr [ebp-0C]
 004C3D97    cmp         eax,0FF
>004C3D9C    jbe         004C3DA3
 004C3D9E    call        @BoundErr
 004C3DA3    push        eax
 004C3DA4    lea         eax,[ebp-118]
 004C3DAA    push        eax
 004C3DAB    mov         cl,byte ptr [ebp-6]
 004C3DAE    mov         dl,byte ptr [ebp-5]
 004C3DB1    mov         eax,dword ptr [ebp-4]
 004C3DB4    call        004BEF5C
 004C3DB9    lea         edx,[ebp-118]
 004C3DBF    lea         eax,[ebp-18]
 004C3DC2    call        @LStrFromString
 004C3DC7    mov         eax,dword ptr [ebp-18]
 004C3DCA    call        StrToFloat
 004C3DCF    fstp        st(0)
 004C3DD1    add         dword ptr [ebp-10],1
>004C3DD5    jno         004C3DDC
 004C3DD7    call        @IntOver
 004C3DDC    xor         eax,eax
 004C3DDE    pop         edx
 004C3DDF    pop         ecx
 004C3DE0    pop         ecx
 004C3DE1    mov         dword ptr fs:[eax],edx
>004C3DE4    jmp         004C3E03
>004C3DE6    jmp         @HandleOnException
 004C3DEB    dd          1
 004C3DEF    dd          00409B50;EConvertError
 004C3DF3    dd          004C3DF7
 004C3DF7    call        @DoneExcept
>004C3DFC    jmp         004C3E03
 004C3DFE    call        @DoneExcept
 004C3E03    inc         dword ptr [ebp-0C]
 004C3E06    dec         dword ptr [ebp-14]
>004C3E09    jne         004C3D86
 004C3E0F    fild        dword ptr [ebp-10]
 004C3E12    add         esp,0FFFFFFF4
 004C3E15    fstp        tbyte ptr [esp]
 004C3E18    wait
 004C3E19    lea         eax,[ebp-11C]
 004C3E1F    call        FloatToStr
 004C3E24    mov         edx,dword ptr [ebp-11C]
 004C3E2A    mov         eax,dword ptr [ebp+8]
 004C3E2D    mov         ecx,0FF
 004C3E32    call        @LStrToString
 004C3E37    push        0C
 004C3E39    mov         eax,dword ptr [ebp+8]
 004C3E3C    push        eax
 004C3E3D    mov         cl,byte ptr [ebp-6]
 004C3E40    mov         dl,byte ptr [ebp-5]
 004C3E43    mov         eax,dword ptr [ebp-4]
 004C3E46    call        004C5E04
 004C3E4B    push        5
 004C3E4D    push        0
 004C3E4F    mov         cl,byte ptr [ebp-6]
 004C3E52    mov         dl,byte ptr [ebp-5]
 004C3E55    mov         eax,dword ptr [ebp-4]
 004C3E58    call        004C5FF8
>004C3E5D    jmp         004C3E73
 004C3E5F    push        0C
 004C3E61    mov         eax,dword ptr [ebp+8]
 004C3E64    push        eax
 004C3E65    mov         cl,byte ptr [ebp-6]
 004C3E68    mov         dl,byte ptr [ebp-5]
 004C3E6B    mov         eax,dword ptr [ebp-4]
 004C3E6E    call        004C5F08
 004C3E73    xor         eax,eax
 004C3E75    pop         edx
 004C3E76    pop         ecx
 004C3E77    pop         ecx
 004C3E78    mov         dword ptr fs:[eax],edx
 004C3E7B    push        4C3E9B
 004C3E80    lea         eax,[ebp-11C]
 004C3E86    call        @LStrClr
 004C3E8B    lea         eax,[ebp-18]
 004C3E8E    call        @LStrClr
 004C3E93    ret
>004C3E94    jmp         @HandleFinally
>004C3E99    jmp         004C3E80
 004C3E9B    pop         edi
 004C3E9C    pop         esi
 004C3E9D    pop         ebx
 004C3E9E    mov         esp,ebp
 004C3EA0    pop         ebp
 004C3EA1    ret         4
//end;*}

//004C3EA4
{*////procedure sub_004C3EA4(?:dword; ?:?; ?:?; ?:?);
begin
 004C3EA4    push        ebp
 004C3EA5    mov         ebp,esp
 004C3EA7    add         esp,0FFFFFED4
 004C3EAD    push        ebx
 004C3EAE    push        esi
 004C3EAF    push        edi
 004C3EB0    xor         ebx,ebx
 004C3EB2    mov         dword ptr [ebp-12C],ebx
 004C3EB8    mov         dword ptr [ebp-128],ebx
 004C3EBE    mov         dword ptr [ebp-24],ebx
 004C3EC1    mov         byte ptr [ebp-6],cl
 004C3EC4    mov         byte ptr [ebp-5],dl
 004C3EC7    mov         dword ptr [ebp-4],eax
 004C3ECA    xor         eax,eax
 004C3ECC    push        ebp
 004C3ECD    push        4C40B0
 004C3ED2    push        dword ptr fs:[eax]
 004C3ED5    mov         dword ptr fs:[eax],esp
 004C3ED8    push        6
 004C3EDA    mov         cl,byte ptr [ebp-6]
 004C3EDD    mov         dl,byte ptr [ebp-5]
 004C3EE0    mov         eax,dword ptr [ebp-4]
 004C3EE3    call        004C6030
 004C3EE8    test        al,al
>004C3EEA    je          004C4076
 004C3EF0    xor         eax,eax
 004C3EF2    mov         dword ptr [ebp-18],eax
 004C3EF5    xor         eax,eax
 004C3EF7    mov         dword ptr [ebp-1C],eax
 004C3EFA    lea         eax,[ebp-124]
 004C3F00    push        eax
 004C3F01    mov         cl,byte ptr [ebp-6]
 004C3F04    mov         dl,byte ptr [ebp-5]
 004C3F07    mov         eax,dword ptr [ebp-4]
 004C3F0A    call        004BED2C
 004C3F0F    lea         edx,[ebp-124]
 004C3F15    lea         eax,[ebp-24]
 004C3F18    call        @LStrFromString
 004C3F1D    mov         eax,dword ptr [ebp-24]
 004C3F20    call        StrToFloat
 004C3F25    fdiv        dword ptr ds:[4C40C0];2:Single
 004C3F2B    fstp        tbyte ptr [ebp-10]
 004C3F2E    wait
 004C3F2F    mov         eax,dword ptr [ebp-4]
 004C3F32    call        004BEA58
 004C3F37    and         eax,0FF
 004C3F3C    test        eax,eax
>004C3F3E    jle         004C3FF0
 004C3F44    mov         dword ptr [ebp-20],eax
 004C3F47    mov         dword ptr [ebp-14],1
 004C3F4E    xor         eax,eax
 004C3F50    push        ebp
 004C3F51    push        4C3FC7
 004C3F56    push        dword ptr fs:[eax]
 004C3F59    mov         dword ptr fs:[eax],esp
 004C3F5C    mov         eax,dword ptr [ebp-14]
 004C3F5F    cmp         eax,0FF
>004C3F64    jbe         004C3F6B
 004C3F66    call        @BoundErr
 004C3F6B    push        eax
 004C3F6C    lea         eax,[ebp-124]
 004C3F72    push        eax
 004C3F73    mov         cl,byte ptr [ebp-6]
 004C3F76    mov         dl,byte ptr [ebp-5]
 004C3F79    mov         eax,dword ptr [ebp-4]
 004C3F7C    call        004BEF5C
 004C3F81    lea         edx,[ebp-124]
 004C3F87    lea         eax,[ebp-128]
 004C3F8D    call        @LStrFromString
 004C3F92    mov         eax,dword ptr [ebp-128]
 004C3F98    call        StrToFloat
 004C3F9D    fld         tbyte ptr [ebp-10]
 004C3FA0    fcompp
 004C3FA2    fnstsw      al
 004C3FA4    sahf
>004C3FA5    jbe         004C3FB2
 004C3FA7    add         dword ptr [ebp-1C],1
>004C3FAB    jno         004C3FB2
 004C3FAD    call        @IntOver
 004C3FB2    add         dword ptr [ebp-18],1
>004C3FB6    jno         004C3FBD
 004C3FB8    call        @IntOver
 004C3FBD    xor         eax,eax
 004C3FBF    pop         edx
 004C3FC0    pop         ecx
 004C3FC1    pop         ecx
 004C3FC2    mov         dword ptr fs:[eax],edx
>004C3FC5    jmp         004C3FE4
>004C3FC7    jmp         @HandleOnException
 004C3FCC    dd          1
 004C3FD0    dd          00409B50;EConvertError
 004C3FD4    dd          004C3FD8
 004C3FD8    call        @DoneExcept
>004C3FDD    jmp         004C3FE4
 004C3FDF    call        @DoneExcept
 004C3FE4    inc         dword ptr [ebp-14]
 004C3FE7    dec         dword ptr [ebp-20]
>004C3FEA    jne         004C3F4E
 004C3FF0    cmp         dword ptr [ebp-18],0
>004C3FF4    jle         004C4048
 004C3FF6    fild        dword ptr [ebp-1C]
 004C3FF9    fild        dword ptr [ebp-18]
 004C3FFC    fdivp       st(1),st
 004C3FFE    fmul        dword ptr ds:[4C40C4];100:Single
 004C4004    add         esp,0FFFFFFF4
 004C4007    fstp        tbyte ptr [esp]
 004C400A    wait
 004C400B    lea         eax,[ebp-12C]
 004C4011    push        eax
 004C4012    mov         ecx,2
 004C4017    mov         edx,12
 004C401C    mov         al,2
 004C401E    call        FloatToStrF
 004C4023    lea         eax,[ebp-12C]
 004C4029    mov         edx,4C40D0;' %'
 004C402E    call        @LStrCat
 004C4033    mov         edx,dword ptr [ebp-12C]
 004C4039    mov         eax,dword ptr [ebp+8]
 004C403C    mov         ecx,0FF
 004C4041    call        @LStrToString
>004C4046    jmp         004C404E
 004C4048    mov         eax,dword ptr [ebp+8]
 004C404B    mov         byte ptr [eax],0
 004C404E    push        0D
 004C4050    mov         eax,dword ptr [ebp+8]
 004C4053    push        eax
 004C4054    mov         cl,byte ptr [ebp-6]
 004C4057    mov         dl,byte ptr [ebp-5]
 004C405A    mov         eax,dword ptr [ebp-4]
 004C405D    call        004C5E04
 004C4062    push        6
 004C4064    push        0
 004C4066    mov         cl,byte ptr [ebp-6]
 004C4069    mov         dl,byte ptr [ebp-5]
 004C406C    mov         eax,dword ptr [ebp-4]
 004C406F    call        004C5FF8
>004C4074    jmp         004C408A
 004C4076    push        0D
 004C4078    mov         eax,dword ptr [ebp+8]
 004C407B    push        eax
 004C407C    mov         cl,byte ptr [ebp-6]
 004C407F    mov         dl,byte ptr [ebp-5]
 004C4082    mov         eax,dword ptr [ebp-4]
 004C4085    call        004C5F08
 004C408A    xor         eax,eax
 004C408C    pop         edx
 004C408D    pop         ecx
 004C408E    pop         ecx
 004C408F    mov         dword ptr fs:[eax],edx
 004C4092    push        4C40B7
 004C4097    lea         eax,[ebp-12C]
 004C409D    mov         edx,2
 004C40A2    call        @LStrArrayClr
 004C40A7    lea         eax,[ebp-24]
 004C40AA    call        @LStrClr
 004C40AF    ret
>004C40B0    jmp         @HandleFinally
>004C40B5    jmp         004C4097
 004C40B7    pop         edi
 004C40B8    pop         esi
 004C40B9    pop         ebx
 004C40BA    mov         esp,ebp
 004C40BC    pop         ebp
 004C40BD    ret         4
//end;*}

//004C40D4
{*////procedure sub_004C40D4(?:dword; ?:?; ?:Single; ?:?);
begin
 004C40D4    push        ebp
 004C40D5    mov         ebp,esp
 004C40D7    add         esp,0FFFFFEDC
 004C40DD    push        ebx
 004C40DE    push        esi
 004C40DF    push        edi
 004C40E0    xor         ebx,ebx
 004C40E2    mov         dword ptr [ebp-124],ebx
 004C40E8    mov         dword ptr [ebp-20],ebx
 004C40EB    mov         byte ptr [ebp-6],cl
 004C40EE    mov         byte ptr [ebp-5],dl
 004C40F1    mov         dword ptr [ebp-4],eax
 004C40F4    xor         eax,eax
 004C40F6    push        ebp
 004C40F7    push        4C42C3
 004C40FC    push        dword ptr fs:[eax]
 004C40FF    mov         dword ptr fs:[eax],esp
 004C4102    push        4
 004C4104    mov         cl,byte ptr [ebp-6]
 004C4107    mov         dl,byte ptr [ebp-5]
 004C410A    mov         eax,dword ptr [ebp-4]
 004C410D    call        004C6030
 004C4112    test        al,al
>004C4114    je          004C428E
 004C411A    xor         eax,eax
 004C411C    mov         dword ptr [ebp-10],eax
 004C411F    mov         dword ptr [ebp-0C],eax
 004C4122    mov         word ptr [ebp-8],ax
 004C4126    xor         eax,eax
 004C4128    mov         dword ptr [ebp-18],eax
 004C412B    mov         eax,dword ptr [ebp-4]
 004C412E    call        004BEA58
 004C4133    and         eax,0FF
 004C4138    test        eax,eax
>004C413A    jle         004C41DA
 004C4140    mov         dword ptr [ebp-1C],eax
 004C4143    mov         dword ptr [ebp-14],1
 004C414A    xor         eax,eax
 004C414C    push        ebp
 004C414D    push        4C41B1
 004C4152    push        dword ptr fs:[eax]
 004C4155    mov         dword ptr fs:[eax],esp
 004C4158    mov         eax,dword ptr [ebp-14]
 004C415B    cmp         eax,0FF
>004C4160    jbe         004C4167
 004C4162    call        @BoundErr
 004C4167    push        eax
 004C4168    lea         eax,[ebp-120]
 004C416E    push        eax
 004C416F    mov         cl,byte ptr [ebp-6]
 004C4172    mov         dl,byte ptr [ebp-5]
 004C4175    mov         eax,dword ptr [ebp-4]
 004C4178    call        004BEF5C
 004C417D    lea         edx,[ebp-120]
 004C4183    lea         eax,[ebp-20]
 004C4186    call        @LStrFromString
 004C418B    mov         eax,dword ptr [ebp-20]
 004C418E    call        StrToFloat
 004C4193    fld         tbyte ptr [ebp-10]
 004C4196    faddp       st(1),st
 004C4198    fstp        tbyte ptr [ebp-10]
 004C419B    wait
 004C419C    add         dword ptr [ebp-18],1
>004C41A0    jno         004C41A7
 004C41A2    call        @IntOver
 004C41A7    xor         eax,eax
 004C41A9    pop         edx
 004C41AA    pop         ecx
 004C41AB    pop         ecx
 004C41AC    mov         dword ptr fs:[eax],edx
>004C41AF    jmp         004C41CE
>004C41B1    jmp         @HandleOnException
 004C41B6    dd          1
 004C41BA    dd          00409B50;EConvertError
 004C41BE    dd          004C41C2
 004C41C2    call        @DoneExcept
>004C41C7    jmp         004C41CE
 004C41C9    call        @DoneExcept
 004C41CE    inc         dword ptr [ebp-14]
 004C41D1    dec         dword ptr [ebp-1C]
>004C41D4    jne         004C414A
 004C41DA    xor         eax,eax
 004C41DC    push        ebp
 004C41DD    push        4C423A
 004C41E2    push        dword ptr fs:[eax]
 004C41E5    mov         dword ptr fs:[eax],esp
 004C41E8    cmp         dword ptr [ebp-18],0
>004C41EC    jle         004C422A
 004C41EE    fild        dword ptr [ebp-18]
 004C41F1    fld         tbyte ptr [ebp-10]
 004C41F4    fdivrp      st(1),st
 004C41F6    add         esp,0FFFFFFF4
 004C41F9    fstp        tbyte ptr [esp]
 004C41FC    wait
 004C41FD    lea         eax,[ebp-124]
 004C4203    push        eax
 004C4204    mov         ecx,2
 004C4209    mov         edx,12
 004C420E    mov         al,2
 004C4210    call        FloatToStrF
 004C4215    mov         edx,dword ptr [ebp-124]
 004C421B    mov         eax,dword ptr [ebp+8]
 004C421E    mov         ecx,0FF
 004C4223    call        @LStrToString
>004C4228    jmp         004C4230
 004C422A    mov         eax,dword ptr [ebp+8]
 004C422D    mov         byte ptr [eax],0
 004C4230    xor         eax,eax
 004C4232    pop         edx
 004C4233    pop         ecx
 004C4234    pop         ecx
 004C4235    mov         dword ptr fs:[eax],edx
>004C4238    jmp         004C4266
>004C423A    jmp         @HandleOnException
 004C423F    dd          2
 004C4243    dd          00409B50;EConvertError
 004C4247    dd          004C4253
 004C424B    dd          004098E0;EMathError
 004C424F    dd          004C425B
 004C4253    mov         eax,dword ptr [ebp+8]
 004C4256    mov         byte ptr [eax],0
>004C4259    jmp         004C4261
 004C425B    mov         eax,dword ptr [ebp+8]
 004C425E    mov         byte ptr [eax],0
 004C4261    call        @DoneExcept
 004C4266    push        0B
 004C4268    mov         eax,dword ptr [ebp+8]
 004C426B    push        eax
 004C426C    mov         cl,byte ptr [ebp-6]
 004C426F    mov         dl,byte ptr [ebp-5]
 004C4272    mov         eax,dword ptr [ebp-4]
 004C4275    call        004C5E04
 004C427A    push        4
 004C427C    push        0
 004C427E    mov         cl,byte ptr [ebp-6]
 004C4281    mov         dl,byte ptr [ebp-5]
 004C4284    mov         eax,dword ptr [ebp-4]
 004C4287    call        004C5FF8
>004C428C    jmp         004C42A2
 004C428E    push        0B
 004C4290    mov         eax,dword ptr [ebp+8]
 004C4293    push        eax
 004C4294    mov         cl,byte ptr [ebp-6]
 004C4297    mov         dl,byte ptr [ebp-5]
 004C429A    mov         eax,dword ptr [ebp-4]
 004C429D    call        004C5F08
 004C42A2    xor         eax,eax
 004C42A4    pop         edx
 004C42A5    pop         ecx
 004C42A6    pop         ecx
 004C42A7    mov         dword ptr fs:[eax],edx
 004C42AA    push        4C42CA
 004C42AF    lea         eax,[ebp-124]
 004C42B5    call        @LStrClr
 004C42BA    lea         eax,[ebp-20]
 004C42BD    call        @LStrClr
 004C42C2    ret
>004C42C3    jmp         @HandleFinally
>004C42C8    jmp         004C42AF
 004C42CA    pop         edi
 004C42CB    pop         esi
 004C42CC    pop         ebx
 004C42CD    mov         esp,ebp
 004C42CF    pop         ebp
 004C42D0    ret         4
//end;*}

//004C42D4
{*////procedure sub_004C42D4(?:dword; ?:?; ?:?; ?:?);
begin
 004C42D4    push        ebp
 004C42D5    mov         ebp,esp
 004C42D7    add         esp,0FFFFFEBC
 004C42DD    push        ebx
 004C42DE    push        esi
 004C42DF    push        edi
 004C42E0    xor         ebx,ebx
 004C42E2    mov         dword ptr [ebp-144],ebx
 004C42E8    mov         dword ptr [ebp-40],ebx
 004C42EB    mov         byte ptr [ebp-6],cl
 004C42EE    mov         byte ptr [ebp-5],dl
 004C42F1    mov         dword ptr [ebp-4],eax
 004C42F4    xor         eax,eax
 004C42F6    push        ebp
 004C42F7    push        4C450C
 004C42FC    push        dword ptr fs:[eax]
 004C42FF    mov         dword ptr fs:[eax],esp
 004C4302    push        3
 004C4304    mov         cl,byte ptr [ebp-6]
 004C4307    mov         dl,byte ptr [ebp-5]
 004C430A    mov         eax,dword ptr [ebp-4]
 004C430D    call        004C6030
 004C4312    test        al,al
>004C4314    je          004C44D7
 004C431A    xor         eax,eax
 004C431C    mov         dword ptr [ebp-20],eax
 004C431F    mov         dword ptr [ebp-1C],eax
 004C4322    mov         word ptr [ebp-18],ax
 004C4326    xor         eax,eax
 004C4328    mov         dword ptr [ebp-30],eax
 004C432B    mov         dword ptr [ebp-2C],eax
 004C432E    mov         word ptr [ebp-28],ax
 004C4332    xor         eax,eax
 004C4334    mov         dword ptr [ebp-38],eax
 004C4337    mov         eax,dword ptr [ebp-4]
 004C433A    call        004BEA58
 004C433F    and         eax,0FF
 004C4344    test        eax,eax
>004C4346    jle         004C440D
 004C434C    mov         dword ptr [ebp-3C],eax
 004C434F    mov         dword ptr [ebp-34],1
 004C4356    xor         eax,eax
 004C4358    push        ebp
 004C4359    push        4C43D5
 004C435E    push        dword ptr fs:[eax]
 004C4361    mov         dword ptr fs:[eax],esp
 004C4364    mov         eax,dword ptr [ebp-34]
 004C4367    cmp         eax,0FF
>004C436C    jbe         004C4373
 004C436E    call        @BoundErr
 004C4373    push        eax
 004C4374    lea         eax,[ebp-140]
 004C437A    push        eax
 004C437B    mov         cl,byte ptr [ebp-6]
 004C437E    mov         dl,byte ptr [ebp-5]
 004C4381    mov         eax,dword ptr [ebp-4]
 004C4384    call        004BEF5C
 004C4389    lea         edx,[ebp-140]
 004C438F    lea         eax,[ebp-40]
 004C4392    call        @LStrFromString
 004C4397    mov         eax,dword ptr [ebp-40]
 004C439A    call        StrToFloat
 004C439F    fstp        tbyte ptr [ebp-10]
 004C43A2    wait
 004C43A3    fld         tbyte ptr [ebp-20]
 004C43A6    fld         tbyte ptr [ebp-10]
 004C43A9    faddp       st(1),st
 004C43AB    fstp        tbyte ptr [ebp-20]
 004C43AE    wait
 004C43AF    fld         tbyte ptr [ebp-10]
 004C43B2    fld         tbyte ptr [ebp-10]
 004C43B5    fmulp       st(1),st
 004C43B7    fld         tbyte ptr [ebp-30]
 004C43BA    faddp       st(1),st
 004C43BC    fstp        tbyte ptr [ebp-30]
 004C43BF    wait
 004C43C0    add         dword ptr [ebp-38],1
>004C43C4    jno         004C43CB
 004C43C6    call        @IntOver
 004C43CB    xor         eax,eax
 004C43CD    pop         edx
 004C43CE    pop         ecx
 004C43CF    pop         ecx
 004C43D0    mov         dword ptr fs:[eax],edx
>004C43D3    jmp         004C4401
>004C43D5    jmp         @HandleOnException
 004C43DA    dd          2
 004C43DE    dd          00409B50;EConvertError
 004C43E2    dd          004C43EE
 004C43E6    dd          004098E0;EMathError
 004C43EA    dd          004C43F5
 004C43EE    call        @DoneExcept
>004C43F3    jmp         004C4401
 004C43F5    call        @DoneExcept
>004C43FA    jmp         004C4401
 004C43FC    call        @DoneExcept
 004C4401    inc         dword ptr [ebp-34]
 004C4404    dec         dword ptr [ebp-3C]
>004C4407    jne         004C4356
 004C440D    xor         eax,eax
 004C440F    push        ebp
 004C4410    push        4C4483
 004C4415    push        dword ptr fs:[eax]
 004C4418    mov         dword ptr fs:[eax],esp
 004C441B    cmp         dword ptr [ebp-38],0
>004C441F    jle         004C4473
 004C4421    fild        dword ptr [ebp-38]
 004C4424    fld         tbyte ptr [ebp-30]
 004C4427    fdivrp      st(1),st
 004C4429    fild        dword ptr [ebp-38]
 004C442C    fld         tbyte ptr [ebp-20]
 004C442F    fdivrp      st(1),st
 004C4431    fild        dword ptr [ebp-38]
 004C4434    fld         tbyte ptr [ebp-20]
 004C4437    fdivrp      st(1),st
 004C4439    fmulp       st(1),st
 004C443B    fsubp       st(1),st
 004C443D    fsqrt
 004C443F    add         esp,0FFFFFFF4
 004C4442    fstp        tbyte ptr [esp]
 004C4445    wait
 004C4446    lea         eax,[ebp-144]
 004C444C    push        eax
 004C444D    mov         ecx,2
 004C4452    mov         edx,12
 004C4457    mov         al,2
 004C4459    call        FloatToStrF
 004C445E    mov         edx,dword ptr [ebp-144]
 004C4464    mov         eax,dword ptr [ebp+8]
 004C4467    mov         ecx,0FF
 004C446C    call        @LStrToString
>004C4471    jmp         004C4479
 004C4473    mov         eax,dword ptr [ebp+8]
 004C4476    mov         byte ptr [eax],0
 004C4479    xor         eax,eax
 004C447B    pop         edx
 004C447C    pop         ecx
 004C447D    pop         ecx
 004C447E    mov         dword ptr fs:[eax],edx
>004C4481    jmp         004C44AF
>004C4483    jmp         @HandleOnException
 004C4488    dd          2
 004C448C    dd          00409B50;EConvertError
 004C4490    dd          004C449C
 004C4494    dd          004098E0;EMathError
 004C4498    dd          004C44A4
 004C449C    mov         eax,dword ptr [ebp+8]
 004C449F    mov         byte ptr [eax],0
>004C44A2    jmp         004C44AA
 004C44A4    mov         eax,dword ptr [ebp+8]
 004C44A7    mov         byte ptr [eax],0
 004C44AA    call        @DoneExcept
 004C44AF    push        0A
 004C44B1    mov         eax,dword ptr [ebp+8]
 004C44B4    push        eax
 004C44B5    mov         cl,byte ptr [ebp-6]
 004C44B8    mov         dl,byte ptr [ebp-5]
 004C44BB    mov         eax,dword ptr [ebp-4]
 004C44BE    call        004C5E04
 004C44C3    push        3
 004C44C5    push        0
 004C44C7    mov         cl,byte ptr [ebp-6]
 004C44CA    mov         dl,byte ptr [ebp-5]
 004C44CD    mov         eax,dword ptr [ebp-4]
 004C44D0    call        004C5FF8
>004C44D5    jmp         004C44EB
 004C44D7    push        0A
 004C44D9    mov         eax,dword ptr [ebp+8]
 004C44DC    push        eax
 004C44DD    mov         cl,byte ptr [ebp-6]
 004C44E0    mov         dl,byte ptr [ebp-5]
 004C44E3    mov         eax,dword ptr [ebp-4]
 004C44E6    call        004C5F08
 004C44EB    xor         eax,eax
 004C44ED    pop         edx
 004C44EE    pop         ecx
 004C44EF    pop         ecx
 004C44F0    mov         dword ptr fs:[eax],edx
 004C44F3    push        4C4513
 004C44F8    lea         eax,[ebp-144]
 004C44FE    call        @LStrClr
 004C4503    lea         eax,[ebp-40]
 004C4506    call        @LStrClr
 004C450B    ret
>004C450C    jmp         @HandleFinally
>004C4511    jmp         004C44F8
 004C4513    pop         edi
 004C4514    pop         esi
 004C4515    pop         ebx
 004C4516    mov         esp,ebp
 004C4518    pop         ebp
 004C4519    ret         4
//end;*}

//004C451C
{*////procedure sub_004C451C(?:dword; ?:?; ?:?; ?:?);
begin
 004C451C    push        ebp
 004C451D    mov         ebp,esp
 004C451F    add         esp,0FFFFFED4
 004C4525    push        ebx
 004C4526    push        esi
 004C4527    push        edi
 004C4528    xor         ebx,ebx
 004C452A    mov         dword ptr [ebp-12C],ebx
 004C4530    mov         dword ptr [ebp-128],ebx
 004C4536    mov         dword ptr [ebp-24],ebx
 004C4539    mov         byte ptr [ebp-6],cl
 004C453C    mov         byte ptr [ebp-5],dl
 004C453F    mov         dword ptr [ebp-4],eax
 004C4542    xor         eax,eax
 004C4544    push        ebp
 004C4545    push        4C4756
 004C454A    push        dword ptr fs:[eax]
 004C454D    mov         dword ptr fs:[eax],esp
 004C4550    push        7
 004C4552    mov         cl,byte ptr [ebp-6]
 004C4555    mov         dl,byte ptr [ebp-5]
 004C4558    mov         eax,dword ptr [ebp-4]
 004C455B    call        004C6030
 004C4560    test        al,al
>004C4562    je          004C471C
 004C4568    xor         eax,eax
 004C456A    mov         dword ptr [ebp-18],eax
 004C456D    xor         eax,eax
 004C456F    mov         dword ptr [ebp-1C],eax
 004C4572    xor         eax,eax
 004C4574    push        ebp
 004C4575    push        4C46D8
 004C457A    push        dword ptr fs:[eax]
 004C457D    mov         dword ptr fs:[eax],esp
 004C4580    lea         eax,[ebp-124]
 004C4586    push        eax
 004C4587    mov         cl,byte ptr [ebp-6]
 004C458A    mov         dl,byte ptr [ebp-5]
 004C458D    mov         eax,dword ptr [ebp-4]
 004C4590    call        004C40D4
 004C4595    lea         edx,[ebp-124]
 004C459B    lea         eax,[ebp-24]
 004C459E    call        @LStrFromString
 004C45A3    mov         eax,dword ptr [ebp-24]
 004C45A6    call        StrToFloat
 004C45AB    fstp        tbyte ptr [ebp-10]
 004C45AE    wait
 004C45AF    mov         eax,dword ptr [ebp-4]
 004C45B2    call        004BEA58
 004C45B7    and         eax,0FF
 004C45BC    test        eax,eax
>004C45BE    jle         004C4670
 004C45C4    mov         dword ptr [ebp-20],eax
 004C45C7    mov         dword ptr [ebp-14],1
 004C45CE    xor         eax,eax
 004C45D0    push        ebp
 004C45D1    push        4C4647
 004C45D6    push        dword ptr fs:[eax]
 004C45D9    mov         dword ptr fs:[eax],esp
 004C45DC    mov         eax,dword ptr [ebp-14]
 004C45DF    cmp         eax,0FF
>004C45E4    jbe         004C45EB
 004C45E6    call        @BoundErr
 004C45EB    push        eax
 004C45EC    lea         eax,[ebp-124]
 004C45F2    push        eax
 004C45F3    mov         cl,byte ptr [ebp-6]
 004C45F6    mov         dl,byte ptr [ebp-5]
 004C45F9    mov         eax,dword ptr [ebp-4]
 004C45FC    call        004BEF5C
 004C4601    lea         edx,[ebp-124]
 004C4607    lea         eax,[ebp-128]
 004C460D    call        @LStrFromString
 004C4612    mov         eax,dword ptr [ebp-128]
 004C4618    call        StrToFloat
 004C461D    fld         tbyte ptr [ebp-10]
 004C4620    fcompp
 004C4622    fnstsw      al
 004C4624    sahf
>004C4625    jbe         004C4632
 004C4627    add         dword ptr [ebp-1C],1
>004C462B    jno         004C4632
 004C462D    call        @IntOver
 004C4632    add         dword ptr [ebp-18],1
>004C4636    jno         004C463D
 004C4638    call        @IntOver
 004C463D    xor         eax,eax
 004C463F    pop         edx
 004C4640    pop         ecx
 004C4641    pop         ecx
 004C4642    mov         dword ptr fs:[eax],edx
>004C4645    jmp         004C4664
>004C4647    jmp         @HandleOnException
 004C464C    dd          1
 004C4650    dd          00409B50;EConvertError
 004C4654    dd          004C4658
 004C4658    call        @DoneExcept
>004C465D    jmp         004C4664
 004C465F    call        @DoneExcept
 004C4664    inc         dword ptr [ebp-14]
 004C4667    dec         dword ptr [ebp-20]
>004C466A    jne         004C45CE
 004C4670    cmp         dword ptr [ebp-18],0
>004C4674    jle         004C46C8
 004C4676    fild        dword ptr [ebp-1C]
 004C4679    fild        dword ptr [ebp-18]
 004C467C    fdivp       st(1),st
 004C467E    fmul        dword ptr ds:[4C4768];100:Single
 004C4684    add         esp,0FFFFFFF4
 004C4687    fstp        tbyte ptr [esp]
 004C468A    wait
 004C468B    lea         eax,[ebp-12C]
 004C4691    push        eax
 004C4692    mov         ecx,2
 004C4697    mov         edx,12
 004C469C    mov         al,2
 004C469E    call        FloatToStrF
 004C46A3    lea         eax,[ebp-12C]
 004C46A9    mov         edx,4C4774;' %'
 004C46AE    call        @LStrCat
 004C46B3    mov         edx,dword ptr [ebp-12C]
 004C46B9    mov         eax,dword ptr [ebp+8]
 004C46BC    mov         ecx,0FF
 004C46C1    call        @LStrToString
>004C46C6    jmp         004C46CE
 004C46C8    mov         eax,dword ptr [ebp+8]
 004C46CB    mov         byte ptr [eax],0
 004C46CE    xor         eax,eax
 004C46D0    pop         edx
 004C46D1    pop         ecx
 004C46D2    pop         ecx
 004C46D3    mov         dword ptr fs:[eax],edx
>004C46D6    jmp         004C46F4
>004C46D8    jmp         @HandleOnException
 004C46DD    dd          1
 004C46E1    dd          00409B50;EConvertError
 004C46E5    dd          004C46E9
 004C46E9    mov         eax,dword ptr [ebp+8]
 004C46EC    mov         byte ptr [eax],0
 004C46EF    call        @DoneExcept
 004C46F4    push        0E
 004C46F6    mov         eax,dword ptr [ebp+8]
 004C46F9    push        eax
 004C46FA    mov         cl,byte ptr [ebp-6]
 004C46FD    mov         dl,byte ptr [ebp-5]
 004C4700    mov         eax,dword ptr [ebp-4]
 004C4703    call        004C5E04
 004C4708    push        7
 004C470A    push        0
 004C470C    mov         cl,byte ptr [ebp-6]
 004C470F    mov         dl,byte ptr [ebp-5]
 004C4712    mov         eax,dword ptr [ebp-4]
 004C4715    call        004C5FF8
>004C471A    jmp         004C4730
 004C471C    push        0E
 004C471E    mov         eax,dword ptr [ebp+8]
 004C4721    push        eax
 004C4722    mov         cl,byte ptr [ebp-6]
 004C4725    mov         dl,byte ptr [ebp-5]
 004C4728    mov         eax,dword ptr [ebp-4]
 004C472B    call        004C5F08
 004C4730    xor         eax,eax
 004C4732    pop         edx
 004C4733    pop         ecx
 004C4734    pop         ecx
 004C4735    mov         dword ptr fs:[eax],edx
 004C4738    push        4C475D
 004C473D    lea         eax,[ebp-12C]
 004C4743    mov         edx,2
 004C4748    call        @LStrArrayClr
 004C474D    lea         eax,[ebp-24]
 004C4750    call        @LStrClr
 004C4755    ret
>004C4756    jmp         @HandleFinally
>004C475B    jmp         004C473D
 004C475D    pop         edi
 004C475E    pop         esi
 004C475F    pop         ebx
 004C4760    mov         esp,ebp
 004C4762    pop         ebp
 004C4763    ret         4
//end;*}

//004C4778
{*function sub_004C4778(?:dword):?;
begin
 004C4778    mov         eax,dword ptr [eax+918]
 004C477E    call        004B6EA8
 004C4783    ret
//end;*}

//004C4784
////procedure sub_004C4784(?:dword);
//begin
{*
 004C4784    mov         eax,dword ptr [eax+918]
 004C478A    call        004B6E84
 004C478F    ret
*}
//end;

//004C4790
{*function sub_004C4790(?:dword):?;
begin
 004C4790    push        ebx
 004C4791    push        esi
 004C4792    push        edi
 004C4793    push        ebp
 004C4794    mov         edi,eax
 004C4796    xor         ebp,ebp
 004C4798    mov         eax,edi
 004C479A    call        004BE9E0
 004C479F    xor         ebx,ebx
 004C47A1    mov         bl,al
 004C47A3    test        ebx,ebx
>004C47A5    jle         004C47D4
 004C47A7    mov         esi,1
 004C47AC    mov         edx,esi
 004C47AE    cmp         edx,0FF
>004C47B4    jbe         004C47BB
 004C47B6    call        @BoundErr
 004C47BB    mov         eax,edi
 004C47BD    call        004BEAD0
 004C47C2    and         eax,0FF
 004C47C7    add         ebp,eax
>004C47C9    jno         004C47D0
 004C47CB    call        @IntOver
 004C47D0    inc         esi
 004C47D1    dec         ebx
>004C47D2    jne         004C47AC
 004C47D4    mov         eax,ebp
 004C47D6    cmp         eax,0FF
>004C47DB    jbe         004C47E2
 004C47DD    call        @BoundErr
 004C47E2    pop         ebp
 004C47E3    pop         edi
 004C47E4    pop         esi
 004C47E5    pop         ebx
 004C47E6    ret
//end;*}

//004C47E8
{*////procedure sub_004C47E8(?:dword; ?:?; ?:?);
begin
 004C47E8    push        ebp
 004C47E9    mov         ebp,esp
 004C47EB    add         esp,0FFFFFDFC
 004C47F1    push        ebx
 004C47F2    push        esi
 004C47F3    push        edi
 004C47F4    mov         esi,dword ptr [ebp+8]
 004C47F7    lea         edi,[ebp-103]
 004C47FD    push        ecx
 004C47FE    xor         ecx,ecx
 004C4800    mov         cl,byte ptr [esi]
 004C4802    inc         ecx
 004C4803    rep movs    byte ptr [edi],byte ptr [esi]
 004C4805    pop         ecx
 004C4806    mov         byte ptr [ebp-2],cl
 004C4809    mov         byte ptr [ebp-1],dl
 004C480C    mov         esi,eax
 004C480E    lea         eax,[ebp-204]
 004C4814    push        eax
 004C4815    mov         cl,byte ptr [ebp-2]
 004C4818    mov         dl,byte ptr [ebp-1]
 004C481B    mov         eax,esi
 004C481D    call        004BED7C
 004C4822    lea         eax,[ebp-204]
 004C4828    lea         edx,[ebp-103]
 004C482E    xor         ecx,ecx
 004C4830    mov         cl,byte ptr [eax]
 004C4832    inc         ecx
 004C4833    call        @AStrCmp
>004C4838    je          004C4861
 004C483A    mov         eax,esi
 004C483C    call        004BEA58
 004C4841    mov         ebx,eax
 004C4843    test        bl,bl
>004C4845    jbe         004C4861
 004C4847    mov         byte ptr [ebp-3],1
 004C484B    push        1
 004C484D    mov         cl,byte ptr [ebp-3]
 004C4850    mov         dl,byte ptr [ebp-1]
 004C4853    mov         eax,esi
 004C4855    call        004C61E4
 004C485A    inc         byte ptr [ebp-3]
 004C485D    dec         bl
>004C485F    jne         004C484B
 004C4861    mov         eax,esi
 004C4863    call        004BEA58
 004C4868    and         eax,0FF
 004C486D    mov         edx,dword ptr ds:[615B2C];^gvar_006178FC
 004C4873    movzx       edx,byte ptr [edx]
 004C4876    add         eax,edx
>004C4878    jno         004C487F
 004C487A    call        @IntOver
 004C487F    cmp         eax,0FF
>004C4884    jbe         004C488B
 004C4886    call        @BoundErr
 004C488B    push        eax
 004C488C    lea         eax,[ebp-103]
 004C4892    push        eax
 004C4893    mov         cl,byte ptr [ebp-2]
 004C4896    mov         dl,byte ptr [ebp-1]
 004C4899    mov         eax,esi
 004C489B    call        004C0C88
 004C48A0    mov         cl,1
 004C48A2    mov         dl,byte ptr [ebp-1]
 004C48A5    mov         eax,dword ptr [esi+918]
 004C48AB    call        004B6E84
 004C48B0    pop         edi
 004C48B1    pop         esi
 004C48B2    pop         ebx
 004C48B3    mov         esp,ebp
 004C48B5    pop         ebp
 004C48B6    ret         4
//end;*}

//004C48BC
{*////procedure sub_004C48BC(?:dword; ?:dword; ?:?);
begin
 004C48BC    push        ebp
 004C48BD    mov         ebp,esp
 004C48BF    add         esp,0FFFFFDFC
 004C48C5    push        ebx
 004C48C6    push        esi
 004C48C7    push        edi
 004C48C8    mov         esi,dword ptr [ebp+8]
 004C48CB    lea         edi,[ebp-103]
 004C48D1    push        ecx
 004C48D2    xor         ecx,ecx
 004C48D4    mov         cl,byte ptr [esi]
 004C48D6    inc         ecx
 004C48D7    rep movs    byte ptr [edi],byte ptr [esi]
 004C48D9    pop         ecx
 004C48DA    mov         byte ptr [ebp-2],cl
 004C48DD    mov         byte ptr [ebp-1],dl
 004C48E0    mov         esi,eax
 004C48E2    lea         eax,[ebp-204]
 004C48E8    push        eax
 004C48E9    mov         cl,byte ptr [ebp-2]
 004C48EC    mov         dl,byte ptr [ebp-1]
 004C48EF    mov         eax,esi
 004C48F1    call        004BED2C
 004C48F6    lea         eax,[ebp-204]
 004C48FC    lea         edx,[ebp-103]
 004C4902    xor         ecx,ecx
 004C4904    mov         cl,byte ptr [eax]
 004C4906    inc         ecx
 004C4907    call        @AStrCmp
>004C490C    je          004C4935
 004C490E    mov         eax,esi
 004C4910    call        004BEA58
 004C4915    mov         ebx,eax
 004C4917    test        bl,bl
>004C4919    jbe         004C4935
 004C491B    mov         byte ptr [ebp-3],1
 004C491F    push        1
 004C4921    mov         cl,byte ptr [ebp-3]
 004C4924    mov         dl,byte ptr [ebp-1]
 004C4927    mov         eax,esi
 004C4929    call        004C61E4
 004C492E    inc         byte ptr [ebp-3]
 004C4931    dec         bl
>004C4933    jne         004C491F
 004C4935    mov         eax,esi
 004C4937    call        004BEA58
 004C493C    and         eax,0FF
 004C4941    mov         edx,dword ptr ds:[615B30];^gvar_006178FB
 004C4947    movzx       edx,byte ptr [edx]
 004C494A    add         eax,edx
>004C494C    jno         004C4953
 004C494E    call        @IntOver
 004C4953    cmp         eax,0FF
>004C4958    jbe         004C495F
 004C495A    call        @BoundErr
 004C495F    push        eax
 004C4960    lea         eax,[ebp-103]
 004C4966    push        eax
 004C4967    mov         cl,byte ptr [ebp-2]
 004C496A    mov         dl,byte ptr [ebp-1]
 004C496D    mov         eax,esi
 004C496F    call        004C0C88
 004C4974    mov         cl,1
 004C4976    mov         dl,byte ptr [ebp-1]
 004C4979    mov         eax,dword ptr [esi+918]
 004C497F    call        004B6E84
 004C4984    pop         edi
 004C4985    pop         esi
 004C4986    pop         ebx
 004C4987    mov         esp,ebp
 004C4989    pop         ebp
 004C498A    ret         4
//end;*}

//004C4990
{*////procedure sub_004C4990(?:dword; ?:?; ?:?);
begin
 004C4990    push        ebp
 004C4991    mov         ebp,esp
 004C4993    add         esp,0FFFFFFEC
 004C4996    push        ebx
 004C4997    push        esi
 004C4998    push        edi
 004C4999    xor         ebx,ebx
 004C499B    mov         dword ptr [ebp-14],ebx
 004C499E    mov         byte ptr [ebp-1],cl
 004C49A1    mov         ebx,edx
 004C49A3    mov         esi,eax
 004C49A5    xor         eax,eax
 004C49A7    push        ebp
 004C49A8    push        4C4B06
 004C49AD    push        dword ptr fs:[eax]
 004C49B0    mov         dword ptr fs:[eax],esp
 004C49B3    mov         dl,1
 004C49B5    mov         eax,[004120B8];TStringList
 004C49BA    call        TObject.Create;TStringList.Create
 004C49BF    mov         dword ptr [ebp-8],eax
 004C49C2    xor         ecx,ecx
 004C49C4    mov         cl,byte ptr [ebp-1]
 004C49C7    add         ecx,1
>004C49CA    jno         004C49D1
 004C49CC    call        @IntOver
 004C49D1    cmp         ecx,0FF
>004C49D7    jbe         004C49DE
 004C49D9    call        @BoundErr
 004C49DE    mov         edx,ebx
 004C49E0    mov         eax,esi
 004C49E2    call        004BEB40
 004C49E7    mov         edx,eax
 004C49E9    mov         eax,dword ptr [ebp-8]
 004C49EC    mov         ecx,dword ptr [eax]
 004C49EE    call        dword ptr [ecx+3C];TStrings.AddStrings
 004C49F1    xor         eax,eax
 004C49F3    mov         dword ptr [ebp-0C],eax
 004C49F6    xor         eax,eax
 004C49F8    mov         al,bl
 004C49FA    sub         eax,1
>004C49FD    jno         004C4A04
 004C49FF    call        @IntOver
 004C4A04    test        eax,eax
>004C4A06    jle         004C4A42
 004C4A08    mov         dword ptr [ebp-10],eax
 004C4A0B    mov         ebx,1
 004C4A10    lea         ecx,[ebp-14]
 004C4A13    mov         edx,ebx
 004C4A15    sub         edx,1
>004C4A18    jno         004C4A1F
 004C4A1A    call        @IntOver
 004C4A1F    mov         eax,dword ptr [esi+920]
 004C4A25    mov         edi,dword ptr [eax]
 004C4A27    call        dword ptr [edi+0C]
 004C4A2A    mov         eax,dword ptr [ebp-14]
 004C4A2D    call        StrToInt
 004C4A32    add         dword ptr [ebp-0C],eax
>004C4A35    jno         004C4A3C
 004C4A37    call        @IntOver
 004C4A3C    inc         ebx
 004C4A3D    dec         dword ptr [ebp-10]
>004C4A40    jne         004C4A10
 004C4A42    mov         edx,dword ptr [ebp-0C]
 004C4A45    sub         edx,1
>004C4A48    jno         004C4A4F
 004C4A4A    call        @IntOver
 004C4A4F    movzx       edi,byte ptr [ebp-1]
 004C4A53    add         edx,edi
>004C4A55    jno         004C4A5C
 004C4A57    call        @IntOver
 004C4A5C    mov         ebx,dword ptr [esi+924]
 004C4A62    mov         eax,ebx
 004C4A64    call        TStringGrid.GetCols
 004C4A69    mov         ecx,eax
 004C4A6B    mov         edx,edi
 004C4A6D    add         edx,dword ptr [ebp-0C]
>004C4A70    jno         004C4A77
 004C4A72    call        @IntOver
 004C4A77    mov         eax,ebx
 004C4A79    call        TStringGrid.SetCols
 004C4A7E    mov         edx,dword ptr [ebp-0C]
 004C4A81    sub         edx,1
>004C4A84    jno         004C4A8B
 004C4A86    call        @IntOver
 004C4A8B    xor         eax,eax
 004C4A8D    mov         al,byte ptr [ebp-1]
 004C4A90    add         edx,eax
>004C4A92    jno         004C4A99
 004C4A94    call        @IntOver
 004C4A99    mov         ecx,dword ptr [ebp-8]
 004C4A9C    mov         eax,dword ptr [esi+924]
 004C4AA2    call        TStringGrid.SetCols
 004C4AA7    mov         dl,1
 004C4AA9    mov         eax,dword ptr [ebp-8]
 004C4AAC    mov         ecx,dword ptr [eax]
 004C4AAE    call        dword ptr [ecx-4];TStringList.Destroy
 004C4AB1    mov         byte ptr [esi+8],1
 004C4AB5    mov         eax,dword ptr [esi+940]
 004C4ABB    mov         edx,dword ptr [eax]
 004C4ABD    call        dword ptr [edx+40]
 004C4AC0    mov         eax,esi
 004C4AC2    call        004C4790
 004C4AC7    and         eax,0FF
 004C4ACC    test        eax,eax
>004C4ACE    jle         004C4AF0
 004C4AD0    mov         dword ptr [ebp-10],eax
 004C4AD3    mov         ebx,0E
 004C4AD8    mov         edx,4C4B1C;'1'
 004C4ADD    mov         eax,dword ptr [esi+940]
 004C4AE3    mov         ecx,dword ptr [eax]
 004C4AE5    call        dword ptr [ecx+34]
 004C4AE8    dec         ebx
>004C4AE9    jne         004C4AD8
 004C4AEB    dec         dword ptr [ebp-10]
>004C4AEE    jne         004C4AD3
 004C4AF0    xor         eax,eax
 004C4AF2    pop         edx
 004C4AF3    pop         ecx
 004C4AF4    pop         ecx
 004C4AF5    mov         dword ptr fs:[eax],edx
 004C4AF8    push        4C4B0D
 004C4AFD    lea         eax,[ebp-14]
 004C4B00    call        @LStrClr
 004C4B05    ret
>004C4B06    jmp         @HandleFinally
>004C4B0B    jmp         004C4AFD
 004C4B0D    pop         edi
 004C4B0E    pop         esi
 004C4B0F    pop         ebx
 004C4B10    mov         esp,ebp
 004C4B12    pop         ebp
 004C4B13    ret
//end;*}

//004C4B20
{*////procedure sub_004C4B20(?:dword; ?:?; ?:?);
begin
 004C4B20    push        ebp
 004C4B21    mov         ebp,esp
 004C4B23    add         esp,0FFFFFFEC
 004C4B26    push        ebx
 004C4B27    push        esi
 004C4B28    push        edi
 004C4B29    xor         ebx,ebx
 004C4B2B    mov         dword ptr [ebp-14],ebx
 004C4B2E    mov         byte ptr [ebp-1],cl
 004C4B31    mov         ebx,edx
 004C4B33    mov         esi,eax
 004C4B35    xor         eax,eax
 004C4B37    push        ebp
 004C4B38    push        4C4CA0
 004C4B3D    push        dword ptr fs:[eax]
 004C4B40    mov         dword ptr fs:[eax],esp
 004C4B43    mov         dl,1
 004C4B45    mov         eax,[004120B8];TStringList
 004C4B4A    call        TObject.Create;TStringList.Create
 004C4B4F    mov         dword ptr [ebp-8],eax
 004C4B52    xor         ecx,ecx
 004C4B54    mov         cl,byte ptr [ebp-1]
 004C4B57    sub         ecx,1
>004C4B5A    jno         004C4B61
 004C4B5C    call        @IntOver
 004C4B61    cmp         ecx,0FF
>004C4B67    jbe         004C4B6E
 004C4B69    call        @BoundErr
 004C4B6E    mov         edx,ebx
 004C4B70    mov         eax,esi
 004C4B72    call        004BEB40
 004C4B77    mov         edx,eax
 004C4B79    mov         eax,dword ptr [ebp-8]
 004C4B7C    mov         ecx,dword ptr [eax]
 004C4B7E    call        dword ptr [ecx+3C];TStrings.AddStrings
 004C4B81    xor         eax,eax
 004C4B83    mov         dword ptr [ebp-0C],eax
 004C4B86    xor         eax,eax
 004C4B88    mov         al,bl
 004C4B8A    sub         eax,1
>004C4B8D    jno         004C4B94
 004C4B8F    call        @IntOver
 004C4B94    test        eax,eax
>004C4B96    jle         004C4BD2
 004C4B98    mov         dword ptr [ebp-10],eax
 004C4B9B    mov         ebx,1
 004C4BA0    lea         ecx,[ebp-14]
 004C4BA3    mov         edx,ebx
 004C4BA5    sub         edx,1
>004C4BA8    jno         004C4BAF
 004C4BAA    call        @IntOver
 004C4BAF    mov         eax,dword ptr [esi+920]
 004C4BB5    mov         edi,dword ptr [eax]
 004C4BB7    call        dword ptr [edi+0C]
 004C4BBA    mov         eax,dword ptr [ebp-14]
 004C4BBD    call        StrToInt
 004C4BC2    add         dword ptr [ebp-0C],eax
>004C4BC5    jno         004C4BCC
 004C4BC7    call        @IntOver
 004C4BCC    inc         ebx
 004C4BCD    dec         dword ptr [ebp-10]
>004C4BD0    jne         004C4BA0
 004C4BD2    mov         edx,dword ptr [ebp-0C]
 004C4BD5    sub         edx,1
>004C4BD8    jno         004C4BDF
 004C4BDA    call        @IntOver
 004C4BDF    movzx       edi,byte ptr [ebp-1]
 004C4BE3    add         edx,edi
>004C4BE5    jno         004C4BEC
 004C4BE7    call        @IntOver
 004C4BEC    mov         ebx,dword ptr [esi+924]
 004C4BF2    mov         eax,ebx
 004C4BF4    call        TStringGrid.GetCols
 004C4BF9    mov         ecx,eax
 004C4BFB    mov         edx,dword ptr [ebp-0C]
 004C4BFE    sub         edx,2
>004C4C01    jno         004C4C08
 004C4C03    call        @IntOver
 004C4C08    add         edx,edi
>004C4C0A    jno         004C4C11
 004C4C0C    call        @IntOver
 004C4C11    mov         eax,ebx
 004C4C13    call        TStringGrid.SetCols
 004C4C18    mov         edx,dword ptr [ebp-0C]
 004C4C1B    sub         edx,1
>004C4C1E    jno         004C4C25
 004C4C20    call        @IntOver
 004C4C25    xor         eax,eax
 004C4C27    mov         al,byte ptr [ebp-1]
 004C4C2A    add         edx,eax
>004C4C2C    jno         004C4C33
 004C4C2E    call        @IntOver
 004C4C33    mov         ecx,dword ptr [ebp-8]
 004C4C36    mov         eax,dword ptr [esi+924]
 004C4C3C    call        TStringGrid.SetCols
 004C4C41    mov         dl,1
 004C4C43    mov         eax,dword ptr [ebp-8]
 004C4C46    mov         ecx,dword ptr [eax]
 004C4C48    call        dword ptr [ecx-4];TStringList.Destroy
 004C4C4B    mov         byte ptr [esi+8],1
 004C4C4F    mov         eax,dword ptr [esi+940]
 004C4C55    mov         edx,dword ptr [eax]
 004C4C57    call        dword ptr [edx+40]
 004C4C5A    mov         eax,esi
 004C4C5C    call        004C4790
 004C4C61    and         eax,0FF
 004C4C66    test        eax,eax
>004C4C68    jle         004C4C8A
 004C4C6A    mov         dword ptr [ebp-10],eax
 004C4C6D    mov         ebx,0E
 004C4C72    mov         edx,4C4CB8;'1'
 004C4C77    mov         eax,dword ptr [esi+940]
 004C4C7D    mov         ecx,dword ptr [eax]
 004C4C7F    call        dword ptr [ecx+34]
 004C4C82    dec         ebx
>004C4C83    jne         004C4C72
 004C4C85    dec         dword ptr [ebp-10]
>004C4C88    jne         004C4C6D
 004C4C8A    xor         eax,eax
 004C4C8C    pop         edx
 004C4C8D    pop         ecx
 004C4C8E    pop         ecx
 004C4C8F    mov         dword ptr fs:[eax],edx
 004C4C92    push        4C4CA7
 004C4C97    lea         eax,[ebp-14]
 004C4C9A    call        @LStrClr
 004C4C9F    ret
>004C4CA0    jmp         @HandleFinally
>004C4CA5    jmp         004C4C97
 004C4CA7    pop         edi
 004C4CA8    pop         esi
 004C4CA9    pop         ebx
 004C4CAA    mov         esp,ebp
 004C4CAC    pop         ebp
 004C4CAD    ret
//end;*}

//004C4CBC
////procedure sub_004C4CBC(?:TFichierCdn);
//begin
{*
 004C4CBC    mov         eax,dword ptr [eax+918]
 004C4CC2    call        004B6D84
 004C4CC7    ret
*}
//end;

//004C4CC8
////procedure sub_004C4CC8(?:TFichierCdn; ?:PShortString);
//begin
{*
 004C4CC8    push        ebp
 004C4CC9    mov         ebp,esp
 004C4CCB    add         esp,0FFFFFEFC
 004C4CD1    push        ebx
 004C4CD2    push        esi
 004C4CD3    push        edi
 004C4CD4    xor         ecx,ecx
 004C4CD6    mov         dword ptr [ebp-104],ecx
 004C4CDC    mov         esi,edx
 004C4CDE    lea         edi,[ebp-100]
 004C4CE4    xor         ecx,ecx
 004C4CE6    mov         cl,byte ptr [esi]
 004C4CE8    inc         ecx
 004C4CE9    rep movs    byte ptr [edi],byte ptr [esi]
 004C4CEB    mov         ebx,eax
 004C4CED    xor         eax,eax
 004C4CEF    push        ebp
 004C4CF0    push        4C4D36
 004C4CF5    push        dword ptr fs:[eax]
 004C4CF8    mov         dword ptr fs:[eax],esp
 004C4CFB    lea         eax,[ebp-104]
 004C4D01    lea         edx,[ebp-100]
 004C4D07    call        @LStrFromString
 004C4D0C    mov         edx,dword ptr [ebp-104]
 004C4D12    mov         eax,dword ptr [ebx+918]
 004C4D18    call        004B6D38
 004C4D1D    xor         eax,eax
 004C4D1F    pop         edx
 004C4D20    pop         ecx
 004C4D21    pop         ecx
 004C4D22    mov         dword ptr fs:[eax],edx
 004C4D25    push        4C4D3D
 004C4D2A    lea         eax,[ebp-104]
 004C4D30    call        @LStrClr
 004C4D35    ret
>004C4D36    jmp         @HandleFinally
>004C4D3B    jmp         004C4D2A
 004C4D3D    pop         edi
 004C4D3E    pop         esi
 004C4D3F    pop         ebx
 004C4D40    mov         esp,ebp
 004C4D42    pop         ebp
 004C4D43    ret
*}
//end;

//004C4D44
{*function sub_004C4D44(?:?):?;
begin
 004C4D44    mov         al,byte ptr [eax+910]
 004C4D4A    ret
//end;*}

//004C5078
{*function sub_004C5078(?:dword; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 004C5078    push        ebp
 004C5079    mov         ebp,esp
 004C507B    add         esp,0FFFFFEA8
 004C5081    push        ebx
 004C5082    push        esi
 004C5083    push        edi
 004C5084    xor         ebx,ebx
 004C5086    mov         dword ptr [ebp-158],ebx
 004C508C    mov         dword ptr [ebp-150],ebx
 004C5092    mov         dword ptr [ebp-154],ebx
 004C5098    mov         dword ptr [ebp-148],ebx
 004C509E    mov         dword ptr [ebp-14C],ebx
 004C50A4    mov         dword ptr [ebp-24],ebx
 004C50A7    mov         byte ptr [ebp-9],cl
 004C50AA    mov         dword ptr [ebp-8],edx
 004C50AD    mov         dword ptr [ebp-4],eax
 004C50B0    xor         eax,eax
 004C50B2    push        ebp
 004C50B3    push        4C53A0
 004C50B8    push        dword ptr fs:[eax]
 004C50BB    mov         dword ptr fs:[eax],esp
 004C50BE    xor         ecx,ecx
 004C50C0    mov         dl,1
 004C50C2    mov         eax,[004B8694];TQSort
 004C50C7    call        TComponent.Create;TQSort.Create
 004C50CC    mov         dword ptr [ebp-1C],eax
 004C50CF    mov         eax,dword ptr [ebp-1C]
 004C50D2    mov         edx,dword ptr [ebp-4]
 004C50D5    mov         dword ptr [eax+2C],edx;TQSort.?f2C:dword
 004C50D8    mov         dword ptr [eax+28],4C4D4C;TQSort.Compare:TCompareEvent
 004C50DF    mov         eax,dword ptr [ebp-1C]
 004C50E2    mov         edx,dword ptr [ebp-4]
 004C50E5    mov         dword ptr [eax+34],edx;TQSort.?f34:dword
 004C50E8    mov         dword ptr [eax+30],4C4FA0;TQSort.Swap:TSwapEvent
 004C50EF    mov         dl,1
 004C50F1    mov         eax,[004120B8];TStringList
 004C50F6    call        TObject.Create;TStringList.Create
 004C50FB    mov         esi,eax
 004C50FD    mov         dl,1
 004C50FF    mov         eax,[004120B8];TStringList
 004C5104    call        TObject.Create;TStringList.Create
 004C5109    mov         dword ptr [ebp-18],eax
 004C510C    mov         eax,dword ptr [ebp-4]
 004C510F    call        004BE9E0
 004C5114    xor         edx,edx
 004C5116    mov         dl,al
 004C5118    cmp         edx,0FF
>004C511E    jbe         004C5125
 004C5120    call        @BoundErr
 004C5125    mov         al,1
 004C5127    lea         ecx,[ebp-44]
 004C512A    mov         ah,20
 004C512C    call        @SetRange
 004C5131    mov         eax,dword ptr [ebp-8]
 004C5134    cmp         eax,0FF
>004C5139    ja          004C513F
 004C513B    bt          dword ptr [ebp-44],eax
 004C513F    setb        al
 004C5142    xor         al,1
 004C5144    mov         byte ptr [ebp-1D],al
 004C5147    mov         eax,dword ptr [ebp-4]
 004C514A    call        004BEA58
 004C514F    xor         ebx,ebx
 004C5151    mov         bl,al
 004C5153    test        ebx,ebx
>004C5155    jle         004C52B8
 004C515B    mov         dword ptr [ebp-10],1
 004C5162    cmp         byte ptr [ebp-1D],0
>004C5166    jne         004C5216
 004C516C    mov         al,byte ptr [ebp+10]
 004C516F    push        eax
 004C5170    lea         eax,[ebp-144]
 004C5176    push        eax
 004C5177    mov         ecx,dword ptr [ebp-10]
 004C517A    cmp         ecx,0FF
>004C5180    jbe         004C5187
 004C5182    call        @BoundErr
 004C5187    mov         edx,dword ptr [ebp-8]
 004C518A    cmp         edx,0FF
>004C5190    jbe         004C5197
 004C5192    call        @BoundErr
 004C5197    mov         eax,dword ptr [ebp-4]
 004C519A    call        004C2D10
 004C519F    lea         edx,[ebp-144]
 004C51A5    lea         eax,[ebp-24]
 004C51A8    call        @LStrFromString
 004C51AD    cmp         dword ptr [ebp-24],0
>004C51B1    je          004C52AE
 004C51B7    lea         ecx,[ebp-144]
 004C51BD    mov         edx,dword ptr [ebp-10]
 004C51C0    cmp         edx,0FF
>004C51C6    jbe         004C51CD
 004C51C8    call        @BoundErr
 004C51CD    mov         eax,dword ptr [ebp-4]
 004C51D0    call        004BEA64
 004C51D5    lea         edx,[ebp-144]
 004C51DB    lea         eax,[ebp-14C]
 004C51E1    call        @LStrFromString
 004C51E6    push        dword ptr [ebp-14C]
 004C51EC    push        4C53BC;' -> '
 004C51F1    push        dword ptr [ebp-24]
 004C51F4    lea         eax,[ebp-148]
 004C51FA    mov         edx,3
 004C51FF    call        @LStrCatN
 004C5204    mov         edx,dword ptr [ebp-148]
 004C520A    mov         eax,esi
 004C520C    mov         ecx,dword ptr [eax]
 004C520E    call        dword ptr [ecx+34];TStringList.Add
>004C5211    jmp         004C52AE
 004C5216    mov         al,byte ptr [ebp+0C]
 004C5219    push        eax
 004C521A    mov         al,byte ptr [ebp+8]
 004C521D    push        eax
 004C521E    lea         eax,[ebp-144]
 004C5224    push        eax
 004C5225    mov         edx,dword ptr [ebp-10]
 004C5228    cmp         edx,0FF
>004C522E    jbe         004C5235
 004C5230    call        @BoundErr
 004C5235    mov         cl,byte ptr [ebp+10]
 004C5238    mov         eax,dword ptr [ebp-4]
 004C523B    call        004C32B4
 004C5240    lea         edx,[ebp-144]
 004C5246    lea         eax,[ebp-24]
 004C5249    call        @LStrFromString
 004C524E    cmp         dword ptr [ebp-24],0
>004C5252    je          004C52AE
 004C5254    lea         ecx,[ebp-144]
 004C525A    mov         edx,dword ptr [ebp-10]
 004C525D    cmp         edx,0FF
>004C5263    jbe         004C526A
 004C5265    call        @BoundErr
 004C526A    mov         eax,dword ptr [ebp-4]
 004C526D    call        004BEA64
 004C5272    lea         edx,[ebp-144]
 004C5278    lea         eax,[ebp-154]
 004C527E    call        @LStrFromString
 004C5283    push        dword ptr [ebp-154]
 004C5289    push        4C53BC;' -> '
 004C528E    push        dword ptr [ebp-24]
 004C5291    lea         eax,[ebp-150]
 004C5297    mov         edx,3
 004C529C    call        @LStrCatN
 004C52A1    mov         edx,dword ptr [ebp-150]
 004C52A7    mov         eax,esi
 004C52A9    mov         ecx,dword ptr [eax]
 004C52AB    call        dword ptr [ecx+34];TStringList.Add
 004C52AE    inc         dword ptr [ebp-10]
 004C52B1    dec         ebx
>004C52B2    jne         004C5162
 004C52B8    mov         eax,esi
 004C52BA    mov         edx,dword ptr [eax]
 004C52BC    call        dword ptr [edx+14];TStringList.GetCount
 004C52BF    mov         ecx,eax
 004C52C1    cmp         ecx,0FFFF
>004C52C7    jbe         004C52CE
 004C52C9    call        @BoundErr
 004C52CE    mov         edx,esi
 004C52D0    mov         eax,dword ptr [ebp-1C]
 004C52D3    call        004B8B48
 004C52D8    cmp         byte ptr [ebp-9],0
>004C52DC    jne         004C52F8
 004C52DE    mov         ecx,4C53CC;'Classement ascendant'
 004C52E3    xor         edx,edx
 004C52E5    mov         eax,esi
 004C52E7    mov         ebx,dword ptr [eax]
 004C52E9    call        dword ptr [ebx+54];TStringList.Insert
 004C52EC    mov         edx,esi
 004C52EE    mov         eax,dword ptr [ebp-18]
 004C52F1    mov         ecx,dword ptr [eax]
 004C52F3    call        dword ptr [ecx+3C];TStrings.AddStrings
>004C52F6    jmp         004C5364
 004C52F8    mov         eax,esi
 004C52FA    mov         edx,dword ptr [eax]
 004C52FC    call        dword ptr [edx+14];TStringList.GetCount
 004C52FF    mov         ebx,eax
 004C5301    sub         ebx,1
>004C5304    jno         004C530B
 004C5306    call        @IntOver
 004C530B    test        ebx,ebx
>004C530D    jl          004C5355
 004C530F    inc         ebx
 004C5310    mov         dword ptr [ebp-14],0
 004C5317    mov         eax,esi
 004C5319    mov         edx,dword ptr [eax]
 004C531B    call        dword ptr [edx+14];TStringList.GetCount
 004C531E    mov         edx,eax
 004C5320    sub         edx,1
>004C5323    jno         004C532A
 004C5325    call        @IntOver
 004C532A    sub         edx,dword ptr [ebp-14]
>004C532D    jno         004C5334
 004C532F    call        @IntOver
 004C5334    lea         ecx,[ebp-158]
 004C533A    mov         eax,esi
 004C533C    mov         edi,dword ptr [eax]
 004C533E    call        dword ptr [edi+0C];TStringList.Get
 004C5341    mov         edx,dword ptr [ebp-158]
 004C5347    mov         eax,dword ptr [ebp-18]
 004C534A    mov         ecx,dword ptr [eax]
 004C534C    call        dword ptr [ecx+34];TStringList.Add
 004C534F    inc         dword ptr [ebp-14]
 004C5352    dec         ebx
>004C5353    jne         004C5317
 004C5355    mov         ecx,4C53EC;'Classement descendant'
 004C535A    xor         edx,edx
 004C535C    mov         eax,dword ptr [ebp-18]
 004C535F    mov         ebx,dword ptr [eax]
 004C5361    call        dword ptr [ebx+54];TStringList.Insert
 004C5364    mov         dl,1
 004C5366    mov         eax,esi
 004C5368    mov         ecx,dword ptr [eax]
 004C536A    call        dword ptr [ecx-4];TStringList.Destroy
 004C536D    mov         dl,1
 004C536F    mov         eax,dword ptr [ebp-1C]
 004C5372    mov         ecx,dword ptr [eax]
 004C5374    call        dword ptr [ecx-4];TComponent.Destroy
 004C5377    mov         ebx,dword ptr [ebp-18]
 004C537A    xor         eax,eax
 004C537C    pop         edx
 004C537D    pop         ecx
 004C537E    pop         ecx
 004C537F    mov         dword ptr fs:[eax],edx
 004C5382    push        4C53A7
 004C5387    lea         eax,[ebp-158]
 004C538D    mov         edx,5
 004C5392    call        @LStrArrayClr
 004C5397    lea         eax,[ebp-24]
 004C539A    call        @LStrClr
 004C539F    ret
>004C53A0    jmp         @HandleFinally
>004C53A5    jmp         004C5387
 004C53A7    mov         eax,ebx
 004C53A9    pop         edi
 004C53AA    pop         esi
 004C53AB    pop         ebx
 004C53AC    mov         esp,ebp
 004C53AE    pop         ebp
 004C53AF    ret         0C
//end;*}

//004C5E04
{*////procedure sub_004C5E04(?:?; ?:?; ?:?; ?:?);
begin
 004C5E04    push        ebp
 004C5E05    mov         ebp,esp
 004C5E07    add         esp,0FFFFFEF4
 004C5E0D    push        ebx
 004C5E0E    push        esi
 004C5E0F    push        edi
 004C5E10    xor         ebx,ebx
 004C5E12    mov         dword ptr [ebp-10C],ebx
 004C5E18    mov         esi,dword ptr [ebp+8]
 004C5E1B    lea         edi,[ebp-105]
 004C5E21    push        ecx
 004C5E22    xor         ecx,ecx
 004C5E24    mov         cl,byte ptr [esi]
 004C5E26    inc         ecx
 004C5E27    rep movs    byte ptr [edi],byte ptr [esi]
 004C5E29    pop         ecx
 004C5E2A    mov         byte ptr [ebp-5],cl
 004C5E2D    mov         dword ptr [ebp-4],eax
 004C5E30    xor         eax,eax
 004C5E32    push        ebp
 004C5E33    push        4C5EF8
 004C5E38    push        dword ptr fs:[eax]
 004C5E3B    mov         dword ptr fs:[eax],esp
 004C5E3E    xor         edi,edi
 004C5E40    xor         ebx,ebx
 004C5E42    mov         bl,dl
 004C5E44    sub         ebx,1
>004C5E47    jno         004C5E4E
 004C5E49    call        @IntOver
 004C5E4E    test        ebx,ebx
>004C5E50    jle         004C5E80
 004C5E52    mov         esi,1
 004C5E57    mov         edx,esi
 004C5E59    cmp         edx,0FF
>004C5E5F    jbe         004C5E66
 004C5E61    call        @BoundErr
 004C5E66    mov         eax,dword ptr [ebp-4]
 004C5E69    call        004BEAD0
 004C5E6E    and         eax,0FF
 004C5E73    add         edi,eax
>004C5E75    jno         004C5E7C
 004C5E77    call        @IntOver
 004C5E7C    inc         esi
 004C5E7D    dec         ebx
>004C5E7E    jne         004C5E57
 004C5E80    xor         eax,eax
 004C5E82    mov         al,byte ptr [ebp-5]
 004C5E85    add         edi,eax
>004C5E87    jno         004C5E8E
 004C5E89    call        @IntOver
 004C5E8E    lea         eax,[ebp-10C]
 004C5E94    lea         edx,[ebp-105]
 004C5E9A    call        @LStrFromString
 004C5E9F    mov         ecx,dword ptr [ebp-10C]
 004C5EA5    sub         edi,1
>004C5EA8    jno         004C5EAF
 004C5EAA    call        @IntOver
 004C5EAF    imul        edx,edi,0E
>004C5EB2    jno         004C5EB9
 004C5EB4    call        @IntOver
 004C5EB9    xor         eax,eax
 004C5EBB    mov         al,byte ptr [ebp+0C]
 004C5EBE    add         edx,eax
>004C5EC0    jno         004C5EC7
 004C5EC2    call        @IntOver
 004C5EC7    sub         edx,1
>004C5ECA    jno         004C5ED1
 004C5ECC    call        @IntOver
 004C5ED1    mov         eax,dword ptr [ebp-4]
 004C5ED4    mov         eax,dword ptr [eax+940]
 004C5EDA    mov         ebx,dword ptr [eax]
 004C5EDC    call        dword ptr [ebx+20]
 004C5EDF    xor         eax,eax
 004C5EE1    pop         edx
 004C5EE2    pop         ecx
 004C5EE3    pop         ecx
 004C5EE4    mov         dword ptr fs:[eax],edx
 004C5EE7    push        4C5EFF
 004C5EEC    lea         eax,[ebp-10C]
 004C5EF2    call        @LStrClr
 004C5EF7    ret
>004C5EF8    jmp         @HandleFinally
>004C5EFD    jmp         004C5EEC
 004C5EFF    pop         edi
 004C5F00    pop         esi
 004C5F01    pop         ebx
 004C5F02    mov         esp,ebp
 004C5F04    pop         ebp
 004C5F05    ret         8
//end;*}

//004C5F08
{*////procedure sub_004C5F08(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004C5F08    push        ebp
 004C5F09    mov         ebp,esp
 004C5F0B    add         esp,0FFFFFFF4
 004C5F0E    push        ebx
 004C5F0F    push        esi
 004C5F10    push        edi
 004C5F11    xor         ebx,ebx
 004C5F13    mov         dword ptr [ebp-0C],ebx
 004C5F16    mov         ebx,ecx
 004C5F18    mov         dword ptr [ebp-4],eax
 004C5F1B    xor         eax,eax
 004C5F1D    push        ebp
 004C5F1E    push        4C5FE7
 004C5F23    push        dword ptr fs:[eax]
 004C5F26    mov         dword ptr fs:[eax],esp
 004C5F29    xor         eax,eax
 004C5F2B    mov         dword ptr [ebp-8],eax
 004C5F2E    mov         edi,edx
 004C5F30    and         edi,0FF
 004C5F36    sub         edi,1
>004C5F39    jno         004C5F40
 004C5F3B    call        @IntOver
 004C5F40    test        edi,edi
>004C5F42    jle         004C5F73
 004C5F44    mov         esi,1
 004C5F49    mov         edx,esi
 004C5F4B    cmp         edx,0FF
>004C5F51    jbe         004C5F58
 004C5F53    call        @BoundErr
 004C5F58    mov         eax,dword ptr [ebp-4]
 004C5F5B    call        004BEAD0
 004C5F60    and         eax,0FF
 004C5F65    add         dword ptr [ebp-8],eax
>004C5F68    jno         004C5F6F
 004C5F6A    call        @IntOver
 004C5F6F    inc         esi
 004C5F70    dec         edi
>004C5F71    jne         004C5F49
 004C5F73    xor         eax,eax
 004C5F75    mov         al,bl
 004C5F77    add         dword ptr [ebp-8],eax
>004C5F7A    jno         004C5F81
 004C5F7C    call        @IntOver
 004C5F81    mov         eax,dword ptr [ebp-8]
 004C5F84    sub         eax,1
>004C5F87    jno         004C5F8E
 004C5F89    call        @IntOver
 004C5F8E    imul        edx,eax,0E
>004C5F91    jno         004C5F98
 004C5F93    call        @IntOver
 004C5F98    xor         eax,eax
 004C5F9A    mov         al,byte ptr [ebp+0C]
 004C5F9D    add         edx,eax
>004C5F9F    jno         004C5FA6
 004C5FA1    call        @IntOver
 004C5FA6    sub         edx,1
>004C5FA9    jno         004C5FB0
 004C5FAB    call        @IntOver
 004C5FB0    lea         ecx,[ebp-0C]
 004C5FB3    mov         eax,dword ptr [ebp-4]
 004C5FB6    mov         eax,dword ptr [eax+940]
 004C5FBC    mov         ebx,dword ptr [eax]
 004C5FBE    call        dword ptr [ebx+0C]
 004C5FC1    mov         edx,dword ptr [ebp-0C]
 004C5FC4    mov         eax,dword ptr [ebp+8]
 004C5FC7    mov         ecx,0FF
 004C5FCC    call        @LStrToString
 004C5FD1    xor         eax,eax
 004C5FD3    pop         edx
 004C5FD4    pop         ecx
 004C5FD5    pop         ecx
 004C5FD6    mov         dword ptr fs:[eax],edx
 004C5FD9    push        4C5FEE
 004C5FDE    lea         eax,[ebp-0C]
 004C5FE1    call        @LStrClr
 004C5FE6    ret
>004C5FE7    jmp         @HandleFinally
>004C5FEC    jmp         004C5FDE
 004C5FEE    pop         edi
 004C5FEF    pop         esi
 004C5FF0    pop         ebx
 004C5FF1    mov         esp,ebp
 004C5FF3    pop         ebp
 004C5FF4    ret         8
//end;*}

//004C5FF8
{*////procedure sub_004C5FF8(?:?; ?:?; ?:?);
begin
 004C5FF8    push        ebp
 004C5FF9    mov         ebp,esp
 004C5FFB    push        esi
 004C5FFC    mov         esi,eax
 004C5FFE    mov         eax,dword ptr [ebp+0C]
 004C6001    cmp         byte ptr [ebp+8],0
>004C6005    je          004C6016
 004C6007    push        eax
 004C6008    push        4C6028
 004C600D    mov         eax,esi
 004C600F    call        004C5E04
>004C6014    jmp         004C6023
 004C6016    push        eax
 004C6017    push        4C602C
 004C601C    mov         eax,esi
 004C601E    call        004C5E04
 004C6023    pop         esi
 004C6024    pop         ebp
 004C6025    ret         8
//end;*}

//004C6030
{*function sub_004C6030(?:?; ?:?; ?:?; ?:?):Boolean;
begin
 004C6030    push        ebp
 004C6031    mov         ebp,esp
 004C6033    add         esp,0FFFFFEFC
 004C6039    push        ebx
 004C603A    push        esi
 004C603B    mov         byte ptr [ebp-1],cl
 004C603E    mov         ebx,edx
 004C6040    mov         esi,eax
 004C6042    mov         al,byte ptr [ebp+8]
 004C6045    push        eax
 004C6046    lea         eax,[ebp-104]
 004C604C    push        eax
 004C604D    mov         cl,byte ptr [ebp-1]
 004C6050    mov         edx,ebx
 004C6052    mov         eax,esi
 004C6054    call        004C5F08
 004C6059    lea         eax,[ebp-104]
 004C605F    mov         edx,4C607C;'1'
 004C6064    xor         ecx,ecx
 004C6066    mov         cl,byte ptr [eax]
 004C6068    inc         ecx
 004C6069    call        @AStrCmp
 004C606E    sete        al
 004C6071    pop         esi
 004C6072    pop         ebx
 004C6073    mov         esp,ebp
 004C6075    pop         ebp
 004C6076    ret         4
//end;*}

//004C6080
{*////procedure sub_004C6080(?:?; ?:?; ?:?);
begin
 004C6080    push        ebp
 004C6081    mov         ebp,esp
 004C6083    add         esp,0FFFFFEF8
 004C6089    push        ebx
 004C608A    push        esi
 004C608B    push        edi
 004C608C    xor         ebx,ebx
 004C608E    mov         dword ptr [ebp-108],ebx
 004C6094    mov         esi,dword ptr [ebp+8]
 004C6097    lea         edi,[ebp-101]
 004C609D    push        ecx
 004C609E    xor         ecx,ecx
 004C60A0    mov         cl,byte ptr [esi]
 004C60A2    inc         ecx
 004C60A3    rep movs    byte ptr [edi],byte ptr [esi]
 004C60A5    pop         ecx
 004C60A6    mov         byte ptr [ebp-1],cl
 004C60A9    mov         ebx,edx
 004C60AB    mov         esi,eax
 004C60AD    xor         eax,eax
 004C60AF    push        ebp
 004C60B0    push        4C6133
 004C60B5    push        dword ptr fs:[eax]
 004C60B8    mov         dword ptr fs:[eax],esp
 004C60BB    mov         eax,esi
 004C60BD    call        004BEA58
 004C60C2    and         eax,0FF
 004C60C7    xor         edx,edx
 004C60C9    mov         dl,bl
 004C60CB    sub         edx,1
>004C60CE    jno         004C60D5
 004C60D0    call        @IntOver
 004C60D5    imul        edx
>004C60D7    jno         004C60DE
 004C60D9    call        @IntOver
 004C60DE    xor         edx,edx
 004C60E0    mov         dl,byte ptr [ebp-1]
 004C60E3    add         eax,edx
>004C60E5    jno         004C60EC
 004C60E7    call        @IntOver
 004C60EC    sub         eax,1
>004C60EF    jno         004C60F6
 004C60F1    call        @IntOver
 004C60F6    push        eax
 004C60F7    lea         eax,[ebp-108]
 004C60FD    lea         edx,[ebp-101]
 004C6103    call        @LStrFromString
 004C6108    mov         ecx,dword ptr [ebp-108]
 004C610E    mov         eax,dword ptr [esi+944]
 004C6114    pop         edx
 004C6115    mov         ebx,dword ptr [eax]
 004C6117    call        dword ptr [ebx+20]
 004C611A    xor         eax,eax
 004C611C    pop         edx
 004C611D    pop         ecx
 004C611E    pop         ecx
 004C611F    mov         dword ptr fs:[eax],edx
 004C6122    push        4C613A
 004C6127    lea         eax,[ebp-108]
 004C612D    call        @LStrClr
 004C6132    ret
>004C6133    jmp         @HandleFinally
>004C6138    jmp         004C6127
 004C613A    pop         edi
 004C613B    pop         esi
 004C613C    pop         ebx
 004C613D    mov         esp,ebp
 004C613F    pop         ebp
 004C6140    ret         4
//end;*}

//004C6144
{*////procedure sub_004C6144(?:?; ?:?; ?:?; ?:?);
begin
 004C6144    push        ebp
 004C6145    mov         ebp,esp
 004C6147    add         esp,0FFFFFFF8
 004C614A    push        ebx
 004C614B    push        esi
 004C614C    xor         ebx,ebx
 004C614E    mov         dword ptr [ebp-8],ebx
 004C6151    mov         byte ptr [ebp-1],cl
 004C6154    mov         ebx,edx
 004C6156    mov         esi,eax
 004C6158    xor         eax,eax
 004C615A    push        ebp
 004C615B    push        4C61D5
 004C6160    push        dword ptr fs:[eax]
 004C6163    mov         dword ptr fs:[eax],esp
 004C6166    mov         eax,esi
 004C6168    call        004BEA58
 004C616D    xor         edx,edx
 004C616F    mov         dl,al
 004C6171    xor         eax,eax
 004C6173    mov         al,bl
 004C6175    sub         eax,1
>004C6178    jno         004C617F
 004C617A    call        @IntOver
 004C617F    imul        edx,eax
>004C6182    jno         004C6189
 004C6184    call        @IntOver
 004C6189    xor         eax,eax
 004C618B    mov         al,byte ptr [ebp-1]
 004C618E    add         edx,eax
>004C6190    jno         004C6197
 004C6192    call        @IntOver
 004C6197    sub         edx,1
>004C619A    jno         004C61A1
 004C619C    call        @IntOver
 004C61A1    lea         ecx,[ebp-8]
 004C61A4    mov         eax,dword ptr [esi+944]
 004C61AA    mov         ebx,dword ptr [eax]
 004C61AC    call        dword ptr [ebx+0C]
 004C61AF    mov         edx,dword ptr [ebp-8]
 004C61B2    mov         eax,dword ptr [ebp+8]
 004C61B5    mov         ecx,0FF
 004C61BA    call        @LStrToString
 004C61BF    xor         eax,eax
 004C61C1    pop         edx
 004C61C2    pop         ecx
 004C61C3    pop         ecx
 004C61C4    mov         dword ptr fs:[eax],edx
 004C61C7    push        4C61DC
 004C61CC    lea         eax,[ebp-8]
 004C61CF    call        @LStrClr
 004C61D4    ret
>004C61D5    jmp         @HandleFinally
>004C61DA    jmp         004C61CC
 004C61DC    pop         esi
 004C61DD    pop         ebx
 004C61DE    pop         ecx
 004C61DF    pop         ecx
 004C61E0    pop         ebp
 004C61E1    ret         4
//end;*}

//004C61E4
{*////procedure sub_004C61E4(?:?; ?:?; ?:?; ?:?);
begin
 004C61E4    push        ebp
 004C61E5    mov         ebp,esp
 004C61E7    push        ecx
 004C61E8    push        ebx
 004C61E9    push        esi
 004C61EA    push        edi
 004C61EB    mov         byte ptr [ebp-1],cl
 004C61EE    mov         ebx,edx
 004C61F0    mov         edi,eax
 004C61F2    mov         eax,edi
 004C61F4    call        004BE9E0
 004C61F9    mov         esi,eax
 004C61FB    and         esi,0FF
 004C6201    mov         eax,edi
 004C6203    call        004BEA58
 004C6208    and         eax,0FF
 004C620D    imul        esi,eax
>004C6210    jno         004C6217
 004C6212    call        @IntOver
 004C6217    cmp         byte ptr [ebp+8],0
>004C621B    je          004C6273
 004C621D    mov         eax,edi
 004C621F    call        004BEA58
 004C6224    xor         edx,edx
 004C6226    mov         dl,al
 004C6228    xor         eax,eax
 004C622A    mov         al,bl
 004C622C    sub         eax,1
>004C622F    jno         004C6236
 004C6231    call        @IntOver
 004C6236    imul        edx,eax
>004C6239    jno         004C6240
 004C623B    call        @IntOver
 004C6240    add         edx,esi
>004C6242    jno         004C6249
 004C6244    call        @IntOver
 004C6249    xor         eax,eax
 004C624B    mov         al,byte ptr [ebp-1]
 004C624E    add         edx,eax
>004C6250    jno         004C6257
 004C6252    call        @IntOver
 004C6257    sub         edx,1
>004C625A    jno         004C6261
 004C625C    call        @IntOver
 004C6261    mov         ecx,4C62D8;'1'
 004C6266    mov         eax,dword ptr [edi+944]
 004C626C    mov         ebx,dword ptr [eax]
 004C626E    call        dword ptr [ebx+20]
>004C6271    jmp         004C62C7
 004C6273    mov         eax,edi
 004C6275    call        004BEA58
 004C627A    xor         edx,edx
 004C627C    mov         dl,al
 004C627E    xor         eax,eax
 004C6280    mov         al,bl
 004C6282    sub         eax,1
>004C6285    jno         004C628C
 004C6287    call        @IntOver
 004C628C    imul        edx,eax
>004C628F    jno         004C6296
 004C6291    call        @IntOver
 004C6296    add         edx,esi
>004C6298    jno         004C629F
 004C629A    call        @IntOver
 004C629F    xor         eax,eax
 004C62A1    mov         al,byte ptr [ebp-1]
 004C62A4    add         edx,eax
>004C62A6    jno         004C62AD
 004C62A8    call        @IntOver
 004C62AD    sub         edx,1
>004C62B0    jno         004C62B7
 004C62B2    call        @IntOver
 004C62B7    mov         ecx,4C62E4;'0'
 004C62BC    mov         eax,dword ptr [edi+944]
 004C62C2    mov         ebx,dword ptr [eax]
 004C62C4    call        dword ptr [ebx+20]
 004C62C7    pop         edi
 004C62C8    pop         esi
 004C62C9    pop         ebx
 004C62CA    pop         ecx
 004C62CB    pop         ebp
 004C62CC    ret         4
//end;*}

//004C62E8
{*function sub_004C62E8(?:?; ?:?; ?:?):?;
begin
 004C62E8    push        ebp
 004C62E9    mov         ebp,esp
 004C62EB    add         esp,0FFFFFFF8
 004C62EE    push        ebx
 004C62EF    push        esi
 004C62F0    xor         ebx,ebx
 004C62F2    mov         dword ptr [ebp-8],ebx
 004C62F5    mov         byte ptr [ebp-2],cl
 004C62F8    mov         byte ptr [ebp-1],dl
 004C62FB    mov         ebx,eax
 004C62FD    xor         eax,eax
 004C62FF    push        ebp
 004C6300    push        4C63AB
 004C6305    push        dword ptr fs:[eax]
 004C6308    mov         dword ptr fs:[eax],esp
 004C630B    mov         eax,ebx
 004C630D    call        004BE9E0
 004C6312    mov         esi,eax
 004C6314    and         esi,0FF
 004C631A    mov         eax,ebx
 004C631C    call        004BEA58
 004C6321    and         eax,0FF
 004C6326    imul        esi,eax
>004C6329    jno         004C6330
 004C632B    call        @IntOver
 004C6330    mov         eax,ebx
 004C6332    call        004BEA58
 004C6337    xor         edx,edx
 004C6339    mov         dl,al
 004C633B    xor         eax,eax
 004C633D    mov         al,byte ptr [ebp-1]
 004C6340    sub         eax,1
>004C6343    jno         004C634A
 004C6345    call        @IntOver
 004C634A    imul        edx,eax
>004C634D    jno         004C6354
 004C634F    call        @IntOver
 004C6354    add         edx,esi
>004C6356    jno         004C635D
 004C6358    call        @IntOver
 004C635D    xor         eax,eax
 004C635F    mov         al,byte ptr [ebp-2]
 004C6362    add         edx,eax
>004C6364    jno         004C636B
 004C6366    call        @IntOver
 004C636B    sub         edx,1
>004C636E    jno         004C6375
 004C6370    call        @IntOver
 004C6375    lea         ecx,[ebp-8]
 004C6378    mov         eax,dword ptr [ebx+944]
 004C637E    mov         ebx,dword ptr [eax]
 004C6380    call        dword ptr [ebx+0C]
 004C6383    mov         eax,dword ptr [ebp-8]
 004C6386    mov         edx,4C63C4;'1'
 004C638B    call        @LStrCmp
 004C6390    sete        al
 004C6393    mov         ebx,eax
 004C6395    xor         eax,eax
 004C6397    pop         edx
 004C6398    pop         ecx
 004C6399    pop         ecx
 004C639A    mov         dword ptr fs:[eax],edx
 004C639D    push        4C63B2
 004C63A2    lea         eax,[ebp-8]
 004C63A5    call        @LStrClr
 004C63AA    ret
>004C63AB    jmp         @HandleFinally
>004C63B0    jmp         004C63A2
 004C63B2    mov         eax,ebx
 004C63B4    pop         esi
 004C63B5    pop         ebx
 004C63B6    pop         ecx
 004C63B7    pop         ecx
 004C63B8    pop         ebp
 004C63B9    ret
//end;*}

//004C63C8
////procedure sub_004C63C8(?:TFichierCdn);
//begin
{*
 004C63C8    push        ebx
 004C63C9    push        esi
 004C63CA    push        edi
 004C63CB    push        ebp
 004C63CC    add         esp,0FFFFFFF8
 004C63CF    mov         ebp,eax
 004C63D1    mov         dword ptr [esp],1
 004C63D8    mov         eax,ebp
 004C63DA    call        004BE9E0
 004C63DF    and         eax,0FF
 004C63E4    test        eax,eax
>004C63E6    jle         004C6456
 004C63E8    mov         dword ptr [esp+4],eax
 004C63EC    mov         edi,1
 004C63F1    mov         edx,edi
 004C63F3    cmp         edx,0FF
>004C63F9    jbe         004C6400
 004C63FB    call        @BoundErr
 004C6400    mov         eax,ebp
 004C6402    call        004BEAD0
 004C6407    xor         ebx,ebx
 004C6409    mov         bl,al
 004C640B    test        ebx,ebx
>004C640D    jle         004C644F
 004C640F    mov         esi,1
 004C6414    mov         eax,dword ptr [esp]
 004C6417    cmp         eax,0FF
>004C641C    jbe         004C6423
 004C641E    call        @BoundErr
 004C6423    push        eax
 004C6424    push        1
 004C6426    mov         ecx,esi
 004C6428    cmp         ecx,0FF
>004C642E    jbe         004C6435
 004C6430    call        @BoundErr
 004C6435    mov         edx,edi
 004C6437    cmp         edx,0FF
>004C643D    jbe         004C6444
 004C643F    call        @BoundErr
 004C6444    mov         eax,ebp
 004C6446    call        004C5FF8
 004C644B    inc         esi
 004C644C    dec         ebx
>004C644D    jne         004C6414
 004C644F    inc         edi
 004C6450    dec         dword ptr [esp+4]
>004C6454    jne         004C63F1
 004C6456    inc         dword ptr [esp]
 004C6459    cmp         dword ptr [esp],0F
>004C645D    jne         004C63D8
 004C6463    mov         eax,ebp
 004C6465    call        004BE9E0
 004C646A    and         eax,0FF
 004C646F    test        eax,eax
>004C6471    jle         004C64C2
 004C6473    mov         dword ptr [esp+4],eax
 004C6477    mov         edi,1
 004C647C    mov         eax,ebp
 004C647E    call        004BEA58
 004C6483    xor         ebx,ebx
 004C6485    mov         bl,al
 004C6487    test        ebx,ebx
>004C6489    jle         004C64BB
 004C648B    mov         esi,1
 004C6490    push        1
 004C6492    mov         ecx,esi
 004C6494    cmp         ecx,0FF
>004C649A    jbe         004C64A1
 004C649C    call        @BoundErr
 004C64A1    mov         edx,edi
 004C64A3    cmp         edx,0FF
>004C64A9    jbe         004C64B0
 004C64AB    call        @BoundErr
 004C64B0    mov         eax,ebp
 004C64B2    call        004C61E4
 004C64B7    inc         esi
 004C64B8    dec         ebx
>004C64B9    jne         004C6490
 004C64BB    inc         edi
 004C64BC    dec         dword ptr [esp+4]
>004C64C0    jne         004C647C
 004C64C2    pop         ecx
 004C64C3    pop         edx
 004C64C4    pop         ebp
 004C64C5    pop         edi
 004C64C6    pop         esi
 004C64C7    pop         ebx
 004C64C8    ret
*}
//end;

//004C64CC
{*////procedure sub_004C64CC(?:dword; ?:ShortString; ?:?);
begin
 004C64CC    push        ebp
 004C64CD    mov         ebp,esp
 004C64CF    add         esp,0FFFFFDD4
 004C64D5    push        ebx
 004C64D6    push        esi
 004C64D7    push        edi
 004C64D8    xor         ebx,ebx
 004C64DA    mov         dword ptr [ebp-22C],ebx
 004C64E0    mov         dword ptr [ebp-128],ebx
 004C64E6    mov         esi,edx
 004C64E8    lea         edi,[ebp-124]
 004C64EE    push        ecx
 004C64EF    xor         ecx,ecx
 004C64F1    mov         cl,byte ptr [esi]
 004C64F3    inc         ecx
 004C64F4    rep movs    byte ptr [edi],byte ptr [esi]
 004C64F6    pop         ecx
 004C64F7    mov         byte ptr [ebp-5],cl
 004C64FA    mov         dword ptr [ebp-4],eax
 004C64FD    xor         eax,eax
 004C64FF    push        ebp
 004C6500    push        4C6641
 004C6505    push        dword ptr fs:[eax]
 004C6508    mov         dword ptr fs:[eax],esp
 004C650B    xor         eax,eax
 004C650D    mov         dword ptr [ebp-20],eax
 004C6510    mov         dword ptr [ebp-1C],eax
 004C6513    mov         word ptr [ebp-18],ax
 004C6517    xor         eax,eax
 004C6519    mov         dword ptr [ebp-10],eax
 004C651C    mov         eax,dword ptr [ebp-4]
 004C651F    call        004BE9E0
 004C6524    and         eax,0FF
 004C6529    test        eax,eax
>004C652B    jle         004C65D5
 004C6531    mov         dword ptr [ebp-24],eax
 004C6534    mov         dword ptr [ebp-0C],1
 004C653B    xor         eax,eax
 004C653D    push        ebp
 004C653E    push        4C65AC
 004C6543    push        dword ptr fs:[eax]
 004C6546    mov         dword ptr fs:[eax],esp
 004C6549    mov         al,byte ptr [ebp-5]
 004C654C    push        eax
 004C654D    lea         eax,[ebp-228]
 004C6553    push        eax
 004C6554    mov         ecx,dword ptr [ebp-0C]
 004C6557    cmp         ecx,0FF
>004C655D    jbe         004C6564
 004C655F    call        @BoundErr
 004C6564    lea         edx,[ebp-124]
 004C656A    mov         eax,dword ptr [ebp-4]
 004C656D    call        004C2E60
 004C6572    lea         edx,[ebp-228]
 004C6578    lea         eax,[ebp-128]
 004C657E    call        @LStrFromString
 004C6583    mov         eax,dword ptr [ebp-128]
 004C6589    call        StrToFloat
 004C658E    fld         tbyte ptr [ebp-20]
 004C6591    faddp       st(1),st
 004C6593    fstp        tbyte ptr [ebp-20]
 004C6596    wait
 004C6597    add         dword ptr [ebp-10],1
>004C659B    jno         004C65A2
 004C659D    call        @IntOver
 004C65A2    xor         eax,eax
 004C65A4    pop         edx
 004C65A5    pop         ecx
 004C65A6    pop         ecx
 004C65A7    mov         dword ptr fs:[eax],edx
>004C65AA    jmp         004C65C9
>004C65AC    jmp         @HandleOnException
 004C65B1    dd          1
 004C65B5    dd          00409B50;EConvertError
 004C65B9    dd          004C65BD
 004C65BD    call        @DoneExcept
>004C65C2    jmp         004C65C9
 004C65C4    call        @DoneExcept
 004C65C9    inc         dword ptr [ebp-0C]
 004C65CC    dec         dword ptr [ebp-24]
>004C65CF    jne         004C653B
 004C65D5    cmp         dword ptr [ebp-10],0
>004C65D9    je          004C6617
 004C65DB    fild        dword ptr [ebp-10]
 004C65DE    fld         tbyte ptr [ebp-20]
 004C65E1    fdivrp      st(1),st
 004C65E3    add         esp,0FFFFFFF4
 004C65E6    fstp        tbyte ptr [esp]
 004C65E9    wait
 004C65EA    lea         eax,[ebp-22C]
 004C65F0    push        eax
 004C65F1    mov         ecx,2
 004C65F6    mov         edx,12
 004C65FB    mov         al,2
 004C65FD    call        FloatToStrF
 004C6602    mov         edx,dword ptr [ebp-22C]
 004C6608    mov         eax,dword ptr [ebp+8]
 004C660B    mov         ecx,0FF
 004C6610    call        @LStrToString
>004C6615    jmp         004C661D
 004C6617    mov         eax,dword ptr [ebp+8]
 004C661A    mov         byte ptr [eax],0
 004C661D    xor         eax,eax
 004C661F    pop         edx
 004C6620    pop         ecx
 004C6621    pop         ecx
 004C6622    mov         dword ptr fs:[eax],edx
 004C6625    push        4C6648
 004C662A    lea         eax,[ebp-22C]
 004C6630    call        @LStrClr
 004C6635    lea         eax,[ebp-128]
 004C663B    call        @LStrClr
 004C6640    ret
>004C6641    jmp         @HandleFinally
>004C6646    jmp         004C662A
 004C6648    pop         edi
 004C6649    pop         esi
 004C664A    pop         ebx
 004C664B    mov         esp,ebp
 004C664D    pop         ebp
 004C664E    ret         4
//end;*}

//004C6654
{*function sub_004C6654(?:?):Boolean;
begin
 004C6654    push        ebx
 004C6655    mov         ebx,eax
 004C6657    lea         eax,[ebx+10]
 004C665A    mov         edx,4C6670;'Etablissement'
 004C665F    xor         ecx,ecx
 004C6661    mov         cl,byte ptr [eax]
 004C6663    inc         ecx
 004C6664    call        @AStrCmp
 004C6669    sete        al
 004C666C    pop         ebx
 004C666D    ret
//end;*}

//004C6680
//function sub_004C6680(?:dword):Boolean;
//begin
{*
 004C6680    push        ebx
 004C6681    mov         ebx,eax
 004C6683    lea         eax,[ebx+10]
 004C6686    mov         edx,4C669C;'Personnelle'
 004C668B    xor         ecx,ecx
 004C668D    mov         cl,byte ptr [eax]
 004C668F    inc         ecx
 004C6690    call        @AStrCmp
 004C6695    sete        al
 004C6698    pop         ebx
 004C6699    ret
*}
//end;

//004C66A8
{*function sub_004C66A8(?:?; ?:?; ?:?):?;
begin
 004C66A8    push        ebp
 004C66A9    mov         ebp,esp
 004C66AB    push        ecx
 004C66AC    mov         ecx,186
 004C66B1    push        0
 004C66B3    push        0
 004C66B5    dec         ecx
>004C66B6    jne         004C66B1
 004C66B8    push        ecx
 004C66B9    xchg        ecx,dword ptr [ebp-4]
 004C66BC    push        ebx
 004C66BD    push        esi
 004C66BE    push        edi
 004C66BF    mov         esi,ecx
 004C66C1    lea         edi,[ebp-107]
 004C66C7    xor         ecx,ecx
 004C66C9    mov         cl,byte ptr [esi]
 004C66CB    inc         ecx
 004C66CC    rep movs    byte ptr [edi],byte ptr [esi]
 004C66CE    mov         edi,edx
 004C66D0    mov         esi,eax
 004C66D2    xor         eax,eax
 004C66D4    push        ebp
 004C66D5    push        4C6D9C
 004C66DA    push        dword ptr fs:[eax]
 004C66DD    mov         dword ptr fs:[eax],esp
 004C66E0    lea         eax,[ebp-107]
 004C66E6    mov         edx,4C6DAC;'bêta 2'
 004C66EB    xor         ecx,ecx
 004C66ED    mov         cl,byte ptr [eax]
 004C66EF    inc         ecx
 004C66F0    call        @AStrCmp
>004C66F5    je          004C6771
 004C66F7    lea         eax,[ebp-107]
 004C66FD    mov         edx,4C6DB4;'bêta 3'
 004C6702    xor         ecx,ecx
 004C6704    mov         cl,byte ptr [eax]
 004C6706    inc         ecx
 004C6707    call        @AStrCmp
>004C670C    je          004C6771
 004C670E    lea         eax,[ebp-107]
 004C6714    mov         edx,4C6DBC;'bêta 4'
 004C6719    xor         ecx,ecx
 004C671B    mov         cl,byte ptr [eax]
 004C671D    inc         ecx
 004C671E    call        @AStrCmp
>004C6723    je          004C6771
 004C6725    lea         eax,[ebp-107]
 004C672B    mov         edx,4C6DC4;'bêta 5'
 004C6730    xor         ecx,ecx
 004C6732    mov         cl,byte ptr [eax]
 004C6734    inc         ecx
 004C6735    call        @AStrCmp
>004C673A    je          004C6771
 004C673C    lea         eax,[ebp-107]
 004C6742    mov         edx,4C6DCC;'bêta 6'
 004C6747    xor         ecx,ecx
 004C6749    mov         cl,byte ptr [eax]
 004C674B    inc         ecx
 004C674C    call        @AStrCmp
>004C6751    je          004C6771
 004C6753    lea         eax,[ebp-107]
 004C6759    mov         edx,4C6DD4;'1.0'
 004C675E    xor         ecx,ecx
 004C6760    mov         cl,byte ptr [eax]
 004C6762    inc         ecx
 004C6763    call        @AStrCmp
>004C6768    je          004C6771
 004C676A    xor         ebx,ebx
>004C676C    jmp         004C6D7E
 004C6771    xor         eax,eax
 004C6773    push        ebp
 004C6774    push        4C6D5D
 004C6779    push        dword ptr fs:[eax]
 004C677C    mov         dword ptr fs:[eax],esp
 004C677F    push        esi
 004C6780    push        edi
 004C6781    lea         edi,[esi+10]
 004C6784    mov         esi,4C6DD8
 004C6789    movs        dword ptr [edi],dword ptr [esi]
 004C678A    movs        dword ptr [edi],dword ptr [esi]
 004C678B    movs        dword ptr [edi],dword ptr [esi]
 004C678C    pop         edi
 004C678D    pop         esi
 004C678E    lea         edx,[ebp-0C08]
 004C6794    mov         eax,edi
 004C6796    call        004B696C
 004C679B    lea         edx,[ebp-0C08]
 004C67A1    lea         eax,[esi+410]
 004C67A7    call        @PStrCpy
 004C67AC    lea         edx,[ebp-0C08]
 004C67B2    mov         eax,edi
 004C67B4    call        004B696C
 004C67B9    lea         edx,[ebp-0C08]
 004C67BF    lea         eax,[esi+510]
 004C67C5    call        @PStrCpy
 004C67CA    lea         edx,[ebp-0C08]
 004C67D0    mov         eax,edi
 004C67D2    call        004B696C
 004C67D7    lea         edx,[ebp-0C08]
 004C67DD    lea         eax,[esi+610]
 004C67E3    call        @PStrCpy
 004C67E8    lea         edx,[ebp-0C08]
 004C67EE    mov         eax,edi
 004C67F0    call        004B696C
 004C67F5    lea         edx,[ebp-0C08]
 004C67FB    lea         eax,[esi+710]
 004C6801    call        @PStrCpy
 004C6806    lea         edx,[ebp-0C08]
 004C680C    mov         eax,edi
 004C680E    call        004B696C
 004C6813    lea         edx,[ebp-0C08]
 004C6819    lea         eax,[esi+810]
 004C681F    call        @PStrCpy
 004C6824    lea         edx,[ebp-0C08]
 004C682A    mov         eax,edi
 004C682C    call        004B696C
 004C6831    lea         edx,[ebp-0C08]
 004C6837    lea         eax,[ebp-0C0C]
 004C683D    call        @LStrFromString
 004C6842    mov         eax,dword ptr [ebp-0C0C]
 004C6848    call        StrToInt
 004C684D    cmp         eax,0FF
>004C6852    jbe         004C6859
 004C6854    call        @BoundErr
 004C6859    mov         byte ptr [ebp-3],al
 004C685C    mov         ebx,dword ptr [esi+924]
 004C6862    xor         edx,edx
 004C6864    mov         eax,ebx
 004C6866    call        TCustomGrid.SetFixedCols
 004C686B    xor         edx,edx
 004C686D    mov         eax,ebx
 004C686F    call        TCustomGrid.SetFixedRows
 004C6874    xor         edx,edx
 004C6876    mov         dl,byte ptr [ebp-3]
 004C6879    mov         eax,[00616030];^gvar_00617902
 004C687E    movzx       eax,byte ptr [eax]
 004C6881    add         edx,eax
>004C6883    jno         004C688A
 004C6885    call        @IntOver
 004C688A    mov         eax,ebx
 004C688C    call        TCustomGrid.SetRowCount
 004C6891    mov         edx,1
 004C6896    mov         eax,ebx
 004C6898    call        TCustomGrid.SetColCount
 004C689D    mov         dl,1
 004C689F    mov         eax,[004120B8];TStringList
 004C68A4    call        TObject.Create;TStringList.Create
 004C68A9    mov         dword ptr [esi+920],eax
 004C68AF    mov         byte ptr [ebp-1],0C
 004C68B3    mov         eax,dword ptr [esi+920]
 004C68B9    mov         edx,4C6DEC;'0'
 004C68BE    mov         ecx,dword ptr [eax]
 004C68C0    call        dword ptr [ecx+34]
 004C68C3    dec         byte ptr [ebp-1]
>004C68C6    jne         004C68B3
 004C68C8    mov         dl,1
 004C68CA    mov         eax,[004120B8];TStringList
 004C68CF    call        TObject.Create;TStringList.Create
 004C68D4    mov         dword ptr [esi+928],eax
 004C68DA    mov         dl,1
 004C68DC    mov         eax,[004120B8];TStringList
 004C68E1    call        TObject.Create;TStringList.Create
 004C68E6    mov         dword ptr [esi+92C],eax
 004C68EC    mov         dl,1
 004C68EE    mov         eax,[004120B8];TStringList
 004C68F3    call        TObject.Create;TStringList.Create
 004C68F8    mov         dword ptr [esi+930],eax
 004C68FE    mov         dl,1
 004C6900    mov         eax,[004120B8];TStringList
 004C6905    call        TObject.Create;TStringList.Create
 004C690A    mov         dword ptr [esi+938],eax
 004C6910    mov         dl,1
 004C6912    mov         eax,[004120B8];TStringList
 004C6917    call        TObject.Create;TStringList.Create
 004C691C    mov         dword ptr [esi+934],eax
 004C6922    mov         dl,1
 004C6924    mov         eax,[004120B8];TStringList
 004C6929    call        TObject.Create;TStringList.Create
 004C692E    mov         ebx,eax
 004C6930    mov         dword ptr [esi+93C],ebx
 004C6936    mov         eax,ebx
 004C6938    mov         edx,4C6DF8;'classe'
 004C693D    mov         ecx,dword ptr [eax]
 004C693F    call        dword ptr [ecx+34];TStringList.Add
 004C6942    mov         byte ptr [ebp-1],3
 004C6946    mov         bl,byte ptr [ebp-3]
 004C6949    test        bl,bl
>004C694B    jbe         004C696B
 004C694D    mov         eax,dword ptr [esi+928]
 004C6953    xor         edx,edx
 004C6955    mov         ecx,dword ptr [eax]
 004C6957    call        dword ptr [ecx+34]
 004C695A    mov         eax,dword ptr [esi+92C]
 004C6960    xor         edx,edx
 004C6962    mov         ecx,dword ptr [eax]
 004C6964    call        dword ptr [ecx+34]
 004C6967    dec         bl
>004C6969    jne         004C694D
 004C696B    dec         byte ptr [ebp-1]
>004C696E    jne         004C6946
 004C6970    mov         bl,byte ptr [ebp-3]
 004C6973    test        bl,bl
>004C6975    jbe         004C69A2
 004C6977    mov         eax,dword ptr [esi+930]
 004C697D    xor         edx,edx
 004C697F    mov         ecx,dword ptr [eax]
 004C6981    call        dword ptr [ecx+34]
 004C6984    mov         eax,dword ptr [esi+934]
 004C698A    xor         edx,edx
 004C698C    mov         ecx,dword ptr [eax]
 004C698E    call        dword ptr [ecx+34]
 004C6991    mov         eax,dword ptr [esi+938]
 004C6997    xor         edx,edx
 004C6999    mov         ecx,dword ptr [eax]
 004C699B    call        dword ptr [ecx+34]
 004C699E    dec         bl
>004C69A0    jne         004C6977
 004C69A2    mov         bl,byte ptr [ebp-3]
 004C69A5    test        bl,bl
>004C69A7    jbe         004C69DC
 004C69A9    lea         edx,[ebp-0C08]
 004C69AF    mov         eax,edi
 004C69B1    call        004B696C
 004C69B6    lea         edx,[ebp-0C08]
 004C69BC    lea         eax,[ebp-0C10]
 004C69C2    call        @LStrFromString
 004C69C7    mov         edx,dword ptr [ebp-0C10]
 004C69CD    mov         eax,dword ptr [esi+91C]
 004C69D3    call        004B7010
 004C69D8    dec         bl
>004C69DA    jne         004C69A9
 004C69DC    lea         edx,[ebp-0C08]
 004C69E2    mov         eax,edi
 004C69E4    call        004B696C
 004C69E9    lea         edx,[ebp-0C08]
 004C69EF    lea         eax,[ebp-0C14]
 004C69F5    call        @LStrFromString
 004C69FA    mov         eax,dword ptr [ebp-0C14]
 004C6A00    call        StrToInt
 004C6A05    cmp         eax,0FF
>004C6A0A    jbe         004C6A11
 004C6A0C    call        @BoundErr
 004C6A11    mov         byte ptr [ebp-5],al
 004C6A14    mov         dl,1
 004C6A16    mov         eax,[004120B8];TStringList
 004C6A1B    call        TObject.Create;TStringList.Create
 004C6A20    mov         dword ptr [esi+940],eax
 004C6A26    mov         bl,byte ptr [ebp-5]
 004C6A29    test        bl,bl
>004C6A2B    jbe         004C6A4A
 004C6A2D    mov         byte ptr [ebp-2],0E
 004C6A31    mov         eax,dword ptr [esi+940]
 004C6A37    mov         edx,4C6E08;'1'
 004C6A3C    mov         ecx,dword ptr [eax]
 004C6A3E    call        dword ptr [ecx+34]
 004C6A41    dec         byte ptr [ebp-2]
>004C6A44    jne         004C6A31
 004C6A46    dec         bl
>004C6A48    jne         004C6A2D
 004C6A4A    mov         dl,1
 004C6A4C    mov         eax,[004120B8];TStringList
 004C6A51    call        TObject.Create;TStringList.Create
 004C6A56    mov         dword ptr [esi+944],eax
 004C6A5C    mov         byte ptr [ebp-1],6
 004C6A60    mov         bl,byte ptr [ebp-3]
 004C6A63    test        bl,bl
>004C6A65    jbe         004C6A7B
 004C6A67    mov         eax,dword ptr [esi+944]
 004C6A6D    mov         edx,4C6E08;'1'
 004C6A72    mov         ecx,dword ptr [eax]
 004C6A74    call        dword ptr [ecx+34]
 004C6A77    dec         bl
>004C6A79    jne         004C6A67
 004C6A7B    dec         byte ptr [ebp-1]
>004C6A7E    jne         004C6A60
 004C6A80    mov         bl,byte ptr [ebp-5]
 004C6A83    test        bl,bl
>004C6A85    jbe         004C6D06
 004C6A8B    mov         byte ptr [ebp-6],1
 004C6A8F    lea         edx,[ebp-407]
 004C6A95    mov         eax,edi
 004C6A97    call        004B696C
 004C6A9C    lea         edx,[ebp-507]
 004C6AA2    mov         eax,edi
 004C6AA4    call        004B696C
 004C6AA9    lea         edx,[ebp-607]
 004C6AAF    mov         eax,edi
 004C6AB1    call        004B696C
 004C6AB6    lea         edx,[ebp-707]
 004C6ABC    mov         eax,edi
 004C6ABE    call        004B696C
 004C6AC3    lea         edx,[ebp-807]
 004C6AC9    mov         eax,edi
 004C6ACB    call        004B696C
 004C6AD0    lea         edx,[ebp-907]
 004C6AD6    mov         eax,edi
 004C6AD8    call        004B696C
 004C6ADD    lea         edx,[ebp-0A07]
 004C6AE3    mov         eax,edi
 004C6AE5    call        004B696C
 004C6AEA    lea         edx,[ebp-0B07]
 004C6AF0    mov         eax,edi
 004C6AF2    call        004B696C
 004C6AF7    lea         eax,[ebp-0C18]
 004C6AFD    lea         edx,[ebp-907]
 004C6B03    call        @LStrFromString
 004C6B08    mov         eax,dword ptr [ebp-0C18]
 004C6B0E    call        StrToInt
 004C6B13    sub         eax,1
>004C6B16    jb          004C6B26
>004C6B18    je          004C6B81
 004C6B1A    dec         eax
>004C6B1B    je          004C6BD9
>004C6B21    jmp         004C6C2F
 004C6B26    lea         eax,[ebp-0C20]
 004C6B2C    lea         edx,[ebp-0B07]
 004C6B32    call        @LStrFromString
 004C6B37    mov         ecx,dword ptr [ebp-0C20]
 004C6B3D    lea         eax,[ebp-0C1C]
 004C6B43    mov         edx,4C6E14;'Contrôle en classe '
 004C6B48    call        @LStrCat3
 004C6B4D    mov         edx,dword ptr [ebp-0C1C]
 004C6B53    lea         eax,[ebp-307]
 004C6B59    mov         ecx,0FF
 004C6B5E    call        @LStrToString
 004C6B63    push        esi
 004C6B64    push        edi
 004C6B65    mov         esi,4C6E28
 004C6B6A    lea         edi,[ebp-907]
 004C6B70    mov         ecx,4
 004C6B75    rep movs    dword ptr [edi],dword ptr [esi]
 004C6B77    movs        word ptr [edi],word ptr [esi]
 004C6B79    movs        byte ptr [edi],byte ptr [esi]
 004C6B7A    pop         edi
 004C6B7B    pop         esi
>004C6B7C    jmp         004C6C2F
 004C6B81    lea         eax,[ebp-0C28]
 004C6B87    lea         edx,[ebp-0B07]
 004C6B8D    call        @LStrFromString
 004C6B92    mov         ecx,dword ptr [ebp-0C28]
 004C6B98    lea         eax,[ebp-0C24]
 004C6B9E    mov         edx,4C6E44;'Test en classe '
 004C6BA3    call        @LStrCat3
 004C6BA8    mov         edx,dword ptr [ebp-0C24]
 004C6BAE    lea         eax,[ebp-307]
 004C6BB4    mov         ecx,0FF
 004C6BB9    call        @LStrToString
 004C6BBE    push        esi
 004C6BBF    push        edi
 004C6BC0    mov         esi,4C6E54
 004C6BC5    lea         edi,[ebp-907]
 004C6BCB    mov         ecx,3
 004C6BD0    rep movs    dword ptr [edi],dword ptr [esi]
 004C6BD2    movs        word ptr [edi],word ptr [esi]
 004C6BD4    movs        byte ptr [edi],byte ptr [esi]
 004C6BD5    pop         edi
 004C6BD6    pop         esi
>004C6BD7    jmp         004C6C2F
 004C6BD9    lea         eax,[ebp-0C30]
 004C6BDF    lea         edx,[ebp-0B07]
 004C6BE5    call        @LStrFromString
 004C6BEA    mov         ecx,dword ptr [ebp-0C30]
 004C6BF0    lea         eax,[ebp-0C2C]
 004C6BF6    mov         edx,4C6E6C;'Devoir à la maison '
 004C6BFB    call        @LStrCat3
 004C6C00    mov         edx,dword ptr [ebp-0C2C]
 004C6C06    lea         eax,[ebp-307]
 004C6C0C    mov         ecx,0FF
 004C6C11    call        @LStrToString
 004C6C16    push        esi
 004C6C17    push        edi
 004C6C18    mov         esi,4C6E80
 004C6C1D    lea         edi,[ebp-907]
 004C6C23    mov         ecx,4
 004C6C28    rep movs    dword ptr [edi],dword ptr [esi]
 004C6C2A    movs        word ptr [edi],word ptr [esi]
 004C6C2C    movs        byte ptr [edi],byte ptr [esi]
 004C6C2D    pop         edi
 004C6C2E    pop         esi
 004C6C2F    lea         eax,[ebp-407]
 004C6C35    push        eax
 004C6C36    lea         eax,[ebp-507]
 004C6C3C    push        eax
 004C6C3D    lea         eax,[ebp-607]
 004C6C43    push        eax
 004C6C44    lea         eax,[ebp-707]
 004C6C4A    push        eax
 004C6C4B    lea         eax,[ebp-807]
 004C6C51    push        eax
 004C6C52    lea         eax,[ebp-907]
 004C6C58    push        eax
 004C6C59    push        0
 004C6C5B    lea         eax,[ebp-0C34]
 004C6C61    lea         edx,[ebp-0A07]
 004C6C67    call        @LStrFromString
 004C6C6C    mov         eax,dword ptr [ebp-0C34]
 004C6C72    call        StrToInt
 004C6C77    mov         edx,eax
 004C6C79    cmp         edx,0FF
>004C6C7F    jbe         004C6C86
 004C6C81    call        @BoundErr
 004C6C86    lea         ecx,[ebp-307]
 004C6C8C    mov         eax,esi
 004C6C8E    call        004BF7F0
 004C6C93    mov         al,byte ptr [ebp-3]
 004C6C96    test        al,al
>004C6C98    jbe         004C6CFB
 004C6C9A    mov         byte ptr [ebp-7],al
 004C6C9D    mov         byte ptr [ebp-4],1
 004C6CA1    lea         edx,[ebp-207]
 004C6CA7    mov         eax,edi
 004C6CA9    call        004B696C
 004C6CAE    lea         eax,[ebp-207]
 004C6CB4    mov         edx,4C6E94;'-1'
 004C6CB9    xor         ecx,ecx
 004C6CBB    mov         cl,byte ptr [eax]
 004C6CBD    inc         ecx
 004C6CBE    call        @AStrCmp
>004C6CC3    je          004C6CDE
 004C6CC5    mov         al,byte ptr [ebp-4]
 004C6CC8    push        eax
 004C6CC9    lea         eax,[ebp-207]
 004C6CCF    push        eax
 004C6CD0    mov         cl,byte ptr [ebp-6]
 004C6CD3    mov         dl,1
 004C6CD5    mov         eax,esi
 004C6CD7    call        004C1074
>004C6CDC    jmp         004C6CF3
 004C6CDE    mov         al,byte ptr [ebp-4]
 004C6CE1    push        eax
 004C6CE2    push        4C6E98
 004C6CE7    mov         cl,byte ptr [ebp-6]
 004C6CEA    mov         dl,1
 004C6CEC    mov         eax,esi
 004C6CEE    call        004C1074
 004C6CF3    inc         byte ptr [ebp-4]
 004C6CF6    dec         byte ptr [ebp-7]
>004C6CF9    jne         004C6CA1
 004C6CFB    inc         byte ptr [ebp-6]
 004C6CFE    dec         bl
>004C6D00    jne         004C6A8F
 004C6D06    call        0049856C
 004C6D0B    lea         ecx,[ebp-0C38]
 004C6D11    xor         edx,edx
 004C6D13    mov         ebx,dword ptr [eax]
 004C6D15    call        dword ptr [ebx+0C]
 004C6D18    mov         edx,dword ptr [ebp-0C38]
 004C6D1E    lea         eax,[esi+310]
 004C6D24    mov         ecx,0FF
 004C6D29    call        @LStrToString
 004C6D2E    call        004B9E10
 004C6D33    mov         byte ptr [esi+910],al
 004C6D39    call        004BC298
 004C6D3E    mov         byte ptr [esi+911],al
 004C6D44    call        004BC30C
 004C6D49    mov         byte ptr [esi+912],al
 004C6D4F    mov         byte ptr [esi+8],1
 004C6D53    xor         eax,eax
 004C6D55    pop         edx
 004C6D56    pop         ecx
 004C6D57    pop         ecx
 004C6D58    mov         dword ptr fs:[eax],edx
>004C6D5B    jmp         004C6D7C
>004C6D5D    jmp         @HandleOnException
 004C6D62    dd          1
 004C6D66    dd          004094F8;Exception
 004C6D6A    dd          004C6D6E
 004C6D6E    xor         ebx,ebx
 004C6D70    call        @DoneExcept
>004C6D75    jmp         004C6D7E
 004C6D77    call        @DoneExcept
 004C6D7C    mov         bl,1
 004C6D7E    xor         eax,eax
 004C6D80    pop         edx
 004C6D81    pop         ecx
 004C6D82    pop         ecx
 004C6D83    mov         dword ptr fs:[eax],edx
 004C6D86    push        4C6DA3
 004C6D8B    lea         eax,[ebp-0C38]
 004C6D91    mov         edx,0C
 004C6D96    call        @LStrArrayClr
 004C6D9B    ret
>004C6D9C    jmp         @HandleFinally
>004C6DA1    jmp         004C6D8B
 004C6DA3    mov         eax,ebx
 004C6DA5    pop         edi
 004C6DA6    pop         esi
 004C6DA7    pop         ebx
 004C6DA8    mov         esp,ebp
 004C6DAA    pop         ebp
 004C6DAB    ret
//end;*}

//004C6DAC
//procedure 'bêta 2';
//begin
{*
 004C6DAC    push        es
 004C6DAD    ???
 004C6DAE    jmp         0600:32206174;{'bêta 3'}
//*}
//end;

//004C6DBC
////procedure 'bêta 4';
//begin
{*
 004C6DBC    push        es
 004C6DBD    ???
 004C6DBE    jmp         0600:34206174;{'bêta 5'}
//*}
//end;

//004C6DCC
////procedure 'bêta 6';
//begin
{*
 004C6DCC    push        es
 004C6DCD    ???
 004C6DCE    jmp         0300:36206174;{'1.0'}
//*}
//end;

//004C6E9C
{*////procedure sub_004C6E9C(?:?; ?:?; ?:?);
begin
 004C6E9C    push        ebp
 004C6E9D    mov         ebp,esp
 004C6E9F    push        ecx
 004C6EA0    mov         ecx,3A
 004C6EA5    push        0
 004C6EA7    push        0
 004C6EA9    dec         ecx
>004C6EAA    jne         004C6EA5
 004C6EAC    push        ecx
 004C6EAD    xchg        ecx,dword ptr [ebp-4]
 004C6EB0    push        ebx
 004C6EB1    push        esi
 004C6EB2    push        edi
 004C6EB3    mov         ebx,ecx
 004C6EB5    mov         dword ptr [ebp-8],edx
 004C6EB8    mov         dword ptr [ebp-4],eax
 004C6EBB    mov         eax,dword ptr [ebp-8]
 004C6EBE    call        @LStrAddRef
 004C6EC3    xor         eax,eax
 004C6EC5    push        ebp
 004C6EC6    push        4C81EF
 004C6ECB    push        dword ptr fs:[eax]
 004C6ECE    mov         dword ptr fs:[eax],esp
 004C6ED1    xor         edx,edx
 004C6ED3    push        ebp
 004C6ED4    push        4C81A9
 004C6ED9    push        dword ptr fs:[edx]
 004C6EDC    mov         dword ptr fs:[edx],esp
 004C6EDF    mov         eax,dword ptr [ebp-4]
 004C6EE2    add         eax,110
 004C6EE7    mov         edx,4C8200;'2.0'
 004C6EEC    xor         ecx,ecx
 004C6EEE    mov         cl,byte ptr [eax]
 004C6EF0    inc         ecx
 004C6EF1    call        @AStrCmp
>004C6EF6    je          004C6F59
 004C6EF8    mov         eax,dword ptr [ebp-4]
 004C6EFB    add         eax,110
 004C6F00    mov         edx,4C8204;'2.1'
 004C6F05    xor         ecx,ecx
 004C6F07    mov         cl,byte ptr [eax]
 004C6F09    inc         ecx
 004C6F0A    call        @AStrCmp
>004C6F0F    je          004C6F59
 004C6F11    mov         eax,dword ptr [ebp-4]
 004C6F14    add         eax,110
 004C6F19    mov         edx,4C8208;'2.2'
 004C6F1E    xor         ecx,ecx
 004C6F20    mov         cl,byte ptr [eax]
 004C6F22    inc         ecx
 004C6F23    call        @AStrCmp
>004C6F28    je          004C6F59
 004C6F2A    mov         eax,dword ptr [ebp-4]
 004C6F2D    add         eax,110
 004C6F32    mov         edx,4C820C;'2.3'
 004C6F37    xor         ecx,ecx
 004C6F39    mov         cl,byte ptr [eax]
 004C6F3B    inc         ecx
 004C6F3C    call        @AStrCmp
>004C6F41    je          004C6F59
 004C6F43    mov         ecx,4C8218;'Mauvais format'
 004C6F48    mov         dl,1
 004C6F4A    mov         eax,[004094F8];Exception
 004C6F4F    call        Exception.Create;Exception.Create
 004C6F54    call        @RaiseExcept
 004C6F59    mov         eax,dword ptr [ebp-4]
 004C6F5C    add         eax,210
 004C6F61    mov         edx,4C8228;'Carnet de notes'
 004C6F66    xor         ecx,ecx
 004C6F68    mov         cl,byte ptr [eax]
 004C6F6A    inc         ecx
 004C6F6B    call        @AStrCmp
>004C6F70    jne         004C6F82
 004C6F72    mov         eax,dword ptr [ebp-4]
 004C6F75    lea         edi,[eax+10]
 004C6F78    mov         esi,4C8238
 004C6F7D    movs        dword ptr [edi],dword ptr [esi]
 004C6F7E    movs        dword ptr [edi],dword ptr [esi]
 004C6F7F    movs        dword ptr [edi],dword ptr [esi]
>004C6F80    jmp         004C6F96
 004C6F82    mov         eax,dword ptr [ebp-4]
 004C6F85    lea         edi,[eax+10]
 004C6F88    mov         esi,4C8244
 004C6F8D    mov         ecx,3
 004C6F92    rep movs    dword ptr [edi],dword ptr [esi]
 004C6F94    movs        word ptr [edi],word ptr [esi]
 004C6F96    mov         eax,dword ptr [ebp-4]
 004C6F99    add         eax,0C
 004C6F9C    mov         edx,dword ptr [ebp-8]
 004C6F9F    call        @LStrAsg
 004C6FA4    mov         eax,dword ptr [ebp-4]
 004C6FA7    add         eax,110
 004C6FAC    mov         edx,4C8204;'2.1'
 004C6FB1    xor         ecx,ecx
 004C6FB3    mov         cl,byte ptr [eax]
 004C6FB5    inc         ecx
 004C6FB6    call        @AStrCmp
>004C6FBB    je          004C6FEF
 004C6FBD    mov         eax,dword ptr [ebp-4]
 004C6FC0    add         eax,110
 004C6FC5    mov         edx,4C8208;'2.2'
 004C6FCA    xor         ecx,ecx
 004C6FCC    mov         cl,byte ptr [eax]
 004C6FCE    inc         ecx
 004C6FCF    call        @AStrCmp
>004C6FD4    je          004C6FEF
 004C6FD6    mov         eax,dword ptr [ebp-4]
 004C6FD9    add         eax,110
 004C6FDE    mov         edx,4C820C;'2.3'
 004C6FE3    xor         ecx,ecx
 004C6FE5    mov         cl,byte ptr [eax]
 004C6FE7    inc         ecx
 004C6FE8    call        @AStrCmp
>004C6FED    jne         004C7013
 004C6FEF    lea         edx,[ebp-110]
 004C6FF5    mov         eax,dword ptr [ebp-4]
 004C6FF8    mov         eax,dword ptr [eax+4]
 004C6FFB    call        004B696C
 004C7000    lea         edx,[ebp-110]
 004C7006    mov         eax,dword ptr [ebp-4]
 004C7009    add         eax,310
 004C700E    call        @PStrCpy
 004C7013    lea         edx,[ebp-110]
 004C7019    mov         eax,dword ptr [ebp-4]
 004C701C    mov         eax,dword ptr [eax+4]
 004C701F    call        004B696C
 004C7024    lea         edx,[ebp-110]
 004C702A    mov         eax,dword ptr [ebp-4]
 004C702D    add         eax,410
 004C7032    call        @PStrCpy
 004C7037    lea         edx,[ebp-110]
 004C703D    mov         eax,dword ptr [ebp-4]
 004C7040    mov         eax,dword ptr [eax+4]
 004C7043    call        004B696C
 004C7048    lea         edx,[ebp-110]
 004C704E    mov         eax,dword ptr [ebp-4]
 004C7051    add         eax,510
 004C7056    call        @PStrCpy
 004C705B    lea         edx,[ebp-110]
 004C7061    mov         eax,dword ptr [ebp-4]
 004C7064    mov         eax,dword ptr [eax+4]
 004C7067    call        004B696C
 004C706C    lea         edx,[ebp-110]
 004C7072    mov         eax,dword ptr [ebp-4]
 004C7075    add         eax,610
 004C707A    call        @PStrCpy
 004C707F    lea         edx,[ebp-110]
 004C7085    mov         eax,dword ptr [ebp-4]
 004C7088    mov         eax,dword ptr [eax+4]
 004C708B    call        004B696C
 004C7090    lea         edx,[ebp-110]
 004C7096    mov         eax,dword ptr [ebp-4]
 004C7099    add         eax,710
 004C709E    call        @PStrCpy
 004C70A3    lea         edx,[ebp-110]
 004C70A9    mov         eax,dword ptr [ebp-4]
 004C70AC    mov         eax,dword ptr [eax+4]
 004C70AF    call        004B696C
 004C70B4    lea         edx,[ebp-110]
 004C70BA    mov         eax,dword ptr [ebp-4]
 004C70BD    add         eax,810
 004C70C2    call        @PStrCpy
 004C70C7    lea         edx,[ebp-110]
 004C70CD    mov         eax,dword ptr [ebp-4]
 004C70D0    mov         eax,dword ptr [eax+4]
 004C70D3    call        004B696C
 004C70D8    lea         edx,[ebp-110]
 004C70DE    lea         eax,[ebp-114]
 004C70E4    call        @LStrFromString
 004C70E9    mov         edx,dword ptr [ebp-114]
 004C70EF    mov         eax,dword ptr [ebp-4]
 004C70F2    mov         eax,dword ptr [eax+918]
 004C70F8    call        004B6D38
 004C70FD    lea         edx,[ebp-110]
 004C7103    mov         eax,dword ptr [ebp-4]
 004C7106    mov         eax,dword ptr [eax+4]
 004C7109    call        004B696C
 004C710E    lea         edx,[ebp-110]
 004C7114    lea         eax,[ebp-118]
 004C711A    call        @LStrFromString
 004C711F    mov         eax,dword ptr [ebp-118]
 004C7125    call        StrToInt
 004C712A    cmp         eax,0FF
>004C712F    jbe         004C7136
 004C7131    call        @BoundErr
 004C7136    mov         byte ptr [ebp-0B],al
 004C7139    mov         dl,1
 004C713B    mov         eax,[004120B8];TStringList
 004C7140    call        TObject.Create;TStringList.Create
 004C7145    mov         esi,eax
 004C7147    mov         al,byte ptr [ebp-0B]
 004C714A    test        al,al
>004C714C    jbe         004C7185
 004C714E    mov         byte ptr [ebp-0C],al
 004C7151    lea         edx,[ebp-110]
 004C7157    mov         eax,dword ptr [ebp-4]
 004C715A    mov         eax,dword ptr [eax+4]
 004C715D    call        004B696C
 004C7162    lea         edx,[ebp-110]
 004C7168    lea         eax,[ebp-11C]
 004C716E    call        @LStrFromString
 004C7173    mov         edx,dword ptr [ebp-11C]
 004C7179    mov         eax,esi
 004C717B    mov         ecx,dword ptr [eax]
 004C717D    call        dword ptr [ecx+34];TStringList.Add
 004C7180    dec         byte ptr [ebp-0C]
>004C7183    jne         004C7151
 004C7185    mov         eax,dword ptr [ebp-4]
 004C7188    mov         eax,dword ptr [eax+918]
 004C718E    mov         edx,esi
 004C7190    call        004B6D84
 004C7195    mov         eax,esi
 004C7197    call        TObject.Free
 004C719C    lea         edx,[ebp-110]
 004C71A2    mov         eax,dword ptr [ebp-4]
 004C71A5    mov         eax,dword ptr [eax+4]
 004C71A8    call        004B696C
 004C71AD    lea         edx,[ebp-110]
 004C71B3    lea         eax,[ebp-120]
 004C71B9    call        @LStrFromString
 004C71BE    mov         eax,dword ptr [ebp-120]
 004C71C4    call        StrToInt
 004C71C9    cmp         eax,0FF
>004C71CE    jbe         004C71D5
 004C71D0    call        @BoundErr
 004C71D5    mov         byte ptr [ebp-0A],al
 004C71D8    mov         al,byte ptr [ebp-0A]
 004C71DB    test        al,al
>004C71DD    jbe         004C721D
 004C71DF    mov         byte ptr [ebp-0C],al
 004C71E2    lea         edx,[ebp-110]
 004C71E8    mov         eax,dword ptr [ebp-4]
 004C71EB    mov         eax,dword ptr [eax+4]
 004C71EE    call        004B696C
 004C71F3    lea         edx,[ebp-110]
 004C71F9    lea         eax,[ebp-124]
 004C71FF    call        @LStrFromString
 004C7204    mov         edx,dword ptr [ebp-124]
 004C720A    mov         eax,dword ptr [ebp-4]
 004C720D    mov         eax,dword ptr [eax+91C]
 004C7213    call        004B7010
 004C7218    dec         byte ptr [ebp-0C]
>004C721B    jne         004C71E2
 004C721D    test        bl,bl
>004C721F    je          004C722E
 004C7221    xor         eax,eax
 004C7223    pop         edx
 004C7224    pop         ecx
 004C7225    pop         ecx
 004C7226    mov         dword ptr fs:[eax],edx
>004C7229    jmp         004C81C9
 004C722E    mov         eax,dword ptr [ebp-4]
 004C7231    mov         ebx,dword ptr [eax+924]
 004C7237    xor         edx,edx
 004C7239    mov         eax,ebx
 004C723B    call        TCustomGrid.SetFixedCols
 004C7240    xor         edx,edx
 004C7242    mov         eax,ebx
 004C7244    call        TCustomGrid.SetFixedRows
 004C7249    xor         edx,edx
 004C724B    mov         dl,byte ptr [ebp-0A]
 004C724E    mov         eax,[00616030];^gvar_00617902
 004C7253    movzx       eax,byte ptr [eax]
 004C7256    add         edx,eax
>004C7258    jno         004C725F
 004C725A    call        @IntOver
 004C725F    mov         eax,ebx
 004C7261    call        TCustomGrid.SetRowCount
 004C7266    mov         edx,1
 004C726B    mov         eax,ebx
 004C726D    call        TCustomGrid.SetColCount
 004C7272    mov         dl,1
 004C7274    mov         eax,[004120B8];TStringList
 004C7279    call        TObject.Create;TStringList.Create
 004C727E    mov         edx,dword ptr [ebp-4]
 004C7281    mov         dword ptr [edx+920],eax
 004C7287    mov         dl,1
 004C7289    mov         eax,[004120B8];TStringList
 004C728E    call        TObject.Create;TStringList.Create
 004C7293    mov         edx,dword ptr [ebp-4]
 004C7296    mov         dword ptr [edx+940],eax
 004C729C    mov         byte ptr [ebp-9],0
 004C72A0    mov         al,byte ptr [ebp-0B]
 004C72A3    test        al,al
>004C72A5    jbe         004C7667
 004C72AB    mov         byte ptr [ebp-0C],al
 004C72AE    lea         edx,[ebp-110]
 004C72B4    mov         eax,dword ptr [ebp-4]
 004C72B7    mov         eax,dword ptr [eax+4]
 004C72BA    call        004B696C
 004C72BF    lea         edx,[ebp-110]
 004C72C5    lea         eax,[ebp-128]
 004C72CB    call        @LStrFromString
 004C72D0    mov         eax,dword ptr [ebp-128]
 004C72D6    call        StrToInt
 004C72DB    mov         ebx,eax
 004C72DD    cmp         ebx,0FF
>004C72E3    jbe         004C72EA
 004C72E5    call        @BoundErr
 004C72EA    lea         edx,[ebp-12C]
 004C72F0    xor         eax,eax
 004C72F2    mov         al,bl
 004C72F4    call        IntToStr
 004C72F9    mov         edx,dword ptr [ebp-12C]
 004C72FF    mov         eax,dword ptr [ebp-4]
 004C7302    mov         eax,dword ptr [eax+920]
 004C7308    mov         ecx,dword ptr [eax]
 004C730A    call        dword ptr [ecx+34]
 004C730D    test        bl,bl
>004C730F    jbe         004C765E
 004C7315    mov         byte ptr [ebp-0D],bl
 004C7318    mov         eax,dword ptr [ebp-4]
 004C731B    mov         esi,dword ptr [eax+924]
 004C7321    mov         edx,dword ptr [esi+204]
 004C7327    add         edx,1
>004C732A    jno         004C7331
 004C732C    call        @IntOver
 004C7331    mov         eax,esi
 004C7333    call        TCustomGrid.SetColCount
 004C7338    lea         edx,[ebp-110]
 004C733E    mov         eax,dword ptr [ebp-4]
 004C7341    mov         eax,dword ptr [eax+4]
 004C7344    call        004B696C
 004C7349    lea         edx,[ebp-110]
 004C734F    lea         eax,[ebp-130]
 004C7355    call        @LStrFromString
 004C735A    mov         eax,dword ptr [ebp-130]
 004C7360    push        eax
 004C7361    xor         edx,edx
 004C7363    mov         dl,byte ptr [ebp-9]
 004C7366    xor         ecx,ecx
 004C7368    mov         eax,esi
 004C736A    call        TStringGrid.SetCells
 004C736F    mov         al,byte ptr [ebp-0A]
 004C7372    test        al,al
>004C7374    jbe         004C73BA
 004C7376    mov         byte ptr [ebp-0E],al
 004C7379    mov         bl,1
 004C737B    lea         edx,[ebp-110]
 004C7381    mov         eax,dword ptr [ebp-4]
 004C7384    mov         eax,dword ptr [eax+4]
 004C7387    call        004B696C
 004C738C    lea         edx,[ebp-110]
 004C7392    lea         eax,[ebp-134]
 004C7398    call        @LStrFromString
 004C739D    mov         eax,dword ptr [ebp-134]
 004C73A3    push        eax
 004C73A4    xor         ecx,ecx
 004C73A6    mov         cl,bl
 004C73A8    xor         edx,edx
 004C73AA    mov         dl,byte ptr [ebp-9]
 004C73AD    mov         eax,esi
 004C73AF    call        TStringGrid.SetCells
 004C73B4    inc         ebx
 004C73B5    dec         byte ptr [ebp-0E]
>004C73B8    jne         004C737B
 004C73BA    mov         bl,1
 004C73BC    lea         edx,[ebp-110]
 004C73C2    mov         eax,dword ptr [ebp-4]
 004C73C5    mov         eax,dword ptr [eax+4]
 004C73C8    call        004B696C
 004C73CD    lea         edx,[ebp-110]
 004C73D3    lea         eax,[ebp-138]
 004C73D9    call        @LStrFromString
 004C73DE    mov         eax,dword ptr [ebp-138]
 004C73E4    push        eax
 004C73E5    xor         ecx,ecx
 004C73E7    mov         cl,byte ptr [ebp-0A]
 004C73EA    xor         eax,eax
 004C73EC    mov         al,bl
 004C73EE    add         ecx,eax
>004C73F0    jno         004C73F7
 004C73F2    call        @IntOver
 004C73F7    xor         edx,edx
 004C73F9    mov         dl,byte ptr [ebp-9]
 004C73FC    mov         eax,esi
 004C73FE    call        TStringGrid.SetCells
 004C7403    inc         ebx
 004C7404    cmp         bl,0A
>004C7407    jne         004C73BC
 004C7409    lea         edx,[ebp-110]
 004C740F    mov         eax,dword ptr [ebp-4]
 004C7412    mov         eax,dword ptr [eax+4]
 004C7415    call        004B696C
 004C741A    lea         edx,[ebp-110]
 004C7420    lea         eax,[ebp-13C]
 004C7426    call        @LStrFromString
 004C742B    mov         eax,dword ptr [ebp-13C]
 004C7431    push        eax
 004C7432    movzx       edi,byte ptr [ebp-0A]
 004C7436    mov         ecx,edi
 004C7438    mov         eax,[00615B30];^gvar_006178FB
 004C743D    movzx       eax,byte ptr [eax]
 004C7440    add         ecx,eax
>004C7442    jno         004C7449
 004C7444    call        @IntOver
 004C7449    xor         ebx,ebx
 004C744B    mov         bl,byte ptr [ebp-9]
 004C744E    mov         edx,ebx
 004C7450    mov         eax,esi
 004C7452    call        TStringGrid.SetCells
 004C7457    lea         edx,[ebp-110]
 004C745D    mov         eax,dword ptr [ebp-4]
 004C7460    mov         eax,dword ptr [eax+4]
 004C7463    call        004B696C
 004C7468    lea         edx,[ebp-110]
 004C746E    lea         eax,[ebp-140]
 004C7474    call        @LStrFromString
 004C7479    mov         eax,dword ptr [ebp-140]
 004C747F    push        eax
 004C7480    mov         ecx,edi
 004C7482    mov         eax,[00615B2C];^gvar_006178FC
 004C7487    movzx       eax,byte ptr [eax]
 004C748A    add         ecx,eax
>004C748C    jno         004C7493
 004C748E    call        @IntOver
 004C7493    mov         edx,ebx
 004C7495    mov         eax,esi
 004C7497    call        TStringGrid.SetCells
 004C749C    lea         edx,[ebp-110]
 004C74A2    mov         eax,dword ptr [ebp-4]
 004C74A5    mov         eax,dword ptr [eax+4]
 004C74A8    call        004B696C
 004C74AD    lea         edx,[ebp-110]
 004C74B3    lea         eax,[ebp-144]
 004C74B9    call        @LStrFromString
 004C74BE    mov         eax,dword ptr [ebp-144]
 004C74C4    push        eax
 004C74C5    mov         ecx,edi
 004C74C7    mov         eax,[00615BF0];^gvar_006178FD
 004C74CC    movzx       eax,byte ptr [eax]
 004C74CF    add         ecx,eax
>004C74D1    jno         004C74D8
 004C74D3    call        @IntOver
 004C74D8    mov         edx,ebx
 004C74DA    mov         eax,esi
 004C74DC    call        TStringGrid.SetCells
 004C74E1    lea         edx,[ebp-110]
 004C74E7    mov         eax,dword ptr [ebp-4]
 004C74EA    mov         eax,dword ptr [eax+4]
 004C74ED    call        004B696C
 004C74F2    lea         edx,[ebp-110]
 004C74F8    lea         eax,[ebp-148]
 004C74FE    call        @LStrFromString
 004C7503    mov         eax,dword ptr [ebp-148]
 004C7509    push        eax
 004C750A    mov         ecx,edi
 004C750C    mov         eax,[0061618C];^gvar_006178FE
 004C7511    movzx       eax,byte ptr [eax]
 004C7514    add         ecx,eax
>004C7516    jno         004C751D
 004C7518    call        @IntOver
 004C751D    mov         edx,ebx
 004C751F    mov         eax,esi
 004C7521    call        TStringGrid.SetCells
 004C7526    lea         edx,[ebp-110]
 004C752C    mov         eax,dword ptr [ebp-4]
 004C752F    mov         eax,dword ptr [eax+4]
 004C7532    call        004B696C
 004C7537    lea         edx,[ebp-110]
 004C753D    lea         eax,[ebp-14C]
 004C7543    call        @LStrFromString
 004C7548    mov         eax,dword ptr [ebp-14C]
 004C754E    push        eax
 004C754F    mov         ecx,edi
 004C7551    mov         eax,[00615D80];^gvar_006178FF
 004C7556    movzx       eax,byte ptr [eax]
 004C7559    add         ecx,eax
>004C755B    jno         004C7562
 004C755D    call        @IntOver
 004C7562    mov         edx,ebx
 004C7564    mov         eax,esi
 004C7566    call        TStringGrid.SetCells
 004C756B    lea         edx,[ebp-110]
 004C7571    mov         eax,dword ptr [ebp-4]
 004C7574    mov         eax,dword ptr [eax+4]
 004C7577    call        004B696C
 004C757C    lea         edx,[ebp-110]
 004C7582    lea         eax,[ebp-150]
 004C7588    call        @LStrFromString
 004C758D    mov         eax,dword ptr [ebp-150]
 004C7593    push        eax
 004C7594    mov         ecx,edi
 004C7596    mov         eax,[006162DC];^gvar_00617900
 004C759B    movzx       eax,byte ptr [eax]
 004C759E    add         ecx,eax
>004C75A0    jno         004C75A7
 004C75A2    call        @IntOver
 004C75A7    mov         edx,ebx
 004C75A9    mov         eax,esi
 004C75AB    call        TStringGrid.SetCells
 004C75B0    mov         eax,dword ptr [ebp-4]
 004C75B3    add         eax,110
 004C75B8    mov         edx,4C820C;'2.3'
 004C75BD    xor         ecx,ecx
 004C75BF    mov         cl,byte ptr [eax]
 004C75C1    inc         ecx
 004C75C2    call        @AStrCmp
>004C75C7    jne         004C7610
 004C75C9    lea         edx,[ebp-110]
 004C75CF    mov         eax,dword ptr [ebp-4]
 004C75D2    mov         eax,dword ptr [eax+4]
 004C75D5    call        004B696C
 004C75DA    lea         edx,[ebp-110]
 004C75E0    lea         eax,[ebp-154]
 004C75E6    call        @LStrFromString
 004C75EB    mov         eax,dword ptr [ebp-154]
 004C75F1    push        eax
 004C75F2    mov         ecx,edi
 004C75F4    mov         eax,[006162F0];^gvar_00617901
 004C75F9    movzx       eax,byte ptr [eax]
 004C75FC    add         ecx,eax
>004C75FE    jno         004C7605
 004C7600    call        @IntOver
 004C7605    mov         edx,ebx
 004C7607    mov         eax,esi
 004C7609    call        TStringGrid.SetCells
>004C760E    jmp         004C7631
 004C7610    push        4C825C;'Ecrit'
 004C7615    mov         ecx,edi
 004C7617    mov         eax,[006162F0];^gvar_00617901
 004C761C    movzx       eax,byte ptr [eax]
 004C761F    add         ecx,eax
>004C7621    jno         004C7628
 004C7623    call        @IntOver
 004C7628    mov         edx,ebx
 004C762A    mov         eax,esi
 004C762C    call        TStringGrid.SetCells
 004C7631    add         byte ptr [ebp-9],1
>004C7635    jae         004C763C
 004C7637    call        @IntOver
 004C763C    mov         bl,0E
 004C763E    mov         eax,dword ptr [ebp-4]
 004C7641    mov         eax,dword ptr [eax+940]
 004C7647    mov         edx,4C826C;'1'
 004C764C    mov         ecx,dword ptr [eax]
 004C764E    call        dword ptr [ecx+34]
 004C7651    dec         bl
>004C7653    jne         004C763E
 004C7655    dec         byte ptr [ebp-0D]
>004C7658    jne         004C7318
 004C765E    dec         byte ptr [ebp-0C]
>004C7661    jne         004C72AE
 004C7667    mov         dl,1
 004C7669    mov         eax,[004120B8];TStringList
 004C766E    call        TObject.Create;TStringList.Create
 004C7673    mov         edx,dword ptr [ebp-4]
 004C7676    mov         dword ptr [edx+944],eax
 004C767C    xor         eax,eax
 004C767E    mov         al,byte ptr [ebp-0B]
 004C7681    imul        eax,eax,2
>004C7684    jno         004C768B
 004C7686    call        @IntOver
 004C768B    cmp         eax,0FF
>004C7690    jbe         004C7697
 004C7692    call        @BoundErr
 004C7697    test        al,al
>004C7699    jbe         004C76C5
 004C769B    mov         byte ptr [ebp-0C],al
 004C769E    mov         al,byte ptr [ebp-0A]
 004C76A1    test        al,al
>004C76A3    jbe         004C76C0
 004C76A5    mov         byte ptr [ebp-0D],al
 004C76A8    mov         eax,dword ptr [ebp-4]
 004C76AB    mov         eax,dword ptr [eax+944]
 004C76B1    mov         edx,4C826C;'1'
 004C76B6    mov         ecx,dword ptr [eax]
 004C76B8    call        dword ptr [ecx+34]
 004C76BB    dec         byte ptr [ebp-0D]
>004C76BE    jne         004C76A8
 004C76C0    dec         byte ptr [ebp-0C]
>004C76C3    jne         004C769E
 004C76C5    mov         dl,1
 004C76C7    mov         eax,[004120B8];TStringList
 004C76CC    call        TObject.Create;TStringList.Create
 004C76D1    mov         edx,dword ptr [ebp-4]
 004C76D4    mov         dword ptr [edx+928],eax
 004C76DA    mov         dl,1
 004C76DC    mov         eax,[004120B8];TStringList
 004C76E1    call        TObject.Create;TStringList.Create
 004C76E6    mov         edx,dword ptr [ebp-4]
 004C76E9    mov         dword ptr [edx+92C],eax
 004C76EF    mov         dl,1
 004C76F1    mov         eax,[004120B8];TStringList
 004C76F6    call        TObject.Create;TStringList.Create
 004C76FB    mov         edx,dword ptr [ebp-4]
 004C76FE    mov         dword ptr [edx+930],eax
 004C7704    mov         dl,1
 004C7706    mov         eax,[004120B8];TStringList
 004C770B    call        TObject.Create;TStringList.Create
 004C7710    mov         edx,dword ptr [ebp-4]
 004C7713    mov         dword ptr [edx+938],eax
 004C7719    mov         dl,1
 004C771B    mov         eax,[004120B8];TStringList
 004C7720    call        TObject.Create;TStringList.Create
 004C7725    mov         edx,dword ptr [ebp-4]
 004C7728    mov         dword ptr [edx+934],eax
 004C772E    mov         dl,1
 004C7730    mov         eax,[004120B8];TStringList
 004C7735    call        TObject.Create;TStringList.Create
 004C773A    mov         ebx,eax
 004C773C    mov         eax,dword ptr [ebp-4]
 004C773F    mov         dword ptr [eax+93C],ebx
 004C7745    mov         eax,dword ptr [ebp-4]
 004C7748    add         eax,110
 004C774D    mov         edx,4C8200;'2.0'
 004C7752    xor         ecx,ecx
 004C7754    mov         cl,byte ptr [eax]
 004C7756    inc         ecx
 004C7757    call        @AStrCmp
>004C775C    jne         004C78BE
 004C7762    mov         eax,ebx
 004C7764    mov         edx,4C8278;'classe'
 004C7769    mov         ecx,dword ptr [eax]
 004C776B    call        dword ptr [ecx+34];TStringList.Add
 004C776E    mov         al,byte ptr [ebp-0B]
 004C7771    test        al,al
>004C7773    jbe         004C77C2
 004C7775    mov         byte ptr [ebp-0C],al
 004C7778    mov         al,byte ptr [ebp-0A]
 004C777B    test        al,al
>004C777D    jbe         004C77BD
 004C777F    mov         byte ptr [ebp-0D],al
 004C7782    lea         edx,[ebp-110]
 004C7788    mov         eax,dword ptr [ebp-4]
 004C778B    mov         eax,dword ptr [eax+4]
 004C778E    call        004B696C
 004C7793    lea         edx,[ebp-110]
 004C7799    lea         eax,[ebp-158]
 004C779F    call        @LStrFromString
 004C77A4    mov         edx,dword ptr [ebp-158]
 004C77AA    mov         eax,dword ptr [ebp-4]
 004C77AD    mov         eax,dword ptr [eax+928]
 004C77B3    mov         ecx,dword ptr [eax]
 004C77B5    call        dword ptr [ecx+34]
 004C77B8    dec         byte ptr [ebp-0D]
>004C77BB    jne         004C7782
 004C77BD    dec         byte ptr [ebp-0C]
>004C77C0    jne         004C7778
 004C77C2    lea         edx,[ebp-110]
 004C77C8    mov         eax,dword ptr [ebp-4]
 004C77CB    mov         eax,dword ptr [eax+4]
 004C77CE    call        004B696C
 004C77D3    lea         edx,[ebp-110]
 004C77D9    mov         eax,dword ptr [ebp-4]
 004C77DC    add         eax,310
 004C77E1    call        @PStrCpy
 004C77E6    lea         edx,[ebp-110]
 004C77EC    mov         eax,dword ptr [ebp-4]
 004C77EF    mov         eax,dword ptr [eax+4]
 004C77F2    call        004B696C
 004C77F7    lea         edx,[ebp-110]
 004C77FD    lea         eax,[ebp-15C]
 004C7803    call        @LStrFromString
 004C7808    mov         eax,dword ptr [ebp-15C]
 004C780E    call        StrToInt
 004C7813    cmp         eax,0FF
>004C7818    jbe         004C781F
 004C781A    call        @BoundErr
 004C781F    mov         edx,dword ptr [ebp-4]
 004C7822    mov         byte ptr [edx+910],al
 004C7828    mov         al,byte ptr [ebp-0B]
 004C782B    test        al,al
>004C782D    jbe         004C787C
 004C782F    mov         byte ptr [ebp-0C],al
 004C7832    mov         al,byte ptr [ebp-0A]
 004C7835    test        al,al
>004C7837    jbe         004C7877
 004C7839    mov         byte ptr [ebp-0D],al
 004C783C    lea         edx,[ebp-110]
 004C7842    mov         eax,dword ptr [ebp-4]
 004C7845    mov         eax,dword ptr [eax+4]
 004C7848    call        004B696C
 004C784D    lea         edx,[ebp-110]
 004C7853    lea         eax,[ebp-160]
 004C7859    call        @LStrFromString
 004C785E    mov         edx,dword ptr [ebp-160]
 004C7864    mov         eax,dword ptr [ebp-4]
 004C7867    mov         eax,dword ptr [eax+92C]
 004C786D    mov         ecx,dword ptr [eax]
 004C786F    call        dword ptr [ecx+34]
 004C7872    dec         byte ptr [ebp-0D]
>004C7875    jne         004C783C
 004C7877    dec         byte ptr [ebp-0C]
>004C787A    jne         004C7832
 004C787C    mov         al,byte ptr [ebp-0A]
 004C787F    test        al,al
>004C7881    jbe         004C78BE
 004C7883    mov         byte ptr [ebp-0C],al
 004C7886    mov         eax,dword ptr [ebp-4]
 004C7889    mov         eax,dword ptr [eax+930]
 004C788F    xor         edx,edx
 004C7891    mov         ecx,dword ptr [eax]
 004C7893    call        dword ptr [ecx+34]
 004C7896    mov         eax,dword ptr [ebp-4]
 004C7899    mov         eax,dword ptr [eax+938]
 004C789F    xor         edx,edx
 004C78A1    mov         ecx,dword ptr [eax]
 004C78A3    call        dword ptr [ecx+34]
 004C78A6    mov         eax,dword ptr [ebp-4]
 004C78A9    mov         eax,dword ptr [eax+934]
 004C78AF    mov         edx,4C826C;'1'
 004C78B4    mov         ecx,dword ptr [eax]
 004C78B6    call        dword ptr [ecx+34]
 004C78B9    dec         byte ptr [ebp-0C]
>004C78BC    jne         004C7886
 004C78BE    mov         eax,dword ptr [ebp-4]
 004C78C1    add         eax,110
 004C78C6    mov         edx,4C8204;'2.1'
 004C78CB    xor         ecx,ecx
 004C78CD    mov         cl,byte ptr [eax]
 004C78CF    inc         ecx
 004C78D0    call        @AStrCmp
>004C78D5    jne         004C7A84
 004C78DB    mov         eax,dword ptr [ebp-4]
 004C78DE    mov         eax,dword ptr [eax+93C]
 004C78E4    mov         edx,4C8278;'classe'
 004C78E9    mov         ecx,dword ptr [eax]
 004C78EB    call        dword ptr [ecx+34]
 004C78EE    mov         al,byte ptr [ebp-0B]
 004C78F1    test        al,al
>004C78F3    jbe         004C797C
 004C78F9    mov         byte ptr [ebp-0C],al
 004C78FC    mov         al,byte ptr [ebp-0A]
 004C78FF    test        al,al
>004C7901    jbe         004C7977
 004C7903    mov         byte ptr [ebp-0D],al
 004C7906    lea         edx,[ebp-110]
 004C790C    mov         eax,dword ptr [ebp-4]
 004C790F    mov         eax,dword ptr [eax+4]
 004C7912    call        004B696C
 004C7917    lea         edx,[ebp-110]
 004C791D    lea         eax,[ebp-164]
 004C7923    call        @LStrFromString
 004C7928    mov         edx,dword ptr [ebp-164]
 004C792E    mov         eax,dword ptr [ebp-4]
 004C7931    mov         eax,dword ptr [eax+928]
 004C7937    mov         ecx,dword ptr [eax]
 004C7939    call        dword ptr [ecx+34]
 004C793C    lea         edx,[ebp-110]
 004C7942    mov         eax,dword ptr [ebp-4]
 004C7945    mov         eax,dword ptr [eax+4]
 004C7948    call        004B696C
 004C794D    lea         edx,[ebp-110]
 004C7953    lea         eax,[ebp-168]
 004C7959    call        @LStrFromString
 004C795E    mov         edx,dword ptr [ebp-168]
 004C7964    mov         eax,dword ptr [ebp-4]
 004C7967    mov         eax,dword ptr [eax+92C]
 004C796D    mov         ecx,dword ptr [eax]
 004C796F    call        dword ptr [ecx+34]
 004C7972    dec         byte ptr [ebp-0D]
>004C7975    jne         004C7906
 004C7977    dec         byte ptr [ebp-0C]
>004C797A    jne         004C78FC
 004C797C    mov         al,byte ptr [ebp-0A]
 004C797F    test        al,al
>004C7981    jbe         004C79BE
 004C7983    mov         byte ptr [ebp-0C],al
 004C7986    mov         eax,dword ptr [ebp-4]
 004C7989    mov         eax,dword ptr [eax+930]
 004C798F    xor         edx,edx
 004C7991    mov         ecx,dword ptr [eax]
 004C7993    call        dword ptr [ecx+34]
 004C7996    mov         eax,dword ptr [ebp-4]
 004C7999    mov         eax,dword ptr [eax+938]
 004C799F    xor         edx,edx
 004C79A1    mov         ecx,dword ptr [eax]
 004C79A3    call        dword ptr [ecx+34]
 004C79A6    mov         eax,dword ptr [ebp-4]
 004C79A9    mov         eax,dword ptr [eax+934]
 004C79AF    mov         edx,4C826C;'1'
 004C79B4    mov         ecx,dword ptr [eax]
 004C79B6    call        dword ptr [ecx+34]
 004C79B9    dec         byte ptr [ebp-0C]
>004C79BC    jne         004C7986
 004C79BE    lea         edx,[ebp-110]
 004C79C4    mov         eax,dword ptr [ebp-4]
 004C79C7    mov         eax,dword ptr [eax+4]
 004C79CA    call        004B696C
 004C79CF    lea         edx,[ebp-110]
 004C79D5    lea         eax,[ebp-16C]
 004C79DB    call        @LStrFromString
 004C79E0    mov         eax,dword ptr [ebp-16C]
 004C79E6    call        StrToInt
 004C79EB    cmp         eax,0FF
>004C79F0    jbe         004C79F7
 004C79F2    call        @BoundErr
 004C79F7    mov         edx,dword ptr [ebp-4]
 004C79FA    mov         byte ptr [edx+910],al
 004C7A00    lea         edx,[ebp-110]
 004C7A06    mov         eax,dword ptr [ebp-4]
 004C7A09    mov         eax,dword ptr [eax+4]
 004C7A0C    call        004B696C
 004C7A11    lea         edx,[ebp-110]
 004C7A17    lea         eax,[ebp-170]
 004C7A1D    call        @LStrFromString
 004C7A22    mov         eax,dword ptr [ebp-170]
 004C7A28    call        StrToInt
 004C7A2D    cmp         eax,0FF
>004C7A32    jbe         004C7A39
 004C7A34    call        @BoundErr
 004C7A39    mov         edx,dword ptr [ebp-4]
 004C7A3C    mov         byte ptr [edx+911],al
 004C7A42    lea         edx,[ebp-110]
 004C7A48    mov         eax,dword ptr [ebp-4]
 004C7A4B    mov         eax,dword ptr [eax+4]
 004C7A4E    call        004B696C
 004C7A53    lea         edx,[ebp-110]
 004C7A59    lea         eax,[ebp-174]
 004C7A5F    call        @LStrFromString
 004C7A64    mov         eax,dword ptr [ebp-174]
 004C7A6A    call        StrToInt
 004C7A6F    cmp         eax,0FF
>004C7A74    jbe         004C7A7B
 004C7A76    call        @BoundErr
 004C7A7B    mov         edx,dword ptr [ebp-4]
 004C7A7E    mov         byte ptr [edx+912],al
 004C7A84    mov         eax,dword ptr [ebp-4]
 004C7A87    add         eax,110
 004C7A8C    mov         edx,4C8208;'2.2'
 004C7A91    xor         ecx,ecx
 004C7A93    mov         cl,byte ptr [eax]
 004C7A95    inc         ecx
 004C7A96    call        @AStrCmp
>004C7A9B    jne         004C7DFB
 004C7AA1    mov         al,byte ptr [ebp-0B]
 004C7AA4    test        al,al
>004C7AA6    jbe         004C7AF5
 004C7AA8    mov         byte ptr [ebp-0C],al
 004C7AAB    mov         al,byte ptr [ebp-0A]
 004C7AAE    test        al,al
>004C7AB0    jbe         004C7AF0
 004C7AB2    mov         byte ptr [ebp-0D],al
 004C7AB5    lea         edx,[ebp-110]
 004C7ABB    mov         eax,dword ptr [ebp-4]
 004C7ABE    mov         eax,dword ptr [eax+4]
 004C7AC1    call        004B696C
 004C7AC6    lea         edx,[ebp-110]
 004C7ACC    lea         eax,[ebp-178]
 004C7AD2    call        @LStrFromString
 004C7AD7    mov         edx,dword ptr [ebp-178]
 004C7ADD    mov         eax,dword ptr [ebp-4]
 004C7AE0    mov         eax,dword ptr [eax+928]
 004C7AE6    mov         ecx,dword ptr [eax]
 004C7AE8    call        dword ptr [ecx+34]
 004C7AEB    dec         byte ptr [ebp-0D]
>004C7AEE    jne         004C7AB5
 004C7AF0    dec         byte ptr [ebp-0C]
>004C7AF3    jne         004C7AAB
 004C7AF5    lea         edx,[ebp-110]
 004C7AFB    mov         eax,dword ptr [ebp-4]
 004C7AFE    mov         eax,dword ptr [eax+4]
 004C7B01    call        004B696C
 004C7B06    lea         edx,[ebp-110]
 004C7B0C    lea         eax,[ebp-17C]
 004C7B12    call        @LStrFromString
 004C7B17    mov         eax,dword ptr [ebp-17C]
 004C7B1D    call        StrToInt
 004C7B22    cmp         eax,0FF
>004C7B27    jbe         004C7B2E
 004C7B29    call        @BoundErr
 004C7B2E    test        al,al
>004C7B30    jbe         004C7B70
 004C7B32    mov         byte ptr [ebp-0C],al
 004C7B35    lea         edx,[ebp-110]
 004C7B3B    mov         eax,dword ptr [ebp-4]
 004C7B3E    mov         eax,dword ptr [eax+4]
 004C7B41    call        004B696C
 004C7B46    lea         edx,[ebp-110]
 004C7B4C    lea         eax,[ebp-180]
 004C7B52    call        @LStrFromString
 004C7B57    mov         edx,dword ptr [ebp-180]
 004C7B5D    mov         eax,dword ptr [ebp-4]
 004C7B60    mov         eax,dword ptr [eax+93C]
 004C7B66    mov         ecx,dword ptr [eax]
 004C7B68    call        dword ptr [ecx+34]
 004C7B6B    dec         byte ptr [ebp-0C]
>004C7B6E    jne         004C7B35
 004C7B70    lea         edx,[ebp-110]
 004C7B76    mov         eax,dword ptr [ebp-4]
 004C7B79    mov         eax,dword ptr [eax+4]
 004C7B7C    call        004B696C
 004C7B81    lea         edx,[ebp-110]
 004C7B87    lea         eax,[ebp-184]
 004C7B8D    call        @LStrFromString
 004C7B92    mov         edx,dword ptr [ebp-184]
 004C7B98    mov         eax,dword ptr [ebp-4]
 004C7B9B    mov         eax,dword ptr [eax+914]
 004C7BA1    call        004C9AA0
 004C7BA6    lea         edx,[ebp-110]
 004C7BAC    mov         eax,dword ptr [ebp-4]
 004C7BAF    mov         eax,dword ptr [eax+4]
 004C7BB2    call        004B696C
 004C7BB7    lea         edx,[ebp-110]
 004C7BBD    lea         eax,[ebp-188]
 004C7BC3    call        @LStrFromString
 004C7BC8    mov         eax,dword ptr [ebp-188]
 004C7BCE    call        StrToInt
 004C7BD3    mov         ebx,eax
 004C7BD5    cmp         ebx,0FF
>004C7BDB    jbe         004C7BE2
 004C7BDD    call        @BoundErr
 004C7BE2    mov         dl,1
 004C7BE4    mov         eax,[004120B8];TStringList
 004C7BE9    call        TObject.Create;TStringList.Create
 004C7BEE    mov         esi,eax
 004C7BF0    test        bl,bl
>004C7BF2    jbe         004C7C2B
 004C7BF4    mov         byte ptr [ebp-0C],bl
 004C7BF7    lea         edx,[ebp-110]
 004C7BFD    mov         eax,dword ptr [ebp-4]
 004C7C00    mov         eax,dword ptr [eax+4]
 004C7C03    call        004B696C
 004C7C08    lea         edx,[ebp-110]
 004C7C0E    lea         eax,[ebp-18C]
 004C7C14    call        @LStrFromString
 004C7C19    mov         edx,dword ptr [ebp-18C]
 004C7C1F    mov         eax,esi
 004C7C21    mov         ecx,dword ptr [eax]
 004C7C23    call        dword ptr [ecx+34];TStringList.Add
 004C7C26    dec         byte ptr [ebp-0C]
>004C7C29    jne         004C7BF7
 004C7C2B    mov         eax,dword ptr [ebp-4]
 004C7C2E    mov         eax,dword ptr [eax+914]
 004C7C34    mov         edx,esi
 004C7C36    call        004C9A84
 004C7C3B    mov         eax,esi
 004C7C3D    call        TObject.Free
 004C7C42    mov         al,byte ptr [ebp-0B]
 004C7C45    test        al,al
>004C7C47    jbe         004C7CA2
 004C7C49    mov         byte ptr [ebp-0C],al
 004C7C4C    mov         al,byte ptr [ebp-0A]
 004C7C4F    test        al,al
>004C7C51    jbe         004C7C9D
 004C7C53    mov         byte ptr [ebp-0D],al
 004C7C56    test        bl,bl
>004C7C58    jbe         004C7C98
 004C7C5A    mov         byte ptr [ebp-0E],bl
 004C7C5D    lea         edx,[ebp-110]
 004C7C63    mov         eax,dword ptr [ebp-4]
 004C7C66    mov         eax,dword ptr [eax+4]
 004C7C69    call        004B696C
 004C7C6E    lea         edx,[ebp-110]
 004C7C74    lea         eax,[ebp-190]
 004C7C7A    call        @LStrFromString
 004C7C7F    mov         edx,dword ptr [ebp-190]
 004C7C85    mov         eax,dword ptr [ebp-4]
 004C7C88    mov         eax,dword ptr [eax+92C]
 004C7C8E    mov         ecx,dword ptr [eax]
 004C7C90    call        dword ptr [ecx+34]
 004C7C93    dec         byte ptr [ebp-0E]
>004C7C96    jne         004C7C5D
 004C7C98    dec         byte ptr [ebp-0D]
>004C7C9B    jne         004C7C56
 004C7C9D    dec         byte ptr [ebp-0C]
>004C7CA0    jne         004C7C4C
 004C7CA2    mov         al,byte ptr [ebp-0A]
 004C7CA5    test        al,al
>004C7CA7    jbe         004C7D35
 004C7CAD    mov         byte ptr [ebp-0C],al
 004C7CB0    lea         edx,[ebp-110]
 004C7CB6    mov         eax,dword ptr [ebp-4]
 004C7CB9    mov         eax,dword ptr [eax+4]
 004C7CBC    call        004B696C
 004C7CC1    lea         edx,[ebp-110]
 004C7CC7    lea         eax,[ebp-194]
 004C7CCD    call        @LStrFromString
 004C7CD2    mov         edx,dword ptr [ebp-194]
 004C7CD8    mov         eax,dword ptr [ebp-4]
 004C7CDB    mov         eax,dword ptr [eax+930]
 004C7CE1    mov         ecx,dword ptr [eax]
 004C7CE3    call        dword ptr [ecx+34]
 004C7CE6    lea         edx,[ebp-110]
 004C7CEC    mov         eax,dword ptr [ebp-4]
 004C7CEF    mov         eax,dword ptr [eax+4]
 004C7CF2    call        004B696C
 004C7CF7    lea         edx,[ebp-110]
 004C7CFD    lea         eax,[ebp-198]
 004C7D03    call        @LStrFromString
 004C7D08    mov         edx,dword ptr [ebp-198]
 004C7D0E    mov         eax,dword ptr [ebp-4]
 004C7D11    mov         eax,dword ptr [eax+934]
 004C7D17    mov         ecx,dword ptr [eax]
 004C7D19    call        dword ptr [ecx+34]
 004C7D1C    mov         eax,dword ptr [ebp-4]
 004C7D1F    mov         eax,dword ptr [eax+938]
 004C7D25    xor         edx,edx
 004C7D27    mov         ecx,dword ptr [eax]
 004C7D29    call        dword ptr [ecx+34]
 004C7D2C    dec         byte ptr [ebp-0C]
>004C7D2F    jne         004C7CB0
 004C7D35    lea         edx,[ebp-110]
 004C7D3B    mov         eax,dword ptr [ebp-4]
 004C7D3E    mov         eax,dword ptr [eax+4]
 004C7D41    call        004B696C
 004C7D46    lea         edx,[ebp-110]
 004C7D4C    lea         eax,[ebp-19C]
 004C7D52    call        @LStrFromString
 004C7D57    mov         eax,dword ptr [ebp-19C]
 004C7D5D    call        StrToInt
 004C7D62    cmp         eax,0FF
>004C7D67    jbe         004C7D6E
 004C7D69    call        @BoundErr
 004C7D6E    mov         edx,dword ptr [ebp-4]
 004C7D71    mov         byte ptr [edx+910],al
 004C7D77    lea         edx,[ebp-110]
 004C7D7D    mov         eax,dword ptr [ebp-4]
 004C7D80    mov         eax,dword ptr [eax+4]
 004C7D83    call        004B696C
 004C7D88    lea         edx,[ebp-110]
 004C7D8E    lea         eax,[ebp-1A0]
 004C7D94    call        @LStrFromString
 004C7D99    mov         eax,dword ptr [ebp-1A0]
 004C7D9F    call        StrToInt
 004C7DA4    cmp         eax,0FF
>004C7DA9    jbe         004C7DB0
 004C7DAB    call        @BoundErr
 004C7DB0    mov         edx,dword ptr [ebp-4]
 004C7DB3    mov         byte ptr [edx+911],al
 004C7DB9    lea         edx,[ebp-110]
 004C7DBF    mov         eax,dword ptr [ebp-4]
 004C7DC2    mov         eax,dword ptr [eax+4]
 004C7DC5    call        004B696C
 004C7DCA    lea         edx,[ebp-110]
 004C7DD0    lea         eax,[ebp-1A4]
 004C7DD6    call        @LStrFromString
 004C7DDB    mov         eax,dword ptr [ebp-1A4]
 004C7DE1    call        StrToInt
 004C7DE6    cmp         eax,0FF
>004C7DEB    jbe         004C7DF2
 004C7DED    call        @BoundErr
 004C7DF2    mov         edx,dword ptr [ebp-4]
 004C7DF5    mov         byte ptr [edx+912],al
 004C7DFB    mov         eax,dword ptr [ebp-4]
 004C7DFE    add         eax,110
 004C7E03    mov         edx,4C820C;'2.3'
 004C7E08    xor         ecx,ecx
 004C7E0A    mov         cl,byte ptr [eax]
 004C7E0C    inc         ecx
 004C7E0D    call        @AStrCmp
>004C7E12    jne         004C8198
 004C7E18    mov         al,byte ptr [ebp-0B]
 004C7E1B    test        al,al
>004C7E1D    jbe         004C7E6C
 004C7E1F    mov         byte ptr [ebp-0C],al
 004C7E22    mov         al,byte ptr [ebp-0A]
 004C7E25    test        al,al
>004C7E27    jbe         004C7E67
 004C7E29    mov         byte ptr [ebp-0D],al
 004C7E2C    lea         edx,[ebp-110]
 004C7E32    mov         eax,dword ptr [ebp-4]
 004C7E35    mov         eax,dword ptr [eax+4]
 004C7E38    call        004B696C
 004C7E3D    lea         edx,[ebp-110]
 004C7E43    lea         eax,[ebp-1A8]
 004C7E49    call        @LStrFromString
 004C7E4E    mov         edx,dword ptr [ebp-1A8]
 004C7E54    mov         eax,dword ptr [ebp-4]
 004C7E57    mov         eax,dword ptr [eax+928]
 004C7E5D    mov         ecx,dword ptr [eax]
 004C7E5F    call        dword ptr [ecx+34]
 004C7E62    dec         byte ptr [ebp-0D]
>004C7E65    jne         004C7E2C
 004C7E67    dec         byte ptr [ebp-0C]
>004C7E6A    jne         004C7E22
 004C7E6C    lea         edx,[ebp-110]
 004C7E72    mov         eax,dword ptr [ebp-4]
 004C7E75    mov         eax,dword ptr [eax+4]
 004C7E78    call        004B696C
 004C7E7D    lea         edx,[ebp-110]
 004C7E83    lea         eax,[ebp-1AC]
 004C7E89    call        @LStrFromString
 004C7E8E    mov         eax,dword ptr [ebp-1AC]
 004C7E94    call        StrToInt
 004C7E99    cmp         eax,0FF
>004C7E9E    jbe         004C7EA5
 004C7EA0    call        @BoundErr
 004C7EA5    test        al,al
>004C7EA7    jbe         004C7EE7
 004C7EA9    mov         byte ptr [ebp-0C],al
 004C7EAC    lea         edx,[ebp-110]
 004C7EB2    mov         eax,dword ptr [ebp-4]
 004C7EB5    mov         eax,dword ptr [eax+4]
 004C7EB8    call        004B696C
 004C7EBD    lea         edx,[ebp-110]
 004C7EC3    lea         eax,[ebp-1B0]
 004C7EC9    call        @LStrFromString
 004C7ECE    mov         edx,dword ptr [ebp-1B0]
 004C7ED4    mov         eax,dword ptr [ebp-4]
 004C7ED7    mov         eax,dword ptr [eax+93C]
 004C7EDD    mov         ecx,dword ptr [eax]
 004C7EDF    call        dword ptr [ecx+34]
 004C7EE2    dec         byte ptr [ebp-0C]
>004C7EE5    jne         004C7EAC
 004C7EE7    lea         edx,[ebp-110]
 004C7EED    mov         eax,dword ptr [ebp-4]
 004C7EF0    mov         eax,dword ptr [eax+4]
 004C7EF3    call        004B696C
 004C7EF8    lea         edx,[ebp-110]
 004C7EFE    lea         eax,[ebp-1B4]
 004C7F04    call        @LStrFromString
 004C7F09    mov         edx,dword ptr [ebp-1B4]
 004C7F0F    mov         eax,dword ptr [ebp-4]
 004C7F12    mov         eax,dword ptr [eax+914]
 004C7F18    call        004C9AA0
 004C7F1D    lea         edx,[ebp-110]
 004C7F23    mov         eax,dword ptr [ebp-4]
 004C7F26    mov         eax,dword ptr [eax+4]
 004C7F29    call        004B696C
 004C7F2E    lea         edx,[ebp-110]
 004C7F34    lea         eax,[ebp-1B8]
 004C7F3A    call        @LStrFromString
 004C7F3F    mov         eax,dword ptr [ebp-1B8]
 004C7F45    call        StrToInt
 004C7F4A    mov         ebx,eax
 004C7F4C    cmp         ebx,0FF
>004C7F52    jbe         004C7F59
 004C7F54    call        @BoundErr
 004C7F59    mov         dl,1
 004C7F5B    mov         eax,[004120B8];TStringList
 004C7F60    call        TObject.Create;TStringList.Create
 004C7F65    mov         esi,eax
 004C7F67    test        bl,bl
>004C7F69    jbe         004C7FA2
 004C7F6B    mov         byte ptr [ebp-0C],bl
 004C7F6E    lea         edx,[ebp-110]
 004C7F74    mov         eax,dword ptr [ebp-4]
 004C7F77    mov         eax,dword ptr [eax+4]
 004C7F7A    call        004B696C
 004C7F7F    lea         edx,[ebp-110]
 004C7F85    lea         eax,[ebp-1BC]
 004C7F8B    call        @LStrFromString
 004C7F90    mov         edx,dword ptr [ebp-1BC]
 004C7F96    mov         eax,esi
 004C7F98    mov         ecx,dword ptr [eax]
 004C7F9A    call        dword ptr [ecx+34];TStringList.Add
 004C7F9D    dec         byte ptr [ebp-0C]
>004C7FA0    jne         004C7F6E
 004C7FA2    mov         eax,dword ptr [ebp-4]
 004C7FA5    mov         eax,dword ptr [eax+914]
 004C7FAB    mov         edx,esi
 004C7FAD    call        004C9A84
 004C7FB2    mov         eax,esi
 004C7FB4    call        TObject.Free
 004C7FB9    mov         al,byte ptr [ebp-0B]
 004C7FBC    test        al,al
>004C7FBE    jbe         004C8019
 004C7FC0    mov         byte ptr [ebp-0C],al
 004C7FC3    mov         al,byte ptr [ebp-0A]
 004C7FC6    test        al,al
>004C7FC8    jbe         004C8014
 004C7FCA    mov         byte ptr [ebp-0D],al
 004C7FCD    test        bl,bl
>004C7FCF    jbe         004C800F
 004C7FD1    mov         byte ptr [ebp-0E],bl
 004C7FD4    lea         edx,[ebp-110]
 004C7FDA    mov         eax,dword ptr [ebp-4]
 004C7FDD    mov         eax,dword ptr [eax+4]
 004C7FE0    call        004B696C
 004C7FE5    lea         edx,[ebp-110]
 004C7FEB    lea         eax,[ebp-1C0]
 004C7FF1    call        @LStrFromString
 004C7FF6    mov         edx,dword ptr [ebp-1C0]
 004C7FFC    mov         eax,dword ptr [ebp-4]
 004C7FFF    mov         eax,dword ptr [eax+92C]
 004C8005    mov         ecx,dword ptr [eax]
 004C8007    call        dword ptr [ecx+34]
 004C800A    dec         byte ptr [ebp-0E]
>004C800D    jne         004C7FD4
 004C800F    dec         byte ptr [ebp-0D]
>004C8012    jne         004C7FCD
 004C8014    dec         byte ptr [ebp-0C]
>004C8017    jne         004C7FC3
 004C8019    mov         al,byte ptr [ebp-0A]
 004C801C    test        al,al
>004C801E    jbe         004C80D2
 004C8024    mov         byte ptr [ebp-0C],al
 004C8027    lea         edx,[ebp-110]
 004C802D    mov         eax,dword ptr [ebp-4]
 004C8030    mov         eax,dword ptr [eax+4]
 004C8033    call        004B696C
 004C8038    lea         edx,[ebp-110]
 004C803E    lea         eax,[ebp-1C4]
 004C8044    call        @LStrFromString
 004C8049    mov         edx,dword ptr [ebp-1C4]
 004C804F    mov         eax,dword ptr [ebp-4]
 004C8052    mov         eax,dword ptr [eax+930]
 004C8058    mov         ecx,dword ptr [eax]
 004C805A    call        dword ptr [ecx+34]
 004C805D    lea         edx,[ebp-110]
 004C8063    mov         eax,dword ptr [ebp-4]
 004C8066    mov         eax,dword ptr [eax+4]
 004C8069    call        004B696C
 004C806E    lea         edx,[ebp-110]
 004C8074    lea         eax,[ebp-1C8]
 004C807A    call        @LStrFromString
 004C807F    mov         edx,dword ptr [ebp-1C8]
 004C8085    mov         eax,dword ptr [ebp-4]
 004C8088    mov         eax,dword ptr [eax+934]
 004C808E    mov         ecx,dword ptr [eax]
 004C8090    call        dword ptr [ecx+34]
 004C8093    lea         edx,[ebp-110]
 004C8099    mov         eax,dword ptr [ebp-4]
 004C809C    mov         eax,dword ptr [eax+4]
 004C809F    call        004B696C
 004C80A4    lea         edx,[ebp-110]
 004C80AA    lea         eax,[ebp-1CC]
 004C80B0    call        @LStrFromString
 004C80B5    mov         edx,dword ptr [ebp-1CC]
 004C80BB    mov         eax,dword ptr [ebp-4]
 004C80BE    mov         eax,dword ptr [eax+938]
 004C80C4    mov         ecx,dword ptr [eax]
 004C80C6    call        dword ptr [ecx+34]
 004C80C9    dec         byte ptr [ebp-0C]
>004C80CC    jne         004C8027
 004C80D2    lea         edx,[ebp-110]
 004C80D8    mov         eax,dword ptr [ebp-4]
 004C80DB    mov         eax,dword ptr [eax+4]
 004C80DE    call        004B696C
 004C80E3    lea         edx,[ebp-110]
 004C80E9    lea         eax,[ebp-1D0]
 004C80EF    call        @LStrFromString
 004C80F4    mov         eax,dword ptr [ebp-1D0]
 004C80FA    call        StrToInt
 004C80FF    cmp         eax,0FF
>004C8104    jbe         004C810B
 004C8106    call        @BoundErr
 004C810B    mov         edx,dword ptr [ebp-4]
 004C810E    mov         byte ptr [edx+910],al
 004C8114    lea         edx,[ebp-110]
 004C811A    mov         eax,dword ptr [ebp-4]
 004C811D    mov         eax,dword ptr [eax+4]
 004C8120    call        004B696C
 004C8125    lea         edx,[ebp-110]
 004C812B    lea         eax,[ebp-1D4]
 004C8131    call        @LStrFromString
 004C8136    mov         eax,dword ptr [ebp-1D4]
 004C813C    call        StrToInt
 004C8141    cmp         eax,0FF
>004C8146    jbe         004C814D
 004C8148    call        @BoundErr
 004C814D    mov         edx,dword ptr [ebp-4]
 004C8150    mov         byte ptr [edx+911],al
 004C8156    lea         edx,[ebp-110]
 004C815C    mov         eax,dword ptr [ebp-4]
 004C815F    mov         eax,dword ptr [eax+4]
 004C8162    call        004B696C
 004C8167    lea         edx,[ebp-110]
 004C816D    lea         eax,[ebp-1D8]
 004C8173    call        @LStrFromString
 004C8178    mov         eax,dword ptr [ebp-1D8]
 004C817E    call        StrToInt
 004C8183    cmp         eax,0FF
>004C8188    jbe         004C818F
 004C818A    call        @BoundErr
 004C818F    mov         edx,dword ptr [ebp-4]
 004C8192    mov         byte ptr [edx+912],al
 004C8198    mov         eax,dword ptr [ebp-4]
 004C819B    mov         byte ptr [eax+8],0
 004C819F    xor         eax,eax
 004C81A1    pop         edx
 004C81A2    pop         ecx
 004C81A3    pop         ecx
 004C81A4    mov         dword ptr fs:[eax],edx
>004C81A7    jmp         004C81C9
>004C81A9    jmp         @HandleOnException
 004C81AE    dd          1
 004C81B2    dd          004094F8;Exception
 004C81B6    dd          004C81BA
 004C81BA    mov         eax,dword ptr [ebp-4]
 004C81BD    mov         byte ptr [eax+948],0
 004C81C4    call        @DoneExcept
 004C81C9    xor         eax,eax
 004C81CB    pop         edx
 004C81CC    pop         ecx
 004C81CD    pop         ecx
 004C81CE    mov         dword ptr fs:[eax],edx
 004C81D1    push        4C81F6
 004C81D6    lea         eax,[ebp-1D8]
 004C81DC    mov         edx,32
 004C81E1    call        @LStrArrayClr
 004C81E6    lea         eax,[ebp-8]
 004C81E9    call        @LStrClr
 004C81EE    ret
>004C81EF    jmp         @HandleFinally
>004C81F4    jmp         004C81D6
 004C81F6    pop         edi
 004C81F7    pop         esi
 004C81F8    pop         ebx
 004C81F9    mov         esp,ebp
 004C81FB    pop         ebp
 004C81FC    ret
//end;//*
}

//004C8280
function TFichierCdn.GetCell(ALigne, ACol, ARow: Integer): string;
begin
  result := data[ALigne, ACol, ARow]; 
end;

function TFichierCdn.GetCells(ALigne, ACol, ARow: Integer): TFielddata;
begin
  Result:= TFielddata.Create;
  result.value := data[ALigne, ACol, ARow];
end;

procedure TFichierCdn.save;
var
  FluxCdn: TFluxCdn;
  buffer: string;
  count, i, j, k: Integer;
  version: Real;
begin
  //TypeBulletins:=TTypeBulletins.Create;
  
  //Eleves:=TEleves.Create;
  //StringGrid:=TStringGrid.Create;
  if (filename <> '') then
  begin
    FluxCdn := TFluxCdn.Create(filename, fmCreate); //TFluxCdn.Create;
    FluxCdn.sub_004B6A80('Carnet de notes');
    FluxCdn.sub_004B6A80('2.3');

        //Nom enseignant
    FluxCdn.sub_004B6A80(Enseignant);
    FluxCdn.sub_004B6A80(classe);
    FluxCdn.sub_004B6A80(Etablissement);
    FluxCdn.sub_004B6A80(matiere);
    FluxCdn.sub_004B6A80(Ascolaire);
    FluxCdn.sub_004B6A80(remarque);
    FluxCdn.sub_004B6A80(organisation);
    FluxCdn.sub_004B6A80(IntToStr(nbre_org));
    for i := 1 to nbre_org do
    begin
      FluxCdn.sub_004B6A80(nom_org[i - 1]);
    end;
    FluxCdn.sub_004B6A80(IntToStr(nbr_eleve));
    for i := 1 to nbr_eleve do
    begin
      FluxCdn.sub_004B6A80(nom_eleve[i - 1]);
    end;
    for k := 1 to nbre_org do
    begin
      FluxCdn.sub_004B6A80(IntToStr(nbr_note[k]));
      for i := 1 to nbr_note[k] do
      begin
        FluxCdn.sub_004B6A80(cells[k, i, 0]);
        for j := 1 to nbr_eleve do
        begin
          FluxCdn.sub_004B6A80(cells[k, i, j]);
        end;
                // autres informations   16 infos
        for j := 1 to 16 do
        begin
          FluxCdn.sub_004B6A80(cells[k, i, nbr_eleve + j]);
        end;
      end;
    end;
    count := 0;
    for k := 1 to nbre_org do
      for j := 1 to nbr_eleve do
      begin
        FluxCdn.sub_004B6A80(points[count]);
        count := count + 1;
      end;
    FluxCdn.sub_004B6A80(etat1);
    FluxCdn.sub_004B6A80(etat2);
    FluxCdn.sub_004B6A80(etat3);
    FluxCdn.sub_004B6A80(etat4);
    FluxCdn.sub_004B6A80(etat5);
    count := 0;
    for k := 1 to nbre_org do
      for j := 1 to nbr_eleve do
      begin
        FluxCdn.sub_004B6A80(Appreciation[count]);
        count := count + 1;
      end;
    for i := 1 to nbr_eleve do
    begin
      FluxCdn.sub_004B6A80(date_nais[i - 1]);
      FluxCdn.sub_004B6A80(sexe[i - 1]);
      FluxCdn.sub_004B6A80(Redoublant[i - 1]);
    end;
    FluxCdn.sub_004B6A80(inconnu1);
    FluxCdn.sub_004B6A80(inconnu2);
    FluxCdn.sub_004B6A80(inconnu3);
  end;
  FluxCdn.Free;
   //f948:=True;
end;

procedure TFichierCdn.SelectAllRange(ARow: Integer);
begin
//=====
end;

procedure TFichierCdn.SetCell(ALigne, ACol, ARow: Integer; const Value: string);
begin
  {data[ALigne + 512 * ACol + 512 * 512 * ARow]}
  if (ALigne > NLigne) then
  begin
    NLigne := ALigne;
    SetLength(data, NLigne + 1, NCol + 1, NRow + 1);
  end;
  if (ACol > NCol) then
  begin
    NCol := ACol;
    SetLength(data, NLigne + 1, NCol + 1, NRow + 1);
  end;
  if (ARow > NRow) then
  begin
    NRow := ARow;
    SetLength(data, NLigne + 1, NCol + 1, NRow + 1);
  end;

  data[ALigne, ACol, ARow] := Value;
end;

procedure TFichierCdn.SetCells(ALigne, ACol, ARow: Integer; const Value: TFielddata);
begin
  {data[ALigne + 512 * ACol + 512 * 512 * ARow]}  data[ALigne, ACol, ARow] := Value.value;
end;

procedure TFichierCdn.sub_004C8280;//(?:?; ?:?; ?:?; ?:?; ?:?);
var
  FluxCdn: TFluxCdn;
  buffer: string;
  count, i, j, k,nbr_eleve1: Integer;
  version: Real;
begin
  //TypeBulletins:=TTypeBulletins.Create;
  
  //Eleves:=TEleves.Create;
  //StringGrid:=TStringGrid.Create;
  if (filename <> '') then
  begin
    FluxCdn := TFluxCdn.Create(filename, fmOpenRead); //TFluxCdn.Create;
    buffer := FluxCdn.sub_004B696C();
        //showmessage(buffer);
    if (buffer <> 'Carnet de notes') then
      raise Exception.Create('Ce fichier n''est pas un fichier Carnet de Notes');

    buffer := FluxCdn.sub_004B696C();
    if (buffer = '2.0') then
      version := 2.0
    else if (buffer = '2.1') then
      version := 2.1
    else if (buffer = '2.2') then
      version := 2.2
    else if (buffer = '2.3') then
      version := 2.3
    else
      raise Exception.Create('Mauvaise version de fichier.');
        //Nom enseignant
    Enseignant := FluxCdn.sub_004B696C();
    classe := FluxCdn.sub_004B696C();
    Etablissement := FluxCdn.sub_004B696C();
    matiere := FluxCdn.sub_004B696C();
    Ascolaire := FluxCdn.sub_004B696C();
    remarque := FluxCdn.sub_004B696C();
    organisation := FluxCdn.sub_004B696C();

    nbre_org := StrToInt(FluxCdn.sub_004B696C());

    nom_org := TStringList.Create;
    SetLength(SerieNote,nbre_org+1);
    for i := 1 to nbre_org do
    begin
      nom_org.Add(FluxCdn.sub_004B696C());
    end;
    nbr_eleve1 := StrToInt(FluxCdn.sub_004B696C());
    nom_eleve := TStringList.Create;
    for i := 1 to nbr_eleve1 do
    begin
      nom_eleve.Add(FluxCdn.sub_004B696C());
    end;
    for k := 1 to nbre_org do
    begin
      nbr_note[k] := StrToInt(FluxCdn.sub_004B696C());
      SerieNote[k]:= TStringList.Create;
      for i := 1 to nbr_note[k] do
      begin
        cells[k, i, 0] := FluxCdn.sub_004B696C();
        SerieNote[k].Add(cells[k, i, 0]);
        for j := 1 to nbr_eleve do
        begin
          cells[k, i, j] := FluxCdn.sub_004B696C();
        end;
                // autres informations   16 infos
        for j := 1 to 16 do
        begin
          cells[k, i, nbr_eleve + j] := FluxCdn.sub_004B696C()
        end;
        // min ,max  and moy
        cells[k, i, nbr_eleve + 2] :=floattostrf(moy(k,i), ffNumber, 4, 2);
        cells[k, i, nbr_eleve + 4] :=intToStr(nbr_eleve);
        cells[k, i, nbr_eleve + 5] :=FloatToStr(min(k,i));
        cells[k, i, nbr_eleve + 6] :=FloatToStr(max(k,i));
        cells[k, i, nbr_eleve + 7] :=floattostrf(Ecart(k,i), ffNumber, 4, 2);
        cells[k, i, nbr_eleve + 8] :=floattostrf(notemoy(k,i), ffNumber, 4, 2);
        cells[k, i, nbr_eleve + 9] :=floattostrf(notemoyclass(k,i), ffNumber, 4, 2);

      end;
    end;

    Appreciation := TStringList.Create;
    points := TStringList.Create;
    //points
    for k := 1 to nbre_org do
      for j := 1 to nbr_eleve do
      begin
        points.Add(FluxCdn.sub_004B696C());
      end;
    etat1 := FluxCdn.sub_004B696C();
    etat2 := FluxCdn.sub_004B696C();
    etat3 := FluxCdn.sub_004B696C();
    etat4 := FluxCdn.sub_004B696C();
    etat5 := FluxCdn.sub_004B696C();
    //Appreciation
    for k := 1 to nbre_org do
      for j := 1 to nbr_eleve do
      begin
        Appreciation.Add(FluxCdn.sub_004B696C());
      end;
    date_nais := TStringList.Create;
    sexe := TStringList.Create;
    Redoublant := TStringList.Create;
    // dat nais
    for i := 1 to nbr_eleve do
    begin

      date_nais.Add(FluxCdn.sub_004B696C());
      sexe.Add(FluxCdn.sub_004B696C());
      Redoublant.Add(FluxCdn.sub_004B696C());
    end;
    inconnu1 := FluxCdn.sub_004B696C();
    inconnu2 := FluxCdn.sub_004B696C();
    inconnu3 := FluxCdn.sub_004B696C();
    //=================
        //FluxCdn.sub_004B696C(Buffer);
        //ShowMessage('xxx:'+Buffer);
        {

        'Le fichier "'+filename+'" est un fichier d''une ancienne version de Carnet de Notes.'
        #13+#10+#13+#10
        'Son importation dans ' + 'Carnet de Notes version Personnelle'+' a été réussie.'
        MessageBoxA
        'Le fichier "'+FileName+'" a été créé avec la version Etablissement de Carnet de Notes.'
        #13#10#13#10+'Certaines fonctionnalités de '+'Carnet de Notes version Personnelle'+' seront désactivées pour ce fichier.'
        MessageBoxA}
  end;
  f948 := True;
    //Free
{
 004C8280    push        ebp
 004C8281    mov         ebp,esp
 004C8283    add         esp,0FFFFFEE8
 004C8289    push        ebx
 004C828A    push        esi
 004C828B    push        edi
 004C828C    xor         ebx,ebx
 004C828E    mov         dword ptr [ebp-114],ebx
 004C8294    mov         dword ptr [ebp-118],ebx
 004C829A    mov         dword ptr [ebp-10C],ebx
 004C82A0    mov         dword ptr [ebp-110],ebx
 004C82A6    mov         ebx,ecx
 004C82A8    mov         dword ptr [ebp-8],edx
 004C82AB    mov         dword ptr [ebp-4],eax
 004C82AE    mov         eax,dword ptr [ebp-8]
 004C82B1    call        @LStrAddRef
 004C82B6    xor         eax,eax
 004C82B8    push        ebp
 004C82B9    push        4C8643
 004C82BE    push        dword ptr fs:[eax]
 004C82C1    mov         dword ptr fs:[eax],esp
 004C82C4    call        004B9E10
 004C82C9    mov         edx,dword ptr [ebp-4]
 004C82CC    mov         byte ptr [edx+910],al
 004C82D2    call        004BC298
 004C82D7    mov         edx,dword ptr [ebp-4]
 004C82DA    mov         byte ptr [edx+911],al
 004C82E0    call        004BC30C
 004C82E5    mov         edx,dword ptr [ebp-4]
 004C82E8    mov         byte ptr [edx+912],al
 004C82EE    mov         dl,1
 004C82F0    mov         eax,[004C9948];TTypeBulletins
 004C82F5    call        TTypeBulletins.Create;TTypeBulletins.Create
 004C82FA    mov         edx,dword ptr [ebp-4]
 004C82FD    mov         dword ptr [edx+914],eax
 004C8303    mov         dl,1
 004C8305    mov         eax,[004B6B1C];TPeriodes
 004C830A    call        TPeriodes.Create;TPeriodes.Create
 004C830F    mov         edx,dword ptr [ebp-4]
 004C8312    mov         dword ptr [edx+918],eax
 004C8318    mov         dl,1
 004C831A    mov         eax,[004B6F04];TEleves
 004C831F    call        TEleves.Create;TEleves.Create
 004C8324    mov         edx,dword ptr [ebp-4]
 004C8327    mov         dword ptr [edx+91C],eax
 004C832D    mov         eax,dword ptr [ebp-4]
 004C8330    mov         byte ptr [eax+948],1
 004C8337    mov         eax,dword ptr [ebp-4]
 004C833A    mov         byte ptr [eax+949],0
 004C8341    mov         eax,dword ptr [ebp-4]
 004C8344    add         eax,0C
 004C8347    mov         edx,dword ptr [ebp-8]
 004C834A    call        @LStrAsg
 004C834F    xor         ecx,ecx
 004C8351    mov         dl,1
 004C8353    mov         eax,[0046937C];TStringGrid
 004C8358    call        TStringGrid.Create;TStringGrid.Create
 004C835D    mov         edx,dword ptr [ebp-4]
 004C8360    mov         dword ptr [edx+924],eax
 004C8366    cmp         dword ptr [ebp-8],0
>004C836A    je          004C8615
 004C8370    xor         eax,eax
 004C8372    push        ebp
 004C8373    push        4C85E8
 004C8378    push        dword ptr fs:[eax]
 004C837B    mov         dword ptr fs:[eax],esp
 004C837E    push        0
 004C8380    mov         ecx,dword ptr [ebp-8]
 004C8383    mov         dl,1
 004C8385    mov         eax,[004B6904];TFluxCdn
 004C838A    call        TFileStream.Create;TFluxCdn.Create
 004C838F    mov         esi,eax
 004C8391    mov         eax,dword ptr [ebp-4]
 004C8394    mov         dword ptr [eax+4],esi
 004C8397    lea         edx,[ebp-108]
 004C839D    mov         eax,esi
 004C839F    call        004B696C   // TFileStream.Create
 004C83A4    lea         edx,[ebp-108]
 004C83AA    mov         eax,dword ptr [ebp-4]
 004C83AD    add         eax,210
 004C83B2    call        @PStrCpy
 004C83B7    mov         eax,dword ptr [ebp-4]
 004C83BA    add         eax,210
 004C83BF    mov         edx,4C8654;'Carnet de notes'
 004C83C4    xor         ecx,ecx
 004C83C6    mov         cl,byte ptr [eax]
 004C83C8    inc         ecx
 004C83C9    call        @AStrCmp
>004C83CE    je          004C83FF
 004C83D0    mov         eax,dword ptr [ebp-4]
 004C83D3    add         eax,210
 004C83D8    mov         edx,4C8664;'Carnet de Notes'
 004C83DD    xor         ecx,ecx
 004C83DF    mov         cl,byte ptr [eax]
 004C83E1    inc         ecx
 004C83E2    call        @AStrCmp
>004C83E7    je          004C83FF
 004C83E9    mov         ecx,4C867C;'Ce fichier n'est pas un fichier Carnet de Notes'
 004C83EE    mov         dl,1
 004C83F0    mov         eax,[004094F8];Exception
 004C83F5    call        Exception.Create;Exception.Create
 004C83FA    call        @RaiseExcept
 004C83FF    lea         edx,[ebp-108]
 004C8405    mov         eax,dword ptr [ebp-4]
 004C8408    mov         eax,dword ptr [eax+4]
 004C840B    call        004B696C
 004C8410    lea         edx,[ebp-108]
 004C8416    mov         eax,dword ptr [ebp-4]
 004C8419    add         eax,110
 004C841E    call        @PStrCpy
 004C8423    mov         eax,dword ptr [ebp-4]
 004C8426    add         eax,110
 004C842B    mov         edx,4C86AC;'2.0'
 004C8430    xor         ecx,ecx
 004C8432    mov         cl,byte ptr [eax]
 004C8434    inc         ecx
 004C8435    call        @AStrCmp
>004C843A    je          004C8548
 004C8440    mov         eax,dword ptr [ebp-4]
 004C8443    add         eax,110
 004C8448    mov         edx,4C86B0;'2.1'
 004C844D    xor         ecx,ecx
 004C844F    mov         cl,byte ptr [eax]
 004C8451    inc         ecx
 004C8452    call        @AStrCmp
>004C8457    je          004C8548
 004C845D    mov         eax,dword ptr [ebp-4]
 004C8460    add         eax,110
 004C8465    mov         edx,4C86B4;'2.2'
 004C846A    xor         ecx,ecx
 004C846C    mov         cl,byte ptr [eax]
 004C846E    inc         ecx
 004C846F    call        @AStrCmp
>004C8474    je          004C8548
 004C847A    mov         eax,dword ptr [ebp-4]
 004C847D    add         eax,110
 004C8482    mov         edx,4C86B8;'2.3'
 004C8487    xor         ecx,ecx
 004C8489    mov         cl,byte ptr [eax]
 004C848B    inc         ecx
 004C848C    call        @AStrCmp
>004C8491    je          004C8548
 004C8497    mov         eax,dword ptr [ebp-4]
 004C849A    lea         ecx,[eax+110]
 004C84A0    mov         eax,dword ptr [ebp-4]
 004C84A3    mov         edx,dword ptr [eax+4]
 004C84A6    mov         eax,dword ptr [ebp-4]
 004C84A9    call        004C66A8
 004C84AE    test        al,al
>004C84B0    jne         004C84CD
 004C84B2    mov         ecx,4C86C4;'Mauvaise version de fichier.'
 004C84B7    mov         dl,1
 004C84B9    mov         eax,[004094F8];Exception
 004C84BE    call        Exception.Create;Exception.Create
 004C84C3    call        @RaiseExcept
>004C84C8    jmp         004C8556
 004C84CD    test        bl,bl
>004C84CF    jne         004C853C
 004C84D1    push        40
 004C84D3    push        4C86E4
 004C84D8    push        4C8710;'Le fichier "'
 004C84DD    lea         edx,[ebp-110]
 004C84E3    mov         eax,dword ptr [ebp-8]
 004C84E6    call        ExtractFileName
 004C84EB    push        dword ptr [ebp-110]
 004C84F1    push        4C8728;'" est un fichier d'une ancienne version de Carnet de Notes.'
 004C84F6    push        4C876C;#13
 004C84FB    push        4C8778;#10
 004C8500    push        4C876C;#13
 004C8505    push        4C8778;#10
 004C850A    push        4C8784;'Son importation dans '
 004C850F    push        4C87A4;'Carnet de Notes version Personnelle'
 004C8514    push        4C87D0;' a été réussie.'
 004C8519    lea         eax,[ebp-10C]
 004C851F    mov         edx,0A
 004C8524    call        @LStrCatN
 004C8529    mov         eax,dword ptr [ebp-10C]
 004C852F    call        @LStrToPChar
 004C8534    push        eax
 004C8535    push        0
 004C8537    call        user32.MessageBoxA
 004C853C    mov         eax,dword ptr [ebp-4]
 004C853F    mov         byte ptr [eax+949],1
>004C8546    jmp         004C8556
 004C8548    mov         cl,byte ptr [ebp+0C]
 004C854B    mov         edx,dword ptr [ebp-8]
 004C854E    mov         eax,dword ptr [ebp-4]
 004C8551    call        004C6E9Cu:jm:m!
 004C8556    mov         eax,dword ptr [ebp-4]
 004C8559    call        004C6654
 004C855E    test        al,al
>004C8560    je          004C85D3
 004C8562    cmp         byte ptr [ebp+8],0
>004C8566    jne         004C85D3
 004C8568    push        40
 004C856A    push        4C86E4
 004C856F    push        4C8710;'Le fichier "'
 004C8574    lea         edx,[ebp-118]
 004C857A    mov         eax,dword ptr [ebp-8]
 004C857D    call        ExtractFileName
 004C8582    push        dword ptr [ebp-118]
 004C8588    push        4C87E8;'" a été créé avec la version Etablissement de Carnet de Notes.'
 004C858D    push        4C876C;#13
 004C8592    push        4C8778;#10
 004C8597    push        4C876C;#13
 004C859C    push        4C8778;#10
 004C85A1    push        4C8830;'Certaines fonctionnalités de '
 004C85A6    push        4C87A4;'Carnet de Notes version Personnelle'
 004C85AB    push        4C8858;' seront désactivées pour ce fichier.'
 004C85B0    lea         eax,[ebp-114]
 004C85B6    mov         edx,0A
 004C85BB    call        @LStrCatN
 004C85C0    mov         eax,dword ptr [ebp-114]
 004C85C6    call        @LStrToPChar
 004C85CB    push        eax
 004C85CC    push        0
 004C85CE    call        user32.MessageBoxA
 004C85D3    mov         eax,dword ptr [ebp-4]
 004C85D6    mov         eax,dword ptr [eax+4]
 004C85D9    call        TObject.Free
 004C85DE    xor         eax,eax
 004C85E0    pop         edx
 004C85E1    pop         ecx
 004C85E2    pop         ecx
 004C85E3    mov         dword ptr fs:[eax],edx
>004C85E6    jmp         004C861D
>004C85E8    jmp         @HandleOnException
 004C85ED    dd          1
 004C85F1    dd          004094F8;Exception
 004C85F5    dd          004C85F9
 004C85F9    mov         eax,dword ptr [ebp-4]
 004C85FC    mov         eax,dword ptr [eax+4]
 004C85FF    call        TObject.Free
 004C8604    mov         eax,dword ptr [ebp-4]
 004C8607    mov         byte ptr [eax+948],0
 004C860E    call        @DoneExcept
>004C8613    jmp         004C861D
 004C8615    mov         eax,dword ptr [ebp-4]
 004C8618    call        004C8880
 004C861D    xor         eax,eax
 004C861F    pop         edx
 004C8620    pop         ecx
 004C8621    pop         ecx
 004C8622    mov         dword ptr fs:[eax],edx
 004C8625    push        4C864A
 004C862A    lea         eax,[ebp-118]
 004C8630    mov         edx,4
 004C8635    call        @LStrArrayClr
 004C863A    lea         eax,[ebp-8]
 004C863D    call        @LStrClr
 004C8642    ret
>004C8643    jmp         @HandleFinally
>004C8648    jmp         004C862A
 004C864A    pop         edi
 004C864B    pop         esi
 004C864C    pop         ebx
 004C864D    mov         esp,ebp
 004C864F    pop         ebp
 004C8650    ret         8
 }
end;

//004C8880
{*////procedure sub_004C8880(?:?);
begin
 004C8880    push        ebp
 004C8881    mov         ebp,esp
 004C8883    xor         ecx,ecx
 004C8885    push        ecx
 004C8886    push        ecx
 004C8887    push        ecx
 004C8888    push        ecx
 004C8889    push        ebx
 004C888A    push        esi
 004C888B    push        edi
 004C888C    mov         ebx,eax
 004C888E    xor         eax,eax
 004C8890    push        ebp
 004C8891    push        4C8A86
 004C8896    push        dword ptr fs:[eax]
 004C8899    mov         dword ptr fs:[eax],esp
 004C889C    mov         esi,4C8A94
 004C88A1    lea         edi,[ebx+10]
 004C88A4    movs        dword ptr [edi],dword ptr [esi]
 004C88A5    movs        dword ptr [edi],dword ptr [esi]
 004C88A6    movs        dword ptr [edi],dword ptr [esi]
 004C88A7    mov         esi,4C8AA0
 004C88AC    lea         edi,[ebx+410]
 004C88B2    mov         ecx,4
 004C88B7    rep movs    dword ptr [edi],dword ptr [esi]
 004C88B9    mov         byte ptr [ebx+510],0
 004C88C0    mov         byte ptr [ebx+610],0
 004C88C7    call        Now
 004C88CC    add         esp,0FFFFFFF8
 004C88CF    fstp        qword ptr [esp]
 004C88D2    wait
 004C88D3    lea         ecx,[ebp-4]
 004C88D6    lea         edx,[ebp-4]
 004C88D9    lea         eax,[ebp-2]
 004C88DC    call        DecodeDate
 004C88E1    lea         edx,[ebp-0C]
 004C88E4    movzx       eax,word ptr [ebp-2]
 004C88E8    call        IntToStr
 004C88ED    push        dword ptr [ebp-0C]
 004C88F0    push        4C8AB8;'/'
 004C88F5    lea         edx,[ebp-10]
 004C88F8    movzx       eax,word ptr [ebp-2]
 004C88FC    add         eax,1
>004C88FF    jno         004C8906
 004C8901    call        @IntOver
 004C8906    call        IntToStr
 004C890B    push        dword ptr [ebp-10]
 004C890E    lea         eax,[ebp-8]
 004C8911    mov         edx,3
 004C8916    call        @LStrCatN
 004C891B    mov         edx,dword ptr [ebp-8]
 004C891E    lea         eax,[ebx+710]
 004C8924    mov         ecx,0FF
 004C8929    call        @LStrToString
 004C892E    mov         byte ptr [ebx+810],0
 004C8935    mov         byte ptr [ebx+310],0
 004C893C    call        004B9E10
 004C8941    mov         byte ptr [ebx+910],al
 004C8947    call        004BC298
 004C894C    mov         byte ptr [ebx+911],al
 004C8952    call        004BC30C
 004C8957    mov         byte ptr [ebx+912],al
 004C895D    lea         eax,[ebx+0C]
 004C8960    lea         edx,[ebx+410]
 004C8966    call        @LStrFromString
 004C896B    mov         dl,1
 004C896D    mov         eax,[004120B8];TStringList
 004C8972    call        TObject.Create;TStringList.Create
 004C8977    mov         dword ptr [ebx+920],eax
 004C897D    mov         esi,34
 004C8982    mov         edx,4C8AC4;'0'
 004C8987    mov         eax,dword ptr [ebx+920]
 004C898D    mov         ecx,dword ptr [eax]
 004C898F    call        dword ptr [ecx+34]
 004C8992    dec         esi
>004C8993    jne         004C8982
 004C8995    mov         dl,1
 004C8997    mov         eax,[004120B8];TStringList
 004C899C    call        TObject.Create;TStringList.Create
 004C89A1    mov         dword ptr [ebx+928],eax
 004C89A7    mov         dl,1
 004C89A9    mov         eax,[004120B8];TStringList
 004C89AE    call        TObject.Create;TStringList.Create
 004C89B3    mov         dword ptr [ebx+92C],eax
 004C89B9    mov         dl,1
 004C89BB    mov         eax,[004120B8];TStringList
 004C89C0    call        TObject.Create;TStringList.Create
 004C89C5    mov         dword ptr [ebx+930],eax
 004C89CB    mov         dl,1
 004C89CD    mov         eax,[004120B8];TStringList
 004C89D2    call        TObject.Create;TStringList.Create
 004C89D7    mov         dword ptr [ebx+938],eax
 004C89DD    mov         dl,1
 004C89DF    mov         eax,[004120B8];TStringList
 004C89E4    call        TObject.Create;TStringList.Create
 004C89E9    mov         dword ptr [ebx+934],eax
 004C89EF    mov         dl,1
 004C89F1    mov         eax,[004120B8];TStringList
 004C89F6    call        TObject.Create;TStringList.Create
 004C89FB    mov         esi,eax
 004C89FD    mov         dword ptr [ebx+93C],esi
 004C8A03    mov         edx,4C8AD0;'classe'
 004C8A08    mov         eax,esi
 004C8A0A    mov         ecx,dword ptr [eax]
 004C8A0C    call        dword ptr [ecx+34];TStringList.Add
 004C8A0F    mov         dl,1
 004C8A11    mov         eax,[004120B8];TStringList
 004C8A16    call        TObject.Create;TStringList.Create
 004C8A1B    mov         dword ptr [ebx+940],eax
 004C8A21    mov         dl,1
 004C8A23    mov         eax,[004120B8];TStringList
 004C8A28    call        TObject.Create;TStringList.Create
 004C8A2D    mov         dword ptr [ebx+944],eax
 004C8A33    mov         esi,dword ptr [ebx+924]
 004C8A39    xor         edx,edx
 004C8A3B    mov         eax,esi
 004C8A3D    call        TCustomGrid.SetFixedCols
 004C8A42    xor         edx,edx
 004C8A44    mov         eax,esi
 004C8A46    call        TCustomGrid.SetFixedRows
 004C8A4B    mov         edx,dword ptr ds:[616030];^gvar_00617902
 004C8A51    movzx       edx,byte ptr [edx]
 004C8A54    mov         eax,esi
 004C8A56    call        TCustomGrid.SetRowCount
 004C8A5B    mov         edx,1
 004C8A60    mov         eax,esi
 004C8A62    call        TCustomGrid.SetColCount
 004C8A67    mov         byte ptr [ebx+8],1
 004C8A6B    xor         eax,eax
 004C8A6D    pop         edx
 004C8A6E    pop         ecx
 004C8A6F    pop         ecx
 004C8A70    mov         dword ptr fs:[eax],edx
 004C8A73    push        4C8A8D
 004C8A78    lea         eax,[ebp-10]
 004C8A7B    mov         edx,3
 004C8A80    call        @LStrArrayClr
 004C8A85    ret
>004C8A86    jmp         @HandleFinally
>004C8A8B    jmp         004C8A78
 004C8A8D    pop         edi
 004C8A8E    pop         esi
 004C8A8F    pop         ebx
 004C8A90    mov         esp,ebp
 004C8A92    pop         ebp
 004C8A93    ret
//end;//*}

//004C8AD8
{*function sub_004C8AD8(?:?):?;
begin
 004C8AD8    mov         al,byte ptr [eax+911]
 004C8ADE    ret
//end;//*}

//004C8AE0
{*function sub_004C8AE0(?:?):?;
begin
 004C8AE0    mov         al,byte ptr [eax+912]
 004C8AE6    ret
//end;//*}

//004C8AE8
{*function sub_004C8AE8(?:TFichierCdn):?;
begin
 004C8AE8    mov         eax,dword ptr [eax+914]
 004C8AEE    call        004C9B8C
 004C8AF3    ret
//end;//*}

//004C8AF4
{*////procedure sub_004C8AF4(?:dword; ?:?; ?:PShortString);
begin
 004C8AF4    push        ebp
 004C8AF5    mov         ebp,esp
 004C8AF7    push        0
 004C8AF9    push        ebx
 004C8AFA    push        esi
 004C8AFB    push        edi
 004C8AFC    mov         edi,ecx
 004C8AFE    mov         ebx,edx
 004C8B00    mov         esi,eax
 004C8B02    xor         eax,eax
 004C8B04    push        ebp
 004C8B05    push        4C8B45
 004C8B0A    push        dword ptr fs:[eax]
 004C8B0D    mov         dword ptr fs:[eax],esp
 004C8B10    lea         ecx,[ebp-4]
 004C8B13    mov         edx,ebx
 004C8B15    mov         eax,dword ptr [esi+914]
 004C8B1B    call        004C9AEC
 004C8B20    mov         edx,dword ptr [ebp-4]
 004C8B23    mov         eax,edi
 004C8B25    mov         ecx,0FF
 004C8B2A    call        @LStrToString
 004C8B2F    xor         eax,eax
 004C8B31    pop         edx
 004C8B32    pop         ecx
 004C8B33    pop         ecx
 004C8B34    mov         dword ptr fs:[eax],edx
 004C8B37    push        4C8B4C
 004C8B3C    lea         eax,[ebp-4]
 004C8B3F    call        @LStrClr
 004C8B44    ret
>004C8B45    jmp         @HandleFinally
>004C8B4A    jmp         004C8B3C
 004C8B4C    pop         edi
 004C8B4D    pop         esi
 004C8B4E    pop         ebx
 004C8B4F    pop         ecx
 004C8B50    pop         ebp
 004C8B51    ret
//end;//*}

//004C8B54
////procedure sub_004C8B54(?:TFichierCdn; ?:PShortString);
//begin
{*
 004C8B54    push        ebp
 004C8B55    mov         ebp,esp
 004C8B57    push        0
 004C8B59    push        ebx
 004C8B5A    push        esi
 004C8B5B    mov         esi,edx
 004C8B5D    mov         ebx,eax
 004C8B5F    xor         eax,eax
 004C8B61    push        ebp
 004C8B62    push        4C8BA0
 004C8B67    push        dword ptr fs:[eax]
 004C8B6A    mov         dword ptr fs:[eax],esp
 004C8B6D    lea         edx,[ebp-4]
 004C8B70    mov         eax,dword ptr [ebx+914]
 004C8B76    call        004C9BAC
 004C8B7B    mov         edx,dword ptr [ebp-4]
 004C8B7E    mov         eax,esi
 004C8B80    mov         ecx,0FF
 004C8B85    call        @LStrToString
 004C8B8A    xor         eax,eax
 004C8B8C    pop         edx
 004C8B8D    pop         ecx
 004C8B8E    pop         ecx
 004C8B8F    mov         dword ptr fs:[eax],edx
 004C8B92    push        4C8BA7
 004C8B97    lea         eax,[ebp-4]
 004C8B9A    call        @LStrClr
 004C8B9F    ret
>004C8BA0    jmp         @HandleFinally
>004C8BA5    jmp         004C8B97
 004C8BA7    pop         esi
 004C8BA8    pop         ebx
 004C8BA9    pop         ecx
 004C8BAA    pop         ebp
 004C8BAB    ret
//*}
//end;

//004C8BAC
{*function sub_004C8BAC(?:TFichierCdn):?;
begin
 004C8BAC    mov         eax,dword ptr [eax+914]
 004C8BB2    call        004C9BA8
 004C8BB7    ret
//end;//*}

//004C8BB8
////procedure sub_004C8BB8(?:TFichierCdn; ?:dword; ?:PShortString);
//begin
{*
 004C8BB8    push        ebp
 004C8BB9    mov         ebp,esp
 004C8BBB    add         esp,0FFFFFFF8
 004C8BBE    push        ebx
 004C8BBF    push        esi
 004C8BC0    xor         ebx,ebx
 004C8BC2    mov         dword ptr [ebp-8],ebx
 004C8BC5    mov         dword ptr [ebp-4],ecx
 004C8BC8    mov         ebx,edx
 004C8BCA    mov         esi,eax
 004C8BCC    xor         eax,eax
 004C8BCE    push        ebp
 004C8BCF    push        4C8C1C
 004C8BD4    push        dword ptr fs:[eax]
 004C8BD7    mov         dword ptr fs:[eax],esp
 004C8BDA    lea         ecx,[ebp-8]
 004C8BDD    xor         edx,edx
 004C8BDF    mov         dl,bl
 004C8BE1    sub         edx,1
>004C8BE4    jno         004C8BEB
 004C8BE6    call        @IntOver
 004C8BEB    mov         eax,dword ptr [esi+930]
 004C8BF1    mov         ebx,dword ptr [eax]
 004C8BF3    call        dword ptr [ebx+0C]
 004C8BF6    mov         edx,dword ptr [ebp-8]
 004C8BF9    mov         eax,dword ptr [ebp-4]
 004C8BFC    mov         ecx,0FF
 004C8C01    call        @LStrToString
 004C8C06    xor         eax,eax
 004C8C08    pop         edx
 004C8C09    pop         ecx
 004C8C0A    pop         ecx
 004C8C0B    mov         dword ptr fs:[eax],edx
 004C8C0E    push        4C8C23
 004C8C13    lea         eax,[ebp-8]
 004C8C16    call        @LStrClr
 004C8C1B    ret
>004C8C1C    jmp         @HandleFinally
>004C8C21    jmp         004C8C13
 004C8C23    pop         esi
 004C8C24    pop         ebx
 004C8C25    pop         ecx
 004C8C26    pop         ecx
 004C8C27    pop         ebp
 004C8C28    ret
//*}
//end;

//004C8C2C
{*////procedure sub_004C8C2C(?:dword; ?:?; ?:PShortString);
begin
 004C8C2C    push        ebp
 004C8C2D    mov         ebp,esp
 004C8C2F    add         esp,0FFFFFEFC
 004C8C35    push        ebx
 004C8C36    push        esi
 004C8C37    push        edi
 004C8C38    xor         ebx,ebx
 004C8C3A    mov         dword ptr [ebp-104],ebx
 004C8C40    mov         esi,ecx
 004C8C42    lea         edi,[ebp-100]
 004C8C48    xor         ecx,ecx
 004C8C4A    mov         cl,byte ptr [esi]
 004C8C4C    inc         ecx
 004C8C4D    rep movs    byte ptr [edi],byte ptr [esi]
 004C8C4F    mov         ebx,edx
 004C8C51    mov         esi,eax
 004C8C53    xor         eax,eax
 004C8C55    push        ebp
 004C8C56    push        4C8CAA
 004C8C5B    push        dword ptr fs:[eax]
 004C8C5E    mov         dword ptr fs:[eax],esp
 004C8C61    lea         eax,[ebp-104]
 004C8C67    lea         edx,[ebp-100]
 004C8C6D    call        @LStrFromString
 004C8C72    mov         ecx,dword ptr [ebp-104]
 004C8C78    xor         edx,edx
 004C8C7A    mov         dl,bl
 004C8C7C    sub         edx,1
>004C8C7F    jno         004C8C86
 004C8C81    call        @IntOver
 004C8C86    mov         eax,dword ptr [esi+930]
 004C8C8C    mov         ebx,dword ptr [eax]
 004C8C8E    call        dword ptr [ebx+20]
 004C8C91    xor         eax,eax
 004C8C93    pop         edx
 004C8C94    pop         ecx
 004C8C95    pop         ecx
 004C8C96    mov         dword ptr fs:[eax],edx
 004C8C99    push        4C8CB1
 004C8C9E    lea         eax,[ebp-104]
 004C8CA4    call        @LStrClr
 004C8CA9    ret
>004C8CAA    jmp         @HandleFinally
>004C8CAF    jmp         004C8C9E
 004C8CB1    pop         edi
 004C8CB2    pop         esi
 004C8CB3    pop         ebx
 004C8CB4    mov         esp,ebp
 004C8CB6    pop         ebp
 004C8CB7    ret
//end;//*}

//004C8CB8
{*////procedure sub_004C8CB8(?:?; ?:?; ?:PShortString);
begin
 004C8CB8    push        ebp
 004C8CB9    mov         ebp,esp
 004C8CBB    push        0
 004C8CBD    push        0
 004C8CBF    push        0
 004C8CC1    push        ebx
 004C8CC2    push        esi
 004C8CC3    push        edi
 004C8CC4    mov         dword ptr [ebp-4],ecx
 004C8CC7    mov         ebx,edx
 004C8CC9    mov         esi,eax
 004C8CCB    xor         eax,eax
 004C8CCD    push        ebp
 004C8CCE    push        4C8D5A
 004C8CD3    push        dword ptr fs:[eax]
 004C8CD6    mov         dword ptr fs:[eax],esp
 004C8CD9    xor         eax,eax
 004C8CDB    push        ebp
 004C8CDC    push        4C8D2D
 004C8CE1    push        dword ptr fs:[eax]
 004C8CE4    mov         dword ptr fs:[eax],esp
 004C8CE7    lea         ecx,[ebp-0C]
 004C8CEA    xor         edx,edx
 004C8CEC    mov         dl,bl
 004C8CEE    sub         edx,1
>004C8CF1    jno         004C8CF8
 004C8CF3    call        @IntOver
 004C8CF8    mov         eax,dword ptr [esi+934]
 004C8CFE    mov         ebx,dword ptr [eax]
 004C8D00    call        dword ptr [ebx+0C]
 004C8D03    mov         eax,dword ptr [ebp-0C]
 004C8D06    call        StrToInt
 004C8D0B    lea         edx,[ebp-8]
 004C8D0E    call        IntToStr
 004C8D13    mov         edx,dword ptr [ebp-8]
 004C8D16    mov         eax,dword ptr [ebp-4]
 004C8D19    mov         ecx,0FF
 004C8D1E    call        @LStrToString
 004C8D23    xor         eax,eax
 004C8D25    pop         edx
 004C8D26    pop         ecx
 004C8D27    pop         ecx
 004C8D28    mov         dword ptr fs:[eax],edx
>004C8D2B    jmp         004C8D3F
>004C8D2D    jmp         @HandleAnyException
 004C8D32    mov         eax,dword ptr [ebp-4]
 004C8D35    mov         word ptr [eax],3101
 004C8D3A    call        @DoneExcept
 004C8D3F    xor         eax,eax
 004C8D41    pop         edx
 004C8D42    pop         ecx
 004C8D43    pop         ecx
 004C8D44    mov         dword ptr fs:[eax],edx
 004C8D47    push        4C8D61
 004C8D4C    lea         eax,[ebp-0C]
 004C8D4F    mov         edx,2
 004C8D54    call        @LStrArrayClr
 004C8D59    ret
>004C8D5A    jmp         @HandleFinally
>004C8D5F    jmp         004C8D4C
 004C8D61    pop         edi
 004C8D62    pop         esi
 004C8D63    pop         ebx
 004C8D64    mov         esp,ebp
 004C8D66    pop         ebp
 004C8D67    ret
//end;//*}

//004C8D68
{*function sub_004C8D68(?:?):?;
begin
 004C8D68    push        ebx
 004C8D69    mov         ebx,eax
 004C8D6B    mov         eax,dword ptr [ebx+93C]
 004C8D71    mov         edx,dword ptr [eax]
 004C8D73    call        dword ptr [edx+14]
 004C8D76    cmp         eax,0FF
>004C8D7B    jbe         004C8D82
 004C8D7D    call        @BoundErr
 004C8D82    pop         ebx
 004C8D83    ret
//end;//*}

//004C8D84
{*////procedure sub_004C8D84(?:?; ?:?; ?:PShortString);
begin
 004C8D84    push        ebp
 004C8D85    mov         ebp,esp
 004C8D87    add         esp,0FFFFFFF8
 004C8D8A    push        ebx
 004C8D8B    push        esi
 004C8D8C    xor         ebx,ebx
 004C8D8E    mov         dword ptr [ebp-8],ebx
 004C8D91    mov         dword ptr [ebp-4],ecx
 004C8D94    mov         ebx,edx
 004C8D96    mov         esi,eax
 004C8D98    xor         eax,eax
 004C8D9A    push        ebp
 004C8D9B    push        4C8DE8
 004C8DA0    push        dword ptr fs:[eax]
 004C8DA3    mov         dword ptr fs:[eax],esp
 004C8DA6    lea         ecx,[ebp-8]
 004C8DA9    xor         edx,edx
 004C8DAB    mov         dl,bl
 004C8DAD    sub         edx,1
>004C8DB0    jno         004C8DB7
 004C8DB2    call        @IntOver
 004C8DB7    mov         eax,dword ptr [esi+93C]
 004C8DBD    mov         ebx,dword ptr [eax]
 004C8DBF    call        dword ptr [ebx+0C]
 004C8DC2    mov         edx,dword ptr [ebp-8]
 004C8DC5    mov         eax,dword ptr [ebp-4]
 004C8DC8    mov         ecx,0FF
 004C8DCD    call        @LStrToString
 004C8DD2    xor         eax,eax
 004C8DD4    pop         edx
 004C8DD5    pop         ecx
 004C8DD6    pop         ecx
 004C8DD7    mov         dword ptr fs:[eax],edx
 004C8DDA    push        4C8DEF
 004C8DDF    lea         eax,[ebp-8]
 004C8DE2    call        @LStrClr
 004C8DE7    ret
>004C8DE8    jmp         @HandleFinally
>004C8DED    jmp         004C8DDF
 004C8DEF    pop         esi
 004C8DF0    pop         ebx
 004C8DF1    pop         ecx
 004C8DF2    pop         ecx
 004C8DF3    pop         ebp
 004C8DF4    ret
//end;//*}

//004C8DF8
{*////procedure sub_004C8DF8(?:TFichierCdn; ?:?; ?:?);
begin
 004C8DF8    push        ebx
 004C8DF9    push        esi
 004C8DFA    mov         esi,eax
 004C8DFC    test        cl,cl
>004C8DFE    je          004C8E23
 004C8E00    xor         eax,eax
 004C8E02    mov         al,dl
 004C8E04    sub         eax,1
>004C8E07    jno         004C8E0E
 004C8E09    call        @IntOver
 004C8E0E    mov         edx,eax
 004C8E10    mov         ecx,4C8E4C;'R'
 004C8E15    mov         eax,dword ptr [esi+938]
 004C8E1B    mov         ebx,dword ptr [eax]
 004C8E1D    call        dword ptr [ebx+20]
 004C8E20    pop         esi
 004C8E21    pop         ebx
 004C8E22    ret
 004C8E23    xor         eax,eax
 004C8E25    mov         al,dl
 004C8E27    sub         eax,1
>004C8E2A    jno         004C8E31
 004C8E2C    call        @IntOver
 004C8E31    mov         edx,eax
 004C8E33    xor         ecx,ecx
 004C8E35    mov         eax,dword ptr [esi+938]
 004C8E3B    mov         ebx,dword ptr [eax]
 004C8E3D    call        dword ptr [ebx+20]
 004C8E40    pop         esi
 004C8E41    pop         ebx
 004C8E42    ret
//end;//*}

//004C8E50
{*function sub_004C8E50(?:TFichierCdn; ?:dword):?;
begin
 004C8E50    push        ebp
 004C8E51    mov         ebp,esp
 004C8E53    push        0
 004C8E55    push        ebx
 004C8E56    push        esi
 004C8E57    mov         ebx,edx
 004C8E59    mov         esi,eax
 004C8E5B    xor         eax,eax
 004C8E5D    push        ebp
 004C8E5E    push        4C8EAD
 004C8E63    push        dword ptr fs:[eax]
 004C8E66    mov         dword ptr fs:[eax],esp
 004C8E69    lea         ecx,[ebp-4]
 004C8E6C    xor         edx,edx
 004C8E6E    mov         dl,bl
 004C8E70    sub         edx,1
>004C8E73    jno         004C8E7A
 004C8E75    call        @IntOver
 004C8E7A    mov         eax,dword ptr [esi+938]
 004C8E80    mov         ebx,dword ptr [eax]
 004C8E82    call        dword ptr [ebx+0C]
 004C8E85    mov         eax,dword ptr [ebp-4]
 004C8E88    mov         edx,4C8EC4;'R'
 004C8E8D    call        @LStrCmp
 004C8E92    sete        al
 004C8E95    mov         ebx,eax
 004C8E97    xor         eax,eax
 004C8E99    pop         edx
 004C8E9A    pop         ecx
 004C8E9B    pop         ecx
 004C8E9C    mov         dword ptr fs:[eax],edx
 004C8E9F    push        4C8EB4
 004C8EA4    lea         eax,[ebp-4]
 004C8EA7    call        @LStrClr
 004C8EAC    ret
>004C8EAD    jmp         @HandleFinally
>004C8EB2    jmp         004C8EA4
 004C8EB4    mov         eax,ebx
 004C8EB6    pop         esi
 004C8EB7    pop         ebx
 004C8EB8    pop         ecx
 004C8EB9    pop         ebp
 004C8EBA    ret
//end;//*}

//004C8EC8
{*function sub_004C8EC8(?:dword; ?:?; ?:?; ?:?):?;
begin
 004C8EC8    push        ebp
 004C8EC9    mov         ebp,esp
 004C8ECB    push        ecx
 004C8ECC    push        ebx
 004C8ECD    push        esi
 004C8ECE    mov         byte ptr [ebp-1],cl
 004C8ED1    mov         ebx,edx
 004C8ED3    mov         esi,eax
 004C8ED5    cmp         byte ptr [ebp+8],0
>004C8ED9    je          004C8F19
 004C8EDB    mov         eax,esi
 004C8EDD    call        004BEA58
 004C8EE2    and         eax,0FF
 004C8EE7    mov         edx,dword ptr ds:[6162F0];^gvar_00617901
 004C8EED    movzx       edx,byte ptr [edx]
 004C8EF0    add         eax,edx
>004C8EF2    jno         004C8EF9
 004C8EF4    call        @IntOver
 004C8EF9    cmp         eax,0FF
>004C8EFE    jbe         004C8F05
 004C8F00    call        @BoundErr
 004C8F05    push        eax
 004C8F06    push        4C8F5C
 004C8F0B    mov         cl,byte ptr [ebp-1]
 004C8F0E    mov         edx,ebx
 004C8F10    mov         eax,esi
 004C8F12    call        004C0C88
>004C8F17    jmp         004C8F55
 004C8F19    mov         eax,esi
 004C8F1B    call        004BEA58
 004C8F20    and         eax,0FF
 004C8F25    mov         edx,dword ptr ds:[6162F0];^gvar_00617901
 004C8F2B    movzx       edx,byte ptr [edx]
 004C8F2E    add         eax,edx
>004C8F30    jno         004C8F37
 004C8F32    call        @IntOver
 004C8F37    cmp         eax,0FF
>004C8F3C    jbe         004C8F43
 004C8F3E    call        @BoundErr
 004C8F43    push        eax
 004C8F44    push        4C8F64
 004C8F49    mov         cl,byte ptr [ebp-1]
 004C8F4C    mov         edx,ebx
 004C8F4E    mov         eax,esi
 004C8F50    call        004C0C88
 004C8F55    pop         esi
 004C8F56    pop         ebx
 004C8F57    pop         ecx
 004C8F58    pop         ebp
 004C8F59    ret         4
//end;//*}

//004C8F6C
{*////procedure sub_004C8F6C(?:dword; ?:?; ?:?; ?:?; ?:?);
begin
 004C8F6C    push        ebp
 004C8F6D    mov         ebp,esp
 004C8F6F    add         esp,0FFFFFEFC
 004C8F75    push        ebx
 004C8F76    push        esi
 004C8F77    mov         byte ptr [ebp-1],cl
 004C8F7A    mov         ebx,edx
 004C8F7C    mov         esi,eax
 004C8F7E    mov         eax,dword ptr [ebp+8]
 004C8F81    push        eax
 004C8F82    lea         eax,[ebp-104]
 004C8F88    push        eax
 004C8F89    mov         cl,byte ptr [ebp-1]
 004C8F8C    mov         edx,ebx
 004C8F8E    mov         eax,esi
 004C8F90    call        004C8FB0
 004C8F95    lea         edx,[ebp-104]
 004C8F9B    mov         cl,byte ptr [ebp+0C]
 004C8F9E    mov         eax,esi
 004C8FA0    call        004C2410
 004C8FA5    pop         esi
 004C8FA6    pop         ebx
 004C8FA7    mov         esp,ebp
 004C8FA9    pop         ebp
 004C8FAA    ret         8
//end;//*}

//004C8FB0
{*////procedure sub_004C8FB0(?:?; ?:?; ?:?; ?:?);
begin
 004C8FB0    push        ebp
 004C8FB1    mov         ebp,esp
 004C8FB3    add         esp,0FFFFFDA0
 004C8FB9    push        ebx
 004C8FBA    push        esi
 004C8FBB    push        edi
 004C8FBC    xor         ebx,ebx
 004C8FBE    mov         dword ptr [ebp-25C],ebx
 004C8FC4    mov         dword ptr [ebp-258],ebx
 004C8FCA    mov         dword ptr [ebp-254],ebx
 004C8FD0    mov         dword ptr [ebp-250],ebx
 004C8FD6    mov         byte ptr [ebp-6],cl
 004C8FD9    mov         byte ptr [ebp-5],dl
 004C8FDC    mov         dword ptr [ebp-4],eax
 004C8FDF    xor         eax,eax
 004C8FE1    push        ebp
 004C8FE2    push        4C925D
 004C8FE7    push        dword ptr fs:[eax]
 004C8FEA    mov         dword ptr fs:[eax],esp
 004C8FED    xor         eax,eax
 004C8FEF    mov         dword ptr [ebp-38],eax
 004C8FF2    mov         dword ptr [ebp-34],eax
 004C8FF5    mov         word ptr [ebp-30],ax
 004C8FF9    xor         eax,eax
 004C8FFB    mov         dword ptr [ebp-48],eax
 004C8FFE    mov         dword ptr [ebp-44],eax
 004C9001    mov         word ptr [ebp-40],ax
 004C9005    mov         dl,byte ptr [ebp-5]
 004C9008    mov         eax,dword ptr [ebp-4]
 004C900B    call        004BEAD0
 004C9010    and         eax,0FF
 004C9015    test        eax,eax
>004C9017    jle         004C91DC
 004C901D    mov         dword ptr [ebp-4C],eax
 004C9020    mov         dword ptr [ebp-0C],1
 004C9027    lea         eax,[ebp-14C]
 004C902D    push        eax
 004C902E    mov         ebx,dword ptr [ebp-0C]
 004C9031    cmp         ebx,0FF
>004C9037    jbe         004C903E
 004C9039    call        @BoundErr
 004C903E    mov         ecx,ebx
 004C9040    mov         dl,byte ptr [ebp-5]
 004C9043    mov         eax,dword ptr [ebp-4]
 004C9046    call        004BEDCC
 004C904B    lea         eax,[ebp-14C]
 004C9051    mov         edx,4C9270;'oui'
 004C9056    xor         ecx,ecx
 004C9058    mov         cl,byte ptr [eax]
 004C905A    inc         ecx
 004C905B    call        @AStrCmp
>004C9060    jne         004C91D0
 004C9066    lea         eax,[ebp-24C]
 004C906C    push        eax
 004C906D    mov         eax,dword ptr [ebp-0C]
 004C9070    cmp         eax,0FF
>004C9075    jbe         004C907C
 004C9077    call        @BoundErr
 004C907C    mov         ecx,ebx
 004C907E    mov         dl,byte ptr [ebp-5]
 004C9081    mov         eax,dword ptr [ebp-4]
 004C9084    call        004BEF0C
 004C9089    lea         eax,[ebp-24C]
 004C908F    mov         edx,4C9274;'Oral'
 004C9094    xor         ecx,ecx
 004C9096    mov         cl,byte ptr [eax]
 004C9098    inc         ecx
 004C9099    call        @AStrCmp
>004C909E    jne         004C91D0
 004C90A4    xor         eax,eax
 004C90A6    push        ebp
 004C90A7    push        4C91A4
 004C90AC    push        dword ptr fs:[eax]
 004C90AF    mov         dword ptr fs:[eax],esp
 004C90B2    lea         eax,[ebp-14C]
 004C90B8    push        eax
 004C90B9    mov         eax,dword ptr [ebp-0C]
 004C90BC    cmp         eax,0FF
>004C90C1    jbe         004C90C8
 004C90C3    call        @BoundErr
 004C90C8    mov         ecx,ebx
 004C90CA    mov         dl,byte ptr [ebp-5]
 004C90CD    mov         eax,dword ptr [ebp-4]
 004C90D0    call        004BED7C
 004C90D5    lea         edx,[ebp-14C]
 004C90DB    lea         eax,[ebp-250]
 004C90E1    call        @LStrFromString
 004C90E6    mov         eax,dword ptr [ebp-250]
 004C90EC    call        StrToFloat
 004C90F1    fstp        tbyte ptr [ebp-18]
 004C90F4    wait
 004C90F5    lea         eax,[ebp-14C]
 004C90FB    push        eax
 004C90FC    mov         eax,dword ptr [ebp-0C]
 004C90FF    cmp         eax,0FF
>004C9104    jbe         004C910B
 004C9106    call        @BoundErr
 004C910B    mov         ecx,ebx
 004C910D    mov         dl,byte ptr [ebp-5]
 004C9110    mov         eax,dword ptr [ebp-4]
 004C9113    call        004BED2C
 004C9118    lea         edx,[ebp-14C]
 004C911E    lea         eax,[ebp-254]
 004C9124    call        @LStrFromString
 004C9129    mov         eax,dword ptr [ebp-254]
 004C912F    call        StrToFloat
 004C9134    fstp        tbyte ptr [ebp-28]
 004C9137    wait
 004C9138    mov         al,byte ptr [ebp-6]
 004C913B    push        eax
 004C913C    lea         eax,[ebp-14C]
 004C9142    push        eax
 004C9143    mov         eax,dword ptr [ebp-0C]
 004C9146    cmp         eax,0FF
>004C914B    jbe         004C9152
 004C914D    call        @BoundErr
 004C9152    mov         ecx,ebx
 004C9154    mov         dl,byte ptr [ebp-5]
 004C9157    mov         eax,dword ptr [ebp-4]
 004C915A    call        004BEF5C
 004C915F    lea         edx,[ebp-14C]
 004C9165    lea         eax,[ebp-258]
 004C916B    call        @LStrFromString
 004C9170    mov         eax,dword ptr [ebp-258]
 004C9176    call        StrToFloat
 004C917B    fld         tbyte ptr [ebp-18]
 004C917E    fmulp       st(1),st
 004C9180    fld         tbyte ptr [ebp-38]
 004C9183    faddp       st(1),st
 004C9185    fstp        tbyte ptr [ebp-38]
 004C9188    wait
 004C9189    fld         tbyte ptr [ebp-28]
 004C918C    fld         tbyte ptr [ebp-18]
 004C918F    fmulp       st(1),st
 004C9191    fld         tbyte ptr [ebp-48]
 004C9194    faddp       st(1),st
 004C9196    fstp        tbyte ptr [ebp-48]
 004C9199    wait
 004C919A    xor         eax,eax
 004C919C    pop         edx
 004C919D    pop         ecx
 004C919E    pop         ecx
 004C919F    mov         dword ptr fs:[eax],edx
>004C91A2    jmp         004C91D0
>004C91A4    jmp         @HandleOnException
 004C91A9    dd          2
 004C91AD    dd          00409B50;EConvertError
 004C91B1    dd          004C91BD
 004C91B5    dd          004098E0;EMathError
 004C91B9    dd          004C91C4
 004C91BD    call        @DoneExcept
>004C91C2    jmp         004C91D0
 004C91C4    call        @DoneExcept
>004C91C9    jmp         004C91D0
 004C91CB    call        @DoneExcept
 004C91D0    inc         dword ptr [ebp-0C]
 004C91D3    dec         dword ptr [ebp-4C]
>004C91D6    jne         004C9027
 004C91DC    fld         tbyte ptr [ebp-48]
 004C91DF    fcomp       dword ptr ds:[4C927C];0:Single
 004C91E5    fnstsw      al
 004C91E7    sahf
>004C91E8    je          004C9239
 004C91EA    call        004B9E48
 004C91EF    mov         dword ptr [ebp-260],eax
 004C91F5    fild        dword ptr [ebp-260]
 004C91FB    fld         tbyte ptr [ebp-38]
 004C91FE    fld         tbyte ptr [ebp-48]
 004C9201    fdivp       st(1),st
 004C9203    fmulp       st(1),st
 004C9205    add         esp,0FFFFFFF4
 004C9208    fstp        tbyte ptr [esp]
 004C920B    wait
 004C920C    lea         eax,[ebp-25C]
 004C9212    push        eax
 004C9213    mov         ecx,2
 004C9218    mov         edx,12
 004C921D    mov         al,2
 004C921F    call        FloatToStrF
 004C9224    mov         edx,dword ptr [ebp-25C]
 004C922A    mov         eax,dword ptr [ebp+8]
 004C922D    mov         ecx,0FF
 004C9232    call        @LStrToString
>004C9237    jmp         004C923F
 004C9239    mov         eax,dword ptr [ebp+8]
 004C923C    mov         byte ptr [eax],0
 004C923F    xor         eax,eax
 004C9241    pop         edx
 004C9242    pop         ecx
 004C9243    pop         ecx
 004C9244    mov         dword ptr fs:[eax],edx
 004C9247    push        4C9264
 004C924C    lea         eax,[ebp-25C]
 004C9252    mov         edx,4
 004C9257    call        @LStrArrayClr
 004C925C    ret
>004C925D    jmp         @HandleFinally
>004C9262    jmp         004C924C
 004C9264    pop         edi
 004C9265    pop         esi
 004C9266    pop         ebx
 004C9267    mov         esp,ebp
 004C9269    pop         ebp
 004C926A    ret         4
//end;//*}

//004C9280
{*////procedure sub_004C9280(?:dword; ?:?; ?:?; ?:?; ?:?);
begin
 004C9280    push        ebp
 004C9281    mov         ebp,esp
 004C9283    add         esp,0FFFFFEFC
 004C9289    push        ebx
 004C928A    push        esi
 004C928B    mov         byte ptr [ebp-1],cl
 004C928E    mov         ebx,edx
 004C9290    mov         esi,eax
 004C9292    mov         eax,dword ptr [ebp+8]
 004C9295    push        eax
 004C9296    lea         eax,[ebp-104]
 004C929C    push        eax
 004C929D    mov         cl,byte ptr [ebp-1]
 004C92A0    mov         edx,ebx
 004C92A2    mov         eax,esi
 004C92A4    call        004C92C4
 004C92A9    lea         edx,[ebp-104]
 004C92AF    mov         cl,byte ptr [ebp+0C]
 004C92B2    mov         eax,esi
 004C92B4    call        004C2410
 004C92B9    pop         esi
 004C92BA    pop         ebx
 004C92BB    mov         esp,ebp
 004C92BD    pop         ebp
 004C92BE    ret         8
//end;//*}

//004C92C4
{*////procedure sub_004C92C4(?:?; ?:?; ?:?; ?:?);
begin
 004C92C4    push        ebp
 004C92C5    mov         ebp,esp
 004C92C7    add         esp,0FFFFFDA0
 004C92CD    push        ebx
 004C92CE    push        esi
 004C92CF    push        edi
 004C92D0    xor         ebx,ebx
 004C92D2    mov         dword ptr [ebp-25C],ebx
 004C92D8    mov         dword ptr [ebp-258],ebx
 004C92DE    mov         dword ptr [ebp-254],ebx
 004C92E4    mov         dword ptr [ebp-250],ebx
 004C92EA    mov         byte ptr [ebp-6],cl
 004C92ED    mov         byte ptr [ebp-5],dl
 004C92F0    mov         dword ptr [ebp-4],eax
 004C92F3    xor         eax,eax
 004C92F5    push        ebp
 004C92F6    push        4C9571
 004C92FB    push        dword ptr fs:[eax]
 004C92FE    mov         dword ptr fs:[eax],esp
 004C9301    xor         eax,eax
 004C9303    mov         dword ptr [ebp-38],eax
 004C9306    mov         dword ptr [ebp-34],eax
 004C9309    mov         word ptr [ebp-30],ax
 004C930D    xor         eax,eax
 004C930F    mov         dword ptr [ebp-48],eax
 004C9312    mov         dword ptr [ebp-44],eax
 004C9315    mov         word ptr [ebp-40],ax
 004C9319    mov         dl,byte ptr [ebp-5]
 004C931C    mov         eax,dword ptr [ebp-4]
 004C931F    call        004BEAD0
 004C9324    and         eax,0FF
 004C9329    test        eax,eax
>004C932B    jle         004C94F0
 004C9331    mov         dword ptr [ebp-4C],eax
 004C9334    mov         dword ptr [ebp-0C],1
 004C933B    lea         eax,[ebp-14C]
 004C9341    push        eax
 004C9342    mov         ebx,dword ptr [ebp-0C]
 004C9345    cmp         ebx,0FF
>004C934B    jbe         004C9352
 004C934D    call        @BoundErr
 004C9352    mov         ecx,ebx
 004C9354    mov         dl,byte ptr [ebp-5]
 004C9357    mov         eax,dword ptr [ebp-4]
 004C935A    call        004BEDCC
 004C935F    lea         eax,[ebp-14C]
 004C9365    mov         edx,4C9584;'oui'
 004C936A    xor         ecx,ecx
 004C936C    mov         cl,byte ptr [eax]
 004C936E    inc         ecx
 004C936F    call        @AStrCmp
>004C9374    jne         004C94E4
 004C937A    lea         eax,[ebp-24C]
 004C9380    push        eax
 004C9381    mov         eax,dword ptr [ebp-0C]
 004C9384    cmp         eax,0FF
>004C9389    jbe         004C9390
 004C938B    call        @BoundErr
 004C9390    mov         ecx,ebx
 004C9392    mov         dl,byte ptr [ebp-5]
 004C9395    mov         eax,dword ptr [ebp-4]
 004C9398    call        004BEF0C
 004C939D    lea         eax,[ebp-24C]
 004C93A3    mov         edx,4C9588;'Ecrit'
 004C93A8    xor         ecx,ecx
 004C93AA    mov         cl,byte ptr [eax]
 004C93AC    inc         ecx
 004C93AD    call        @AStrCmp
>004C93B2    jne         004C94E4
 004C93B8    xor         eax,eax
 004C93BA    push        ebp
 004C93BB    push        4C94B8
 004C93C0    push        dword ptr fs:[eax]
 004C93C3    mov         dword ptr fs:[eax],esp
 004C93C6    lea         eax,[ebp-14C]
 004C93CC    push        eax
 004C93CD    mov         eax,dword ptr [ebp-0C]
 004C93D0    cmp         eax,0FF
>004C93D5    jbe         004C93DC
 004C93D7    call        @BoundErr
 004C93DC    mov         ecx,ebx
 004C93DE    mov         dl,byte ptr [ebp-5]
 004C93E1    mov         eax,dword ptr [ebp-4]
 004C93E4    call        004BED7C
 004C93E9    lea         edx,[ebp-14C]
 004C93EF    lea         eax,[ebp-250]
 004C93F5    call        @LStrFromString
 004C93FA    mov         eax,dword ptr [ebp-250]
 004C9400    call        StrToFloat
 004C9405    fstp        tbyte ptr [ebp-18]
 004C9408    wait
 004C9409    lea         eax,[ebp-14C]
 004C940F    push        eax
 004C9410    mov         eax,dword ptr [ebp-0C]
 004C9413    cmp         eax,0FF
>004C9418    jbe         004C941F
 004C941A    call        @BoundErr
 004C941F    mov         ecx,ebx
 004C9421    mov         dl,byte ptr [ebp-5]
 004C9424    mov         eax,dword ptr [ebp-4]
 004C9427    call        004BED2C
 004C942C    lea         edx,[ebp-14C]
 004C9432    lea         eax,[ebp-254]
 004C9438    call        @LStrFromString
 004C943D    mov         eax,dword ptr [ebp-254]
 004C9443    call        StrToFloat
 004C9448    fstp        tbyte ptr [ebp-28]
 004C944B    wait
 004C944C    mov         al,byte ptr [ebp-6]
 004C944F    push        eax
 004C9450    lea         eax,[ebp-14C]
 004C9456    push        eax
 004C9457    mov         eax,dword ptr [ebp-0C]
 004C945A    cmp         eax,0FF
>004C945F    jbe         004C9466
 004C9461    call        @BoundErr
 004C9466    mov         ecx,ebx
 004C9468    mov         dl,byte ptr [ebp-5]
 004C946B    mov         eax,dword ptr [ebp-4]
 004C946E    call        004BEF5C
 004C9473    lea         edx,[ebp-14C]
 004C9479    lea         eax,[ebp-258]
 004C947F    call        @LStrFromString
 004C9484    mov         eax,dword ptr [ebp-258]
 004C948A    call        StrToFloat
 004C948F    fld         tbyte ptr [ebp-18]
 004C9492    fmulp       st(1),st
 004C9494    fld         tbyte ptr [ebp-38]
 004C9497    faddp       st(1),st
 004C9499    fstp        tbyte ptr [ebp-38]
 004C949C    wait
 004C949D    fld         tbyte ptr [ebp-28]
 004C94A0    fld         tbyte ptr [ebp-18]
 004C94A3    fmulp       st(1),st
 004C94A5    fld         tbyte ptr [ebp-48]
 004C94A8    faddp       st(1),st
 004C94AA    fstp        tbyte ptr [ebp-48]
 004C94AD    wait
 004C94AE    xor         eax,eax
 004C94B0    pop         edx
 004C94B1    pop         ecx
 004C94B2    pop         ecx
 004C94B3    mov         dword ptr fs:[eax],edx
>004C94B6    jmp         004C94E4
>004C94B8    jmp         @HandleOnException
 004C94BD    dd          2
 004C94C1    dd          00409B50;EConvertError
 004C94C5    dd          004C94D1
 004C94C9    dd          004098E0;EMathError
 004C94CD    dd          004C94D8
 004C94D1    call        @DoneExcept
>004C94D6    jmp         004C94E4
 004C94D8    call        @DoneExcept
>004C94DD    jmp         004C94E4
 004C94DF    call        @DoneExcept
 004C94E4    inc         dword ptr [ebp-0C]
 004C94E7    dec         dword ptr [ebp-4C]
>004C94EA    jne         004C933B
 004C94F0    fld         tbyte ptr [ebp-48]
 004C94F3    fcomp       dword ptr ds:[4C9590];0:Single
 004C94F9    fnstsw      al
 004C94FB    sahf
>004C94FC    je          004C954D
 004C94FE    call        004B9E48
 004C9503    mov         dword ptr [ebp-260],eax
 004C9509    fild        dword ptr [ebp-260]
 004C950F    fld         tbyte ptr [ebp-38]
 004C9512    fld         tbyte ptr [ebp-48]
 004C9515    fdivp       st(1),st
 004C9517    fmulp       st(1),st
 004C9519    add         esp,0FFFFFFF4
 004C951C    fstp        tbyte ptr [esp]
 004C951F    wait
 004C9520    lea         eax,[ebp-25C]
 004C9526    push        eax
 004C9527    mov         ecx,2
 004C952C    mov         edx,12
 004C9531    mov         al,2
 004C9533    call        FloatToStrF
 004C9538    mov         edx,dword ptr [ebp-25C]
 004C953E    mov         eax,dword ptr [ebp+8]
 004C9541    mov         ecx,0FF
 004C9546    call        @LStrToString
>004C954B    jmp         004C9553
 004C954D    mov         eax,dword ptr [ebp+8]
 004C9550    mov         byte ptr [eax],0
 004C9553    xor         eax,eax
 004C9555    pop         edx
 004C9556    pop         ecx
 004C9557    pop         ecx
 004C9558    mov         dword ptr fs:[eax],edx
 004C955B    push        4C9578
 004C9560    lea         eax,[ebp-25C]
 004C9566    mov         edx,4
 004C956B    call        @LStrArrayClr
 004C9570    ret
>004C9571    jmp         @HandleFinally
>004C9576    jmp         004C9560
 004C9578    pop         edi
 004C9579    pop         esi
 004C957A    pop         ebx
 004C957B    mov         esp,ebp
 004C957D    pop         ebp
 004C957E    ret         4
//end;//*}

//004C9594
{*////procedure sub_004C9594(?:dword; ?:?; ?:?; ?:?);
begin
 004C9594    push        ebp
 004C9595    mov         ebp,esp
 004C9597    add         esp,0FFFFFEE0
 004C959D    push        ebx
 004C959E    push        esi
 004C959F    push        edi
 004C95A0    xor         ebx,ebx
 004C95A2    mov         dword ptr [ebp-11C],ebx
 004C95A8    mov         dword ptr [ebp-18],ebx
 004C95AB    mov         byte ptr [ebp-6],cl
 004C95AE    mov         byte ptr [ebp-5],dl
 004C95B1    mov         dword ptr [ebp-4],eax
 004C95B4    xor         eax,eax
 004C95B6    push        ebp
 004C95B7    push        4C96F8
 004C95BC    push        dword ptr fs:[eax]
 004C95BF    mov         dword ptr fs:[eax],esp
 004C95C2    xor         eax,eax
 004C95C4    mov         dword ptr [ebp-10],eax
 004C95C7    mov         dword ptr [ebp-0C],eax
 004C95CA    mov         word ptr [ebp-8],ax
 004C95CE    mov         byte ptr [ebp-12],0
 004C95D2    mov         eax,dword ptr [ebp-4]
 004C95D5    call        004BE9E0
 004C95DA    test        al,al
>004C95DC    jbe         004C9669
 004C95E2    mov         byte ptr [ebp-13],al
 004C95E5    mov         byte ptr [ebp-11],1
 004C95E9    xor         eax,eax
 004C95EB    push        ebp
 004C95EC    push        4C9644
 004C95F1    push        dword ptr fs:[eax]
 004C95F4    mov         dword ptr fs:[eax],esp
 004C95F7    mov         al,byte ptr [ebp-6]
 004C95FA    push        eax
 004C95FB    lea         eax,[ebp-118]
 004C9601    push        eax
 004C9602    mov         cl,byte ptr [ebp-5]
 004C9605    mov         dl,byte ptr [ebp-11]
 004C9608    mov         eax,dword ptr [ebp-4]
 004C960B    call        004C8F6C
 004C9610    lea         edx,[ebp-118]
 004C9616    lea         eax,[ebp-18]
 004C9619    call        @LStrFromString
 004C961E    mov         eax,dword ptr [ebp-18]
 004C9621    call        StrToFloat
 004C9626    fld         tbyte ptr [ebp-10]
 004C9629    faddp       st(1),st
 004C962B    fstp        tbyte ptr [ebp-10]
 004C962E    wait
 004C962F    add         byte ptr [ebp-12],1
>004C9633    jae         004C963A
 004C9635    call        @IntOver
 004C963A    xor         eax,eax
 004C963C    pop         edx
 004C963D    pop         ecx
 004C963E    pop         ecx
 004C963F    mov         dword ptr fs:[eax],edx
>004C9642    jmp         004C9661
>004C9644    jmp         @HandleOnException
 004C9649    dd          1
 004C964D    dd          00409B50;EConvertError
 004C9651    dd          004C9655
 004C9655    call        @DoneExcept
>004C965A    jmp         004C9661
 004C965C    call        @DoneExcept
 004C9661    inc         byte ptr [ebp-11]
 004C9664    dec         byte ptr [ebp-13]
>004C9667    jne         004C95E9
 004C9669    cmp         byte ptr [ebp-12],0
>004C966D    je          004C96D1
 004C966F    mov         eax,dword ptr [ebp+8]
 004C9672    push        eax
 004C9673    xor         eax,eax
 004C9675    mov         al,byte ptr [ebp-12]
 004C9678    mov         dword ptr [ebp-120],eax
 004C967E    fild        dword ptr [ebp-120]
 004C9684    fld         tbyte ptr [ebp-10]
 004C9687    fdivrp      st(1),st
 004C9689    add         esp,0FFFFFFF4
 004C968C    fstp        tbyte ptr [esp]
 004C968F    wait
 004C9690    lea         eax,[ebp-11C]
 004C9696    push        eax
 004C9697    mov         ecx,2
 004C969C    mov         edx,12
 004C96A1    mov         al,2
 004C96A3    call        FloatToStrF
 004C96A8    mov         edx,dword ptr [ebp-11C]
 004C96AE    lea         eax,[ebp-118]
 004C96B4    mov         ecx,0FF
 004C96B9    call        @LStrToString
 004C96BE    lea         edx,[ebp-118]
 004C96C4    mov         cl,byte ptr [ebp-6]
 004C96C7    mov         eax,dword ptr [ebp-4]
 004C96CA    call        004C2410
>004C96CF    jmp         004C96D7
 004C96D1    mov         eax,dword ptr [ebp+8]
 004C96D4    mov         byte ptr [eax],0
 004C96D7    xor         eax,eax
 004C96D9    pop         edx
 004C96DA    pop         ecx
 004C96DB    pop         ecx
 004C96DC    mov         dword ptr fs:[eax],edx
 004C96DF    push        4C96FF
 004C96E4    lea         eax,[ebp-11C]
 004C96EA    call        @LStrClr
 004C96EF    lea         eax,[ebp-18]
 004C96F2    call        @LStrClr
 004C96F7    ret
>004C96F8    jmp         @HandleFinally
>004C96FD    jmp         004C96E4
 004C96FF    pop         edi
 004C9700    pop         esi
 004C9701    pop         ebx
 004C9702    mov         esp,ebp
 004C9704    pop         ebp
 004C9705    ret         4
//end;//*}

//004C9708
{*////procedure sub_004C9708(?:dword; ?:?; ?:?; ?:?);
begin
 004C9708    push        ebp
 004C9709    mov         ebp,esp
 004C970B    add         esp,0FFFFFEE0
 004C9711    push        ebx
 004C9712    push        esi
 004C9713    push        edi
 004C9714    xor         ebx,ebx
 004C9716    mov         dword ptr [ebp-11C],ebx
 004C971C    mov         dword ptr [ebp-18],ebx
 004C971F    mov         byte ptr [ebp-6],cl
 004C9722    mov         byte ptr [ebp-5],dl
 004C9725    mov         dword ptr [ebp-4],eax
 004C9728    xor         eax,eax
 004C972A    push        ebp
 004C972B    push        4C986C
 004C9730    push        dword ptr fs:[eax]
 004C9733    mov         dword ptr fs:[eax],esp
 004C9736    xor         eax,eax
 004C9738    mov         dword ptr [ebp-10],eax
 004C973B    mov         dword ptr [ebp-0C],eax
 004C973E    mov         word ptr [ebp-8],ax
 004C9742    mov         byte ptr [ebp-12],0
 004C9746    mov         eax,dword ptr [ebp-4]
 004C9749    call        004BE9E0
 004C974E    test        al,al
>004C9750    jbe         004C97DD
 004C9756    mov         byte ptr [ebp-13],al
 004C9759    mov         byte ptr [ebp-11],1
 004C975D    xor         eax,eax
 004C975F    push        ebp
 004C9760    push        4C97B8
 004C9765    push        dword ptr fs:[eax]
 004C9768    mov         dword ptr fs:[eax],esp
 004C976B    mov         al,byte ptr [ebp-6]
 004C976E    push        eax
 004C976F    lea         eax,[ebp-118]
 004C9775    push        eax
 004C9776    mov         cl,byte ptr [ebp-5]
 004C9779    mov         dl,byte ptr [ebp-11]
 004C977C    mov         eax,dword ptr [ebp-4]
 004C977F    call        004C9280
 004C9784    lea         edx,[ebp-118]
 004C978A    lea         eax,[ebp-18]
 004C978D    call        @LStrFromString
 004C9792    mov         eax,dword ptr [ebp-18]
 004C9795    call        StrToFloat
 004C979A    fld         tbyte ptr [ebp-10]
 004C979D    faddp       st(1),st
 004C979F    fstp        tbyte ptr [ebp-10]
 004C97A2    wait
 004C97A3    add         byte ptr [ebp-12],1
>004C97A7    jae         004C97AE
 004C97A9    call        @IntOver
 004C97AE    xor         eax,eax
 004C97B0    pop         edx
 004C97B1    pop         ecx
 004C97B2    pop         ecx
 004C97B3    mov         dword ptr fs:[eax],edx
>004C97B6    jmp         004C97D5
>004C97B8    jmp         @HandleOnException
 004C97BD    dd          1
 004C97C1    dd          00409B50;EConvertError
 004C97C5    dd          004C97C9
 004C97C9    call        @DoneExcept
>004C97CE    jmp         004C97D5
 004C97D0    call        @DoneExcept
 004C97D5    inc         byte ptr [ebp-11]
 004C97D8    dec         byte ptr [ebp-13]
>004C97DB    jne         004C975D
 004C97DD    cmp         byte ptr [ebp-12],0
>004C97E1    je          004C9845
 004C97E3    mov         eax,dword ptr [ebp+8]
 004C97E6    push        eax
 004C97E7    xor         eax,eax
 004C97E9    mov         al,byte ptr [ebp-12]
 004C97EC    mov         dword ptr [ebp-120],eax
 004C97F2    fild        dword ptr [ebp-120]
 004C97F8    fld         tbyte ptr [ebp-10]
 004C97FB    fdivrp      st(1),st
 004C97FD    add         esp,0FFFFFFF4
 004C9800    fstp        tbyte ptr [esp]
 004C9803    wait
 004C9804    lea         eax,[ebp-11C]
 004C980A    push        eax
 004C980B    mov         ecx,2
 004C9810    mov         edx,12
 004C9815    mov         al,2
 004C9817    call        FloatToStrF
 004C981C    mov         edx,dword ptr [ebp-11C]
 004C9822    lea         eax,[ebp-118]
 004C9828    mov         ecx,0FF
 004C982D    call        @LStrToString
 004C9832    lea         edx,[ebp-118]
 004C9838    mov         cl,byte ptr [ebp-6]
 004C983B    mov         eax,dword ptr [ebp-4]
 004C983E    call        004C2410
>004C9843    jmp         004C984B
 004C9845    mov         eax,dword ptr [ebp+8]
 004C9848    mov         byte ptr [eax],0
 004C984B    xor         eax,eax
 004C984D    pop         edx
 004C984E    pop         ecx
 004C984F    pop         ecx
 004C9850    mov         dword ptr fs:[eax],edx
 004C9853    push        4C9873
 004C9858    lea         eax,[ebp-11C]
 004C985E    call        @LStrClr
 004C9863    lea         eax,[ebp-18]
 004C9866    call        @LStrClr
 004C986B    ret
>004C986C    jmp         @HandleFinally
>004C9871    jmp         004C9858
 004C9873    pop         edi
 004C9874    pop         esi
 004C9875    pop         ebx
 004C9876    mov         esp,ebp
 004C9878    pop         ebp
 004C9879    ret         4
//end;//*}


{ TFielddata }

function TFielddata.GetAsFloat: Double;
var
  E: Integer;
  L: Longint;
begin
  if Value = '' then
    result := 0
  else
  begin
    Val(Value, L, E);
    if E <> 0 then
      ShowMessage('errrrrror');
    result := L;
  end;
end;

function TFielddata.GetAsInteger: Longint;
var
  E: Integer;
  L: Longint;
begin
  if Value = '' then
    result := 0
  else
  begin
    Val(Value, L, E);
    if E <> 0 then
      ShowMessage('errrrrror');
    result := L;
  end;
end;

function TFielddata.GetPoint: String;
var
  E: Integer;
  L: Longint;
begin

  if Value = '' then
    result := ''
  else
  begin
    Val(Value, L, E);
    if E <> 0 then
        result :=''
    else  
    result := FormatFloat('00.00',L);
  end;
end;
procedure TFielddata.SetAsFloat(const PValue: Double);
begin
  Value := Floattostr(PValue);
end;

procedure TFielddata.SetAsInteger(const PValue: Longint);
begin
  Value := inttostr(PValue);
end;

function TFichierCdn.min(v1, v2: Integer): real;
var
  i: Integer;
  vmin, S: real;
begin
  vmin := StrToFloat(Cells[v1, v2, 1]);
  for i := 1 to nbr_eleve do
  begin
    S := StrToFloat(Cells[v1, v2, i]);
    if S < vmin then
      vmin := S;
  end;
  result := vmin;
end;

function TFichierCdn.max(v1, v2: Integer): real;
var
  i: Integer;
  vmax, S: real;
begin
  vmax := StrToFloat(Cells[v1, v2, 1]);
  for i := 1 to nbr_eleve do
  begin
    S := StrToFloat(Cells[v1, v2, i]);
    if S > vmax then
      vmax := S;
  end;
  result := vmax;
end;

function TFichierCdn.moy(v1, v2: Integer): real;
var
  i: Integer;
  S: real;
begin
  S := 0;
  for i := 1 to nbr_eleve do
  begin
    S := S + StrToFloat(Cells[v1, v2, i]);
  end;
  result := S / nbr_eleve;
end;

function TFichierCdn.Ecart(v1, v2: Integer): real;
var
  i: Integer;
  S,m: real;
begin
  S := 0;
  m:=moy(v1,v2);
  for i := 1 to nbr_eleve do
  begin
    S := S + Power(StrToFloat(Cells[v1, v2, i]),2);
  end;
  result := Sqrt(S / nbr_eleve-power(m,2));
end;

function TFichierCdn.NoteMoy(v1, v2: Integer): real;
var
  i,S: Integer;
  m: real;
begin
  S := 0;
  m:=moy(v1,v2);
  for i := 1 to nbr_eleve do
  begin
    if (StrToFloat(Cells[v1, v2, i])<10 )then
    S := S + 1;
  end;
  result := S / nbr_eleve*100;
end;

function TFichierCdn.NoteMoyClass(v1, v2: Integer): real;
var
  i,S: Integer;
  m: real;
begin
  S := 0;
  m:=moy(v1,v2);
  for i := 1 to nbr_eleve do
  begin
    if (StrToFloat(Cells[v1, v2, i])<m )then
    S := S + 1;
  end;
  result := S / nbr_eleve*100;
end;

function TFichierCdn.nbr_eleve_read: Integer;
begin
   Result:=nom_eleve.Count;
end;

procedure TFichierCdn.nbr_eleve_write(const Value: Integer);
begin
 // nom_eleve.Count:= Value;
end;

procedure TFielddata.SetPoint(const Value: String);
begin

end;

end.

