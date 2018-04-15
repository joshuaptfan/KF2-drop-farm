# Killing Floor 2 Drop Farming Script

A VBScript to automate [Killing Floor 2](http://store.steampowered.com/app/232090/Killing_Floor_2/) item drop collection.

## Usage

Download __KF2 Drop Farm.vbs__ to anywhere and run it.

It will ask you some questions before it becomes automated.

```
Select one of the following:
[1] Normal        Collect drop every 12 hours
[2] Event         Collect drop every 3.5 hours
[3] Event 2XP     Collect drop every 2 hours
Selection:

You are eligible for drops X hours after your last drop.
Minutes to wait before first run (not including idle time)? [number]:

KF2 must run for 30 consecutive minutes before you are eligible for the next drop.
Idle KF2 for 30 minutes before first run? [Y/N]:
```

__Depending on the performance of your computer, you may need to adjust the wait times for game launch and map load.__ Do this by opening the .vbs file in Notepad, the variables `intGameLoadWait` and `intMapLoadWait` are clearly labeled near the top of the script.

## What it does

1. Starts Killing Floor 2
2. Waits for 30 minutes if user opted to before first run
3. Opens map KF-Farmhouse
4. Presses the "Ready Up" button
5. Commits suicide
6. Quits game
7. Waits for (_X_ - 0.5) hours
8. Starts Killing Floor 2
9. Waits for 30 minutes
10. Repeat from step 3

All in-game actions are done by console commands.

The game window must be focused for key input to work. This breaks easily if any of many other programs are currently focused. I have not found a workaround so far, so if you are using the computer at the time, it will create a temporary pop-up box, which will flash the taskbar, 10 seconds before it needs game focus.

The script works without problems when the computer is unattended, as the game will be focused when it starts. Just be sure that if you were using the computer during the 30 minutes of idle, that you focus the game before walking away.

## Virtual desktop version

This modification of the original script will keep KF2 running continuously on the 2nd virtual desktop, so as to be less distracting to users. The script will give KF2 focus for as little time as possible, switching back to the 1st virtual desktop after every action.

KF2's display setting must be windowed or borderless. __Windows 10 is required.__

# KF-SomeTestMap Launcher

KF-SomeTestMap is a custom map for testing any weapon on any enemy in a safe environment, without granting XP.

The map is launched via a special console command which can be tedious to type. This VBScript gets you ready for testing as quickly as possible with just a click.

You must have downloaded KF-SomeTestMap beforehand by [subscribing to the Steam workshop item](http://steamcommunity.com/sharedfiles/filedetails/?id=643313659).

## Usage

Download __KF-SomeTestMap.vbs__ to anywhere and run it.

__Depending on the performance of your computer, you may need to adjust the wait time for game launch.__ Do this by opening the .vbs file in Notepad, the variable `intGameLoadWait` is clearly labeled near the top of the script.

## What it does

1. Starts Killing Floor 2
2. Opens map KF-SomeTestMap with custom SomeTestMap game mode
3. Presses the "Ready Up" button
