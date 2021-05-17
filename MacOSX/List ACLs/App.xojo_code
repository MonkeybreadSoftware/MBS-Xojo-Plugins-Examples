#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  // compare output to
		  // ls -le ~/Desktop
		  
		  dir SpecialFolder.desktop
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Check(item as FolderItem)
		  print item.UnixpathMBS
		  
		  dim a as ACLRightMBS = ACLRightMBS.NewACLFromFile(item, ACLRightMBS.kACLTypeExtended)
		  
		  if a = nil then
		    print "no ACL?"
		    Return
		  end if
		  
		  dim pa() as ACLEntryMBS = a.entries
		  
		  for each e as ACLEntryMBS in pa
		    dim Name as string = GetName(e)
		    dim items() as string
		    dim mask as UInt64 = e.PermSetMask
		    
		    'dim f as ACLFlagSetMBS = e.FlagSet
		    '
		    'if f.HasFlag(f.kACLFlagDeferInherit) then
		    'items.Append "FlagDeferInherit"
		    'end if
		    '
		    'if f.HasFlag(f.kACLEntryInherited) then
		    'items.Append "EntryInherited"
		    'end if
		    '
		    'if f.HasFlag(f.kACLEntryDirectoryInherit) then
		    'items.Append "EntryDirectoryInherit"
		    'end if
		    '
		    'if f.HasFlag(f.kACLEntryLimitInherit) then
		    'items.Append "EntryLimitInherit"
		    'end if
		    '
		    'if f.HasFlag(f.kACLEntryOnlyInherit) then
		    'items.Append "EntryOnlyInherit"
		    'end if
		    '
		    'if f.HasFlag(f.kACLFlagNoInherit) then
		    'items.Append "FlagNoInherit"
		    'end if
		    
		    
		    dim p as ACLPermSetMBS = e.PermSet
		    
		    if p.HasPerm(p.kACLDelete) then
		      items.Append "delete"
		    end if
		    
		    if p.HasPerm(p.kACLReadAttributes) then
		      items.Append "read attributes"
		    end if
		    
		    if p.HasPerm(p.kACLWriteAttributes) then
		      items.Append "write attributes"
		    end if
		    
		    if p.HasPerm(p.kACLReadExtraAttributes) then
		      items.Append "read extra attributes"
		    end if
		    
		    if p.HasPerm(p.kACLWriteExtraAttributes) then
		      items.Append "write extra attributes"
		    end if
		    
		    if p.HasPerm(p.kACLReadSecurity) then
		      items.Append "read security"
		    end if
		    
		    if p.HasPerm(p.kACLWritesecurity) then
		      items.Append "write security"
		    end if
		    
		    if p.HasPerm(p.kACLChangeOwner) then
		      items.Append "change owner"
		    end if
		    
		    if item.Directory then
		      
		      if p.HasPerm(p.kACLListDirectory) then
		        items.Append "list directory"
		      end if
		      
		      if p.HasPerm(p.kACLAddFile) then
		        items.Append "add file"
		      end if
		      
		      if p.HasPerm(p.kACLExecute) then
		        items.Append "execute"
		      end if
		      
		      if p.HasPerm(p.kACLAppendData) then
		        items.Append "append data"
		      end if
		      
		    else
		      
		      if p.HasPerm(p.kACLReadData) then
		        items.Append "read data"
		      end if
		      
		      if p.HasPerm(p.kACLWriteData) then
		        items.Append "write data"
		      end if
		      
		      if p.HasPerm(p.kACLSearch) then
		        items.Append "search"
		      end if
		      
		      if p.HasPerm(p.kACLAddSubDirectory) then
		        items.Append "add subdirectory"
		      end if
		      
		      if p.HasPerm(p.kACLDeleteChild) then
		        items.Append "delete child"
		      end if
		      
		    end if
		    
		    
		    print name+": "+Join(items, ", ")
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Dir(Folder as FolderItem)
		  dim c as integer = Folder.Count
		  for i as integer = 1 to c
		    dim item as FolderItem = folder.TrueItem(i)
		    
		    if item<>Nil then
		      Check item
		    end if 
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetName(e as ACLEntryMBS) As string
		  
		  dim q as MemoryBlock = e.Qualifier
		  
		  dim type as integer
		  dim id as integer
		  if ACLEntryMBS.UUIDtoID(q, ID, type) then
		    
		    if type = 0 then
		      dim name as string = ACLEntryMBS.UserFromUID(ID)
		      Return "user: "+name
		    elseif type = 1 then
		      dim name as string = ACLEntryMBS.GroupFromGID(ID)
		      Return "group: "+name
		    else
		      // error?
		      break
		    end if
		    
		  else
		    // error?
		    break
		  end if
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
