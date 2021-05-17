#tag Module
Protected Module ModuleMoviePlayer
	#tag Method, Flags = &h0
		Function RateMBS(extends m as MoviePlayer) As double
		  #if TargetMacOS then
		    
		    #if RBVersion >= 2014.0 then
		      // newer AVFoundation
		      dim p as AVPlayerMBS = m.AVPlayerMBS
		      return p.rate
		    #else
		      // old QuickTime
		      return m.rate
		    #endif
		    
		  #elseif TargetWin32 then
		    
		    #if RBVersion < 2014.0 then
		      if m.PlayerType = 1 then
		        // QuickTime
		        return m.Rate
		      end if
		    #endif
		    
		    dim o as OLEObject = m.MovieController
		    
		    'MsgBox o.TypeName
		    return o.Player.settings.rate
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RateMBS(extends m as MoviePlayer, assigns r as Double)
		  #if TargetMacOS then
		    
		    #if RBVersion >= 2014.0 then
		      // newer AVFoundation
		      dim p as AVPlayerMBS = m.AVPlayerMBS
		      p.rate = r
		    #else
		      // old QuickTime
		      m.Rate = r
		    #endif
		    
		  #elseif TargetWin32 then
		    
		    #if RBVersion < 2014.0 then
		      if m.PlayerType = 1 then
		        // QuickTime
		        m.Rate = r
		        Return
		      end if
		    #endif
		    
		    // Windows Media Player
		    dim o as OLEObject = m.MovieController
		    'MsgBox o.TypeName
		    o.Player.settings.rate = r
		    
		  #endif
		  
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
