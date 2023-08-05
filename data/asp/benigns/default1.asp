<%@language=vbscript codepage=936 %>
<!--#INCLUDE file="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="ubbcode.asp"-->
<script language=javascript>
function exit(id)
{
if(!confirm('确认删除这个主题？将连同回复一起删除'))
return;
url ="default1.asp?del=ok&id="+id
window.location.href =url 
}

function exit1(id1,id)
{
if(!confirm('确认删除这条回复？'))
return;
url ="default1.asp?del=ok&type1=ok&id="+id1+"&id1="+id
window.location.href =url
}
</script>
<%session("list")=1%>
<%
	Set rs=server.createobject("ADODB.RECORDSET")
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
	rs.open "Select * From option1",Conn,3,3
	show=rs("show")
if session("showmodal")="" then
	if rs("modal")=1 then response.Redirect("default.asp")
	session("showmodal")="1"
end if

del=no
type1=no
del=request("del")
type1=request("type1")
if del="ok" and ((session("admin")=1) or (session("admin")=2)) then
if (session("admin")<>1) and (session("admin")<>2) then response.Redirect "default.asp"
		
if type1="ok" then 
	dsql="delete From reply where id1="&request("id")	
	conn.execute(dsql)
	rs.close
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
else
	rs.close
	rs.open "Select * from guest where ID = " & request("ID"),conn,2,3
	dsql="delete from reply where id="&request("id")
	conn.execute(dsql)
	dsql="delete From guest where id="&request("id")
	conn.execute(dsql)
end if
set rs=nothing
set rs1=nothing
response.Redirect "default1.asp"
end if

sh=no
type1=no
sh=request("sh")
type1=request("type1")
if sh="ok" and ((session("admin")=1) or (session("admin")=2)) then
if (session("admin")<>1) or (session("admin")<>2) then response.Redirect "default.asp"
if type1="ok" then 
	dsql="update reply set mark=1 where id1="&request("id1")	
	conn.execute(dsql)
else
	rs.close
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
response.Redirect "default1.asp"
end if

   text=request("text")
   option1=request("option")
   if option1="" then option1=0
if session("admin")="" then session("admin")=false
if request("jinghua")="1" then jinghua=" and jinghua=true" else jinghua=""
     rs1.open "Select * From option1",Conn,3,3
     webname=rs1("webname")
	 homepage=rs1("weblink")
	 reply=rs1("adminreply")
if rs1("show") and ((session("admin")<>1) and (session("admin")<>2)) then mark="(mark=true) and "
select case option1
case 1
SQL="Select * From guest where "&mark&"subject like '%"&text&"%'"&jinghua&" order by top1,lastdate desc"
case 2
SQL="Select * From guest where "&mark&"content like '%"&text&"%'"&jinghua&" order by top1,lastdate desc"
case else
sql="SELECT * FROM guest where "&mark&"1=1"&jinghua&" ORDER BY top1,lastdate DESC"
end select
	rs.close
   rs.open sql,conn,3,3
   if not rs.bof then
   	 dim maxperpage,url,PageNo
	 url="default1.asp?text="&text&"&option="&option1&"&jinghua="&request("jinghua")
	 rs.pagesize=rs1("row1")
	 maxperpage=rs.pagesize
	 rs1.close
	 PageNo=REQUEST("PageNo")
	 if PageNo="" or PageNo=0 then PageNo=1
	 RS.AbsolutePage=PageNo
	 TSum=rs.pagecount
	 RowCount=rs.PageSize
	   PageNo=PageNo+1
	   PageNo=PageNo-1
	 if CINT(PageNo)>1 then
	    if CINT(PageNo)>CINT(TSum) then
		  response.Write("对不起没有您想要的页数")
          Response.End
	    end if
	 end if		    
     if PageNo<0 then
	    response.Write("没有这一页!")
		Response.End
	 End if
	 end if
%>

