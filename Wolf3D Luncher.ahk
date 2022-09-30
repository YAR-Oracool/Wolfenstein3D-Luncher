#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force

W := A_ScreenWidth
H := A_ScreenHeight
BW := A_ScreenWidth - A_ScreenWidth/10
BH := A_ScreenHeight/4
BSpace := A_ScreenHeight/12
BX := (W/2) - (BW/2)


;Font Setup
GUI, Font, s45 cSilver, Lucida Console

;GUI Setup
GUI, Margin, 0, 0
GUI, Add, Text, y%BSpace% w%W% Center, Wolfenstein 3D Luncher
GUI, Color, Maroon
GUI, -dpiscale -Caption +AlwaysOnTop
Gui, Show,x0 y0 w%W% h%H%,Wolfenstein 3D Luncher

;Buttons
GUI, Add, Button, y+%BSpace% x%BX% w%BW% h%BH% Center gLunch_Wolfenstein_3D, Wolfenstein 3D
GUI, Add, Button, x%BX% w%BW% h%BH% Center gLunch_Wolfenstein_Spear_Of_Destiny, Spear Of Destiny
GUI, Add, Button, x%BX% w%BW% h%BH% Center gExit, Quit

Return

Lunch_Wolfenstein_3D:
Run, ..\base\ecwolf.exe
ExitApp
Return

Lunch_Wolfenstein_Spear_Of_Destiny:
Run, ..\base\m1\ecwolf.exe
ExitApp
Return

Exit:
Esc::ExitApp
Return
