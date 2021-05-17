#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep EnableSmartCard , AppliesTo = 0, Architecture = 0
					Dim appName As String = CurrentBuildAppName
					appName = ReplaceAll(appName, " ", "\ ") // Escape spaces for the command line
					
					Dim appPath As String = CurrentBuildLocation + "/" + appName + ".app"
					
					Dim command As String
					command = "/usr/bin/defaults write " + appPath + "/Contents/Info ""com.apple.security.smartcard"" -bool true"
					Call DoShellCommand(command)
					
				End
				Begin IDEScriptBuildStep SetSandBoxFalse , AppliesTo = 0, Architecture = 0
					Dim appName As String = CurrentBuildAppName
					appName = ReplaceAll(appName, " ", "\ ") // Escape spaces for the command line
					
					Dim appPath As String = CurrentBuildLocation + "/" + appName + ".app"
					
					Dim command As String
					command = "/usr/bin/defaults write " + appPath + "/Contents/Info ""App Sandbox"" -bool false"
					Call DoShellCommand(command)
					
					
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
