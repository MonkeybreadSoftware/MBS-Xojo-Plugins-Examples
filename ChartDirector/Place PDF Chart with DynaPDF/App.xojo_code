#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  GenerateSampleData
		  
		  // get all 4 PDFs
		  dim c1 as CDBaseChartMBS = RenderLineChart
		  dim p1 as string = c1.makeChart(c1.kPDF)
		  
		  dim c2 as CDBaseChartMBS = RenderPieChart
		  dim p2 as string = c2.makeChart(c2.kPDF)
		  
		  dim c3 as CDBaseChartMBS = RenderPolarChart
		  dim p3 as string = c3.makeChart(c3.kPDF)
		  
		  dim c4 as CDBaseChartMBS = RenderPyramidChart
		  c4.setOutputOptions("bitmap=1")
		  dim p4 as string = c4.makeChart(c4.kPDF)
		  
		  // write to desktop
		  WritePDF p1, "Test Line Chart.pdf"
		  WritePDF p2, "Test Pie Chart.pdf"
		  WritePDF p3, "Test Polar Chart.pdf"
		  WritePDF p4, "Test Pyramid Chart.pdf"
		  
		  // now merge them
		  
		  
		  // needs DynaPDF Plugin
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem=SpecialFolder.Desktop.Child("Place PDF Chart with DynaPDF.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  
		  // Import the fist page as template
		  call pdf.OpenImportBuffer(p1)
		  dim template1 as integer = pdf.ImportPage(1)
		  dim height1 as integer = pdf.GetTemplHeight(template1)
		  dim width1  as integer = pdf.GetTemplWidth(template1)
		  
		  call pdf.OpenImportBuffer(p2)
		  dim template2 as integer = pdf.ImportPage(1)
		  dim height2 as integer = pdf.GetTemplHeight(template2)
		  dim width2  as integer = pdf.GetTemplWidth(template2)
		  
		  call pdf.OpenImportBuffer(p3)
		  dim template3 as integer = pdf.ImportPage(1)
		  dim height3 as integer = pdf.GetTemplHeight(template3)
		  dim width3  as integer = pdf.GetTemplWidth(template3)
		  
		  call pdf.OpenImportBuffer(p4)
		  dim template4 as integer = pdf.ImportPage(1)
		  dim height4 as integer = pdf.GetTemplHeight(template4)
		  dim width4  as integer = pdf.GetTemplWidth(template4)
		  
		  // PlaceCentered() requires Bottom-Up coordinates.
		  call pdf.SetPageCoords(pdf.kpcBottomUp)
		  
		  // We place the template 4 times on the page...
		  call pdf.Append
		  call pdf.SetOrientationEx(90)
		  
		  
		  call pdf.PlaceTemplateEx(template1, 50+     0, 30+      0, 0, 0)
		  call pdf.PlaceTemplateEx(template3, 50+width1, 30+      0, 0, 0)
		  call pdf.PlaceTemplateEx(template2, 50+     0, 30+height1, 0, 0)
		  call pdf.PlaceTemplateEx(template4, 50+width1, 30+height1, 0, 0)
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GenerateSampleData()
		  Dim x0 As Double = 70
		  Dim x1 As Double = 50
		  Dim x2 As Double = 30
		  
		  Data0.Append(x0)
		  Data1.Append(x1)
		  Data2.Append(x2)
		  
		  // Create randomized data points for line chart demo
		  For I As Integer = 1 To 100
		    
		    x0 = x0 + Rnd() * 5.0 - 2.5
		    x1 = x1 + Rnd() * 5.0 - 2.5
		    x2 = x2 + Rnd() * 5.0 - 2.5
		    
		    Data0.Append(x0)
		    Data1.Append(x1)
		    Data2.Append(x2)
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderLineChart() As CDBaseChartMBS
		  const factor = 1
		  const width  = 600
		  const height = 375
		  
		  
		  // The data for the line chart
		  
		  // Create a XYChart object of size 600 x 375 pixels
		  dim c as new CDXYChartMBS(width*factor, height*factor)
		  
		  
		  
		  
		  'C.setBackground(C.kTransparent)
		  C.setTransparentColor(-1)
		  
		  C.setClipping(0)
		  C.setAntiAlias(True, C.kAntiAlias)
		  
		  
		  
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  call c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) and of 500 x 280 pixels in size. Use a vertical
		  // gradient color from light blue (f9f9ff) to sky blue (aaccff) as background.
		  // Set border to transparent and grid lines to white (ffffff).
		  call c.setPlotArea(50*factor, 55*factor, (width-100)*factor, (height-100)*factor, c.linearGradientColor(0, 55, 0, 335, &hf9fcff, &haaccff), -1, c.kTransparent, &hffffff)
		  call c.setClipping
		  
		  // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
		  // font, with transparent background.
		  c.addLegend(50*factor, 28*factor, false, "arialbd.ttf", 10*factor).setBackground(c.kTransparent)
		  
		  // Set the x axis labels
		  'call c.xAxis.setLabels(labels)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30*factor)
		  c.yAxis2.setTickDensity(30*factor)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8*factor)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8*factor)
		  call c.yAxis2.setLabelStyle("arialbd.ttf", 8*factor)
		  
		  // Set axis line width to 2 pixels
		  c.xAxis.setWidth(2*factor)
		  c.yAxis.setWidth(2*factor)
		  c.yAxis2.setWidth(2*factor)
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  call c.yAxis.setTitle("Revenue in US millions", "arialbi.ttf", 10*factor)
		  call c.yAxis2.setTitle("Revenue in US millions", "arialbi.ttf", 10*factor)
		  
		  // scroll
		  dim axisLowerLimit as double
		  dim axisUpperLimit as double
		  
		  axisLowerLimit = 100.0 '-100.0 *(viewport.getViewPortLeft + viewport.getViewPortWidth)
		  axisUpperLimit = 100.0 '-100.0 * viewport.getViewPortLeft
		  
		  'c.xAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.xAxis.setRounding(false, false)
		  
		  axisLowerLimit =  100.0 '-100.0 *(viewport.getViewPortTop + viewport.getViewPortHeight)
		  axisUpperLimit =  100.0 '-100.0 * viewport.getViewPortTop
		  
		  'c.yAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis.setRounding(false, false)
		  'c.yAxis2.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis2.setRounding(false, false)
		  
		  // Add a line layer to the chart
		  dim layer as CDLineLayerMBS
		  layer = c.addLineLayer
		  
		  // Set the line width to 3 pixels
		  layer.setLineWidth(3)
		  
		  // Add the three data sets to the line layer, using circles, diamands and X
		  // shapes as symbols
		  
		  // lines only
		  dim d as CDDataSetMBS
		  d=layer.addDataSet(data0, &hff0000, "Quantum Computer")
		  'd.setDataSymbol(c.kCircleSymbol, 9*factor)
		  d.setLineWidth(factor)
		  d=layer.addDataSet(data1, &h00ff00, "Atom Synthesizer")
		  'd.setDataSymbol(c.kDiamondSymbol, 11*factor)
		  d.setLineWidth(factor)
		  d=layer.addDataSet(data2, &hff6600, "Proton Cannon")
		  d.setLineWidth(factor)
		  'd.setDataSymbol(c.Cross2Shape, 11*factor)
		  
		  // first color values
		  d=layer.addDataSet(data0, &hff0000)
		  d.setDataSymbol(c.kCircleSymbol, 9*factor)
		  d.setLineWidth(0)
		  d=layer.addDataSet(data1, &h00ff00)
		  d.setDataSymbol(c.kDiamondSymbol, 11*factor)
		  d.setLineWidth(0)
		  d=layer.addDataSet(data2, &hff6600)
		  d.setLineWidth(0)
		  d.setDataSymbol(c.Cross2Shape, 11*factor)
		  
		  // second color values
		  d=layer.addDataSet(data0, &h00ff00)
		  d.setDataSymbol(c.kCircleSymbol, 9*factor)
		  d.setLineWidth(0)
		  d=layer.addDataSet(data1, &hff0000)
		  d.setDataSymbol(c.kDiamondSymbol, 11*factor)
		  d.setLineWidth(0)
		  d=layer.addDataSet(data2, &h0000ff)
		  d.setLineWidth(0)
		  d.setDataSymbol(c.Cross2Shape, 11*factor)
		  
		  Return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPieChart() As CDBaseChartMBS
		  const factor = 1
		  const width  = 600
		  const height = 375
		  
		  dim f as double = factor // scale factor, 1 for screen and 4 or more for printing
		  
		  // The data for the pie chart
		  dim data(-1) as double = array(21.0, 18, 15, 12, 8, 24)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array("Labor", "Licenses", "Taxes", "Legal", "Facilities", "Production")
		  
		  // The colors to use for the sectors
		  dim colors(-1) as integer
		  
		  colors.Append &h66aaee
		  colors.Append &heebb22
		  colors.Append &hbbbbbb
		  colors.Append &h8844ff
		  colors.Append &hdd2222
		  colors.Append &h009900
		  
		  // Create a PieChart object of size 600 x 320 pixels. Use a vertical gradient
		  // color from light blue (99ccff) to white (ffffff) spanning the top 100 pixels
		  // as background. Set border to grey (888888). Use rounded corners. Enable soft
		  // drop shadow.
		  
		  dim c as new CDPieChartMBS(f*width, f*height)
		  c.setBackground(c.linearGradientColor(0, 0, 0, 100, &h99ccff, &hffffff),&h888888)
		  c.setRoundedFrame(&hFFFFFF,10*f)
		  'c.setDropShadow
		  
		  'if HighLightSector>=0 then
		  'c.setExplode(HighLightSector)
		  'end if
		  
		  // Add a title using 18 pts Times New Roman Bold Italic font. Add 16 pixels top
		  // margin to the title.
		  c.addTitle("Pie Chart With Legend Demonstration", "timesbi.ttf", f*18).setMargin(0, 0, f*16, 0)
		  
		  // Set the center of the pie at (160, 165) and the radius to 110 pixels
		  c.setPieSize(f*width/4, f*height/2, f*110)
		  
		  // Draw the pie in 3D with a pie thickness of 25 pixels
		  c.set3D(f*25)
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  dim x as CDTextBoxMBS=c.setLabelStyle
		  #pragma Unused x
		  
		  // Set the sector colors
		  c.setColors(CDPieChartMBS.kDataColor, colors)
		  
		  // Use local gradient shading for the sectors
		  'c.setSectorStyle(CDPieChartMBS.kLocalGradientShading)
		  
		  // Use the side label layout method, with the labels positioned 16 pixels from
		  // the pie bounding box
		  c.setLabelLayout(CDPieChartMBS.kSideLayout, 16)
		  
		  // Show only the sector number as the sector label
		  c.setLabelFormat("{={sector}+1}")
		  
		  c.setJoinLine 0,f
		  
		  // Set the sector label style to Arial Bold 10pt, with a dark grey (444444)
		  // border
		  dim t as CDTextBoxMBS=c.setLabelStyle("arialbd.ttf", f*10)
		  t.setBackground(CDPieChartMBS.kTransparent, &h444444)
		  
		  
		  // Add a legend box, with the center of the left side anchored at (330, 175), and
		  // using 10 pts Arial Bold Italic font
		  dim b as CDLegendBoxMBS = c.addLegend(f*width/2, f*height/2, true, "arialbi.ttf", f*10)
		  b.setAlignment(CDPieChartMBS.kLeft)
		  
		  // Set the legend box border to dark grey (444444), and with rounded conerns
		  b.setBackground(CDPieChartMBS.kTransparent, &h444444)
		  b.setRoundedCorners(f*10)
		  
		  // Set the legend box margin to 16 pixels, and the extra line spacing between the
		  // legend entries as 5 pixels
		  b.setMargin(f*16)
		  b.setKeySpacing(0, 5*f)
		  
		  // Set the legend box icon to have no border (border color same as fill color)
		  b.setKeyBorder(CDPieChartMBS.kSameAsMainColor)
		  
		  // Set the legend text to show the sector number, followed by a 120 pixels wide
		  // block showing the sector label, and a 40 pixels wide block showing the
		  // percentage
		  b.setText("<*block,valign=top*>{={sector}+1}.<*advanceTo="+str(f*22)+"*><*block,width="+str(f*120)+"*>{label}<*/*><*block,width="+str(f*40)+",halign=right*>{percent}<*/*>%")
		  
		  // Output the chart
		  
		  return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPolarChart() As CDBaseChartMBS
		  const factor = 1
		  const width  = 375
		  const height = 375
		  
		  dim f as double = factor // scale factor, 1 for screen and 4 or more for printing
		  
		  dim data0(-1) as double = array(6, 12.5, 18.2, 15.0)
		  dim angles0(-1) as double = array(45, 96, 169, 258.0)
		  dim size0(-1) as double = array(f*41, f*105, f*12, f*20.0)
		  
		  dim data1(-1) as double = array(18, 16, 11, 14.0)
		  dim angles1(-1) as double = array(30, 210, 240, 310.0)
		  dim size1(-1) as double = array(f*30, f*45, f*12, f*90.0)
		  
		  // Create a PolarChart object of size 460 x 460 pixels
		  dim c as new CDPolarChartMBS(f*width, f*height)
		  
		  // Add a title to the chart at the top left corner using 15pts Arial Bold Italic
		  // font
		  call c.addTitle(CDPolarChartMBS.kTopLeft, "<*underline=2*>EM Field Strength", "arialbi.ttf", f*15)
		  
		  // Set center of plot area at (230, 240) with radius 180 pixels
		  c.setPlotArea(f*width/2, f*height/2, f*min(width,height)*0.35)
		  
		  // Use alternative light grey/dark grey circular background color
		  c.setPlotAreaBg(&hdddddd, &heeeeee)
		  
		  // Set the grid style to circular grid
		  c.setGridStyle(false)
		  
		  // Add a legend box at the top right corner of the chart using 9 pts Arial Bold
		  // font
		  c.addLegend(f*width-f*2, f*0, true, "arialbd.ttf", f*9).setAlignment(CDPolarChartMBS.kTopRight)
		  
		  // Set angular axis as 0 - 360, with a spoke every 30 units
		  c.angularAxis.setLinearScale(0, 360, 30)
		  
		  c.radialAxis.setLinearScale 0, 20,5
		  // Set the radial axis label format
		  c.radialAxis.setLabelFormat("{value} km")
		  
		  c.angularAxis.setLabelGap f*8
		  
		  call c.angularAxis.setLabelStyle "",8*f
		  call c.radialAxis.setLabelStyle "",8*f
		  
		  
		  // Add a blue (&h9999ff) line layer to the chart using (data0, angle0)
		  dim layer0 as CDPolarLineLayerMBS
		  layer0 = c.addLineLayer(data0, &h9999ff, "Cold Spot")
		  layer0.setAngles(angles0)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer0.setLineWidth(0)
		  
		  // Use a circular data point symbol
		  layer0.setDataSymbol(CDPolarChartMBS.kCircleSymbol, f*11)
		  
		  // Modulate the symbol size by size0 to produce a bubble chart effect
		  layer0.setSymbolScale(size0)
		  
		  // Add a red (&hff9999) line layer to the chart using (data1, angle1)
		  dim layer1 as CDPolarLineLayerMBS
		  layer1 = c.addLineLayer(data1,&hff9999, "Hot Spot")
		  layer1.setAngles(angles1)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer1.setLineWidth(0)
		  
		  // Use a circular data point symbol
		  layer1.setDataSymbol(CDPolarChartMBS.kCircleSymbol, f*11)
		  
		  // Modulate the symbol size by size1 to produce a bubble chart effect
		  layer1.setSymbolScale(size1)
		  
		  // Output the chart
		  Return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPyramidChart() As CDBaseChartMBS
		  const factor = 1
		  const width  = 375
		  const height = 375
		  
		  dim f as double = factor // scale factor, 1 for screen and 4 or more for printing
		  
		  // The data for the pyramid chart
		  dim data(-1) as double = array(156.0, 123, 211, 179)
		  
		  // The labels for the pyramid chart
		  dim labels(-1) as string = array("Funds", "Bonds", "Stocks", "Cash")
		  
		  // The semi-transparent colors for the pyramid layers
		  dim colors(-1) as integer
		  colors.Append &h60000088
		  colors.Append &h6066aaee
		  colors.Append &h60ffbb00
		  colors.Append &h60ee6622
		  
		  // Create a PyramidChart object of size 480 x 400 pixels
		  dim c as new CDPyramidChartMBS(f*width, f*height)
		  
		  // Set the cone center at (280, 180), and width x height to 150 x 300 pixels
		  c.setConeSize(f*width/2, f*height/2, f*min(height,width)*0.333, f*height*0.75)
		  
		  // Set the elevation to 15 degrees
		  c.setViewAngle(15)
		  
		  // Set the pyramid data and labels
		  c.setData(data, labels)
		  
		  // Set the layer colors to the given colors
		  c.setColors(c.kDataColor, colors)
		  
		  // Leave 1% gaps between layers
		  c.setLayerGap(0.01)
		  
		  c.setJoinLine(&h000000, f)
		  
		  // Add labels at the left side of the pyramid layers using Arial Bold font. The
		  // labels will have 3 lines showing the layer name, value and percentage.
		  call c.setLeftLabel("{label}"+EndOfLine.unix+"US ${value}K"+EndOfLine.unix+"({percent}%)", "arialbd.ttf",8*f)
		  
		  
		  Return c
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WritePDF(PDFData as string, name as string)
		  
		  if PDFData.lenb > 0 then
		    dim PDFFile as FolderItem = SpecialFolder.Desktop.Child(name)
		    dim PDFStream as BinaryStream = BinaryStream.Create(PDFFile, true)
		    if PDFStream <> nil then
		      PDFStream.Write PDFData
		      PDFStream.Close
		      
		      pdffile.Launch(true)
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Data0() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Data1() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Data2() As Double
	#tag EndProperty


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
