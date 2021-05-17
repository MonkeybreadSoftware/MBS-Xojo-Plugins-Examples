#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   409073663
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Clipper Test"
   Visible         =   True
   Width           =   600
   Begin Canvas Out
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   348
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   52
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin PopupMenu PopupClipType
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "None\nIntersection\nUnion\nDifference\nXOR"
      Italic          =   False
      Left            =   20
      ListIndex       =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   133
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  text1 = PathsFromJSON(text_polygon)
		  text2 = PathsFromJSON(text_clipping)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawPolygon(g as graphics, p as ClipperPathMBS, c as color, ox as integer = 0, oy as integer = 0)
		  dim coordinates(0) as integer
		  dim points() as ClipperPointMBS = p.Values
		  
		  for each point as ClipperPointMBS in points
		    coordinates.Append point.x + ox
		    coordinates.Append point.y + oy
		  next
		  
		  g.ForeColor = c
		  g.FillPolygon coordinates
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPolygons(g as Graphics, paths as ClipperPathsMBS, c as color, ox as integer = 0, oy as integer = 0)
		  dim pathsList() as ClipperPathMBS = paths.Values
		  
		  dim pic as new Picture(g.Width, g.Height, 32)
		  dim mask as Picture = pic.mask
		  
		  pic.Graphics.ForeColor = rgb(c.Red, c.Green, c.Blue)
		  pic.Graphics.FillRect 0, 0, g.Width, g.Height
		  mask.Graphics.ClearRect 0, 0, g.Width, g.Height
		  
		  dim last as ClipperPathMBS
		  
		  for each p as ClipperPathMBS in pathsList 
		    
		    if last <> nil and last.PointInPolygon(p.Value(0)) = 1 then
		      
		      DrawPolygon(mask.graphics, p, &cFFFFFF, ox, oy)
		      
		    else
		      
		      DrawPolygon(mask.graphics, p, &c000000, ox, oy)
		      
		    end if
		    
		    last = p
		  next
		  
		  
		  g.DrawPicture pic, 0, 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathsFromJSON(s as string) As ClipperPathsMBS
		  dim j as new JSONItem(s)
		  
		  dim paths as new ClipperPathsMBS
		  
		  dim ju as integer = j.Count-1
		  for ji as integer = 0 to ju
		    dim jj as JSONItem = j.Value(ji)
		    dim path as new ClipperPathMBS
		    
		    dim jju as integer = jj.Count-1
		    for jji as integer = 0 to jju
		      dim jjj as JSONItem = jj.Value(jji)
		      
		      dim x as Integer = jjj.Value("X")
		      dim y as Integer = jjj.Value("Y")
		      
		      path.append x, y
		      
		    next
		    
		    paths.Append path
		  next
		  
		  return paths
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		text1 As ClipperPathsMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		text2 As ClipperPathsMBS
	#tag EndProperty


	#tag Constant, Name = text_clipping, Type = String, Dynamic = False, Default = \"[[{\"X\":\"115.54\"\x2C\"Y\":\"216.41\"}\x2C{\"X\":\"113.01\"\x2C\"Y\":\"217.26\"}\x2C{\"X\":\"105.79\"\x2C\"Y\":\"218.58\"}\x2C{\"X\":\"96.36\"\x2C\"Y\":\"219.18\"}\x2C{\"X\":\"88.73\"\x2C\"Y\":\"218.69\"}\x2C{\"X\":\"82.86\"\x2C\"Y\":\"217.48\"}\x2C{\"X\":\"78.40\"\x2C\"Y\":\"215.73\"}\x2C{\"X\":\"74.91\"\x2C\"Y\":\"213.42\"}\x2C{\"X\":\"72.12\"\x2C\"Y\":\"210.49\"}\x2C{\"X\":\"69.88\"\x2C\"Y\":\"206.77\"}\x2C{\"X\":\"68.13\"\x2C\"Y\":\"201.83\"}\x2C{\"X\":\"66.93\"\x2C\"Y\":\"195.19\"}\x2C{\"X\":\"66.45\"\x2C\"Y\":\"186.51\"}\x2C{\"X\":\"67.03\"\x2C\"Y\":\"179.19\"}\x2C{\"X\":\"68.36\"\x2C\"Y\":\"173.03\"}\x2C{\"X\":\"70.25\"\x2C\"Y\":\"168.30\"}\x2C{\"X\":\"72.58\"\x2C\"Y\":\"164.82\"}\x2C{\"X\":\"75.62\"\x2C\"Y\":\"161.94\"}\x2C{\"X\":\"79.35\"\x2C\"Y\":\"159.71\"}\x2C{\"X\":\"84.02\"\x2C\"Y\":\"158.09\"}\x2C{\"X\":\"89.93\"\x2C\"Y\":\"157.11\"}\x2C{\"X\":\"96.97\"\x2C\"Y\":\"156.93\"}\x2C{\"X\":\"105.18\"\x2C\"Y\":\"157.69\"}\x2C{\"X\":\"114.58\"\x2C\"Y\":\"159.65\"}\x2C{\"X\":\"116.44\"\x2C\"Y\":\"168.59\"}\x2C{\"X\":\"110.93\"\x2C\"Y\":\"166.65\"}\x2C{\"X\":\"105.50\"\x2C\"Y\":\"165.51\"}\x2C{\"X\":\"98.32\"\x2C\"Y\":\"165.06\"}\x2C{\"X\":\"94.16\"\x2C\"Y\":\"165.58\"}\x2C{\"X\":\"90.96\"\x2C\"Y\":\"166.82\"}\x2C{\"X\":\"88.62\"\x2C\"Y\":\"168.68\"}\x2C{\"X\":\"86.96\"\x2C\"Y\":\"171.17\"}\x2C{\"X\":\"85.31\"\x2C\"Y\":\"175.67\"}\x2C{\"X\":\"84.32\"\x2C\"Y\":\"181.28\"}\x2C{\"X\":\"84.15\"\x2C\"Y\":\"188.62\"}\x2C{\"X\":\"84.83\"\x2C\"Y\":\"196.53\"}\x2C{\"X\":\"86.18\"\x2C\"Y\":\"202.53\"}\x2C{\"X\":\"87.64\"\x2C\"Y\":\"205.97\"}\x2C{\"X\":\"89.52\"\x2C\"Y\":\"208.29\"}\x2C{\"X\":\"92.02\"\x2C\"Y\":\"209.92\"}\x2C{\"X\":\"95.18\"\x2C\"Y\":\"210.85\"}\x2C{\"X\":\"99.07\"\x2C\"Y\":\"210.96\"}\x2C{\"X\":\"105.48\"\x2C\"Y\":\"210.28\"}\x2C{\"X\":\"111.84\"\x2C\"Y\":\"208.54\"}\x2C{\"X\":\"116.32\"\x2C\"Y\":\"206.45\"}\x2C{\"X\":\"116.62\"\x2C\"Y\":\"206.17\"}\x2C{\"X\":\"115.55\"\x2C\"Y\":\"216.31\"}\x2C{\"X\":\"115.54\"\x2C\"Y\":\"216.41\"}]\x2C[{\"X\":\"120.11\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"120.11\"\x2C\"Y\":\"132.31\"}\x2C{\"X\":\"137.23\"\x2C\"Y\":\"132.31\"}\x2C{\"X\":\"137.23\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"137.23\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"120.11\"\x2C\"Y\":\"219.00\"}]\x2C[{\"X\":\"153.34\"\x2C\"Y\":\"132.13\"}\x2C{\"X\":\"156.60\"\x2C\"Y\":\"132.56\"}\x2C{\"X\":\"159.17\"\x2C\"Y\":\"133.77\"}\x2C{\"X\":\"161.19\"\x2C\"Y\":\"135.77\"}\x2C{\"X\":\"162.61\"\x2C\"Y\":\"138.40\"}\x2C{\"X\":\"163.19\"\x2C\"Y\":\"141.48\"}\x2C{\"X\":\"162.87\"\x2C\"Y\":\"144.75\"}\x2C{\"X\":\"161.71\"\x2C\"Y\":\"147.51\"}\x2C{\"X\":\"159.79\"\x2C\"Y\":\"149.80\"}\x2C{\"X\":\"157.51\"\x2C\"Y\":\"151.22\"}\x2C{\"X\":\"154.46\"\x2C\"Y\":\"151.96\"}\x2C{\"X\":\"151.02\"\x2C\"Y\":\"151.84\"}\x2C{\"X\":\"148.34\"\x2C\"Y\":\"150.92\"}\x2C{\"X\":\"146.08\"\x2C\"Y\":\"149.20\"}\x2C{\"X\":\"144.28\"\x2C\"Y\":\"146.63\"}\x2C{\"X\":\"143.38\"\x2C\"Y\":\"143.78\"}\x2C{\"X\":\"143.37\"\x2C\"Y\":\"140.64\"}\x2C{\"X\":\"144.20\"\x2C\"Y\":\"137.77\"}\x2C{\"X\":\"145.94\"\x2C\"Y\":\"135.15\"}\x2C{\"X\":\"148.14\"\x2C\"Y\":\"133.37\"}\x2C{\"X\":\"150.80\"\x2C\"Y\":\"132.38\"}\x2C{\"X\":\"153.33\"\x2C\"Y\":\"132.13\"}\x2C{\"X\":\"153.34\"\x2C\"Y\":\"132.13\"}]\x2C[{\"X\":\"144.58\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"144.58\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"161.88\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"161.88\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"161.88\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"144.58\"\x2C\"Y\":\"219.00\"}]\x2C[{\"X\":\"168.78\"\x2C\"Y\":\"243.93\"}\x2C{\"X\":\"168.78\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"186.09\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"186.19\"\x2C\"Y\":\"161.44\"}\x2C{\"X\":\"191.55\"\x2C\"Y\":\"158.75\"}\x2C{\"X\":\"196.41\"\x2C\"Y\":\"157.22\"}\x2C{\"X\":\"201.17\"\x2C\"Y\":\"156.70\"}\x2C{\"X\":\"207.60\"\x2C\"Y\":\"157.21\"}\x2C{\"X\":\"212.99\"\x2C\"Y\":\"158.51\"}\x2C{\"X\":\"216.03\"\x2C\"Y\":\"160.11\"}\x2C{\"X\":\"219.02\"\x2C\"Y\":\"162.82\"}\x2C{\"X\":\"222.00\"\x2C\"Y\":\"166.95\"}\x2C{\"X\":\"223.86\"\x2C\"Y\":\"171.04\"}\x2C{\"X\":\"225.25\"\x2C\"Y\":\"176.56\"}\x2C{\"X\":\"226.01\"\x2C\"Y\":\"184.02\"}\x2C{\"X\":\"225.94\"\x2C\"Y\":\"191.67\"}\x2C{\"X\":\"225.03\"\x2C\"Y\":\"199.56\"}\x2C{\"X\":\"223.55\"\x2C\"Y\":\"205.37\"}\x2C{\"X\":\"221.48\"\x2C\"Y\":\"209.86\"}\x2C{\"X\":\"218.90\"\x2C\"Y\":\"213.53\"}\x2C{\"X\":\"216.12\"\x2C\"Y\":\"216.03\"}\x2C{\"X\":\"213.05\"\x2C\"Y\":\"217.58\"}\x2C{\"X\":\"207.99\"\x2C\"Y\":\"218.94\"}\x2C{\"X\":\"201.87\"\x2C\"Y\":\"219.54\"}\x2C{\"X\":\"195.30\"\x2C\"Y\":\"219.05\"}\x2C{\"X\":\"189.90\"\x2C\"Y\":\"217.79\"}\x2C{\"X\":\"186.09\"\x2C\"Y\":\"216.23\"}\x2C{\"X\":\"186.09\"\x2C\"Y\":\"243.93\"}\x2C{\"X\":\"186.09\"\x2C\"Y\":\"243.93\"}\x2C{\"X\":\"168.78\"\x2C\"Y\":\"243.93\"}]\x2C[{\"X\":\"186.09\"\x2C\"Y\":\"170.27\"}\x2C{\"X\":\"186.13\"\x2C\"Y\":\"208.05\"}\x2C{\"X\":\"189.79\"\x2C\"Y\":\"210.09\"}\x2C{\"X\":\"193.53\"\x2C\"Y\":\"211.16\"}\x2C{\"X\":\"197.86\"\x2C\"Y\":\"211.53\"}\x2C{\"X\":\"201.86\"\x2C\"Y\":\"210.97\"}\x2C{\"X\":\"204.91\"\x2C\"Y\":\"209.73\"}\x2C{\"X\":\"207.25\"\x2C\"Y\":\"207.87\"}\x2C{\"X\":\"209.01\"\x2C\"Y\":\"205.27\"}\x2C{\"X\":\"210.72\"\x2C\"Y\":\"200.64\"}\x2C{\"X\":\"211.90\"\x2C\"Y\":\"194.30\"}\x2C{\"X\":\"212.32\"\x2C\"Y\":\"186.82\"}\x2C{\"X\":\"211.80\"\x2C\"Y\":\"179.19\"}\x2C{\"X\":\"210.69\"\x2C\"Y\":\"174.07\"}\x2C{\"X\":\"209.11\"\x2C\"Y\":\"170.68\"}\x2C{\"X\":\"207.06\"\x2C\"Y\":\"168.30\"}\x2C{\"X\":\"204.40\"\x2C\"Y\":\"166.63\"}\x2C{\"X\":\"200.81\"\x2C\"Y\":\"165.59\"}\x2C{\"X\":\"196.18\"\x2C\"Y\":\"165.25\"}\x2C{\"X\":\"192.24\"\x2C\"Y\":\"166.16\"}\x2C{\"X\":\"188.91\"\x2C\"Y\":\"167.87\"}\x2C{\"X\":\"186.21\"\x2C\"Y\":\"169.99\"}\x2C{\"X\":\"186.09\"\x2C\"Y\":\"170.26\"}\x2C{\"X\":\"186.09\"\x2C\"Y\":\"170.27\"}]\x2C[{\"X\":\"231.09\"\x2C\"Y\":\"243.93\"}\x2C{\"X\":\"231.09\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"248.39\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"248.50\"\x2C\"Y\":\"161.44\"}\x2C{\"X\":\"253.86\"\x2C\"Y\":\"158.75\"}\x2C{\"X\":\"258.72\"\x2C\"Y\":\"157.22\"}\x2C{\"X\":\"263.48\"\x2C\"Y\":\"156.70\"}\x2C{\"X\":\"269.91\"\x2C\"Y\":\"157.21\"}\x2C{\"X\":\"275.30\"\x2C\"Y\":\"158.51\"}\x2C{\"X\":\"278.34\"\x2C\"Y\":\"160.11\"}\x2C{\"X\":\"281.33\"\x2C\"Y\":\"162.82\"}\x2C{\"X\":\"284.31\"\x2C\"Y\":\"166.96\"}\x2C{\"X\":\"286.17\"\x2C\"Y\":\"171.04\"}\x2C{\"X\":\"287.56\"\x2C\"Y\":\"176.57\"}\x2C{\"X\":\"288.32\"\x2C\"Y\":\"184.02\"}\x2C{\"X\":\"288.25\"\x2C\"Y\":\"191.67\"}\x2C{\"X\":\"287.34\"\x2C\"Y\":\"199.56\"}\x2C{\"X\":\"285.86\"\x2C\"Y\":\"205.37\"}\x2C{\"X\":\"283.79\"\x2C\"Y\":\"209.86\"}\x2C{\"X\":\"281.21\"\x2C\"Y\":\"213.53\"}\x2C{\"X\":\"278.43\"\x2C\"Y\":\"216.04\"}\x2C{\"X\":\"275.35\"\x2C\"Y\":\"217.58\"}\x2C{\"X\":\"270.29\"\x2C\"Y\":\"218.94\"}\x2C{\"X\":\"264.18\"\x2C\"Y\":\"219.54\"}\x2C{\"X\":\"257.60\"\x2C\"Y\":\"219.05\"}\x2C{\"X\":\"252.21\"\x2C\"Y\":\"217.78\"}\x2C{\"X\":\"248.40\"\x2C\"Y\":\"216.23\"}\x2C{\"X\":\"248.40\"\x2C\"Y\":\"243.93\"}\x2C{\"X\":\"248.40\"\x2C\"Y\":\"243.93\"}\x2C{\"X\":\"231.09\"\x2C\"Y\":\"243.93\"}]\x2C[{\"X\":\"248.39\"\x2C\"Y\":\"170.27\"}\x2C{\"X\":\"248.44\"\x2C\"Y\":\"208.05\"}\x2C{\"X\":\"252.10\"\x2C\"Y\":\"210.09\"}\x2C{\"X\":\"255.84\"\x2C\"Y\":\"211.16\"}\x2C{\"X\":\"260.17\"\x2C\"Y\":\"211.53\"}\x2C{\"X\":\"264.17\"\x2C\"Y\":\"210.97\"}\x2C{\"X\":\"267.22\"\x2C\"Y\":\"209.73\"}\x2C{\"X\":\"269.56\"\x2C\"Y\":\"207.87\"}\x2C{\"X\":\"271.32\"\x2C\"Y\":\"205.27\"}\x2C{\"X\":\"273.03\"\x2C\"Y\":\"200.64\"}\x2C{\"X\":\"274.21\"\x2C\"Y\":\"194.30\"}\x2C{\"X\":\"274.63\"\x2C\"Y\":\"186.82\"}\x2C{\"X\":\"274.12\"\x2C\"Y\":\"179.19\"}\x2C{\"X\":\"273.00\"\x2C\"Y\":\"174.07\"}\x2C{\"X\":\"271.42\"\x2C\"Y\":\"170.68\"}\x2C{\"X\":\"269.38\"\x2C\"Y\":\"168.30\"}\x2C{\"X\":\"266.72\"\x2C\"Y\":\"166.64\"}\x2C{\"X\":\"263.12\"\x2C\"Y\":\"165.59\"}\x2C{\"X\":\"258.49\"\x2C\"Y\":\"165.25\"}\x2C{\"X\":\"254.56\"\x2C\"Y\":\"166.16\"}\x2C{\"X\":\"251.23\"\x2C\"Y\":\"167.86\"}\x2C{\"X\":\"248.52\"\x2C\"Y\":\"169.99\"}\x2C{\"X\":\"248.40\"\x2C\"Y\":\"170.26\"}\x2C{\"X\":\"248.39\"\x2C\"Y\":\"170.27\"}]\x2C[{\"X\":\"302.11\"\x2C\"Y\":\"132.13\"}\x2C{\"X\":\"305.37\"\x2C\"Y\":\"132.56\"}\x2C{\"X\":\"307.93\"\x2C\"Y\":\"133.77\"}\x2C{\"X\":\"309.95\"\x2C\"Y\":\"135.77\"}\x2C{\"X\":\"311.37\"\x2C\"Y\":\"138.40\"}\x2C{\"X\":\"311.95\"\x2C\"Y\":\"141.48\"}\x2C{\"X\":\"311.63\"\x2C\"Y\":\"144.75\"}\x2C{\"X\":\"310.47\"\x2C\"Y\":\"147.51\"}\x2C{\"X\":\"308.56\"\x2C\"Y\":\"149.80\"}\x2C{\"X\":\"306.27\"\x2C\"Y\":\"151.22\"}\x2C{\"X\":\"303.22\"\x2C\"Y\":\"151.96\"}\x2C{\"X\":\"299.79\"\x2C\"Y\":\"151.84\"}\x2C{\"X\":\"297.10\"\x2C\"Y\":\"150.92\"}\x2C{\"X\":\"294.85\"\x2C\"Y\":\"149.20\"}\x2C{\"X\":\"293.04\"\x2C\"Y\":\"146.63\"}\x2C{\"X\":\"292.14\"\x2C\"Y\":\"143.78\"}\x2C{\"X\":\"292.13\"\x2C\"Y\":\"140.64\"}\x2C{\"X\":\"292.97\"\x2C\"Y\":\"137.77\"}\x2C{\"X\":\"294.71\"\x2C\"Y\":\"135.15\"}\x2C{\"X\":\"296.90\"\x2C\"Y\":\"133.37\"}\x2C{\"X\":\"299.56\"\x2C\"Y\":\"132.38\"}\x2C{\"X\":\"302.10\"\x2C\"Y\":\"132.13\"}\x2C{\"X\":\"302.11\"\x2C\"Y\":\"132.13\"}]\x2C[{\"X\":\"293.34\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"293.34\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"310.65\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"310.65\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"310.65\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"293.34\"\x2C\"Y\":\"219.00\"}]\x2C[{\"X\":\"371.24\"\x2C\"Y\":\"171.37\"}\x2C{\"X\":\"371.24\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"358.21\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"358.11\"\x2C\"Y\":\"172.27\"}\x2C{\"X\":\"357.35\"\x2C\"Y\":\"170.01\"}\x2C{\"X\":\"355.81\"\x2C\"Y\":\"168.19\"}\x2C{\"X\":\"353.32\"\x2C\"Y\":\"166.83\"}\x2C{\"X\":\"349.52\"\x2C\"Y\":\"165.99\"}\x2C{\"X\":\"345.63\"\x2C\"Y\":\"165.91\"}\x2C{\"X\":\"341.71\"\x2C\"Y\":\"166.90\"}\x2C{\"X\":\"339.11\"\x2C\"Y\":\"168.36\"}\x2C{\"X\":\"336.70\"\x2C\"Y\":\"171.02\"}\x2C{\"X\":\"335.06\"\x2C\"Y\":\"173.87\"}\x2C{\"X\":\"334.96\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"317.48\"\x2C\"Y\":\"219.00\"}\x2C{\"X\":\"317.48\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"334.96\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"335.01\"\x2C\"Y\":\"162.07\"}\x2C{\"X\":\"339.49\"\x2C\"Y\":\"159.34\"}\x2C{\"X\":\"344.58\"\x2C\"Y\":\"157.56\"}\x2C{\"X\":\"349.77\"\x2C\"Y\":\"156.78\"}\x2C{\"X\":\"355.76\"\x2C\"Y\":\"156.84\"}\x2C{\"X\":\"360.47\"\x2C\"Y\":\"157.70\"}\x2C{\"X\":\"364.07\"\x2C\"Y\":\"159.18\"}\x2C{\"X\":\"366.81\"\x2C\"Y\":\"161.26\"}\x2C{\"X\":\"369.25\"\x2C\"Y\":\"164.29\"}\x2C{\"X\":\"370.67\"\x2C\"Y\":\"167.42\"}\x2C{\"X\":\"371.23\"\x2C\"Y\":\"170.82\"}\x2C{\"X\":\"371.24\"\x2C\"Y\":\"171.27\"}\x2C{\"X\":\"371.24\"\x2C\"Y\":\"171.37\"}]\x2C[{\"X\":\"401.90\"\x2C\"Y\":\"232.76\"}\x2C{\"X\":\"407.58\"\x2C\"Y\":\"232.33\"}\x2C{\"X\":\"411.33\"\x2C\"Y\":\"231.29\"}\x2C{\"X\":\"413.88\"\x2C\"Y\":\"229.75\"}\x2C{\"X\":\"415.39\"\x2C\"Y\":\"227.89\"}\x2C{\"X\":\"416.16\"\x2C\"Y\":\"225.48\"}\x2C{\"X\":\"416.21\"\x2C\"Y\":\"216.25\"}\x2C{\"X\":\"411.46\"\x2C\"Y\":\"218.08\"}\x2C{\"X\":\"405.72\"\x2C\"Y\":\"219.22\"}\x2C{\"X\":\"399.44\"\x2C\"Y\":\"219.51\"}\x2C{\"X\":\"393.19\"\x2C\"Y\":\"218.76\"}\x2C{\"X\":\"388.30\"\x2C\"Y\":\"217.32\"}\x2C{\"X\":\"385.44\"\x2C\"Y\":\"215.70\"}\x2C{\"X\":\"382.67\"\x2C\"Y\":\"212.97\"}\x2C{\"X\":\"380.07\"\x2C\"Y\":\"208.95\"}\x2C{\"X\":\"378.24\"\x2C\"Y\":\"204.52\"}\x2C{\"X\":\"376.93\"\x2C\"Y\":\"198.51\"}\x2C{\"X\":\"376.28\"\x2C\"Y\":\"190.44\"}\x2C{\"X\":\"376.52\"\x2C\"Y\":\"182.65\"}\x2C{\"X\":\"377.58\"\x2C\"Y\":\"175.38\"}\x2C{\"X\":\"379.16\"\x2C\"Y\":\"170.07\"}\x2C{\"X\":\"381.22\"\x2C\"Y\":\"166.08\"}\x2C{\"X\":\"384.14\"\x2C\"Y\":\"162.28\"}\x2C{\"X\":\"387.11\"\x2C\"Y\":\"159.77\"}\x2C{\"X\":\"390.08\"\x2C\"Y\":\"158.35\"}\x2C{\"X\":\"395.48\"\x2C\"Y\":\"157.12\"}\x2C{\"X\":\"401.76\"\x2C\"Y\":\"156.70\"}\x2C{\"X\":\"406.66\"\x2C\"Y\":\"157.40\"}\x2C{\"X\":\"412.02\"\x2C\"Y\":\"159.31\"}\x2C{\"X\":\"416.24\"\x2C\"Y\":\"161.51\"}\x2C{\"X\":\"416.24\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"433.55\"\x2C\"Y\":\"157.06\"}\x2C{\"X\":\"433.43\"\x2C\"Y\":\"223.84\"}\x2C{\"X\":\"432.54\"\x2C\"Y\":\"227.93\"}\x2C{\"X\":\"430.90\"\x2C\"Y\":\"231.30\"}\x2C{\"X\":\"428.49\"\x2C\"Y\":\"234.16\"}\x2C{\"X\":\"425.23\"\x2C\"Y\":\"236.55\"}\x2C{\"X\":\"420.86\"\x2C\"Y\":\"238.51\"}\x2C{\"X\":\"415.19\"\x2C\"Y\":\"239.93\"}\x2C{\"X\":\"407.89\"\x2C\"Y\":\"240.69\"}\x2C{\"X\":\"399.04\"\x2C\"Y\":\"240.53\"}\x2C{\"X\":\"391.61\"\x2C\"Y\":\"239.58\"}\x2C{\"X\":\"384.09\"\x2C\"Y\":\"237.51\"}\x2C{\"X\":\"382.01\"\x2C\"Y\":\"236.48\"}\x2C{\"X\":\"380.74\"\x2C\"Y\":\"226.84\"}\x2C{\"X\":\"385.59\"\x2C\"Y\":\"229.19\"}\x2C{\"X\":\"391.82\"\x2C\"Y\":\"231.36\"}\x2C{\"X\":\"398.16\"\x2C\"Y\":\"232.49\"}\x2C{\"X\":\"401.75\"\x2C\"Y\":\"232.75\"}\x2C{\"X\":\"401.90\"\x2C\"Y\":\"232.76\"}]\x2C[{\"X\":\"416.25\"\x2C\"Y\":\"170.27\"}\x2C{\"X\":\"414.97\"\x2C\"Y\":\"169.05\"}\x2C{\"X\":\"410.96\"\x2C\"Y\":\"166.71\"}\x2C{\"X\":\"406.83\"\x2C\"Y\":\"165.39\"}\x2C{\"X\":\"404.44\"\x2C\"Y\":\"165.28\"}\x2C{\"X\":\"400.31\"\x2C\"Y\":\"165.96\"}\x2C{\"X\":\"397.15\"\x2C\"Y\":\"167.34\"}\x2C{\"X\":\"394.75\"\x2C\"Y\":\"169.35\"}\x2C{\"X\":\"392.82\"\x2C\"Y\":\"172.20\"}\x2C{\"X\":\"391.40\"\x2C\"Y\":\"176.14\"}\x2C{\"X\":\"390.35\"\x2C\"Y\":\"182.50\"}\x2C{\"X\":\"390.04\"\x2C\"Y\":\"190.14\"}\x2C{\"X\":\"390.67\"\x2C\"Y\":\"197.15\"}\x2C{\"X\":\"391.97\"\x2C\"Y\":\"202.39\"}\x2C{\"X\":\"393.71\"\x2C\"Y\":\"206.20\"}\x2C{\"X\":\"395.76\"\x2C\"Y\":\"208.58\"}\x2C{\"X\":\"398.42\"\x2C\"Y\":\"210.25\"}\x2C{\"X\":\"401.86\"\x2C\"Y\":\"211.27\"}\x2C{\"X\":\"406.04\"\x2C\"Y\":\"211.51\"}\x2C{\"X\":\"410.92\"\x2C\"Y\":\"210.69\"}\x2C{\"X\":\"414.49\"\x2C\"Y\":\"209.16\"}\x2C{\"X\":\"416.25\"\x2C\"Y\":\"208.01\"}\x2C{\"X\":\"416.25\"\x2C\"Y\":\"170.27\"}\x2C{\"X\":\"416.25\"\x2C\"Y\":\"170.27\"}]]", Scope = Public
	#tag EndConstant

	#tag Constant, Name = text_polygon, Type = String, Dynamic = False, Default = \"[[{\"X\":\"28.18\"\x2C\"Y\":\"205.95\"}\x2C{\"X\":\"28.18\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"48.27\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"48.28\"\x2C\"Y\":\"110.23\"}\x2C{\"X\":\"54.15\"\x2C\"Y\":\"107.22\"}\x2C{\"X\":\"59.69\"\x2C\"Y\":\"105.39\"}\x2C{\"X\":\"65.04\"\x2C\"Y\":\"104.66\"}\x2C{\"X\":\"72.07\"\x2C\"Y\":\"105.08\"}\x2C{\"X\":\"78.09\"\x2C\"Y\":\"106.31\"}\x2C{\"X\":\"81.57\"\x2C\"Y\":\"107.68\"}\x2C{\"X\":\"84.84\"\x2C\"Y\":\"110.05\"}\x2C{\"X\":\"88.03\"\x2C\"Y\":\"113.63\"}\x2C{\"X\":\"90.87\"\x2C\"Y\":\"118.22\"}\x2C{\"X\":\"92.71\"\x2C\"Y\":\"123.12\"}\x2C{\"X\":\"94.06\"\x2C\"Y\":\"129.73\"}\x2C{\"X\":\"94.70\"\x2C\"Y\":\"138.25\"}\x2C{\"X\":\"94.41\"\x2C\"Y\":\"147.24\"}\x2C{\"X\":\"93.31\"\x2C\"Y\":\"155.42\"}\x2C{\"X\":\"91.66\"\x2C\"Y\":\"161.49\"}\x2C{\"X\":\"89.46\"\x2C\"Y\":\"166.25\"}\x2C{\"X\":\"86.67\"\x2C\"Y\":\"170.32\"}\x2C{\"X\":\"83.75\"\x2C\"Y\":\"173.13\"}\x2C{\"X\":\"80.65\"\x2C\"Y\":\"174.92\"}\x2C{\"X\":\"75.51\"\x2C\"Y\":\"176.56\"}\x2C{\"X\":\"69.28\"\x2C\"Y\":\"177.50\"}\x2C{\"X\":\"63.74\"\x2C\"Y\":\"177.55\"}\x2C{\"X\":\"57.05\"\x2C\"Y\":\"176.72\"}\x2C{\"X\":\"51.42\"\x2C\"Y\":\"175.15\"}\x2C{\"X\":\"48.27\"\x2C\"Y\":\"173.79\"}\x2C{\"X\":\"48.27\"\x2C\"Y\":\"205.95\"}\x2C{\"X\":\"48.27\"\x2C\"Y\":\"205.95\"}\x2C{\"X\":\"28.18\"\x2C\"Y\":\"205.95\"}]\x2C[{\"X\":\"48.28\"\x2C\"Y\":\"120.42\"}\x2C{\"X\":\"48.38\"\x2C\"Y\":\"164.32\"}\x2C{\"X\":\"52.31\"\x2C\"Y\":\"166.53\"}\x2C{\"X\":\"56.14\"\x2C\"Y\":\"167.74\"}\x2C{\"X\":\"61.35\"\x2C\"Y\":\"168.35\"}\x2C{\"X\":\"65.96\"\x2C\"Y\":\"167.83\"}\x2C{\"X\":\"69.49\"\x2C\"Y\":\"166.59\"}\x2C{\"X\":\"72.20\"\x2C\"Y\":\"164.73\"}\x2C{\"X\":\"74.29\"\x2C\"Y\":\"162.19\"}\x2C{\"X\":\"76.19\"\x2C\"Y\":\"157.95\"}\x2C{\"X\":\"77.71\"\x2C\"Y\":\"152.00\"}\x2C{\"X\":\"78.63\"\x2C\"Y\":\"144.11\"}\x2C{\"X\":\"78.66\"\x2C\"Y\":\"136.61\"}\x2C{\"X\":\"77.89\"\x2C\"Y\":\"129.16\"}\x2C{\"X\":\"76.59\"\x2C\"Y\":\"124.08\"}\x2C{\"X\":\"74.84\"\x2C\"Y\":\"120.60\"}\x2C{\"X\":\"72.55\"\x2C\"Y\":\"118.04\"}\x2C{\"X\":\"69.77\"\x2C\"Y\":\"116.28\"}\x2C{\"X\":\"65.91\"\x2C\"Y\":\"115.07\"}\x2C{\"X\":\"60.69\"\x2C\"Y\":\"114.57\"}\x2C{\"X\":\"56.85\"\x2C\"Y\":\"115.18\"}\x2C{\"X\":\"53.10\"\x2C\"Y\":\"116.68\"}\x2C{\"X\":\"48.91\"\x2C\"Y\":\"119.57\"}\x2C{\"X\":\"48.28\"\x2C\"Y\":\"120.39\"}\x2C{\"X\":\"48.28\"\x2C\"Y\":\"120.42\"}]\x2C[{\"X\":\"132.15\"\x2C\"Y\":\"104.65\"}\x2C{\"X\":\"139.94\"\x2C\"Y\":\"105.10\"}\x2C{\"X\":\"146.11\"\x2C\"Y\":\"106.30\"}\x2C{\"X\":\"151.03\"\x2C\"Y\":\"108.11\"}\x2C{\"X\":\"155.15\"\x2C\"Y\":\"110.57\"}\x2C{\"X\":\"158.60\"\x2C\"Y\":\"113.67\"}\x2C{\"X\":\"161.35\"\x2C\"Y\":\"117.41\"}\x2C{\"X\":\"163.45\"\x2C\"Y\":\"121.89\"}\x2C{\"X\":\"165.10\"\x2C\"Y\":\"127.80\"}\x2C{\"X\":\"166.07\"\x2C\"Y\":\"135.09\"}\x2C{\"X\":\"166.22\"\x2C\"Y\":\"143.93\"}\x2C{\"X\":\"165.51\"\x2C\"Y\":\"151.69\"}\x2C{\"X\":\"164.06\"\x2C\"Y\":\"158.12\"}\x2C{\"X\":\"162.01\"\x2C\"Y\":\"163.28\"}\x2C{\"X\":\"159.40\"\x2C\"Y\":\"167.47\"}\x2C{\"X\":\"156.32\"\x2C\"Y\":\"170.74\"}\x2C{\"X\":\"152.52\"\x2C\"Y\":\"173.40\"}\x2C{\"X\":\"147.87\"\x2C\"Y\":\"175.49\"}\x2C{\"X\":\"142.07\"\x2C\"Y\":\"176.99\"}\x2C{\"X\":\"134.92\"\x2C\"Y\":\"177.77\"}\x2C{\"X\":\"127.42\"\x2C\"Y\":\"177.67\"}\x2C{\"X\":\"120.74\"\x2C\"Y\":\"176.71\"}\x2C{\"X\":\"115.29\"\x2C\"Y\":\"175.07\"}\x2C{\"X\":\"110.74\"\x2C\"Y\":\"172.78\"}\x2C{\"X\":\"106.95\"\x2C\"Y\":\"169.86\"}\x2C{\"X\":\"103.92\"\x2C\"Y\":\"166.34\"}\x2C{\"X\":\"101.48\"\x2C\"Y\":\"162.04\"}\x2C{\"X\":\"99.57\"\x2C\"Y\":\"156.68\"}\x2C{\"X\":\"98.29\"\x2C\"Y\":\"150.05\"}\x2C{\"X\":\"97.78\"\x2C\"Y\":\"141.98\"}\x2C{\"X\":\"98.18\"\x2C\"Y\":\"134.19\"}\x2C{\"X\":\"99.36\"\x2C\"Y\":\"127.55\"}\x2C{\"X\":\"101.22\"\x2C\"Y\":\"122.01\"}\x2C{\"X\":\"103.68\"\x2C\"Y\":\"117.38\"}\x2C{\"X\":\"106.77\"\x2C\"Y\":\"113.52\"}\x2C{\"X\":\"110.41\"\x2C\"Y\":\"110.41\"}\x2C{\"X\":\"114.84\"\x2C\"Y\":\"107.89\"}\x2C{\"X\":\"120.07\"\x2C\"Y\":\"106.06\"}\x2C{\"X\":\"126.27\"\x2C\"Y\":\"104.95\"}\x2C{\"X\":\"132.11\"\x2C\"Y\":\"104.65\"}\x2C{\"X\":\"132.15\"\x2C\"Y\":\"104.65\"}]\x2C[{\"X\":\"117.86\"\x2C\"Y\":\"140.93\"}\x2C{\"X\":\"118.75\"\x2C\"Y\":\"153.65\"}\x2C{\"X\":\"119.63\"\x2C\"Y\":\"158.05\"}\x2C{\"X\":\"121.31\"\x2C\"Y\":\"161.73\"}\x2C{\"X\":\"123.57\"\x2C\"Y\":\"164.71\"}\x2C{\"X\":\"126.01\"\x2C\"Y\":\"166.43\"}\x2C{\"X\":\"129.14\"\x2C\"Y\":\"167.44\"}\x2C{\"X\":\"133.32\"\x2C\"Y\":\"167.70\"}\x2C{\"X\":\"137.17\"\x2C\"Y\":\"167.11\"}\x2C{\"X\":\"140.03\"\x2C\"Y\":\"165.83\"}\x2C{\"X\":\"142.14\"\x2C\"Y\":\"163.92\"}\x2C{\"X\":\"143.62\"\x2C\"Y\":\"161.33\"}\x2C{\"X\":\"145.05\"\x2C\"Y\":\"155.97\"}\x2C{\"X\":\"145.97\"\x2C\"Y\":\"148.23\"}\x2C{\"X\":\"146.12\"\x2C\"Y\":\"137.89\"}\x2C{\"X\":\"145.44\"\x2C\"Y\":\"129.22\"}\x2C{\"X\":\"144.13\"\x2C\"Y\":\"122.91\"}\x2C{\"X\":\"142.80\"\x2C\"Y\":\"119.58\"}\x2C{\"X\":\"140.91\"\x2C\"Y\":\"117.26\"}\x2C{\"X\":\"138.39\"\x2C\"Y\":\"115.66\"}\x2C{\"X\":\"135.07\"\x2C\"Y\":\"114.75\"}\x2C{\"X\":\"131.03\"\x2C\"Y\":\"114.64\"}\x2C{\"X\":\"127.21\"\x2C\"Y\":\"115.38\"}\x2C{\"X\":\"124.25\"\x2C\"Y\":\"116.82\"}\x2C{\"X\":\"122.07\"\x2C\"Y\":\"118.86\"}\x2C{\"X\":\"120.53\"\x2C\"Y\":\"121.59\"}\x2C{\"X\":\"119.03\"\x2C\"Y\":\"126.93\"}\x2C{\"X\":\"118.09\"\x2C\"Y\":\"134.21\"}\x2C{\"X\":\"117.86\"\x2C\"Y\":\"140.81\"}\x2C{\"X\":\"117.86\"\x2C\"Y\":\"140.93\"}]\x2C[{\"X\":\"172.03\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"172.03\"\x2C\"Y\":\"76.33\"}\x2C{\"X\":\"191.91\"\x2C\"Y\":\"76.33\"}\x2C{\"X\":\"191.91\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"191.91\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"172.03\"\x2C\"Y\":\"177.00\"}]\x2C[{\"X\":\"224.60\"\x2C\"Y\":\"196.88\"}\x2C{\"X\":\"221.39\"\x2C\"Y\":\"198.11\"}\x2C{\"X\":\"215.61\"\x2C\"Y\":\"199.00\"}\x2C{\"X\":\"208.60\"\x2C\"Y\":\"199.21\"}\x2C{\"X\":\"204.09\"\x2C\"Y\":\"190.40\"}\x2C{\"X\":\"211.28\"\x2C\"Y\":\"190.55\"}\x2C{\"X\":\"214.82\"\x2C\"Y\":\"189.98\"}\x2C{\"X\":\"217.84\"\x2C\"Y\":\"188.66\"}\x2C{\"X\":\"220.35\"\x2C\"Y\":\"186.54\"}\x2C{\"X\":\"222.45\"\x2C\"Y\":\"183.44\"}\x2C{\"X\":\"224.33\"\x2C\"Y\":\"178.55\"}\x2C{\"X\":\"225.80\"\x2C\"Y\":\"173.86\"}\x2C{\"X\":\"195.43\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"215.95\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"235.40\"\x2C\"Y\":\"149.04\"}\x2C{\"X\":\"252.44\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"265.17\"\x2C\"Y\":\"105.14\"}\x2C{\"X\":\"233.73\"\x2C\"Y\":\"186.25\"}\x2C{\"X\":\"231.07\"\x2C\"Y\":\"190.77\"}\x2C{\"X\":\"228.03\"\x2C\"Y\":\"194.27\"}\x2C{\"X\":\"224.70\"\x2C\"Y\":\"196.82\"}\x2C{\"X\":\"224.60\"\x2C\"Y\":\"196.88\"}]\x2C[{\"X\":\"292.60\"\x2C\"Y\":\"192.98\"}\x2C{\"X\":\"298.73\"\x2C\"Y\":\"192.56\"}\x2C{\"X\":\"303.08\"\x2C\"Y\":\"191.46\"}\x2C{\"X\":\"305.98\"\x2C\"Y\":\"189.91\"}\x2C{\"X\":\"307.86\"\x2C\"Y\":\"187.98\"}\x2C{\"X\":\"308.96\"\x2C\"Y\":\"185.54\"}\x2C{\"X\":\"309.26\"\x2C\"Y\":\"183.06\"}\x2C{\"X\":\"309.20\"\x2C\"Y\":\"173.81\"}\x2C{\"X\":\"304.04\"\x2C\"Y\":\"175.83\"}\x2C{\"X\":\"298.03\"\x2C\"Y\":\"177.13\"}\x2C{\"X\":\"291.00\"\x2C\"Y\":\"177.63\"}\x2C{\"X\":\"284.29\"\x2C\"Y\":\"177.05\"}\x2C{\"X\":\"278.60\"\x2C\"Y\":\"175.70\"}\x2C{\"X\":\"274.88\"\x2C\"Y\":\"174.11\"}\x2C{\"X\":\"271.82\"\x2C\"Y\":\"171.71\"}\x2C{\"X\":\"268.90\"\x2C\"Y\":\"168.11\"}\x2C{\"X\":\"266.25\"\x2C\"Y\":\"163.24\"}\x2C{\"X\":\"264.52\"\x2C\"Y\":\"157.97\"}\x2C{\"X\":\"263.31\"\x2C\"Y\":\"150.88\"}\x2C{\"X\":\"262.81\"\x2C\"Y\":\"141.60\"}\x2C{\"X\":\"263.34\"\x2C\"Y\":\"132.62\"}\x2C{\"X\":\"264.61\"\x2C\"Y\":\"125.23\"}\x2C{\"X\":\"266.40\"\x2C\"Y\":\"119.67\"}\x2C{\"X\":\"268.74\"\x2C\"Y\":\"115.31\"}\x2C{\"X\":\"271.95\"\x2C\"Y\":\"111.17\"}\x2C{\"X\":\"275.11\"\x2C\"Y\":\"108.42\"}\x2C{\"X\":\"278.30\"\x2C\"Y\":\"106.76\"}\x2C{\"X\":\"283.81\"\x2C\"Y\":\"105.35\"}\x2C{\"X\":\"290.52\"\x2C\"Y\":\"104.67\"}\x2C{\"X\":\"295.16\"\x2C\"Y\":\"104.90\"}\x2C{\"X\":\"299.98\"\x2C\"Y\":\"105.99\"}\x2C{\"X\":\"306.08\"\x2C\"Y\":\"108.50\"}\x2C{\"X\":\"309.26\"\x2C\"Y\":\"110.23\"}\x2C{\"X\":\"309.26\"\x2C\"Y\":\"105.06\"}\x2C{\"X\":\"329.35\"\x2C\"Y\":\"105.06\"}\x2C{\"X\":\"329.23\"\x2C\"Y\":\"182.37\"}\x2C{\"X\":\"328.37\"\x2C\"Y\":\"186.78\"}\x2C{\"X\":\"326.76\"\x2C\"Y\":\"190.49\"}\x2C{\"X\":\"324.35\"\x2C\"Y\":\"193.73\"}\x2C{\"X\":\"321.15\"\x2C\"Y\":\"196.44\"}\x2C{\"X\":\"316.95\"\x2C\"Y\":\"198.74\"}\x2C{\"X\":\"311.55\"\x2C\"Y\":\"200.55\"}\x2C{\"X\":\"304.61\"\x2C\"Y\":\"201.78\"}\x2C{\"X\":\"296.23\"\x2C\"Y\":\"202.25\"}\x2C{\"X\":\"286.50\"\x2C\"Y\":\"201.75\"}\x2C{\"X\":\"279.10\"\x2C\"Y\":\"200.55\"}\x2C{\"X\":\"271.33\"\x2C\"Y\":\"198.26\"}\x2C{\"X\":\"269.50\"\x2C\"Y\":\"197.28\"}\x2C{\"X\":\"268.04\"\x2C\"Y\":\"186.11\"}\x2C{\"X\":\"273.14\"\x2C\"Y\":\"188.62\"}\x2C{\"X\":\"280.19\"\x2C\"Y\":\"191.16\"}\x2C{\"X\":\"286.81\"\x2C\"Y\":\"192.48\"}\x2C{\"X\":\"292.48\"\x2C\"Y\":\"192.97\"}\x2C{\"X\":\"292.60\"\x2C\"Y\":\"192.98\"}]\x2C[{\"X\":\"309.26\"\x2C\"Y\":\"120.42\"}\x2C{\"X\":\"308.13\"\x2C\"Y\":\"119.26\"}\x2C{\"X\":\"303.52\"\x2C\"Y\":\"116.46\"}\x2C{\"X\":\"299.14\"\x2C\"Y\":\"114.93\"}\x2C{\"X\":\"296.63\"\x2C\"Y\":\"114.57\"}\x2C{\"X\":\"291.87\"\x2C\"Y\":\"115.12\"}\x2C{\"X\":\"288.19\"\x2C\"Y\":\"116.39\"}\x2C{\"X\":\"285.33\"\x2C\"Y\":\"118.31\"}\x2C{\"X\":\"282.99\"\x2C\"Y\":\"121.03\"}\x2C{\"X\":\"281.19\"\x2C\"Y\":\"124.65\"}\x2C{\"X\":\"279.81\"\x2C\"Y\":\"130.01\"}\x2C{\"X\":\"278.92\"\x2C\"Y\":\"137.91\"}\x2C{\"X\":\"278.88\"\x2C\"Y\":\"145.11\"}\x2C{\"X\":\"279.69\"\x2C\"Y\":\"152.40\"}\x2C{\"X\":\"281.18\"\x2C\"Y\":\"158.05\"}\x2C{\"X\":\"283.08\"\x2C\"Y\":\"162.12\"}\x2C{\"X\":\"285.18\"\x2C\"Y\":\"164.65\"}\x2C{\"X\":\"287.89\"\x2C\"Y\":\"166.53\"}\x2C{\"X\":\"291.41\"\x2C\"Y\":\"167.79\"}\x2C{\"X\":\"296.02\"\x2C\"Y\":\"168.34\"}\x2C{\"X\":\"301.23\"\x2C\"Y\":\"167.79\"}\x2C{\"X\":\"305.10\"\x2C\"Y\":\"166.63\"}\x2C{\"X\":\"309.03\"\x2C\"Y\":\"164.44\"}\x2C{\"X\":\"309.26\"\x2C\"Y\":\"164.24\"}\x2C{\"X\":\"309.26\"\x2C\"Y\":\"164.24\"}\x2C{\"X\":\"309.26\"\x2C\"Y\":\"120.42\"}]\x2C[{\"X\":\"369.84\"\x2C\"Y\":\"104.65\"}\x2C{\"X\":\"377.62\"\x2C\"Y\":\"105.10\"}\x2C{\"X\":\"383.80\"\x2C\"Y\":\"106.30\"}\x2C{\"X\":\"388.72\"\x2C\"Y\":\"108.11\"}\x2C{\"X\":\"392.84\"\x2C\"Y\":\"110.56\"}\x2C{\"X\":\"396.29\"\x2C\"Y\":\"113.67\"}\x2C{\"X\":\"399.04\"\x2C\"Y\":\"117.41\"}\x2C{\"X\":\"401.13\"\x2C\"Y\":\"121.89\"}\x2C{\"X\":\"402.78\"\x2C\"Y\":\"127.80\"}\x2C{\"X\":\"403.75\"\x2C\"Y\":\"135.08\"}\x2C{\"X\":\"403.90\"\x2C\"Y\":\"143.93\"}\x2C{\"X\":\"403.19\"\x2C\"Y\":\"151.69\"}\x2C{\"X\":\"401.74\"\x2C\"Y\":\"158.12\"}\x2C{\"X\":\"399.70\"\x2C\"Y\":\"163.28\"}\x2C{\"X\":\"397.08\"\x2C\"Y\":\"167.47\"}\x2C{\"X\":\"394.00\"\x2C\"Y\":\"170.74\"}\x2C{\"X\":\"390.20\"\x2C\"Y\":\"173.40\"}\x2C{\"X\":\"385.55\"\x2C\"Y\":\"175.49\"}\x2C{\"X\":\"379.75\"\x2C\"Y\":\"176.99\"}\x2C{\"X\":\"372.60\"\x2C\"Y\":\"177.77\"}\x2C{\"X\":\"365.11\"\x2C\"Y\":\"177.67\"}\x2C{\"X\":\"358.43\"\x2C\"Y\":\"176.71\"}\x2C{\"X\":\"352.98\"\x2C\"Y\":\"175.07\"}\x2C{\"X\":\"348.43\"\x2C\"Y\":\"172.78\"}\x2C{\"X\":\"344.63\"\x2C\"Y\":\"169.86\"}\x2C{\"X\":\"341.60\"\x2C\"Y\":\"166.34\"}\x2C{\"X\":\"339.16\"\x2C\"Y\":\"162.04\"}\x2C{\"X\":\"337.26\"\x2C\"Y\":\"156.68\"}\x2C{\"X\":\"335.98\"\x2C\"Y\":\"150.05\"}\x2C{\"X\":\"335.46\"\x2C\"Y\":\"141.97\"}\x2C{\"X\":\"335.86\"\x2C\"Y\":\"134.19\"}\x2C{\"X\":\"337.04\"\x2C\"Y\":\"127.55\"}\x2C{\"X\":\"338.90\"\x2C\"Y\":\"122.01\"}\x2C{\"X\":\"341.37\"\x2C\"Y\":\"117.38\"}\x2C{\"X\":\"344.45\"\x2C\"Y\":\"113.52\"}\x2C{\"X\":\"348.10\"\x2C\"Y\":\"110.41\"}\x2C{\"X\":\"352.52\"\x2C\"Y\":\"107.89\"}\x2C{\"X\":\"357.76\"\x2C\"Y\":\"106.06\"}\x2C{\"X\":\"363.95\"\x2C\"Y\":\"104.95\"}\x2C{\"X\":\"369.79\"\x2C\"Y\":\"104.65\"}\x2C{\"X\":\"369.84\"\x2C\"Y\":\"104.65\"}]\x2C[{\"X\":\"355.55\"\x2C\"Y\":\"140.93\"}\x2C{\"X\":\"356.44\"\x2C\"Y\":\"153.65\"}\x2C{\"X\":\"357.32\"\x2C\"Y\":\"158.05\"}\x2C{\"X\":\"358.99\"\x2C\"Y\":\"161.73\"}\x2C{\"X\":\"361.25\"\x2C\"Y\":\"164.71\"}\x2C{\"X\":\"363.70\"\x2C\"Y\":\"166.43\"}\x2C{\"X\":\"366.83\"\x2C\"Y\":\"167.44\"}\x2C{\"X\":\"371.01\"\x2C\"Y\":\"167.70\"}\x2C{\"X\":\"374.86\"\x2C\"Y\":\"167.11\"}\x2C{\"X\":\"377.72\"\x2C\"Y\":\"165.83\"}\x2C{\"X\":\"379.82\"\x2C\"Y\":\"163.92\"}\x2C{\"X\":\"381.31\"\x2C\"Y\":\"161.33\"}\x2C{\"X\":\"382.74\"\x2C\"Y\":\"155.97\"}\x2C{\"X\":\"383.65\"\x2C\"Y\":\"148.23\"}\x2C{\"X\":\"383.81\"\x2C\"Y\":\"137.89\"}\x2C{\"X\":\"383.12\"\x2C\"Y\":\"129.22\"}\x2C{\"X\":\"381.82\"\x2C\"Y\":\"122.91\"}\x2C{\"X\":\"380.48\"\x2C\"Y\":\"119.58\"}\x2C{\"X\":\"378.60\"\x2C\"Y\":\"117.26\"}\x2C{\"X\":\"376.07\"\x2C\"Y\":\"115.66\"}\x2C{\"X\":\"372.76\"\x2C\"Y\":\"114.75\"}\x2C{\"X\":\"368.72\"\x2C\"Y\":\"114.64\"}\x2C{\"X\":\"364.90\"\x2C\"Y\":\"115.38\"}\x2C{\"X\":\"361.94\"\x2C\"Y\":\"116.82\"}\x2C{\"X\":\"359.76\"\x2C\"Y\":\"118.86\"}\x2C{\"X\":\"358.22\"\x2C\"Y\":\"121.60\"}\x2C{\"X\":\"356.71\"\x2C\"Y\":\"126.93\"}\x2C{\"X\":\"355.77\"\x2C\"Y\":\"134.21\"}\x2C{\"X\":\"355.55\"\x2C\"Y\":\"140.81\"}\x2C{\"X\":\"355.55\"\x2C\"Y\":\"140.93\"}]\x2C[{\"X\":\"471.82\"\x2C\"Y\":\"121.68\"}\x2C{\"X\":\"471.82\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"456.69\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"456.58\"\x2C\"Y\":\"122.81\"}\x2C{\"X\":\"455.77\"\x2C\"Y\":\"120.25\"}\x2C{\"X\":\"454.20\"\x2C\"Y\":\"118.25\"}\x2C{\"X\":\"451.80\"\x2C\"Y\":\"116.74\"}\x2C{\"X\":\"448.06\"\x2C\"Y\":\"115.65\"}\x2C{\"X\":\"442.84\"\x2C\"Y\":\"115.25\"}\x2C{\"X\":\"438.30\"\x2C\"Y\":\"116.22\"}\x2C{\"X\":\"435.19\"\x2C\"Y\":\"117.70\"}\x2C{\"X\":\"432.97\"\x2C\"Y\":\"119.70\"}\x2C{\"X\":\"430.36\"\x2C\"Y\":\"123.35\"}\x2C{\"X\":\"429.69\"\x2C\"Y\":\"124.95\"}\x2C{\"X\":\"429.69\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"409.38\"\x2C\"Y\":\"177.00\"}\x2C{\"X\":\"409.38\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"429.69\"\x2C\"Y\":\"105.07\"}\x2C{\"X\":\"429.70\"\x2C\"Y\":\"110.91\"}\x2C{\"X\":\"434.67\"\x2C\"Y\":\"107.84\"}\x2C{\"X\":\"440.16\"\x2C\"Y\":\"105.83\"}\x2C{\"X\":\"445.62\"\x2C\"Y\":\"104.85\"}\x2C{\"X\":\"452.21\"\x2C\"Y\":\"104.70\"}\x2C{\"X\":\"457.71\"\x2C\"Y\":\"105.40\"}\x2C{\"X\":\"461.98\"\x2C\"Y\":\"106.78\"}\x2C{\"X\":\"465.33\"\x2C\"Y\":\"108.76\"}\x2C{\"X\":\"468.28\"\x2C\"Y\":\"111.73\"}\x2C{\"X\":\"470.35\"\x2C\"Y\":\"115.03\"}\x2C{\"X\":\"471.52\"\x2C\"Y\":\"118.58\"}\x2C{\"X\":\"471.82\"\x2C\"Y\":\"121.56\"}\x2C{\"X\":\"471.82\"\x2C\"Y\":\"121.68\"}]]", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Out
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim p1 as ClipperPathsMBS = text1
		  dim p2 as ClipperPathsMBS = text2
		  
		  
		  //draw input polygons with user-defined routine ...
		  DrawPolygons(g, p1, &c8888FF77) // blue
		  DrawPolygons(g, p2, &cFF888877) // red
		  
		  //perform intersection ...
		  dim c as new ClipperEngineMBS
		  call c.AddPaths(p1, ClipperMBS.PolyType.Subject, true)
		  call c.AddPaths(p2, ClipperMBS.PolyType.Clip, true)
		  
		  dim cliptype     as Integer = PopupClipType.ListIndex-1
		  dim PolyFillType as Integer = Integer(ClipperMBS.PolyFillType.EvenOdd)
		  
		  dim solution as ClipperPathsMBS
		  if c.Execute(ClipType, solution, PolyFillType, PolyFillType) then
		    
		    //draw solution with user-defined routine ...
		    DrawPolygons(g, solution, &c88FF8877) // solution shaded green
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupClipType
	#tag Event
		Sub Change()
		  out.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
