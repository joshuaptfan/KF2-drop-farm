Set WshShell = WScript.CreateObject("WScript.Shell")
If Instr(1, WScript.FullName, "CScript", vbTextCompare) = 0 Then
    WshShell.Run "cscript //nologo """ & WScript.ScriptFullName & """", 1, False
    WScript.Quit
End If

Dim dblGameLoadWait, dblMapLoadWait



'///////////// USER VARIABLES /////////////

' Time to wait for game to load in seconds
dblGameLoadWait = 20
' Time to wait for map to load in seconds
dblMapLoadWait = 0.1

'///////////// USER VARIABLES /////////////



WScript.Echo "Killing Floor 2 SomeTestMap Launcher"
WScript.Echo "Author: /u/killall-q"
WScript.Echo
WScript.Echo "You must have KF-SomeTestMap installed."
WScript.Echo "To download, subscribe to the Steam workshop item here:"
WScript.Echo "http://steamcommunity.com/sharedfiles/filedetails/?id=643313659"
WScript.Echo

StartKF2
OpenSomeTestMap



Sub StartKF2
    WScript.Echo
    For Each process in GetObject("winmgmts:").InstancesOf("Win32_Process")
        If StrComp(process.Name, "KFGame.exe", vbTextCompare) = 0 Then
            WScript.Echo "Killing Floor 2 is already running"
            Exit Sub
        End If
    Next
    WScript.Echo "Starting Killing Floor 2"
    WshShell.Run "C:\PROGRA~2\Steam\STEAMA~1\common\KILLIN~1\Binaries\Win64\KFGame.exe -nostartupmovies"
    WScript.Sleep dblGameLoadWait * 1000
End Sub

Sub OpenSomeTestMap
    For Each process in GetObject("winmgmts:").InstancesOf("Win32_Process")
        If StrComp(process.Name, "KFGame.exe", vbTextCompare) = 0 Then
            objKF2Process = process.ProcessId
            Exit For
        End If
    Next
    ' Focus KF2 window
    WshShell.AppActivate objKF2Process
    ' Open KF-ZedLanding
    WScript.Echo "Opening map KF-SomeTestMap"
    WshShell.SendKeys "{F3}open KF-SomeTestMap?game=SomeTestMap.SomeTestMap{ENTER}"
	' Wait for map load
    WScript.Sleep dblMapLoadWait * 1000
    ' Press Ready Up
    WshShell.AppActivate objKF2Process
    WScript.Echo "Pressing Ready Up"
    WshShell.SendKeys "{F3}startfire{ENTER}"
End Sub