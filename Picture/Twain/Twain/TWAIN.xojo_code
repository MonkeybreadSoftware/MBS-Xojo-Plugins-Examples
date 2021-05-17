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
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		win As MainWindow
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
	#tag EndViewBehavior
End Class
#tag EndClass
