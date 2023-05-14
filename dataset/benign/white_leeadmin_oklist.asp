<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: admin_oklist.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 管理员合法登陆纪录文件 | 请勿自行修改该处文件，以确保程序正确的执行
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
<!-- #include file="inc/connect.asp" -->
<!-- #include file="inc/checkru.asp" -->
<%
s=Hour(time())
f=Minute(time())
m=Second(time())
if len(s)=1 then s="0" & s
if len(f)=1 then f="0" & f
if len(m)=1 then m="0" & m
n=Year(date())
y=Month(date())
r=Day(date())
if len(y)=1 then y="0" & y
if len(r)=1 then r="0" & r
LFW_nowsj=n & "-" & y & "-" & r & " "
sj=LFW_nowsj & s & ":" & f & ":" & m
Set rs = Server.CreateObject("ADODB.Recordset")
sql="delete * from ok where DateDiff('d',addtime,#" & sj & "#)>" & LingFengNet_MS_oklist & ""
conn.Execute(sql)
sql = "Select * FROM ok  Order By addtime Desc"
Set rs = Server.CreateObject("ADODB.Recordset")
Rs.open sql,conn,1,1
total  = rs.RecordCount
%>
<head>
<title><%= LingFengNet_MS_language_title_oklist %></title>
<%  
  call htmlmeta() 
%> 
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
</head>
<body onkeydown=EnableKey() >
<div align="center"> 
<%
call htmltop()
call htmlbr()
call htmladminmen()
call htmlbr()
%>
<table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="bgc2"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr>
            <td height="20" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_syslist_mes_1 %></td>
          </tr>
          <tr>
            <td width="75%" height="20" align="left" class="bgc1">
                <ul>
                  <li><span class="bgc"> <a href="admin_errlist.asp"><%= LingFengNet_MS_language_syslist_mes_2 %></a></span></li>
                  <li><span class="bgc"> <a href="admin_oklist.asp"><%= LingFengNet_MS_language_syslist_mes_3 %></a></span></li>
            </ul></td>
          </tr>
          <tr>
            <td width="75%" height="20" align="left" class="bgc">&ensp;</td>
          </tr>
      </table></td>
    </tr>
  </table>
<%
if rs.eof and rs.bof then
call htmlbr()
call htmlno()
page_no=1
else
call htmlbr()
pagesetup=LingFengNet_MS_mypagesize '设定每页的显示数量
Rs.pagesize=LingFengNet_MS_mypagesize
page=Request.QueryString("page")
if len(page)>LingFengNet_MS_pagemax then response.redirect "oklist"&Get_Suffix() 
if (page-Rs.pagecount) > 0 then
page=Rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
Rs.absolutepage=page

do while not Rs.eof
i = i + 1
if i > Rs.pagesize then
exit do
end if
%>
  <table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="bgc2"> 
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="25%" rowspan="5" align="left" valign="top" class="bgc"> &ensp;<%= LingFengNet_MS_language_oklist_mes_1 %> <b><%=i+(page-1)*rs.pagesize%></b> 
              <%= LingFengNet_MS_language_oklist_mes_2 %><br>
            </td>
            <td height="20" align="left" class="bgc"><%=rs("okpass")%><%= LingFengNet_MS_language_oklist_mes_3 %><%=rs("addtime")%> </td>
          </tr>
          <tr> 
            <td width="75%" height="20" align="left" class="bgc1"><%=rs("okpass")%><%= LingFengNet_MS_language_oklist_mes_4 %><a href="http://www.lfmesss.com/lfmesss/ip/index.asp?ip=<%=rs("ip")%>&search=<%=rs("ip")%>" target="_blank"><%= LingFengNet_MS_language_errlist_mes_7 %>&ensp;<%=rs("ip")%>&ensp;<%= LingFengNet_MS_language_errlist_mes_8 %></a></td>
          </tr>
          <tr> 
            <td width="75%" height="20" align="left" class="bgc"><%=rs("okpass")%><%= LingFengNet_MS_language_oklist_mes_5 %><%=rs("okname")%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
Rs.movenext
loop
call htmlbr()
  if page_no<>1 then
  call htmlpage()
end if
end if
%>
</div>
</body>
</html>
<%
call htmlend()
%>