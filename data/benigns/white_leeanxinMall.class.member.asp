<%

Class Cls_Member
Private Sub Class_Initialize()
End Sub
Private Sub Class_Terminate()
End Sub
function checkuser()
dim fromurl
fromurl = anxinMall.geturl()
if not checkuserstatus then
if instr(fromurl,OOOOOO0O(ChrW(62)&ChrW(93)&ChrW(50)&ChrW(68)&ChrW(65)))>0 then
call anxinMall.message(OOOOOO0O(ChrW(27804)&ChrW(64)&ChrW(26372)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(25105)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(-29312)&ChrW(64)&ChrW(26097)&ChrW(64)),2,cfg_baseurl & OOOOOO0O(ChrW(94)&ChrW(62)&ChrW(93)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(110)&ChrW(50)&ChrW(108)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))
else
call anxinMall.message(OOOOOO0O(ChrW(27804)&ChrW(64)&ChrW(26372)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(25105)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(-29312)&ChrW(64)&ChrW(26097)&ChrW(64)),2,cfg_baseurl & OOOOOO0O(ChrW(94)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(94)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(110)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(70)&ChrW(67)&ChrW(61)&ChrW(108))&server.URLEncode(anxinMall.geturl()))
end if
end if
end function
function checklogin(byref userid,byref username,byval userPassWord,byval do_session,byval memory)
checklogin = 0
if userid="" and username="" then exit function
dim sqluser
dim reglx
dim vipdate
if userid<>"" then
sqluser = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)&ChrW(108))&userid
else
sqluser = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&username&OOOOOO0O(ChrW(86))
end if
dim rsuser
set rsuser=anxinMall.db(sqluser,3)
if rsuser.eof and rsuser.bof then
checklogin = -1
else
if cstr(rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53))))=anxinMall.md5(cstr(userPassWord),16) or cstr(rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53))))=anxinMall.md5(cstr(userPassWord),32) or cstr(rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53))))=userPassWord then
userid = rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))
username = rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
reglx = rsuser(OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(56)&ChrW(61)&ChrW(73)))
checklogin = 1
if do_session=1 then
dim areaid : areaid =rsuser(OOOOOO0O(ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(58)&ChrW(53)))
dim yucun : yucun = rsuser(OOOOOO0O(ChrW(74)&ChrW(70)&ChrW(52)&ChrW(70)&ChrW(63)))
dim jifen : jifen = rsuser(OOOOOO0O(ChrW(59)&ChrW(58)&ChrW(55)&ChrW(54)&ChrW(63)))
dim lastlogin : lastlogin = rsuser(OOOOOO0O(ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))
dim logins : logins = rsuser(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))
dim userzhenshiname : userzhenshiname = rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(75)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(68)&ChrW(57)&ChrW(58)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
dim usertel : usertel = rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(54)&ChrW(61)))
dim face : face = rsuser(OOOOOO0O(ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))
dim oicq : oicq = rsuser(OOOOOO0O(ChrW(64)&ChrW(58)&ChrW(52)&ChrW(66)))
if isnull(face) then face=OOOOOO0O(ChrW(94)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(94)&ChrW(70)&ChrW(65)&ChrW(61)&ChrW(64)&ChrW(50)&ChrW(53)&ChrW(94)&ChrW(63)&ChrW(64)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(93)&ChrW(59)&ChrW(65)&ChrW(56))
dim userEmail
if rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))<>"" and not isnull(rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))) then
userEmail =rsuser(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))
else
userEmail=""
end if
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53))) = userid
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54))) = username
s_userid = userid
s_username = username
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(58)&ChrW(53)))=areaid
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))=userid
select case reglx
case 1
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(67)&ChrW(54)&ChrW(56)&ChrW(61)&ChrW(73)))=OOOOOO0O(ChrW(26217)&ChrW(64)&ChrW(-28651)&ChrW(64)&ChrW(20245)&ChrW(64)&ChrW(21587)&ChrW(64))
case 2
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(67)&ChrW(54)&ChrW(56)&ChrW(61)&ChrW(73)))=OOOOOO0O(ChrW(-25901)&ChrW(64)&ChrW(32418)&ChrW(64)&ChrW(20245)&ChrW(64)&ChrW(21587)&ChrW(64))
case 3
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(67)&ChrW(54)&ChrW(56)&ChrW(61)&ChrW(73)))=OOOOOO0O(ChrW(39)&ChrW(120)&ChrW(33)&ChrW(20245)&ChrW(64)&ChrW(21587)&ChrW(64))
end select
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=username
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)))=userPassWord
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(74)&ChrW(70)&ChrW(52)&ChrW(70)&ChrW(63)))=rsuser(OOOOOO0O(ChrW(74)&ChrW(70)&ChrW(52)&ChrW(70)&ChrW(63)))
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(59)&ChrW(58)&ChrW(55)&ChrW(54)&ChrW(63)))=rsuser(OOOOOO0O(ChrW(59)&ChrW(58)&ChrW(55)&ChrW(54)&ChrW(63)))
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(116)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))=userEmail
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(54)))=rsuser(OOOOOO0O(ChrW(50)&ChrW(53)&ChrW(53)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(54)))
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))=rsuser(OOOOOO0O(ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=anxinMall.iif(logins<>"",logins,0)
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))=face
Response.Cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67))).Expires=date+30
if face<>"" then
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))=face
else
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))=OOOOOO0O(ChrW(93)&ChrW(93)&ChrW(94)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(94)&ChrW(70)&ChrW(65)&ChrW(61)&ChrW(64)&ChrW(50)&ChrW(53)&ChrW(94)&ChrW(63)&ChrW(64)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(93)&ChrW(59)&ChrW(65)&ChrW(56))
end if
if userzhenshiname<>"" then response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(75)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(68)&ChrW(57)&ChrW(58)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=userzhenshiname
if usertel<>"" then response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(54)&ChrW(61)))=usertel
if oicq<>"" then response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(64)&ChrW(58)&ChrW(52)&ChrW(66)))=oicq
if memory=1 then
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67))).Expires = date() + 365
end if
end if
else
checklogin = -2
end if
rsuser(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=rsuser(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))+1
rsuser(OOOOOO0O(ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))=now()
if anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87)&ChrW(89)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&username&OOOOOO0O(ChrW(86)),2)(0)>0 then
call anxinMall.db(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(108)&ChrW(82))&now()&OOOOOO0O(ChrW(82)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&username&OOOOOO0O(ChrW(86)),0)
call anxinMall.db(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)&ChrW(108)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)&ChrW(90)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&username&OOOOOO0O(ChrW(86)),0)
end if
rsuser.update()
rsuser.close
set rsuser=nothing
end if
end function
function checkmyuser()
dim fromurl
fromurl = anxinMall.geturl()
if not checkmyuserstatus then
call anxinMall.message(OOOOOO0O(ChrW(27804)&ChrW(64)&ChrW(26372)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(25105)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(-29312)&ChrW(64)&ChrW(26097)&ChrW(64)),2,cfg_baseurl & OOOOOO0O(ChrW(94)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(94)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(48)&ChrW(68)&ChrW(59)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(110)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(70)&ChrW(67)&ChrW(61)&ChrW(108))&server.URLEncode(anxinMall.geturl()))
end if
end function
function checkmylogin(byref userid,byref username,byval userPassWord,byval do_session,byval memory)
checkmylogin = 0
if userid="" and username="" then exit function
dim sqlmy
if userid<>"" then
sqlmy = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)&ChrW(108))&userid
else
sqlmy = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&username&OOOOOO0O(ChrW(86))
end if
dim rsmy
set rsmy=anxinMall.db(sqlmy,3)
if rsmy.eof and rsmy.bof then
checkmylogin = -1
else
if cstr(rsmy(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53))))=cstr(userPassWord) then
userid = rsmy(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))
username = rsmy(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))
checkmylogin = 1
if do_session=1 then
dim actionTotal : actionTotal = anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(58)&ChrW(53)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(70)&ChrW(62)&ChrW(48)&ChrW(53)&ChrW(58)&ChrW(63)&ChrW(56)&ChrW(53)&ChrW(50)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(50)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(75)&ChrW(57)&ChrW(70)&ChrW(50)&ChrW(63)&ChrW(56)&ChrW(69)&ChrW(50)&ChrW(58)&ChrW(107)&ChrW(101)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(58)&ChrW(53)&ChrW(108))&userid,2)(0)
dim newscount : newscount = anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87)&ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68)&ChrW(58)&ChrW(53)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(70)&ChrW(62)&ChrW(48)&ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(64)&ChrW(65)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(58)&ChrW(53)&ChrW(108))&userid,2)(0)
dim productcount : productcount = anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87)&ChrW(65)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(120)&ChrW(53)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(70)&ChrW(62)&ChrW(48)&ChrW(65)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(70)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(33)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(57)&ChrW(59)&ChrW(58)&ChrW(50)&ChrW(58)&ChrW(53)&ChrW(108))&userid,2)(0)
dim classid : classid =rsmy(OOOOOO0O(ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)))
dim areaid : areaid =rsmy(OOOOOO0O(ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(58)&ChrW(53)))
dim flag : flag = rsmy(OOOOOO0O(ChrW(55)&ChrW(61)&ChrW(50)&ChrW(56)))
dim lx : lx = rsmy(OOOOOO0O(ChrW(61)&ChrW(73)))
dim tj : tj = rsmy(OOOOOO0O(ChrW(69)&ChrW(59)))
dim logins : logins =rsmy(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))
dim adddate : adddate =rsmy(OOOOOO0O(ChrW(50)&ChrW(53)&ChrW(53)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)))
dim userlastIP : userlastIP =rsmy(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(120)&ChrW(33)))
dim lastlogin : lastlogin=rsmy(OOOOOO0O(ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))
dim zifubao : zifubao = rsmy(OOOOOO0O(ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)))
dim zifubao_pwd : zifubao_pwd = rsmy(OOOOOO0O(ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(48)&ChrW(65)&ChrW(72)&ChrW(53)))
dim zifubao_hezuoid : zifubao_hezuoid = rsmy(OOOOOO0O(ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(48)&ChrW(57)&ChrW(54)&ChrW(75)&ChrW(70)&ChrW(64)&ChrW(58)&ChrW(53)))
dim taobaowangwang : taobaowangwang = rsmy(OOOOOO0O(ChrW(69)&ChrW(50)&ChrW(64)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(72)&ChrW(50)&ChrW(63)&ChrW(56)&ChrW(72)&ChrW(50)&ChrW(63)&ChrW(56)))
dim useremail :useremail = rsmy(OOOOOO0O(ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))
dim oicq : oicq = rsmy(OOOOOO0O(ChrW(64)&ChrW(58)&ChrW(52)&ChrW(66)))
dim tel : tel =rsmy(OOOOOO0O(ChrW(69)&ChrW(54)&ChrW(61)))
dim color : color =rsmy(OOOOOO0O(ChrW(52)&ChrW(64)&ChrW(61)&ChrW(64)&ChrW(67)))
dim content : content =rsmy(OOOOOO0O(ChrW(52)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)))
dim logo : logo = rsmy(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(64)))
dim logoda : logoda = rsmy(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(64)&ChrW(53)&ChrW(50)))
if isnull(logins) then logins="1"
if isnull(zifubao) then zifubao=""
if isnull(zifubao_pwd) then zifubao_pwd=""
if isnull(zifubao_hezuoid) then zifubao_hezuoid=""
if isnull(taobaowangwang) then taobaowangwang=""
if isnull(useremail) then useremail=""
if isnull(oicq) then oicq=""
if isnull(tel) then tel=""
if isnull(content) then content=""
if isnull(color) then color=OOOOOO0O(ChrW(50)&ChrW(50))
if isnull(logo) then logo=""
if isnull(logoda) then logoda=""
if isnull(lx) then lx=""
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53))) = userid
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54))) = username
s_my_userid = userid
s_my_username = username
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(58)&ChrW(53)))=areaid
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(52)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(53)))=classid
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))=userid
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=username
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)))=userPassWord
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(61)&ChrW(50)&ChrW(56)))=flag
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(73)))=lx
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(69)&ChrW(59)))=tj
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(54)))=adddate
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(37)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61)))=actionTotal
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(68)&ChrW(70)&ChrW(62)&ChrW(48)&ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68)))=newscount
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(65)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(70)&ChrW(52)&ChrW(69)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)))=productcount
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))=lastlogin
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(120)&ChrW(33)))=userlastIP
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=logins
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)))=zifubao
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(48)&ChrW(65)&ChrW(72)&ChrW(53)))=zifubao_pwd
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(48)&ChrW(57)&ChrW(54)&ChrW(75)&ChrW(70)&ChrW(64)&ChrW(58)&ChrW(53)))=zifubao_hezuoid
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(69)&ChrW(50)&ChrW(64)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(72)&ChrW(50)&ChrW(63)&ChrW(56)&ChrW(72)&ChrW(50)&ChrW(63)&ChrW(56)))=taobaowangwang
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(52)&ChrW(64)&ChrW(61)&ChrW(64)&ChrW(67)))=color
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(64)))=logo
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(64)&ChrW(53)&ChrW(50)))=logoda
Response.Cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74))).Expires=date+30
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)))=content
if logo2<>"" then
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))=logo2
else
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))=OOOOOO0O(ChrW(94)&ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)&ChrW(94)&ChrW(70)&ChrW(65)&ChrW(61)&ChrW(64)&ChrW(50)&ChrW(53)&ChrW(94)&ChrW(63)&ChrW(64)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)&ChrW(93)&ChrW(59)&ChrW(65)&ChrW(56))
end if
if useremail<>"" then response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))=useremail
if tel<>"" then response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(61)))=tel
if oicq<>"" then response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(64)&ChrW(58)&ChrW(52)&ChrW(66)))=oicq
if memory=1 then
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74))).Expires = date() + 365
end if
end if
else
checkmylogin = -2
end if
rsmy(OOOOOO0O(ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=cdbl(logins)+1
rsmy(OOOOOO0O(ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))=now()
rsmy.update()
rsmy.close
set rsmy=nothing
end if
end function
function checkmyuserstatus()
checkmyuserstatus = true
if s_my_userid="" or s_my_userid="0" then
checkmyuserstatus = false
if (c_my_userid<>"" or c_my_username<>"") and c_my_userPassWord<>"" then
dim login : login = anxinMall_cls_member_my.checkmylogin(c_my_userid,c_my_username,c_my_userPassWord,1,1)
if login>0 then
checkmyuserstatus = true
s_my_userid = c_my_userid
else
call clearmyusersession()
end if
end if
end if
end function
function checkuserstatus()
checkuserstatus = true
if s_userid="" or s_userid="0" then
checkuserstatus = false
if (c_userid<>"" or c_username<>"") and c_userPassWord<>"" then
dim login : login = anxinMall.checklogin(c_userid,c_username,c_userPassWord,1,1)
if login>0 then
checkuserstatus = true
s_userid = c_userid
else
call clearusersession()
end if
end if
end if
end function
function clearusersession()
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53))) = ""
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(56)&ChrW(67)&ChrW(64)&ChrW(70)&ChrW(65)&ChrW(58)&ChrW(53))) = ""
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54))) = ""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(74)&ChrW(70)&ChrW(52)&ChrW(70)&ChrW(63)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(54)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(75)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(68)&ChrW(57)&ChrW(58)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(54)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(64)&ChrW(58)&ChrW(52)&ChrW(66)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(37)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(67)&ChrW(54)&ChrW(56)&ChrW(61)&ChrW(73)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(37)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(68)&ChrW(57)&ChrW(64)&ChrW(70)&ChrW(52)&ChrW(50)&ChrW(63)&ChrW(56)&ChrW(37)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(51)&ChrW(70)&ChrW(74)&ChrW(37)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(56)&ChrW(58)&ChrW(55)&ChrW(69)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(59)&ChrW(58)&ChrW(55)&ChrW(54)&ChrW(63)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(58)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67))).Expires = date() -1
end function
function clearmyusersession()
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))=""
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=""
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(52)&ChrW(64)&ChrW(61)&ChrW(64)&ChrW(67)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(58)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(58)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(61)&ChrW(50)&ChrW(56)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(73)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(69)&ChrW(59)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(53)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(54)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(50)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(37)&ChrW(64)&ChrW(69)&ChrW(50)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(68)&ChrW(70)&ChrW(62)&ChrW(48)&ChrW(63)&ChrW(54)&ChrW(72)&ChrW(68)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(65)&ChrW(67)&ChrW(64)&ChrW(53)&ChrW(70)&ChrW(52)&ChrW(69)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(62)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(63)&ChrW(54)&ChrW(72)&ChrW(62)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(120)&ChrW(33)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(55)&ChrW(50)&ChrW(52)&ChrW(54)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(62)&ChrW(50)&ChrW(58)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(61)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(64)&ChrW(58)&ChrW(52)&ChrW(66)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(61)&ChrW(50)&ChrW(68)&ChrW(69)&ChrW(120)&ChrW(33)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(68)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(68)&ChrW(75)&ChrW(68)&ChrW(57)&ChrW(54)&ChrW(63)&ChrW(56)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(68)&ChrW(75)&ChrW(68)&ChrW(57)&ChrW(58)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(68)&ChrW(75)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(74)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(48)&ChrW(65)&ChrW(72)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(75)&ChrW(58)&ChrW(55)&ChrW(70)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(48)&ChrW(57)&ChrW(54)&ChrW(75)&ChrW(70)&ChrW(64)&ChrW(58)&ChrW(53)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74)))(OOOOOO0O(ChrW(52)&ChrW(48)&ChrW(69)&ChrW(50)&ChrW(64)&ChrW(51)&ChrW(50)&ChrW(64)&ChrW(72)&ChrW(50)&ChrW(63)&ChrW(56)&ChrW(72)&ChrW(50)&ChrW(63)&ChrW(56)))=""
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(62)&ChrW(74)&ChrW(48)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)))=""
response.cookies(OOOOOO0O(ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(62)&ChrW(74))).Expires = date() -1
end function
function checkadmin()
dim login
login = false
if s_adminname="" then
if c_adminname<>"" and c_adminpsw<>"" then
if cstr(c_adminname)=cstr(cfg_adminname) and cstr(c_adminpsw)=cstr(cfg_adminpassword) then
session(OOOOOO0O(ChrW(68)&ChrW(48)&ChrW(50)&ChrW(53)&ChrW(62)&ChrW(58)&ChrW(63)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)))=c_adminname
login = true
end if
end if
if login=false then
response.Write OOOOOO0O(ChrW(107)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(81)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(94)&ChrW(59)&ChrW(50)&ChrW(71)&ChrW(50)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(81)&ChrW(109)&ChrW(50)&ChrW(61)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(87)&ChrW(86)&ChrW(27804)&ChrW(64)&ChrW(26372)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(25105)&ChrW(64)&ChrW(30326)&ChrW(64)&ChrW(24400)&ChrW(64)&ChrW(-29312)&ChrW(64)&ChrW(26097)&ChrW(64)&ChrW(86)&ChrW(88)&ChrW(106)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(93)&ChrW(61)&ChrW(64)&ChrW(52)&ChrW(50)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(108)&ChrW(86)&ChrW(61)&ChrW(64)&ChrW(56)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(86)&ChrW(107)&ChrW(94)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(109))
response.End()
end if
end if
end function
function getuserplus()
dim plusroot, dir, plus, i, html
dim arr()
on error resume next
set Plus = New Cls_Plus
set plusroot = fso.getfolder(server.mappath(cfg_sitedir & OOOOOO0O(ChrW(94)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(68))))
i=1
for each dir in plusroot.subfolders
Call Plus.Open(dir.name)
if Len(Plus.Member(OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54)))) > 0 And Plus.Config(OOOOOO0O(ChrW(68)&ChrW(69)&ChrW(50)&ChrW(69)&ChrW(54)))=1 then
html = html & OOOOOO0O(ChrW(107)&ChrW(61)&ChrW(58)&ChrW(109)&ChrW(107)&ChrW(58)&ChrW(62)&ChrW(56)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(67)&ChrW(52)&ChrW(108)&ChrW(81))&cfg_baseurl&OOOOOO0O(ChrW(94)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(68)&ChrW(94)) & dir.name & OOOOOO0O(ChrW(94)) & Plus.Member(OOOOOO0O(ChrW(58)&ChrW(52)&ChrW(64)&ChrW(63))) & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(94)&ChrW(109)&ChrW(107)&ChrW(50)&ChrW(32)&ChrW(44)&ChrW(57)&ChrW(67)&ChrW(54)&ChrW(55)&ChrW(108)&ChrW(81))&cfg_baseurl&OOOOOO0O(ChrW(94)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(68)&ChrW(94)) & dir.name & OOOOOO0O(ChrW(94)) & Plus.Member(OOOOOO0O(ChrW(55)&ChrW(58)&ChrW(61)&ChrW(54))) & OOOOOO0O(ChrW(81)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(50)&ChrW(67)&ChrW(56)&ChrW(54)&ChrW(69)&ChrW(108)&ChrW(81))&Plus.Member(OOOOOO0O(ChrW(69)&ChrW(50)&ChrW(67)&ChrW(56)&ChrW(54)&ChrW(69)))&OOOOOO0O(ChrW(81)&ChrW(109)) & Plus.Member(OOOOOO0O(ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69))) & OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(50)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(61)&ChrW(58)&ChrW(109))
end if
next
set plusroot = nothing
set plus = nothing
if err then err.clear
getuserplus = html
end function
End Class
%>
<!--#include file="global.asp"-->