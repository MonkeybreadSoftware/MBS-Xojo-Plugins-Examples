#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  '"""
		  'This script reads the temperature Of a type K thermocouple
		  'connected To a MAX6675 SPI chip.
		  '
		  'Type K thermocouples are made Of chromel (+ve) And alumel (-ve)
		  'And are the commonest general purpose thermocouple With a
		  'sensitivity Of approximately 41 uV/C.
		  '
		  'The MAX6675 returns a 12-bit reading In the range 0 - 4095 With
		  'the units As 0.25 degrees centigrade.  So the reported
		  'temperature range Is 0 - 1023.75 C.
		  '
		  'Accuracy Is about +/- 2 C between 0 - 700 C And +/- 5 C
		  'between 700 - 1000 C.
		  '
		  'The MAX6675 returns 16 bits As follows
		  '
		  'F   E   D   C   B   A   9   8   7   6   5   4   3   2   1   0
		  '0  B11 B10  B9  B8  B7  B6  B5  B4  B3  B2  B1  B0  0   0   X
		  '
		  'The reading Is In B11 (most significant bit) To B0.
		  '
		  'The conversion time Is 0.22 seconds.  If you Try To read more
		  'often the sensor will always Return the last read value.
		  '"""
		  '
		  'pi = pigpio.pi
		  
		  
		  
		  'Dim f As FolderItem = FindFile("libwiringPi.so.2.25")
		  
		  If WiringPiMBS.LoadLibrary("libwiringPi.so") Then
		    Print "Library loaded"
		  Else
		    Print "Failed to load library: "+WiringPiMBS.LoadError
		    Return 1
		  End If
		  
		  Print "micros: "+Str(WiringPiMBS.micros)
		  Print "millis: "+Str(WiringPiMBS.millis)
		  
		  Print "BoardRev: "+Str(WiringPiMBS.piBoardRev)
		  
		  Dim model As Integer
		  Dim Rev As Integer
		  Dim Mem As Integer
		  Dim Maker As Integer
		  Dim OverVolted As Integer
		  WiringPiMBS.piBoardId(model, rev, mem, maker, OverVolted)
		  
		  Print "Model: "+Str(model)
		  Print "Rev: "+Str(Rev)
		  Print "Mem: "+Str(Mem)
		  Print "Maker: "+Str(Maker)
		  Print "OverVolted: "+Str(OverVolted)
		  
		  Print "Model name: "+WiringPiMBS.piModelNames(model)
		  Print "Rev name: "+WiringPiMBS.piRevisionNames(rev)
		  Print "Maker name: "+WiringPiMBS.piMakerNames(Maker)
		  
		  
		  
		  
		  
		  
		  
		  Dim e As Integer = WiringPiMBS.wiringPiSetupSys
		  Print "setup: "+Str(e)
		  
		  'If Not pi.connected:
		  'Exit(0)
		  '
		  '# pi.spi_open(0, 1000000, 0)   # CE0, 1Mbps, main SPI
		  '# pi.spi_open(1, 1000000, 0)   # CE1, 1Mbps, main SPI
		  '# pi.spi_open(0, 1000000, 256) # CE0, 1Mbps, auxiliary SPI
		  '# pi.spi_open(1, 1000000, 256) # CE1, 1Mbps, auxiliary SPI
		  '# pi.spi_open(2, 1000000, 256) # CE2, 1Mbps, auxiliary SPI
		  '
		  'sensor = pi.spi_open(0, 1000000, 0) # CE0 on main SPI
		  
		  Print "SPISetup..."
		  Dim sensor As Integer = WiringPiMBS.SPISetup(0, 1000000)
		  Print "Sensor: "+Str(sensor)
		  
		  If sensor < 0 Then
		    // failed
		    Return 1
		  end if
		  
		  'stop = time.time + 0 #ehemals + 600
		  
		  
		  For i As Integer = 1 To 20
		    'While time.time > stop: #ehemals < stop:
		    'c, d = pi.spi_read(sensor, 2)
		    
		    'Dim m As New MemoryBlock(2)
		    Dim n As Integer 
		    'Dim p As ptr = m
		    dim m as MemoryBlock
		    
		    m = WiringPiMBS.Read(sensor, 2)
		    'n = spiRead(sensor, p, n)
		    
		    If m <> Nil Then
		      n = m.size
		    end if
		    
		    Print "read: "+Str(n)
		    
		    Print "data: "+Hex(m.Int16Value(0))
		    
		    If n = 2 Then
		      m.LittleEndian = false
		      Dim word As UInt16 = m.UInt16Value(0)
		      'If c == 2:
		      'word = (d[0]<<8) | d[1]
		      'If (word & 0x8006) == 0: # Bits 15, 2, And 1 should be zero.
		      If BitwiseAnd(word, &h8006) = 0 Then
		        't = (((word >> 3)/4.0)-5)
		        Dim t As Double = (Bitwise.ShiftRight(word, 3) / 4.0 - 5.0)
		        
		        print str(t)+"°C"
		        'Print("{:.2f}".Format(t) + "°C - " + strftime("%d.%m.%Y %H:%M:%S"))
		        '
		      Else
		        'else:
		        'Print("bad reading {:b}".Format(word))
		        Print "Bad Reading: "+Str(word)+" "+Hex(word)
		      End If
		    End If
		    
		    app.DoEvents(1000)
		    'time.sleep(10.00) # Don't try to read more often than 4 times a second. 
		  Next
		  'pi.spi_close(sensor)
		  '
		  'pi.stop
		  'GPIO.Cleanup
		  
		  
		End Function
	#tag EndEvent


	#tag Constant, Name = pigpioLibName, Type = Text, Dynamic = False, Default = \"pigpio.so", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
