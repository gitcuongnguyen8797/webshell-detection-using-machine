<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|611,")=0 then 
  response.write ("<font color='red')>�㲻���иù���ģ��Ĳ���Ȩ�ޣ��뷵�أ�</font>")
  response.end
end if
'========�ж��Ƿ���й���Ȩ�� 
%>
<html>
<head>
<title>�ϴ��ļ�</title>
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
  <input name="submit" type=submit class="button" style="width:70px; height:19px;" value="��������" > 
  <font color="#FF0000">�������ļ��������ʽ.xls�ļ�һ�£�</font>  <a href="Book1.xls">�鿴excel��ʽ
         </a></td>
   </tr>
</form>
</table>
</body>
</html>
