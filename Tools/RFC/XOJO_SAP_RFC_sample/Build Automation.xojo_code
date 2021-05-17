#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySAPLibraryMac
					AppliesTo = 0
					Architecture = 0
					Destination = 0
					Subdirectory = 
					FolderItem = Li4vU0FQTGlicmFyeS9saWJpY3VkYXRhLjUwLmR5bGli
					FolderItem = Li4vU0FQTGlicmFyeS9saWJpY3VkZWNudW1iZXIuZHlsaWI=
					FolderItem = Li4vU0FQTGlicmFyeS9saWJpY3VpMThuLjUwLmR5bGli
					FolderItem = Li4vU0FQTGlicmFyeS9saWJpY3V1Yy41MC5keWxpYg==
					FolderItem = Li4vU0FQTGlicmFyeS9saWJzYXBud3JmYy5keWxpYg==
					FolderItem = Li4vU0FQTGlicmFyeS9saWJzYXB1Y3VtLmR5bGli
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopySAPLibraryWin
					AppliesTo = 0
					Architecture = 0
					Destination = 0
					Subdirectory = 
					FolderItem = Li4vU0FQTGlicmFyeS9pY3VkdDUwLmRsbA==
					FolderItem = Li4vU0FQTGlicmFyeS9pY3VpbjUwLmRsbA==
					FolderItem = Li4vU0FQTGlicmFyeS9pY3V1YzUwLmRsbA==
					FolderItem = Li4vU0FQTGlicmFyeS9saWJpY3VkZWNudW1iZXIuZGxs
					FolderItem = Li4vU0FQTGlicmFyeS9saWJzYXB1Y3VtLmRsbA==
					FolderItem = Li4vU0FQTGlicmFyeS9zYXBud3JmYy5kbGw=
				End
			End
#tag EndBuildAutomation
