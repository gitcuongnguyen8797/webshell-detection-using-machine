<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<!--#include file="../Include/md5.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|211,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<script language="javascript" src="images/Admin.js"></script>
<title>管理员管理</title></head>
<body>
<table width="99%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap background="images/th_bg.gif"><font color="#FFFFFF">&nbsp;<strong>网站管理员：添加，修改管理员</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="Admin_Edit.asp?Result=Add" >添加管理员</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="Admin_List.asp" >查看所有管理员</a>|&nbsp;</font><a href="Admin_log.asp" >查看登陆日志</a></td>    
  </tr>
</table>
<br>
<table width="99%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form action="?Result=LoginLog" method="post" name="formDel" >
    <tr>
      <td width="60" height="24" nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td width="60" nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong>登录名</strong></font></td>
      <td width="70" nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong>用户名</strong></font></td>
      <td width="200" nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong><font color="#FFFFFF">登录IP</font></strong></font></td>
      <td width="360" nowrap background="images/th_bg.gif"><strong><font color="#FFFFFF">登录时浏览器</font></strong></td>
      <td width="124" nowrap background="images/th_bg.gif"><strong><font color="#FFFFFF"><strong>创建时间</strong></font></strong></td>
      <td nowrap background="images/th_bg.gif"><input onClick="CheckOthers(this.form)" name="buttonOtherSelect" type="button" class="button"  id="submitOtherSelect" value="选择" style="HEIGHT: 18px;WIDTH: 36px;">
	  </td>
    </tr>
	<% AdminLoginLog() %>
  </form>
</table>
<%
'-----------------------------------------------------------
function AdminLoginLog()
  dim idCount'记录总数
  dim pages'每页条数
      pages=20
  dim pagec'总页数
  dim page'页码
      page=clng(request("Page"))
  dim pagenc '每页显示的分页页码数量=pagenc*2+1
      pagenc=2
  dim pagenmax '每页显示的分页的最大页码
  dim pagenmin '每页显示的分页的最小页码
  dim datafrom'数据表名
      datafrom="zhi_rui_s_manageLog"
  dim datawhere'数据条件
      datawhere=""
  dim sqlid'本页需要用到的id
  dim Myself,PATH_INFO,QUERY_STRING'本页地址和参数
      PATH_INFO = request.servervariables("PATH_INFO")
	  QUERY_STRING = request.ServerVariables("QUERY_STRING")'
      if QUERY_STRING = "" then
	    Myself = PATH_INFO & "?"
	  else
	  	if Instr(PATH_INFO & "?" & QUERY_STRING,"Page=")=0 then
          Myself = PATH_INFO & "?" & QUERY_STRING & "&"
		else
	      Myself = Left(PATH_INFO & "?" & QUERY_STRING,Instr(PATH_INFO & "?" & QUERY_STRING,"Page=")-1)
		end if
	  end if
  dim taxis'排序的语句 asc, desc
      taxis="order by id desc"
  dim i'用于循环的整数
  dim rs,sql'sql语句
  '获取记录总数
  sql="select count(ID) as idCount from ["& datafrom &"]" & datawhere
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,0,1
  idCount=rs("idCount")
  '获取记录总数

  if(idcount>0) then'如果记录总数=0,则不处理
    if(idcount mod pages=0)then'如果记录总数除以每页条数有余数,则=记录总数/每页条数+1
	  pagec=int(idcount/pages)'获取总页数
   	else
      pagec=int(idcount/pages)+1'获取总页数
    end if
	'获取本页需要用到的id============================================
    '读取所有记录的id数值,因为只有id所以速度很快
    sql="select id from ["& datafrom &"] " & datawhere & taxis
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    rs.pagesize = pages '每页显示记录数
    if page < 1 then page = 1
    if page > pagec then page = pagec
    if pagec > 0 then rs.absolutepage = page  
    for i=1 to rs.pagesize
	  if rs.eof then exit for  
	  if(i=1)then
	    sqlid=rs("id")
	  else
	    sqlid=sqlid &","&rs("id")
	  end if
	  rs.movenext
    next
  '获取本页需要用到的id结束============================================
  end if
