#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim a as new ABAddressBookMBS
		  if a.Handle = 0 then
		    MsgBox "Failed to access shared AddressBook."
		    Return
		  end if
		  
		  dim p as ABPersonMBS = a.owner
		  
		  dim m as ABMutableMultiValueMBS
		  dim v as ABMultiValueMBS = p.valueForProperty(a.kABAddressProperty)
		  if v = nil then
		    // create new addresses 
		    m = new ABMutableMultiValueMBS
		  else
		    m = v.edit // edit existing addresses
		  end if
		  
		  // add an address
		  dim d as new Dictionary
		  
		  d.Value(a.kABAddressCityKey)="Berlin"
		  d.Value(a.kABAddressCountryKey)="Germany"
		  d.Value(a.kABAddressStateKey)="New York"
		  d.Value(a.kABAddressStreetKey)="Sixth Avenue 5"
		  d.Value(a.kABAddressCountryCodeKey)="de"
		  d.Value(a.kABAddressZIPKey)="12345"
		  
		  // add a home Address
		  dim homeid as string = m.addValue(d,a.kABAddressHomeLabel)
		  
		  // and make primary
		  call m.setPrimaryIdentifier(homeid)
		  
		  // write back
		  call p.setValue m,a.kABAddressProperty
		  m=nil
		  
		  // save
		  if a.save then
		    call p.ShowInAddressbook
		  else
		    msgBox "Addressbook could not be saved."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
