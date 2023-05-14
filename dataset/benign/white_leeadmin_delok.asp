<!-- 
'========================================================================================
' 文 件 名: admin_delok.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 留言删除文件 | 请勿自行修改该处文件，以确保程序正确的执行
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