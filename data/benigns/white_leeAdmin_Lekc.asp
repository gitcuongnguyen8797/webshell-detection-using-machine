<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|115,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站后台管理</title>
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<script src="images/admin.js"></script>
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<link rel="stylesheet" href="../ZhiEditor/themes/default/default.css" />
<link rel="stylesheet" href="../ZhiEditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../ZhiEditor/kindeditor.js"></script>
<script charset="utf-8" src="../ZhiEditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../ZhiEditor/plugins/code/prettify.js"></script>
<script>
		KindEditor.ready(function(K) {
			var editor = K.create('textarea[name="content"]', {
				cssPath : '../ZhiEditor/plugins/code/prettify.css',
				uploadJson : '../ZhiEditor/upload_json.asp',
				fileManagerJson : '../ZhiEditor/file_manager_json.asp',
				allowFileManager : true,
				afterBlur : function() {
				this.sync();
				K.ctrl(document, 13, function() {
				K('form[name=editForm]')[0].submit();
				});
				K.ctrl(this.edit.doc, 13, function() {
				K('form[name=editForm]')[0].submit();
				});
				}
			});
			prettyPrint();
		});
</script>
</head>
<body>
<%
	if request("action") = "add" then 
		call add()
	elseif request("action")="edit" then
		call edit()
	elseif request("action")="savenew" then
		call savenew()
	elseif request("action")="savedit" then
		call savedit()
	elseif request("action")="yn1" then
		call yn1()
	elseif request("action")="yn2" then
		call yn2()
	elseif request("action")="del" then
		call del()
	elseif request("action")="delAll" then
		call delAll()
	else
		call List()
	end if

sub List()
	dim currentpage,page_count,Pcount
	dim totalrec,endpage
	currentPage=request("page")
	A_Class=request("Class")
	hits=request("hits")
	if hits="" then
	hits=0
	end if
	keyword=trim(request("keyword"))
	if currentpage="" or not IsNumeric(currentpage) then
		currentpage=1
	else
		currentpage=clng(currentpage)
		if err then
			currentpage=1
			err.clear
		end if
	end if
	set rs = server.CreateObject ("adodb.recordset")
		sql="select * from zhi_rui_s_Label order by id desc"

	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
		Response.Write("没有扩展!")
	else
%>
<table width="95%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#6298E1" class="admintable">
<tr> 
  <td height="25" colspan="4" align=left background="images/th_bg.gif" class="admintitle">扩展列表　[<a href="?action=add">添加</a>]</td>
</tr>
    <tr bgcolor="#EBF2F9" style="font-weight:bold;">
    <td height="30" align="center" class="ButtonList">扩展名称</td>
    <td width="23%" height="25" align="center" class="ButtonList">发布时间</td>
    <td height="25" align="center" class="ButtonList">扩展ID</td>
    <td height="25" align="center" class="ButtonList">管理</td>    </tr>
<%
		rs.PageSize = 15
		rs.AbsolutePage=currentpage
		page_count=0
		totalrec=rs.recordcount
		NoI=0
		while (not rs.eof) and (not page_count = 15)
		NoI=NoI+1
%>
    <tr bgcolor="#EBF2F9" onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
    <td height="25" bgcolor="#EBF2F9"><%=rs("Title")%></td>
    <td height="25" align="center"><%=rs("DateAndTime")%></td>
    <td width="7%" height="25" align="center"><%=rs("ID")%></td>
    <td width="24%" align="center"><a href="?action=edit&id=<%=rs("ID")%>">编辑</a>  | <a href="?action=del&id=<%=rs("ID")%>" onClick="JavaScript:return confirm('确认删除吗？')">删除</a></td>    </tr>
<%
		page_count = page_count + 1
		rs.movenext
		wend
%><tr><td bgcolor="EBF2F9" colspan="4" align="left">调用：在需要调用的地方插入 &lt;%Call Label(扩展ID)%&gt; 即可。分页：
<%Pcount=rs.PageCount
	if currentpage > 4 then
		response.write "<a href=""?page=1"">[1]</a> ..."
	end if
	if Pcount>currentpage+3 then
		endpage=currentpage+3
	else
		endpage=Pcount
	end if
	dim i
	for i=currentpage-3 to endpage
		if not i<1 then
			if i = clng(currentpage) then
        		response.write " <font color=red>["&i&"]</font>"
			else
        		response.write " <a href=""?page="&i&""">["&i&"]</a>"
			end if
		end if
	next
	if currentpage+3 < Pcount then 
	response.write "... <a href=""?page="&Pcount&""">["&Pcount&"]</a>"
	end if
