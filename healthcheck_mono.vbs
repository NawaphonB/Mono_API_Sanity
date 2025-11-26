' Run healthcheck_mono.bat without showing terminal window
Set objShell = CreateObject("WScript.Shell")
objShell.Run "cmd.exe /c ""C:\Users\UsEr\Documents\GitHub\Mono_API_Sanity\healthcheck_mono.bat""", 0, True
