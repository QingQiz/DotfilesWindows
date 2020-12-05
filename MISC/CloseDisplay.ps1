$fd = "public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);"
Add-Type -MemberDefinition "[DllImport(""user32.dll"")] $fd" -Name win -Namespace native

[native.win]::SendMessage(0xffff, 0x0112, 0xF170, 2)