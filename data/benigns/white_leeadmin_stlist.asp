<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' �� �� ��: stlist.asp
' ��    ��: �������ҵר������ϵͳ2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' ˵    ��: ���������б� | ��С���޸�Ϊ�Լ��ķ��
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
%>
<!-- #include file="inc/contencrypt.asp" -->
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<%flg="man_ts"%>
<!-- #include file="inc/purview.asp" -->
<!-- #include file="inc/connect.asp" -->
<!-- #include file="inc/checkru.asp" -->
<!-- #include file="inc/md5_32.asp" -->
<!-- #include file="inc/del.asp" -->
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "Select "&sqlkey&" FROM lfmessb where Auditing=0  Order By addtime Desc"
Rs.open sql,conn,1,1
page=Request("page")
total  = rs.RecordCount
if LingFengNet_MS_noaud=0 or session("LingFengNet_MS_admin")="ok" then
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql1 = "Select id FROM lfmessb where Auditing=0  Order By addtime Desc"
Rs1.open sql1,conn,1,1
totalno  = rs1.RecordCount
rs1.close
set rs1=nothing
end if
response.write "<html>"&_
"<head>"&_
"<title>"& LingFengNet_MS_language_title_stlist &"</title>"
call htmlmeta() 
if LingFengNet_MS_refreshtime<>0 then response.write "<meta http-equiv='refresh' content='"& LingFengNet_MS_refreshtime &"'>"&vbcrlf
response.write "<link rel=stylesheet href=style/css/"& LingFengNet_MS_web_css &".css type=text/css >"&_
"<link rel=""shortcut icon"" href=""pic/favicon.ico"" type=""image/x-icon"">"&_
"<link rel=""bookmark"" href=""pic/favicon.ico"" type=""image/x-icon"">"&_
"<script>"&_
"var msg = """&LingFengNet_MS_language_messdef_newsmail_1&totalno&LingFengNet_MS_language_messdef_newsmail_2&""";"&_
"var speed = 200; "&_
"var msgud = "" "" + msg; "&_
"function titleScroll() { "&_
"if (msgud.length <msg.length) msgud += "" - "" + msg; "&_
"msgud = msgud.substring(1, msgud.length); "&_
"document.title = msgud.substring(0, msg.length);"&_
"window.setTimeout(""titleScroll()"", speed); "&_
"} "&_
"</script>"
if totalno <> 0 then newsmail = " onload=""window.setTimeout('titleScroll()', 500)"""
response.write "</head>"&_
"<body onkeydown=""EnableKey()"" "&newsmail&">"&_
"<div align=center>"
call htmlmain() 
response.write "</div>"&_
"</body>"&_
"</html>"
rs.close
conn.close
set rs=nothing
set conn=nothing
call htmlend()
%>