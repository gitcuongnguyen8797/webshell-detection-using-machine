<!--#include File="inc/Conn.asp"-->
<%
If Session("AdminName")="" and Session("adminpass")="" Then
Response.Redirect "Error.asp?id=001"
Else
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����������</title>
<link rel="stylesheet" href="css/main.css">
<body>
<table width="95%" border="0" cellpadding="0" cellspacing="0" class="list_table">
  <form name="form1" method="post" action="admin_news_class_save.asp?action=add">
  <tr>
      <th width="20%">���ŷ�������</th>
		  <th width="10%">���� </th>
		  <th width="10%">��� </th>
  </tr>
  <tr>
      <td height="30"> <div align="center">
        <input name="classid" type="hidden" id="classid" value="0">
        <input name="name" type="text" class="input-text" id="name"  value="" size="30" maxlength="100">
</div></td>
      <td> <div align="center">
        <input name="px_id" type="text" class="input-text" id="px_id" size="5" maxlength="5" >
      </div></td>
      <td> <div align="center">
        <input name="Submit2" type="submit" class="btn btn82 btn_save2" value="���">
      </div></td>
  </tr>
  </form> 
</table>

<table width="95%" border="0" cellpadding="0" cellspacing="0" class="list_table">
  <tr>

      <th width="5%">����ID</th>
		<th width="30%">���ŷ�������</th>
		  <th width="10%">����/��ֵԽСԽ��ǰ </th>
          <th width="10%">�޸� </th>
     <th width="10%">ɾ�� </th>
  </tr><%
Set Rs=Server.Createobject("Adodb.Recordset")
Sql="Select * From newsClass where classid='0' order by px_id asc"
Rs.open Sql,Conn,1,3
Do While not Rs.Eof
%>
  <Form Method="post" action="admin_news_class_save.asp?action=edit&id=<%=rs("id")%>">
    <tr> 
      <td width="80" height="38"> <div align="center"><%=rs("id")%></div></td>
      <td><div align="center">
        <input name="classid" type="hidden" id="classid" value="0">
        <input name="name" type="Text" class="input-text" id="name" value="<%=rs("name")%>" size="30" maxlength="100">
      </div></td>
	  <td width="10%" height="38"><div align="center">
	    <input name="px_id" type="text"  class="input-text" id="px_id" value="<%=rs("px_id")%>" size="6">
      </div></td>
      <td><div align="center">
        <Input Type="Submit" Name="Submit" value="�޸�" class="btn btn82 btn_add"> 
      </div></td>
      <td colspan="3"> <div align="left"><input type="button" class="btn btn82 btn_del" name="button" value="ɾ��" onClick="javascript:if(confirm('�ף�ȷ��Ҫɾ����\n\n�˲�����ɾ��������֮��ص��������޷��ָ�!')){window.location.href='admin_news_class_save.asp?action=delyi&Classid=<%=rs("id")%>';}else{history.go(0);}"  /></div></td>
    </tr>
  </form>
  <%
Rs.Movenext
Loop
Rs.Close
Set Rs=nothing
Conn.Close
Set Conn=nothing
%>
</table>
 </body>
</html>
<%end if%>
<!-- -->