<link href="1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%if rs11("lytitle")="" then%><title>多功能留言板</title><%else%><title><%=rs11("lytitle")%></title><%end if%>
    <tbody>
	  <tr>
	    
        <td align=center><div align="center">
          <!--#INCLUDE file="top.asp"-->
        </div>
        <table border=0 width=100% align=center>
        <tr> 
          <td width="100%" align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
      </table></td></tr>
	   <tr>
	     <td>
  	      <table border=0 width=100% align=center>
        <td width="26%" align=left> <font color=#000000>留言数:</font><font color=#000000><%=rs.RECORDCOUNT%></font> 
            总页数:<font color=#000000><%=TSum%></font>&nbsp; 
          第<%=PageNo%>页 </td>
	       
          <td width="74%" align=right>
            <!--#INCLUDE FILE="link.asp"--></span>          </td>
        </table>
  </tr>
	    <tr><td><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td></tr>
        <tr>
		 <td align=left><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="65%"><strong></strong><font color="#FF0000"><img src="images/home.gif" width="16" height="16"><a href="<%=homepage%>"><%=webname%>首页</a> 
            &nbsp;<img src="images/style.gif" align=absmiddle></font><a href="default.asp">讨论区方式查看</a>　配色：
            <select name="skin" id="skin" onChange="javascript:location.href='default1.asp?skin='+document.all.skin.value">
              <option value="1" selected>蓝天白云</option>
              <option value="2" <%if skin=2 then response.write("selected")%>>水晶紫色</option>
              <option value="3" <%if skin=3 then response.write("selected")%>>秋意盎然</option>
              <option value="4" <%if skin=4 then response.write("selected")%>>绿野仙踪</option>
              <option value="5" <%if skin=5 then response.write("selected")%>>浓浓绿意</option>
              <option value="6" <%if skin=6 then response.write("selected")%>>橘子红了</option>
            </select>
          <div align="center"></div></td>
          <td width="13%"><MARQUEE height=16 scrollAmount=2 scrollDelay=10 align="middle">
      <%=rs11("lygg")%>
    </MARQUEE></td>
          <td width="22%"> <div align="right"> 
              <% 
if TSum>1 Then
 If PageNo=TSum or PageNo<>1 Then 
   PrwePage=PageNo-1
   Response.Write "<A HREF=default1.asp?Pageno=1"&"&text="&text&"&option="&option1&"&jinghua="&jinghua
   Response.Write ">第一页</A>  "         
   Response.Write "<A HREF=default1.asp?Pageno="&PrwePage&"&text="&text&"&option="&option1&"&jinghua="&jinghua
   Response.Write ">上一页</A>  "              
 End If        
 If pageno=1 or TSum>PageNo Then 
   NextPage=PageNo+1             
   Response.Write "<A HREF=default1.asp?PageNo="&NextPage&"&text="&text&"&option="&option1&"&jinghua="&jinghua
   Response.Write ">下一页</A>  "
   Response.Write "<A HREF=default1.asp?Pageno="&rs.PageCount&"&text="&text&"&option="&option1&"&jinghua="&jinghua
   Response.Write ">最末页</A>  "          
 End If                    
End If          
%>
          </div></td>
        </tr>
      </table>
      <td></tr>
		<tr>
    <td> <div align="right"> </div>
      <table width="100%" cellpadding="5" cellspacing="1" align="center" class="tablebg<%=skin%>b">
        <tr class="tablebg<%=skin%>a"> 
          <td width="17%"><div align="left">作者信息</div></td>
          <td width="83%" height="17">留言信息</td>
        </tr>
      </table>
      <%
      if PageNo=1 then i=rs.RECORDCOUNT else i=rs.RECORDCOUNT-(10*(PageNo-1))
      bool=false
	  bg=1
	  %>
      <% 
	  if not rs11("regshow") and session("useridname")="" then 
	  	response.write "<br><font color=red><b>您尚未登录，不能查看留言内容！</b></font>"
	  else
	  DO WHILE NOT rs.EOF AND RowCount>0%>
      <table width="100%" border="0" align=center cellpadding="0" cellspacing="5" <%if bg mod 2=0 then%>class="tablebg<%=skin%>e"<%else%>class="tablebg<%=skin%>f"<%end if%>>
        <tr> 
          <td width="17%" rowspan="5" align=center valign="top" class="tablebg<%=skin%>h"> 
            <table width="100%" border="0" align="center" >
              <tr> 
                <td width="90">
                  <div align="right"><font color=#0066CC><b>
                    <%if rs("username")<>"" then%>
                    <%=rs("username")%> 
                    <%else%>
                    无名氏 
                    <%end if%>
                      </b></font>
                  </div></td>
                <td width="40%"> 
                  <%
			  Set rs2=server.createobject("ADODB.RECORDSET")
			  sql2="SELECT * FROM register where username='"&rs("username")&"'"
			  rs2.open sql2,conn,3,3
			  if not rs2.eof then
			if rs2("level1")="管理员" then%>
                  <font color=#000000><img src="images/gly.gif" alt="管理员" width="16" height="16"></font> 
                  <%end if
			if Instr(rs2("level1"),"版主")>0 then%>
                  <font color=#000000><img src="images/bz.gif" alt="版主" width="16" height="16"></font> 
                  <%end if            
			if rs2("level1")="嘉宾" then%>
                  <font color=#000000><img src="images/fbz.gif" alt="嘉宾"></font> 
                  <%end if
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
                </td>
              </tr>
            </table>
          <%if not rs2.eof then%>
          <img src="<%if rs2("myface")<>"" then %><%=rs2("myface")%>" width="<%=int(rs2("facewidth"))%>" height="<%=int(rs2("faceheight"))%>"><%else%><%=rs2("face")%>" width="72" height="122"> <%end if%>
          <%else if rs("face")="" then%>
          <img src="face/1.gif"> 
		  <%else%>
		  <img src="<%=rs("face")%>" width="72" height="122"> 
		  <%end if%>
          <%end if%>
            <br> 
            <%
			  if not rs2.eof then
			  %>
            头衔：<%=rs2("level1")%><br>
            发言数：<%=rs2("count1")%> 
            <%end if%>
            <br> <br>
          第<%=i%>条留言</td>
          <td height="17" colspan="2" class="tablebg<%=skin%>j"> <strong><img src="images/foot.gif" width="16" height="16">标题：</strong>
            <%if rs("subject")="" then %>
            无标题
            <%else%>
            <font color="<%=rs("fontcolor")%>"><%=rs("subject")%></font> 
            <%end if%>
          </td>
        </tr>
        <tr> 
          <td height="70" colspan="2" > <table border="0" width="100%" cellspacing="0" cellpadding="2" style="word-break:break-all; text-align:justify;">
              <tr valign=top>
                <td width="10" ><img src="images/<%=rs("pic")%>" > </td>
                <td width="95%"><%if not rs("secret") then%>
                  <%=ubbcode(rs("content"))%>
                  <%else 
			  response.Write "<font color=#FF0000>◎该留言为悄悄话◎</font><br>" 
			  if (session("useridname")=rs("username")) or ((session("admin")=1) or (session("admin")=2)) then%>
                  <%=ubbcode(rs("content"))%>
                  <%end if%>
                <%end if%></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="52" colspan="2" valign="top" <%if rs("edituser")<>"" then%><%else%>class="tablebg<%=skin%>i"<%end if%>> 
            <table width="100%" border="0" cellpadding="0">
              <tr> 
                <td > 
                  <% 
