if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$DNSAddresses = @(
  ([IPAddress]'1.1.1.1').IPAddressToString
  ([IPAddress]'8.8.8.8').IPAddressToString
  ([IPAddress]'2606:4700:4700::1111').IPAddressToString
  ([IPAddress]'2001:4860:4860::8888').IPAddressToString
)

Set-DnsClientServerAddress -InterfaceAlias "SL" -ServerAddresses $DNSAddresses
