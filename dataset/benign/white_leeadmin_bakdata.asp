<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: admin_bakdata.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 数据库备份文件 | 请勿自行修改该处文件源代码，以确保程序正确的执行
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
<%
n=Year(date())
y=Month(date())
r=Day(date())
s=Hour(time())
f=Minute(time())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f

nowsj=n&y&r&s&f
%>
<head>
<title><%= LingFengNet_MS_language_title_bakdata %></title>
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
                  <%= LingFengNet_MS_language_bakdata_mes_1 %></b>( <%= LingFengNet_MS_language_bakdata_mes_2 %> )<br>
                </td>
              </tr>
              <%
if IsObjInstalled("Scripting.FileSystemObject") then
dim method
method=request.querystring("method")
if method="" then 
%>
              <form method="post" action="admin_bakdata.asp?method=Backup">
                <tr> 
                  <td height=100 > &ensp;&ensp;<br>
                    <%= LingFengNet_MS_language_bakdata_mes_3 %>:  
                    <input type=text size=30 name=DBpath value="<%=nowsj%>">&ensp;&ensp;<input type=submit value="<%= LingFengNet_MS_language_bakdata_mes_sub %>" class="buttonface">
                    <br>
                    <br>
                    <p>&ensp;&ensp;<%= LingFengNet_MS_language_bakdata_mes_4 %><br>
                      <br>
                      &ensp;&ensp;<%= LingFengNet_MS_language_bakdata_mes_5 %><br>
                      <br>
                      &ensp;&ensp;<%= LingFengNet_MS_language_bakdata_mes_6 %></p>
                    <p>&ensp;</p>
                  </td>
                </tr>
              </form>
<%
elseif method="Backup" then 
Dbpath=trim(request.form("Dbpath"))
if chkfname(Dbpath)=1 then ErrAlt(""& LingFengNet_MS_language_Warning_bakdata_1 & "")
Dbpath="data/#" & Dbpath & ".mdb"
Dbpath=server.mappath(Dbpath) 
db2=server.mappath(""&db&"")
Set Fso=server.createobject("scripting.filesystemobject")
fso.copyfile db2,dbpath,true
response.write "<tr><td height=25><br><br><li>"& LingFengNet_MS_language_Warning_bakdata_2 & "" & Dbpath & "<br><br><br></td></tr>"
Set fso=Nothing
end if 
else
%>
              <tr> 
                <td height=30 >
                  <li>&ensp;&ensp;<%= LingFengNet_MS_language_bakdata_mes_7 %><b>FSO</b><%= LingFengNet_MS_language_bakdata_mes_8 %>。
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
Function chkfname(fn)
dim chk2
chk2=0
if instr(fn,"/")<>0 then chk2=1
if instr(fn,"\")<>0 then chk2=1
if instr(fn,"|")<>0 then chk2=1
if instr(fn,"*")<>0 then chk2=1
if instr(fn,"""")<>0 then chk2=1
if instr(fn,":")<>0 then chk2=1
if instr(fn,"?")<>0 then chk2=1
if instr(fn,">")<>0 then chk2=1
if instr(fn,"<")<>0 then chk2=1
if instr(fn,".")<>0 then chk2=1
chkfname=chk2
End Function
Sub ErrAlt(says)
%>
<script language="JavaScript">
alert("<%=says%>");
history.go(-1);
</script>
<%
response.end
end sub
%>