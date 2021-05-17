#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  //
		  dim pdf As New MyDynapdfMBS
		  dim f As FolderItem = SpecialFolder.Desktop.Child( "Create PDF with DeviceN Colorspace 3.pdf" )
		  
		  //
		  Call pdf.CreateNewPDF( f )
		  
		  // We simply try this test function here
		  Call TestDeviceNColorSpace( pdf )
		  
		  //
		  f.Launch
		  
		  //
		  Quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddOperator(byref dest As String, value As double, index As Integer)
		  // The following function creates the PostScript code to multiply the tint 
		  // values with the components of the CMYK color representation. 0 and 1 
		  // color values are optimized to more efficient code.
		  
		  //
		  if value = 0.0 then
		    dest = dest + "0 "
		  elseif value = 1.0 then
		    dest = dest + Str( index ) + " index "
		  else
		    dest = dest + Str( index ) + " index " + Str( value ) + " mul "
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateBlendFunction(byref dest As String, colorants() As double)
		  // Note that this function does not allocate memory. The String must be 
		  // long enough to hold the resulting PostScript code. The function can 
		  // be used to create the blend function for DeviceN color spaces with up 
		  // to 32 color channels. The alternate color space must be DeviceCMYK or 
		  // an ICCBased color space whose base color space is in turn DeviceCMYK. 
		  // Since the alternate color space must be DeviceCMYK, NumColorants is 
		  // always a multiple of 4!
		  
		  //
		  dim numColorants As Integer = ( colorants.Ubound + 1 )
		  dim numColors As Integer = ( numColorants / 4 )
		  dim index As Integer = ( numColors - 1 )
		  
		  //
		  dest = "{"
		  
		  // The PostScript code must be enclosed in braces 
		  for i As Integer = 0 to 3
		    for j As Integer = 0 to ( NumColorants - 1 ) step 4
		      // Create code to multiply the tint values with the color values
		      AddOperator( Dest, Colorants( i + j ), index )
		    next
		    // Add the resulting components. No range check is required...
		    for j As Integer = 0 to ( numColors - 2 )
		      dest = dest + "add "
		    next
		    index = ( index + 1 )
		  next
		  
		  // We are nearly finish. Place the tint values on top of the stack
		  dest = dest + Str( index + 1 ) + " 4 roll"
		  
		  // Remove the tint values from the stack
		  for j As Integer = 0 to ( numColors - 1 )
		    dest = dest + " pop"
		  next
		  
		  //
		  dest = dest + "}"
		  // Finish the code with a brace
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestDeviceNColorSpace(pdf As MyDynaPDFMBS)
		  //
		  dim cs As Integer
		  dim psFunc As String // Buffer that holds the PostScript code 
		  dim cls() As String = array( "SpotBlue", "SpotMagenta", "SpotOrange", "Black" )
		  dim cls_Separations() As String = array( "SpotBlue", "SpotMagenta", "SpotOrange" )
		  dim pcs() As String = array( "Cyan", "Magenta", "Yellow", "Black" )
		  
		  //
		  dim colors() As double = Array( _
		  1.00, 0.85, 0.00, 0.00, _ // Definition of the first spot color
		  0.00, 1.00, 0.00, 0.00, _ // Definition of the second spot color
		  0.00, 0.50, 1.00, 0.00, _ // Definition of the third spot color
		  0.00, 0.00, 0.00, 1.00 _ // Definition of the process color
		  )
		  
		  //
		  Call pdf.Append
		  
		  // We need to create the PostScript calculator function first because 
		  // it is a required parameter of pdfCreateDeviceNColorSpace(). 
		  CreateBlendFunction( psFunc, colors )
		  
		  // Create the DeviceN color space
		  cs = pdf.CreateDeviceNColorSpace( cls, psFunc, pdf.kesDeviceCMYK, -1 )
		  // cls: The colorants array    
		  // psfunc: Our PostScript tint transformation function 
		  // kesDeviceCMYK, // Alternate color space     
		  // -1: No handle is required for a device color space
		  
		  if ( cs < 0 ) then Return // error
		  
		  // We create also Separation color spaces for the spot colors and add 
		  // these color spaces As an attribute to the DeviceN color space: 
		  dim separations( -1 ) As Integer
		  
		  // First spot color
		  separations.Append pdf.CreateSeparationCS( cls( 0 ), pdf.kesDeviceCMYK, -1, PDF.CMYK( 255, 216, 0, 0 ) )
		  // Second spot color
		  separations.Append pdf.CreateSeparationCS( cls( 1 ), pdf.kesDeviceCMYK, -1, PDF.CMYK( 0, 255, 0, 0 ) )
		  // Third spot color
		  separations.Append pdf.CreateSeparationCS( cls( 2 ), pdf.kesDeviceCMYK, -1, PDF.CMYK( 0, 128, 255, 0 ) )
		  
		  // Add the separation color spaces to the DeviceN color space.
		  Call pdf.AddDeviceNSeparations( cs, cls_Separations, separations )
		  // cs: DeviceN color space handle    
		  // cls: Colorants array , 
		  // separations: Separation color space handles for these colorants 
		  
		  // Because the DeviceN color space uses a process color we add also 
		  // the attributes of the process color space to it. Note that all 
		  // colorant names must be defined, also if the DeviceN color space 
		  // uses only one component of the process color space. 
		  Call pdf.AddDeviceNProcessColorants( cs, pcs, pdf.kesDeviceCMYK, -1 )
		  // cs: DeviceN color space handle 
		  // cls: Array of process colorants 
		  // kesDeviceCMYK: The used process color space   
		  // -1: No handle is required for a device color space
		  
		  // The DeviceN color space is now fully created so that we can use it
		  Call pdf.SetExtColorSpace( cs )
		  
		  // Set the DeviceN color, Spot1
		  Call pdf.SetFillColorEx( 255, 0, 0, 0 ) // Set a fill color
		  // Draw a rectangle with this color
		  Call pdf.Rectangle( 100.0, 100.0, 100.0, 100.0, pdf.kfmFill )
		  
		  // Set the DeviceN color, Spot2
		  Call pdf.SetFillColorEx( 0, 255, 0, 0 ) // Set a fill color
		  // Draw a rectangle with this color
		  Call pdf.Rectangle( 200.0, 100.0, 100.0, 100.0, pdf.kfmFill )
		  
		  // Set the DeviceN color, Spot3
		  Call pdf.SetFillColorEx( 0, 0, 255, 0 ) // Set a fill color
		  // Draw a rectangle with this color
		  Call pdf.Rectangle( 300.0, 100.0, 100.0, 100.0, pdf.kfmFill )
		  
		  // Set the DeviceN color, Black
		  Call pdf.SetFillColorEx( 0, 0, 128, 255 ) // Set a fill color
		  // Draw a rectangle with this color
		  Call pdf.Rectangle( 400.0, 100.0, 100.0, 100.0, pdf.kfmFill )
		  
		  //
		  Call pdf.SetFillColorEx( 100, 100, 100, 100 ) // Set a fill color
		  Call pdf.SetFont( "Arial", pdf.kfsNormal, 8.0, True, pdf.kcp1252 )
		  Call pdf.SetTextRect( 400, 100, 100, 100 )
		  Call pdf.WriteFText( pdf.ktaCenter, "Here is 100 % black and 50 % SpotOrange" )
		  
		  //
		  Call pdf.EndPage 
		  Call pdf.CloseFile
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		In this example we want to define a DeviceN color space that contains 2 spot
		colors and the process color yellow. The alternate color space for the spot
		colors is DeviceCMYK in this example and the process colorant is defined in this
		color space too. The tint transformation function for such a color space must be
		able to compute one color from arbitrary combinations of these three colors. So,
		we need essentially a blend function expressed in PostScript syntax.
		
		The definition of a blend function is not difficult but long because the entire
		code is stack based. However, let us first keep in mind what we need to do. We
		have already three values on the stack when the function is executed. These are
		the tint values which were passed to the DeviceN color space. We need to
		multiply the tint values with the four components of the alternate color
		representations of all three channels and finally we need to combine these three
		colors so that we get the resulting output color. This sounds difficult, because
		a lot of multiplications and additions are required to produce the wished
		result, but you'll see it's easier As it looks like. The used colors in the
		DeviceN color space are defined As follows:
		
		
		Colorant name    CMYK representation
		PANTONE 345 CVC (coated) {0.38, 0.00, 0.34, 0.0} or { 97, 0, 87, 0} 
		PANTONE 293 CVC (coated)    {1.00, 0.56, 0.00, 0.0} or {255, 143,    0, 0} 
		Yellow    {0.00, 0.00, 1.00, 0.0} or { 0, 0, 255, 0}
		
		The CMYK color values of the spot colors are taken from the color picker of
		Adobe's Photoshop. Now, we have all information we need to create the PostScript
		calculator function. The multiplication of the color channels with the tint
		values must be done for all three colors included in the color space. Because
		these are repeating operations we can easily develop a function that creates the
		necessary code for us:
		
		
	#tag EndNote


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
