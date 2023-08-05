<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<% 
   Set rs=server.createobject("ADODB.RECORDSET")
   if request.Form("text")<>"" then
   	sql="SELECT * FROM register where username='"&request.Form("text")&"' order by count1 desc,id"
   else
   	sql="SELECT * FROM register order by count1 desc,id"
   end if
   rs.open sql,conn,1,1
   	 dim maxperpage,url,PageNo
	 url="user_line.asp"
	 Set rs1=server.createobject("ADODB.RECORDSET")
     rs1.open "Select * From option1",Conn,3,3
     rs.pagesize=rs1("row2")
	 maxperpage=rs.pagesize
	 rs1.close
	 PageNo=REQUEST("PageNo")
	 if PageNo="" or PageNo=0 then PageNo=1
	 RS.AbsolutePage=PageNo
	 TSum=rs.pagecount
	 RowCount=rs.PageSize
	 PageNo=PageNo+1
	 PageNo=PageNo-1
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发言排名</title>
<link href="1.css" rel="stylesheet" type="text/css">
</head>

<body>
<table border=0 width=100% align=center>
        <tr> 
          <td width="100%" align=center> 
            <!--#INCLUDE FILE="top.asp"-->        </tr>
        <tr> 
          <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table></td>
<table border=0 width=100% align=center>
    <tr><td width="3%" align=left> <font color="#FF0000"><img src="images/home.gif" border=0></font><font color=#000000>&nbsp;</font></td>
      <td width="14%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">留言首页</a></td>
      <td width="83%" align=right>
      <!--#INCLUDE FILE="link.asp"-->    </td>
</table>
<HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0>
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a">
    <td width="149" bordercolorlight="#000000" bordercolordark="#C0C0C0"><p align="center"><b>用户名</b> </td>
    <%if ((session("admin")=1) or (session("admin")=2)) or (rs11("showmail")) then%><td width="259" bordercolorlight="#000000" bordercolordark="#C0C0C0"><div align="center"><b>电子邮件</b></div></td><%end if%>
    <td width="292" bordercolorlight="#000000" bordercolordark="#C0C0C0"><div align="center"><b>个人主页</b></div></td>
    <td width="66" bordercolorlight="#000000" bordercolordark="#C0C0C0"><div align="center"><strong>QQ</strong></div></td>
    <td width="90" bordercolorlight="#000000" bordercolordark="#C0C0C0"><div align="center"><b>头衔</b></div></td>
    <td width="66" bordercolorlight="#000000" bordercolordark="#C0C0C0"><div align="center"><b>发言数</b></div>    </td>
  </tr>
<% DO WHILE NOT rs.EOF AND RowCount>0%>
  <tr class="tablebg<%=skin%>d">
    <td><div align="center"><font color=#000000><%=rs("username")%></font></div></td>
    <%if ((session("admin")=1) or (session("admin")=2)) or (rs11("showmail")) then%><td><div align="center"><font color=#000000><a href="mailto:<%=rs("mail")%>"><%=rs("mail")%></a></font></div></td><%end if%>
    <td><div align="center"><font color=#000000><a href="<%=rs("homepage")%>" target="_blank"><%=rs("homepage")%></a></font></div></td>
    <td><div align="center"><font color=#000000><a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs("qq")%>" target="_blank"><%=rs("qq")%></a></font></div></td>
    <td><div align="center"><font color=#000000><%=rs("level1")%></font></div></td>
    <td width="66"><div align="center"><font color=#000000><%=rs("count1")%></font></div></td>
  </tr>
  <%
      rs.MoveNext
	  RowCount = RowCount - 1 
      Loop%>
</table>
<table width="100%" border="0" align="center">
  <tr>
    <td> 
      <div align="right">
        <% call showpage(url,rs.RECORDCOUNT,maxperpage,false,true,"名注册用户") %>
    </div></td>
  </tr>
</table>
<table border=0 width=100% align=center>
          <tr>
            <td width="100%"> 
              <div align="center">
                <form name="form" method="post" action="">
                  <%  
	  set guest=nothing 
      set rs = nothing%>
                  <IMG src="images/search.gif" width="16" height="16" align=absMiddle>搜索用户名：
                  <input 
      class=input1 size=25 name=text>
　
<input name="submit" type=submit class=input2 value=" 搜 索 ">
                </form> 
            </div></td>
          </tr>
          <tr>
            <td height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
          </tr>
          <tr>
            
        <td align=center>
          <!--#INCLUDE FILE="bottom.asp"-->
      </tr></td>
</table>
</body>
</html>
