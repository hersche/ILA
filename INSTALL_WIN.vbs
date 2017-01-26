set objWSHShell = CreateObject("WScript.Shell")
set objFso = CreateObject("Scripting.FileSystemObject")

CurrentDirectory = objFso.GetAbsolutePathName(".")
Bits = GetObject("winmgmts:root\cimv2:Win32_Processor='cpu0'").AddressWidth

'sShortcut = objWSHShell.ExpandEnvironmentStrings(WScript.Arguments.Item(0))
'sTargetPath = objWSHShell.ExpandEnvironmentStrings(WScript.Arguments.Item(1))

set debugBatch = objFso.CreateTextFile("START_Debug.bat", True)
If Bits = 32 Then
	debugBatch.WriteLine("java -Xmx640m -Djava.library.path=""" & CurrentDirectory & "\SpeechData\Pocketsphinx\Win32"" -jar ILA_Beta_v3.8.jar")
	libFile = CurrentDirectory & "\SpeechData\Pocketsphinx\Win32\msvcr120.dll"
	objFso.CopyFile libFile, (CurrentDirectory & "\"), True
Else
    debugBatch.WriteLine("java -Xmx640m -Djava.library.path=""" & CurrentDirectory & "\SpeechData\Pocketsphinx\Win64"" -jar ILA_Beta_v3.8.jar")
	libFile = CurrentDirectory & "\SpeechData\Pocketsphinx\Win64\msvcr120.dll"
	objFso.CopyFile libFile, (CurrentDirectory & "\"), True
End If
debugBatch.WriteLine("pause")
debugBatch.Close

set startScript = objFso.CreateTextFile("START.vbs", True)
startScript.WriteLine("CreateObject(""Wscript.Shell"").Run ""START_Debug.bat"", 0, False")
startScript.Close

'Manifest file for Win8/10 startscreen
set manifest = objFso.CreateTextFile("START.VisualElementsManifest.xml", True)
manifest.WriteLine("<Application xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"">")
manifest.WriteLine("<VisualElements")
	manifest.WriteLine("BackgroundColor=""#2672EC""")
	manifest.WriteLine("ShowNameOnSquare150x150Logo=""on""")
        manifest.WriteLine("ForegroundText=""light""")
        manifest.WriteLine("Square150x150Logo=""Assets\ILA_150m.png""")
        manifest.WriteLine("Square70x70Logo=""Assets\ILA_70m.png""/>")
manifest.WriteLine("</Application>")
manifest.Close

'Create Desktop Shortcut
sShortcut = "ILA.lnk"
sWorkingDirectory = objFso.GetAbsolutePathName("START.vbs")

set objSC = objWSHShell.CreateShortcut(sShortcut)
objSC.TargetPath = sWorkingDirectory
objSC.WorkingDirectory = CurrentDirectory
iconPath=CurrentDirectory & "\Assets\ILA_modern.ico"
'MsgBox "IconDir" & vbCrLf & sShortcut & vbCrLf & "WorkingDir: " & vbCrLf & sWorkingDirectory & vbCrLf & "IconPath: "& vbCrLf & iconPath, VBOKOnly, "Info"
objSC.IconLocation = iconPath
objSC.Arguments = ""
'objSC.HotKey = "ALT+CTRL+I"
objSC.Save

'Create Taskbar Shortcut
set objSC_tb = objWSHShell.CreateShortcut("ILA_taskbar.lnk")
objSC_tb.TargetPath = "cmd.exe"
objSC_tb.Arguments = "/C " & """" & sWorkingDirectory & """"
objSC_tb.WorkingDirectory = CurrentDirectory
objSC_tb.IconLocation = iconPath
objSC_tb.Save

'Copy to desktop
If objFso.FileExists(sShortcut) Then 
	objFso.CopyFile sShortcut, objWSHShell.ExpandEnvironmentStrings("%userprofile%") & "\Desktop\"
End If

'Message Box
result = MsgBox("ILA - Teachable Voice Assistant has been installed" & vbCrLf & "(basically just created a shortcut with parameters)" & vbCrLf & "have fun! I hope you enyoj ILA :-)" & vbCrLf & vbCrLf & "note:" & vbCrLf & "If you're planning to use Pocketsphinx please make" & vbCrLf & "sure you have the right libraries installed. Would" & vbCrLf & "you like to visit the homepage to get more info?", vbYesNo, "Installation")

Select Case result
Case vbYes
    objWSHShell.Run("https://sites.google.com/site/ilavoiceassistant/how-tos")
End Select