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
if (confirm("\�����ش˲�����һ����������Ϣ���޷��ָ���\n\n�����Ҫִ�д˲�����")) 
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
title="�꼶���"
data="Zhi_rui_s_Clnj"
url="Admin_Selnj.asp" 
if Instr(session("AdminPurview"),"|911,")=0 then 
  response.write ("<font color='red')>�㲻���иù���ģ��Ĳ���Ȩ�ޣ��뷵�أ�</font>")
  response.end
end if
'========�ж��Ƿ���й���Ȩ��
%>

<body>
<table cellpadding="3" cellspacing="0" border="0" width="100%" align=center>
  <tr align="center" valign="bottom"><td height=25 background="images/th_bg.gif" class="topbg"><b><font color=ffffff><%=title%>����</font></b></tr>
  <tr>
    <td height=23 bgcolor="#EBF2F9" class="tdbg">&nbsp;<a href="<%=url%>?action=add">���<%=title%></a>&nbsp;|&nbsp;<a href="<%=url%>">����<%=title%></a>&nbsp;</td>
  </tr>
</table>
<br>
<%if Request("action")="" then%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr class="title">
    <td width="10%" align="center" bgcolor="#EBF2F9"><span class="title2">���ID</span></td>
    <td width="32%" align="center" bgcolor="#EBF2F9"><span class="title2">�������</span></td>
    <td width="23%" height="16" align="center" bgcolor="#EBF2F9"><span class="title2">�������</span></td>
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
alert("����<%=title%>���Ʋ���Ϊ�գ�");
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
            <input type="submit" name="Submit" value="�� ��" class="button"></td>
          <td width="52%"><a href="<%=url%>?id=<%=rs("id")%>&action=delinfo" onClick="return accessSina()">ɾ��</a></td>
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
alert("����<%=title%>���Ʋ���Ϊ�գ�");
document.myform.Cname.focus();
return false; 
}
return true;
}
// -->
</script>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#EBF2F9">
  <tr class="title">
    <td width="10%" align="center"><span class="title2">���ID</span></td>
    <td width="32%" align="center"><span class="title2">�������</span></td>
    <td width="23%" height="16" align="center"><span class="title2">�������</span></td>
  </tr>
  <form name="myform" method="post" action="<%=url%>?action=addinfo" OnSubmit="return chk_class()">
    <tr align="center" class="tdbg">
      <td height="25" valign="middle">--</td>
      <td  valign="middle"><input name="Cname" type="text" class="textfield" id="Cname" size="40" ></td>
      <td  valign="middle">
          <input type="submit" name="Submit" value="�� ��" class="button">
      </td>
    </tr>
  </form>
</table>
<%
rs.close
set rs=nothing%>
<%end if%>

<%'�����Ϣ
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
alert( "<%=title%>��ӳɹ�!"  );
location.href = "<%=url%>"  
</script>
<%end if%>

<%'�޸���Ϣ
    if Request("action")="upinfo" then  
    set rs=server.CreateObject("adodb.Recordset")
    sql="select * from "&data&" where id="&Request("myid")&""
    rs.open sql,conn,1,3
	rs("Cname") =Request("Cname")
	rs.Update 
	rs.Close 
set rs=nothing%>
<script language=javascript>  
alert( "<%=title%>�޸ĳɹ�!"  );
location.href = "<%=url%>"  
</script>
<%end if%>


<%'ɾ����Ϣ
if Request("action")="delinfo" then  
conn.execute("delete from "&data&" where id="&Request("id")&"")%>
<script language=javascript>  
alert( "<%=title%>ɾ�������ɹ���"  );
location.href = "<%=url%>"
</script>
<%end if%>
</body>
</html>
