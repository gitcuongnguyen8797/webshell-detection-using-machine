<%@language=vbscript codepage=65001 %>
<!--#INCLUDE FILE="config.asp"-->
<% Response.Charset = "utf-8" %>
<%
Server.ScriptTimeOut = 500

UserName = "Admin-S"
Face = ""
sex = ""
HomePage = Request.form("homepage")
Email = "admin6@qq.com"
Subject = Request.form("title")
content = Request.form("txt")
content = Replace(content,"imgsrc=", "img src=")
IPinfo = "127.0.0.1"
bookdate = now
pic = "p16.gif"
secret = "0"
qq = "25250508"
mark = "0"
fontcolor = "±êÌâÐÑÄ¿"

Set rs11 = Server.CreateObject( "ADODB.Recordset" )

rs11.open "Select * From guest where subject = '"&Subject&"' and HomePage = '"&HomePage&"'order by id desc" ,Conn,1,1
id=rs11("id")
rs11.close
If id > 0  Then
	Response.write -1
	set rs11=Nothing
Else
	sql="Insert Into guest (username,face,sex,homepage,mail,subject,content,IP,lydate,lastdate,pic,secret,qq,lastname,mark,fontcolor)  Values('"& UserName &"','"& Face &"','"& sex &"','"& HomePage &"', '"& Email &"','"& Subject &"','"&content &"','"& IPinfo &"','"& bookdate &"','"& bookdate &"','"& pic &"',"& secret &",'"&qq&"','¡ª¡ª',"&mark&",'"&fontcolor&"')"

	conn.Execute sql

	Set rs = Server.CreateObject( "ADODB.Recordset" )

	rs.open "Select * From guest order by id desc" ,Conn,1,1
	id=rs("id")
	rs.close

	Response.write(id)
	set rs=Nothing

End If




conn.close
%>