'-----------------------------------------------------------
'-----------------------------------------------------------
  if(idcount>0 and sqlid<>"") then'如果记录总数=0,则不处理
    '用in刷选本页所语言的数据,仅读取本页所需的数据,所以速度快
    sql="select [ID],[AdminName],[UserName],[LoginIP],[LoginSoft],[LoginTime] from ["& datafrom &"] where id in("& sqlid &") "&taxis
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,0,1
    while(not rs.eof)'填充数据到表格
	  Response.Write "<tr height=24 bgcolor='#EBF2F9' onMouseOver = ""this.style.backgroundColor = '#FFFFFF'"" onMouseOut = ""this.style.backgroundColor = ''"" style='cursor:hand'>" & vbCrLf
      Response.Write "<td nowrap>"&rs("ID")&"</td>" & vbCrLf
      Response.Write "<td nowrap>"&rs("AdminName")&"</td>" & vbCrLf
      Response.Write "<td nowrap>"&rs("UserName")&"</td>" & vbCrLf
      Response.Write "<td nowrap>"&rs("LoginIP")&"</td>" & vbCrLf
	  if len(rs("LoginSoft"))>40 then
        Response.Write "<td nowrap title='浏览器：&#13;"&rs("LoginSoft")&"'>"&left(rs("LoginSoft"),40)&"...</td>" & vbCrLf
      else
        Response.Write "<td nowrap title='浏览器：&#13;"&rs("LoginSoft")&"'>"&rs("LoginSoft")&"</td>" & vbCrLf
      end if 
      Response.Write "<td nowrap>"&rs("LoginTime")&"</td>" & vbCrLf
 	  Response.Write "<td nowrap><input name='selectID' type='checkbox' value='"&rs("ID")&"' style='HEIGHT: 13px;WIDTH: 13px;'></td>" & vbCrLf
      Response.Write "</tr>" & vbCrLf
	  rs.movenext
    wend
    Response.Write "<tr>" & vbCrLf
    Response.Write "<td colspan='7' nowrap  bgcolor='#EBF2F9' align='right'><input name='submit' type='submit' class='button'  id='submitDelSelect' value='删除所选' ></td>" & vbCrLf
    Response.Write "</tr>" & vbCrLf
  else
    response.write ("<tr><td height='50' align='center' colspan='7' nowrap  bgcolor='#EBF2F9'>暂无管理员登录日志</td></tr>")
  end if
'-----------------------------------------------------------
'-----------------------------------------------------------
  Response.Write "<tr>" & vbCrLf
  Response.Write "<td colspan='7' nowrap  bgcolor='#D7E4F7'>" & vbCrLf
  Response.Write "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>" & vbCrLf
  Response.Write "<tr>" & vbCrLf
  Response.Write "<td>共计：<font color='#ff6600'>"&idcount&"</font>条记录&nbsp;页次：<font color='#ff6600'>"&page&"</font></strong>/"&pagec&"&nbsp;每页：<font color='#ff6600'>"&pages&"</font>条</td>" & vbCrLf
  Response.Write "<td align='right'>" & vbCrLf
  '设置分页页码开始===============================
  pagenmin=page-pagenc '计算页码开始值
  pagenmax=page+pagenc '计算页码结束值
  if(pagenmin<1) then pagenmin=1 '如果页码开始值小于1则=1
  if(page>1) then response.write ("<a href='"& myself &"Page=1'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>9</font></a>&nbsp;") '如果页码大于1则显示(第一页)
  if(pagenmin>1) then response.write ("<a href='"& myself &"Page="& page-(pagenc*2+1) &"'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>7</font></a>&nbsp;") '如果页码开始值大于1则显示(更前)
  if(pagenmax>pagec) then pagenmax=pagec '如果页码结束值大于总页数,则=总页数
  for i = pagenmin to pagenmax'循环输出页码
	if(i=page) then
	  response.write ("&nbsp;<font color='#ff6600'>"& i &"</font>&nbsp;")
	else
	  response.write ("[<a href="& myself &"Page="& i &">"& i &"</a>]")
	end if
  next
  if(pagenmax<pagec) then response.write ("&nbsp;<a href='"& myself &"Page="& page+(pagenc*2+1) &"'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>8</font></a>&nbsp;") '如果页码结束值小于总页数则显示(更后)
  if(page<pagec) then response.write ("<a href='"& myself &"Page="& pagec &"'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>:</font></a>&nbsp;") '如果页码小于总页数则显示(最后页)	
  '设置分页页码结束===============================
  Response.Write "跳到：第&nbsp;<input name='SkipPage' onKeyDown='if(event.keyCode==13)event.returnValue=false' onchange=""if(/\D/.test(this.value)){alert('只能在跳转目标页框内输入整数！');this.value='"&Page&"';}"" style='HEIGHT: 18px;WIDTH: 40px;'  type='hidden' class='hiddenfield' value='"&Page&"'>&nbsp;页" & vbCrLf
  Response.Write "<input style='HEIGHT: 18px;WIDTH: 20px;' name='submitSkip' type='button' class='button' onClick='GoPage("""&Myself&""")' value='GO'>" & vbCrLf
  Response.Write "</td>" & vbCrLf
  Response.Write "</tr>" & vbCrLf
  Response.Write "</table>" & vbCrLf
  rs.close
  set rs=nothing
  Response.Write "</td>" & vbCrLf  
  Response.Write "</tr>" & vbCrLf
'-----------------------------------------------------------
'-----------------------------------------------------------
end function 
if request("Result") = "LoginLog" then 
	SelectID=request("SelectID")
    if SelectID<>"" then  conn.execute "delete from zhi_rui_s_manageLog where id in ("&SelectID&")"
	Response.write"<script>location.href=""Admin_Log.asp"";</script>"
end if
%>