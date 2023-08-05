<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="ubblabel.asp"-->
<!--#INCLUDE FILE="ubbcode.asp"-->
<script language=javascript>
function exit(id)
{
if(!confirm('确认删除个主题？将连同回复一起删除'))
return;
url ="show.asp?del=ok&id="+id
window.location.href =url 
}

function exit1(id1,id)
{
if(!confirm('确认删除这条回复？'))
return;
url ="show.asp?del=ok&type1=ok&id="+id1+"&id1="+id
window.location.href =url 
}

function guestpreview()
{
document.preview.content.value=document.form.Content.value;
var popupWin = window.open('GuestPreview.asp', 'GuestPreview', 'scrollbars=yes,width=620,height=230');
document.preview.submit()
}
</script>
<%
Set rs=Server.CreateObject("ADODB.RecordSet")
Set rs1=Server.CreateObject("ADODB.RecordSet")
session("useridname")=Request.cookies("ly")("useridname")
session("useridpassword")=Request.cookies("ly")("useridpassword")
if session("useridname")<>"" then
	rs.open "select level1 from register where username='"&session("useridname")&"'",conn,1,1
	if not rs.eof then
		if rs("level1")="管理员" then session("admin")=1
		if rs("level1")="版主" then session("admin")=2
		if rs("level1")<>"版主" and rs("level1")<>"管理员" then session("admin")=0
	else
		session("admin")=0
	end if
	rs.close
end if
if not rs11("regshow") and session("useridname")="" then response.Redirect "error.asp?info=您尚未登录，不能查看留言内容！"
webname=rs11("webname")
homepage=rs11("weblink")
show=rs11("show")
del=no
type1=no
del=request("del")
type1=request("type1")
if del="ok" and ((session("admin")=1) or (session("admin")=2)) then
		
if type1="ok" then 
	dsql="delete From reply where id1="&request("id")	
	conn.execute(dsql)
	rs.open "Select * from guest where ID = " & request("ID1"),conn,2,3
	rs("hf")=rs("hf")-1
	rs1.open "Select * from reply where id="&rs("id")&" order by id1 desc",conn,1,1
	if rs1.eof then 
		rs("lastname")="——" 
		rs("lastdate")=rs("lydate")
	else 
		rs("lastname")=rs1("replyname")
		rs("lastdate")=rs1("replydate")
	end if
	rs.update
	rs1.close
	response.Redirect "show.asp?id="&request("id1")
else
	rs.open "Select * from guest where ID = " & request("ID"),conn,2,3
	dsql="delete from reply where id="&request("id")
	conn.execute(dsql)
	dsql="delete From guest where id="&request("id")
	conn.execute(dsql)
	response.Redirect "default.asp"
end if
set rs=nothing
set rs1=nothing
end if

sh=no
type1=no
sh=request("sh")
type1=request("type1")
if sh="ok" and ((session("admin")=1) or (session("admin")=2)) then
if type1="ok" then 
	dsql="update reply set mark=1 where id1="&request("id1")	
	conn.execute(dsql)
else
	rs.open "Select * from guest where ID = " & request("ID"),conn,2,3
	dsql="update guest set mark=1 where id="&request("id")
	conn.execute(dsql)
	if request("all")="1" then
		dsql="update reply set mark=1 where id="&request("id")	
		conn.execute(dsql)	
	end if
end if
set rs=nothing
set rs1=nothing
response.Redirect "show.asp?id="&request("id")
end if

if (request("act")<>"") and ((session("admin")=1) or (session("admin")=2)) then
select case request("act")
case 0
	rs.open "Select count(*) as hfcount from reply where ID = " & request("ID"),conn,1,1
	dsql="update guest set hf="&rs("hfcount")&" where id="&request("id")	
	conn.execute(dsql)
	rs.close
	rs.open "Select * from guest where ID = " & request("ID"),conn,3,3
	rs1.open "Select * from reply where id="&request("id")&" order by id1 desc",conn,1,1
	if rs1.eof then 
		rs("lastname")="——" 
		rs("lastdate")=rs("lydate")
	else 
		rs("lastname")=rs1("replyname")
		rs("lastdate")=rs1("replydate")
	end if
	rs.update
	rs.close
	rs1.close
case 1
	dsql="update guest set top1=1 where id="&request("id")	
	conn.execute(dsql)