sql1="select * from reply where reply.id="&rs("id")&" order by id1"
rs1.open sql1,conn,1,1
skipi=1
DO while (not rs1.eof) and skipi<4
%>
                </td>
              </tr>
              <tr> 
                <td valign="top"><table width="100%" border="0" style="word-break:break-all; text-align:justify;">
                    <tr> 
                      <td colspan="2" valign="top" class="tablebg<%=skin%>i"><img src="images/dot.gif" width="10" height="10"><font color=#FF0000>回复人：</font>
                        <%
			  Set rs3=server.createobject("ADODB.RECORDSET")
			  sql3="SELECT * FROM register where username='"&rs1("replyname")&"'"
			  rs3.open sql3,conn,1,1
			  if not rs3.eof then			  
			  %>
                          <%=rs1("replyname")%> 
                          <%if rs3("level1")="管理员" then%>
                          <img src="images/gly.gif" alt="管理员" width="15" height="18"> 
                          <%end if%>
                          <%if rs3("level1")="版主" then%>
                          <img src="images/bz.gif" alt="版主" width="15" height="18"> 
                          <%end if%>
                          <%if rs3("level1")="嘉宾" then%>
                          <img src="images/fbz.gif" alt="嘉宾" width="16" height="16"> 
                          <%
			  				end if
			  else
			  	response.Write(rs1("replyname"))
			  end if
			  %>
                          <font color=#FF0000>回复日期：</font>
                          <%if rs1("replydate")<>"" then%>
                          <%if left(rs1("replydate"),1)=0 then response.write "20"&rs1("replydate") else response.write rs1("replydate")%>
                          <%else%>
                          未知
                          <%end if%>
						  <%if not rs("lock") then%>
                          <img src="images/edit.gif" width="13" height="15"> <a href="reply_edit.asp?PageNo=<%=PageNo%>&ID=<%=rs1("ID1")%>">修改</a>
                          <%if (not reply) or (session("admin")=1) or (session("admin")=2) then%>
						  <%if rs11("muieditor")=1 then%><a href="guest_reply.asp?id=<%=rs1("id")%>&id1=<%=rs1("id1")%>&quote=1"><img src="images/yy.gif" alt=Reply width="16" height="16" border="0">引用</a><%end if%>
                          <%end if%>
						  <%end if%>
						  <%if (session("admin")=1) or (session("admin")=2) then%>
                          <img src="images/dele.gif" alt=Delete border="0"><a href="javascript:exit1('<%=rs1("id1")%>','<%=rs1("id")%>');">删除</a>
