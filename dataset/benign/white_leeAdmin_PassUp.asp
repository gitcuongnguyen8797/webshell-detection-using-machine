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
  response.write ("<font color='red')>�㲻���иù���ģ��Ĳ���Ȩ�ޣ��뷵�أ�</font>")
  response.end
end if
'========�ж��Ƿ���й���Ȩ�� 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
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
    <td height="24" nowrap background="images/th_bg.gif"><font color="#FFFFFF">&nbsp;<strong>ϵͳ�����޸ĵ�ǰ�Ĺ�������</strong></font></td>
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
        <td height="20" align="right">��&nbsp;¼&nbsp;����</td>
        <td><input name="AdminName" type="text" class="textfield" id="AdminName" style="WIDTH: 120;" value="<%=session("ZhiRui_Admin")%>" maxlength="16" readonly>&nbsp;3-10λ�ַ��������޸�</td>
      </tr>
      <tr>
        <td height="20" align="right">��&nbsp;��&nbsp;�룺</td>
        <td><input name="NewPassword" type="password" class="textfield" id="NewPassword" maxlength="20" style="WIDTH: 120;">&nbsp;*&nbsp;ע����ĸ��Сд</td>
      </tr>
      <tr>
        <td height="20" align="right">ȷ�����룺</td>
        <td><input name="vNewPassword" type="password" class="textfield" id="vNewPassword" maxlength="20" style="WIDTH: 120;">&nbsp;*</td>
      </tr>

      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="����" style="WIDTH: 60;" ></td>
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
    response.write "��ȡ���ݿ��¼����"
    response.end
  else
	if len(trim(Request.Form("NewPassword")))<6 or len(trim(Request.Form("NewPassword")))>20  then
      response.write "<script language=javascript> alert('����Ա���������ַ���Ϊ6-20λ��');history.back(-1);</script>"
      response.end
    end if
	if Request.Form("NewPassword")<>Request.Form("vNewPassword") then 
      response.write "<script language=javascript> alert('������������벻һ����');history.back(-1);</script>"
      response.end
	end if
	rs("Password")=Md5(Request.Form("NewPassword"))  
    rs.update
    rs.close
    set rs=nothing 
  end if
  response.write "��Ĺ��������ѳɹ��޸ģ����μ�[&nbsp;<font color='red'>"&trim(Request.Form("NewPassword"))&"</font>&nbsp;]��"
  response.end
end function
%>
