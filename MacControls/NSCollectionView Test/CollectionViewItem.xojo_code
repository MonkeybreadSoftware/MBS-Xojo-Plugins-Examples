#tag Class
Protected Class CollectionViewItem
	#tag Method, Flags = &h0
		Sub Constructor()
		  IDCounter = IDCounter + 1
		  ID = str(IDCounter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(ViewItem as NSCollectionViewItemMBS)
		  Self.ViewItem = ViewItem
		  
		  // lets make a new container if this is first time used
		  If NSView = Nil Then
		    
		    // first time this item is shown
		    ImageContainer = New ImageContainer
		    
		    // place new item outside visible area
		    ImageContainer.EmbedWithin(MainWindow, -10000, 10000, ImageContainer.Width, ImageContainer.Height)
		    
		    Dim n As NSViewMBS = ImageContainer.NSViewMBS
		    
		    If n = Nil Then
		      Break // no view?
		    End If
		    
		    Dim autoresizingMask As Integer = NSViewMBS.NSViewWidthSizable + NSViewMBS.NSViewHeightSizable
		    
		    // remove from window where xojo placed it above
		    n.removeFromSuperview
		    n.frame = New NSRectMBS(0, 0, ImageContainer.Width, ImageContainer.Height)
		    
		    NSView = n
		    
		  End If
		  
		  
		  If imageFile <> Nil Then
		    // load image if needed
		    
		    Dim p As Picture = Picture.Open(ImageFile)
		    ImageContainer.ImageField.Image = p
		    ImageContainer.NameField.Text = ImageFile.DisplayName
		    
		  End If
		  
		  
		  // now add it and show it in the controller
		  
		  Dim view As NSViewMBS = ViewItem.view
		  view.addSubview NSView
		  
		  NSView.needsDisplay = True
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared IDCounter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageContainer As ImageContainer
	#tag EndProperty

	#tag Property, Flags = &h0
		imageFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		NSView As NSViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ViewItem As NSCollectionViewItemMBS
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
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
