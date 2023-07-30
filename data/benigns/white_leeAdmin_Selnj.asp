<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<!--#include file="Admin_Page.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<script language=javascript>
function accessSina()
{
if (confirm("\请慎重此操作，一经操作此信息将无法恢复：\n\n·真的要执行此操作吗？")) 
 {
  return true;
 }
else {
  return false;
 }
}
</script>
</head>
<%
title="年级类别"
data="Zhi_rui_s_Clnj"
url="Admin_Selnj.asp" 
if Instr(session("AdminPurview"),"|911,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>

<body>
<table cellpadding="3" cellspacing="0" border="0" width="100%" align=center>
  <tr align="center" valign="bottom"><td height=25 background="images/th_bg.gif" class="topbg"><b><font color=ffffff><%=title%>管理</font></b></tr>
  <tr>
    <td height=23 bgcolor="#EBF2F9" class="tdbg">&nbsp;<a href="<%=url%>?action=add">添加<%=title%></a>&nbsp;|&nbsp;<a href="<%=url%>">管理<%=title%></a>&nbsp;</td>
  </tr>
</table>
<br>
<%if Request("action")="" then%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr class="title">
    <td width="10%" align="center" bgcolor="#EBF2F9"><span class="title2">类别ID</span></td>
    <td width="32%" align="center" bgcolor="#EBF2F9"><span class="title2">类别名称</span></td>
    <td width="23%" height="16" align="center" bgcolor="#EBF2F9"><span class="title2">管理操作</span></td>
  </tr>
<%

Set mypage=new xdownpage
mypage.getconn=conn
mysql="select * from "&data&" order by id asc"
mypage.getsql=mysql
mypage.pagesize=30
set rs=mypage.getrs()
for i=1 to mypage.pagesize
    if not rs.eof then 
%>

<script  language="javascript" type="text/javascript">
<!--
function chk_class_<%=i%>(){
if (document.myform_<%=i%>.Cname.value=="")
{
alert("错误：<%=title%>名称不能为空！");
document.myform_<%=i%>.Cname.focus();
return false; 
}
return true;
}
// -->
</script>
<form name="myform_<%=i%>" method="post" action="<%=url%>?action=upinfo" OnSubmit="return chk_class_<%=i%>()">
  <tr align="center" class="tdbg">
    <td align="center"  valign="middle" bgcolor="#EBF2F9"><%=rs("id")%></td>
    <td  valign="middle" bgcolor="#EBF2F9"><input name="Cname" type="text" class="textfield" id="Cname" value="<%=rs("Cname")%>" size="40" maxlength="60"></td>
    <td  valign="middle" bgcolor="#EBF2F9">
	<table width="60%" border="0" cellspacing="0" cellpadding="0">
        <tr align="center">
          <td width="48%"><input name="myid" type="hidden" id="myid" value="<%=rs("id")%>">
            <input type="submit" name="Submit" value="修 改" class="button"></td>
          <td width="52%"><a href="<%=url%>?id=<%=rs("id")%>&action=delinfo" onClick="return accessSina()">删除</a></td>
        </tr>
      </table></td>
  </tr>
  </form>
<%
rs.movenext
    else
         exit for
    end if
next
%>
<tr><td bgcolor="#EBF2F9" colspan="4">
<%=mypage.showpage()%>
</td>
</tr>
</table>
<%end if%>

<%if Request("action")="add" then%>
<%
sql="select * from "&data&" order by id asc"
set rs=server.CreateObject("ADODB.recordset")
rs.open sql,conn,1,1
totalPut=rs.recordcount
mynum=totalPut+1%>
<script  language="javascript" type="text/javascript">
<!--
function chk_class(){
if (document.myform.Cname.value=="")
{
alert("错误：<%=title%>名称不能为空！");
document.myform.Cname.focus();
return false; 
}
return true;
}
// -->
</script>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#EBF2F9">
  <tr class="title">
    <td width="10%" align="center"><span class="title2">类别ID</span></td>
    <td width="32%" align="center"><span class="title2">类别名称</span></td>
    <td width="23%" height="16" align="center"><span class="title2">管理操作</span></td>
  </tr>
  <form name="myform" method="post" action="<%=url%>?action=addinfo" OnSubmit="return chk_class()">
    <tr align="center" class="tdbg">
      <td height="25" valign="middle">--</td>
      <td  valign="middle"><input name="Cname" type="text" class="textfield" id="Cname" size="40" ></td>
      <td  valign="middle">
          <input type="submit" name="Submit" value="添 加" class="button">
      </td>
    </tr>
  </form>
</table>
<%
rs.close
set rs=nothing%>
<%end if%>

<%'添加信息
   if Request("action")="addinfo" then  
    set rs=server.CreateObject("adodb.Recordset")
    sql="select * from "&data&""
    rs.open sql,conn,1,3
	rs.addnew
	rs("Cname") =Request("Cname")
	rs.Update 
	rs.Close 
set rs=nothing%>
<script language=javascript>  
alert( "<%=title%>添加成功!"  );
location.href = "<%=url%>"  
</script>
<%end if%>

<%'修改信息
    if Request("action")="upinfo" then  
    set rs=server.CreateObject("adodb.Recordset")
    sql="select * from "&data&" where id="&Request("myid")&""
    rs.open sql,conn,1,3
	rs("Cname") =Request("Cname")
	rs.Update 
	rs.Close 
set rs=nothing%>
<script language=javascript>  
alert( "<%=title%>修改成功!"  );
location.href = "<%=url%>"  
</script>
<%end if%>


<%'删除信息
if Request("action")="delinfo" then  
conn.execute("delete from "&data&" where id="&Request("id")&"")%>
<script language=javascript>  
alert( "<%=title%>删除操作成功！"  );
location.href = "<%=url%>"
</script>
<%end if%>
</body>
</html>
