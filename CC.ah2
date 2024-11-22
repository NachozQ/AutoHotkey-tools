#SingleInstance force

/* Creates selection GUI beforehand */
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"
global SelectedGui := Gui()
SelectedGui.Opt("-Caption +ToolWindow +LastFound +AlwaysOnTop +Border")
SelectedGui.BackColor := "0xFFFFFF"
SelectedGui.Title := "SelectedGui"
WinSetTransColor(SelectedGui.BackColor " 150", SelectedGui)

!c:: { ; Copies coords and color
  MouseGetPos &xpos, &ypos
  global color := PixelGetColor(xpos, ypos)
  A_Clipboard := xpos "," A_Space ypos
  return
}

!v:: { ; Pastes color
  Send color
  return
}

!z:: { ; Resets the clipboard
  A_Clipboard := ""
}

!f:: { ; Guides to what color, coord and selection is in clipboard
  if (ClipboardCommas() == 1) {
    Coords := StrSplit(A_Clipboard, ",") ; Shows coordinate in clipboard
    XCoord := Coords[1]
    YCoord := Coords[2]
    mouseMove XCoord, YCoord
    if (IsSet(color) and not WinExist("CCGui")) { ; If color has been copied shows with GUI
      global CCGui := Gui()
      CCGui.Opt("-Caption +AlwaysOnTop -Owner")
      CCGui.Title := "CCGui"
      CCGui.BackColor := color
      Inverted := "c" (0xFFFFFF - color)
      CCGui.Add("Text", Inverted, A_Clipboard)
      CCGui.Show("xCenter y0 AutoSize h30")
    }
  } else if (ClipboardCommas() == 3) {
    CoordsRect := StrSplit(A_Clipboard, ",")
    CoordsRect[3] := CoordsRect[3] - CoordsRect[1]
    CoordsRect[4] := CoordsRect[4] - CoordsRect[2]
    SelectedGui.Show("NA x" CoordsRect[1] "y" CoordsRect[2] "w" CoordsRect[3] "h" CoordsRect[4])
  } else if (InStr(A_Clipboard, "0x") and not WinExist("CCGui")) {
    global CCGui := Gui()
    CCGui.Opt("-Caption +AlwaysOnTop -Owner")
    CCGui.Title := "CCGui"
    CCGui.BackColor := A_Clipboard
    CCGui.Show("xCenter y0 AutoSize h30")
  }
  return
}

/* Drawing selection GUI */

!LButton:: { ; Starts drawing selection
  MouseGetPos &OriginX, &OriginY
  global OX := OriginX
  global OY := OriginY
  SetTimer(DrawRectangle, 10)
  Return
}

~LButton:: { ; Destroys or hides GUIs present
  if (WinExist("CCGui")) {
    CCGui.Destroy()
  }
  if (WinExist("SelectedGui")) {
    SelectedGui.Hide()
  }
}

!LButton Up:: { ; Stops drawing selection
  SetTimer(DrawRectangle, 0)
  A_Clipboard := X1 "," A_Space Y1 "," A_Space X2 "," A_Space Y2
  Return
}

DrawRectangle() {  ; Lets you draw selection rectangles
  MouseGetPos &X2, &Y2
  ; Allow dragging to the left of the click point.
  If (X2 < OX) {
    global X1 := X2
    global X2 := OX
  } Else {
    global X1 := OX
  }
  ; Allow dragging above the click point.
  If (Y2 < OY) {
    global Y1 := Y2
    global Y2 := OY
  } Else {
    global Y1 := OY
  }
  ; Draw the rectangle
  global W1 := X2 - X1, H1 := Y2 - Y1
  SelectedGui.Show("NA x" X1 "y" Y1 "w" W1 "h" H1)
}

ClipboardCommas() {  ; Finds amount of commas in clipboard
  commas := StrLen(RegExReplace(A_Clipboard, "[^,]"))
  return commas
}

+F8:: {
  ExitApp
  Return
}