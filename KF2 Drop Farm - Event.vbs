Set WshShell = WScript.CreateObject("WScript.Shell")
If Instr(1, WScript.FullName, "CScript", vbTextCompare) = 0 Then
    WshShell.Run "cscript //nologo """ & WScript.ScriptFullName & """", 1, False
    WScript.Quit
End If

Dim dblGameLoadWait, boolCustomIdle



'///////////// USER VARIABLES /////////////

' Time to wait for game to load in seconds
dblGameLoadWait = 40

'///////////// USER VARIABLES /////////////



WScript.Echo "Killing Floor 2 event drop farming script"
WScript.Echo "Author: /u/killall-q"
WScript.Echo
WScript.Echo "This script loops every 3.5 hours, indefinitely."
WScript.Echo "Close this console window to exit the script."
WScript.Echo
WScript.Echo "//////////// USER INPUT REQUIRED ////////////"
WScript.Echo
WScript.Echo "KF2 must run for 30 minutes total before you are eligible for the next drop."
WScript.StdOut.Write "Idle KF2 for 30 minutes before first run? [Y/N] "
If LCase(WScript.StdIn.ReadLine) = "y" Then
    boolCustomIdle = True
Else
    boolCustomIdle = False
End If
WScript.Echo
WScript.Echo "////////////  END OF USER INPUT  ////////////"
WScript.Echo
WScript.Echo "Thank you, you may now leave the computer."
WScript.Echo "Disable sleep and hibernation settings."
WScript.Echo "You can continue to use the computer while the script is running."
WScript.Echo

StartKF2
If boolCustomIdle = True Then
    WaitMin(30)
    PopUp10Sec
    StartKF2
End If
CollectItemDrop
Wait3Hr
Do
    StartKF2
    WaitMin(30)
    PopUp10Sec
    StartKF2
    CollectItemDrop
    Wait3Hr
Loop



Sub StartKF2
    WScript.Echo
    WScript.Echo Now
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

Sub PopUp10Sec
    WshShell.Popup "Please switch to Killing Floor 2, then do not touch the mouse or keyboard.", 10, "KF2 Drop Farm"
End Sub

Sub CollectItemDrop
    For Each process in GetObject("winmgmts:").InstancesOf("Win32_Process")
        If StrComp(process.Name, "KFGame.exe", vbTextCompare) = 0 Then
            objKF2Process = process.ProcessId
            Exit For
        End If
    Next
    ' Focus KF2 window
    WshShell.AppActivate objKF2Process
    ' Open KF-ZedLanding
    WScript.Echo "Opening map KF-ZedLanding"
    WshShell.SendKeys "{F3}open KF-ZedLanding{ENTER}"
    WScript.Sleep 100
    ' Press Ready Up
    WshShell.AppActivate objKF2Process
    WScript.Echo "Pressing Ready Up"
    WshShell.SendKeys "{F3}startfire{ENTER}"
    WScript.Sleep 8000
    ' Suicide
    WshShell.AppActivate objKF2Process
    WScript.Echo "Suiciding"
    WshShell.SendKeys "{F3}suicide{ENTER}"
    WScript.Sleep 20000
    ' Return to home menu
    WshShell.AppActivate objKF2Process
    WScript.Echo "Quitting game"
    WshShell.SendKeys "{F3}exit{ENTER}"
End Sub

Sub WaitMin(intMin)
    WScript.Echo "Waiting for " & intMin & " minutes"
    WScript.Sleep intMin * 60000
End Sub

Sub Wait3Hr
    WScript.Echo "Waiting for 3 hours"
    WScript.Sleep 10800000 - dblGameLoadWait * 1000
End Sub
