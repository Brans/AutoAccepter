#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 4

TrayTip, Auto Accept Loaded, Press Alt+J to Toggle`nPress Ctrl+X to exit, 10



^x::ExitApp
^!r::Reload
$!j::
program_start:
t := !t
loop{
loop_start:
if t {

CoordMode Pixel
ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, images\button.bmp

if (ErrorLevel = 1){
ToolTip, Accept button not found.
SetTimer, RemoveToolTip, 5000
}
else if (ErrorLevel = 0){
ToolTip, Accept Button Found!
SetTimer, RemoveToolTip, 5000
Send {Enter down}
sleep 1000
goto, loop_start
}
}
else
break
}
Send {Enter up}
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
