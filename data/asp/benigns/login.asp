<!--#INCLUDE FILE="config.asp" -->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="md5.asp"-->
<%
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û���¼</title>
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<script language=javascript>
<!--
function CheckForm()
{
	if(document.form.name.value=="")
	{
		alert("�������û�����");
		document.form.name.focus();
		return false;
	}
	if(document.form.pass.value == "")
	{
		alert("���������룡");
		document.form.pass.focus();
		return false;
	}
	if (document.form.CheckCode)
	{
		if (document.form.CheckCode.value==""){
		   alert ("������������֤�룡");
		   document.form.CheckCode.focus();
		   return(false);
		}
	}
}
//-->
</script>
<!--#include file="top.asp"-->
<HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0>
<table border=0 width=100% align=center>
  <tr>
    <td width="3%" align=left><font color="#FF0000">&nbsp;<img src="images/home.gif" border=0></font></td>
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">������ҳ</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form name="form" method="post" onSubmit="return CheckForm();">
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a">
    <td colspan="2">
      <p align="center"><strong>�û���¼</strong> </td>
  </tr>
      <%
main()

sub main()
	dim backInput, homeInput
	backInput=backInput&"<br><br><input type=button value=����ǰҳ onClick=history.back() class=input2 name=button ><br>"
	backInput=backInput&"</d>"
	backInput=backInput&"</tr>"
	homeInput="<br><br><input type=button value=�������԰���ҳ onClick=""location.href='default.asp' "" class=input2><br>"
	homeInput=homeInput&"</d>"
	homeInput=homeInput&"</tr>"	
	if request.form="" then
%>
  <tr class="tablebg<%=skin%>d">
    <td width="302" align="center"><div align="left"><strong>�������û�����<br>
    </strong></div></td>
    <td width="664" height="28" align="center"><div align="left"><font color="#00FF00">
      <input type="text" name="name" size="30" class="input1" value="" maxlength="20">
    </font></div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td width="302" align="center"><div align="left"><strong>���������룺</strong></div></td>
    <td height="28" align="center"><div align="left"><font color="#FFFFFF">
      <input type="password" name="pass" size="34" class="input1" value="" maxlength="20" >
    </font></div></td>
  </tr>
  <%if rs11("showcode") then%>
  <tr class="tablebg<%=skin%>d">
    <td align="center"><div align="left"><span class="Glow" style="font-weight: bold">�顡֤���룺</span></div></td>
    <td height="28" align="center"><div align="left">
      <input name="CheckCode" size="6" maxlength="4" class="input1" >
      <span style="color: #000000">�����������</span> <img src="checkcode.asp"></div></td>
  </tr>
  <%end if%>
  <tr class="tablebg<%=skin%>d">
    <td width="302" align="center"><div align="left"><strong>��¼������<br>
    </strong> ��ѡ���¼����ʱ�䣬�´η���ʱ״̬��Ϊ�ѵ�¼��</div></td>
    <td height="28" align="center"><div align="left">
      <input type=radio name="expTime" value="" checked>
 �����棬�ر��������ʧЧ<br>
<input type=radio name="expTime" value="<%=dateAdd("d",1,now)%>">
 ����һ��
<br>
<input type=radio name="expTime" value="<%=dateAdd("ww",1,now)%>">
����һ��
<br>
<input type=radio name="expTime" value="<%=dateAdd("m",1,now)%>">
����һ��
<br>
<input type=radio name="expTime" value="<%=dateAdd("yyyy",1,now)%>">
����һ�� 
    </div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="28" colspan="2" align="center">      <input type="submit" value=" �� ½ " class="input2" name="Submit" >
����
  <input name="clear" type="reset" class="input2" id="clear" value=" �� �� " >
  <%
	else
		dim name, pass, expTime
		name=request.form("name")
		pass=request.form("pass")
		name=replace(name,"'","")
		name=replace(name,"""","")
		name=replace(name,"=","")
		pass=replace(pass,"'","")
		pass=replace(pass,"""","")
		pass=replace(pass,"=","")
		CheckCode=replace(Request("CheckCode"),"'","")
		expTime=request.form("expTime")
		if rs11("showcode") then
			if session("CheckCode")="" then
				response.Write("<tr class='tablebg"&skin&"d' align='center'>")
				response.Write("<td>")
				response.write "<font color=red>��������</font><br><br>���ڵ�¼ҳ��ͣ��ʱ������������·��ص�¼ҳ����е�¼��"
				response.write backInput
				exit sub
			end if
			if CheckCode<>CStr(session("CheckCode")) then
				response.Write("<tr class='tablebg"&skin&"d' align='center'>")
				response.Write("<td>")
				response.write "<font color=red>��������</font><br><br>�������ȷ�����ϵͳ�����Ĳ�һ�£����������롣"
				response.write backInput
				exit sub
			end if		
		end if
		if name="" or pass="" then
			response.Write("<tr class='tablebg"&skin&"d' align='center'>")
			response.Write("<td>")
			response.write "<font color=red>��������</font><br><br>�������û��������룡"
			response.write backInput
			exit sub
		end if
	
		exec="Select * From register where username='"&name&"' and password1='"&md5(pass)&"'"
		set rs=server.createobject("adodb.recordset")
		rs.open exec,conn,1,1
		if rs.eof then
			response.Write("<tr class='tablebg"&skin&"d' align='center'>")
			response.Write("<td>")
			response.write "<font color=red>��������</font><br><br>�û��������ڻ��������"
			response.write backInput
			exit sub
		end if
			response.Write("<tr class='tablebg"&skin&"d' align='center'>")
			response.Write("<td>")
		response.write "<font color=red>��½�ɹ���</font>"
		response.write homeInput
		
cookiePath=request.servervariables("path_info")
cookiePath=left(cookiePath,instrRev(cookiePath,"/"))
response.cookies("ly").Path=cookiePath
response.cookies("ly")("useridname")=name
response.cookies("ly")("useridpassword")=pass
if rs("level1")="����Ա" then response.cookies("ly")("admin")=1 else if rs("level1")="����" then response.cookies("ly")("admin")=2 else response.cookies("ly")("admin")=0
if (expTime<>"") and (expTime<>"������") then
	expTime=Cdate(expTime)
	response.cookies("ly").expires=expTime
end if
	end if
end sub %>
</td>
  </tr>
</table>
</form>
<HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0>
<!--#include file="bottom.asp"-->

</body>

</html>
