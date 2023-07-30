<!--#include file="../Include/conig.asp"-->
<!--#include file="admin_check.asp"-->
<!--#include file="../Include/md5.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|212,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
</head>
<body>
<%
select case request.QueryString("Action")
  case "ModifyPass"
    SaveNewPass
  case else
end select
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap background="images/th_bg.gif"><font color="#FFFFFF">&nbsp;<strong>系统管理：修改当前的管理密码</strong></font></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="Admin_PassUp.asp?Action=ModifyPass&LoginName=<%=session("ZhiRui_Admin")%>" >
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="220" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">登&nbsp;录&nbsp;名：</td>
        <td><input name="AdminName" type="text" class="textfield" id="AdminName" style="WIDTH: 120;" value="<%=session("ZhiRui_Admin")%>" maxlength="16" readonly>&nbsp;3-10位字符，不可修改</td>
      </tr>
      <tr>
        <td height="20" align="right">新&nbsp;密&nbsp;码：</td>
        <td><input name="NewPassword" type="password" class="textfield" id="NewPassword" maxlength="20" style="WIDTH: 120;">&nbsp;*&nbsp;注意字母大小写</td>
      </tr>
      <tr>
        <td height="20" align="right">确认密码：</td>
        <td><input name="vNewPassword" type="password" class="textfield" id="vNewPassword" maxlength="20" style="WIDTH: 120;">&nbsp;*</td>
      </tr>

      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="保存" style="WIDTH: 60;" ></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
</body>
</html>
<%
function SaveNewPass()
  dim LoginName,rs,sql 
  LoginName=request.QueryString("LoginName")
  set rs = server.createobject("adodb.recordset")
  sql="select * from zhi_rui_s_manage where AdminName='"&LoginName&"'"
  rs.open sql,conn,1,3
  if rs.bof and rs.eof then
    response.write "读取数据库记录出错！"
    response.end
  else
	if len(trim(Request.Form("NewPassword")))<6 or len(trim(Request.Form("NewPassword")))>20  then
      response.write "<script language=javascript> alert('管理员密码必填，且字符数为6-20位！');history.back(-1);</script>"
      response.end
    end if
	if Request.Form("NewPassword")<>Request.Form("vNewPassword") then 
      response.write "<script language=javascript> alert('两次输入的密码不一样！');history.back(-1);</script>"
      response.end
	end if
	rs("Password")=Md5(Request.Form("NewPassword"))  
    rs.update
    rs.close
    set rs=nothing 
  end if
  response.write "你的管理密码已成功修改，请牢记[&nbsp;<font color='red'>"&trim(Request.Form("NewPassword"))&"</font>&nbsp;]！"
  response.end
end function
%>
