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

  ; get current size of user display
  System::Call 'user32::GetSystemMetrics(i 0) i .r0'
  System::Call 'user32::GetSystemMetrics(i 1) i .r1'
  ; set screen size to be "maximized"
  ; 1600x900
  Var /GLOBAL SCREEN_WIDTH
  Var /GLOBAL SCREEN_HEIGHT
  StrCpy $SCREEN_WIDTH "$0"
  StrCpy $SCREEN_HEIGHT "$1"

  ; calculate the table height and width based on the screen size
  ; 1575x600
  Var /GLOBAL TABLE_WIDTH
  Var /GLOBAL TABLE_HEIGHT

  IntOp $3 $SCREEN_WIDTH - 25
  StrCpy $TABLE_WIDTH "$3"
  IntOp $4 $SCREEN_HEIGHT - 300
  StrCpy $TABLE_HEIGHT "$4"

  ; the total height of the window is the height of the force window (92) plus the size of the screen height.
  ; 808
  Var /GLOBAL ADJUSTED_SCREEN_HEIGHT
  IntOp $5 $SCREEN_HEIGHT - 92
  StrCpy $ADJUSTED_SCREEN_HEIGHT "$5"

  ;MessageBox MB_OK|MB_ICONINFORMATION "Screen Resolution: $\r$\n$SCREEN_WIDTH X $SCREEN_HEIGHT$\r$\nTable resolution: $TABLE_WIDTHx$TABLE_HEIGHT$\r$\nAdjusted Screen Height: $ADJUSTED_SCREEN_HEIGHT"

  Var /GLOBAL BACKGROUND_IMAGE
  ; set the background image to one of the known
  ; background images based on the window size
  ${If} $SCREEN_WIDTH > 899
    StrCpy $BACKGROUND_IMAGE "logo2-900x600.gif"
  ${EndIf}
  ${If} $SCREEN_WIDTH > 1023
    StrCpy $BACKGROUND_IMAGE "logo2-1024x700.gif"
  ${EndIf}
  ${If} $SCREEN_WIDTH > 1279
    StrCpy $BACKGROUND_IMAGE "logo2-1280x900.gif"
  ${EndIf}
  ${If} $SCREEN_WIDTH > 1599
    StrCpy $BACKGROUND_IMAGE "logo2-1600x900.gif"
  ${EndIf}
  ${If} $SCREEN_WIDTH > 1919
    StrCpy $BACKGROUND_IMAGE "logo2-1920x1080.gif"
  ${EndIf}

  ; holotable.ini contains the installation path.
  ; write the file dynamically to accomodate a custom installation path.
  FileOpen $0 $INSTDIR\holotable.ini w
  FileWrite $0 "Table width: $TABLE_WIDTH"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Table height: $TABLE_HEIGHT"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Startup width: $SCREEN_WIDTH"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Startup height: $ADJUSTED_SCREEN_HEIGHT"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Startup X position: 0"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Startup Y position: 0"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Server: www.holotable.com"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Port: 5320"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Username: Padawan Learner"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Images: "
  FileWrite $0 $INSTDIR
  ; installing to windows, so the path slashes point backwards.
  FileWrite $0 \cards
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Decks: "
  FileWrite $0 $INSTDIR
  FileWrite $0 \decks
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Table background: "
  FileWrite $0 $INSTDIR
  FileWrite $0 "\$BACKGROUND_IMAGE"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Move single cards in real time: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Move stacks in real time: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Use image zoom: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Image popup delay: 450"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Auto-adjust table size: large"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Use card context menus: false"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Load cards to hand: false"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Fan setting: medium"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Show extra messages: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Use card grouping: false"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Card grouping: below 15"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Force card text load from CDF: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Check version on startup: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Prompt for CDF update: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Prompt for Holotable update: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Check for image file updates: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Prompt before updating image files: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Delete extraneous images: true"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Update small images only: false"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Scan local images: 0"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileWrite $0 "Country code: 0"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Starting cards pile: 15 92 left"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Force Pile: 293 92 right"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Reserve Deck: 231 92 right"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Used Pile: 256 159 right"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Lost Pile: 161 92 right"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Out of play pile: 82 92 right"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Your text: green"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Opponent's text: red"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Observer's text: orange"
  FileWriteByte $0 13
  FileWriteByte $0 10

  FileWrite $0 "Version: "
  FileWrite $0 "${PRODUCT_VERSION}"
  FileWriteByte $0 13
  FileWriteByte $0 10
  FileClose $0


  ; create desktop shortcut
  CreateShortCut "$DESKTOP\Holotable.lnk" "$INSTDIR\Holotable.exe" ""
  CreateShortCut "$DESKTOP\Holodeck.lnk"  "$INSTDIR\Holodeck.exe"  ""
 
  ; create start-menu items
  CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\Uninstall.exe" "" "$INSTDIR\Uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Holotable.lnk" "$INSTDIR\Holotable.exe" "" "$INSTDIR\Holotable.exe" 0
  CreateShortCut "$SMPROGRAMS\${PRODUCT_NAME}\Holodeck.lnk"  "$INSTDIR\Holodeck.exe"  "" "$INSTDIR\Holodeck.exe"  0
 
  ; write uninstall information to the registry
  WriteRegStr HKLM "Software\${PRODUCT_NAME}" "" "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayName" "${PRODUCT_NAME} ${PRODUCT_VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString" $\"$INSTDIR\Uninstall.exe$\"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "URLInfoAbout" "www.holotable.com"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "HelpLink" "www.holotable.com"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "InstallLocation" "$INSTDIR"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "NoRepair" 1
  WriteUninstaller uninstall.exe ;  $INSTDIR\uninstall.exe




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
