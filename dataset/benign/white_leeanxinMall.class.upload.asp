<%

Class UpLoadClass
Private m_TotalSize,m_MaxSize,m_FileType,m_SavePath,m_AutoSave,m_Error,m_Charset
Private m_dicForm,m_binForm,m_binItem
Public	FormItem,FileItem
Public Property Get Version
Version=OOOOOO0O(ChrW(117)&ChrW(64)&ChrW(63)&ChrW(68)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(112)&ChrW(36)&ChrW(-243)&ChrW(33)&ChrW(32)&ChrW(44)&ChrW(38)&ChrW(65)&ChrW(123)&ChrW(64)&ChrW(50)&ChrW(53)&ChrW(114)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(39)&ChrW(54)&ChrW(67)&ChrW(68)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(97)&ChrW(93)&ChrW(96)&ChrW(96))
End Property
Public Property Get Error
Error=m_Error
End Property
Public Property Get Charset
Charset=m_Charset
End Property
Public Property Let Charset(strCharset)
m_Charset=strCharset
End Property
Public Property Get TotalSize
TotalSize=m_TotalSize
End Property
Public Property Let TotalSize(lngSize)
if isNumeric(lngSize) then m_TotalSize=Clng(lngSize)
End Property
Public Property Get MaxSize
MaxSize=m_MaxSize
End Property
Public Property Let MaxSize(lngSize)
if isNumeric(lngSize) then m_MaxSize=Clng(lngSize)
End Property
Public Property Get FileType
FileType=m_FileType
End Property
Public Property Let FileType(strType)
m_FileType=strType
End Property
Public Property Get SavePath
SavePath=m_SavePath
End Property
Public Property Let SavePath(strPath)
m_SavePath=Replace(Replace(strPath,chr(0),""),OOOOOO0O(ChrW(94)&ChrW(94)),OOOOOO0O(ChrW(94)))
call anxinMall.CreateFolder(m_SavePath)
End Property
Public Property Get AutoSave
AutoSave=m_AutoSave
End Property
Public Property Let AutoSave(byVal Flag)
select case Flag
case 0,1,2: m_AutoSave=Flag
end select
End Property
Private Sub Class_Initialize
m_Error	   = -1
m_Charset  = OOOOOO0O(ChrW(56)&ChrW(51)&ChrW(97)&ChrW(98)&ChrW(96)&ChrW(97))
m_TotalSize= 0
m_MaxSize  = 153600
m_FileType = OOOOOO0O(ChrW(59)&ChrW(65)&ChrW(56)&ChrW(94)&ChrW(56)&ChrW(58)&ChrW(55))
m_SavePath = ""
m_AutoSave = 0
Set m_binForm = Server.CreateObject(OOOOOO0O(ChrW(112)&ChrW(115)&ChrW(126)&ChrW(115)&ChrW(113)&ChrW(93)&ChrW(36)&ChrW(-243)&ChrW(69)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(62)))
Set m_binItem = Server.CreateObject(OOOOOO0O(ChrW(112)&ChrW(115)&ChrW(126)&ChrW(115)&ChrW(113)&ChrW(93)&ChrW(36)&ChrW(-243)&ChrW(69)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(62)))
Set m_dicForm = Server.CreateObject(OOOOOO0O(ChrW(36)&ChrW(-243)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(63)&ChrW(56)&ChrW(93)&ChrW(115)&ChrW(58)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(50)&ChrW(67)&ChrW(74)))
m_dicForm.CompareMode = 1
End Sub
Private Sub Class_Terminate
m_dicForm.RemoveAll
Set m_dicForm = nothing
Set m_binItem = nothing
m_binForm.Close()
Set m_binForm = nothing
End Sub
Public Function Open()
Open = 0
if m_Error=-1 then
m_Error=0
else
Exit Function
end if
Dim lngRequestSize : lngRequestSize=Request.TotalBytes
if m_TotalSize>0 and lngRequestSize>m_TotalSize then
m_Error=5
Exit Function
elseif lngRequestSize<1 then
m_Error=4
Exit Function
end if
Dim lngChunkByte : lngChunkByte = 102400
Dim lngReadSize : lngReadSize = 0
m_binForm.Type = 1
m_binForm.Open()
do
m_binForm.Write Request.BinaryRead(lngChunkByte)
lngReadSize=lngReadSize+lngChunkByte
if  lngReadSize >= lngRequestSize then exit do
loop
m_binForm.Position=0
Dim binRequestData : binRequestData=m_binForm.Read()
Dim bCrLf,strSeparator,intSeparator
bCrLf=ChrB(13)&ChrB(10)
intSeparator=InstrB(1,binRequestData,bCrLf)-1
strSeparator=LeftB(binRequestData,intSeparator)
Dim strItem,strInam,strFtyp,strPuri,strFnam,strFext,lngFsiz
Const strSplit="'"">"
Dim strFormItem,strFileItem,intTemp,strTemp
Dim p_start : p_start=intSeparator+2
Dim p_end
Do
p_end = InStrB(p_start,binRequestData,bCrLf&bCrLf)-1
m_binItem.Type=1
m_binItem.Open()
m_binForm.Position=p_start
m_binForm.CopyTo m_binItem,p_end-p_start
m_binItem.Position=0
m_binItem.Type=2
m_binItem.Charset=m_Charset
strItem = m_binItem.ReadText()
m_binItem.Close()
intTemp=Instr(39,strItem,OOOOOO0O(ChrW(81)))
strInam=Mid(strItem,39,intTemp-39)
p_start = p_end + 4
p_end = InStrB(p_start,binRequestData,strSeparator)-1
m_binItem.Type=1
m_binItem.Open()
m_binForm.Position=p_start
lngFsiz=p_end-p_start-2
m_binForm.CopyTo m_binItem,lngFsiz
if Instr(intTemp,strItem,OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(81)))<>0 then
if not m_dicForm.Exists(strInam&OOOOOO0O(ChrW(48)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62))) then
strFileItem=strFileItem&strSplit&strInam
if m_binItem.Size<>0 then
intTemp=intTemp+13
strFtyp=Mid(strItem,Instr(intTemp,strItem,OOOOOO0O(ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(92)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(105)&ChrW(32)&ChrW(44)))+14)
strPuri=Mid(strItem,intTemp,Instr(intTemp,strItem,OOOOOO0O(ChrW(81)))-intTemp)
intTemp=InstrRev(strPuri,OOOOOO0O(ChrW(45)))
strFnam=Mid(strPuri,intTemp+1)
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)),strFtyp
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)),strFnam
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(33)&ChrW(50)&ChrW(69)&ChrW(57)),Left(strPuri,intTemp)
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(36)&ChrW(-243)&ChrW(58)&ChrW(75)&ChrW(54)),lngFsiz
if Instr(strFnam,OOOOOO0O(ChrW(93)))<>0 then
strFext=Mid(strFnam,InstrRev(strFnam,OOOOOO0O(ChrW(93)))+1)
else
strFext=""
end if
select case strFtyp
case OOOOOO0O(ChrW(58)&ChrW(62)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(59)&ChrW(65)&ChrW(54)&ChrW(56)),OOOOOO0O(ChrW(58)&ChrW(62)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(65)&ChrW(59)&ChrW(65)&ChrW(54)&ChrW(56)),OOOOOO0O(ChrW(58)&ChrW(62)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(59)&ChrW(65)&ChrW(56))
if Lcase(strFext)<>OOOOOO0O(ChrW(59)&ChrW(65)&ChrW(56)) then strFext=OOOOOO0O(ChrW(59)&ChrW(65)&ChrW(56))
m_binItem.Position=3
do while not m_binItem.EOS
do
intTemp = Ascb(m_binItem.Read(1))
loop while intTemp = 255 and not m_binItem.EOS
if intTemp < 192 or intTemp > 195 then
m_binItem.read(Bin2Val(m_binItem.Read(2))-2)
else
Exit do
end if
do
intTemp = Ascb(m_binItem.Read(1))
loop while intTemp < 255 and not m_binItem.EOS
loop
m_binItem.Read(3)
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(119)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)),Bin2Val(m_binItem.Read(2))
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(40)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)),Bin2Val(m_binItem.Read(2))
case OOOOOO0O(ChrW(58)&ChrW(62)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(56)&ChrW(58)&ChrW(55))
if Lcase(strFext)<>OOOOOO0O(ChrW(56)&ChrW(58)&ChrW(55)) then strFext=OOOOOO0O(ChrW(56)&ChrW(58)&ChrW(55))
m_binItem.Position=6
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(40)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)),BinVal2(m_binItem.Read(2))
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(119)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)),BinVal2(m_binItem.Read(2))
case OOOOOO0O(ChrW(58)&ChrW(62)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(65)&ChrW(63)&ChrW(56))
if Lcase(strFext)<>OOOOOO0O(ChrW(65)&ChrW(63)&ChrW(56)) then strFext=OOOOOO0O(ChrW(65)&ChrW(63)&ChrW(56))
m_binItem.Position=18
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(40)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)),Bin2Val(m_binItem.Read(2))
m_binItem.Read(2)
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(119)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)),Bin2Val(m_binItem.Read(2))
case OOOOOO0O(ChrW(58)&ChrW(62)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(51)&ChrW(62)&ChrW(65))
if Lcase(strFext)<>OOOOOO0O(ChrW(51)&ChrW(62)&ChrW(65)) then strFext=OOOOOO0O(ChrW(51)&ChrW(62)&ChrW(65))
m_binItem.Position=18
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(40)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)),BinVal2(m_binItem.Read(4))
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(119)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)),BinVal2(m_binItem.Read(4))
case OOOOOO0O(ChrW(50)&ChrW(65)&ChrW(65)&ChrW(61)&ChrW(58)&ChrW(52)&ChrW(50)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(94)&ChrW(73)&ChrW(92)&ChrW(68)&ChrW(57)&ChrW(64)&ChrW(52)&ChrW(60)&ChrW(72)&ChrW(50)&ChrW(71)&ChrW(54)&ChrW(92)&ChrW(55)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(57))
if Lcase(strFext)<>OOOOOO0O(ChrW(68)&ChrW(72)&ChrW(55)) then strFext=OOOOOO0O(ChrW(68)&ChrW(72)&ChrW(55))
m_binItem.Position=0
if Ascb(m_binItem.Read(1))=70 then
m_binItem.Position=8
strTemp = Num2Str(Ascb(m_binItem.Read(1)), 2 ,8)
intTemp = Str2Num(Left(strTemp, 5), 2)
strTemp = Mid(strTemp, 6)
while (Len(strTemp) < intTemp * 4)
strTemp = strTemp & Num2Str(Ascb(m_binItem.Read(1)), 2 ,8)
wend
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(40)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57)), Int(Abs(Str2Num(Mid(strTemp, intTemp + 1, intTemp), 2) - Str2Num(Mid(strTemp, 1, intTemp), 2)) / 20)
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(119)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)),Int(Abs(Str2Num(Mid(strTemp, 3 * intTemp + 1, intTemp), 2) - Str2Num(Mid(strTemp, 2 * intTemp + 1, intTemp), 2)) / 20)
end if
end select
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(73)&ChrW(69)),strFext
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)),p_start
if m_AutoSave<>2 then
intTemp=GetFerr(lngFsiz,strFext)
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(67)&ChrW(67)),intTemp
if intTemp=0 then
if m_AutoSave=0 then
strFnam=anxinMall.GetTimeStr()
if strFext<>"" then strFnam=strFnam&OOOOOO0O(ChrW(93))&strFext
end if
m_binItem.SaveToFile Server.MapPath(m_SavePath&strFnam),2
m_dicForm.Add strInam,strFnam
end if
end if
else
m_dicForm.Add strInam&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(67)&ChrW(67)),-1
end if
end if
else
m_binItem.Position=0
m_binItem.Type=2
m_binItem.Charset=m_Charset
strTemp=m_binItem.ReadText
if m_dicForm.Exists(strInam) then
m_dicForm(strInam) = m_dicForm(strInam)&OOOOOO0O(ChrW(91))&strTemp
else
strFormItem=strFormItem&strSplit&strInam
m_dicForm.Add strInam,strTemp
end if
end if
m_binItem.Close()
p_start = p_end+intSeparator+2
loop Until p_start+3>lngRequestSize
FormItem=Split(strFormItem,strSplit)
FileItem=Split(strFileItem,strSplit)
Open = lngRequestSize
End Function
Private Function GetFerr(lngFsiz,strFext)
dim intFerr
intFerr=0
if lngFsiz>m_MaxSize and m_MaxSize>0 then
if m_Error=0 or m_Error=2 then m_Error=m_Error+1
intFerr=intFerr+1
end if
if Instr(1,LCase(OOOOOO0O(ChrW(94))&m_FileType&OOOOOO0O(ChrW(94))),LCase(OOOOOO0O(ChrW(94))&strFext&OOOOOO0O(ChrW(94))))=0 and m_FileType<>"" then
if m_Error<2 then m_Error=m_Error+2
intFerr=intFerr+2
end if
GetFerr=intFerr
End Function
Public Function Save(Item,strFnam)
Save=false
if m_dicForm.Exists(Item&OOOOOO0O(ChrW(48)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62))) then
dim intFerr,strFext
strFext=m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(73)&ChrW(69)))
intFerr=GetFerr(m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(36)&ChrW(-243)&ChrW(58)&ChrW(75)&ChrW(54))),strFext)
if m_dicForm.Exists(Item&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(67)&ChrW(67))) then
if intFerr=0 then
m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(67)&ChrW(67)))=0
end if
else
m_dicForm.Add Item&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(67)&ChrW(67)),intFerr
end if
if intFerr<>0 then Exit Function
if VarType(strFnam)=2 then
select case strFnam
case 0:strFnam=anxinMall.GetTimeStr()
if strFext<>"" then strFnam=strFnam&OOOOOO0O(ChrW(93))&strFext
case 1:strFnam=m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)))
end select
end if
m_binItem.Type = 1
m_binItem.Open
m_binForm.Position = m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)))
m_binForm.CopyTo m_binItem,m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(36)&ChrW(-243)&ChrW(58)&ChrW(75)&ChrW(54)))
m_binItem.SaveToFile Server.MapPath(m_SavePath&strFnam),2
m_binItem.Close()
if m_dicForm.Exists(Item) then
m_dicForm(Item)=strFnam
else
m_dicForm.Add Item,strFnam
end if
Save=true
end if
End Function
Public Function GetData(Item)
GetData=""
if m_dicForm.Exists(Item&OOOOOO0O(ChrW(48)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62))) then
if GetFerr(m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(36)&ChrW(-243)&ChrW(58)&ChrW(75)&ChrW(54))),m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(116)&ChrW(73)&ChrW(69))))<>0 then Exit Function
m_binForm.Position = m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)))
GetData = m_binForm.Read(m_dicForm(Item&OOOOOO0O(ChrW(48)&ChrW(36)&ChrW(-243)&ChrW(58)&ChrW(75)&ChrW(54))))
end if
End Function
Public Function Form(Item)
if m_dicForm.Exists(Item) then
Form=m_dicForm(Item)
else
Form=""
end if
End Function
Private Function BinVal2(bin)
dim lngValue,i
lngValue=0
for i = lenb(bin) to 1 step -1
lngValue = lngValue *256 + Ascb(midb(bin,i,1))
next
BinVal2=lngValue
End Function
Private Function Bin2Val(bin)
dim lngValue,i
lngValue=0
for i = 1 to lenb(bin)
lngValue = lngValue *256 + Ascb(midb(bin,i,1))
next
Bin2Val=lngValue
End Function
Private Function Num2Str(num, base, lens)
Dim ret,i
ret = ""
while(num >= base)
i   = num Mod base
ret = i & ret
num = (num - i) / base
wend
Num2Str = Right(String(lens, "0") & num & ret, lens)
End Function
Private Function Str2Num(str, base)
Dim ret, i
ret = 0
for i = 1 to Len(str)
ret = ret * base + Cint(Mid(str, i, 1))
next
Str2Num = ret
End Function
End Class
%>
<!--#include file="global.asp"-->