<%if (not rs1("mark")) and show then%><img src="images/sh.gif" alt=Delete width="16" height="16" border="0"><a href="default1.asp?sh=ok&type1=ok&id=<%=rs1("id")%>&id1=<%=rs1("id1")%>">审核</a>
            <%end if%>
						  <%end if%>
                      </td></tr>
                    <tr> 
                      <td width="10" valign="top"><img src="images/<%=rs1("pic")%>" ></td>
                      <td width="95%"> 
                        <%if not rs1("secret") then
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
              <%end if%>                      </td>
                    </tr>
                  </table>
                  <% 
rs1.movenext
skipi=skipi+1
Loop
if rs1.recordcount>3 then%>
                  <div align="right">共<%=rs1.recordcount%>条回复记录— <a href="show.asp?ID=<%=rs("ID")%>">>>查看全部回复内容<</a>< 
                    <%end if%>
                    <%rs1.close%>
                  </div></td>
              </tr>
            </table>
            
          </td>
        </tr><%if rs("edituser")<>"" then%>
        <tr>
          <td height="19" colspan="2" valign="top" class="tablebg<%=skin%>i"><div align="right">[本主题已被<%=rs("edituser")%>于<%=rs("edittime")%>编辑过]</div></td>
        </tr><%end if%>
        <tr> 
          <td width="52%" Valign=middle><font color="#000000"><img src="images/time.gif" width="16" height="15"> 
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
          <a href="<%=rs2("homepage")%>" target="_blank">主页</a> 
          <%else response.Write("主页")%>
		  <%end if%>
          <%else%>
          <%if rs("homepage")<>"" then%>
          <a href="<%=rs("homepage")%>" target="_blank">主页</a>  
          <%else response.Write("主页")%>
		  <%end if%>
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
          <img src="images/ip.gif"  <%if (session("admin")=1) or (session("admin")=2) then response.write("alt="&rs("ip")) else response.write("alt=保密")%>> IP          </td>
          <td width="31%" Valign=middle> 
            <div align="right">
              <%if (session("admin")=1) or (session("admin")=2) then%><%if (not rs("mark")) and show then%><img src="images/sh.gif" alt=sh width="16" height="16" border="0"><a href="default1.asp?sh=ok&id=<%=rs("id")%>">审核</a><%end if%>
              <img src="images/dele.gif" alt=Delete border="0"><a href="javascript:exit('<%=rs("id")%>');">删除</a>
              <%end if%>
		      <%if not rs("lock") then%>
              <img src="images/edit.gif" width="13" height="15"> <a href="guest_edit.asp?PageNo=<%=PageNo%>&ID=<%=rs("ID")%>">修改</a> 
			  <%if (not reply) or (session("admin")=1) or (session("admin")=2) then%>
			  <%if rs11("muieditor")=1 then%><img src="images/yy.gif" width="16" height="16"><a href="guest_reply.asp?id=<%=rs("id")%>&quote=1">引用</a><%end if%> <img src="images/reply.gif" alt=Reply border="0"> <a href=show.asp?ID=<%=rs("ID")%>#replay> 
                </a><a href=guest_reply.asp?id=<%=rs("id")%>>回复</a><%end if%>
	            <%end if%>		  
          </div></td>
        </tr>
      </table>
      <%RowCount = RowCount - 1
	  i=i-1
	  bg=bg+1
      rs.MoveNext 
      Loop
	  end if%>
      <table width="100%" border="0" align="center">
        <tr> 
          <td><div align="right">
              <% call showpage(url,rs.RECORDCOUNT,maxperpage,false,true,"条主题") %>
          </div>
            <div align="right"> 
          </div></td>
        </tr>
        <tr> 
          <td><form action="default1.asp" method="post" name="form" id="form">
              <p align="center"><IMG src="images/search.gif" width="16" height="16" align=absMiddle>搜索：
                <INPUT 
      class=input1 size=25 name=text>
                <INPUT name=option type=radio value=1 CHECKED>
                发言主题
                <INPUT type=radio value=2 name=option>
                发言内容
                <INPUT name="submit" type=submit class=input2 value="搜索">
              </p>
                </form>
          </td>
        </tr>
      </table>
<div align="center"> 
</div>  
    <table border=0 width=100% align=center>
      <tr> 
        <td width="100%" height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
      </tr>
      <tr> 
        <td align=center> 
<%
rs.close
set rs=nothing
set rs1=nothing
set rs2=nothing
%>
          <!--#INCLUDE file="bottom.asp"-->
      </tr>
    </table>