<% 
set rs=nothing
Set rs=server.createobject("ADODB.RECORDSET")
   rs.open "Select * From option1",Conn,3,3
   rs("count")=rs("count")+1
   rs.update
%>
<link href="1.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
<!--
.style2 {color: #0000FF}
.style3 {color: #339900}
.STYLE4 {color: #009966}
-->
</style>
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" height="3">
  <tr>
    <td></td>
  </tr>
</table>
<span style="FONT-SIZE: 9pt"> </span> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr valign="top"> 
    <td width="100%" height="18" colspan="3"> <p align="center">多功能留言板，访问：<%=rs("count")%>次<br>
        Copyright(C) 2013-2014<strong><font face="Arial"><span class="STYLE4"><a href="http://bbnsc.taobao.com" target="_blank">贝恩斯网络</a></span> <span class="STYLE4">提供技术支持</span> </font></strong>All Rights Reserved<br>
      </p>
    </td>
  </tr>
</table>
<%
rs11.close
set rs11=nothing
rs.close
set rs=nothing
set rs1=nothing
set rs2=nothing
conn.close
set conn=nothing
%>
