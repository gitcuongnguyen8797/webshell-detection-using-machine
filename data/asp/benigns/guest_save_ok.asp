<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="refresh" content="2;
<%if not rs11("show") or ((session("admin")=1) or (session("admin")=2)) then%>
	url=show.asp?id=<%=request("id")%>
<%else%>
<%if session("list")=0 then%>
url=default.asp
<%else%>
url=default1.asp
<%end if%>
<%end if%>">
<title></title>
<link rel="stylesheet" href="1.css" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body>
<!--#INCLUDE FILE="top.asp"-->        
<br>
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a">
    <td>
      <p align="center"><strong>成功信息</strong> </td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="28" align="center"><div align="center"><font color="#FF0000"><b>留 言 添 加 成 功 ！<%if rs11("show") and ((session("admin")<>1) and (session("admin")<>2)) then 
	if session("useridname")<>"" then
		if (Instr(rs11("passuser"),","&session("useridname"))=0) and (Instr(rs11("passuser"),","&session("useridname")&",")=0) and (Instr(rs11("passuser"),","&session("useridname")&",")=0) then
			response.Write("需管理员或版主审核后才能显示")
		end if
	else
		response.Write("需管理员或版主审核后才能显示")
	end if
	end if
	%></b></font><br>
        <br>
        <font color="#FF0000"><b>2</b></font> 秒后自动转到<%if not rs11("show") or ((session("admin")=1) or (session("admin")=2)) then response.Write("你的留言页面！") else response.Write("留言首页面！")%><br>
        <br>
<%if rs11("show") then
	  if (session("admin")=1) or (session("admin")=2) then
	  	%>
		·<a href="show.asp?id=<%=request("id")%>"%> 查看你发表的留言</a>
		<%
	  else
	  	if session("useridname")<>"" then
			 if (Instr(rs11("passuser"),","&session("useridname"))>0) or (Instr(rs11("passuser"),","&session("useridname")&",")>0) or (Instr(rs11("passuser"),","&session("useridname")&",")>0) then
				%>
				·<a href="show.asp?id=<%=request("id")%>"%> 查看你发表的留言</a>
				<%
			 else
				mark=false
			 end if
		 end if
	 end if
	 else
%>·<a href="show.asp?id=<%=request("id")%>"%> 查看你发表的留言</a>
<%end if%>·<%if session("list")=0 then%>
<a href="default.asp">回留言板首页面</a>
<%else%>
<a href="default1.asp">回留言板首页面</a>
<%end if%>
    </div></td>
  </tr>
</table>
<!--#INCLUDE FILE="bottom.asp"-->
<br>
</body>

</html>
