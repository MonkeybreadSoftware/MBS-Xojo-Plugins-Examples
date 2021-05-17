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
   MenuBar         =   1534592492
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Tets"
   Visible         =   True
   Width           =   600
   Begin Listbox list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "80%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Method	Time"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim TestTiff as FolderItem = SpecialFolder.Desktop.Child("TestTiff")
		  
		  if TestTiff.Exists = false then
		    MsgBox "Please provide folder TestTiff on desktop with a dozen sample images."
		  end if
		  
		  dim TestJPEG as FolderItem = SpecialFolder.Desktop.Child("TestJPEG")
		  
		  if TestJPEG.Exists = false then
		    MsgBox "Please provide folder TestJPEG on desktop with a dozen sample images."
		  end if
		  
		  dim TestResult as FolderItem = SpecialFolder.Desktop.Child("TestResult")
		  TestResult.CreateAsFolder
		  
		  TestJPEGwithRB TestJPEG, TestResult
		  TestTIFFwithRB TestTiff, TestResult
		  
		  TestJPEGwithMBS TestJPEG, TestResult
		  TestTIFFwithMBS TestTiff, TestResult
		  
		  TestJPEGwithFasterMBS TestJPEG, TestResult
		  TestTIFFwithFasterMBS TestTiff, TestResult
		  
		  TestJPEGwithCoreImage TestJPEG, TestResult
		  TestTIFFwithCoreImage TestTiff, TestResult
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ProportinalScaled(pic as Picture, Width as integer, Height as Integer) As Picture
		  // Calculate scale factor
		  
		  dim faktor as Double = min( Height / Pic.Height, Width / Pic.Width)
		  
		  // Calculate new size
		  dim w as integer = Pic.Width * faktor
		  dim h as integer = Pic.Height * faktor
		  
		  // create new picture
		  dim NewPic as new Picture(w,h,32)
		  
		  // draw picture in the new size
		  NewPic.Graphics.DrawPicture Pic, 0, 0, w, h, 0, 0, Pic.Width, Pic.Height
		  
		  // return result
		  Return NewPic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestJPEGwithCoreImage(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  dim c as integer = source.Count
		  dim filter as new CIFilterLanczosScaleTransformMBS
		  
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    
		    if Right(item.name,4) = ".jpg" then
		      dim image as new CIImageMBS(item)
		      dim w as integer = Image.Extent.Width
		      dim h as integer = image.Extent.Height
		      dim l as integer = max(w,h)
		      
		      filter.inputImage = image
		      filter.inputAspectRatio = 1.0
		      filter.inputScale = 100.0/l
		      
		      dim out as FolderItem = dest.Child(CurrentMethodName+" "+item.name)
		      
		      dim img as CIImageMBS = filter.outputImage
		      dim nimg as NSImageMBS = img.RenderNSImage(false)
		      dim data as string = nimg.JPEGRepresentationWithCompressionFactor(0.8)
		      dim b as BinaryStream = BinaryStream.Create(out, true)
		      b.Write data
		      b.Close
		      
		    end if
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestJPEGwithFasterMBS(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    
		    if Right(item.name,4) = ".jpg" then
		      dim ji as new JPEGImporterMBS
		      
		      ji.File = item
		      
		      if ji.ReadHeader then
		        dim w as integer = ji.Width
		        dim h as integer = ji.Height
		        dim l as integer = max(w,h)
		        
		        dim d as integer = l/100.0
		        
		        if d>8 then
		          ji.ScaleFactor = 8
		        elseif d>4 then
		          ji.ScaleFactor = 4
		        elseif d>2 then
		          ji.ScaleFactor = 2
		        end if
		        ji.Import
		        
		        dim p as Picture = ji.Picture
		        
		        p = ProportinalScaled(p, 100, 100)
		        
		        dim out as FolderItem = dest.Child(CurrentMethodName+" "+item.name)
		        if p<>Nil then
		          p.Save(out, p.SaveAsJPEG)
		        end if
		      end if
		    end if
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestJPEGwithMBS(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    
		    if Right(item.name,4) = ".jpg" then
		      dim p as Picture = item.OpenAsJPEGMBS
		      
		      p = ProportinalScaled(p, 100, 100)
		      
		      dim out as FolderItem = dest.Child(CurrentMethodName+" "+item.name)
		      if p<>Nil then
		        p.Save(out, p.SaveAsJPEG)
		      end if
		    end if
		    
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestJPEGwithRB(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    
		    if Right(item.name,4) = ".jpg" then
		      dim p as Picture = Picture.Open(item)
		      
		      p = ProportinalScaled(p, 100, 100)
		      
		      dim out as FolderItem = dest.Child(CurrentMethodName+" "+item.name)
		      if p<>Nil then
		        p.Save(out, p.SaveAsJPEG)
		      end if
		    end if
		    
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestTIFFwithCoreImage(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  dim filter as new CIFilterLanczosScaleTransformMBS
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    System.DebugLog item.name
		    
		    if Right(item.name,4) = ".tif" or Right(item.name,5) = ".tiff" then
		      
		      dim image as new CIImageMBS(item)
		      dim w as integer = Image.Extent.Width
		      dim h as integer = image.Extent.Height
		      dim l as integer = max(w,h)
		      
		      filter.inputImage = image
		      filter.inputAspectRatio = 1.0
		      filter.inputScale = 100.0/l
		      
		      dim out as FolderItem = dest.Child(CurrentMethodName+" "+item.name)
		      
		      dim img as CIImageMBS = filter.outputImage
		      dim nimg as NSImageMBS = img.RenderNSImage(false)
		      dim data as string = nimg.JPEGRepresentationWithCompressionFactor(0.8)
		      dim b as BinaryStream = BinaryStream.Create(out, true)
		      b.Write data
		      b.Close
		    end if
		    
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestTIFFwithFasterMBS(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    System.DebugLog item.name
		    
		    if Right(item.name,4) = ".tif" or Right(item.name,5) = ".tiff" then
		      dim tt as TiffPictureMBS = item.OpenAsTiffMBS(true)
		      
		      if tt<>nil then
		        dim w as integer = tt.Width
		        dim h as integer = tt.Height
		        dim l as integer = max(w,h)
		        
		        dim d as integer = l/100.0
		        dim p as Picture
		        
		        if d>1 then
		          call tt.ReadPreviewRGB(d)
		        else
		          call tt.ReadRGB
		        end if
		        
		        p = tt.CombinePictureWithMask
		        if p<>Nil then
		          p = ProportinalScaled(p, 100, 100)
		          dim n as string = item.Name
		          n = ReplaceAll(n, ".tiff", "")
		          n = ReplaceAll(n, ".tif", "")
		          dim out as FolderItem = dest.Child(CurrentMethodName+" "+n+".jpg")
		          if p<>Nil then
		            p.Save(out, p.SaveAsJPEG)
		          end if
		        end if
		      else
		        System.DebugLog "Failed to read "+item.Name
		      end if
		    end if
		    
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestTIFFwithMBS(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    
		    System.DebugLog item.name
		    
		    if Right(item.name,4) = ".tif" or Right(item.name,5) = ".tiff" then
		      dim tt as TiffPictureMBS = item.OpenAsTiffMBS
		      dim p as Picture = tt.CombinePictureWithMask
		      
		      if p<>Nil then
		        p = ProportinalScaled(p, 100, 100)
		        dim n as string = item.Name
		        n = ReplaceAll(n, ".tiff", "")
		        n = ReplaceAll(n, ".tif", "")
		        dim out as FolderItem = dest.Child(CurrentMethodName+" "+n+".jpg")
		        if p<>Nil then
		          p.Save(out, p.SaveAsJPEG)
		        end if
		      else
		        System.DebugLog "Failed to read "+item.Name
		      end if
		    end if
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestTIFFwithRB(source as FolderItem, dest as FolderItem)
		  dim t as integer = ticks
		  
		  dim c as integer = source.Count
		  
		  for i as integer = 1 to c
		    dim item as FolderItem = source.TrueItem(i)
		    
		    System.DebugLog item.name
		    
		    if Right(item.name,4) = ".tif" or Right(item.name,5) = ".tiff" then
		      dim p as Picture = Picture.Open(item)
		      
		      p = ProportinalScaled(p, 100, 100)
		      dim n as string = item.Name
		      n = ReplaceAll(n, ".tiff", "")
		      n = ReplaceAll(n, ".tif", "")
		      dim out as FolderItem = dest.Child(CurrentMethodName+" "+n+".jpg")
		      if p<>Nil then
		        p.Save(out, p.SaveAsJPEG)
		      end if
		    end if
		    
		  next
		  
		  
		  t = ticks -t
		  
		  list.AddRow CurrentMethodName, str(t)
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