case 2
	dsql="update guest set top1=0 where id="&request("id")	
	conn.execute(dsql)
case 3
	dsql="update guest set jinghua=1 where id="&request("id")	
	conn.execute(dsql)
case 4
	dsql="update guest set jinghua=0 where id="&request("id")	
	conn.execute(dsql)
case 5
	dsql="update guest set lock=1 where id="&request("id")	
	conn.execute(dsql)	
case 6
	dsql="update guest set lock=0 where id="&request("id")	
	conn.execute(dsql)		
case 7
	dsql="update guest set lastdate='"&now&"' where id="&request("id")	
	conn.execute(dsql)		
end select
end if

ID1=request("id")
up1="no"
next1="no"
up1=request("up")
next1=request("next")
	if up1="ok" then 
		rs.open "Select * from guest where ID < " & ID1,conn,3,3
		if rs.recordcount=0 then 
		rs.close
		rs.open "select * from guest where ID="&ID1,conn,3,3
		end if
		rs.movelast
		rs1.open "Select * from reply where ID = " & rs("id")&" order by replydate",conn,3,3
	end if
	if next1="ok" then
		rs.open "Select * from guest where ID > " & ID1,conn,3,3
		if rs.recordcount=0 then 
		rs.close
		rs.open "select * from guest where ID="&ID1,conn,3,3
		end if
		rs1.open "Select * from reply where ID = " & rs("id")&" order by replydate",conn,3,3
	end if
	if (up1<>"ok") and (next1<>"ok") then
		rs.open "Select * from guest where ID = " & ID1,conn,3,3
		rs1.open "Select * from reply where ID = " & ID1&" order by replydate",conn,3,3
	end if
	if (not rs("mark")) and show and ((session("admin")<>1) and (session("admin")<>2)) then response.Redirect("error.asp?info=本留言为未审核，不能查看！")
	rs("yd")=rs("yd")+1
	rs.update
Set rs4=server.createobject("ADODB.RECORDSET")
rs4.open "Select * From option1" ,Conn,3,3
if rs1.recordcount<>0 then
	 dim maxperpage,url,PageNo
	 url="show.asp?id="&id1
     rs1.pagesize=10
	 PageNo=REQUEST("PageNo")
	 maxperpage=rs.pagesize
	 if PageNo="" or PageNo=0 then PageNo=1
	 rs1.AbsolutePage=PageNo
	 TSum=rs1.pagecount
	 RowCount=rs1.PageSize
	 PageNo=PageNo+1
	 PageNo=PageNo-1
else
	PageNo=1
	TSum=1
end if
%>
<SCRIPT language=javascript>
function  save_onclick()
{
  var strTemp = document.form.UserName.value;
  if (strTemp.length == 0 )
  {
      alert("请输入用户名！");
      document.form.UserName.focus();
      return false;
  }
  var strTemp = document.form.Content.value;
  if (strTemp.length == 0 )
  {
      alert("请填写留言内容！");
      document.form.Content.focus();
      return false;
  }
  return true;  
}
</SCRIPT>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>显示回复留言</title>
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body onkeydown="if(event.keyCode==13 && event.ctrlKey) if(save_onclick())document.form.submit()">
<div align="center">
<!--#INCLUDE FILE="top.asp"-->
</div>
<table border=0 width=100% align=center>
        <tr> 
          <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table></td>
	   </tr>
	   <tr>
	     <td>
  	      <table border=0 width=100% align=center>
      <tr>
        <td width="3%" align=left><font color="#FF0000">&nbsp;<img src="images/back.gif" width="17" height="17"></font></td>
        <td width="15%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">回留言列表</a></td>
        <td width="82%" align=right>
          <!--#INCLUDE FILE="link.asp"-->        </td>
    </table>
  </tr>
	    <tr><td><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr> 
        <td width="58%"><font color="#FF0000">&nbsp;<img src="images/home.gif" width="16" height="16"><a href="<%=homepage%>"><%=webname%>首页</a> 
          <img src="images/style.gif" align=absmiddle></font><a href="default1.asp">留言板方式查看</a> 
        配色：
        <select name="skin" id="skin" onChange="javascript:location.href='show.asp?id='+document.all.id.value+'&skin='+document.all.skin.value">
          <option value="1" selected>蓝天白云</option>
          <option value="2" <%if skin=2 then response.write("selected")%>>水晶紫色</option>
          <option value="3" <%if skin=3 then response.write("selected")%>>秋意盎然</option>
          <option value="4" <%if skin=4 then response.write("selected")%>>绿野仙踪</option>
          <option value="5" <%if skin=5 then response.write("selected")%>>浓浓绿意</option>
          <option value="6" <%if skin=6 then response.write("selected")%>>橘子红了</option>
        </select></td>
        <td width="20%"><div align="center">您是本留言第 <span style="font-weight: bold"><%=rs("yd")%></span> 个阅读者 </div></td>
        <td width="3%" valign="middle"> <div align="right"> <a href="show.asp?up=ok&id=<%=rs("ID")%>"><img src="images/prior.gif" width="12" height="11" border="0"></a></div></td>
        <td width="8%" valign="middle"><div align="center"><a href="show.asp?up=ok&id=<%=rs("ID")%>">上一条留言</a></div></td>
        <td width="8%" valign="middle"><div align="center"><a href="show.asp?next=ok&id=<%=rs("ID")%>">下一条留言</a></div></td>
        <td width="3%" valign="middle"><a href="show.asp?next=ok&id=<%=rs("ID")%>"><img src="images/next.gif" width="12" height="11" border="0"></a></td>
      </tr>
    </table>
    
  </td>
