<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<% 
'========================================================================================
' �� �� ��: admin_filtratelist.asp
' ��    ��: �������ҵר������ϵͳ2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' ˵    ��: ������Ϣ�㼯�ļ� | ��С���޸�Ϊ�Լ��ķ��
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
if LingFengNet_MS_how_filtrate<>3 then
response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
response.write "alert('"& LingFengNet_MS_language_Warning_filtratelist &"');" 
response.write "history.go(-1);" 
response.write "</script>" 
response.end
end if		 
Set rs = Server.CreateObject("ADODB.Recordset")
sql = "Select "&sqlkey&" FROM lfmessb where Auditing=3  Order By addtime Desc"
Set rs = Server.CreateObject("ADODB.Recordset")
Rs.open sql,conn,1,1
page=Request("page")
total  = rs.RecordCount
response.write "<html>"&_
"<head>"&_
"<title>"& LingFengNet_MS_language_title_filtratelist &"</title>"
call htmlmeta() 
response.write "<link rel=stylesheet href=style/css/"& LingFengNet_MS_web_css &".css type=text/css >"&_
"<link rel=""shortcut icon"" href=""pic/favicon.ico"" type=""image/x-icon"">"&vbcrlf&_
"<link rel=""bookmark"" href=""pic/favicon.ico"" type=""image/x-icon"">"&vbcrlf&_
"</head>"&_
"<body onkeydown=EnableKey() >"&_
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