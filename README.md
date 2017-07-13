# Killing Floor 2 Drop Farming Script

A VBScript to automate KF2 drop collection.

## Usage

Download the VBScript to anywhere and run it.

It requires you to answer 2 questions before it becomes automated.

1. KF2 must run for 30 minutes total before you are eligible for the next drop. Idle KF2 for 30 minutes before first run? [Y/N]
2. You are eligible for drops 24 hours after your last drop. Minutes to wait before first run (not including idle time)? [integer]

## What it does

1. Starts Killing Floor 2
2. Waits 30 minutes if user opted to before first run
3. Opens map KF-ZedLanding
4. Presses the "Ready Up" button
5. Commits suicide
6. Quits game
7. Waits for 23.5 hours
8. Starts Killing Floor 2
9. Waits 30 minutes
10. Repeat from step 3

All in-game actions are done by console commands.

The game window must be focused for key input to work. This breaks easily if any of many other programs are currently focused. I have not found a workaround so far, so if you are using the computer at the time, it will create a temporary pop-up box, which will flash the taskbar, 10 seconds before it needs game focus.

The script works without problems when the computer is unattended, as the game will be focused when it starts. Just be sure that if you were using the computer during the 30 minutes of idle, that you focus the game before walking away.
