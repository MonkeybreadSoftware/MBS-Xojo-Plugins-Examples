#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  pdf=new MyDynaPDFMBS
		  
		  if TargetMachO or TargetWin32 or TargetLinux then
		    // ok
		  else
		    MsgBox "target not supported."
		  end if
		  
		  f=FindFile("simplePie with DynaPDF.pdf")
		  // needs DynaPDF Plugin
		  call pdf.CreateNewPDF f
		  
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  simplePieHighRes 
		  simplePie
		  threedpieHighRes
		  threedpie
		  multidepthpie
		  sidelabelpie
		  smallsectorpie
		  circlelabelpieTop
		  circlelabelpieOutside
		  iconpie
		  iconpie2
		  donut
		  icondonut
		  texturedonutHighRes
		  texturedonut
		  concentric
		  fontpie
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub circlelabelpieOutside()
		  // The data for the pie chart
		  dim data(-1) as double = array(25.0, 18, 15, 12, 30, 35)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string =array ("Labor", "Licenses", "Taxes", "Legal", "Facilities","Production")
		  
		  // Create a PieChart object of size 300 x 300 pixels
		  dim c as new CDPieChartMBS(300,300)
		  
		  //============================================================
		  //    Draw a pie chart where the label is outside the pie
		  //============================================================
		  
		  // Set the center of the pie at (150, 150) and the radius to 80 pixels
		  c.setPieSize(150, 150, 80)
		  
		  // Set the sector label position to be 20 pixels from the pie. Use a join
		  // line to connect the labels to the sectors.
		  c.setLabelPos(20, c.kLineColor)
		  
		  // Set the label format to three lines, showing the sector name, value, and
		  // percentage. The value 999 will be formatted as US$999K.
		  c.setLabelFormat("{label}"+EndOfLine.unix+"US${value}K"+EndOfLine.unix+"({percent}%)")
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  // Explode the 1st sector (index = 0)
		  c.setExplode(0)
		  
		  // output the chart
		  finish c,"circlelabelpieOutside"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub circlelabelpieTop()
		  // The data for the pie chart
		  dim data(-1) as double = array(25.0, 18, 15, 12, 30, 35)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string =array ("Labor", "Licenses", "Taxes", "Legal", "Facilities","Production")
		  
		  // Create a PieChart object of size 300 x 300 pixels
		  dim c as new CDPieChartMBS(300,300)
		  
		  //============================================================
		  //    Draw a pie chart where the label is on top of the pie
		  //============================================================
		  
		  // Set the center of the pie at (150, 150) and the radius to 120 pixels
		  c.setPieSize(150, 150, 120)
		  
		  // Set the label position to -40 pixels from the perimeter of the pie (-ve
		  // means label is inside the pie)
		  c.setLabelPos(-40)
		  
		  
		  // Set the label format to three lines, showing the sector name, value, and
		  // percentage. The value 999 will be formatted as US$999K.
		  c.setLabelFormat("{label}"+EndOfLine.unix+"US${value}K"+EndOfLine.unix+"({percent}%)")
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  // Explode the 1st sector (index = 0)
		  c.setExplode(0)
		  
		  // output the chart
		  finish c,"circlelabelpieTop"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub concentric()
		  // Data for outer ring
		  dim data(-1) as double=array(88.0, 124, 96)
		  
		  // Data for inner ring
		  dim data2(-1) as double=array(77.0, 87, 45)
		  
		  // Labels for the sectors
		  dim labels(-1) as string =array("Hardware", "Software", "Services")
		  
		  // Colors for the sectors
		  dim color1 as integer=&hff9999
		  dim color2 as integer=&h9999ff
		  dim color3 as integer=&h66ff66
		  
		  dim colors(-1) as integer= array(color1, color2, color3)
		  
		  //
		  // Create the main chart, which contains the chart title, the outer ring, and the
		  // legend box
		  //
		  
		  // Create a PieChart object of size 450 x 360 pixels, with transparent background
		  dim c as new CDPieChartMBS(450, 360)
		  
		  // Add a title to the chart with 18pts Times Bold Italic font
		  call c.addTitle("Concentric Donut Chart", "timesbi.ttf", 18)
		  
		  // Set donut center at (160, 200), and outer/inner radii as 150/100 pixels
		  c.setDonutSize(160, 200, 150, 100)
		  
		  // Add a label at the bottom-right corner of the ring to label the outer ring Use
		  // 12pts Arial Bold Italic font in white (ffffff) color, on a green (008800)
		  // background, with soft lighting effect and 5 pixels rounded corners
		  dim t as CDTextBoxMBS
		  t = c.addText(260, 300, " Year 2006 ", "arialbi.ttf", 12, &hffffff)
		  t.setBackground(&h008800, c.kTransparent, C.softLighting())
		  t.setRoundedCorners(5)
		  
		  // Set the legend box at (320, 50) with 12 pts Arial Bold Italic font, with no
		  // border
		  t=c.addLegend(320, 50, true, "arialbi.ttf", 13)
		  t.setBackground(c.kTransparent,c.kTransparent)
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Set the pie colors
		  c.setColors(c.kDataColor, colors)
		  
		  // Set pie border color to white (ffffff)
		  c.setLineColor(&hffffff)
		  
		  // Set pie label to value in $###M format, percentage in (##.#%) format, in two
		  // lines.
		  c.setLabelFormat("${value}M<*br*>({percent|1}%)")
		  
		  // Use 10pts Airal Bold for the sector labels
		  call c.setLabelStyle("arialbd.ttf", 10)
		  
		  // Set the label position to -25 pixels from the sector (which would be internal
		  // to the sector)
		  c.setLabelPos(-25)
		  
		  //
		  // Create the inner ring.
		  //
		  
		  // Create a PieChart object of size 280 x 320 pixels, with transparent background
		  dim c2 as new CDPieChartMBS(280, 320, c.kTransparent)
		  
		  // Set donut center at (110, 110), and outer/inner radii as 100/50 pixels
		  c2.setDonutSize(110, 110, 100, 50)
		  
		  // Add a label at the center of the ring to label the inner ring. Use 12pts Arial
		  // Bold Italic font in white (ffffff) color, on a deep blue (0000cc) background,
		  // with soft lighting effect and 5 pixels rounded corners
		  t=c2.addText(110, 110, " Year 2005 ", "arialbi.ttf", 12, &hffffff, c.kCenter)
		  t.setBackground(&h0000cc, c.kTransparent, c.softLighting())
		  t.setRoundedCorners(5)
		  
		  // Set the pie data and the pie labels
		  c2.setData(data2,labels)
		  
		  // Set the pie colors
		  c2.setColors(c.kDataColor, colors)
		  
		  // Set pie border color to white (ffffff)
		  c2.setLineColor(&hffffff)
		  
		  // Set pie label to value in $###M format, percentage in (##.#%) format, in two
		  // lines.
		  c2.setLabelFormat("${value}M<*br*>({percent|1}%)")
		  
		  // Use 10pts Airal Bold for the sector labels
		  call c2.setLabelStyle("arialbd.ttf", 10)
		  
		  // Set the label position to -25 pixels from the sector (which would be internal
		  // to the sector)
		  c2.setLabelPos(-25)
		  
		  // merge the inner ring into the outer ring at (50, 90)
		  c.makeChart.merge(c2.makeChart, 50, 90, c.kTopLeft, 0)
		  
		  // output the chart
		  finish c,"concentric"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub donut()
		  // The data for the pie chart
		  dim data(-1) as double=array(20.0, 10, 15, 12)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Labor", "Licenses", "Facilities", "Production")
		  
		  // Create a PieChart object of size 560 x 280 pixels, with a silver background,
		  // black border, 1 pxiel 3D border effect and rounded corners
		  dim c as new CDPieChartMBS(560, 280, CDPieChartMBS.silverColor, &H000000, 1)
		  c.setRoundedFrame
		  
		  // Add a title box using 15 pts Times Bold Italic font in white color, on a deep
		  // blue (0000CC) background with reduced-glare glass effect
		  dim t as CDTextBoxMBS
		  t=c.addTitle("Donut Chart Demonstration", "timesbi.ttf", 15, &hffffff)
		  t.setBackground(&h0000cc, &h000000, c.glassEffect(c.kReducedGlare))
		  
		  // Set donut center at (280, 140), and outer/inner radii as 110/55 pixels
		  c.setDonutSize(280, 140, 110, 55)
		  
		  // Set 3D effect with 3D depth of 20 pixels
		  c.set3D(20)
		  
		  // Set the label box background color the same as the sector color, with
		  // reduced-glare glass effect and rounded corners
		  t=c.setLabelStyle
		  t.setBackground(c.kSameAsMainColor, c.kTransparent, c.glassEffect(c.kReducedGlare))
		  t.setRoundedCorners
		  
		  // Set the sector label format. The label consists of two lines. The first line
		  // is the sector name in Times Bold Italic font and is underlined. The second
		  // line shows the data value and percentage.
		  c.setLabelFormat("<*block,halign=left*><*font=timesbi.ttf,size=12,underline=1*>{label}<*/font*><*br*>US$ {value}K ({percent}%)")
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Use the side label layout method
		  c.setLabelLayout(c.kSideLayout)
		  
		  // output the chart
		  finish c,"donut"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub finish(c as cdbasechartMBS, name as string)
		  call pdf.Append
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.SetFont "Times",0,16,true,pdf.kcp1252
		  call pdf.SetTextRect 0,20,pdf.GetPageWidth,50
		  call pdf.WriteFText pdf.ktaCenter,name
		  
		  // no recompression
		  call pdf.SetSaveNewImageFormat false
		  
		  dim p as Picture
		  dim s as string
		  
		  // get PNG
		  s=c.makeChart(c.kPNG)
		  p=PNGStringToPictureMBS(s,0) // just to get the picture to have the size again for scaling
		  
		  dim x,y,w,h as Double
		  dim dw,dh as integer
		  dim f as Double
		  
		  dw=pdf.GetPageWidth-100
		  dh=pdf.GetPageHeight-100
		  
		  // scale to fit page
		  f=min(dh/p.height,dw/p.Width)
		  
		  w=p.width*f
		  h=p.Height*f
		  x=50+(dw-w)/2
		  y=50+(dh-h)/2
		  
		  // add picture
		  call pdf.InsertImageFromBuffer(x,y,w,h,s,1)
		  
		  call pdf.endpage
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub fontpie()
		  // The data for the pie chart
		  dim data(-1) as Double=array(25.0, 18, 15, 12, 8, 30, 35)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production")
		  
		  // Create a PieChart object of size 480 x 300 pixels
		  dim c as new CDPieChartMBS(480, 300)
		  
		  // Use a blue marble pattern as the background wallpaper, with a black border,
		  // and 1 pixel 3D border effect
		  c.setBackground(c.patternColor(FindFile("marble.png")), &h000000, 1)
		  
		  // Set the center of the pie at (150, 150) and the radius to 100 pixels
		  c.setPieSize(150, 150, 100)
		  
		  // Add a title to the pie chart using Times Bold Italic/15 points/deep blue
		  // (0x000080) as font, with a wood pattern as the title background
		  dim t as CDTextBoxMBS
		  t=c.addTitle("Project Cost Breakdown", "timesbi.ttf", 15, &h000080)
		  t.setBackground(c.patternColor(FindFile("wood.png")))
		  
		  // Draw the pie in 3D
		  c.set3D
		  
		  // Add a legend box using Arial Bold Italic/11 points font. Use a pink marble
		  // pattern as the background wallpaper, with a 1 pixel 3D border. The legend box
		  // is top-right aligned relative to the point (465, 70)
		  dim b as CDLegendBoxMBS
		  
		  b = c.addLegend(465, 70, true, "arialbi.ttf", 11)
		  b.setBackground(c.patternColor(FindFile("marble2.png")), c.kTransparent, 1)
		  b.setAlignment(c.kTopRight)
		  
		  // Set the default font for all sector labels to Arial Bold/8 pts/dark green
		  // (0x008000).
		  t=c.setLabelStyle("arialbd.ttf", 8, &h008000)
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  // Explode the 3rd sector
		  c.setExplode(2, 40)
		  
		  // Use Arial Bold/12 pts/red as label font for the 3rd sector
		  dim s as CDSectorMBS
		  s=c.sector(2)
		  t=s.setLabelStyle("arialbd.ttf", 12, &hff0000)
		  
		  // Use Arial/8 pts/deep blue as label font for the 5th sector. Add a background
		  // box using the sector fill color (SameAsMainColor), with a black (0x000000)
		  // edge and 2 pixel 3D border.
		  s=c.sector(4)
		  t=s.setLabelStyle("arial.ttf", 8, &h000080)
		  t.setBackground(c.kSameAsMainColor, &h000000, 2)
		  
		  // Use Arial Italic/8 pts/light red (0xff9999) as label font for the 6th sector.
		  // Add a dark blue (0x000080) background box with a 2 pixel 3D border.
		  s=c.sector(0)
		  t=s.setLabelStyle("ariali.ttf", 8, &hff9999)
		  t.setBackground(&h000080, c.kTransparent, 2)
		  
		  // Use Times Bold Italic/8 pts/deep green (0x008000) as label font for 7th
		  // sector. Add a yellow (0xFFFF00) background box with a black (0x000000) edge.
		  s=c.sector(6)
		  t=s.setLabelStyle("timesbi.ttf", 8, &h008000)
		  t.setBackground(&hffff00,&h000000)
		  
		  // output the chart
		  finish c,"fontpie"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub icondonut()
		  // The data for the pie chart
		  dim data(-1) as double=array(72, 18, 15, 12.0)
		  
		  // The depths for the sectors
		  dim depths(-1) as double = array(30, 20, 10, 10.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array("Sunny", "Cloudy", "Rainy", "Snowy")
		  
		  // The icons for the sectors
		  dim icons(-1) as FolderItem
		  
		  icons.Append FindFile("sun.png")
		  icons.Append FindFile("cloud.png")
		  icons.Append FindFile("rain.png")
		  icons.Append FindFile("snowy.png")
		  
		  // Create a PieChart object of size 400 x 300 pixels
		  dim c as new CDPieChartMBS(400, 300)
		  
		  // Use the semi-transparent palette for this chart
		  c.settransparentcolors
		  
		  // Set the background to metallic light blue (CCFFFF), with a black border and 1
		  // pixel 3D border effect,
		  c.setBackground(c.metalColor(&hccccff), &h000000, 1)
		  
		  // Set donut center at (200, 175), and outer/inner radii as 100/50 pixels
		  c.setDonutSize(200, 175, 100, 50)
		  
		  // Add a title box using 15 pts Times Bold Italic font and metallic blue (8888FF)
		  // background color
		  dim t as CDTextBoxMBS
		  t=c.addTitle("Weather Profile in Wonderland", "timesbi.ttf", 15)
		  t.setBackground(c.metalColor(&h8888ff))
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  // Add icons to the chart as a custom field
		  c.addExtraField(icons)
		  
		  // Configure the sector labels using CDML to include the icon images
		  c.setLabelFormat("<*block,valign=absmiddle*><*img={field0}*> <*block*>{label}"+EndOfLine.UNIX+"{percent}%<*/*><*/*>")
		  
		  // Draw the pie in 3D with variable 3D depths
		  c.set3D(depths)
		  
		  // Set the start angle to 225 degrees may improve layout when the depths of the
		  // sector are sorted in descending order, because it ensures the tallest sector
		  // is at the back.
		  c.setStartAngle(225)
		  
		  // output the chart
		  finish c,"icondonut"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub iconpie()
		  // The data for the pie chart
		  dim data(-1) as double = array( 72.0, 18, 15, 12)
		  
		  // The depths for the sectors
		  dim depths(-1) as double = array(30.0, 20, 10, 10)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Sunny", "Cloudy", "Rainy", "Snowy")
		  
		  // The icons for the sectors
		  dim icons(-1) as FolderItem
		  
		  icons.append FindFile("sun.png")
		  icons.append FindFile("cloud.png")
		  icons.append FindFile("rain.png")
		  icons.append FindFile("snowy.png")
		  
		  // Create a PieChart object of size 400 x 310 pixels, with a blue (CCCCFF)
		  // vertical metal gradient background, black border, 1 pixel 3D border effect and
		  // rounded corners
		  dim c as new CDPieChartMBS(400, 310, CDPieChartMBS.metalColor(&hccccff, 0), &h000000, 1)
		  
		  c.setRoundedFrame
		  
		  // Set the center of the pie at (200, 180) and the radius to 100 pixels
		  c.setPieSize(200, 180, 100)
		  
		  // Add a title box using 15 pts Times Bold Italic font, on a blue (CCCCFF)
		  // background with glass effect
		  dim t as CDTextBoxMBS
		  t=c.addTitle("Weather Profile in Wonderland", "timesbi.ttf", 15)
		  t.setBackground(&hccccff, &h000000, c.glassEffect)
		  
		  // Set the pie data and the pie labels
		  c.setData data,labels
		  
		  // Add icons to the chart as a custom field
		  c.addExtraField(icons)
		  
		  // Configure the sector labels using CDML to include the icon images
		  c.setLabelFormat("<*block,valign=absmiddle*><*img={field0}*> <*block*>{label}"+EndOfLine.UNIX+"{percent}%<*/*><*/*>")
		  
		  // Draw the pie in 3D with variable 3D depths
		  c.set3D depths
		  
		  // Set the start angle to 225 degrees may improve layout when the depths of the
		  // sector are sorted in descending order, because it ensures the tallest sector
		  // is at the back.
		  c.setStartAngle(225)
		  
		  // output the chart
		  finish c,"iconpie"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub iconpie2()
		  // The data for the pie chart
		  dim data(-1) as double = array (28.0, 45, 5, 1, 12)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array( "Excellent", "Good", "Bad", "Very Bad", "Neutral")
		  
		  // The icons for the sectors
		  dim icons(-1) as FolderItem
		  
		  icons.append FindFile("laugh.png")
		  icons.append FindFile("smile.png")
		  icons.append FindFile("sad.png")
		  icons.append FindFile("angry.png")
		  icons.append FindFile("nocomment.png")
		  
		  // Create a PieChart object of size 560 x 300 pixels, with a silver background,
		  // black border, 1 pxiel 3D border effect and rounded corners
		  dim c as new CDPieChartMBS(560, 300, CDPieChartMBS.silverColor, &h000000, 1)
		  
		  c.setRoundedFrame
		  
		  // Set the center of the pie at (280, 150) and the radius to 120 pixels
		  c.setPieSize(280, 150, 120)
		  
		  // Add a title box with title written in CDML, on a sky blue (A0C8FF) background
		  // with glass effect
		  dim t as CDTextBoxMBS
		  t=c.addTitle("<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("doc.png"))+"*> Customer Survey: <*font=timesi.ttf,color=000000*>Do you like our <*font,color=dd0000*>Hyper<*super*>TM<*/font*> molecules?", "timesbi.ttf", 15, &h000080)
		  t.setBackground(&ha0c8ff, &h000000, c.glassEffect)
		  
		  // Add a logo to the chart written in CDML as the bottom title aligned to the
		  // bottom right
		  call c.addTitle(c.kBottomRight,"<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("molecule.png"))+"*> <*block*><*color=FF*><*font=timesbi.ttf,size=12*>Molecular Engineering"+EndOfLine.UNIX+"<*font=arial.ttf,size=10*>Creating better molecules")
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Set 3D style
		  c.set3D
		  
		  // Use the side label layout method
		  c.setLabelLayout(c.kSideLayout)
		  
		  // Set the label background color to transparent
		  t=c.setLabelStyle
		  t.setBackground(c.kTransparent)
		  
		  // Add icons to the chart as a custom field
		  c.addExtraField(icons)
		  
		  // Configure the sector labels using CDML to include the icon images
		  c.setLabelFormat("<*block,valign=absmiddle*><*img={field0}*> {label} ({percent|0}%)")
		  
		  // Explode the 3rd and 4th sectors as a group (index = 2 and 3)
		  c.setExplodeGroup(2, 3)
		  
		  // Set the start angle to 135 degrees may improve layout when there are many
		  // small sectors at the end of the data array (that is, data sorted in descending
		  // order). It is because this makes the small sectors position near the
		  // horizontal axis, where the text label has the least tendency to overlap. For
		  // data sorted in ascending order, a start angle of 45 degrees can be used
		  // instead.
		  c.setStartAngle(135)
		  
		  // output the chart
		  finish c,"iconpie2"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub legendpie()
		  // The data for the pie chart
		  dim data(-1) as double = array( 25.0, 18, 15, 12, 8, 30, 35)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string =array("Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production")
		  
		  // Create a PieChart object of size 450 x 240 pixels
		  dim c as new cdPieChartMBS(450, 240)
		  
		  // Set the center of the pie at (150, 100) and the radius to 80 pixels
		  c.setPieSize(150, 100, 80)
		  
		  // Add a title at the bottom of the chart using Arial Bold Italic font
		  call c.addTitle(c.kBottom, "Project Cost Breakdown", "arialbi.ttf")
		  
		  // Draw the pie in 3D
		  c.set3D
		  
		  // add a legend box where the top left corner is at (330, 40)
		  call c.addLegend(330, 40)
		  
		  // modify the label format for the sectors to $nnnK (pp.pp%)
		  c.setLabelFormat("{label} ${value}K"+EndOfLine.UNIX+"({percent}%)")
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Explode the 1st sector (index = 0)
		  c.setExplode(0)
		  
		  // output the chart
		  finish c,"legendpie"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub multidepthpie()
		  // The data for the pie chart
		  dim data(-1) as double = array(72.0, 18, 15, 12)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array("Labor", "Machinery", "Facilities", "Computers")
		  
		  // The depths for the sectors
		  dim depths(-1) as double= array(30.0, 20, 10, 10)
		  
		  // Create a PieChart object of size 360 x 300 pixels, with a light blue (DDDDFF)
		  // background and a 1 pixel 3D border
		  
		  dim c as new CDPieChartMBS(360, 300, &hddddff, -1, 1)
		  
		  // Set the center of the pie at (180, 175) and the radius to 100 pixels
		  c.setPieSize(180, 175, 100)
		  
		  // Add a title box using 15 pts Times Bold Italic font and blue (AAAAFF) as
		  // background color
		  dim t as CDTextBoxMBS
		  
		  t=c.addTitle("Project Cost Breakdown", "timesbi.ttf", 15)
		  t.setBackground(&haaaaff)
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Draw the pie in 3D with variable 3D depths
		  c.set3D(depths)
		  
		  // Set the start angle to 225 degrees may improve layout when the depths of the
		  // sector are sorted in descending order, because it ensures the tallest sector
		  // is at the back.
		  c.setStartAngle(225)
		  
		  // output the chart
		  finish c,"multidepthpie"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub sidelabelpie()
		  // The data for the pie chart
		  dim data(-1) as double = array(25, 18, 15, 12, 8, 30, 35.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array("Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production")
		  
		  // Create a PieChart object of size 500 x 230 pixels
		  dim c as new CDPieChartMBS(500, 230)
		  
		  // Set the center of the pie at (250, 120) and the radius to 100 pixels
		  c.setPieSize(250, 120, 100)
		  
		  // Add a title box using 15 points Times Bold Italic as font
		  call c.addTitle("Project Cost Breakdown", "timesbi.ttf", 15)
		  
		  // Draw the pie in 3D
		  c.set3D
		  
		  // Use the side label layout method
		  c.setLabelLayout(c.kSideLayout)
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // output the chart
		  finish c,"sidelabelpie"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub simplePie()
		  dim c as CDPieChartMBS
		  
		  // The data for the pie chart
		  dim data(-1) as double=array(55.0, 18.0, 15.0, 12.0, 8.0, 30.0, 35.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Xojo", "C++", "Pascal", "Cobol", "C#", "Java", "Visual Basic")
		  
		  // Create a PieChart object of size 360 x 300 pixels
		  c = new CDPieChartMBS(360, 300)
		  
		  // Set the center of the pie at (180, 140) and the radius to 100 pixels
		  c.setPieSize 180,140,100
		  
		  // Set the pie data and the pie labels
		  c.setData data,labels
		  
		  // output the chart
		  finish c,"simplepie"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub simplePieHighRes()
		  dim c as CDPieChartMBS
		  
		  const factor=5 // for screen 1
		  
		  // The data for the pie chart
		  dim data(-1) as double=array(55.0, 18.0, 15.0, 12.0, 8.0, 30.0, 35.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Xojo", "C++", "Pascal", "Cobol", "C#", "Java", "Visual Basic")
		  
		  // Create a PieChart object of size 360 x 300 pixels
		  c = new CDPieChartMBS(360*factor, 300*factor)
		  
		  // Set the center of the pie at (180, 140) and the radius to 100 pixels
		  c.setPieSize 180*factor,140*factor,100*factor
		  
		  // Set the pie data and the pie labels
		  c.setData data,labels
		  call c.setLabelStyle "",8*factor
		  
		  // output the chart
		  finish c,"simplepie high resolution"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub smallsectorpie()
		  // The data for the pie chart
		  dim data(-1) as double = array(35.0, 30, 25, 7, 6, 5, 4, 3, 2, 1)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string= array("Labor", "Production", "Facilities", "Taxes", "Misc", "Legal", "Insurance", "Licenses", "Transport", "Interest")
		  
		  // Create a PieChart object of size 560 x 270 pixels, with a golden background
		  // and a 1 pixel 3D border
		  dim c as new CDPieChartMBS(560, 270, CDPieChartMBS.goldColor, -1, 1)
		  
		  // Add a title box using 15 pts Times Bold Italic font and metallic pink
		  // background color
		  dim t as CDTextBoxMBS
		  
		  t=c.addTitle("Project Cost Breakdown", "timesbi.ttf", 15)
		  t.setBackground(c.metalColor(&hff9999))
		  
		  // Set the center of the pie at (280, 135) and the radius to 110 pixels
		  c.setPieSize(280, 135, 110)
		  
		  // Draw the pie in 3D with 20 pixels 3D depth
		  c.set3D(20)
		  
		  // Use the side label layout method
		  c.setLabelLayout(c.kSideLayout)
		  
		  // Set the label box background color the same as the sector color, with glass
		  // effect, and with 5 pixels rounded corners
		  t = c.setLabelStyle
		  t.setBackground(c.kSameAsMainColor, c.kTransparent, c.glassEffect())
		  t.setRoundedCorners(5)
		  
		  // Set the border color of the sector the same color as the fill color. Set the
		  // line color of the join line to black (0x0)
		  c.setLineColor(c.kSameAsMainColor, &h000000)
		  
		  // Set the start angle to 135 degrees may improve layout when there are many
		  // small sectors at the end of the data array (that is, data sorted in descending
		  // order). It is because this makes the small sectors position near the
		  // horizontal axis, where the text label has the least tendency to overlap. For
		  // data sorted in ascending order, a start angle of 45 degrees can be used
		  // instead.
		  c.setStartAngle(135)
		  
		  // Set the pie data and the pie labels
		  c.setdata(data,labels)
		  
		  // output the chart
		  finish c,"smallsectorpie"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub texturedonut()
		  // The data for the pie chart
		  dim data(-1) as Double=array(18.0,45,28)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Marble", "Wood", "Granite")
		  
		  // The icons for the sectors
		  dim texture(-1) as FolderItem
		  
		  texture.append FindFile("marble3.png")
		  texture.append FindFile("wood.png")
		  texture.append FindFile("rock.png")
		  
		  // Create a PieChart object of size 400 x 330 pixels, with a metallic green
		  // (88EE88) background, black border and 1 pixel 3D border effect
		  dim c as new CDPieChartMBS(400, 330, CDPieChartMBS.metalColor(&h88ee88), &h000000, 1)
		  
		  // Set donut center at (200, 160), and outer/inner radii as 120/60 pixels
		  c.setDonutSize(200, 160, 120, 60)
		  
		  // Add a title box using 15 pts Times Bold Italic font and metallic deep green
		  // (008000) background color
		  dim t as CDTextBoxMBS
		  
		  t=c.addTitle("Material Composition", "timesbi.ttf", 15)
		  
		  t.setBackground(c.metalColor(&h008000))
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Set the colors of the sectors to the 3 texture patterns
		  c.setColor(c.kDataColor + 0, c.patternColor(texture(0)))
		  c.setColor(c.kDataColor + 1, c.patternColor(texture(1)))
		  c.setColor(c.kDataColor + 2, c.patternColor(texture(2)))
		  
		  // Draw the pie in 3D with a 3D depth of 30 pixels
		  c.set3D(30)
		  
		  // Use 12 pts Arial Bold Italic as the sector label font
		  call c.setLabelStyle("arialbi.ttf", 12)
		  
		  // output the chart
		  finish c,"texturedonut"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub texturedonutHighRes()
		  const factor=5
		  
		  // The data for the pie chart
		  dim data(-1) as Double=array(18.0,45,28)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Marble", "Wood", "Granite")
		  
		  // The icons for the sectors
		  dim texture(-1) as FolderItem
		  
		  texture.append FindFile("marble3.png")
		  texture.append FindFile("wood.png")
		  texture.append FindFile("rock.png")
		  
		  // Create a PieChart object of size 400 x 330 pixels, with a metallic green
		  // (88EE88) background, black border and 1 pixel 3D border effect
		  dim c as new CDPieChartMBS(400*factor, 330*factor, CDPieChartMBS.metalColor(&h88ee88), &h000000, 1*factor)
		  
		  // Set donut center at (200, 160), and outer/inner radii as 120/60 pixels
		  c.setDonutSize(200*factor, 160*factor, 120*factor, 60*factor)
		  
		  // Add a title box using 15 pts Times Bold Italic font and metallic deep green
		  // (008000) background color
		  dim t as CDTextBoxMBS
		  
		  t=c.addTitle("Material Composition", "timesbi.ttf", 15*factor)
		  
		  t.setBackground(c.metalColor(&h008000))
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Set the colors of the sectors to the 3 texture patterns
		  c.setColor(c.kDataColor + 0, c.patternColor(texture(0)))
		  c.setColor(c.kDataColor + 1, c.patternColor(texture(1)))
		  c.setColor(c.kDataColor + 2, c.patternColor(texture(2)))
		  
		  // Draw the pie in 3D with a 3D depth of 30 pixels
		  c.set3D(30*factor)
		  
		  // Use 12 pts Arial Bold Italic as the sector label font
		  call c.setLabelStyle("arialbi.ttf", 12*factor)
		  
		  // output the chart
		  finish c,"texturedonut high resolution"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub threedpie()
		  // The data for the pie chart
		  dim data(-1) as double = array(25, 18, 15, 12, 8, 30, 35.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = Array("Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production")
		  
		  // Create a PieChart object of size 360 x 300 pixels
		  dim c as new CDPieChartMBS(360,300)
		  
		  // Set the center of the pie at (180, 140) and the radius to 100 pixels
		  c.setPieSize(180, 140, 100)
		  
		  // Add a title to the pie chart
		  call c.addTitle("Project Cost Breakdown")
		  
		  // Draw the pie in 3D
		  c.set3D
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Explode the 1st sector (index = 0)
		  c.setExplode(0)
		  
		  // output the chart
		  finish c,"threedpie"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub threedpieHighRes()
		  const factor = 5
		  
		  // The data for the pie chart
		  dim data(-1) as double = array(25, 18, 15, 12, 8, 30, 35.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = Array("Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production")
		  
		  // Create a PieChart object of size 360 x 300 pixels
		  dim c as new CDPieChartMBS(360*factor,300*factor)
		  
		  // Set the center of the pie at (180, 140) and the radius to 100 pixels
		  c.setPieSize(180*factor, 140*factor, 100*factor)
		  
		  // Add a title to the pie chart
		  call c.addTitle("Project Cost Breakdown","",12*factor)
		  
		  // Draw the pie in 3D
		  c.set3D
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  call c.setLabelStyle "",8*factor
		  
		  // Explode the 1st sector (index = 0)
		  c.setExplode(0)
		  
		  // output the chart
		  finish c,"threedpie high resolution"
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected pdf As myDynaPDFMBS
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