</tr>
        <tr>
		 
  <td align=left> 
    <table width="100%" cellpadding="5" cellspacing="1" align="center" class="tablebg<%=skin%>b">
      <tr class="tablebg<%=skin%>a"> 
        <td> <div align="left"><strong>* 留言主题： 
            <%if rs("subject")="" then %>
            无标题 
            <%else%>
            <font color="<%=rs("fontcolor")%>"><%=rs("subject")%></font> 
            <%end if%>
            <input name="id" type="hidden" id="id" value="<%=request("id")%>">
</strong> </div></td>
      </tr>
    </table>
	<%
	if (rs1.recordcount=0) or (PageNo=1) then%>
    <table width="100%" align=center cellpadding="5" cellspacing="1" <%if bg mod 2=0 then%>class="tablebg<%=skin%>e"<%else%>class="tablebg<%=skin%>f"<%end if%>>
      <tr> 
        <td width="18%" rowspan="3" align=center valign="top" class="tablebg<%=skin%>h"> 
          <table width="100%" border="0" align="center" >
            <tr> 
              <td width="61%"> 
                <div align="right"><font color=#0066CC><b>
                  <%if rs("username")<>"" then%>
                  <%=rs("username")%> 
                  <%else%>
                  无名氏 
                  <%end if%>
                    </b></font>
                </div></td>
              <td width="40%"> 
                <div align="left">
                  <%
			  Set rs2=server.createobject("ADODB.RECORDSET")
			  sql2="SELECT * FROM register where username='"&rs("username")&"'"
			  rs2.open sql2,conn,3,3
			  if not rs2.eof then
			if Instr(rs2("level1"),"嘉宾")>0 then%>
                  <font color=#000000><img src="images/fbz.gif" alt="嘉宾" width="16" height="16"></font> 
                  <%end if
			if Instr(rs2("level1"),"版主")>0 then%>
                  <font color=#000000><img src="images/bz.gif" alt="版主" width="16" height="16"></font> 
                  <%end if
			if rs2("level1")="管理员"  then%>
                  <img src="images/gly.gif" alt="管理员" width="15" height="18"> 
                  <%	end if
			  end if
			%>
                  <%
			  if not rs2.eof then
			  %>
                  <%if rs2("sex")="1" then%>
                  <img src="images/man.gif" alt="GG" width="20" height="14"> 
                  <%end if%>
                  <%if rs2("sex")="0" then%>
                  <img src="images/woman.gif" alt="MM" width="20" height="14"> 
                  <%end if%>
                  <%else%>
                  <%if rs("sex")="1" then%>
                  <img src="images/man.gif" alt="GG" width="20" height="14"> 
                  <%end if%>
                  <%if rs("sex")="0" then%>
                  <img src="images/woman.gif" alt="MM" width="20" height="14"> 
                  <%end if%>
                  <%end if%>
              </div></td>
            </tr>
          </table>        
          <br>
          <%if not rs2.eof then%>
          <img src="<%if rs2("myface")<>"" then %><%=rs2("myface")%>" width="<%=int(rs2("facewidth"))%>" height="<%=int(rs2("faceheight"))%>"><%else%><%=rs2("face")%>" width="72" height="122"> <%end if%>
          <%else if rs("face")="" then%>
          <img src="face/1.gif"> 
          <%else%>
          <img src="<%=rs("face")%>" width="72"> 
          <%end if%>
          <%end if%>
          <br>
          <%
			  if not rs2.eof then
			  %>
          头衔：<%=rs2("level1")%><br>
            发言数：<%=rs2("count1")%> 
            <%end if%>
        </p>        </td>
        <td height="150" colspan="2" valign="top" <%if rs("edituser")<>"" then%><%else%>class="tablebg<%=skin%>i"<%end if%>> 
          <br>          <table border="0" width="100%" cellspacing="0" cellpadding="2" style="word-break:break-all; text-align:justify;">
            <tr valign=top>
              <td width="5%" ><img src="images/<%=rs("pic")%>" > </td>
              <td width="95%"><%if not rs("secret") then%>
                <%=ubbcode(rs("content"))%>
                <%else 
			  response.Write "<font color=#FF0000>◎该留言为悄悄话◎</font><br>" 
			  if session("useridname")=rs("username") or (session("admin")=1 or session("admin")=2) then%>
                <%=ubbcode(rs("content"))%>
                <%end if%>
              <%end if%></td>
            </tr>
          </table></td>
      </tr><%if rs("edituser")<>"" then%>
      <tr>
        <td height="5" colspan="2" valign="top" class="tablebg<%=skin%>i"><div align="right">[本主题已被<%=rs("edituser")%>于<%=rs("edittime")%>编辑过]</div></td>
      </tr><%end if%>
      <tr> 
        <td width="49%" height="5" Valign=middle><font color="#000000"><img src="images/time.gif" width="16" height="15"> 
          <%if left(rs("lydate"),1)=0 then response.write "20"&rs("lydate") else response.write rs("lydate")%>
          </font> <IMG SRC="images/mailto.gif"  BORDER="0"> 
          <%if not rs2.eof then%>
          <%if rs2("mail")<>"" then%>
          <%if ((session("admin")=1) or (session("admin")=2)) or (rs11("showmail")) then%><a href="mailto:<%=rs2("mail")%>"> <%end if%>
          <%end if%>
          邮件</a> 
          <%else%>
          <%if rs("mail")<>"" then%>
          <%if ((session("admin")=1) or (session("admin")=2)) or (rs11("showmail")) then%><a href="mailto:<%=rs("mail")%>"> <%end if%>
          <%end if%>
          邮件</a> 
          <%end if%>
          <img src="images/home.gif" width="16" height="16"> 
          <%if not rs2.eof then%>
          <%if rs2("homepage")<>"" then%>
          <a href="<%=rs2("homepage")%>" target="_blank"> 
          <%end if%>
          主页</a> 
          <%else%>
          <%if rs("homepage")<>"" then%>
          <a href="<%=rs("homepage")%>" target="_blank"> 
          <%end if%>
          主页</a> 
          <%end if%>
          <img src="images/qq.gif"> 
          <%if not rs2.eof then%>
          <%if rs2("qq")<>"" then%>
          <a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs2("qq")%>" target="_blank"> 
          <%end if%>
          QQ</a> 
          <%else%>
          <%if rs("qq")<>"" then%>
          <a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs("qq")%>" target="_blank"> 
          <%end if%>
          QQ</a> 
          <%end if%>
          <img src="images/ip.gif" > <%if (session("admin")=1) or (session("admin")=2) then response.write(rs("ip")) else response.write("IP")%></td>
        <td width="33%" height="5" Valign=middle> 
          <div align="right">
            <%if (session("admin")=1) or (session("admin")=2) then%>
            <%if (not rs("mark")) and show then%><img src="images/sh.gif" alt=sh width="16" height="16" border="0"><a href="show.asp?sh=ok&id=<%=rs("id")%>">审核</a><%end if%>            <img src="images/dele.gif" alt=Delete border="0"><a href="javascript:exit('<%=rs("id")%>');">删除</a> 
            <%end if%>
            <%if not rs("lock") then%>
            <img src="images/edit.gif" width="13" height="15"><a href="guest_edit.asp?ID=<%=rs("ID")%>">修改</a> 
            <%if (not rs4("adminreply")) or (session("admin")=1) or (session("admin")=2) then%><%if rs11("muieditor")=1 then%><img src="images/yy.gif" width="16" height="16"><a href="guest_reply.asp?id=<%=rs("id")%>&quote=1">引用</a><%end if%>
			<img src="images/reply.gif" alt=Reply border="0"><a href="guest_reply.asp?id=<%=rs("id")%>">回复</a><%end if%> 
            <%end if%>        
        </div></td>
      </tr>
    </table>
	<%rs2.close%>
	<%end if%>
	<%bg=1%>
