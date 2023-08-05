<!--#INCLUDE FILE="config.asp" -->
<!--#INCLUDE FILE="md5.asp" -->
<%
on error resume next
conn.execute(exec)
exec="alter table guest add jinghua bit null default 0"
'update 1.1
exec="alter table option1 add background varchar(200) null"
conn.execute(exec)
exec="alter table option1 add bannerImg varchar(200) null"
conn.execute(exec)
exec="alter table option1 add bannerImgLink varchar(200) null"
conn.execute(exec)
exec="alter table option1 add lytitle varchar(200) null"
conn.execute(exec)
'update 1.2
exec="alter table guest add qq varchar(20) null"
conn.execute(exec)
exec="alter table register add qq varchar(20) null"
conn.execute(exec)
exec="alter table reply add qq varchar(20) null"
conn.execute(exec)
exec="alter table option1 add webname varchar(255) null"
conn.execute(exec)
exec="alter table option1 add weblink varchar(255) null"
conn.execute(exec)
'update 1.3
exec="alter table guest add jinghua bit null default 0"
conn.execute(exec)
exec="alter table option1 add muiedit bit null default 0"
conn.execute(exec)
exec="alter table option1 add uploadsize integer"
conn.execute(exec)
exec="alter table option1 add uploadtype varchar(255) null"
conn.execute(exec)
exec="update option1 set muiedit=1,uploadsize=100,uploadtype='rar|zip|gif|jpg|swf|mid|mp3'"
conn.execute(exec)
exec="alter table option1 add second1 integer"
conn.execute(exec)

exec="alter table guest add lastname varchar(30) null"
conn.execute(exec)
exec="alter table guest add jinghua bit null default 0"
Set rs=Server.CreateObject("ADODB.RecordSet")
rs.open "Select * from register",conn,3,3
if len(rs("password1"))<>16 then
do while not rs.eof
rs("password1")=md5(rs("password1"))
rs.update
rs.movenext
loop
end if
rs.close

Set rs=Server.CreateObject("ADODB.RecordSet")
Set rs1=Server.CreateObject("ADODB.RecordSet")
rs.open "Select * from guest",conn,3,3
do while not rs.eof
rs1.open "Select * from reply where id="&rs("id")&" order by id1 desc",conn,1,1
if rs1.eof then rs("lastname")="¡ª¡ª" else rs("lastname")=rs1("replyname")
rs.update
rs1.close
rs.movenext
loop
rs.close
'update 2.7
exec="alter table option1 add muieditor integer"
conn.execute(exec)
exec="alter table option1 add regshow bit null default 0"
conn.execute(exec)
exec="alter table option1 add lylength integer"
conn.execute(exec)
exec="alter table option1 add faceupload bit null default 0"
conn.execute(exec)
exec="alter table option1 add lygg varchar(255) null"
conn.execute(exec)
exec="alter table register add myface varchar(255) null"
conn.execute(exec)
exec="alter table guest add fontcolor varchar(10) null"
conn.execute(exec)
exec="alter table option1 add skin integer"
conn.execute(exec)
exec="alter table guest add edittime datetime"
conn.execute(exec)
exec="alter table reply add edittime datetime"
conn.execute(exec)
exec="alter table guest add edituser varchar(50) null"
conn.execute(exec)
exec="alter table reply add edituser varchar(50) null"
conn.execute(exec)
exec="alter table register add facewidth integer"
conn.execute(exec)
exec="alter table register add faceheight integer"
conn.execute(exec)
exec="alter table option1 add showmail bit null default 1"
conn.execute(exec)
exec="update option1 set showmail=1"
conn.execute(exec)
exec="update option1 set muieditor=1 where muiedit=true"
conn.execute(exec)
exec="update option1 set muieditor=0 where muiedit=false"
conn.execute(exec)
exec="update option1 set lylength=0"
conn.execute(exec)
exec="update option1 set regshow=true"
conn.execute(exec)
exec="update option1 set faceupload=true"
conn.execute(exec)
exec="update register set facewidth=0 where facewidth is null"
conn.execute(exec)
exec="update register set faceheight=0 where faceheight is null"
conn.execute(exec)
exec="update option1 set skin=1 where skin is null"
conn.execute(exec)
exec="alter table option1 add showcode bit null default 1"
conn.execute(exec)
exec="alter table option1 add passuser text null"
conn.execute(exec)
exec="update option1 set showcode=1"
conn.execute(exec)

response.write "Éý¼¶Íê±Ï£¡"
conn.close
set conn=nothing
%>	