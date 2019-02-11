from win32con import VK_CAPITAL
if GetKeyState(VK_CAPITAL) == 1:
    print ("CAPS Lock is on.")
elif GetKeyState(VK_CAPITAL) == 0:
    print ("CAPS Lock is off.")
