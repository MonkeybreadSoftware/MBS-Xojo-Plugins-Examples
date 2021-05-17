#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   755228533
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  buildCodes
		  buf = New Picture(100,100,32)
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.db")
		  dim d as new REALSQLDatabase
		  
		  d.DatabaseFile = f
		  
		  if d.CreateDatabaseFile then
		    
		    d.SQLExecute "create table letter (font varchar, size integer, code integer, style integer, data blob)"
		    
		    if d.Error then
		      MsgBox d.ErrorMessage
		      quit
		    end if
		    
		    db = d
		    
		    AddFont "Monaco", 12, 0
		    AddFont "Monaco", 18, 0
		    AddFont "Monaco", 24, 0
		    
		    AddFont "Times", 12, 0
		    AddFont "Times", 18, 0
		    AddFont "Times", 24, 0
		    
		    AddFont "Monaco", 12, stBold
		    AddFont "Monaco", 18, stBold
		    AddFont "Monaco", 24, stBold
		    
		    AddFont "Times", 12, stBold
		    AddFont "Times", 18, stBold
		    AddFont "Times", 24, stBold
		    
		    AddFont "Monaco", 12, stUnderline
		    AddFont "Monaco", 18, stUnderline
		    AddFont "Monaco", 24, stUnderline
		    
		    AddFont "Times", 12, stUnderline
		    AddFont "Times", 18, stUnderline
		    AddFont "Times", 24, stUnderline
		    
		    AddFont "Monaco", 12, stItalic
		    AddFont "Monaco", 18, stItalic
		    AddFont "Monaco", 24, stItalic
		    
		    AddFont "Times", 12, stItalic
		    AddFont "Times", 18, stItalic
		    AddFont "Times", 24, stItalic
		    
		    db.Commit
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddCode(name as string, size as integer, code as integer, Style as integer)
		  dim g as Graphics = buf.Graphics
		  dim s as string = encodings.utf8.chr(code)
		  
		  SetStyle g, style
		  g.TextFont = name
		  g.TextSize = size
		  
		  dim w as integer = g.StringWidth(s)
		  dim h as integer = G.StringHeight(s,100)
		  
		  if w<1 then Return
		  if h<1 then Return
		  
		  dim p as Picture = New Picture(w,h,32)
		  g = p.Graphics
		  
		  SetStyle g, style
		  g.TextSize = size
		  g.TextFont = name
		  g.DrawString s, 0, size
		  
		  dim data as string = PictureToPNGStringMBS(p,0)
		  
		  dim r as new DatabaseRecord
		  
		  r.Column("font")=name
		  r.IntegerColumn("size")=size
		  r.IntegerColumn("code")=code
		  r.IntegerColumn("style")=style
		  r.BlobColumn("data")=data
		  
		  db.InsertRecord("letter",r)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddFont(name as string, size as integer, Style as integer)
		  for each code as integer in codes
		    AddCode name, size, code, Style
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildCodes()
		  // which letters do we need?
		  // Let's take MacRoman encoding and pick all characters there.
		  
		  for i as integer = 32 to 255
		    dim s as string = encodings.MacRoman.Chr(i)
		    
		    s = ConvertEncoding(s, Encodings.UTF8)
		    
		    codes.Append asc(s)
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStyle(g as Graphics, Style as integer)
		  if BitwiseAnd(style, stBold)<>0 then
		    g.Bold = true
		  else
		    g.Bold = False
		  end if
		  
		  if BitwiseAnd(style, stItalic)<>0 then
		    g.Italic = true
		  else
		    g.Italic = false
		  end if
		  
		  if BitwiseAnd(style, stUnderline)<>0 then
		    g.Underline = true
		  else
		    g.Underline = false
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private buf As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Codes(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private db As REALSQLDatabase
	#tag EndProperty


	#tag Constant, Name = stBold, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = stItalic, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = stUnderline, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
