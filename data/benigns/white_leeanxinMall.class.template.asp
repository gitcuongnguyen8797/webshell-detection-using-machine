<%

Class anxinMall_Cls_Template
Dim Reg
Dim Page
Dim ClassID
dim childids
Dim Size
Dim where
Dim Content
Dim Template
Dim Sql
Dim Table
Dim Field
Dim Order
Dim Cache
Dim PageBreak
dim pageindex
Private Sub Class_Initialize()
Response.Buffer=True
Set Reg = New RegExp
Reg.Ignorecase = True
Reg.Global = True
Page = 1
ClassID = ""
Childids = ""
where = ""
Sql = ""
Table = ""
Field = ""
Order = ""
Content = ""
Template = ""
Cache = ""
PageBreak = ""
End Sub
Private Sub Class_Terminate()
Set Reg = Nothing
End Sub
Public Function Load(ByVal Templatefile)
Template = Templatefile
Call LoadTemplate
End Function
Public Function Parser(pageindex)
call Parser_Sys
call Parser_AD
call Parser_Lable
call Parser_List
call Parser_Page(pageindex)
call Parser_IF
call Parser_ASP
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78)), "")
End Function
Public Function Parser2(pageindex)
call Parser_Sys
call Parser_AD
call Parser_Lable
call Parser_List
call Parser_Page2(pageindex)
call Parser_IF
call Parser_ASP
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78)), "")
End Function
Public Function Parser_Sys()
Dim Matches, Match, SysValue, Tmp
Reg.Pattern = OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(56)&ChrW(61)&ChrW(64)&ChrW(51)&ChrW(50)&ChrW(61)&ChrW(93)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
Tmp = Replace(LCase(Match.SubMatches(0)), OOOOOO0O(ChrW(32)&ChrW(44)), "")
If InStr(Tmp, OOOOOO0O(ChrW(53)&ChrW(50)&ChrW(69)&ChrW(50)&ChrW(51)&ChrW(50)&ChrW(68)&ChrW(54))) = 0 Then
If Len(Tmp) > 0 Then Execute (OOOOOO0O(ChrW(36)&ChrW(-243)&ChrW(74)&ChrW(68)&ChrW(39)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)) & Tmp) Else SysValue = ""
Else
SysValue = ""
End If
Content = Replace(Content, Match.Value, SysValue)
if instr(Template,OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(55)&ChrW(64)))>0 then
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(52)&ChrW(57)&ChrW(50)&ChrW(63)&ChrW(63)&ChrW(54)&ChrW(61)&ChrW(45)&ChrW(78)), 1)
elseif instr(Template,OOOOOO0O(ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)))>0 then
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(52)&ChrW(57)&ChrW(50)&ChrW(63)&ChrW(63)&ChrW(54)&ChrW(61)&ChrW(45)&ChrW(78)), 2)
else
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(52)&ChrW(57)&ChrW(50)&ChrW(63)&ChrW(63)&ChrW(54)&ChrW(61)&ChrW(45)&ChrW(78)), 0)
end if
Next
If Instr(Lcase(Content),OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(58)&ChrW(53)&ChrW(78)))>0 then
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(58)&ChrW(53)&ChrW(45)&ChrW(78)), 0)
End If
If Instr(Lcase(Content),OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(68)&ChrW(78)))>0 then
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(68)&ChrW(45)&ChrW(78)), anxinMall.getuserplus())
End If
End Function
Public Function Parser_Ad()
Dim Ads, i, j, Matches, Match, MyValue, Tmp
Ads = anxinMall.GetCache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(56)&ChrW(67)&ChrW(64)&ChrW(70)&ChrW(65)),"","")
If not anxinMall.issqlarray(Ads) then
if Ads<>OOOOOO0O(ChrW(63)&ChrW(70)&ChrW(61)&ChrW(61)) then
Ads = anxinMall.sqlarray(OOOOOO0O(ChrW(36)&ChrW(-243)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(112)&ChrW(53)&ChrW(48)&ChrW(118)&ChrW(67)&ChrW(64)&ChrW(70)&ChrW(65)&ChrW(46)))
If anxinMall.issqlarray(Ads) then
Call anxinMall.Addcache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(56)&ChrW(67)&ChrW(64)&ChrW(70)&ChrW(65)),Ads,cfg_cachetime(0))
Else
Call anxinMall.Addcache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(48)&ChrW(56)&ChrW(67)&ChrW(64)&ChrW(70)&ChrW(65)),OOOOOO0O(ChrW(63)&ChrW(70)&ChrW(61)&ChrW(61)),cfg_cachetime(0))
End if
Else
Content = Replace(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(50)&ChrW(53)&ChrW(93)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78)), "")
Exit Function
end if
end if
Reg.Pattern = OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(50)&ChrW(53)&ChrW(93)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
Tmp = Replace(LCase(Match.SubMatches(0)), OOOOOO0O(ChrW(32)&ChrW(44)), "")
If Len(Tmp) > 0 Then
MyValue = OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(24186)&ChrW(64)&ChrW(21573)&ChrW(64)&ChrW(26626)&ChrW(64)&ChrW(31609)&ChrW(64)&ChrW(32)&ChrW(44)) & Tmp & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(19976)&ChrW(64)&ChrW(23379)&ChrW(64)&ChrW(22307)&ChrW(64))
For i = 0 To UBound(Ads,2)
If LCase(Ads(1,i)) = Tmp Then
MyValue = anxinMall.GetAds(Ads(1,i))
End If
Next
End If
Content = Replace(Content, Match.Value, MyValue)
Next
End Function
Public Function Parser_Lable()
Dim Labels, i, j, Matches, Match, MyValue, Tmp
Labels = anxinMall.GetCache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(51)&ChrW(61)&ChrW(54)),"","")
If not anxinMall.issqlarray(Labels) then
if Labels<>OOOOOO0O(ChrW(63)&ChrW(70)&ChrW(61)&ChrW(61)) then
Labels = anxinMall.sqlarray(OOOOOO0O(ChrW(36)&ChrW(-243)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(51)&ChrW(54)&ChrW(61)&ChrW(46)))
If anxinMall.issqlarray(Labels) then
Call anxinMall.Addcache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(51)&ChrW(61)&ChrW(54)),Labels,cfg_cachetime(0))
Else
Call anxinMall.Addcache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(51)&ChrW(61)&ChrW(54)),OOOOOO0O(ChrW(63)&ChrW(70)&ChrW(61)&ChrW(61)),cfg_cachetime(0))
End if
Else
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(61)&ChrW(50)&ChrW(51)&ChrW(54)&ChrW(61)&ChrW(93)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78)), "")
Exit Function
end if
end if
Reg.Pattern = OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(61)&ChrW(50)&ChrW(51)&ChrW(54)&ChrW(61)&ChrW(93)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
Tmp = Replace(LCase(Match.SubMatches(0)), OOOOOO0O(ChrW(32)&ChrW(44)), "")
If Len(Tmp) > 0 Then
MyValue = OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(-230)&ChrW(44)&ChrW(-32283)&ChrW(64)&ChrW(23445)&ChrW(64)&ChrW(20036)&ChrW(64)&ChrW(26626)&ChrW(64)&ChrW(31609)&ChrW(64)&ChrW(-230)&ChrW(44)) & Tmp & OOOOOO0O(ChrW(19976)&ChrW(64)&ChrW(23379)&ChrW(64)&ChrW(22307)&ChrW(64))
For i = 0 To UBound(Labels, 2)
If LCase(Labels(2, i)) = Tmp Then
MyValue = Labels(3, i)
End If
Next
End If
Content = Replace(Content, Match.Value, MyValue)
Next
End Function
Public Function Parser_List()
Dim Matches, Match
Dim Rs, i, j
Dim Matche, BackValue
Dim TagLabs, Tagsstr, Loopstr
Dim anxinMall_CacheTime, anxinMall_Cache, anxinMall_CacheName, anxinMall_Row, anxinMall_Day
Dim anxinMall_Aid, anxinMall_Cid, anxinMall_Type, anxinMall_Mode, anxinMall_Flag, anxinMall_Order
Dim anxinMall_SQL, anxinMall_Table, anxinMall_Where, anxinMall_Field, anxinMall_ClassID, anxinMall_Pb, anxinMall_Array
anxinMall_Pb = anxinMall.VbsUnEscape(OOOOOO0O(ChrW(84)&ChrW(98)&ChrW(114)&ChrW(84)&ChrW(97)&ChrW(96)&ChrW(92)&ChrW(92)&ChrW(33))&OOOOOO0O(ChrW(64))&OOOOOO0O(ChrW(72)&ChrW(54))&OOOOOO0O(ChrW(67)&ChrW(54))&OOOOOO0O(ChrW(53)&ChrW(84)&ChrW(97)&ChrW(95)&ChrW(113)&ChrW(74)&ChrW(84)&ChrW(97)&ChrW(95)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58))&OOOOOO0O(ChrW(63))&OOOOOO0O(ChrW(124))&OOOOOO0O(ChrW(50)&ChrW(61)&ChrW(61)&ChrW(92)&ChrW(92)&ChrW(84)&ChrW(98)&ChrW(116)))
Reg.Pattern = OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(78)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(45)&ChrW(96)&ChrW(45)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
TagLabs = Match.SubMatches(0)
Tagsstr = Match.SubMatches(1)
Loopstr = Match.SubMatches(2)
If LCase(TagLabs) <> OOOOOO0O(ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)) Then
anxinMall_Cache = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(52)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(54))),1)
anxinMall_CacheName = GetAttr(Tagsstr, OOOOOO0O(ChrW(52)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
anxinMall_Row = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(67)&ChrW(64)&ChrW(72))),1)
anxinMall_Field = GetAttr(Tagsstr, OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)))
anxinMall_Mode = GetAttr(Tagsstr, OOOOOO0O(ChrW(62)&ChrW(64)&ChrW(53)&ChrW(54)))
anxinMall_ClassID = GetAttr(Tagsstr, OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)))
anxinMall_Type = GetAttr(Tagsstr, OOOOOO0O(ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)))
anxinMall_Flag = GetAttr(Tagsstr, OOOOOO0O(ChrW(55)&ChrW(61)&ChrW(50)&ChrW(56)))
anxinMall_Order = GetAttr(Tagsstr, OOOOOO0O(ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)))
anxinMall_SQL = GetAttr(Tagsstr, OOOOOO0O(ChrW(68)&ChrW(66)&ChrW(61)))
anxinMall_Table = GetAttr(Tagsstr, OOOOOO0O(ChrW(69)&ChrW(50)&ChrW(51)&ChrW(61)&ChrW(54)))
anxinMall_Where = GetAttr(Tagsstr, OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)))
anxinMall_Day = GetAttr(Tagsstr, OOOOOO0O(ChrW(53)&ChrW(50)&ChrW(74)))
anxinMall_Array = GetAttr(Tagsstr, OOOOOO0O(ChrW(112)&ChrW(67)&ChrW(67)&ChrW(50)&ChrW(74)))
If Len(anxinMall_Row) = 0 or Not IsNumeric(anxinMall_Row) Then anxinMall_Row = ""
If anxinMall_Row <>"" then anxinMall_Row = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)) & anxinMall_Row & OOOOOO0O(ChrW(32)&ChrW(44))
If Len(anxinMall_Field) = 0 Then anxinMall_Field = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44))
If Len(anxinMall_Table)>0 Then
if Instr(anxinMall_Table,OOOOOO0O(ChrW(44)))=0 then anxinMall_Table = OOOOOO0O(ChrW(44))&anxinMall_Table&OOOOOO0O(ChrW(46))
End If
If Len(anxinMall_Where) > 0 Then anxinMall_Where = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(40)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)) & anxinMall_Where
Dim anxinMall_Childids : anxinMall_Childids = ""
if anxinMall_Mode=OOOOOO0O(ChrW(62)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(51)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(68)) then
anxinMall_Table = OOOOOO0O(ChrW(44)&ChrW(62)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(51)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(68)&ChrW(46))
if len(anxinMall_Order)=0 then
anxinMall_Order = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(44)&ChrW(51)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(58)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(53)&ChrW(54)&ChrW(68)&ChrW(52)&ChrW(32)&ChrW(44))
end if
If len(anxinMall_Where)=0 then
anxinMall_Where = OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(64)&ChrW(63)&ChrW(65)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(46)&ChrW(108)&ChrW(96)&ChrW(32)&ChrW(44))
Else
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(64)&ChrW(63)&ChrW(65)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(46)&ChrW(108)&ChrW(96)&ChrW(32)&ChrW(44))
End if
If anxinMall_ClassID<>"" then
dim childids
if instr(anxinMall_ClassID,OOOOOO0O(ChrW(91)))=0 then
anxinMall_Childids = getinfoclass(anxinMall_ClassID,OOOOOO0O(ChrW(52)&ChrW(57)&ChrW(58)&ChrW(61)&ChrW(53)&ChrW(58)&ChrW(53)&ChrW(68)))
if anxinMall_Childids="" then
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44))&anxinMall_ClassID&OOOOOO0O(ChrW(32)&ChrW(44))
else
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(87))&anxinMall_Childids&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44))
end if
else
dim k
dim subclassid
for k=0 to ubound(split(anxinMall_ClassID,OOOOOO0O(ChrW(91))))
subclassid = split(anxinMall_ClassID,OOOOOO0O(ChrW(91)))(k)
if subclassid<>"" then
childids = getinfoclass(subclassid,OOOOOO0O(ChrW(52)&ChrW(57)&ChrW(58)&ChrW(61)&ChrW(53)&ChrW(58)&ChrW(53)&ChrW(68)))
if len(childids)>0 then
anxinMall_Childids = anxinMall_Childids & getinfoclass(subclassid,OOOOOO0O(ChrW(52)&ChrW(57)&ChrW(58)&ChrW(61)&ChrW(53)&ChrW(58)&ChrW(53)&ChrW(68))) & OOOOOO0O(ChrW(91))
end if
end if
next
if anxinMall_Childids<>"" then
anxinMall_Childids = replace(anxinMall_Childids,OOOOOO0O(ChrW(91)&ChrW(91)),OOOOOO0O(ChrW(91)))
if right(anxinMall_Childids,1)=OOOOOO0O(ChrW(91)) then
anxinMall_Childids = mid(anxinMall_Childids,1,InStrRev(anxinMall_Childids,OOOOOO0O(ChrW(91)))-1)
end if
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(87))&anxinMall_Childids&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44))
end if
end if
end if
elseif 	anxinMall_Mode=OOOOOO0O(ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)) then
anxinMall_Table = OOOOOO0O(ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)&ChrW(46))
if len(anxinMall_Order)=0 then
anxinMall_Order = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(53)&ChrW(54)&ChrW(68)&ChrW(52)&ChrW(32)&ChrW(44))
end if
If len(anxinMall_Where)=0 then
anxinMall_Where = OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(53)&ChrW(58)&ChrW(68)&ChrW(65)&ChrW(61)&ChrW(50)&ChrW(74)&ChrW(46)&ChrW(108)&ChrW(96)&ChrW(32)&ChrW(44))
Else
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(53)&ChrW(58)&ChrW(68)&ChrW(65)&ChrW(61)&ChrW(50)&ChrW(74)&ChrW(46)&ChrW(108)&ChrW(96)&ChrW(32)&ChrW(44))
End if
if anxinMall_ClassID<>"" then
anxinMall_Childids = getartclass(anxinMall_ClassID,OOOOOO0O(ChrW(52)&ChrW(57)&ChrW(58)&ChrW(61)&ChrW(53)&ChrW(58)&ChrW(53)&ChrW(68)))
if anxinMall_Childids="" then
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44))&anxinMall_ClassID&OOOOOO0O(ChrW(32)&ChrW(44))
else
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(87))&anxinMall_Childids&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44))
end if
end if
if len(anxinMall_Flag)>0 then
dim s_flag
s_flag = split(anxinMall_Flag,OOOOOO0O(ChrW(91)))
for i = 0 to ubound(s_flag)
if s_flag(i)<>"" then
anxinMall_Where = anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(61)&ChrW(50)&ChrW(56)&ChrW(32)&ChrW(44)&ChrW(61)&ChrW(58)&ChrW(60)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(86)&ChrW(84))&s_flag(i)&OOOOOO0O(ChrW(84)&ChrW(86)&ChrW(32)&ChrW(44))
end if
next
end if
elseif anxinMall_Mode=OOOOOO0O(ChrW(62)&ChrW(54)&ChrW(63)&ChrW(70)) then
anxinMall_Table = OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(54)&ChrW(63)&ChrW(70))
anxinMall_Order = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(68)&ChrW(52)&ChrW(32)&ChrW(44))
end if
if len(anxinMall_Order)>0 then anxinMall_Order = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(126)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(113)&ChrW(74)&ChrW(32)&ChrW(44)) & anxinMall_Order
If Len(anxinMall_SQL) = 0 Then
anxinMall_SQL = OOOOOO0O(ChrW(36)&ChrW(-243)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)) & anxinMall_Row & anxinMall_Field & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)) & anxinMall_Table & OOOOOO0O(ChrW(32)&ChrW(44)) & anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)) & anxinMall_Order
End If
BackValue = ""
if anxinMall_Cache<>"" then
if instr(anxinMall_Cache,OOOOOO0O(ChrW(89)))>0 then
anxinMall_Cache = clng(split(anxinMall_Cache,OOOOOO0O(ChrW(89)))(0)) * clng(split(anxinMall_Cache,OOOOOO0O(ChrW(89)))(1))
end if
BackValue = anxinMall.GetCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_SQL & OOOOOO0O(ChrW(48)) & anxinMall_CacheName,"",0)
end if
if BackValue="" then
dim idcount
Set Rs = anxinMall.DB(anxinMall_SQL, 1)
idcount = rs.recordcount
Session(OOOOOO0O(ChrW(58))) = 0
Session(OOOOOO0O(ChrW(58)&ChrW(58))) = idcount
do while not rs.eof
If Len(TagLabs) = 0 Then TagLabs = OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53))
Session(OOOOOO0O(ChrW(58))) = Session(OOOOOO0O(ChrW(58))) + 1
BackValue = BackValue & Parser_Tags(OOOOOO0O(ChrW(45)&ChrW(44)) & TagLabs & OOOOOO0O(ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(46)), Loopstr, Rs, anxinMall_SQL)
rs.movenext
loop
Rs.Close
set Rs=nothing
if anxinMall_Cache<>"" and Session(OOOOOO0O(ChrW(58)))>0 then
call anxinMall.AddCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_SQL & OOOOOO0O(ChrW(48)) & anxinMall_CacheName,BackValue,anxinMall_Cache)
end if
end if
Content = Replace(Content, Match.Value, BackValue)
End If
Next
Err.Clear
If instr(Content,anxinMall_Pb)=0 then Content = Content & vbcrlf & anxinMall_Pb & vbcrlf
If RegExists(OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(78)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(45)&ChrW(96)&ChrW(45)&ChrW(78)), Content) Then Call Parser_List
End Function
Public Function Parser_Page(pageindex)
Dim Matches, Match
Dim Rs, i, j
Dim Matche, BackValue
Dim Tagsstr, Loopstr
Dim anxinMall_Size, anxinMall_Order, anxinMall_Field, anxinMall_Table, anxinMall_Where, anxinMall_Cache, anxinMall_SQL, anxinMall_Page, anxinMall_PageBreak
Dim anxinMall_RecordCount, anxinMall_PageCount
Reg.Pattern = OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(78)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(45)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
BackValue = ""
Tagsstr = Match.SubMatches(0)
Loopstr = Match.SubMatches(1)
anxinMall_Size = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(68)&ChrW(58)&ChrW(75)&ChrW(54))),1)
anxinMall_Field = GetAttr(Tagsstr, OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)))
anxinMall_Table = GetAttr(Tagsstr, OOOOOO0O(ChrW(69)&ChrW(50)&ChrW(51)&ChrW(61)&ChrW(54)))
anxinMall_Where = GetAttr(Tagsstr, OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)))
anxinMall_Order = GetAttr(Tagsstr, OOOOOO0O(ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)))
anxinMall_Sql = GetAttr(Tagsstr, OOOOOO0O(ChrW(68)&ChrW(66)&ChrW(61)))
anxinMall_Cache = anxinMall.leachstr(GetAttr(Tagsstr,OOOOOO0O(ChrW(52)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(54))),1)
anxinMall_PageBreak = GetAttr(Tagsstr, OOOOOO0O(ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(51)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(60)))
If Len(anxinMall_Size)=0 then anxinMall_Size = Size
If Len(anxinMall_Field)=0 then anxinMall_Field = Field
If Len(anxinMall_Field)=0 then anxinMall_Field = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44))
If Len(anxinMall_Table)=0 then anxinMall_Table = table
If Len(anxinMall_Where)=0 then anxinMall_Where = where
If Len(anxinMall_Where)>0 then anxinMall_Where = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)) & anxinMall_Where
If Len(anxinMall_Order)=0 then anxinMall_Order = Order
If Len(anxinMall_Order)>0 then anxinMall_Order = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(51)&ChrW(74)&ChrW(32)&ChrW(44)) & anxinMall_Order
If Len(anxinMall_Cache)=0 then anxinMall_Cache = Cache
If Len(anxinMall_Cache)=0 then anxinMall_Cache = 0
If Len(anxinMall_PageBreak)=0 then anxinMall_PageBreak = PageBreak Else anxinMall_PageBreak = replace(anxinMall_PageBreak,OOOOOO0O(ChrW(82)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(82)),OOOOOO0O(ChrW(76)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(78)))
If anxinMall_Cache<0 then anxinMall_Cache = 0
If Len(anxinMall_Page)=0 then anxinMall_Page = Page
If Len(anxinMall_Page)=0 then anxinMall_Page = 1 else anxinMall_Page = anxinMall.leachstr(anxinMall_Page,1)
If Len(anxinMall_Sql)=0 Then
anxinMall_Sql = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)) & anxinMall_Field & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)) & anxinMall_Table & OOOOOO0O(ChrW(32)&ChrW(44)) & anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)) & anxinMall_Order
End If
anxinMall_Sql = anxinMall.ReplaceExp(anxinMall_Sql,OOOOOO0O(ChrW(87)&ChrW(45)&ChrW(68)&ChrW(76)&ChrW(97)&ChrW(91)&ChrW(78)&ChrW(88)),OOOOOO0O(ChrW(32)&ChrW(44)))
If Len(anxinMall_Size)=0 then
If instr(anxinMall_Sql,OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)))>0 then
anxinMall_Size = anxinMall.InterExp(anxinMall_Sql,OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)),OOOOOO0O(ChrW(32)&ChrW(44)))
else
anxinMall_Size = 10
end if
End If
BackValue = ""
if anxinMall_Cache>0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(61)&ChrW(58)&ChrW(60)&ChrW(54)))=0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(84)))=0 then
if instr(anxinMall_Cache,OOOOOO0O(ChrW(89)))>0 then
anxinMall_Cache = clng(split(anxinMall_Cache,OOOOOO0O(ChrW(89)))(0)) * clng(split(anxinMall_Cache,OOOOOO0O(ChrW(89)))(1))
end if
BackValue = anxinMall.GetCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)) & anxinMall_Page,"",0)
anxinMall_RecordCount = anxinMall.GetCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)),"",0)
end If
if len(BackValue)=0 or len(anxinMall_RecordCount)=0 then
dim countsql,pagers,pagec
countsql = replace(anxinMall_Sql,anxinMall.interExp(anxinMall_Sql,OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)),OOOOOO0O(ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62))),OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87))&pageindex&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44)))
countsql = anxinMall.InterExp(countsql,"",OOOOOO0O(ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)))
set pagers=anxinMall.db(countsql,4)
anxinMall_RecordCount=pagers(0)
cfg_dataquery = cfg_dataquery + 1
pagers.close
set pagers=nothing
if(anxinMall_RecordCount>0) then
set pagers=anxinMall.db(anxinMall_Sql,1)
pagers.absoluteposition=pagers.absoluteposition+((abs(anxinMall_Page)-1)*anxinMall_Size)
Session(OOOOOO0O(ChrW(58))) = 0
For i = 1 To anxinMall_Size
If pagers.Eof Then Exit For
Session(OOOOOO0O(ChrW(58))) = Session(OOOOOO0O(ChrW(58))) + 1
BackValue = BackValue & Parser_Tags(OOOOOO0O(ChrW(45)&ChrW(44)&ChrW(33)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(46)), Loopstr, Pagers ,anxinMall_Sql)
pagers.MoveNext
Next
cfg_dataquery = cfg_dataquery + 1
pagers.close
set pagers=nothing
end if
if anxinMall_Cache>0 and len(BackValue)>0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(61)&ChrW(58)&ChrW(60)&ChrW(54)))=0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(84)))=0 then
call anxinMall.AddCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)) & anxinMall_Page,BackValue,anxinMall_Cache)
call anxinMall.AddCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)),anxinMall_RecordCount,anxinMall_Cache)
end if
end if
if(anxinMall_RecordCount mod anxinMall_Size=0)then
anxinMall_PageCount=int(anxinMall_RecordCount/anxinMall_Size)
else
anxinMall_PageCount=int(anxinMall_RecordCount/anxinMall_Size)+1
end if
Content = anxinMall.ReplaceStr(Content, Match.Value, BackValue)
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(78)),anxinMall_RecordCount)
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(33)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(78)),anxinMall_PageCount)
If anxinMall_PageCount = 0 Then anxinMall_PageCount = 1
Next
Dim GetPageList
if matches.count > 0 then
GetPageList = anxinMall.PageBreak(anxinMall_PageBreak,anxinMall_Page,5,anxinMall_PageCount)
end if
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(76)&ChrW(69)&ChrW(50)&ChrW(56)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(48)&ChrW(55)&ChrW(54)&ChrW(63)&ChrW(74)&ChrW(54)&ChrW(78)&ChrW(78)), GetPageList)
End Function
Public Function Parser_Page2(pageindex)
Dim Matches, Match
Dim Rs, i, j
Dim Matche, BackValue
Dim Tagsstr, Loopstr
Dim anxinMall_Size, anxinMall_Order, anxinMall_Field, anxinMall_Table, anxinMall_Where, anxinMall_Cache, anxinMall_SQL, anxinMall_Page, anxinMall_PageBreak
Dim anxinMall_RecordCount, anxinMall_PageCount
Reg.Pattern = OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(78)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(45)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
BackValue = ""
Tagsstr = Match.SubMatches(0)
Loopstr = Match.SubMatches(1)
anxinMall_Size = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(68)&ChrW(58)&ChrW(75)&ChrW(54))),1)
anxinMall_Field = GetAttr(Tagsstr, OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)))
anxinMall_Table = GetAttr(Tagsstr, OOOOOO0O(ChrW(69)&ChrW(50)&ChrW(51)&ChrW(61)&ChrW(54)))
anxinMall_Where = GetAttr(Tagsstr, OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)))
anxinMall_Order = GetAttr(Tagsstr, OOOOOO0O(ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)))
anxinMall_Sql = GetAttr(Tagsstr, OOOOOO0O(ChrW(68)&ChrW(66)&ChrW(61)))
anxinMall_Cache = anxinMall.leachstr(GetAttr(Tagsstr,OOOOOO0O(ChrW(52)&ChrW(50)&ChrW(52)&ChrW(57)&ChrW(54))),1)
anxinMall_PageBreak = GetAttr(Tagsstr, OOOOOO0O(ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(51)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(60)))
If Len(anxinMall_Size)=0 then anxinMall_Size = Size
If Len(anxinMall_Field)=0 then anxinMall_Field = Field
If Len(anxinMall_Field)=0 then anxinMall_Field = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44))
If Len(anxinMall_Table)=0 then anxinMall_Table = table
If Len(anxinMall_Where)=0 then anxinMall_Where = where
If Len(anxinMall_Where)>0 then anxinMall_Where = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)) & anxinMall_Where
If Len(anxinMall_Order)=0 then anxinMall_Order = Order
If Len(anxinMall_Order)>0 then anxinMall_Order = OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(51)&ChrW(74)&ChrW(32)&ChrW(44)) & anxinMall_Order
If Len(anxinMall_Cache)=0 then anxinMall_Cache = Cache
If Len(anxinMall_Cache)=0 then anxinMall_Cache = 0
If Len(anxinMall_PageBreak)=0 then anxinMall_PageBreak = PageBreak Else anxinMall_PageBreak = replace(anxinMall_PageBreak,OOOOOO0O(ChrW(82)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(82)),OOOOOO0O(ChrW(76)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(78)))
If anxinMall_Cache<0 then anxinMall_Cache = 0
If Len(anxinMall_Page)=0 then anxinMall_Page = Page
If Len(anxinMall_Page)=0 then anxinMall_Page = 1 else anxinMall_Page = anxinMall.leachstr(anxinMall_Page,1)
If Len(anxinMall_Sql)=0 Then
anxinMall_Sql = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)) & anxinMall_Field & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)) & anxinMall_Table & OOOOOO0O(ChrW(32)&ChrW(44)) & anxinMall_Where & OOOOOO0O(ChrW(32)&ChrW(44)) & anxinMall_Order
End If
anxinMall_Sql = anxinMall.ReplaceExp(anxinMall_Sql,OOOOOO0O(ChrW(87)&ChrW(45)&ChrW(68)&ChrW(76)&ChrW(97)&ChrW(91)&ChrW(78)&ChrW(88)),OOOOOO0O(ChrW(32)&ChrW(44)))
If Len(anxinMall_Size)=0 then
If instr(anxinMall_Sql,OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)))>0 then
anxinMall_Size = anxinMall.InterExp(anxinMall_Sql,OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)),OOOOOO0O(ChrW(32)&ChrW(44)))
else
anxinMall_Size = 10
end if
End If
BackValue = ""
if anxinMall_Cache>0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(61)&ChrW(58)&ChrW(60)&ChrW(54)))=0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(84)))=0 then
if instr(anxinMall_Cache,OOOOOO0O(ChrW(89)))>0 then
anxinMall_Cache = clng(split(anxinMall_Cache,OOOOOO0O(ChrW(89)))(0)) * clng(split(anxinMall_Cache,OOOOOO0O(ChrW(89)))(1))
end if
BackValue = anxinMall.GetCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)) & anxinMall_Page,"",0)
anxinMall_RecordCount = anxinMall.GetCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)),"",0)
end If
if len(BackValue)=0 or len(anxinMall_RecordCount)=0 then
dim countsql,pagers,pagec
countsql = replace(anxinMall_Sql,anxinMall.interExp(anxinMall_Sql,OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)),OOOOOO0O(ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62))),OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87))&pageindex&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44)))
countsql = anxinMall.InterExp(countsql,"",OOOOOO0O(ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)))
set pagers=anxinMall.db(countsql,4)
anxinMall_RecordCount=pagers(0)
cfg_dataquery = cfg_dataquery + 1
pagers.close
set pagers=nothing
if(anxinMall_RecordCount>0) then
set pagers=anxinMall.db(anxinMall_Sql,1)
pagers.absoluteposition=pagers.absoluteposition+((abs(anxinMall_Page)-1)*anxinMall_Size)
Session(OOOOOO0O(ChrW(58))) = 0
For i = 1 To anxinMall_Size
If pagers.Eof Then Exit For
Session(OOOOOO0O(ChrW(58))) = Session(OOOOOO0O(ChrW(58))) + 1
BackValue = BackValue & Parser_Tags(OOOOOO0O(ChrW(45)&ChrW(44)&ChrW(33)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(46)), Loopstr, Pagers ,anxinMall_Sql)
pagers.MoveNext
Next
cfg_dataquery = cfg_dataquery + 1
pagers.close
set pagers=nothing
end if
if anxinMall_Cache>0 and len(BackValue)>0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(61)&ChrW(58)&ChrW(60)&ChrW(54)))=0 and instr(lcase(anxinMall_Sql),OOOOOO0O(ChrW(84)))=0 then
call anxinMall.AddCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)) & anxinMall_Page,BackValue,anxinMall_Cache)
call anxinMall.AddCache(Template & OOOOOO0O(ChrW(48)) & anxinMall_Sql & OOOOOO0O(ChrW(48)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)),anxinMall_RecordCount,anxinMall_Cache)
end if
end if
if(anxinMall_RecordCount mod anxinMall_Size=0)then
anxinMall_PageCount=int(anxinMall_RecordCount/anxinMall_Size)
else
anxinMall_PageCount=int(anxinMall_RecordCount/anxinMall_Size)+1
end if
Content = anxinMall.ReplaceStr(Content, Match.Value, BackValue)
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(78)),anxinMall_RecordCount)
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(93)&ChrW(33)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(114)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(78)),anxinMall_PageCount)
If anxinMall_PageCount = 0 Then anxinMall_PageCount = 1
Next
Dim GetPageList
if matches.count > 0 then
GetPageList = anxinMall.PageBreak(anxinMall_PageBreak,anxinMall_Page,5,anxinMall_PageCount)
end if
Content = anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(76)&ChrW(76)&ChrW(69)&ChrW(50)&ChrW(56)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(48)&ChrW(55)&ChrW(54)&ChrW(63)&ChrW(74)&ChrW(54)&ChrW(78)&ChrW(78)), GetPageList)
End Function
Public Function Parser_Tags(ByVal Pattern, ByVal Temp, ByVal Dat, ByVal sqlstr)
Dim Matches, Match
Dim Tagsstr, Tagsval, Tagsvalt, TagTitle: TagTitle = False
Dim anxinMall_ID, anxinMall_Empty, anxinMall_Template, anxinMall_Replace, anxinMall_Function,anxinMall_Width,anxinMall_Height
Dim anxinMall_Format,anxinMall_Left,anxinMall_Ext,anxinMall_Separator
Dim Re, Re1, Re2, turl
Dim i, c, l, t
sqlstr = lcase(sqlstr)
Reg.Pattern = Pattern
Set Matches = Reg.Execute(Temp)
For Each Match In Matches
Tagsstr = Match.SubMatches(0)
anxinMall_Function = GetAttr(Tagsstr, OOOOOO0O(ChrW(55)&ChrW(70)&ChrW(63)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)))
anxinMall_Format = GetAttr(Tagsstr, OOOOOO0O(ChrW(117)&ChrW(64)&ChrW(67)&ChrW(62)&ChrW(50)&ChrW(69)))
anxinMall_Left = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(123)&ChrW(54)&ChrW(55)&ChrW(69))),1)
anxinMall_Ext = GetAttr(Tagsstr, OOOOOO0O(ChrW(116)&ChrW(73)&ChrW(69)))
anxinMall_ID = GetAttr(Tagsstr, OOOOOO0O(ChrW(58)&ChrW(53)))
anxinMall_Empty = GetAttr(Tagsstr, OOOOOO0O(ChrW(54)&ChrW(62)&ChrW(65)&ChrW(69)&ChrW(74)))
anxinMall_Template = GetAttr(Tagsstr, OOOOOO0O(ChrW(69)&ChrW(54)&ChrW(62)&ChrW(65)&ChrW(61)&ChrW(50)&ChrW(69)&ChrW(54)))
anxinMall_Separator = GetAttr(Tagsstr, OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(65)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(69)&ChrW(64)&ChrW(67)))
anxinMall_Width = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(72)&ChrW(58)&ChrW(53)&ChrW(69)&ChrW(57))),1)
anxinMall_Height = anxinMall.leachstr(GetAttr(Tagsstr, OOOOOO0O(ChrW(57)&ChrW(54)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69))),1)
Tagsval = Split(Tagsstr, OOOOOO0O(ChrW(32)&ChrW(44)))(0)
Select Case LCase(Tagsval)
Case OOOOOO0O(ChrW(58))
Tagsval = Session(OOOOOO0O(ChrW(58)))
Case OOOOOO0O(ChrW(58)&ChrW(58))
Tagsval = Session(OOOOOO0O(ChrW(58)&ChrW(58)))
Case OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54))
if instr(sqlstr,OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(55)&ChrW(64)))>0 then
Tagsval = getinfoclass(Dat(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53))),OOOOOO0O(ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
elseif instr(sqlstr,OOOOOO0O(ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)))>0 then
Tagsval = getartclass(Dat(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53))),OOOOOO0O(ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
end if
Case OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(70)&ChrW(67)&ChrW(61))
if instr(sqlstr,OOOOOO0O(ChrW(44)&ChrW(62)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(51)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(68)&ChrW(46)))>0 then
Tagsval = anxinMall.GetInfoClassUrl(Dat(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53))),1,1)
elseif instr(sqlstr,OOOOOO0O(ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)&ChrW(46)))>0 then
Tagsval = anxinMall.GetArtClassUrl(Dat(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53))),1,1)
end if
Case OOOOOO0O(ChrW(53)&ChrW(50)&ChrW(69)&ChrW(50))
if instr(sqlstr,OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(58)&ChrW(63)&ChrW(55)&ChrW(64)&ChrW(48)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(50)))>0 then
Tagsval = anxinMall.getinfoaddfield(Dat(OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(55)&ChrW(64)&ChrW(58)&ChrW(53))),Dat(OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(58)&ChrW(53))),anxinMall_Empty,anxinMall_Template)
else
Tagsval = Dat(OOOOOO0O(ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
end if
Case OOOOOO0O(ChrW(70)&ChrW(67)&ChrW(61))
if instr(sqlstr,OOOOOO0O(ChrW(62)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(52)&ChrW(50)&ChrW(69)))>0 then
Tagsval = anxinMall.GetInfoClassUrl(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),1,1)
elseif instr(sqlstr,OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(62)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(51)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(68)&ChrW(32)&ChrW(44)))>0 or instr(sqlstr,OOOOOO0O(ChrW(44)&ChrW(62)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(51)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(68)&ChrW(46)))>0 then
Tagsval = anxinMall.getinfoviewurl(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),Dat(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53))),Dat(OOOOOO0O(ChrW(50)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54))),1)
elseif instr(sqlstr,OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)&ChrW(48)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)))>0 then
Tagsval = anxinMall.getartclassurl(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),1,1)
elseif instr(sqlstr,OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)&ChrW(32)&ChrW(44)))>0 or instr(sqlstr,OOOOOO0O(ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(69)&ChrW(58)&ChrW(52)&ChrW(61)&ChrW(54)&ChrW(46)))>0 then
Tagsval = anxinMall.getartviewurl(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),Dat(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53))),Dat(OOOOOO0O(ChrW(50)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54))),1)
end if
Case OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53))
if len(anxinMall_ID)>0 then
Tagsval = anxinMall.getinfoaddfield(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),anxinMall_ID,anxinMall_Empty,anxinMall_Template)
else
Tagsval = ""
end if
Case OOOOOO0O(ChrW(69)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61))
Tagsval = anxinMall.getinfototal(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),0)
Case OOOOOO0O(ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68))
Tagsval = Dat(OOOOOO0O(ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68)&ChrW(58)&ChrW(53)))
Case OOOOOO0O(ChrW(53)&ChrW(58)&ChrW(68)&ChrW(69)&ChrW(67)&ChrW(58)&ChrW(52)&ChrW(69))
Tagsval = getinfodistrict(Dat(OOOOOO0O(ChrW(53)&ChrW(58)&ChrW(68)&ChrW(69)&ChrW(67)&ChrW(58)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(53))),OOOOOO0O(ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
Case OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(69)&ChrW(67)&ChrW(64))
Tagsval = getdescription(Dat(OOOOOO0O(ChrW(115)&ChrW(54)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63))),500)
Case OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(54)&ChrW(61)&ChrW(53)&ChrW(68))
Tagsval = anxinMall_cls_content.getlistfield(Dat(OOOOOO0O(ChrW(58)&ChrW(53))),anxinMall_Separator,anxinMall_Template)
Case OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)),OOOOOO0O(ChrW(56)&ChrW(67)&ChrW(64)&ChrW(70)&ChrW(65)&ChrW(58)&ChrW(53)),OOOOOO0O(ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)),OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(56)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)),OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(56)&ChrW(58)&ChrW(65)),OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(50)&ChrW(61)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)),OOOOOO0O(ChrW(56)&ChrW(54)&ChrW(63)&ChrW(53)&ChrW(54)&ChrW(67)),OOOOOO0O(ChrW(50)&ChrW(71)&ChrW(50)&ChrW(69)&ChrW(50)&ChrW(67)),OOOOOO0O(ChrW(62)&ChrW(64)&ChrW(63)&ChrW(54)&ChrW(74)),OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54))
if instr(sqlstr,OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(55)&ChrW(64)))>0 then
if Dat(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))>0 then
dim rsuser
set rsuser = anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(54)&ChrW(62)&ChrW(51)&ChrW(54)&ChrW(67)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(46)&ChrW(108)) & Dat(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53))),1)
if not(rsuser.bof and rsuser.eof) then
Tagsval = rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
else
Tagsval = ""
end if
rsuser.close
set rsuser=nothing
else
Tagsval = ""
end if
end if
Case Else
Tagsval = Dat(Tagsval)
End Select
If Len(anxinMall_Function) > 0 Then
if instr(anxinMall_Function,OOOOOO0O(ChrW(111)&ChrW(62)&ChrW(54)))>0 then
Tagsval = replace(anxinMall_Function,OOOOOO0O(ChrW(111)&ChrW(62)&ChrW(54)),OOOOOO0O(ChrW(81))&Tagsval&OOOOOO0O(ChrW(81)))
else
Tagsval = replace(anxinMall_Function,OOOOOO0O(ChrW(69)&ChrW(57)&ChrW(58)&ChrW(68)),OOOOOO0O(ChrW(81))&Tagsval&OOOOOO0O(ChrW(81)))
end if
Execute(OOOOOO0O(ChrW(37)&ChrW(50)&ChrW(56)&ChrW(68)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(108)) & "" & Tagsval & "")
End If
If Len(anxinMall_Format) > 0 Then
if isdate(Tagsval) then
Tagsval = anxinMall.FormatDate(Tagsval,anxinMall_Format)
end if
End If
If Len(anxinMall_Left) > 0 Then
dim Ansi,Length
Length = 0
For i = 1 To Len(Tagsval)
Ansi = Abs(Asc(Mid(Tagsval, i, 1)))
If Ansi > 255 Or Ansi < 2 Then Length = Length + 2 Else Length = Length + 1
If Length >= anxinMall_Left Then Tagsval = Left(Tagsval, i) & anxinMall_Ext : Exit For
Next
End If
If len(anxinMall_Width) > 0 and len(anxinMall_Height) > 0 Then
Tagsval = anxinMall.ImageCut(Tagsval,"",anxinMall_Width,anxinMall_Height,0)
End If
If Len(anxinMall_Empty) > 0 Then
if isnull(Tagsval) or len(Tagsval)=0 then
Tagsval = anxinMall_Empty
end if
End If
if isnull(Tagsval) then
Tagsval = OOOOOO0O(ChrW(63)&ChrW(70)&ChrW(61)&ChrW(61))
end if
Temp = Replace(Temp, Match.Value, Tagsval)
Next
if instr(sqlstr,OOOOOO0O(ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(33)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(46)))>0 and instr(sqlstr,OOOOOO0O(ChrW(89)))>0 then
end if
Parser_Tags = Temp
End Function
Public Function Parser_IF()
On Error Resume Next
Dim Matches, Match,TestIF,TestVal,TestTrue,TestFalse
Reg.Pattern = OOOOOO0O(ChrW(76)&ChrW(58)&ChrW(55)&ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(78)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(76)&ChrW(54)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(55)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
TestVal=Match.SubMatches(1)
If Instr(LCase(TestVal),OOOOOO0O(ChrW(76)&ChrW(54)&ChrW(61)&ChrW(68)&ChrW(54)&ChrW(78)))>0 Then
TestVal=Replace(TestVal,OOOOOO0O(ChrW(76)&ChrW(54)&ChrW(61)&ChrW(68)&ChrW(54)&ChrW(78)),OOOOOO0O(ChrW(76)&ChrW(54)&ChrW(61)&ChrW(68)&ChrW(54)&ChrW(78)),1,-1,1)
TestTrue=Split(TestVal,OOOOOO0O(ChrW(76)&ChrW(54)&ChrW(61)&ChrW(68)&ChrW(54)&ChrW(78)))(0)
TestFalse=Split(TestVal,OOOOOO0O(ChrW(76)&ChrW(54)&ChrW(61)&ChrW(68)&ChrW(54)&ChrW(78)))(1)
Else
TestTrue=TestVal
TestFalse=""
End If
Execute (OOOOOO0O(ChrW(120)&ChrW(55)&ChrW(32)&ChrW(44)) & replace(Match.SubMatches(0),OOOOOO0O(ChrW(86)),OOOOOO0O(ChrW(81))) & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(37)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(37)&ChrW(54)&ChrW(68)&ChrW(69)&ChrW(120)&ChrW(55)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)&ChrW(37)&ChrW(67)&ChrW(70)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(116)&ChrW(61)&ChrW(68)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(37)&ChrW(54)&ChrW(68)&ChrW(69)&ChrW(120)&ChrW(55)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)&ChrW(117)&ChrW(50)&ChrW(61)&ChrW(68)&ChrW(54)))
If TestIF Then
Content = Replace(Content, Match.Value, TestTrue)
Else
Content = Replace(Content, Match.Value, TestFalse)
End If
If Err Then Err.Clear
Next
End Function
Public Function Parser_ASP()
On Error Resume Next
Dim Matches, Match, TestVal , result
Reg.Pattern = OOOOOO0O(ChrW(45)&ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(45)&ChrW(78)&ChrW(87)&ChrW(44)&ChrW(45)&ChrW(68)&ChrW(45)&ChrW(36)&ChrW(-243)&ChrW(46)&ChrW(89)&ChrW(110)&ChrW(88)&ChrW(45)&ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(45)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
TestVal=lcase(Match.SubMatches(0))
if instr(TestVal,OOOOOO0O(ChrW(111)&ChrW(62)&ChrW(54)))>0 then
TestVal = Replace(TestVal,OOOOOO0O(ChrW(111)&ChrW(62)&ChrW(54)),OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(68)&ChrW(70)&ChrW(61)&ChrW(69)))
else
TestVal = Replace(TestVal,OOOOOO0O(ChrW(69)&ChrW(57)&ChrW(58)&ChrW(68)),OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(68)&ChrW(70)&ChrW(61)&ChrW(69)))
end if
TestVal = Replace(TestVal,OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(68)&ChrW(65)&ChrW(64)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(93)&ChrW(72)&ChrW(67)&ChrW(58)&ChrW(69)&ChrW(54)),OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(68)&ChrW(70)&ChrW(61)&ChrW(69)&ChrW(108)))
Execute (TestVal)
if len(result)>0 then
Content = Replace(Content, Match.Value, result)
else
Content = Replace(Content, Match.Value, "")
end if
If Err Then Err.Clear
Next
End Function
Public Function RegExists(ByVal Pattern, ByVal TestContent)
Reg.Pattern = Pattern
RegExists = Reg.Test(TestContent)
End Function
Public Function ArrayExists(ByVal Arraystr)
On Error Resume Next
dim testarray : testarray = false
execute(OOOOOO0O(ChrW(69)&ChrW(54)&ChrW(68)&ChrW(69)&ChrW(50)&ChrW(67)&ChrW(67)&ChrW(50)&ChrW(74)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(68)&ChrW(50)&ChrW(67)&ChrW(67)&ChrW(50)&ChrW(74)&ChrW(87))&Arraystr&OOOOOO0O(ChrW(88)))
if err then err.clear
ArrayExists = testarray
End Function
Public Function GetAttr(ByVal Tagsstr, ByVal AttrName)
If Len(Tagsstr) <= 3 Or InStr(LCase(Tagsstr), OOOOOO0O(ChrW(83)) & LCase(AttrName) & OOOOOO0O(ChrW(108))) = 0 Then GetAttr = "" : Exit Function
Dim Matches, Match
Reg.Pattern = OOOOOO0O(ChrW(45)&ChrW(83)) & AttrName & OOOOOO0O(ChrW(108)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(45)&ChrW(83))
Set Matches = Reg.Execute(Tagsstr & OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(83)))
For Each Match In Matches
GetAttr = Match.SubMatches(0)
Next
End Function
Public Function LoadTemplate()
Content =anxinMall.GetCache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48))&Template,"",0)
if Content="" then
Content=anxinMall.LoadFile(Template)
if cfg_cachetime(0)>0 then
call anxinMall.AddCache(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(48))&Template,Content,cfg_cachetime(0))
end if
end if
Content=anxinMall.ReplaceExp(Content, OOOOOO0O(ChrW(107)) & OOOOOO0O(ChrW(80)&ChrW(92)&ChrW(92)&ChrW(82)&ChrW(58)&ChrW(63)&ChrW(52)&ChrW(61)&ChrW(70)&ChrW(53)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(108)&ChrW(81)&ChrW(87)&ChrW(93)&ChrW(94)&ChrW(88)&ChrW(89)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(81)&ChrW(92)&ChrW(92)&ChrW(109)), OOOOOO0O(ChrW(76)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(105)&ChrW(83)&ChrW(97)&ChrW(78)))
If InStr(Content, OOOOOO0O(ChrW(76)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(105))) > 0 Then
Dim Match, Matches, FileBody,FilePath
Reg.Pattern = OOOOOO0O(ChrW(76)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(105)&ChrW(87)&ChrW(93)&ChrW(90)&ChrW(110)&ChrW(88)&ChrW(78))
Set Matches = Reg.Execute(Content)
For Each Match In Matches
FilePath= Match.SubMatches(0)
FileBody = LoadSubFile(FilePath)
Content = Replace(Content, Match.Value,FileBody)
Next
End If
Content = Replace(Replace(Content,OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)),OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54))),OOOOOO0O(ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)),OOOOOO0O(ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)))
Content = Replace(Replace(Content,OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(50)&ChrW(68)&ChrW(65)),OOOOOO0O(ChrW(76)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(50)&ChrW(68)&ChrW(65))),OOOOOO0O(ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(105)&ChrW(50)&ChrW(68)&ChrW(65)),OOOOOO0O(ChrW(76)&ChrW(94)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(97)&ChrW(105)&ChrW(50)&ChrW(68)&ChrW(65)))
Content = Replace(Content, OOOOOO0O(ChrW(76)&ChrW(69)&ChrW(50)&ChrW(56)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(78)), OOOOOO0O(ChrW(76)&ChrW(76)&ChrW(69)&ChrW(50)&ChrW(56)&ChrW(105)&ChrW(65)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(48)&ChrW(55)&ChrW(54)&ChrW(63)&ChrW(74)&ChrW(54)&ChrW(78)&ChrW(78)))
Content = replace(Content,OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61)&ChrW(109)),OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61)&ChrW(109)))
End Function
Public Function LoadSubFile(byval vpath)
LoadSubFile = anxinMall.GetCache(OOOOOO0O(ChrW(68)&ChrW(70)&ChrW(51)&ChrW(48)) & vpath,"",0)
if LoadSubFile="" then
LoadSubFile=anxinMall.LoadFile(cfg_templatedir & OOOOOO0O(ChrW(94)) &  vpath)
call anxinMall.AddCache(OOOOOO0O(ChrW(68)&ChrW(70)&ChrW(51)&ChrW(48)) & vpath,LoadSubFile,cfg_cachetime(0))
end if
end Function
End Class
%>
<!--#include file="global.asp"-->