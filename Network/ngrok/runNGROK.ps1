## ngrok config
$ngrokExec = "ngrok\path"
$ngrokConf = "ngrok\config\file\path"


## hide window
$fd = "public static extern bool ShowWindow(int handle, int state);"
Add-Type -Name win -MemberDefinition "[DllImport(""user32.dll"")] $fd" -Namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle,0)


Start-Process -FilePath $ngrokExec -ArgumentList "-config $ngrokConf start rdp" -Wait -NoNewWindow -PassThru