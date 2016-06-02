unit Unit1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, Project1_TLB, StdVcl, System.SysUtils;

type
  TCopyFile = class(TTypedComObject, ICopyFile)
  protected
     FFileToCopy: WideString;
     FFolderWhCopy: WideString;
     FRes: HResult;
    procedure Get_FileToCopy; stdcall;
    procedure Get_FolderWhCopy; stdcall;
    procedure Set_FileToCopy(const Value: WideString); stdcall;
    procedure Set_FolderWhCopy(const Value: WideString); stdcall;
  public
    function copy: HResult; stdcall;
     property Res: HResult write FRes;
  end;

implementation

uses ComServ;

{ TCopyFile }

function TCopyFile.copy: HResult;
Var
  S, T, FileS,  bytesRead,bytesRead1: Cardinal;
  buf: array of integer;
  MaxSpeed,speed: double;
  sumB: integer;
  time,dx: Cardinal;
Begin
  sumB := 0;
  maxSpeed:=0;
  bytesRead:= 64;


  S := CreateFile(PChar(FFileToCopy), GENERIC_READ, FILE_SHARE_READ, nil,
    OPEN_EXISTING, 0, 0);
  FileS := GetFileSize(S, nil);
  SetLength(buf, bytesRead);
  try
    T := CreateFile(PChar(FFolderWhCopy), GENERIC_WRITE, FILE_SHARE_WRITE, nil,
      CREATE_ALWAYS, 0, 0);
    try
    while true do
      begin
        time:= GetTickCount;
        ReadFile(S, buf[0], bytesRead, bytesRead1, nil);
        if bytesRead1 = 0 then
          break;
        WriteFile(T, buf[0], bytesRead, bytesRead1, nil);
        if (GetTickCount - time) <> 0 then
          speed:= bytesRead1 / (GetTickCount - time);
        if speed > maxSpeed then begin
          maxSpeed  := speed;
          bytesRead := bytesRead+dx;
          dx:=dx-10;
          setLength(buf,bytesRead)
        end;
        FileSetDate(T, FileGetDate(S));
//        sumB := sumB + bytesRead;
//        FProgress := Round((sumB / FileS) * 100);
      end;
    finally
      FileClose(T);
    end;
  finally
    FileClose(S);
  end;
  Res:= 1;
end;

procedure TCopyFile.Get_FileToCopy;
begin

end;

procedure TCopyFile.Get_FolderWhCopy;
begin

end;

procedure TCopyFile.Set_FileToCopy(const Value: WideString);
begin
  FFileToCopy:= Value;
end;

procedure TCopyFile.Set_FolderWhCopy(const Value: WideString);
begin
  FFolderWhCopy:= Value;
end;

initialization
  TTypedComObjectFactory.Create(ComServer, TCopyFile, Class_CopyFile,
    ciMultiInstance, tmApartment);
end.
