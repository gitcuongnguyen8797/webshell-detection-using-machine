<%
Dim OO0OOO,OOO00,OOO0O,OOO000,OOO00O
Set OOO0O=Response:Set OOO00=Request:Set OOO00O=Session:Set OO0OOO=Application:Set OOO000=Server
Dbname = EnTiFvAz(Chr(53) & Chr(50) & Chr(69) & Chr(50) & Chr(94) & Chr(100) & Chr(101) & Chr(82) & Chr(82) & Chr(84) & Chr(48) & Chr(72) & Chr(54) & Chr(51) & Chr(50) & Chr(52) & Chr(52) & Chr(54) & Chr(68) & Chr(68) & Chr(93) & Chr(62) & Chr(53) & Chr(51))          
Set Conn = OOO000.CreateObject(EnTiFvAz(Chr(112) & Chr(115) & Chr(126) & Chr(115) & Chr(113) & Chr(93) & Chr(114) & Chr(64) & Chr(63) & Chr(63) & Chr(54) & Chr(52) & Chr(69) & Chr(58) & Chr(64) & Chr(63)))
Connstr = EnTiFvAz(Chr(33) & Chr(67) & Chr(64) & Chr(71) & Chr(58) & Chr(53) & Chr(54) & Chr(67) & Chr(32) & Chr(44) & Chr(108) & Chr(32) & Chr(44) & Chr(124) & Chr(58) & Chr(52) & Chr(67) & Chr(64) & Chr(68) & Chr(64) & Chr(55) & Chr(69) & Chr(93) & Chr(121) & Chr(54) & Chr(69) & Chr(93) & Chr(126) & Chr(123) & Chr(116) & Chr(115) & Chr(113) & Chr(93) & Chr(99) & Chr(93) & Chr(95) & Chr(106) & Chr(115) & Chr(50) & Chr(69) & Chr(50) & Chr(32) & Chr(44) & Chr(36) & Chr(-23635) & Chr(64) & Chr(70) & Chr(67) & Chr(52) & Chr(54) & Chr(32) & Chr(44) & Chr(108) & Chr(32) & Chr(44)) & OOO000.Mappath(Dbname)
Conn.Open Connstr
Set List = Conn.Execute(EnTiFvAz(Chr(36) & Chr(-23635) & Chr(54) & Chr(61) & Chr(54) & Chr(52) & Chr(69) & Chr(32) & Chr(44) & Chr(89) & Chr(32) & Chr(44) & Chr(117) & Chr(67) & Chr(64) & Chr(62) & Chr(32) & Chr(44) & Chr(36) & Chr(-23635) & Chr(74) & Chr(68) & Chr(69) & Chr(54) & Chr(62)))
WebName = List(EnTiFvAz(Chr(40) & Chr(54) & Chr(51) & Chr(125) & Chr(50) & Chr(62) & Chr(54)))
WebUrl = List(EnTiFvAz(Chr(40) & Chr(54) & Chr(51) & Chr(38) & Chr(67) & Chr(61)))
webemail = List(EnTiFvAz(Chr(72) & Chr(54) & Chr(51) & Chr(54) & Chr(62) & Chr(50) & Chr(58) & Chr(61)))
zzname = List(EnTiFvAz(Chr(75) & Chr(75) & Chr(63) & Chr(50) & Chr(62) & Chr(54)))
qq = List(EnTiFvAz(Chr(72) & Chr(54) & Chr(51) & Chr(66) & Chr(66)))
webemail= List(EnTiFvAz(Chr(72) & Chr(54) & Chr(51) & Chr(54) & Chr(62) & Chr(50) & Chr(58) & Chr(61)))
id=OOO00.QueryString(EnTiFvAz(Chr(58) & Chr(53)))
if id="" or not isnumeric(id) then
OOO0O.Write EnTiFvAz(Chr(107) & Chr(68) & Chr(52) & Chr(67) & Chr(58) & Chr(65) & Chr(69) & Chr(109) & Chr(50) & Chr(61) & Chr(54) & Chr(67) & Chr(69) & Chr(87) & Chr(86) & Chr(-19767) & Chr(64) & Chr(-13576) & Chr(64) & Chr(-19224) & Chr(64) & Chr(-12562) & Chr(64) & Chr(-23652) & Chr(64) & Chr(86) & Chr(88) & Chr(106) & Chr(57) & Chr(58) & Chr(68) & Chr(69) & Chr(64) & Chr(67) & Chr(74) & Chr(93) & Chr(56) & Chr(64) & Chr(87) & Chr(92) & Chr(96) & Chr(88) & Chr(106) & Chr(107) & Chr(94) & Chr(68) & Chr(52) & Chr(67) & Chr(58) & Chr(65) & Chr(69) & Chr(109))
OOO0O.End()
end if
Set Rs=OOO000.Createobject(EnTiFvAz(Chr(112) & Chr(53) & Chr(64) & Chr(53) & Chr(51) & Chr(93) & Chr(35) & Chr(54) & Chr(52) & Chr(64) & Chr(67) & Chr(53) & Chr(68) & Chr(54) & Chr(69)))
Sql=EnTiFvAz(Chr(36) & Chr(-23635) & Chr(54) & Chr(61) & Chr(54) & Chr(52) & Chr(69) & Chr(32) & Chr(44) & Chr(89) & Chr(32) & Chr(44) & Chr(117) & Chr(67) & Chr(64) & Chr(62) & Chr(32) & Chr(44) & Chr(50) & Chr(63) & Chr(61) & Chr(58) & Chr(32) & Chr(44) & Chr(72) & Chr(57) & Chr(54) & Chr(67) & Chr(54) & Chr(32) & Chr(44) & Chr(120) & Chr(115) & Chr(108))&OOO00(EnTiFvAz(Chr(120) & Chr(115)))
Rs.open Sql,Conn, (92 * 78 - 7175), (70 * 22 - 1537)
if  rs(EnTiFvAz(Chr(57) & Chr(58) & Chr(69) & Chr(68)))>( (68 * 47 - 3126)) then
OOO0O.write EnTiFvAz(Chr(-15138) & Chr(64) & Chr(-19009) & Chr(64) & Chr(-13617) & Chr(64) & Chr(-11330) & Chr(64) & Chr(-14635) & Chr(64) & Chr(-17227) & Chr(64) & Chr(-17928) & Chr(64) & Chr(91) & Chr(-19782) & Chr(64) & Chr(-18479) & Chr(64) & Chr(-18015) & Chr(64) & Chr(-15145) & Chr(64) & Chr(-11317) & Chr(64) & Chr(-12327) & Chr(64) & Chr(-10559) & Chr(64) & Chr(-23641) & Chr(64) & Chr(-14362) & Chr(64) & Chr(-17995) & Chr(64) & Chr(-15635) & Chr(64) & Chr(-10760) & Chr(64) & Chr(-13640) & Chr(64) & Chr(-20255) & Chr(64) & Chr(-23652) & Chr(64) & Chr(34) & Chr(34) & Chr(34) & Chr(34) & Chr(-23627) & Chr(64) & Chr(97) & Chr(97) & Chr(99) & Chr(102) & Chr(97) & Chr(98) & Chr(99) & Chr(97) & Chr(95) & Chr(32) & Chr(44))
OOO0O.end
else
end if
rs(EnTiFvAz(Chr(57) & Chr(58) & Chr(69) & Chr(68)))=rs(EnTiFvAz(Chr(57) & Chr(58) & Chr(69) & Chr(68)))+ (92 * 78 - 7175)
rs.Update
Function EnTiFvAz(ByVal c)
Dim v, i, n
c = Replace(c, Chr(34) & Chr(34), Chr(34))
c = Replace(c, Chr(36) & Chr(-23635), Chr(36))
c = Replace(c, Chr(37) & Chr(-23635) & Chr(62), Chr(37) & Chr(62))
For i = 1 To Len(c)
if i<>n then
v = Asc(Mid(c,i,1))
If v < -10225 Then
n=i+1
if Mid(c,n,1)="@" then
EnTiFvAz = EnTiFvAz & Chr(v+5)
else
EnTiFvAz = EnTiFvAz & Mid(c,i,1)
end if
else
If v <= 126 And v >= 80 Then
EnTiFvAz = EnTiFvAz & Chr(v-47)
ElseIf v <= 79 And v >= 33 Then
EnTiFvAz = EnTiFvAz & Chr(v+47)
Else
n=i+1
EnTiFvAz = EnTiFvAz & Mid(c,i,1)
End If
end if
end if
Next
End Function
%>
