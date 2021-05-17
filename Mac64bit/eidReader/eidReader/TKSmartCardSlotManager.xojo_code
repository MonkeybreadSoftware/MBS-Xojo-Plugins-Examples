#tag Class
Protected Class TKSmartCardSlotManager
Inherits TKSmartCardSlotManagerMBS
	#tag Event
		Sub gotSlotWithName(name as string, slot as TKSmartCardSlotMBS, tag as variant)
		  log "Got slot: "+slot.Name
		  
		  self.currentSlot = slot
		  
		  // connect event
		  AddHandler slot.StateChanged, WeakAddressOf SlotStateChanged
		  slot.SetDelegate
		  
		  
		  if slot.State = slot.kStateValidCard then
		    ReadSlot slot
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub slotNamesChanged()
		  log "Slot names changed."
		  
		  OpenFirstSlot
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function addressFile() As MemoryBlock
		  dim m as new MemoryBlock(4)
		  
		  m.UInt8Value(0) = &hDF
		  m.UInt8Value(1) = &h01
		  m.UInt8Value(2) = &h40
		  m.UInt8Value(3) = &h33
		  
		  return m
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addressFileReadCompleted(FileName as MemoryBlock, Content as MemoryBlock, error as NSErrorMBS, tag as Variant)
		  log CurrentMethodName
		  
		  dim StreetLen as integer = content.UInt8Value(1)
		  dim Street    as string = DefineEncoding(content.MidB(2, StreetLen), encodings.UTF8)
		  
		  log "Street: "+Street
		  
		  dim postalCodeLen as integer = content.UInt8Value(1+2+StreetLen)
		  dim postalCode    as string = DefineEncoding(content.MidB(2+2+StreetLen, postalCodeLen), encodings.UTF8)
		  
		  log "PostalCode: "+postalCode
		  
		  dim cityLen as integer = content.UInt8Value(1+2+2+postalCodeLen+StreetLen)
		  dim city    as string = DefineEncoding(content.MidB(2+2+2+postalCodeLen+StreetLen, cityLen), encodings.UTF8)
		  
		  log "City: "+city
		  
		  
		  
		  smartcard.readFileWithDelegate(photoFile, WeakAddressOf photoFileReadCompleted)
		  
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
		  log CurrentMethodName
		  
		  // split items
		  dim items as new Dictionary
		  
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
		  const klastName = 7
		  const kfirstName = 8
		  const kotherName = 9
		  const knationality = 10
		  const kbirthPlace = 11
		  const kbirthDate = 12
		  const ksex = 13
		  const knobleCondition = 14
		  const kdocumentType = 15
		  const kspecialStatus = 16
		  const kpictureHash = 17
		  const kduplicate = 18
		  const kspecialOrganisation = 19
		  const kmemberOfFamily = 20
		  const kprotection = 21
		  
		  
		  dim cardNumber       as string = GetString(items, kcardNumber)
		  dim validityStart    as string = GetString(items, kvalidityStart)
		  dim validityEnd      as string = GetString(items, kvalidityEnd)
		  dim birthPlace       as string = GetString(items, kbirthPlace)
		  dim nationalIdNumber as string = GetString(items, knationalIdNumber)
		  dim lastName         as string = GetString(items, klastName)
		  dim firstName        as string = GetString(items, kfirstName)
		  dim otherName        as string = GetString(items, kotherName)
		  dim nationality      as string = GetString(items, knationality)
		  dim releasePlace     as string = GetString(items, kreleasePlace)
		  
		  log "cardNumber: "+cardNumber
		  log "validityStart: "+validityStart
		  log "validityEnd: "+validityEnd
		  log "birthPlace: "+birthPlace
		  log "nationalIdNumber: "+nationalIdNumber
		  log "lastName: "+lastName
		  log "firstName: "+firstName
		  log "otherName: "+otherName
		  log "nationality: "+nationality
		  log "releasePlace: "+releasePlace
		  
		  
		  // next, get address
		  
		  smartcard.readFileWithDelegate(addressFile, WeakAddressOf addressFileReadCompleted)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getBasicInfo()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(items as Dictionary, id as integer) As String
		  dim m as MemoryBlock = items.Lookup(id, nil)
		  
		  if m <> nil then
		    
		    return DefineEncoding(m, encodings.UTF8)
		    
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
		  dim slotNames() as string = me.slotNames
		  
		  if slotNames.Ubound = -1 then
		    
		    // no slot?
		    
		    log "No slot?"
		    
		  else
		    dim SlotName as string = slotNames(0)
		    
		    log "Slots: "+Join(slotNames, ", ")
		    
		    if currentSlot <> nil then
		      if currentSlot.Name = SlotName then
		        // already selected
		        return
		      end if
		    end if
		    
		    Log "Open slot: "+SlotName
		    me.getSlotWithName SlotName
		    
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
		  log CurrentMethodName
		  
		  
		  dim p as Picture = Picture.FromData(content)
		  
		  if p <> nil then
		    PicWindow.Backdrop = p
		    
		  end if
		  
		  
		  
		  smartcard.endSession
		  hasSession = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadSlot(slot as TKSmartCardSlotMBS)
		  if hasSession then return // already working with a card!
		  
		  
		  smartcard = slot.makeSmartCard
		  
		  
		  // connect event
		  'AddHandler smartcard.BeginSessionCompleted, WeakAddressOf SmartcardBeginSessionCompleted
		  'smartcard.SetDelegate
		  'smartcard.beginSession
		  
		  hasSession = true
		  smartcard.beginSessionWithDelegate WeakAddressOf SmartcardBeginSessionCompleted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SlotStateChanged(slot as TKSmartCardSlotMBS)
		  
		  Select case slot.State
		  case slot.kStateEmpty
		    log "Slot "+slot.Name+" is empty."
		    
		  case slot.kStateMissing
		    log "Slot "+slot.Name+" is missing."
		    self.currentSlot = nil
		    
		  case slot.kStateValidCard
		    log "Slot "+slot.Name+" is valid card."
		    ReadSlot slot
		    
		  case slot.kStateProbing
		    log "Slot "+slot.Name+" is probing."
		    
		  case slot.kStateMuteCard
		    log "Slot "+slot.Name+" is mute card."
		    
		  end Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmartcardBeginSessionCompleted(success as Boolean, error as NSErrorMBS, tag as Variant)
		  log CurrentMethodName
		  log "success: "+str(success)
		  
		  if success then
		    
		    
		    smartcard.readFileWithDelegate(basicInfoFile, WeakAddressOf basicInfoFileReadCompleted)
		    
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		currentSlot As TKSmartCardSlotMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		hasSession As Boolean
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasSession"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
