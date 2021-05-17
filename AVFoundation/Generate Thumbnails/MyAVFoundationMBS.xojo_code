#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub generateCGImagesAsynchronouslyForTimesCompleted(generator as AVAssetImageGeneratorMBS, requestedTime as CMTimeMBS, image as Variant, actualTime as CMTimeMBS, result as integer, error as NSErrorMBS, tag as variant)
		  
		  // find our stuff
		  dim f as FolderItem = app.files.Value(tag)
		  dim a as AVAssetMBS = app.assets.Value(tag)
		  dim g as AVAssetImageGeneratorMBS = app.Generators.Value(tag)
		  
		  Select case result
		  case AVAssetImageGeneratorMBS.AVAssetImageGeneratorSucceeded
		    
		    dim name as string = f.NameWithoutExtensionMBS+" thumbnail at "+str(actualTime.Seconds)+"s.jpg"
		    dim imagefile as FolderItem = f.parent.Child(name)
		    
		    // compress using CGImageDestinationMBS
		    dim options as new Dictionary
		    
		    // 80% quality
		    options.Value(CGImageDestinationMBS.kCGImageDestinationLossyCompressionQuality) = 0.8
		    
		    dim d as new CGImageDestinationMBS(imagefile, "public.jpeg", 1)
		    
		    d.AddImage(image, options)
		    
		    if d.Finalize then
		      System.DebugLog "Image saved: "+name
		    else
		      MsgBox "Failed to save."
		    end if
		    
		  case AVAssetImageGeneratorMBS.AVAssetImageGeneratorCancelled
		    
		  case AVAssetImageGeneratorMBS.AVAssetImageGeneratorFailed
		    MsgBox error.localizedDescription
		    
		  end Select
		  
		End Sub
	#tag EndEvent


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
