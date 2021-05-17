#tag Class
Protected Class TWAIN
Inherits TwainMBS
	#tag Event
		Sub CloseRequest()
		  System.DebugLog CurrentMethodName
		  
		  if win <> nil then
		    if win.ControlCount = 0 then
		      // window already closed!
		      win = nil
		    else
		      // start timer to do close
		      win.CloseTimer.Mode = timer.ModeSingle
		    end if
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TransferEnded(pic as picture, ImageInfo as TwainImageInfoMBS, sliced as boolean, layout as TwainImageLayoutMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TransferProgress(percent as double, dataRead as Int64, DataSize as Int64, ImageInfo as TwainImageInfoMBS, NewDataSize as integer, NewData as Memoryblock, NewPicture as Picture, layout as TwainImageLayoutMBS, Columns as Integer, Rows as Integer, XOffset as Integer, YOffset as Integer)
		  System.DebugLog CurrentMethodName+" "+str(percent)
		  
		  MainWindow.Canvas1.Backdrop = NewPicture
		  
		  count = count + 1
		  
		  
		  if NewPicture <> Nil then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("TransferImage "+str(count)+".jpg")
		    NewPicture.Save(f, NewPicture.SaveAsJPEG)
		  end if
		  
		  if NewData <> Nil then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("TransferImage "+str(count)+".dat")
		    dim b as BinaryStream = BinaryStream.Create(f, true)
		    
		    b.Write NewData.StringValue(0, NewDataSize)
		    b.Close
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TransferReady()
		  System.DebugLog CurrentMethodName
		  
		  if win <> nil then
		    if win.ControlCount = 0 then
		      // window already closed!
		      win = nil
		    else
		      // start timer to do transfer
		      win.TransferTimer.Mode = timer.ModeSingle
		    end if
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function TransferStarted(DataSize as Int64, ImageInfo as TwainImageInfoMBS, layout as TwainImageLayoutMBS) As boolean
		  System.DebugLog CurrentMethodName+" "+str(DataSize)
		  
		  // you can decide here if you want to use slices only
		  // Return true to not get a big picture on the end
		  // if data for image can't be allocated you get sliced automatically.
		  
		  if ImageInfo.ImageWidth > 5000 or ImageInfo.ImageLength > 5000 then
		    System.DebugLog "Image to large, so we use slices."
		    Return true
		  end if
		  
		  if DataSize > 100000000 then // no images over 100 MB in one chunk
		    System.DebugLog "Image to big, so we use slices."
		    Return true
		  end if
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		count As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Win As MainWindow
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="count"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
