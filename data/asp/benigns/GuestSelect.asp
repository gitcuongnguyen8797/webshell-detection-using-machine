<%@language=vbscript codepage=936 %>
<%
guestimagesnum=23
emotnum=23
call emot()

%>
<html>
<head>
<title>请选择表情</title>
<link href="STYLE.CSS" rel="stylesheet" type="text/css">
</head>
<body>
<% sub emot()%>
<table align=center width=95% cellpadding=5><td>
<%

for i=1 to emotnum
	response.write "<img src='images/emot/emot"&i&".gif' border=0 onclick=""window.opener.document.form.Content.value+='[emot"&i&"]' "" style=cursor:hand> "
	if i mod 6 =0 then
		response.write "<br>"
	end if
next
%>
</td></tr></table>
<%end sub%>
<div align="center"><font size="2">[<a href="javascript:window.close();">关闭窗口</a>]</font></div>