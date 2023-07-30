<%

Class FCKeditor
private sBasePath
private sInstanceName
private sWidth
private sHeight
private sToolbarSet
private sValue
private oConfig
Private Sub Class_Initialize()
sBasePath		= cfg_sitedir & OOOOOO0O(ChrW(94)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(94)&ChrW(117)&ChrW(52)&ChrW(60)&ChrW(54)&ChrW(53)&ChrW(58)&ChrW(69)&ChrW(64)&ChrW(67)&ChrW(94))
sWidth			= OOOOOO0O(ChrW(96)&ChrW(95)&ChrW(95)&ChrW(84))
sHeight			= "200"
sToolbarSet		= OOOOOO0O(ChrW(115)&ChrW(54)&ChrW(55)&ChrW(50)&ChrW(70)&ChrW(61)&ChrW(69))
sValue			= ""
Set oConfig = CreateObject(OOOOOO0O(ChrW(36)&ChrW(-243)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(63)&ChrW(56)&ChrW(93)&ChrW(115)&ChrW(58)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(50)&ChrW(67)&ChrW(74)))
End Sub
Public Property Let BasePath( basePathValue )
sBasePath = basePathValue
End Property
Public Property Let InstanceName( instanceNameValue )
sInstanceName = instanceNameValue
End Property
Public Property Let Width( widthValue )
sWidth = widthValue
End Property
Public Property Let Height( heightValue )
sHeight = heightValue
End Property
Public Property Let ToolbarSet( toolbarSetValue )
sToolbarSet = toolbarSetValue
End Property
Public Property Let Value( newValue )
If ( IsNull( newValue ) OR IsEmpty( newValue ) ) Then
sValue = ""
Else
sValue = newValue
End If
End Property
Public Property Let Config( configKey, configValue )
oConfig.Add configKey, configValue
End Property
Public Sub Create( instanceName )
response.write CreateHtml( instanceName )
end Sub
Public Function CreateHtml( instanceName )
dim html
If IsCompatible() Then
Dim sFile, sLink
If Request.QueryString( OOOOOO0O(ChrW(55)&ChrW(52)&ChrW(60)&ChrW(68)&ChrW(64)&ChrW(70)&ChrW(67)&ChrW(52)&ChrW(54)) ) = OOOOOO0O(ChrW(69)&ChrW(67)&ChrW(70)&ChrW(54)) Then
sFile = OOOOOO0O(ChrW(55)&ChrW(52)&ChrW(60)&ChrW(54)&ChrW(53)&ChrW(58)&ChrW(69)&ChrW(64)&ChrW(67)&ChrW(93)&ChrW(64)&ChrW(67)&ChrW(58)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(50)&ChrW(61)&ChrW(93)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61))
Else
sFile = OOOOOO0O(ChrW(55)&ChrW(52)&ChrW(60)&ChrW(54)&ChrW(53)&ChrW(58)&ChrW(69)&ChrW(64)&ChrW(67)&ChrW(93)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61))
End If
sLink = sBasePath & OOOOOO0O(ChrW(54)&ChrW(53)&ChrW(58)&ChrW(69)&ChrW(64)&ChrW(67)&ChrW(94)) & sFile & OOOOOO0O(ChrW(110)&ChrW(120)&ChrW(63)&ChrW(68)&ChrW(69)&ChrW(50)&ChrW(63)&ChrW(52)&ChrW(54)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)) + instanceName
If (sToolbarSet & "") <> "" Then
sLink = sLink + OOOOOO0O(ChrW(85)&ChrW(50)&ChrW(62)&ChrW(65)&ChrW(106)&ChrW(37)&ChrW(64)&ChrW(64)&ChrW(61)&ChrW(51)&ChrW(50)&ChrW(67)&ChrW(108)) & sToolbarSet
End If
html = ""
html = html & OOOOOO0O(ChrW(107)&ChrW(58)&ChrW(63)&ChrW(65)&ChrW(70)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(81)&ChrW(57)&ChrW(58)&ChrW(53)&ChrW(53)&ChrW(54)&ChrW(63)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(108)&ChrW(81)) & instanceName & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(81)) & instanceName & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(108)&ChrW(81)) & Server.HTMLEncode( sValue ) & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(94)&ChrW(109))
html = html & OOOOOO0O(ChrW(107)&ChrW(58)&ChrW(63)&ChrW(65)&ChrW(70)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(81)&ChrW(57)&ChrW(58)&ChrW(53)&ChrW(53)&ChrW(54)&ChrW(63)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(108)&ChrW(81)) & instanceName & OOOOOO0O(ChrW(48)&ChrW(48)&ChrW(48)&ChrW(114)&ChrW(64)&ChrW(63)&ChrW(55)&ChrW(58)&ChrW(56)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(108)&ChrW(81)) & GetConfigFieldString() & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(94)&ChrW(109))
html = html & OOOOOO0O(ChrW(107)&ChrW(58)&ChrW(55)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(108)&ChrW(81)) & instanceName & OOOOOO0O(ChrW(48)&ChrW(48)&ChrW(48)&ChrW(117)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(67)&ChrW(52)&ChrW(108)&ChrW(81)) & sLink & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)&ChrW(108)&ChrW(81)) & sWidth & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(57)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)&ChrW(108)&ChrW(81)) & sHeight & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(51)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(108)&ChrW(81)&ChrW(95)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(64)&ChrW(61)&ChrW(61)&ChrW(58)&ChrW(63)&ChrW(56)&ChrW(108)&ChrW(81)&ChrW(63)&ChrW(64)&ChrW(81)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(58)&ChrW(55)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(109))
Else
Dim sWidthCSS, sHeightCSS
If InStr( sWidth, OOOOOO0O(ChrW(84)) ) > 0  Then
sWidthCSS = sWidth
Else
sWidthCSS = sWidth & OOOOOO0O(ChrW(65)&ChrW(73))
End If
If InStr( sHeight, OOOOOO0O(ChrW(84)) ) > 0  Then
sHeightCSS = sHeight
Else
sHeightCSS = sHeight & OOOOOO0O(ChrW(65)&ChrW(73))
End If
html = OOOOOO0O(ChrW(107)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(32)&ChrW(44)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(81)) & instanceName & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(67)&ChrW(64)&ChrW(72)&ChrW(68)&ChrW(108)&ChrW(81)&ChrW(99)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(61)&ChrW(68)&ChrW(108)&ChrW(81)&ChrW(99)&ChrW(95)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(69)&ChrW(74)&ChrW(61)&ChrW(54)&ChrW(108)&ChrW(81)&ChrW(72)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)&ChrW(105)&ChrW(32)&ChrW(44)) & sWidthCSS & OOOOOO0O(ChrW(106)&ChrW(32)&ChrW(44)&ChrW(57)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)&ChrW(105)&ChrW(32)&ChrW(44)) & sHeightCSS & OOOOOO0O(ChrW(81)&ChrW(109)) & Server.HTMLEncode( sValue ) & OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(109))
End If
CreateHtml = html
End Function
Private Function IsCompatible()
IsCompatible = FCKeditor_IsCompatibleBrowser()
End Function
Private Function GetConfigFieldString()
Dim sParams
Dim bFirst
bFirst = True
Dim sKey
For Each sKey in oConfig
If bFirst = False Then
sParams = sParams & OOOOOO0O(ChrW(85)&ChrW(50)&ChrW(62)&ChrW(65)&ChrW(106))
Else
bFirst = False
End If
sParams = sParams & EncodeConfig( sKey ) & OOOOOO0O(ChrW(108)) & EncodeConfig( oConfig(sKey) )
Next
GetConfigFieldString = sParams
End Function
Private Function EncodeConfig( valueToEncode )
If vartype(valueToEncode) = vbBoolean then
If valueToEncode=True Then
EncodeConfig=OOOOOO0O(ChrW(37)&ChrW(67)&ChrW(70)&ChrW(54))
Else
EncodeConfig=OOOOOO0O(ChrW(117)&ChrW(50)&ChrW(61)&ChrW(68)&ChrW(54))
End If
Else
EncodeConfig = Replace( valueToEncode, OOOOOO0O(ChrW(85)), OOOOOO0O(ChrW(84)&ChrW(97)&ChrW(101)) )
EncodeConfig = Replace( EncodeConfig , OOOOOO0O(ChrW(108)), OOOOOO0O(ChrW(84)&ChrW(98)&ChrW(115)) )
EncodeConfig = Replace( EncodeConfig , OOOOOO0O(ChrW(81)), OOOOOO0O(ChrW(84)&ChrW(97)&ChrW(97)) )
End if
End Function
End Class
Function FCKeditor_IsCompatibleBrowser()
Dim sAgent
sAgent = Request.ServerVariables(OOOOOO0O(ChrW(119)&ChrW(37)&ChrW(37)&ChrW(33)&ChrW(48)&ChrW(38)&ChrW(36)&ChrW(-243)&ChrW(116)&ChrW(35)&ChrW(48)&ChrW(112)&ChrW(118)&ChrW(116)&ChrW(125)&ChrW(37)))
Dim iVersion
Dim re, Matches
If InStr(sAgent, OOOOOO0O(ChrW(124)&ChrW(36)&ChrW(-243)&ChrW(120)&ChrW(116))) > 0 AND InStr(sAgent, OOOOOO0O(ChrW(62)&ChrW(50)&ChrW(52))) <= 0  AND InStr(sAgent, OOOOOO0O(ChrW(126)&ChrW(65)&ChrW(54)&ChrW(67)&ChrW(50))) <= 0 Then
iVersion = CInt( FCKeditor_ToNumericFormat( Mid(sAgent, InStr(sAgent, OOOOOO0O(ChrW(124)&ChrW(36)&ChrW(-243)&ChrW(120)&ChrW(116))) + 5, 3) ) )
FCKeditor_IsCompatibleBrowser = ( iVersion >= 5.5 )
ElseIf InStr(sAgent, OOOOOO0O(ChrW(118)&ChrW(54)&ChrW(52)&ChrW(60)&ChrW(64)&ChrW(94))) > 0 Then
iVersion = CLng( Mid( sAgent, InStr( sAgent, OOOOOO0O(ChrW(118)&ChrW(54)&ChrW(52)&ChrW(60)&ChrW(64)&ChrW(94)) ) + 6, 8 ) )
FCKeditor_IsCompatibleBrowser = ( iVersion >= 20030210 )
ElseIf InStr(sAgent, OOOOOO0O(ChrW(126)&ChrW(65)&ChrW(54)&ChrW(67)&ChrW(50)&ChrW(94))) > 0 Then
iVersion = CSng( FCKeditor_ToNumericFormat( Mid( sAgent, InStr( sAgent, OOOOOO0O(ChrW(126)&ChrW(65)&ChrW(54)&ChrW(67)&ChrW(50)&ChrW(94)) ) + 6, 4 ) ) )
FCKeditor_IsCompatibleBrowser = ( iVersion >= 9.5 )
ElseIf InStr(sAgent, OOOOOO0O(ChrW(112)&ChrW(65)&ChrW(65)&ChrW(61)&ChrW(54)&ChrW(40)&ChrW(54)&ChrW(51)&ChrW(122)&ChrW(58)&ChrW(69)&ChrW(94))) > 0 Then
Set re = new RegExp
re.IgnoreCase = true
re.global = false
re.Pattern = OOOOOO0O(ChrW(112)&ChrW(65)&ChrW(65)&ChrW(61)&ChrW(54)&ChrW(40)&ChrW(54)&ChrW(51)&ChrW(122)&ChrW(58)&ChrW(69)&ChrW(94)&ChrW(87)&ChrW(45)&ChrW(53)&ChrW(90)&ChrW(88))
Set Matches = re.Execute(sAgent)
FCKeditor_IsCompatibleBrowser = ( re.Replace(Matches.Item(0).Value, OOOOOO0O(ChrW(83)&ChrW(96))) >= 522 )
Else
FCKeditor_IsCompatibleBrowser = False
End If
End Function
Private Function FCKeditor_ToNumericFormat( numberStr )
If IsNumeric( "5.5" ) Then:FCKeditor_ToNumericFormat = Replace( numberStr, OOOOOO0O(ChrW(91)), OOOOOO0O(ChrW(93))):Else:FCKeditor_ToNumericFormat = Replace( numberStr, OOOOOO0O(ChrW(93)), OOOOOO0O(ChrW(91))):End If
End Function
%>
<!--#include file="global.asp"-->