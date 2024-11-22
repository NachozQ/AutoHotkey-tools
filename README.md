# AutoHotkey-tools
Tools I've made for AutoHotkey to help me write macros faster
## CC, stands for Copy Coordinates
Whenever I wanted to copy a coordinate or color it was such a hassle to rely on other programs.
So I made this simple script so I could do it quickly using AutoHotkey v2.<br/>
### Commands:
- **Alt + C**: Copies the coordinates of mouse position to clipboard and stores color in a variable.
- **Alt + V**: Paste the color instead of the coordinates. It will paste in 0x hex format.
- **Alt + Z**: Empties the clipboard
- **Alt + F**: CAUTION BUGGY. Depends on what you have on your clipboard. Points referring to coordinate points.
      <br/>1 point: Displays small box at the top of the screen with the coordinates and color stored using the background color. 
      <br/>2 points: Displays a border box of the area between the two points.
- **Alt + Drag Left Click**: Makes a border box from where you started holding left click to your current mouse position. When let go will copy coordinates like x1, y1, x2, y2.
      <br/>Left click anywhere to make the box dissappear.
- **Shift + F8**: Exit program
### Alt + F box
![image](https://github.com/user-attachments/assets/21e3aebf-742a-4f61-ba3a-896624db7629)
### Multiple coordinate box
![image](https://github.com/user-attachments/assets/2497a530-703e-4ad2-893a-7df8f2c18b98)
