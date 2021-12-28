While 1
Local $iPID = Run(@ComSpec & ' /c ping -n 10 10.7.1.1 | FIND /I "TTL"',"", @SW_HIDE, 6)
	ProcessWaitClose($iPID)
	$sOutput = StdoutRead($iPID)

If StringLen($sOutput) > 0 Then
   		ConsoleWrite("Connected!" & @CRLF)
Else
		ConsoleWrite("TTL dont't found, ping failure. Resconnecting..." & @CRLF)
		ShellExecute("rasdial.exe", "IKEv2 /disconnect", "","", @SW_HIDE)
        Sleep (1000)
        ShellExecute("rasdial.exe", "IKEv2", "","", @SW_HIDE)
	 EndIf
	 Sleep(10000)
WEnd
