<%
'========================================================================================
' �� �� ��: ajax_p.asp
' ��    ��: �������ҵר������ϵͳ2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' ˵    ��: ������� | ���������޸ĸô��ļ�����ȷ��������ȷ��ִ��
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

Function send_request(url)
	Set Retrieval = CreateObject("Microsoft.XMLHTTP")
	With Retrieval
	  .Open "Get", url, False, "", ""
	  .Send
	  send_request = .ResponseBody
	End With
	Response.ContentType="text/xml"
	Set Retrieval = Nothing
End Function
url=Request("RSS_URL")
IF  instr(url,"http://www.lfmesss.com")>0 Then
	Response.Addheader "Content-Type","text/html; charset=gbk"
	On Error Resume Next	
	Response.BinaryWrite send_request(url)			
	Response.Flush
	IF Err Then
		Response.Write ("noweb")
	End IF
End IF
%>
