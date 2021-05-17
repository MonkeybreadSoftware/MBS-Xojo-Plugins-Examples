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
   Height          =   500
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1016700155
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "PNG Tests"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  write
		  read
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub read()
		  dim current as PictureMBS
		  dim f as FolderItem
		  dim intent as integer
		  dim name as string
		  dim compression as integer
		  dim data as string
		  
		  f=SpecialFolder.Temporary.child("test.png")
		  
		  if f<>Nil then
		    Current=nil
		    
		    dim p as new PNGReaderMBS
		    
		    if p.OpenFile(f) then
		      if p.ApplyOptions(0) then
		        if p.ReadsRGBTag(intent) then
		          if p.ReadICCProfile(name, compression, data) then
		            
		            Current=new PictureMBS(p.Width,p.Height,PictureMBS.ImageFormatRGB)
		            
		            dim i,c as integer
		            
		            c=p.Height-1
		            for i=0 to c
		              Current.RowInFormat(i, PictureMBS.ImageFormatRGBA)=p.ReadRow()
		            next
		            
		            Backdrop=Current.CopyPicture
		            
		            Title="Intent: "+str(intent)+", Profile: "+name+" ("+str(lenb(data))+")"
		          end if
		        end if
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub write()
		  
		  // This is for compression type. PNG 1.0-1.2 only define the single type.
		  const PNG_COMPRESSION_TYPE_BASE=0 // Deflate method 8, 32K window
		  
		  // These are for the sRGB chunk.
		  const PNG_sRGB_INTENT_PERCEPTUAL = 0
		  const PNG_sRGB_INTENT_RELATIVE   = 1
		  const PNG_sRGB_INTENT_SATURATION = 2
		  const PNG_sRGB_INTENT_ABSOLUTE   = 3
		  
		  const PNG_COLOR_MASK_PALETTE   = 1
		  const PNG_COLOR_MASK_COLOR     = 2
		  const PNG_COLOR_MASK_ALPHA     = 4
		  
		  dim f as FolderItem
		  dim current as new PictureMBS(LogoMBS(500)) // needs Main Plugin
		  
		  f=SpecialFolder.Temporary.child("test.png")
		  
		  if f<>Nil then
		    
		    dim profile as LCMS2ProfileMBS = LCMS2ProfileMBS.CreatesRGBProfile
		    dim profiledata as string = profile.SaveProfileToString
		    
		    dim p as new PNGWriterMBS
		    
		    p.Width=Current.Width
		    p.Height=Current.Height
		    p.Type=PNG_COLOR_MASK_COLOR
		    p.bpc=3
		    p.Rowbytes=p.Width*p.bpc
		    
		    if p.OpenWriteDestination(f) then
		      if p.SetHeader(false, -1) then
		        if p.SetGamma(0) then
		          if p.SetsRGB(PNG_sRGB_INTENT_ABSOLUTE) then
		            if p.SetICCProfile(profile.Name, PNG_COMPRESSION_TYPE_BASE, profiledata) then
		              if p.WriteInfo then
		                dim i,c as integer
		                
		                c=p.Height-1
		                for i=0 to c
		                  p.WriteRow current.RowInFormat(i, Current.ImageFormatRGB)
		                next
		                
		                if p.WriteEnd then
		                  MsgBox "OK"
		                end if
		              end if
		            end if
		          end if
		        end if
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod


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
