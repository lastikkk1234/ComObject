unit Project1_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 27.05.2016 12:51:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Users\user\Desktop\API\Labs\ComObject\Win32\Debug\Copirovanie.dll (1)
// LIBID: {D0C30B8F-458B-40D7-B35B-F7E0B8FA8A63}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Project1MajorVersion = 1;
  Project1MinorVersion = 0;

  LIBID_Project1: TGUID = '{D0C30B8F-458B-40D7-B35B-F7E0B8FA8A63}';

  IID_ICopyFile: TGUID = '{B1F20421-937C-4B41-AE97-C08D24772DD2}';
  CLASS_CopyFile: TGUID = '{9E6EB5CA-204A-4060-B455-9CA18C69DC67}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICopyFile = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CopyFile = ICopyFile;


// *********************************************************************//
// Interface: ICopyFile
// Flags:     (256) OleAutomation
// GUID:      {B1F20421-937C-4B41-AE97-C08D24772DD2}
// *********************************************************************//
  ICopyFile = interface(IUnknown)
    ['{B1F20421-937C-4B41-AE97-C08D24772DD2}']
    function copy: HResult; stdcall;
    procedure Get_FileToCopy; stdcall;
    procedure Set_FileToCopy(const Param1: WideString); stdcall;
    procedure Get_FolderWhCopy; stdcall;
    procedure Set_FolderWhCopy(const Param1: WideString); stdcall;
  end;

// *********************************************************************//
// The Class CoCopyFile provides a Create and CreateRemote method to          
// create instances of the default interface ICopyFile exposed by              
// the CoClass CopyFile. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCopyFile = class
    class function Create: ICopyFile;
    class function CreateRemote(const MachineName: string): ICopyFile;
  end;

implementation

uses System.Win.ComObj;

class function CoCopyFile.Create: ICopyFile;
begin
  Result := CreateComObject(CLASS_CopyFile) as ICopyFile;
end;

class function CoCopyFile.CreateRemote(const MachineName: string): ICopyFile;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CopyFile) as ICopyFile;
end;

end.
