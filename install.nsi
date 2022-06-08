; -------------------------------
; Start 
  
  !define PRODUCT_NAME "Holotable"
  !define PRODUCT_VERSION "0.9.10"
  !define MUI_BRANDINGTEXT "Holotable Ver. ${PRODUCT_VERSION}"
  CRCCheck On

;--------------------------------
; Plugins

  ; Modern UI
  !include "MUI2.nsh"

  ;!insertmacro GetTime

;--------------------------------
;General

  ;Name and file
  Name ${PRODUCT_NAME}

  ;${GetTime} "" "L" $0 $1 $2 $3 $4 $5 $6
  ;!define CURRENT_DATE_TIME "$2$1$0-$4$5"
  !define /date CURRENT_DATE_TIME "%Y%m%d-%H%M"

  OutFile "${PRODUCT_NAME}-${PRODUCT_VERSION}-${CURRENT_DATE_TIME}.exe"
  Unicode True

  ;Default installation folder
  InstallDir "C:\Holotable"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\Holotale" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
  !define MUI_WELCOMEFINISHPAGE_BITMAP modern-wizard.bmp
  ;!define MUI_UNWELCOMEFINISHPAGE_BITMAP

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  ;!insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections


Section /o "GTK 2.12.9 win32" GTK2Install
  ; GTK2
  ;SetOutPath "$INSTDIR"
  ;File "gtk-2.12.9-win32-2.exe"

  SetOutPath "C:\GTK"
  File /r GTK\*.*

  WriteRegStr HKLM "Software\Wow6432Node\GTK\2.0" "DllPath" "C:\GTK\bin"
  WriteRegStr HKLM "Software\Wow6432Node\GTK\2.0" "Path" "C:\GTK"
  WriteRegStr HKLM "Software\Wow6432Node\GTK\2.0" "VendorVersion" "2.12.9-2"
  WriteRegStr HKLM "Software\Wow6432Node\GTK\2.0" "Version" "2.12.9"

  WriteRegStr HKLM "Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Gtk+ Runtime Environment" "Context" "1"
  WriteRegStr HKLM "Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Gtk+ Runtime Environment" "DisplayName" "Gtk+ Runtime Environment 2.12.9-2"
  WriteRegStr HKLM "Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Gtk+ Runtime Environment" "DisplayVersion" "2.12.9-2"
  WriteRegStr HKLM "Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Gtk+ Runtime Environment" "NSIS:StartMenuDir" "Gtk+"
  WriteRegStr HKLM "Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Gtk+ Runtime Environment" "UninstallString" "C:\GTK\uninst.exe"

  WriteRegStr HKLM "System\CurrentControlSet\Control\Session Manager\Environment" "GTK_BASEPATH" "C:\GTK"

  ReadRegStr $0 HKLM32 "System\CurrentControlSet\Control\Session Manager\Environment" "PATH"
  WriteRegStr HKLM32 "System\CurrentControlSet\Control\Session Manager\Environment" "PATH" "%GTK_BASEPATH%\bin;$0"


SectionEnd

Section "Holotable" HolotableInstall
  SetOutPath "$INSTDIR"
  ; https://nsis.sourceforge.io/Docs/Chapter4.html#file
  File /r /x *.res /x *.obj /x *.pch /x .git holotable\*.*

  ; create desktop shortcut
  CreateShortCut "$DESKTOP\Holotable.lnk" "$INSTDIR\Holotable.exe" ""
  CreateShortCut "$DESKTOP\Holodeck.lnk"  "$INSTDIR\Holodeck.exe"  ""
 
  ; create start-menu items
  CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\Uninstall.exe" "" "$INSTDIR\Uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Holotable.lnk" "$INSTDIR\Holotable.exe" "" "$INSTDIR\Holotable.exe" 0
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Holodeck.lnk"  "$INSTDIR\Holodeck.exe"  "" "$INSTDIR\Holodeck.exe"  0
 
  ; write uninstall information to the registry
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayName" "${PRODUCT_NAME} (remove only)"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString" "$INSTDIR\Uninstall.exe"

  WriteUninstaller "$INSTDIR\Uninstall.exe"
 
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_GTK2Install      ${LANG_ENGLISH} "Install GTK2 which is required by Holotable. You do not need to install more than once."
  LangString DESC_HolotableInstall ${LANG_ENGLISH} "Install Holotable."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${GTK2Install} $(DESC_GTK2Install)
  !insertmacro MUI_DESCRIPTION_TEXT ${HolotableInstall} $(DESC_HolotableInstall)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ; Delete Files 
    RMDir /r "$INSTDIR\*.*"    
   
  ; Remove the installation directory
    RMDir "$INSTDIR"
   
  ; Delete Start Menu Shortcuts
    Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
    Delete "$SMPROGRAMS\${PRODUCT_NAME}\*.*"
    RmDir  "$SMPROGRAMS\${PRODUCT_NAME}"
   
  ; Delete Uninstaller And Unistall Registry Entries
    DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\${PRODUCT_NAME}"
    DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"  
 
  DeleteRegKey /ifempty HKCU "Software\Holotable"
SectionEnd