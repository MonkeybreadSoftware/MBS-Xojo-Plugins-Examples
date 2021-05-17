#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyFilesStep
					AppliesTo = 0
					Architecture = 0
					Destination = 0
					Subdirectory = Nikon Test Libs
				End
			End
#tag EndBuildAutomation
