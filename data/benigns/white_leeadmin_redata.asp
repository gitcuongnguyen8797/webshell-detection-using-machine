<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: redata.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 数据库还原文件 | 请勿自行修改该处文件源代码，以确保程序正确的执行
' 文件日期: 2018-01-23
' 设 计 者: 疾风之狼
'========================================================================================
' 郑州文达岭峰网络科技有限公司.
'============================================================================== ==========
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
<title><%= LingFengNet_MS_language_title_redata %></title>
<%  
  call htmlmeta() 
%> 
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
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
    <td class="bgc2"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="3">
        <tr class="bgc"> 
          <td height=20 width=25% class="bgc"> 
            <table width=95% cellspacing=0 cellpadding=0 align="center" >
              <tr> 
                <td height=25 > &ensp;&ensp;<b><br>
                  <%= LingFengNet_MS_language_redata_mes_1 %> <br>
                  </b></td>
              </tr>
              <%
if IsObjInstalled("Scripting.FileSystemObject") then
Set Fso=server.createobject("scripting.filesystemobject")
dim method
method=request.querystring("method")
if method="" then 
FoldName=server.mappath("data") 
Set f1 = Fso.GetFolder(FoldName)
Set pFiles = f1.Files
%>
              <form method="post" action="admin_redata.asp?method=Backup">
                <tr> 
                  <td height=100 > &ensp;&ensp; 
                    <p> <%= LingFengNet_MS_language_redata_mes_2 %>:  
                      <select name="DBpath">
                        <%for each file in f1.Files
tempwrite= tempwrite & "<option value=" & file.name &">" & file.name &"</option>"
next 
response.write tempwrite
set f1=nothing
set fso=nothing
%>
                      </select>
                      &ensp; 
                      <input type=submit value="<%= LingFengNet_MS_language_redata_mes_sub %>" name="submit" class="buttonface">
                      <br>
                      <br>
                      <br>
                      &ensp;&ensp;<%= LingFengNet_MS_language_redata_mes_3 %> <br>
                      <br>
                      &ensp;&ensp;<%= LingFengNet_MS_language_redata_mes_4 %><br>
                    </p>
                </tr>
              </form>
              <%

Set f1 = Nothing
Set pFiles = Nothing
elseif method="Backup" then 
Dbpath=trim(request.form("Dbpath"))
Dbpath="data/" & Dbpath 
Dbpath=server.mappath(Dbpath) 
db2=server.mappath(""&db&"")
if fso.fileexists(dbpath) then 
fso.copyfile dbpath,db2,true
response.write "<tr><td height=25><br><br><li>"& LingFengNet_MS_language_Warning_redata_1 &"</td></tr>"
else
response.write "<tr><td height=25><br><br><li>"& LingFengNet_MS_language_Warning_redata_2 &"</td></tr>" 
end if 
response.write "<tr><td height=25><br><li>"& LingFengNet_MS_language_Warning_redata_3 &"！</td></tr>"
end if 

Set Fso=Nothing
else
%>
              <tr> 
                <td height=30 > 
                  <li><%= LingFengNet_MS_language_redata_mes_5 %><b>FSO</b><%= LingFengNet_MS_language_redata_mes_6 %>。
                </td>
              </tr>
              <%end if%>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> </td>
  </tr>
</table>
</body>
</html>
<%
call htmlbr()
call htmlend()
%>