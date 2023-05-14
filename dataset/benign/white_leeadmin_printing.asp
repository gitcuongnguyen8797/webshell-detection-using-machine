<!-- 
'========================================================================================
' 文 件 名: admin_auditing.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 留言审核文件 | 请勿自行修改该处文件，以确保程序正确的执行
' 文件日期: 2018-01-23
' 设 计 者: 疾风之狼
'========================================================================================
' 郑州文达岭峰网络科技有限公司.
'========================================================================================
' Copyright (C) 2001-2018 岭峰网. All rights reserved.
' 网    站: http://www.lfmesss.com
' 电子邮件: support@lfmesss.com
' 联系ＱＱ: 85112407
'========================================================================================
-->
<%@ language="vbscript" codepage ="936" %>
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<!-- #include file="inc/contencrypt.asp" -->
<%flg="man_ts"%>
<!-- #include file="inc/purview.asp" -->
<!-- #include file="inc/checkru.asp" -->
<!-- #include file="inc/connect.asp" -->
<%  
gbookid=Request.QueryString("page")
sql="select * from lfmessb where id="&gbookid
Set rs = Server.CreateObject("ADODB.Recordset")
Rs.open sql,conn,1,1
if	rs("encrypt")=1	then
username=DeCrypt(rs("username"))
post=DeCrypt(rs("post"))
ip=DeCrypt(rs("ip"))
email=DeCrypt(rs("email"))
content=DeCrypt(rs("content"))
tel=DeCrypt(rs("tel"))
if rs("re")="0" then
re="0"
else
re=DeCrypt(rs("re"))
end if
else
username=rs("username")
post=rs("post")
ip=rs("ip")
email=rs("email")
content=rs("content")
tel=rs("tel")
re=rs("re")
end if
Auditing=rs("Auditing")
addtime=rs("addtime")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<style media="print">    
.noprint {display: none;}    
</style> 
</head>
<body bgcolor="#FFFFFF">
<span class="Noprint">
<input type="button" value="<%= LingFengNet_MS_language_printing_1 %>"  onClick="window.print();">
<input type="button" value="<%= LingFengNet_MS_language_printing_4 %>" onClick="window.close()">
</span>
<center class="Noprint" ><hr>
</center>
<br> 
<div align="center"><span style="font-family: 黑体;font-size:20px;"><%= LingFengNet_MS_web_name %><%= LingFengNet_MS_sys_name %>电子信箱办文单</span></div>
<br>
<table width="649" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000" id="1" style="padding:4px;line-height:170%;clear:both;font-size:14px;border-collapse:collapse">
  <tr>
    <td width="128" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= LingFengNet_MS_language_printing_9 %></td>
    <td width="156" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= username %></td>
    <td width="128" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= LingFengNet_MS_language_printing_10 %></td>
    <td width="156" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= post %></td>
  </tr>
  <tr>
    <td width="128" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= LingFengNet_MS_language_printing_11 %></td>
    <td width="156" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= tel %></td>
    <td width="128" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= LingFengNet_MS_language_printing_12 %></td>
    <td width="156" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= email %></td>
  </tr>
  <tr>
    <td width="128" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= LingFengNet_MS_language_printing_13 %></td>
    <td width="156" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= ip %></td>
    <td width="128" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= LingFengNet_MS_language_printing_14 %></td>
    <td width="156" height="35" valign="middle" bgcolor="#FFFFFF">&ensp;<%= addtime %></td>
  </tr>
  <tr>
    <td width="128" height="140" valign="top" bgcolor="#FFFFFF"><br>      
    &ensp;<%= LingFengNet_MS_language_printing_15 %></td>
    <td height="140" colspan="3" valign="top" bgcolor="#FFFFFF">&ensp;<%= content %></td>
  </tr>
  <tr>
    <td width="128" height="140" valign="top" bgcolor="#FFFFFF"><br>      
    &ensp;<%= LingFengNet_MS_language_printing_16 %></td>
    <td height="140" colspan="3" valign="middle" bgcolor="#FFFFFF">&ensp;</td>
  </tr>
  <tr>
    <td width="128" height="140" valign="top" bgcolor="#FFFFFF"><br>      
    &ensp;<%= LingFengNet_MS_language_printing_17 %></td>
    <td height="140" colspan="3" valign="middle" bgcolor="#FFFFFF">&ensp;</td>
  </tr>
  <tr>
    <td width="128" height="140" valign="top" bgcolor="#FFFFFF"><br>      
    &ensp;<%= LingFengNet_MS_language_printing_18 %></td>
    <td height="140" colspan="3" valign="middle" bgcolor="#FFFFFF">&ensp;</td>
  </tr>
  <tr>
    <td width="128" height="90" valign="top" bgcolor="#FFFFFF"><br>      
    &ensp;<%= LingFengNet_MS_language_printing_19 %></td>
    <td height="90" colspan="3" valign="middle" bgcolor="#FFFFFF">&ensp;</td>
  </tr>
</table>
</body>
</html>