#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // search tessdata folder
		  dim fo as FolderItem = findfile("tessdata")
		  
		  if TargetWin32 then
		    // on Windows the parent folder
		    fo = fo.Parent
		  else
		    // path must be correct to have it find the files and point to folder where tessdata folder is inside
		    fo = fo.Parent
		  end if
		  
		  o = new TesseractMBS(fo, "eng")
		  dim n as integer = o.NumDawgs
		  
		  if n = 0 then
		    print "No lang data found!"
		    quit
		  end if
		  
		  dim f as FolderItem
		  
		  // pick a test file
		  if rnd<0.5 then
		    f = findfile("eurotext.tif")
		  else
		    f = findfile("phototest.tif")
		  end if
		  
		  dim t as TiffPictureMBS = f.OpenAsTiffMBS
		  dim p as Picture = t.Pict
		  
		  if p = nil then
		    print "No picture loaded!"
		    Return 4
		  end if
		  
		  if o.SetImage(p) then
		    
		    print o.GetText
		    
		    pic=p
		    
		    
		    Write
		  end if
		  
		  Exception ex as TesseractErrorExceptionMBS
		    
		    MsgBox "Exception: "+ex.message
		    
		End Function
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

	#tag Method, Flags = &h0
		Sub Write()
		  dim g as Graphics = pic.Graphics
		  
		  g.ForeColor=&cFF0000
		  
		  // check result
		  dim r as TesseractResultIteratorMBS = o.ResultIterator
		  
		  if r<>Nil then
		    do
		      
		      // query values like confidence
		      g.ForeColor=&c000000
		      if true then
		        dim Confidence as Double = r.Confidence(r.kLevelWord)
		        g.ForeColor=Rgb((100-Confidence)*2.55, Confidence*2.55, 0)
		      end if
		      
		      dim rleft, rtop, rright, rbottom as integer
		      
		      // query bounding box
		      if r.BoundingBox(r.kLevelWord, rleft, rtop, rright, rbottom) then
		        dim rwidth  as integer = rright  - rleft
		        dim rheight as integer = rbottom - rtop
		        
		        g.DrawRect rleft, rtop, rwidth, rHeight
		      end if
		      
		      // and go to next word
		    loop until r.NextItem(r.kLevelWord) = false
		    
		  end if
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("output.jpg")
		  pic.Save(f, pic.SaveAsJPEG, 90)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		o As TesseractMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="pic"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
