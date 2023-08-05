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
<title>用户登录</title>
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
		alert("请输入用户名！");
		document.form.name.focus();
		return false;
	}
	if(document.form.pass.value == "")
	{
		alert("请输入密码！");
		document.form.pass.focus();
		return false;
	}
	if (document.form.CheckCode)
	{
		if (document.form.CheckCode.value==""){
		   alert ("请输入您的验证码！");
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
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">留言首页</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form name="form" method="post" onSubmit="return CheckForm();">
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a">
    <td colspan="2">
      <p align="center"><strong>用户登录</strong> </td>
  </tr>
      <%
main()

sub main()
	dim backInput, homeInput
	backInput=backInput&"<br><br><input type=button value=返回前页 onClick=history.back() class=input2 name=button ><br>"
	backInput=backInput&"</d>"
	backInput=backInput&"</tr>"
	homeInput="<br><br><input type=button value=进入留言板首页 onClick=""location.href='default.asp' "" class=input2><br>"
	homeInput=homeInput&"</d>"
	homeInput=homeInput&"</tr>"	
	if request.form="" then
%>
  <tr class="tablebg<%=skin%>d">
    <td width="302" align="center"><div align="left"><strong>请输入用户名：<br>
    </strong></div></td>
    <td width="664" height="28" align="center"><div align="left"><font color="#00FF00">
      <input type="text" name="name" size="30" class="input1" value="" maxlength="20">
    </font></div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td width="302" align="center"><div align="left"><strong>请输入密码：</strong></div></td>
    <td height="28" align="center"><div align="left"><font color="#FFFFFF">
      <input type="password" name="pass" size="34" class="input1" value="" maxlength="20" >
    </font></div></td>
  </tr>
  <%if rs11("showcode") then%>
  <tr class="tablebg<%=skin%>d">
    <td align="center"><div align="left"><span class="Glow" style="font-weight: bold">验　证　码：</span></div></td>
    <td height="28" align="center"><div align="left">
      <input name="CheckCode" size="6" maxlength="4" class="input1" >
      <span style="color: #000000">请在左边输入</span> <img src="checkcode.asp"></div></td>
  </tr>
  <%end if%>
  <tr class="tablebg<%=skin%>d">
    <td width="302" align="center"><div align="left"><strong>登录保留：<br>
    </strong> 请选择登录保留时间，下次访问时状态可为已登录。</div></td>
    <td height="28" align="center"><div align="left">
      <input type=radio name="expTime" value="" checked>
 不保存，关闭浏览器就失效<br>
<input type=radio name="expTime" value="<%=dateAdd("d",1,now)%>">
 保存一天
<br>
<input type=radio name="expTime" value="<%=dateAdd("ww",1,now)%>">
保存一周
<br>
<input type=radio name="expTime" value="<%=dateAdd("m",1,now)%>">
保存一月
<br>
<input type=radio name="expTime" value="<%=dateAdd("yyyy",1,now)%>">
保存一年 
    </div></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="28" colspan="2" align="center">      <input type="submit" value=" 登 陆 " class="input2" name="Submit" >
　　
  <input name="clear" type="reset" class="input2" id="clear" value=" 清 除 " >
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
				response.write "<font color=red>发生错误</font><br><br>你在登录页面停留时间过长，请重新返回登录页面进行登录。"
				response.write backInput
				exit sub
			end if
			if CheckCode<>CStr(session("CheckCode")) then
				response.Write("<tr class='tablebg"&skin&"d' align='center'>")
				response.Write("<td>")
				response.write "<font color=red>发生错误</font><br><br>您输入的确认码和系统产生的不一致，请重新输入。"
				response.write backInput
				exit sub
			end if		
		end if
		if name="" or pass="" then
			response.Write("<tr class='tablebg"&skin&"d' align='center'>")
			response.Write("<td>")
			response.write "<font color=red>发生错误</font><br><br>请输入用户名和密码！"
			response.write backInput
			exit sub
		end if
	
		exec="Select * From register where username='"&name&"' and password1='"&md5(pass)&"'"
		set rs=server.createobject("adodb.recordset")
		rs.open exec,conn,1,1
		if rs.eof then
			response.Write("<tr class='tablebg"&skin&"d' align='center'>")
			response.Write("<td>")
			response.write "<font color=red>发生错误</font><br><br>用户名不存在或密码错误！"
			response.write backInput
			exit sub
		end if
			response.Write("<tr class='tablebg"&skin&"d' align='center'>")
			response.Write("<td>")
		response.write "<font color=red>登陆成功！</font>"
		response.write homeInput
		
cookiePath=request.servervariables("path_info")
cookiePath=left(cookiePath,instrRev(cookiePath,"/"))
response.cookies("ly").Path=cookiePath
response.cookies("ly")("useridname")=name
response.cookies("ly")("useridpassword")=pass
if rs("level1")="管理员" then response.cookies("ly")("admin")=1 else if rs("level1")="版主" then response.cookies("ly")("admin")=2 else response.cookies("ly")("admin")=0
if (expTime<>"") and (expTime<>"不保存") then
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
