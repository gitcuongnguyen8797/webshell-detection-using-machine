<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|611,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
%>
<html>
<head>
<title>上传文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<script language='javascript' src='images/private.js'></SCRIPT>
</head>

<body topmargin="0">
<br>
<table width="100%" border=0 cellspacing=0 cellpadding=0>
<form name="form" method="post" action="Admin_readxls.asp" enctype="multipart/form-data">
    <tr>
      <td>
   <input name="file1" type=file class=button size="30">
  <input name="submit" type=submit class="button" style="width:70px; height:19px;" value="导入数据" > 
  <font color="#FF0000">（导入文件必须和样式.xls文件一致）</font>  <a href="Book1.xls">查看excel样式
         </a></td>
   </tr>
</form>
</table>
</body>
</html>