<% DO WHILE NOT rs1.EOF AND RowCount>0%> 
    <table width="100%" align="center" cellpadding="5" cellspacing="1" <%if bg mod 2=0 then%>class="tablebg<%=skin%>e"<%else%>class="tablebg<%=skin%>f"<%end if%>> 
      <tr> 
        <td width="18%" rowspan="3" align=center valign="top" class="tablebg<%=skin%>h">
<table width="100%" border="0" align="center" >
            <tr> 
              <td width="63%">  
                <div align="right"><font color=#0066CC><b>
                  <%if rs1("replyname")<>"" then%>
                  <%=rs1("replyname")%> 
                  <%else%>
                  无名氏 
                  <%end if%>
                    </b></font>
                </div></td>
              <td width="40%"> 
                <div align="left">
                  <%Set rs3=server.createobject("ADODB.RECORDSET")
			  sql3="SELECT * FROM register where username='"&rs1("replyname")&"'"
			  rs3.open sql3,conn,3,3
			if not rs3.eof then
			if Instr(rs3("level1"),"嘉宾")>0 then%>
                  <font color=#000000><img src="images/fbz.gif" alt="嘉宾" width="16" height="16"></font> 
                  <%end if
			if Instr(rs3("level1"),"版主")>0 then%>
                  <font color=#000000><img src="images/bz.gif" alt="版主" width="16" height="16"></font> 
                  <%end if
			if rs3("level1")="管理员" then%>
                  <img src="images/gly.gif" alt="管理员" width="15" height="18"> 
                  <%end if
			  end if
			%>
                  <%if not rs3.eof then%>
                  <%if rs3("sex")="1" then%>
                  <img src="images/man.gif" alt="GG" width="20" height="14"> 
                  <%end if%>
                  <%if rs3("sex")="0" then%>
                  <img src="images/woman.gif" alt="MM" width="20" height="14"> 
                  <%end if%>
                  <%else%>
                  <%if rs1("sex")="1" then%>
                  <img src="images/man.gif" alt="GG" width="20" height="14"> 
                  <%end if%>
                  <%if rs1("sex")="0" then%>
                  <img src="images/woman.gif" alt="MM" width="20" height="14"> 
                  <%end if%>
                  <%end if%>
              </div></td>
            </tr>
          </table>
            <font color="#000000"> 
            <%if not rs3.eof then%>
            <img src="<%if rs3("myface")<>"" then %><%=rs3("myface")%>" width="<%=int(rs3("facewidth"))%>" height="<%=int(rs3("faceheight"))%>"><%else%><%=rs3("face")%>" width="72" height="122"> <%end if%>
            <%else%>
            <img src="<%=rs1("face")%>" width="72"> 
            <%end if%>
            </font> <br>
          <%
			  if not rs3.eof then
			  %>
          头衔：<%=rs3("level1")%><br>
            发言数：<%=rs3("count1")%> 
            <%
			end if%>
            <br>
        </p>        </td>
        <td height="150" colspan="2" Valign=top <%if rs1("edituser")<>"" then%><%else%>class="tablebg<%=skin%>i"<%end if%>> 
          <br>
          <table border="0" width="100%" cellspacing="0" cellpadding="2" style="word-break:break-all">
            <tr valign=top>
              <td width="5%" ><img src="images/<%=rs1("pic")%>" > </td>
              <td width="95%"><%if not rs1("secret") then
                if not show then
					response.Write(ubbcode(rs1("replycontent")))
				else if not rs1("mark") then 
					response.Write "<font color=#FF0000>◎该留言未审核◎</font><br>"
			  		if ((session("useridname")=rs1("replyname")) or (session("admin")=1) or (session("admin")=2) or (session("useridname")=rs("username"))) then
                		response.Write(ubbcode(rs1("replycontent")))
                	end if
					else response.Write(ubbcode(rs1("replycontent")))
					end if
				end if
                else 
			  response.Write "<font color=#FF0000>◎该留言为悄悄话◎</font><br>" 
			  if ((session("useridname")=rs1("replyname")) or (session("admin")=1) or (session("admin")=2) or (session("useridname")=rs("username"))) then%>
                <%=ubbcode(rs1("replycontent"))%>
                <%end if%>
              <%end if%></td>
            </tr>
        </table></td>
      </tr><%if rs1("edituser")<>"" then%>
      <tr>
        <td height="5" colspan="2" Valign=top class="tablebg<%=skin%>i"><div align="right">[本回复已被<%=rs1("edituser")%>于<%=rs1("edittime")%>编辑过]</div></td>
      </tr><%end if%>
      <tr> 
        <td width="49%" height="5" Valign=middle><font color="#000000"><img src="images/time.gif"> 
          <%if left(rs1("replydate"),1)=0 then response.write "20"&rs1("replydate") else response.write rs1("replydate")%>
          </font> <IMG SRC="images/mailto.gif"> 
          <%if not rs3.eof then%>
          <%if rs3("mail")<>"" then%>
          <%if ((session("admin")=1) or (session("admin")=2)) or (rs11("showmail")) then%><a href="mailto:<%=rs3("mail")%>"><%end if%>
          <%end if%>
          邮件</a> 
          <%else%>
          <%if rs1("mail")<>"" then%>
          <%if ((session("admin")=1) or (session("admin")=2)) or (rs11("showmail")) then%><a href="mailto:<%=rs1("mail")%>"><%end if%> 
          <%end if%>
          邮件</a> 
          <%end if%>
          <img src="images/home.gif"> 
          <%if not rs3.eof then%>
          <%if rs3("homepage")<>"" then%>
          <a href="<%=rs3("homepage")%>" target="_blank"> 
          <%end if%>
          主页</a> 
          <%else%>
          <%if rs1("homepage")<>"" then%>
          <a href="<%=rs1("homepage")%>" target="_blank"> 
          <%end if%>
          主页</a> 
          <%end if%>
          <img src="images/qq.gif"> 
          <%if not rs3.eof then%>
          <%if rs3("qq")<>"" then%>
          <a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs3("qq")%>" target="_blank"> 
          <%end if%>
          QQ</a> 
          <%else%>
          <%if rs1("qq")<>"" then%>
          <a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs1("qq")%>" target="_blank"> 
          <%end if%>
          QQ</a> 
          <%end if%>
          <img src="images/ip.gif"> <%if (session("admin")=1) or (session("admin")=2) then response.write(rs1("ip")) else response.write("IP")%></td>
        <td width="33%" height="5" Valign=middle> 
          <div align="right">
            <%if (session("admin")=1) or (session("admin")=2) then%>
            <%if (not rs1("mark")) and show then%><img src="images/sh.gif" alt=Delete width="16" height="16" border="0"><a href="show.asp?sh=ok&type1=ok&id=<%=rs1("id")%>&id1=<%=rs1("id1")%>">审核</a>
            <%end if%>            <img src="images/dele.gif" alt=Delete border="0"><a href="javascript:exit1('<%=rs1("id1")%>','<%=rs1("id")%>');">删除</a> 
            <%end if%>
            <%if not rs("lock") then%>
            <img src="images/edit.gif" width="13" height="15"><a href="reply_edit.asp?ID=<%=rs1("ID1")%>">修改</a>
			<%if (rs11("muieditor")=1) and (not rs4("adminreply")) or (session("admin")=1) or (session("admin")=2) then%>
			<%if rs11("muieditor")=1 then%><a href="guest_reply.asp?id=<%=rs1("id")%>&id1=<%=rs1("id1")%>&quote=1"><img src="images/yy.gif" alt=Reply width="16" height="16" border="0">引用</a><%end if%> 
            <img src="images/reply.gif" alt=Reply border="0"><a href="guest_reply.asp?id=<%=rs("id")%>">回复</a><%end if%> 
            <%end if%>        
        </div></td>
      </tr>
    </table>
    <%
