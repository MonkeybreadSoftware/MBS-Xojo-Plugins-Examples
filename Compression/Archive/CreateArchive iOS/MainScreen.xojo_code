#tag MobileScreen
Begin MobileScreen MainScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "Archive"
   Top             =   0
   Begin MobileTextArea Output
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   Output, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Output, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Output, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Output, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      BorderStyle     =   0
      ControlCount    =   0
      Enabled         =   True
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      ReadOnly        =   False
      Scope           =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  CreateTestFiles
		  CreateArchive SpecialFolder.Documents.Child("test"), SpecialFolder.Documents.child("test.tar"), ArchiveWriterMBS.kFilterNone, ArchiveWriterMBS.kFormatTar
		  
		  
		  log "done"
		  
		  log SpecialFolder.Documents.child("test.tar").NativePath
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateArchive(item as FolderItem, destFile as FolderItem, Filter as integer, Format as integer, ZipLevel as integer = 0)
		  dim flags as integer = 0
		  
		  flags = Bitwise.BitOr(flags, ArchiveReaderMBS.kExtractTime)
		  flags = Bitwise.BitOr(flags, ArchiveReaderMBS.kExtractPermission)
		  flags = Bitwise.BitOr(flags, ArchiveReaderMBS.kExtractACL)
		  flags = Bitwise.BitOr(flags, ArchiveReaderMBS.kExtractFileFlags)
		  
		  dim aw as new ArchiveWriterMBS
		  
		  aw.AddFilter filter
		  
		  if aw.Lasterror <> aw.kArchiveOK then
		    log "Failed to set filter with error "+aw.Lasterror.ToString+": "+aw.ErrorString
		    exit
		  end if
		  
		  aw.SetFormat Format
		  
		  if aw.Lasterror <> aw.kArchiveOK then
		    log "Failed to set format with error "+aw.Lasterror.ToString+": "+aw.ErrorString
		    exit
		  end if
		  
		  
		  
		  Select case ZipLevel
		  case 1
		    aw.ZipSetCompressionStore
		  case 2
		    aw.ZipSetCompressionDeflate
		  end Select
		  
		  log "Create "+destFile.name
		  
		  if not aw.CreateFile(destFile) then
		    
		    log "Failed to create file: "+aw.ErrorString
		    
		    return
		    
		  end if
		  
		  if not aw.SetCurrentWorkingDirectory(item.parent) then
		    log "Failed to set working directory."
		    return
		  end if
		  
		  
		  dim disk as new ArchiveReadDiskMBS
		  
		  
		  if not disk.Open(item.name) then
		    log "Failed to set item for compress."
		    return
		  end if
		  
		  
		  do
		    dim entry as ArchiveEntryMBS = disk.NextHeader
		    
		    if disk.Lasterror = disk.kArchiveEOF then
		      exit
		    end if
		    
		    if disk.Lasterror <> disk.kArchiveOK then
		      log "Failed to get next item with error "+(disk.Lasterror.ToString)+": "+disk.ErrorString
		      exit
		    end if
		    
		    if entry = nil then
		      break
		      exit
		    end if
		    
		    dim PathName as string = entry.PathName
		    dim FileName as string = PathName.NthField("/", PathName.CountFields("/"))
		    If FileName.Left(1) = "." Then Continue // skip
		    
		    disk.Descend
		    
		    log "add "+PathName
		    
		    // make flat archive
		    'entry.PathName = filename
		    aw.WriteHeader entry
		    
		    if aw.Lasterror <> aw.kArchiveOK then
		      log "Failed to write header with error "+aw.Lasterror.ToString+": "+aw.ErrorString
		      exit
		    end if
		    
		    dim size as int64 = aw.WriteData(disk)
		    log size.ToString + " bytes"
		    
		    // optional close each item.
		    'aw.FinishEntry
		    
		    if aw.Lasterror <> aw.kArchiveOK then
		      log "Failed to finish entry with error "+aw.Lasterror.ToString+": "+disk.ErrorString
		      exit
		    end if
		    
		  loop
		  
		  
		  
		  aw.Close
		  disk.Close  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTestFiles()
		  Dim f As FolderItem = SpecialFolder.Documents.Child("test")
		  
		  f.CreateFolder
		  
		  // write test file
		  dim t as TextOutputStream = TextOutputStream.Create(f.Child("test.txt"))
		  
		  t.WriteLine "Hello World"
		  
		  // write two files with logos
		  dim p as Picture = LogoMBS(500)
		  p.Save(f.Child("mbs.jpg"), picture.Formats.JPEG)
		  
		  p.Save(f.Child("logo.jpg"), picture.Formats.JPEG)
		  
		  // write second text file
		  t = TextOutputStream.Create(f.Child("other.txt"))
		  
		  t.WriteLine "Just a test"
		  
		  
		  // write 10 MB file with all zeros, good to compress
		  dim b as BinaryStream = BinaryStream.Create(f.Child("zeros.txt"), true)
		  dim m as new MemoryBlock(1024*1024*10)
		  
		  b.Write m
		  
		  
		  dim subfolder as FolderItem = f.Child("sub folder")
		  
		  subfolder.CreateFolder
		  p.Save(subfolder.Child("logo2.jpg"), picture.Formats.JPEG)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(s as string)
		  output.Text  = output.Text + s + EndOfLine
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
