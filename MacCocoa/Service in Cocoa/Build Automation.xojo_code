#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep RunIDEScriptStep , AppliesTo = 0, Architecture = 0
					Dim App, cmd, filePath, name As String 
					
					name = CurrentBuildAppName
					
					'print name
					app = CurrentBuildLocation + "/" + name + ".app"
					'print app
					
					filePath = ProjectShellPath
					filePath = replace(filePath, "TestService.rbp", "data.plist")
					filePath = replace(filePath, "TestService.xojo_binary_project", "data.plist")
					'print filePath
					
					cmd = "/usr/bin/defaults import " + App + "/Contents/Info "+filePath
					'print cmd
					
					Call DoShellCommand(cmd)
					
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
