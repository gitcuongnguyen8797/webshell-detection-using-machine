<%@language=vbscript codepage=936 %>
<%Server.ScriptTimeOut=999999999
server.ScriptTimeout=50000000
response.buffer=true	
%>
<!--#include file="config.asp"-->
<!--#include file="background.asp"-->
<%
dim strFiles,i
%>

<html>
<head>
<title>�ϴ��ļ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
body {
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 15px;
	margin-bottom: 15px;
}
-->
</style>
</head>
<body>
<div align="center">
  <center>
    <br>
  </CENTER>
</DIV>
<%
	set fso=CreateObject("Scripting.FileSystemObject")
	call DoClear()

%>
</body> 
</html>
<%
sub DoClear()
	set rs=server.CreateObject("adodb.recordset")
		strFiles=""
		sql="select content from guest"
		rs.open sql,conn,1,1
		do while not rs.eof
			if rs(0)<>"" then
				strFiles=strFiles & "|" & rs(0)
			end if
			rs.movenext
		loop
		rs.close
		call DelFile_Useless("upload")
	set rs=nothing
end sub

sub DelFile_Useless(strDir)
	dim i
	i=0
	Set theFolder=fso.GetFolder(server.MapPath(strDir))
	For Each theFile In theFolder.Files
		if instr(strFiles,theFile.Name)<=0 then
			fso.copyfile server.MapPath("upload/"&theFile.Name),server.MapPath("uploadreplay/"&theFile.Name)
			theFile.Delete True
			i=i+1
		end if
	next
	response.write "����ִ�гɹ������ƶ��� <font color=red><b>" & i & "</b></font> �����õ��ļ����ظ��ϴ��ļ��С�<br><br>"
	response.write "���ڿ�ʼת���ظ����ݱ�·������<br>"
	response.Flush()
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select replycontent from reply",conn,3,3
	do while not rs.eof
		rs("replycontent")=replace(rs("replycontent"),"Upload/","uploadreplay/")
		rs.update
	rs.movenext
	loop
	rs.close
	set rs=nothing
	response.write "�ظ����ݱ�·��ת����ϣ�<br>"
	response.write "<font color=red>��ʹ�����ݿ�ѹ������ѹ�����ݿ��С��</font>"
end sub
%>