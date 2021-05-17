#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  AutoQuit = true
		  
		  dim sourceFolder as FolderItem = GetFolderItem("/Applications/REALbasic/Plugins", folderitem.PathTypeShell)
		  dim destFolder   as FolderItem = GetFolderItem("/Applications/REALbasic/PluginsNewStyle", folderitem.PathTypeShell)
		  
		  
		  if sourceFolder.Exists = false or destFolder.Exists = false then
		    MsgBox "Please change paths in app.open!"
		  else
		    Process  sourceFolder, destFolder
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Copy(source as FolderItem, dest as FolderItem)
		  
		  if source.Directory then
		    
		    dim c as integer = source.Count
		    for i as integer = 1 to c
		      dim f as FolderItem = source.TrueItem(i)
		      if f=nil then
		        'ignore
		      elseif f.Directory then
		        dim d as FolderItem = dest.Child(f.name)
		        d.CreateAsFolder
		        Copy f, d
		      else
		        CopyFile f, dest
		      end if
		    next
		  else
		    CopyFile source, dest
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFile(source as FolderItem, z as FolderItem)
		  source.CopyFileTo z
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyRoot(source as FolderItem, dest as FolderItem)
		  
		  dim c as integer = source.Count
		  for i as integer = 1 to c
		    dim f as FolderItem = source.TrueItem(i)
		    if f<>nil and f.Directory then
		      dim d as FolderItem = dest.Child(f.name)
		      d.CreateAsFolder
		      Copy f, d
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Process(folder as FolderItem, destfolder as FolderItem)
		  dim files() as FolderItem
		  
		  dim c as integer = folder.Count
		  for i as integer = 1 to c
		    files.append folder.TrueItem(i)
		  next
		  
		  for each f as FolderItem in files
		    if f<>Nil and f.Exists and f.Visible and f.Directory = false then
		      if Right(f.Name,4) = ".rbx" then
		        ProcessFile f, destfolder
		      end if
		    end if
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFile(file as FolderItem, destfolder as FolderItem)
		  dim destfile as FolderItem = destfolder.Child(file.Name)
		  
		  dim v as VirtualVolume = file.OpenAsVirtualVolume
		  
		  if v = nil then
		    MsgBox file.Name+" is not a valid plugin!?"
		    quit
		  end if
		  
		  System.DebugLog destfile.NativePath
		  
		  destfile.CreateAsFolder
		  
		  CopyRoot v.Root, destfile
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
