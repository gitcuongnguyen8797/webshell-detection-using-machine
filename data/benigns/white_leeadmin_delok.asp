<!-- 
'========================================================================================
' �� �� ��: admin_delok.asp
' ��    ��: �������ҵר������ϵͳ2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' ˵    ��: ����ɾ���ļ� | ���������޸ĸô��ļ�����ȷ��������ȷ��ִ��
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
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/connect.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<%flg="del"%>
<!-- #include file="inc/purview.asp" -->
<!-- #include file="inc/checkru.asp" -->
<% 
gbookid=request("gbookid")
gbookurl=request("gbookurl")
if not IsNumeric(gbookid) then response.redirect "default"&Get_Suffix() 
if len(gbookid)>LingFengNet_MS_mbl then response.redirect "default"&Get_Suffix() 
set rs=server.createobject("adodb.recordset")
sql="delete * from lfmessb where id="&gbookid
set Rs=conn.Execute(sql)
Response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><meta http-equiv='refresh' content='0;url="& gbookurl &"'><script Language=Javascript>alert('"& LingFengNet_MS_language_Warning_delok_1&"')</script>"
'rs.close
conn.close
set rs=nothing
set conn=nothing
%>