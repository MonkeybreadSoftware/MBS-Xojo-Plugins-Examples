#tag Class
Protected Class scsm
Inherits TKSmartCardSlotManagerMBS
	#tag Event
		Sub gotSlotWithName(name as string, slot as TKSmartCardSlotMBS, tag as variant)
		  debugModule.Log(CurrentMethodName)
		  
		  Self.currentSlot = slot
		  
		  // connect event
		  AddHandler slot.StateChanged, WeakAddressOf SlotStateChanged
		  slot.SetDelegate
		  
		  If slot.State = slot.kStateValidCard Then
		    Dict = New Dictionary
		    IDPict = Nil
		    
		    debugModule.Log("SmartCardInitiated -> New Dictionary")
		    
		    ReadSlot slot
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub slotNamesChanged()
		  debugModule.Log(CurrentMethodName)
		  
		  debugModule.Log(CurrentMethodName + " | Before | OpenFirstSlot")
		  OpenFirstSlot
		  debugModule.Log(CurrentMethodName + " | After | OpenFirstSlot")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function addressFile() As MemoryBlock
		  Dim m As New MemoryBlock(4)
		  
		  m.UInt8Value(0) = &hDF
		  m.UInt8Value(1) = &h01
		  m.UInt8Value(2) = &h40
		  m.UInt8Value(3) = &h33
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addressFileReadCompleted(FileName as MemoryBlock, Content as MemoryBlock, error as NSErrorMBS, tag as Variant)
		  ''log CurrentMethodName
		  
		  debugModule.Log(CurrentMethodName)
		  
		  
		  If Content <> Nil Then
		    'Dim items As New Dictionary
		    
		    Dim cursor As Integer = 2
		    If cursor < content.Size And content.UInt8Value(cursor-2) <> 0 Then
		      'Dim length As Integer = content.UInt8Value(cursor-1)
		      'Dim t As Integer = content.UInt8Value(cursor-2)
		      
		      'items.Value(t) = content.MidB(cursor, length)
		      'cursor = cursor + length + 2
		      
		      Dim StreetLen As Integer = content.UInt8Value(1)
		      Dim Street    As String = DefineEncoding(content.MidB(2, StreetLen), encodings.UTF8)
		      
		      Dict.Value("Street") = Street
		      
		      debugModule.Log(CurrentMethodName + " : " + "Street = " + Street )
		      
		      ''log "Street: "+Street
		      
		      Dim postalCodeLen As Integer = content.UInt8Value(1+2+StreetLen)
		      Dim postalCode    As String = DefineEncoding(content.MidB(2+2+StreetLen, postalCodeLen), encodings.UTF8)
		      
		      Dict.Value("PostalCode") = postalCode
		      ''log "PostalCode: "+postalCode
		      
		      debugModule.Log(CurrentMethodName + " : " + "PostalCode = " + postalCode )
		      
		      Dim cityLen As Integer = content.UInt8Value(1+2+2+postalCodeLen+StreetLen)
		      Dim city    As String = DefineEncoding(content.MidB(2+2+2+postalCodeLen+StreetLen, cityLen), encodings.UTF8)
		      
		      Dict.Value("City") = city
		      ''log "City: "+city
		      
		      debugModule.Log(CurrentMethodName + " : " + "City = " + city )
		      
		      debugModule.Log("SmartCardInitiated -> |Before| smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)")
		      
		      smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)
		      
		      debugModule.Log("SmartCardInitiated -> |After| smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)")
		      
		      
		    End If 
		  Else
		    Return
		  End If
		  
		  
		  
		  
		  
		  
		  'debugModule.Log("SmartCardInitiated -> |Before| smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)")
		  '
		  'smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)
		  '
		  'debugModule.Log("SmartCardInitiated -> |After| smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)")
		  '
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function basicInfoFile() As MemoryBlock
		  dim m as new MemoryBlock(4)
		  
		  m.UInt8Value(0) = &hDF
		  m.UInt8Value(1) = &h01
		  m.UInt8Value(2) = &h40
		  m.UInt8Value(3) = &h31
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub basicInfoFileReadCompleted(FileName as MemoryBlock, Content as MemoryBlock, error as NSErrorMBS, tag as Variant)
		  debugModule.Log(CurrentMethodName)
		  
		  
		  ''log CurrentMethodName
		  
		  // split items
		  Dim items As New Dictionary
		  
		  dim cursor as integer = 2
		  while cursor < content.Size and content.UInt8Value(cursor-2) <> 0 
		    dim length as integer = content.UInt8Value(cursor-1)
		    dim t as integer = content.UInt8Value(cursor-2)
		    
		    items.Value(t) = content.MidB(cursor, length)
		    cursor = cursor + length + 2
		    
		  wend
		  
		  const kfileStructureVersion = 0
		  const kcardNumber = 1
		  const kchipNumber = 2
		  const kvalidityStart = 3
		  const kvalidityEnd = 4
		  const kreleasePlace = 5
		  const knationalIdNumber = 6
		  Const klastName = 7
		  const kfirstName = 8
		  const kotherName = 9
		  const knationality = 10
		  Const kbirthPlace = 11
		  Const kbirthDate = 12
		  Const ksex = 13
		  const knobleCondition = 14
		  const kdocumentType = 15
		  const kspecialStatus = 16
		  const kpictureHash = 17
		  const kduplicate = 18
		  const kspecialOrganisation = 19
		  const kmemberOfFamily = 20
		  const kprotection = 21
		  
		  
		  dim cardNumber       as string = GetString(items, kcardNumber)
		  'dim validityStart    as string = GetString(items, kvalidityStart)
		  'dim validityEnd      as string = GetString(items, kvalidityEnd)
		  Dim birthPlace       As String = GetString(items, kbirthPlace)
		  Dim birthDate        As String = GetString(items, kbirthDate)
		  Dim nationalIdNumber As String = GetString(items, knationalIdNumber)
		  dim lastName         as string = GetString(items, klastName)
		  dim firstName        as string = GetString(items, kfirstName)
		  'Dim otherName        As String = GetString(items, kotherName)
		  dim nationality      as string = GetString(items, knationality)
		  'Dim releasePlace     As String = GetString(items, kreleasePlace)
		  Dim Sex              As String = GetString(items, ksex)
		  
		  Dict.Value("CardNo") = cardNumber
		  Dict.Value("FirstName") = firstName
		  Dict.Value("LastName") = lastName
		  Dict.Value("PoB") = birthPlace
		  Dict.Value("DoB") = birthDate
		  Dict.Value("Sex") = Sex
		  Dict.Value("NISS") = nationalIdNumber
		  Dict.Value("Nationality") = nationality
		  
		  debugModule.Log(CurrentMethodName + " : " + "CardNo = " + cardNumber )
		  debugModule.Log(CurrentMethodName + " : " + "FirstName = " + firstName )
		  debugModule.Log(CurrentMethodName + " : " + "LastName = " + lastName )
		  debugModule.Log(CurrentMethodName + " : " + "PoB = " + birthPlace )
		  debugModule.Log(CurrentMethodName + " : " + "DoB = " + birthDate )
		  debugModule.Log(CurrentMethodName + " : " + "Sex = " + Sex )
		  debugModule.Log(CurrentMethodName + " : " + "NISS = " + nationalIdNumber )
		  debugModule.Log(CurrentMethodName + " : " + "Nationality = " + nationality )
		  
		  
		  
		  ''log "cardNumber: "+cardNumber
		  ''log "validityStart: "+validityStart
		  ''log "validityEnd: "+validityEnd
		  ''log "birthPlace: "+birthPlace
		  ''log "nationalIdNumber: "+nationalIdNumber
		  ''log "lastName: "+lastName
		  ''log "firstName: "+firstName
		  ''log "otherName: "+otherName
		  ''log "nationality: "+nationality
		  ''log "releasePlace: "+releasePlace
		  
		  
		  // next, get address
		  
		  debugModule.Log("SmartCardInitiated -> |Before| smartcard.readFileWithDelegate(addressFile, WeakAddressOf addressFileReadCompleted)")
		  
		  smartcard.readFileWithDelegate(addressFile, WeakAddressOf addressFileReadCompleted)
		  
		  debugModule.Log("SmartCardInitiated -> |After| smartcard.readFileWithDelegate(addressFile, WeakAddressOf addressFileReadCompleted)")
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(items as Dictionary, id as integer) As String
		  Dim m As MemoryBlock = items.Lookup(id, Nil)
		  
		  if m <> nil then
		    
		    debugModule.Log(CurrentMethodName)
		    
		    debugModule.Log("Result : " + DefineEncoding(m, encodings.UTF8))
		    
		    Return DefineEncoding(m, encodings.UTF8)
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function idFile() As MemoryBlock
		  dim m as new MemoryBlock(4)
		  
		  m.UInt8Value(0) = &hDF
		  m.UInt8Value(1) = &h01
		  m.UInt8Value(2) = &h40
		  m.UInt8Value(3) = &h38
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenFirstSlot()
		  debugModule.Log(CurrentMethodName)
		  
		  Dim slotNames() As String = Me.slotNames
		  
		  If Me.slotNames.Ubound = -1 Then
		    
		    // no slot?
		    
		    debugModule.Log("No Slot")
		    
		    ''log "No slot?"
		    
		  Else
		    Dim SlotName As String = slotNames(0)
		    SlotID = SlotName
		    'Dim SlotName As String
		    
		    debugModule.Log("Selected Slot Name : " + SlotID)
		    
		    'SlotName = SlotID
		    
		    
		    'If currentSlot <> Nil Then
		    '
		    'If currentSlot.Name = SlotName Then
		    '// already selected
		    'Return
		    'End If
		    'End If
		    
		    
		    debugModule.Log("SmartCardInitiated -> |Before| Me.getSlotWithName SlotName")
		    
		    Me.getSlotWithName SlotName
		    
		    debugModule.Log("SmartCardInitiated -> |After| Me.getSlotWithName SlotName")
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function photoFile() As MemoryBlock
		  dim m as new MemoryBlock(4)
		  
		  m.UInt8Value(0) = &hDF
		  m.UInt8Value(1) = &h01
		  m.UInt8Value(2) = &h40
		  m.UInt8Value(3) = &h35
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub photoFileReadCompleted(FileName as MemoryBlock, Content as MemoryBlock, error as NSErrorMBS, tag as Variant)
		  debugModule.Log(CurrentMethodName)
		  
		  debugModule.Log("Get Picture")
		  
		  
		  
		  If Content <> Nil Then
		    'Dim items As New Dictionary
		    
		    Dim cursor As Integer = 2
		    If cursor < content.Size And content.UInt8Value(cursor-2) <> 0 Then
		      
		      IDPict = Picture.FromData(content)
		      
		      
		      debugModule.Log("SmartCardInitiated -> |Before| smartcard.endSession")
		      
		      smartcard.endSession
		      
		      debugModule.Log("SmartCardInitiated -> |After| smartcard.endSession")
		      
		      smartcard = Nil
		      
		      debugModule.Log("Set SmartCard to nil")
		    End If 
		  Else
		    Return
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadSlot(slot as TKSmartCardSlotMBS)
		  debugModule.Log(CurrentMethodName)
		  
		  debugModule.Log("SmartCardInitiated -> |Before| smartcard = slot.makeSmartCard")
		  
		  smartcard = slot.makeSmartCard
		  
		  debugModule.Log("SmartCardInitiated -> |After| smartcard = slot.makeSmartCard")
		  
		  
		  
		  // connect event
		  'AddHandler smartcard.BeginSessionCompleted, WeakAddressOf SmartcardBeginSessionCompleted
		  'smartcard.SetDelegate
		  'smartcard.beginSession
		  
		  
		  
		  smartcard.beginSessionWithDelegate WeakAddressOf SmartcardBeginSessionCompleted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SlotStateChanged(slot as TKSmartCardSlotMBS)
		  debugModule.Log(CurrentMethodName)
		  
		  Select Case slot.State
		  Case slot.kStateEmpty
		    ''log "Slot "+slot.Name+" is empty."
		    debugModule.Log("Slot "+slot.Name+" is empty.")
		    
		    wMain.CardStatus = False
		    
		    
		  Case slot.kStateMissing
		    ''log "Slot "+slot.Name+" is missing."
		    debugModule.Log("Slot "+slot.Name+" is missing.")
		    Self.currentSlot = Nil
		    wMain.CardStatus = False
		    
		    
		  Case slot.kStateValidCard
		    ''log "Slot "+slot.Name+" is valid card."
		    debugModule.Log("Slot "+slot.Name+" is valid card.")
		    wMain.CardStatus = True
		    
		    
		  Case slot.kStateProbing
		    ''log "Slot "+slot.Name+" is probing."
		    debugModule.Log("Slot "+slot.Name+" is probing.")
		    
		    
		  Case slot.kStateMuteCard
		    ''log "Slot "+slot.Name+" is mute card."
		    debugModule.Log("Slot "+slot.Name+" is mute card.")
		    
		  End Select
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmartcardBeginSessionCompleted(success as Boolean, error as NSErrorMBS, tag as Variant)
		  debugModule.Log(CurrentMethodName)
		  debugModule.Log("success: "+Str(success))
		  
		  ''log CurrentMethodName
		  ''log "success: "+str(success)
		  
		  if success then
		    
		    
		    smartcard.readFileWithDelegate(basicInfoFile, WeakAddressOf basicInfoFileReadCompleted)
		    
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		currentSlot As TKSmartCardSlotMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Dict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		IDPict As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		SlotDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		SlotID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		smartcard As TKSmartCardMBS
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
			Name="IDPict"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SlotID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
