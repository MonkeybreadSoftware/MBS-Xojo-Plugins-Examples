#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep ModifyInfoPlistScript , AppliesTo = 0, Architecture = 0
					Dim App As String = CurrentBuildLocation + "/" + CurrentBuildAppName + ".app"
					dim path as string = ProjectShellPath
					
					path = replace(path, "Helper.xojo_binary_project", "AddToInfo.plist")
					
					dim cmd as string = "/usr/bin/defaults import " + App + "/Contents/Info "+path
					
					'print cmd
					
					Call DoShellCommand(cmd)
					
					
					
					
				End
				Begin CopyFilesBuildStep CopyLaunchPlistFile
					AppliesTo = 0
					Architecture = 0
					Destination = 4
					Subdirectory = 
					FolderItem = Li4vTGF1bmNoZC5wbGlzdA==
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