%>
</td></tr></table>
<%
	end if
	rs.close
end sub

sub add()
%>
<table width="95%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#EBF2F9" class="admintable">
<form action="?action=savenew" name="myform" method=post>
<tr> 
    <td height="25" colspan="2" align=left background="images/th_bg.gif" class="admintitle">添加扩展</td>
</tr>
<tr> 
<td width="20%" bgcolor="#EBF2F9">标题</td>
<td bgcolor="#EBF2F9" class="b1_1"><input name="Title" type="text" id="Title" size="40" maxlength="50"></td>
</tr>
      <tr>
        <td height="24" align="right" valign="top">内容：<br>
        <td>
		<textarea name="content" style="width:700px;height:300px;visibility:hidden;"></textarea>
	</td>
      </tr>
<tr> 
<td width="20%" bgcolor="#EBF2F9" class="b1_1"></td>
<td bgcolor="#EBF2F9" class="b1_1"><input name="Submit" type="submit" class="button" value="添 加"></td>
</tr>
</form>
</table>
<%
end sub

sub savenew()
	Title			=trim(request.form("Title"))
	Content			=request.form("Content")
	
	if Title="" or Content="" then
		Call Alert ("请填写完整","-1")
	end if
	
	set rs = server.CreateObject ("adodb.recordset")
	sql="select * from zhi_rui_s_Label where Title='"&Title&"'"
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		rs.AddNew 
		rs("Title")				=Title
		rs("Content")			=Content
		rs.update
		Response.write"<script>alert(""添加成功！"");location.href=""Admin_Lekc.asp"";</script>"
	else
		Response.Write("<script language=javascript>alert('该扩展已存在!');history.back(1);</script>")
	end if
	rs.close
end sub

sub del()
	id=request("id")
	set rs=conn.execute("delete from zhi_rui_s_Label where id="&id)
	Response.write"<script>alert(""删除成功！"");location.href=""Admin_Lekc.asp"";</script>"
end sub

sub edit()
id=request("id")
set rs = server.CreateObject ("adodb.recordset")
sql="select * from zhi_rui_s_Label where id="& id &""
rs.open sql,conn,1,1
%>
<table width="95%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#EBF2F9" class="admintable">
<form name="myform" action="?action=savedit" method=post>
<tr> 
    <td height="25" colspan="5" class="admintitle">修改扩展</td>
</tr>
<tr>
  <td width="20%" height="25" bgcolor="#EBF2F9">标题</td>
  <td height="25" colspan=4 bgcolor="#EBF2F9"><input name="Title" type="text" value="<%=rs("Title")%>" size="40" maxlength="50"></td>
</tr>
      <tr>
        <td height="24" align="right" valign="top">内容：<br>
        <td>
		<textarea name="content" style="width:700px;height:300px;visibility:hidden;"><%=rs("content")%></textarea>
	</td>
      </tr>
<tr> 
<td width="20%" height="25" bgcolor="#EBF2F9"></td>
<td height="25" colspan=4 bgcolor="#EBF2F9"><input name="id" type="hidden" value="<%=rs("ID")%>"><input name="Submit" type="submit" class="button" value="提 交"></td>
</tr>
</form>
</table>
<%
end sub

sub savedit()
	Dim Title
	id=request.form("id")
	Title			=trim(request.form("Title"))
	Content			=request.form("Content")
	
	if Title="" then
		Call Alert ("请填写完整","-1")
	end if
	
	set rs = server.CreateObject ("adodb.recordset")
	sql="select * from zhi_rui_s_Label where ID="&id&""
	rs.open sql,conn,1,3
	if not(rs.eof and rs.bof) then
	
		rs("Title")				=Title
		rs("Content")			=Content
		rs("DateAndTime")		=Now
		
		rs.update
		Response.write"<script>alert(""修改成功！"");location.href=""Admin_Lekc.asp"";</script>"
	else
		Response.write"<script>alert(""修改错误！"");location.href=""Admin_Lekc.asp"";</script>"
	end if
	rs.close
end sub
%>
</body>
</html>