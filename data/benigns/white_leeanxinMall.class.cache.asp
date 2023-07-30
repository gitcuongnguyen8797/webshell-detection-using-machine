<%

class anxinMall_Cls_Cache
private obj
private expireTime
private expireTimeName
private cacheName
private path
private sub class_initialize()
path=request.servervariables(OOOOOO0O(ChrW(70)&ChrW(67)&ChrW(61)))
path=left(path,instrRev(path,OOOOOO0O(ChrW(94))))
end sub
private sub class_terminate()
end sub
public property get blEmpty
if isempty(obj) then
blEmpty=true
else
blEmpty=false
end if
end property
public property get valid
if isempty(obj) or not isDate(expireTime) then
valid=false
elseif CDate(expireTime)<now then
valid=false
else
valid=true
end if
end property
public property let name(str)
cacheName=str & path
obj=application(cacheName)
expireTimeName=str & OOOOOO0O(ChrW(54)&ChrW(73)&ChrW(65)&ChrW(58)&ChrW(67)&ChrW(54)&ChrW(68)) & path
expireTime=application(expireTimeName)
end property
public property let expires(tm)
expireTime=tm
application.lock
application(expireTimeName)=expireTime
application.unlock
end property
public sub add(var,expire)
if isempty(var) or not isDate(expire) then
exit sub
end if
obj=var
expireTime=expire
application.lock
application(cacheName)=obj
application(expireTimeName)=expireTime
application.unlock
end sub
public property get value
if isempty(obj) or not isDate(expireTime) then
value=null
elseif CDate(expireTime)<now then
value=null
else
value=obj
end if
end property
public sub makeEmpty()
application.lock
application(cacheName)=empty
application(expireTimeName)=empty
application.unlock
obj=empty
expireTime=empty
end sub
public function equal(var2)
if typename(obj)<>typename(var2) then
equal=false
elseif typename(obj)=OOOOOO0O(ChrW(126)&ChrW(51)&ChrW(59)&ChrW(54)&ChrW(52)&ChrW(69)) then
if obj is var2 then
equal=true
else
equal=false
end if
elseif typename(obj)=OOOOOO0O(ChrW(39)&ChrW(50)&ChrW(67)&ChrW(58)&ChrW(50)&ChrW(63)&ChrW(69)&ChrW(87)&ChrW(88)) then
if join(obj,OOOOOO0O(ChrW(47)))=join(var2,OOOOOO0O(ChrW(47))) then
equal=true
else
equal=false
end if
else
if obj=var2 then
equal=true
else
equal=false
end if
end if
end function
end class
%>
<!--#include file="global.asp"-->