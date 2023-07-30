<%

Class Email
function isvalidemail(email)
dim names,name,i,c
isvalidemail=true
names=split(email,OOOOOO0O(ChrW(111)))
if ubound(names)<>1 then
isvalidemail=false
exit function
end if
for each name in names
if len(name)<=0 then
isvalidemail=false
exit function
end if
for i=1 to len(name)
c=lcase(mid(name,i,1))
if instr(OOOOOO0O(ChrW(50)&ChrW(51)&ChrW(52)&ChrW(53)&ChrW(54)&ChrW(55)&ChrW(56)&ChrW(57)&ChrW(58)&ChrW(59)&ChrW(60)&ChrW(61)&ChrW(62)&ChrW(63)&ChrW(64)&ChrW(65)&ChrW(66)&ChrW(67)&ChrW(68)&ChrW(69)&ChrW(70)&ChrW(71)&ChrW(72)&ChrW(73)&ChrW(74)&ChrW(75)&ChrW(48)&ChrW(92)&ChrW(93)), c)<=0 and not isnumeric(c) then
isvalidemail=false
exit function
end if
next
if left(name,1)=OOOOOO0O(ChrW(93)) or right(name,1)=OOOOOO0O(ChrW(93)) then
isvalidemail=false
exit function
end if
next
if instr(names(1),OOOOOO0O(ChrW(93)))<=0 then
isvalidemail=false
exit function
end if
i=len(names(1))- instrrev(names(1),OOOOOO0O(ChrW(93)))
if i<>2 and i<>3 then
isvalidemail=false
exit function
end if
if instr(email,OOOOOO0O(ChrW(93)&ChrW(93)))>0 then
isvalidemail=false
end if
end function
Function Jmail(mailTo,mailTopic,mailBody,mailCharset,mailContentType)
Dim ConstFromNameCn,ConstFromNameEn,ConstFrom,ConstMailDomain,ConstMailServerUserName,ConstMailServerPassword
ConstFromNameCn = cfg_sitename
ConstFromNameEn = cfg_siteurl
ConstMailDomain = cfg_sendmail(1)
ConstFrom = cfg_sendmail(2)
ConstMailServerUserName = cfg_sendmail(3)
ConstMailServerPassword = cfg_sendmail(4)
On Error Resume Next
Dim myJmail
Set myJmail = Server.CreateObject(OOOOOO0O(ChrW(121)&ChrW(124)&ChrW(50)&ChrW(58)&ChrW(61)&ChrW(93)&ChrW(124)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(50)&ChrW(56)&ChrW(54)))
myJmail.Logging = False
myJmail.ISOEncodeHeaders = False
myJmail.ContentTransferEncoding = OOOOOO0O(ChrW(51)&ChrW(50)&ChrW(68)&ChrW(54)&ChrW(101)&ChrW(99))
myJmail.AddHeader OOOOOO0O(ChrW(33)&ChrW(67)&ChrW(58)&ChrW(64)&ChrW(67)&ChrW(58)&ChrW(69)&ChrW(74)),"3"
myJmail.AddHeader OOOOOO0O(ChrW(124)&ChrW(36)&ChrW(-243)&ChrW(124)&ChrW(50)&ChrW(58)&ChrW(61)&ChrW(92)&ChrW(33)&ChrW(67)&ChrW(58)&ChrW(64)&ChrW(67)&ChrW(58)&ChrW(69)&ChrW(74)),OOOOOO0O(ChrW(125)&ChrW(64)&ChrW(67)&ChrW(62)&ChrW(50)&ChrW(61))
myJmail.AddHeader OOOOOO0O(ChrW(124)&ChrW(50)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(67)),OOOOOO0O(ChrW(124)&ChrW(58)&ChrW(52)&ChrW(67)&ChrW(64)&ChrW(68)&ChrW(64)&ChrW(55)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(126)&ChrW(70)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(64)&ChrW(60)&ChrW(32)&ChrW(44)&ChrW(116)&ChrW(73)&ChrW(65)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(101)&ChrW(93)&ChrW(95)&ChrW(95)&ChrW(93)&ChrW(97)&ChrW(103)&ChrW(95)&ChrW(95)&ChrW(93)&ChrW(96)&ChrW(99)&ChrW(98)&ChrW(102))
myJmail.AddHeader OOOOOO0O(ChrW(124)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(126)&ChrW(123)&ChrW(116)),OOOOOO0O(ChrW(33)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(70)&ChrW(52)&ChrW(54)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(113)&ChrW(74)&ChrW(32)&ChrW(44)&ChrW(124)&ChrW(58)&ChrW(52)&ChrW(67)&ChrW(64)&ChrW(68)&ChrW(64)&ChrW(55)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(124)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(126)&ChrW(123)&ChrW(116)&ChrW(32)&ChrW(44)&ChrW(39)&ChrW(101)&ChrW(93)&ChrW(95)&ChrW(95)&ChrW(93)&ChrW(97)&ChrW(103)&ChrW(95)&ChrW(95)&ChrW(93)&ChrW(96)&ChrW(99)&ChrW(99)&ChrW(96))
myJmail.Charset = mailCharset
myJmail.ContentType = mailContentType
If UCase(mailCharset) = OOOOOO0O(ChrW(118)&ChrW(113)&ChrW(97)&ChrW(98)&ChrW(96)&ChrW(97)) Then
myJmail.FromName = ConstFromNameCn
Else
myJmail.FromName = ConstFromNameEn
End If
myJmail.From = ConstFrom
myJmail.Subject = mailTopic
myJmail.Body = mailBody
myJmail.AddRecipient mailTo
myJmail.MailDomain = ConstMailDomain
myJmail.MailServerUserName = ConstMailServerUserName
myJmail.MailServerPassword = ConstMailServerPassword
myJmail.Send ConstMailDomain
myJmail.Close
Set myJmail=nothing
If Err Then
Jmail=Err.Description
Err.Clear
Else
Jmail=OOOOOO0O(ChrW(126)&ChrW(122))
End If
On Error Goto 0
End Function
sub Sendemail(user_email,sendEmailtitle,sendEmailcontent)
if isvalidemail(user_email)=false then
call anxinmall.alert(OOOOOO0O(ChrW(-28503)&ChrW(64)&ChrW(31660)&ChrW(64)&ChrW(26679)&ChrW(64)&ChrW(24330)&ChrW(64)&ChrW(19976)&ChrW(64)&ChrW(27486)&ChrW(64)&ChrW(30825)&ChrW(64)&ChrW(80)),OOOOOO0O(ChrW(51)&ChrW(50)&ChrW(52)&ChrW(60)))
end if
dim sendstat
if IsObjInstalled(OOOOOO0O(ChrW(121)&ChrW(124)&ChrW(50)&ChrW(58)&ChrW(61)&ChrW(93)&ChrW(124)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(50)&ChrW(56)&ChrW(54))) =True then
SendStat = Jmail(user_email,sendEmailtitle,OOOOOO0O(ChrW(107)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61)&ChrW(109)&ChrW(107)&ChrW(57)&ChrW(54)&ChrW(50)&ChrW(53)&ChrW(109)&ChrW(107)&ChrW(62)&ChrW(54)&ChrW(69)&ChrW(50)&ChrW(32)&ChrW(44)&ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)&ChrW(92)&ChrW(54)&ChrW(66)&ChrW(70)&ChrW(58)&ChrW(71)&ChrW(108)&ChrW(81)&ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(92)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(81)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(108)&ChrW(81)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(94)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61)&ChrW(106)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(57)&ChrW(50)&ChrW(67)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(108)&ChrW(56)&ChrW(51)&ChrW(97)&ChrW(98)&ChrW(96)&ChrW(97)&ChrW(81)&ChrW(109)&ChrW(107)&ChrW(69)&ChrW(58)&ChrW(69)&ChrW(61)&ChrW(54)&ChrW(109))&sendEmailtitle&OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(69)&ChrW(58)&ChrW(69)&ChrW(61)&ChrW(54)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(57)&ChrW(54)&ChrW(50)&ChrW(53)&ChrW(109)&ChrW(107)&ChrW(51)&ChrW(64)&ChrW(53)&ChrW(74)&ChrW(109))&sendEmailcontent&OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(51)&ChrW(64)&ChrW(53)&ChrW(74)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61)&ChrW(109)),OOOOOO0O(ChrW(118)&ChrW(113)&ChrW(97)&ChrW(98)&ChrW(96)&ChrW(97)),OOOOOO0O(ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(94)&ChrW(57)&ChrW(69)&ChrW(62)&ChrW(61)))
end if
call anxinmall.alert(OOOOOO0O(ChrW(-28503)&ChrW(64)&ChrW(20209)&ChrW(64)&ChrW(24045)&ChrW(64)&ChrW(32458)&ChrW(64)&ChrW(21452)&ChrW(64)&ChrW(-28676)&ChrW(64)&ChrW(21035)&ChrW(64)&ChrW(105))&user_email&OOOOOO0O(ChrW(91)&ChrW(-29710)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(-28503)&ChrW(64)&ChrW(31660)&ChrW(64)&ChrW(26592)&ChrW(64)&ChrW(30470)&ChrW(64)&ChrW(80)),OOOOOO0O(ChrW(51)&ChrW(50)&ChrW(52)&ChrW(60)))
End sub
End Class
%>
<!--#include file="global.asp"-->