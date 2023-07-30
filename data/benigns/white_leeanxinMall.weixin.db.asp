<%

class Cls_dbbase
private rs
public conn
public sub dbopen()
on error resume next
if isobject(conn) then exit sub
dim connstr
if webroot="" then
Cls.echo OOOOOO0O(ChrW(-27820)&ChrW(64)&ChrW(23334)&ChrW(64)&ChrW(20746)&ChrW(64)&ChrW(-27722)&ChrW(64)&ChrW(24873)&ChrW(64)&ChrW(12378)&ChrW(44)&ChrW(105)&ChrW(29826)&ChrW(64)&ChrW(23787)&ChrW(64)&ChrW(21398)&ChrW(64)&ChrW(-27728)&ChrW(64)&ChrW(1094)&ChrW(44)&ChrW(-6895)&ChrW(44)&ChrW(28724)&ChrW(64)&ChrW(22793)&ChrW(64)&ChrW(-6710)&ChrW(44)&ChrW(32454)&ChrW(64)&ChrW(23333)&ChrW(64)&ChrW(31784)&ChrW(64))
Cls.die
end if
if datatype then
connstr=OOOOOO0O(ChrW(33)&ChrW(67)&ChrW(64)&ChrW(71)&ChrW(58)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(108)&ChrW(124)&ChrW(58)&ChrW(52)&ChrW(67)&ChrW(64)&ChrW(68)&ChrW(64)&ChrW(55)&ChrW(69)&ChrW(93)&ChrW(121)&ChrW(54)&ChrW(69)&ChrW(93)&ChrW(126)&ChrW(123)&ChrW(116)&ChrW(115)&ChrW(113)&ChrW(93)&ChrW(99)&ChrW(93)&ChrW(95)&ChrW(106)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(50)&ChrW(32)&ChrW(44)&ChrW(36)&ChrW(-243)&ChrW(64)&ChrW(70)&ChrW(67)&ChrW(52)&ChrW(54)&ChrW(108))&server.mappath(webroot&datapath&OOOOOO0O(ChrW(94))&datadbname)
else
connstr=OOOOOO0O(ChrW(33)&ChrW(67)&ChrW(64)&ChrW(71)&ChrW(58)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(108)&ChrW(36)&ChrW(-243)&ChrW(66)&ChrW(61)&ChrW(64)&ChrW(61)&ChrW(54)&ChrW(53)&ChrW(51)&ChrW(106)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(120)&ChrW(115)&ChrW(108))&datauser&OOOOOO0O(ChrW(106)&ChrW(33)&ChrW(50)&ChrW(68)&ChrW(68)&ChrW(72)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(108))&datapass&OOOOOO0O(ChrW(106)&ChrW(120)&ChrW(63)&ChrW(58)&ChrW(69)&ChrW(58)&ChrW(50)&ChrW(61)&ChrW(32)&ChrW(44)&ChrW(114)&ChrW(50)&ChrW(69)&ChrW(50)&ChrW(123)&ChrW(64)&ChrW(56)&ChrW(108))&datasqlname&OOOOOO0O(ChrW(106)&ChrW(115)&ChrW(50)&ChrW(69)&ChrW(50)&ChrW(32)&ChrW(44)&ChrW(36)&ChrW(-243)&ChrW(64)&ChrW(70)&ChrW(67)&ChrW(52)&ChrW(54)&ChrW(108))&datahost&OOOOOO0O(ChrW(106))
end if
set conn=server.createobject(OOOOOO0O(ChrW(50)&ChrW(53)&ChrW(64)&ChrW(53)&ChrW(51)&ChrW(93)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(63)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)))
conn.open connstr
if err then
Cls.echo OOOOOO0O(ChrW(-27716)&ChrW(64)&ChrW(29251)&ChrW(64)&ChrW(23868)&ChrW(64)&ChrW(25647)&ChrW(64)&ChrW(25780)&ChrW(64)&ChrW(32342)&ChrW(64)&ChrW(-27723)&ChrW(64)&ChrW(12517)&ChrW(44)&ChrW(12369)&ChrW(44)&ChrW(29835)&ChrW(64)&ChrW(110)&ChrW(29826)&ChrW(64)&ChrW(-27386)&ChrW(64)&ChrW(-6715)&ChrW(44)&ChrW(-27705)&ChrW(64)&ChrW(-6583)&ChrW(44)&ChrW(64)&ChrW(63)&ChrW(55)&ChrW(58)&ChrW(56)&ChrW(93)&ChrW(50)&ChrW(68)&ChrW(65)&ChrW(-27829)&ChrW(64)&ChrW(21610)&ChrW(64)&ChrW(27532)&ChrW(64)&ChrW(-27446)&ChrW(64)&ChrW(27688)&ChrW(64)&ChrW(23252)&ChrW(64)&ChrW(-27612)&ChrW(64)&ChrW(-7748)&ChrW(44)&ChrW(32136)&ChrW(64)&ChrW(-27820)&ChrW(64)&ChrW(20630)&ChrW(64)&ChrW(26266)&ChrW(64)&ChrW(72)&ChrW(54)&ChrW(51)&ChrW(67)&ChrW(64)&ChrW(64)&ChrW(69)&ChrW(-27817)&ChrW(64)&ChrW(23673)&ChrW(64)&ChrW(26266)&ChrW(64)&ChrW(-27724)&ChrW(64)&ChrW(-7748)&ChrW(44)&ChrW(31788)&ChrW(64)&ChrW(-27819)&ChrW(64)&ChrW(23938)&ChrW(64)&ChrW(1054)&ChrW(44))
err.clear
Cls.die
end if
end sub
public sub dbclose()
on error resume next
if isobject(conn) or conn.state=1 then
conn.close
set conn=nothing
end if
err.clear
end sub
public function exedb(byval t0)
on error resume next
set exedb=conn.execute(t0)
if err then
end if
end function
public sub insert(byval t0,byval t1)
dim dbfield,dbvalue,dbarray,i,temparr,fieldlen,filedtype,sqlvalue
dbfield=""
dbvalue=""
dbarray=t1
filedtype=""
for i=0 to ubound(dbarray)
temparr=dbarray(i)
if len(dbfield)>0 then
dbfield=dbfield&OOOOOO0O(ChrW(91))
dbvalue=dbvalue&OOOOOO0O(ChrW(91))
end if
if instr(temparr(0),OOOOOO0O(ChrW(87)))>0 or instr(temparr(0),OOOOOO0O(ChrW(88)))>0 or instr(temparr(0),OOOOOO0O(ChrW(32)&ChrW(44)))>0 or instr(temparr(0),OOOOOO0O(ChrW(93)))>0 then
dbfield=dbfield&temparr(0)
else
dbfield=dbfield&OOOOOO0O(ChrW(44))&temparr(0)&OOOOOO0O(ChrW(46))
end if
fieldlen=temparr(2)
filedtype=temparr(3)
sqlvalue=replace(temparr(1),OOOOOO0O(ChrW(86)),OOOOOO0O(ChrW(86)&ChrW(86)))
if fieldlen=0 then
if filedtype=1 then
dbvalue=dbvalue&OOOOOO0O(ChrW(86))&sqlvalue&OOOOOO0O(ChrW(86))
else
dbvalue=dbvalue&sqlvalue
end if
else
if filedtype=1 then
dbvalue=dbvalue&OOOOOO0O(ChrW(86))&left(sqlvalue,fieldlen)&OOOOOO0O(ChrW(86))
else
dbvalue=dbvalue&left(sqlvalue,fieldlen)
end if
end if
next
exedb(OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(69)&ChrW(64)&ChrW(32)&ChrW(44))&t0&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(87))&dbfield&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(68)&ChrW(32)&ChrW(44)&ChrW(87))&dbvalue&OOOOOO0O(ChrW(88)))
end sub
public function dbnew(byval t0,byval t1,byval t2)
dim dbfield,dbvalue,dbnum,dbarray,i,temparr,fieldlen,sqlvalue
dbfield=""
dbvalue=""
dbarray=t1
dbnew=0
dbnum=ubound(dbarray)
if len(t2)>0 then t2=OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t2
dim fieldarr(999)
for i=0 to dbnum
temparr=dbarray(i)
if len(dbfield)>0 then
dbfield=dbfield&OOOOOO0O(ChrW(91))
end if
fieldlen=temparr(2)
sqlvalue=temparr(1)
if fieldlen=0 then
fieldarr(i)=sqlvalue
else
fieldarr(i)=left(sqlvalue,fieldlen)
end if
if instr(temparr(0),OOOOOO0O(ChrW(87)))>0 or instr(temparr(0),OOOOOO0O(ChrW(88)))>0 or instr(temparr(0),OOOOOO0O(ChrW(32)&ChrW(44)))>0 or instr(temparr(0),OOOOOO0O(ChrW(93)))>0 then
dbfield=dbfield&temparr(0)
else
dbfield=dbfield&OOOOOO0O(ChrW(44))&temparr(0)&OOOOOO0O(ChrW(46))
end if
next
set rs=server.createobject(OOOOOO0O(ChrW(50)&ChrW(53)&ChrW(64)&ChrW(53)&ChrW(51)&ChrW(93)&ChrW(67)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(68)&ChrW(54)&ChrW(69)))
rs.open OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44))&dbfield&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t0&OOOOOO0O(ChrW(32)&ChrW(44))&t2&"",conn,1,3
if len(t2)>0 then
if not rs.eof then
rs.close
set rs=nothing
exit function
end if
end if
rs.addnew
for i=0 to dbnum
rs(i)=fieldarr(i)
next
rs.update
rs.close
set rs=nothing
dbnew=1
end function
public function dbupdate(byval t0,byval t1,byval t2)
dbupdate=0
dim i,dbarray,sqlvalue
dim n1,n2,n3,n4
dbarray=t2
sqlvalue=""
for i=0 to ubound(dbarray)
if len(sqlvalue)>0 then
sqlvalue=sqlvalue&OOOOOO0O(ChrW(91))
end if
n1=dbarray(i)(0)
n2=dbarray(i)(1)
n3=dbarray(i)(2)
n4=dbarray(i)(3)
if n3<>0 then n2=left(n2,n3)
if n4=1 then n2=Cls.sqlstr(n2)
if instr(n1,OOOOOO0O(ChrW(87)))>0 or instr(n1,OOOOOO0O(ChrW(88)))>0 or instr(n1,OOOOOO0O(ChrW(32)&ChrW(44)))>0 or instr(n1,OOOOOO0O(ChrW(93)))>0 then
sqlvalue=sqlvalue&n1&OOOOOO0O(ChrW(108))&n2&""
else
sqlvalue=sqlvalue&OOOOOO0O(ChrW(44))&n1&OOOOOO0O(ChrW(46)&ChrW(108))&n2&""
end if
next
dim sql
sql=OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44))&t0&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44))&sqlvalue
if len(t1)>0 then sql=sql&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t1
exedb(sql)
dbupdate=1
end function
public function dbload(byval t0,byval t1,byval t2,byval t3,byval t4)
if len(t0)>0 then t0=OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44))&t0
if len(t1)=0 then t1=OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44))
if len(t3)>0 then t3=OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t3
if left(lcase(t4),3)=OOOOOO0O(ChrW(67)&ChrW(63)&ChrW(53)) then
if datatype then
randomize
dim orderid
if len(t4)>4 then orderid=right(t4,len(t4)-4)
if len(orderid)=0 then orderid=OOOOOO0O(ChrW(58)&ChrW(53))
t4=OOOOOO0O(ChrW(67)&ChrW(63)&ChrW(53)&ChrW(87)&ChrW(92)&ChrW(87))&orderid&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(90))&rnd()&OOOOOO0O(ChrW(88)&ChrW(88))
else
t4=OOOOOO0O(ChrW(63)&ChrW(54)&ChrW(72)&ChrW(58)&ChrW(53)&ChrW(87)&ChrW(88))
end if
end if
if len(t4)>0 then t4=OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(51)&ChrW(74)&ChrW(32)&ChrW(44))&t4
if t1<>OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(89)&ChrW(32)&ChrW(44)) then
dim str:str=""
dim arr:arr=split(t1,OOOOOO0O(ChrW(91)))
dim i
for i=0 to ubound(arr)
if i>0 then str=str&OOOOOO0O(ChrW(91))
if instr(arr(i),OOOOOO0O(ChrW(87)))>0 or instr(arr(i),OOOOOO0O(ChrW(88)))>0 or instr(arr(i),OOOOOO0O(ChrW(32)&ChrW(44)))>0 or instr(arr(i),OOOOOO0O(ChrW(93)))>0 then
str=str&arr(i)
else
str=str&OOOOOO0O(ChrW(44))&arr(i)&OOOOOO0O(ChrW(46))
end if
next
t1=str
end if
set rs=exedb(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44))&t0&OOOOOO0O(ChrW(32)&ChrW(44))&t1&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t2&OOOOOO0O(ChrW(32)&ChrW(44))&t3&OOOOOO0O(ChrW(32)&ChrW(44))&t4)
if rs.eof then
dbload=array()
else
dbload=rs.getrows()
end if
rs.close
set rs=nothing
end function
public function dbloadone(byval t0,byval t1,byval t2)
if len(t2)>0 then t2=OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t2
dbloadone=exedb(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44))&t0&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t1&OOOOOO0O(ChrW(32)&ChrW(44))&t2&"")(0)
end function
public sub dbdel(byval t0,byval t1)
dim sql
sql=OOOOOO0O(ChrW(53)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t0
if len(t1)>0 then sql=sql&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t1
exedb(sql)
end sub
public function dbcount(byval t0,byval t1)
dim sql
sql=OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(87)&ChrW(96)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t0
if len(t1)>0 then sql=sql&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t1
dbcount=exedb(sql)(0)
end function
public function insertid(byval t0,byval t1)
insertid=exedb(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(62)&ChrW(50)&ChrW(73)&ChrW(87))&t0&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t1&"")(0)
end function
public function insertid_new(byval t0,byval t1,byval t2)
if len(t2)>0 then t2=OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44))&t2
insertid_new=exedb(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(62)&ChrW(50)&ChrW(73)&ChrW(87))&t0&OOOOOO0O(ChrW(88)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44))&t1&OOOOOO0O(ChrW(32)&ChrW(44))&t2&"")(0)
end function
end class
%>
<!--#include file="global.asp"-->