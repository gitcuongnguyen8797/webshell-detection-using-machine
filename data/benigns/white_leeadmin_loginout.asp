<!-- 
'========================================================================================
' �� �� ��: admin_loginout.asp
' ��    ��: �������ҵר������ϵͳ2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' ˵    ��: ����Ա�˳���½ҳ�� | ��С���޸�Ϊ�Լ��ķ��
' �ļ�����: 2018-01-23
' �� �� ��: ����֮��
'========================================================================================
' ֣���Ĵ��������Ƽ����޹�˾.
'========================================================================================
' Copyright (C) 2001-2018 �����. All rights reserved.
' ��    վ: http://www.lfmesss.com
' �����ʼ�: support@lfmesss.com
' ��ϵ�ѣ�: 85112407
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