bg=bg+1
RowCount = RowCount - 1
i=i-1
rs1.movenext
Loop%>
    <table width="100%" border="0" align="center">
      <tr> 
        <td> 
          <div align="right">        </div>          <div align="right">
            <% call showpage(url,rs1.RECORDCOUNT,maxperpage,false,true,"条回复") %>
          </div></td>
      </tr>
    </table> 
    <p>
    <font size="2"><a name="replay" id="replay"></a></font>
    </p>
<%if not rs("lock") then%>
	<%if (not rs4("adminreply")) or (session("admin")=1) or (session("admin")=2) then%>
	<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
	<form action="reply_post.asp" method="post" name="form" id="form">
  <tr class="tablebg<%=skin%>a">
    <td colspan="4">
      <p align="center"><strong>快速回复</strong> </td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td width="220" align="center"><div align="left"><strong>用户名：<br>
    </strong></div></td>
    <td width="133" height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="UserName" type="text" class="input1" value="<%=session("useridname")%>" size="15">
    </font></div></td>
    <td width="93" align="center"><div align="left"><strong>密码：</strong></div></td>
    <td width="481" align="center"><div align="left">
      <input name="password" type="password" class="input1" id="password3" value="<%=session("useridpassword")%>" size="15">
      <%if session("useridname")="" then
	  if rs4("register") then%>
