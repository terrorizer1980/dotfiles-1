#IfWinActive ahk_class TV_CClientWindowClass
; Bind Caps Lock to Hyper
*CapsLock::
  SetKeyDelay -1
  Send {Blind}{Ctrl DownTemp}{Alt DownTemp}{Shift DownTemp}{LWin DownTemp}
return

*CapsLock up::
  SetKeyDelay -1
  Send {Blind}{Ctrl Up}{Alt Up}{Shift Up}{LWin Up}
return

; Mimic OS X keyboard layout
LAlt::Lwin
LWin::LAlt
#IfWinActive