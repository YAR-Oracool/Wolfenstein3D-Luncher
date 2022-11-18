# Wolfenstein3D-Luncher
A way to lunch Wolfenstein 3D with your desired Source port (Default is ECWolf, you need to edit teh script yourself for otehrs) while maintaining Steam's features and lunching from it.

## Introduction
One day I woke up to see a lot of old games that I've never played before are on sale on Steam and I bought them and Wolfenstein 3D was one of these games. After chenking the guides to run the game on a not embaracing reselution I realised taht teh guide is... well not exactly wrong but it's no longer aplicaple. After playing with the files, trying out a few theories I had and basically learning how it works I realized that the solution is quite simple and I made this script to make it work because I wanted to still be able to lunch Spear of Destiny and Wolfenstein 3D like DOSBOX could. Also keep in mind that depending on your sourceport and luck, you might not really need this. Infact you don't need thsi at all, this is just for convinience and I made it becasue I was lazy.

## Instalation
###Requirements
ECWolf for both m1 folder in instalation file and base folder: 

The launcher needs to be in .exe so even if you get the .ahk file, you need to compile it. When you did that either rename it to DOSBOX and put it in DOSBOX folder in the game folder and rename the original DOSBOX to something else or open launch_settings.cfg and change what "BinaryPath=" equates to Wolf3DLuncher.exe.

You also need to have ECWolf installed in both Wolfenstein 3D and Spear of Destiny because I can not find launch commands for this Source port to laucnh these games directly and depending on my system it doesn;t even detect the other game hence teh double installation

### Important:
Depending on how you edited my script and compiled it, you can set "BinaryPath" to where ever you want.

### Warning:
Windows Defender might take an issue with the compiled script, you have to tell it to ignore it. If you don't trust my compiled script then.... well the source code is there...

## Editing the script for non default source port

### Requirements
Auto Hot Key: Link: https://www.autohotkey.com

Line 37 must be the path to your Wolfensetein 3D and Line 44 must be the path to your Spear of Destiny which is... basically a folder in Base called m1. and after that the name of your source port. If you are putting the compiled file in the DOSBOX folder then you only need to repalce "ECWolf.exe" in the script with the name of the source port you are using.
