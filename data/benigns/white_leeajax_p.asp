<%
'========================================================================================
' 文 件 名: ajax_p.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 代理程序 | 请勿自行修改该处文件，以确保程序正确的执行
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
