#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub EnableMenuItems()
		  fileopen.enable
		  moviePlay.enable
		  moviestop.enable
		  moviepause.enable
		  movieresume.enable
		  
		  moviespeed100.enable
		  moviespeed200.enable
		  moviespeed50.enable
		  
		  soundLeftoff.enable
		  soundLefton.enable
		  soundoff.enable
		  soundon.enable
		  soundRightoff.enable
		  soundRighton.enable
		  soundvolume100.enable
		  soundvolume50.enable
		  
		  videoon.enable
		  videooff.enable
		  
		  windowHide.enable
		  windowShow.enable
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  v=new WindowsMCIMBS
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  openmovie item
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			openfile
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MoviePause() As Boolean Handles MoviePause.Action
			v.command="pause mymovie"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MoviePlay() As Boolean Handles MoviePlay.Action
			v.command="play mymovie"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MovieResume() As Boolean Handles MovieResume.Action
			v.command="resume mymovie"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MovieSpeed100() As Boolean Handles MovieSpeed100.Action
			v.command="set mymovie speed 1000"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MovieSpeed200() As Boolean Handles MovieSpeed200.Action
			v.command="set mymovie speed 2000"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MovieSpeed50() As Boolean Handles MovieSpeed50.Action
			v.command="set mymovie speed 500"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MovieStop() As Boolean Handles MovieStop.Action
			v.command="stop mymovie"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SoundLeftoff() As Boolean Handles SoundLeftoff.Action
			v.command="set mymovie audio left off"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SoundLefton() As Boolean Handles SoundLefton.Action
			v.command="set mymovie audio left on"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Soundoff() As Boolean Handles Soundoff.Action
			v.command="set mymovie audio all off"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Soundon() As Boolean Handles Soundon.Action
			v.command="set mymovie audio all on"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SoundRightoff() As Boolean Handles SoundRightoff.Action
			v.command="set mymovie audio right off"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SoundRighton() As Boolean Handles SoundRighton.Action
			v.command="set mymovie audio right on"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SoundVolume100() As Boolean Handles SoundVolume100.Action
			v.command="setaudio mymovie volume to 1000"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SoundVolume50() As Boolean Handles SoundVolume50.Action
			v.command="setaudio mymovie volume to 500"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Videooff() As Boolean Handles Videooff.Action
			v.command="setvideo mymovie off"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function Videoon() As Boolean Handles Videoon.Action
			v.command="setvideo mymovie on"
			v.run
			checkerror
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowHide() As Boolean Handles WindowHide.Action
			v.command="window mymovie state hide"
			v.run
			
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowShow() As Boolean Handles WindowShow.Action
			v.command="window mymovie state show"
			v.run
			
			return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub checkerror()
		  window1.lastError.text=str(v.errorcode)+", "+v.errorstring
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub openfile()
		  // open a movie file and set time format to Track:Minute:Second:Frame
		  
		  dim f as folderItem
		  
		  const videotypes="video/avi;video/flc;video/mpeg;video/msvideo;video/quicktime;video/x-dv;video/x-mpeg;video/x-msvideo"
		  const audiotypes="audio/aiff;audio/basic;audio/midi;audio/mp3;audio/mpeg;audio/wav"
		  
		  f=getopenFolderItem(videotypes+";"+audiotypes)
		  if f<>nil then
		    openmovie f
		  else
		    quit
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub openmovie(f as folderItem)
		  // we may still have an open movie
		  v.command="close mymovie"
		  v.run
		  
		  // open the new one
		  v.Command="open "+f.ShortPathMBS+" type mpegvideo parent "+format(window1.WinHWND,"0")+" alias mymovie"
		  v.run
		  if v.errorcode=0 then
		    v.command="window mymovie state show" // show the window
		    v.run
		  end if
		  checkerror
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		v As windowsMCIMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
