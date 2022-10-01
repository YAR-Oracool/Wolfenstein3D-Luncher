#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force

W := A_ScreenWidth ;Sets the variable W to screen Width.
H := A_ScreenHeight ;Sets Variable H to screen height.
BW := A_ScreenWidth - A_ScreenWidth/10 ;Set the value BW to 1/10th of screen width.
BH := A_ScreenHeight/4 ;Sets the Value BH to 1/4th of screen height.
BSpace := A_ScreenHeight/12 ;Sets teh value BSpace to 1/12th of screen height.
BX := (W/2) - (BW/2) ;Sets teh value BX to half of values W and BW, subtracted from each other.


;Font Setup
GUI, Font, s45 cSilver, Lucida Console

;GUI Setup
GUI, Margin, 0, 0 ;GUI borders are set here
GUI, Add, Text, y%BSpace% w%W% Center, Wolfenstein 3D Luncher ;Writes a text at top of the screen.
GUI, Color, Maroon ;Sets background color for the window and I tried to pcik a color close to the original background.
GUI, -dpiscale -Caption +AlwaysOnTop ;Forces the window to be always on top and probebly ignore Window's screen scaling.
GHI, Show,x0 y0 w%W% h%H%,Wolfenstein 3D Luncher ;Positions teh window drawing starting point to the top left cornor of the screen and gives it a name.

;Buttons
GUI, Add, Button, y+%BSpace% x%BX% w%BW% h%BH% Center gLunch_Wolfenstein_3D, Wolfenstein 3D ;makes a button a bit below the text from before and pressing it activates a function that opens Woflenstein 3D.
GUI, Add, Button, x%BX% w%BW% h%BH% Center gLunch_Wolfenstein_Spear_Of_Destiny, Spear Of Destiny ;makes a button a bit below the previous button and pressing it activates a function that opens Woflenstein: Spear fo Destiny.
GUI, Add, Button, x%BX% w%BW% h%BH% Center gExit, Quit ; Creates a button a bit below the previosu one that activates a function to make the program quit.
Return ;Stops the script.

;Wolfenstein 3D button function
Lunch_Wolfenstein_3D: ;Creates the function with this name so it can be called.
Run, ..\base\ecwolf.exe ;Tells Windows to run this file in the given adress.
ExitApp ;Closes the program.
Return ;Stops the Script

;Wolfenstein Spear Of Destiny button function
Lunch_Wolfenstein_Spear_Of_Destiny: ;Creates the function with this name so it can be called.
Run, ..\base\m1\ecwolf.exe ;Tells Windows to run this file in the given adress.
ExitApp ;Closes the program.
Return ;Stops the script.

;Exit button function
Exit: ;Creates the function with this name so it can be called.
Esc::ExitApp ;Ties the Escape key to exiting the script and since it's not after a return, calling the Exit funtion will also activate the ExitApp command.
Return ;Stops the script.
