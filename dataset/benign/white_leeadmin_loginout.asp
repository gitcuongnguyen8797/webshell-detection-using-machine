<!-- 
'========================================================================================
' 文 件 名: admin_loginout.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 管理员退出登陆页面 | 请小心修改为自己的风格
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
<%flg="manok"%>
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<%
If Session("DatabaseErr") <> "ok_now" Then
%>
<!-- #include file="inc/connect.asp" -->
<%
call logout()  
End If
Session.Abandon
response.redirect "default"&Get_Suffix() 
%>