# AutoHotkey-tools
Tools I've made for AutoHotkey to help me write macros faster
## CC, stands for Copy Coordinates
Whenever I wanted to copy a coordinate or color it was such a hassle to rely on other programs.
So I made this simple script so I could do it quickly using AutoHotkey v2.<br/>
### Commands:
| Shortcut | Action |
| --- | --- |
| **`Alt` + `c`** | Copies mouse coords to clipboard and stores color in a variable. |
| **`Alt` + `v`** | Paste the color instead of the coordinates. It will paste in 0x hex format. |
| **`Alt` + `z`** | Empties clipboard |
| **`Alt` + `f`** | CAUTION BUGGY. Shows color and coords copied. |
| **`Alt` + `Drag Left Click`** | Lets you create a box, copies coords on release. Click anywhere to clear box. |
| **`Shift` + `F8`** | Exit program |

### Alt + F box
1 coord: Displays small box indicating copied color, moves mouse to coord location.

2 coords: Displays a border box of the area between the two points.

![image](https://github.com/user-attachments/assets/21e3aebf-742a-4f61-ba3a-896624db7629)
### Multiple coordinate box
![image](https://github.com/user-attachments/assets/2497a530-703e-4ad2-893a-7df8f2c18b98)
###### Specially useful for PixelSearch's x1, y1, x2, y2
