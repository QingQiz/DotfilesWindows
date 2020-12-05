if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# Get-DnsClientServerAddress | Where-Object InterfaceAlias -eq "Sl" | Select-Object -Property InterfaceIndex -Last 1
Set-DnsClientServerAddress -InterfaceAlias "SL" -ServerAddresses {1.1.1.1, 8.8.8.8}