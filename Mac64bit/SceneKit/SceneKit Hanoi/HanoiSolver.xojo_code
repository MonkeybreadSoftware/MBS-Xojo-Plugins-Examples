#tag Class
Protected Class HanoiSolver
	#tag Method, Flags = &h0
		Function animationFromMove(move as HanoiMove) As SCNActionMBS
		  dim duration as double = 0.3
		  
		  dim node as SCNNodeMBS = disks(move.diskIndex)
		  dim destination as SCNNodeMBS = pegsNodes(move.destinationPegIndex)
		  
		  // Move To Top
		  dim topPosition as SCNVector3MBS = node.position
		  topPosition.y = (pegHeight + diskHeight * 4.0)
		  
		  duration = normalizedDuration(node.position, topPosition)
		  
		  dim moveUp as SCNActionMBS = SCNActionMBS.moveTo(topPosition, duration)
		  
		  // Move Sideways
		  dim sidePosition as SCNVector3MBS = destination.position
		  sidePosition.y = topPosition.y
		  
		  duration = normalizedDuration(topPosition, sidePosition)
		  dim moveSide as SCNActionMBS = SCNActionMBS.moveTo(sidePosition, duration)
		  
		  // Move To Bottom
		  dim bottomPosition as SCNVector3MBS = sidePosition
		  bottomPosition.y = (boardHeight / 2.0 + diskHeight / 2.0) + (move.destinationDiskCount) * (diskHeight)
		  
		  duration = normalizedDuration(sidePosition, bottomPosition)
		  dim moveDown as SCNActionMBS = SCNActionMBS.moveTo(bottomPosition, duration)
		  
		  dim sequence as SCNActionMBS = SCNActionMBS.sequence(array(moveUp, moveSide, moveDown))
		  
		  
		  return sequence
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub computeMoves()
		  redim moves(-1)
		  
		  hanoi(numberOfDisks, 0, 1, 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(numberOfDisks as integer)
		  self.numberOfDisks = numberOfDisks
		  
		  for i as integer = 0 to numberOfDisks-1
		    self.leftPeg.append(i)
		  next
		  
		  
		  pegs.Append leftPeg
		  pegs.Append middlePeg
		  pegs.Append rightPeg
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function distanceBetweenVectors(v1 as SCNVector3MBS, v2 as SCNVector3MBS) As Double
		  return lengthOfVector(SCNVector3MBS.Vector( v1.x - v2.x, v1.y - v2.y, v1.z - v2.z))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub hanoi(numberOfDisks as integer, from_ as integer, using_ as integer, to_ as integer)
		  if numberOfDisks = 1 then
		    move(from_, to_)
		  else
		    hanoi(numberOfDisks - 1, from_, to_, using_)
		    move(from_, to_)
		    hanoi(numberOfDisks - 1, using_, from_, to_)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function lengthOfVector(v as SCNVector3MBS) As double
		  return sqrt(pow(v.x,2.0) + pow(v.y,2.0) + pow(v.z,2.0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub move(from_ as integer, to_ as integer)
		  dim disk as integer = popDisk(from_)
		  dim diskIndex as integer = disk
		  dim peg() as integer = pegs(to_)
		  dim destinationDiskCount as integer = peg.Ubound+1
		  
		  pushDisk(disk, to_)
		  
		  dim move as new HanoiMove(diskIndex, to_, destinationDiskCount)
		  moves.append(move)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function normalizedDuration(startPosition as SCNVector3MBS, endPosition as SCNVector3MBS) As Double
		  dim referenceLength as double = distanceBetweenVectors(pegsNodes(0).position, pegsNodes(2).position)
		  
		  dim length  as double = distanceBetweenVectors(startPosition, endPosition)
		  
		  return 1 * (length / referenceLength)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function popDisk(peg as integer) As integer
		  dim p() as integer = pegs(peg)
		  
		  dim u as integer = p.Ubound
		  dim n as integer = p(u)
		  
		  p.Remove u
		  return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pushDisk(disk as integer, peg as integer)
		  dim n() as integer = pegs(peg)
		  n.Append disk
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub recursiveAnimation(index as integer)
		  dim move as HanoiMove = moves(index)
		  dim node as SCNNodeMBS = disks(move.diskIndex)
		  dim animation as SCNActionMBS = animationFromMove(move)
		  
		  dim tag as Variant = index
		  node.runAction(animation, WeakAddressOf runActionCompleted, tag)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runActionCompleted(node as SCNNodeMBS, action as SCNActionMBS, key as string, tag as variant)
		  dim index as integer = tag
		  
		  if index < moves.Ubound then
		    self.recursiveAnimation(index + 1)
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		boardHeight As double
	#tag EndProperty

	#tag Property, Flags = &h0
		diskHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		disks() As SCNNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		leftPeg() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		middlePeg() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		moves() As HanoiMove
	#tag EndProperty

	#tag Property, Flags = &h0
		numberOfDisks As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		pegHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		pegs() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		pegsNodes() As SCNNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		rightPeg() As Integer
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
			Name="numberOfDisks"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pegHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="diskHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="boardHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
