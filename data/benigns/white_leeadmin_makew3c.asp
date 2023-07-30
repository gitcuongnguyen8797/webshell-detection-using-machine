<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: admin_makew3c.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 文件生成器 | 
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
%>
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<%flg="man"%>
<!-- #include file="inc/purview.asp" -->
<head>
<title><%= LingFengNet_MS_language_title_makew3c %></title>
<%  
  call htmlmeta() 
%> 
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
<script language="JavaScript" type="text/javascript" src="inc/mouseok.js"></script>
</head>
<body onkeydown=EnableKey() >
<%
call htmltop()
call htmlbr()
call htmladminmen()
call htmlbr()
%>
<table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td class="bgc2"><table width="100%" border="0" cellspacing="1" cellpadding="3">
      <tr class="bgc">
        <td height=20 width=25% class="bgc"><table width=95% cellspacing=0 cellpadding=0 align="center" class=nofix >
          <tr>
            <td height=30 ><%= LingFengNet_MS_language_w3c_01 %></td>
          </tr>
		  <tr> 
			<td colspan="2" height="1" class="bgc2"></td>
		  </tr>
            <tr>
              <td height=30 ><%= LingFengNet_MS_language_w3c_02 %></td>
            </tr>
          <tr>
            <td height=30><iframe align=default marginwidth=0  marginheight=0 src="admin_makeweb<%= Get_Suffix() %>" frameborder=0 width=99% height=60 scrolling=no></iframe></td>
          </tr>
          <tr>
            <td height=30 ></td>
          </tr>
		  <tr> 
			<td colspan="2" height="1" class="bgc2"></td>
		  </tr>		  
          <tr>
            <td height=30 ><%= LingFengNet_MS_language_w3c_03 %></td>
          </tr>
          <tr>
            <td height=30 ><iframe align=default marginwidth=0  marginheight=0 src="admin_makejs<%= Get_Suffix() %>" frameborder=0 width=99% height=60 scrolling=no></iframe></td>
          </tr>
          <tr>
            <td height=30 ></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
call htmlbr()
call htmlend()
%>
