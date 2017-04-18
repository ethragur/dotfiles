from inputs import devices
from inputs import get_gamepad

import i3ipc

i3 = i3ipc.Connection()

while 1:
        events = get_gamepad()
        for event in events:
            if event.code == "BTN_TR" and event.state ==1:
                    i3.command("workspace next")
            if event.code == "BTN_Z" and event.state ==1:
                    i3.command("workspace prev")
            if event.code == "BTN_EAST" and event.state ==1:
                    i3.command("fullscreen toggle")
            if event.code == "BTN_NORTH" and event.state ==1:
                    i3.command("kill")
            if event.code == "ABS_HAT0X" and event.state == -1:
                    i3.command("focus left")
            if event.code == "ABS_HAT0X" and event.state == 1:
                    i3.command("focus right")
            if event.code == "ABS_HAT0Y" and event.state == -1:
                    i3.command("focus up")
            if event.code == "ABS_HAT0Y" and event.state == 1:
                    i3.command("focus down")
            else:
                print(event.code)