必填
<%else%>
(可不填，此项自动注册用户名)
<%end if%>
<%
end if
rs4.close%>
</div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td width="220" align="center"><div align="left"><strong>留言图标：</strong></div></td>
    <td height="28" colspan="3" align="center"><div align="left"><font color="#FFFFFF">
        </font>
        <table border="0" width="66%" cellspacing="1" cellpadding="0">
          <tr>
            <td width="5%" align="center">
              <input name="pic" type="radio" value="p16.gif" checked>
            </td>
            <td width="5%"><img src="images/p16.gif" width="22" height="22" border="0"></td>
            <td width="5%" align="center">
              <input type="radio" value="p2.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p2.gif" width="19" height="19" border="0"></td>
            <td width="5%" align="center">
              <input type="radio" value="p3.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p3.gif" width="19" height="19" border="0"></td>
            <td width="5%" align="center">
              <input type="radio" value="p4.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p4.gif" width="19" height="19" border="0"></td>
            <td width="5%">
              <input type="radio" value="p5.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p5.gif" width="19" height="19" border="0"></td>
            <td width="5%">
              <input type="radio" value="p6.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p6.gif" width="19" height="19" border="0"></td>
            <td width="5%">
              <input type="radio" value="p7.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p7.gif" width="22" height="22" border="0"></td>
            <td width="5%">
              <input type="radio" value="p8.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p8.gif" width="22" height="22" border="0"></td>
            <td width="5%">
              <input type="radio" value="p9.gif" name="pic">
            </td>
            <td width="5%"><img border="0" src="images/p9.gif" width="19" height="19"></td>
            <td width="7%"><input type="radio" value="p10.gif" name="pic"></td>
            <td width="3%"><img border="0" src="images/p10.gif" width="19" height="19"></td>
            <td width="1%"><input type="radio" value="p11.gif" name="pic">              </td>
            <td width="2%"><img border="0" src="images/p11.gif" width="22" height="22"></td>
          </tr>
          <tr>
            <td align="center">
              <input type="radio" value="p12.gif" name="pic">
            </td>
            <td><img border="0" src="images/p12.gif" width="19" height="19"></td>
            <td align="center">
              <input type="radio" value="p13.gif" name="pic">
            </td>
            <td><img border="0" src="images/p13.gif" width="19" height="19"></td>
            <td align="center">
              <input type="radio" value="p14.gif" name="pic">
            </td>
            <td><img border="0" src="images/p14.gif" width="22" height="22"></td>
            <td align="center">
              <input type="radio" value="p15.gif" name="pic">
            </td>
            <td><img border="0" src="images/p15.gif" width="22" height="22"></td>
            <td>
              <input type="radio" value="p1.gif" name="pic">
            </td>
            <td><img border="0" src="images/p1.gif" width="22" height="22"></td>
            <td>
              <input type="radio" value="p17.gif" name="pic">
            </td>
            <td><img border="0" src="images/p17.gif" width="22" height="22"></td>
            <td>
              <input name="pic" type="radio" value="p18.gif">
            </td>
            <td><img border="0" src="images/p18.gif" width="22" height="22"></td>
            <td>
              <input type="radio" value="p19.gif" name="pic">
            </td>
            <td><img border="0" src="images/p19.gif" width="22" height="22"></td>
            <td>
              <input type="radio" value="p20.gif" name="pic">
            </td>
            <td><img border="0" src="images/p20.gif" width="22" height="22"></td>
            <td><input type="radio" value="p21.gif" name="pic"></td>
            <td><img border="0" src="images/p21.gif" width="22" height="22"></td>
            <td><input type="radio" value="p22.gif" name="pic">              </td>
            <td><img border="0" src="images/p22.gif" width="22" height="22"></td>
          </tr>
        </table>
    </div></td>
  </tr><%if rs11("muieditor")<>0 then%>
  <tr class="tablebg<%=skin%>d">
    <td align="center"><div align="left" style="font-weight: bold">Ubb标签：</div></td>
    <td height="28" colspan="3" align="center"><div align="left"><% call showubb()%></div></td>
  </tr><%end if%>
  <tr class="tablebg<%=skin%>d">
    <td width="220" align="center"><div align="left"><strong>回复内容：</strong></div></td>
    <td height="28" colspan="3" align="center"><div align="left">
        <font color="#00FF00">
        <textarea name="Content" cols="65" rows="7" class="input1" id="textarea"></textarea>
        <input name="id2" type="hidden" id="id22" value="<%=id1%>">
        <input name="all" type="hidden" id="all2" value="0">
