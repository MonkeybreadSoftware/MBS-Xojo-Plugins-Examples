#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&File"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Edit"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Undo"
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Index = -2147483648
         Text = "Cu&t"
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Copy"
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Index = -2147483648
         Text = "&Paste"
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kEditClear"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Index = -2147483648
         Text = "Select &All"
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ScaleModeMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Scale Mode"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 0
         Text = "Fast"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 1
         Text = "Triangle"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 2
         Text = "Box"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 3
         Text = "Lanczos3"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 4
         Text = "Lanczos8"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 5
         Text = "Mitchell"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 6
         Text = "Poly3"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin ScaleMenuItem ScaleMode
         SpecialMenu = 0
         Index = 7
         Text = "Cubic"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ImageModeMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "Image Mode"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin MenuItem ImageFormatRGB
         SpecialMenu = 0
         Index = -2147483648
         Text = "RGB"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ImageFormatRGBA
         SpecialMenu = 0
         Index = -2147483648
         Text = "RGBA"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ImageFormatG
         SpecialMenu = 0
         Index = -2147483648
         Text = "G"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ImageFormatGA
         SpecialMenu = 0
         Index = -2147483648
         Text = "GA"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
