#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
;Steam Cloud to ECwolf Save file transformation.
FileDelete, %A_AppData%\..\..\Saved Games\ECWolf\*.ecs ;Delets the files in ECWolf's save folder
FileCopy, %A_WorkingDir%\..\base\savegam*.WL6, %A_AppData%\..\..\Saved Games\ECWolf\*.ecs, Overwrite ;Copies the files with savegam in their name to ECwolf's save folder and changes the extention to something that ECWolf undertsands.

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
GUI, -dpiscale -Caption ;Makes the script behave like a borderless fullscreen window
GUI, Show,x0 y0 w%W% h%H%,Wolfenstein 3D Luncher ;Positions teh window drawing starting point to the top left cornor of the screen and gives it a name.

;Buttons
GUI, Add, Button, y+%BSpace% x%BX% w%BW% h%BH% Center gLunch_Wolfenstein_3D, Wolfenstein 3D ;makes a button a bit below the text from before and pressing it activates a function that opens Woflenstein 3D.
GUI, Add, Button, x%BX% w%BW% h%BH% Center gLunch_Wolfenstein_Spear_Of_Destiny, Spear Of Destiny ;makes a button a bit below the previous button and pressing it activates a function that opens Woflenstein: Spear fo Destiny.
GUI, Add, Button, x%BX% w%BW% h%BH% Center gExit, Quit ; Creates a button a bit below the previosu one that activates a function to make the program quit.
Return ;Stops the script.

;Wolfenstein 3D button function
Lunch_Wolfenstein_3D: ;Creates the function with this name so it can be called.
RunWait, ..\base\ecwolf.exe ;Tells Windows to run this file in the given adress.
;GUI, Destroy ;Closes the GUI
;Goto, Exit ;Calls the exit function.
Return

;Wolfenstein Spear Of Destiny button function
Lunch_Wolfenstein_Spear_Of_Destiny: ;Creates the function with this name so it can be called.
RunWait, ..\base\m1\ecwolf.exe ;Tells Windows to run this file in the given adress.
;GUI, Destroy ;Closes the GUI
;Goto, Exit ;Calls the exit function.
Return

;Exit button function
Exit: ;Creates the function with this name so it can be called.
FileDelete, %A_WorkingDir%\..\base\savegam*.WL6 ;Delets the old save files
FileCopy, %A_AppData%\..\..\Saved Games\ECWolf\*.ecs, %A_WorkingDir%\..\base\*.WL6, Overwrite ;Copies the savefiles from ECWolf to the game folder and renames the type to .WL^ so it can be picked up by steam.
ExitApp ;Closes the program
Return ;Stops the script.

;No need to read the rest.

;These commands worked whiel it was used directly with powershell but now.... it doesn't.
;RunWait, powershell -command "Get-ChildItem -Path "%A_WorkingDir%\..\base" -Filter "*savegame*" | Copy-Item -Destination "%A_WorkingDir%\Temp"",,Hide ;Tells powershell to get the files that are called savegam from the base folder in the the directroy before working directory and copy them into the temp folder in the background.
;RunWait, powershell -command "Get-ChildItem -Path "%A_WorkingDir%\Temp" | Rename-Item -NewName { $_.name -replace '.WL6','.ecs'}",,Hide ;Tells powershell to get the files from the temp folder and rename their extention to .ecs in the background
;RunWait, powershell -command "Get-ChildItem -Path "%A_WorkingDir%\Temp" | Move-Item -Destination "%A_AppData%\..\..\Saved Games\ECWolf"",,Hide ;Tells powershell to move the files in the temp folder to where ECWolf keeps it's save files in the background.
;FileRemoveDir, Temp, 1 ;Removes the temp folder we created earlier.

;Exit Function
;FileCreateDir, Temp ;Makes a temporary file in the working directory.
;RunWait, powershell -command "Get-ChildItem -Path "%A_AppData%\..\..\Saved Games\ECWolf" | Copy-Item -Destination "%A_WorkingDir%\Temp"",,Hide ;Tells powershell to grab the save files from ECwolf's save fiel folder and put it in the temp folder in the game directory.
;RunWait, powershell -command "Get-ChildItem -Path "%A_WorkingDir%\Temp" | Rename-Item -NewName { $_.name -replace '.ecs','.WL6'}",,Hide ;Tells powershell to get the files from the temp folder and rename their extention to .WL6 in the background.
;RunWait, powershell -command "Get-ChildItem -Path "%A_WorkingDir%\Temp" | Move-Item -Destination "%A_WorkingDir%\..\base"",,Hide ;Tells powershell to move the files in the temp folder to where ECWolf keeps it's save files in the background.
;FileRemoveDir, Temp ;Removes the temp folder we created earlier.
