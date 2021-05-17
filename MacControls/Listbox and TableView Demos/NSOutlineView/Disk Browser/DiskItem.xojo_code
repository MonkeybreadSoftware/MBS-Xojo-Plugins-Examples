#tag Class
Protected Class DiskItem
Inherits NSOutlineViewItemMBS
	#tag Method, Flags = &h0
		Sub AddChild(f as FolderItem)
		  children.Append new DiskItem (mTableView, f, me)
		  mChildrenByPath = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildAtIndex(index as Integer) As DiskItem
		  fetchChildren()
		  return children (index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildCount() As Integer
		  fetchChildren()
		  return children.Ubound + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearChildren()
		  redim children(-1)
		  mLoaded = false
		  mMonitor = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(lb as NSOutlineViewMBS)
		  me.Constructor (lb, nil, nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(lb as NSOutlineViewMBS, f as FolderItem, parent as DiskItem)
		  if parent <> nil then
		    if parent.mSelfRef = nil then
		      // We cache the parent's WeakRef to avoid creating many identical WeakRef instances
		      parent.mSelfRef = new WeakRef (parent)
		    end if
		    mParent = parent.mSelfRef
		  end if
		  mTableView = lb
		  me.f = f
		  if f <> nil then
		    mPath = f.UnixpathMBS+"/"
		  end if
		  super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fetchChildren()
		  if not mLoaded or mUpdateChildren then
		    // We're going to fetch the folder contents now.
		    
		    // Let's also install a watcher for changes to the folder so that we can automatically update the list
		    if me.f <> nil and mMonitor = nil then
		      mMonitor = new FolderMonitor (mPath, AddressOf folderHasChanged)
		    end if
		    
		    if me.f <> nil then
		      dim newChildren() as DiskItem
		      me.f = GetFolderItem(f.NativePath) ' recreates the FolderItem so that it doesn't use cached information
		      dim n as Integer = me.f.Count
		      for i as Integer = 1 to n
		        dim f2 as FolderItem = f.TrueItem (i)
		        dim item as DiskItem
		        if gShowHidden or f2 <> nil and f2.Visible then
		          if mUpdateChildren and f2 <> nil then
		            // This means we'll have to keep existing children (this assures that any expanded folders in the list remain that way)
		            item = findChild (f2)
		          end if
		          if item = nil then
		            item = new DiskItem (mTableView, f2, me)
		          end if
		          newChildren.Append item
		          mChildrenByPath = nil
		        end if
		      next
		      me.children = newChildren
		    end if
		    
		    mUpdateChildren = false
		    mLoaded = true
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindByPath(path as String) As DiskItem
		  // Recurses into its children
		  
		  if path = "" then
		    return nil
		  end if
		  
		  if path.Right(1) <> "/" then
		    path = path + "/"
		  end if
		  
		  dim node as DiskItem = findChild (path)
		  if node <> nil then
		    return node
		  end if
		  
		  // Try the parents
		  dim dirs() as String = path.Split("/")
		  do
		    call dirs.Pop
		    if dirs.Ubound <= 0 then
		      exit
		    end if
		    dirs(dirs.Ubound) = ""
		    node = findChild (Join (dirs, "/"))
		    if node <> nil then
		      node.fetchChildren()
		      return node.FindByPath (path)
		    end if
		  loop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function findChild(f as FolderItem) As DiskItem
		  // Looks only at immediate children
		  
		  if f <> nil then
		    dim path as String = f.UnixpathMBS+"/"
		    return findChild (path)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function findChild(path as String) As DiskItem
		  // Looks only at immediate children
		  
		  if mChildrenByPath = nil then
		    // rebuild the cache
		    mChildrenByPath = new Dictionary
		    for each child as DiskItem in me.children
		      mChildrenByPath.Value (child.mPath) = child
		    next
		  end if
		  
		  return mChildrenByPath.Lookup (path, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub folderHasChanged(path as String)
		  me.UpdateChildrenFromDisk
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderItem() As FolderItem
		  return me.f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolder() As Boolean
		  return f <> nil and f.Directory
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent() As DiskItem
		  if mParent <> nil then
		    return DiskItem(mParent.Value)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path() As String
		  return mPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateChildrenFromDisk()
		  mUpdateChildren = true
		  mTableView.reloadItem (me, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateFromDisk()
		  me.f = PathToFolderItemMBS (mPath)
		  mTableView.reloadItem (me, false)
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Written 8 Mar 2017 by Thomas Tempelmann, tempelmann@gmail.com
		Consider this sample code - you made use it as you like.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private children() As DiskItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private f As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gShowHidden As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChildrenByPath As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLoaded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMonitor As FolderMonitor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParent As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelfRef As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTableView As NSOutlineViewMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpdateChildren As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return gShowHidden
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  gShowHidden = value
			End Set
		#tag EndSetter
		Shared ShowHidden As Boolean
	#tag EndComputedProperty


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