</font></div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td width="220" align="center"><div align="left"><strong>留言功能：</strong></div></td>
    <td height="28" colspan="3" align="center"><div align="left">
        <input name="secret" type="checkbox" id="secret2" value="1">
悄悄话(只有<strong>登录</strong>后才可看到自己的留言及回复的内容)    </div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="28" colspan="4" align="center"><input name="join" type="submit" class="input2" id="join3" value=" 提 交 " >
　
  <input name="join" type="button" class="input2" id="join3" value=" 预 览 " onclick=guestpreview()>
　  <input name="B12" type="reset" class="input2" id="B123"  value=" 重 写 "  >
(Ctrl+Enter提交)</td>
  </tr>
</form>
</table>
		<form name=preview action="GuestPreview.asp" method=post target=GuestPreview>
		<input type=hidden name=title value=><input type=hidden name=content value=>
		</form>
<%end if%>
<%end if%>
<%
rs1.close
set rs4=nothing
	  set guest=nothing 
      set rs = nothing
	  set rs1 = nothing
	  set rs2 = nothing
	  set rs3 = nothing%>
<%if (session("admin")=1) or (session("admin")=2) then%>
<table width="100%" border="0" align="center">
  <tr>
    <td>        <div align="right"><span style="font-weight: bold">管理选项：</span><a href="show.asp?act=0&id=<%=request("id")%>">修复</a> | <a href="show.asp?act=1&id=<%=request("id")%>">固顶</a> | <a href="show.asp?act=2&id=<%=request("id")%>">解固</a> | <a href="show.asp?act=3&id=<%=request("id")%>">加精</a> | <a href="show.asp?act=4&id=<%=request("id")%>">解精</a> | <a href="show.asp?act=5&id=<%=request("id")%>">锁定</a> | <a href="show.asp?act=6&id=<%=request("id")%>">解锁</a> | <a href="show.asp?act=7&id=<%=request("id")%>">提前</a> | <a href="show.asp?del=ok&id=<%=request("id")%>">删除</a> | <a href="show.asp?sh=ok&id=<%=request("id")%>&all=1">审核全部</a>
    </div></td>
  </tr>
</table>
    <%end if%>
    <table border=0 width=100% align=center>
      <tr> 
        <td width="100%"> 
          <%  
	  %>        </td>
      </tr>
      <tr> 
        <td height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
      </tr>
      <tr> 
        <td align=center> 
          <!--#INCLUDE FILE="bottom.asp"-->
      </tr>
    </table>
    <p>&nbsp;</p></body>
</html>
