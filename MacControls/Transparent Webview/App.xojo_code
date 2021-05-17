#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  webview=new WebViewMBS(0,0,600,400)
		  
		  webview.autoresizingMask = NSViewMBS.NSViewHeightSizable+NSViewMBS.NSViewWidthSizable
		  webview.autoresizesSubviews=true
		  WebView.drawsBackground=false
		  
		  'dim url as string = "http://apple.com"
		  'htm.LoadURL url // does not work
		  
		  dim file as FolderItem
		  
		  file=FindFile("test.html")
		  webview.mainFrame.LoadURL file.URLPath
		  
		  dim winStyle as integer = NSWindowMBS.NSBorderlessWindowMask
		  
		  win=new NSWindowMBS(700,screen(0).height-500,600,400, winStyle,2, false)
		  
		  win.isOpaque=False
		  win.Title = "This is a test Cocoa window"
		  win.showsResizeIndicator = true
		  win.hasShadow=true
		  win.backgroundColor=NSColorMBS.clearColor
		  win.isOpaque=false
		  win.HasShadow=false
		  'win.AlphaValue=0.0
		  win.contentView=WebView
		  win.show
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		webview As webviewmbs
	#tag EndProperty

	#tag Property, Flags = &h0
		win As nswindowMBS
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
