<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<!--#include file="../Include/md5.asp"-->
<!--#include file="../Include/lockipfun.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|121,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
	dim ipid,ipcls
	ipid=Request.QueryString("id")
	ipcls=Request.QueryString("cls")
	
	Select case ipcls
	case ""
	case "del"
		conn.execute("Delete  From zhi_rui_s_stopip Where id="&ipid)
	Response.Write "<script language=javascript>alert(""IP删除成功！"");location.href=""admin_ip.asp"";</script>"
	Response.End
	case "open"
		conn.execute("Update zhi_rui_s_stopip set viw=0 Where id="&ipid)
	Response.Write "<script language=javascript>alert(""IP已开通！"");location.href=""admin_ip.asp"";</script>"
	Response.End
	case "close"
		conn.execute("Update zhi_rui_s_stopip set viw=1 Where id="&ipid)
	Response.Write "<script language=javascript>alert(""IP已禁止！"");location.href=""admin_ip.asp"";</script>"
	Response.End
	end Select
	
	if Request.Form("Submit")="提交" then
	dim oneip,endip
	oneip=trim(Request.Form("oneip"))
	endip=trim(Request.Form("endip"))
	
	call fishadminip(oneip)
	call fishadminip(endip)

    Set rs = Server.CreateObject("ADODB.RecordSet")
	sql="Select * from zhi_rui_s_stopip"
	Rs.open sql,conn,2,3
	Rs.addnew
	rs("oneip")=fishadmincip(oneip)
	rs("endip")=fishadmincip(endip)
	rs("ip1")=oneip
	rs("ip2")=endip
	rs("rdate")=now()
	rs("viw")=1
	rs.update
	rs.close
Response.Write "<script language=javascript>alert(""IP添加成功！"");location.href=""admin_ip.asp"";</script>"
Response.End
end if
stop_ip= Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If  stop_ip= "" Then  stop_ip= Request.ServerVariables("REMOTE_ADDR")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<title>IP管理</title>
</head>
<body>
<form name="form1" method="post" action="">
  <TABLE width="98%" height=0 border=0 align=center cellPadding=0 cellSpacing=0   >
    <tr bgcolor="#E4F2FA"> 
      <td height="25" colspan="3" align="left" background="images/th_bg.gif" bgcolor="#E4F2FA">&nbsp;&nbsp;<font color="#FFFFFF"><strong>当前IP：<%=stop_ip%></strong></font></td>
    </tr>
</table>
  <TABLE width="98%" height=30 border=0 align=center cellPadding=3 cellSpacing=1 bgcolor="#337ABB" style="border-collapse:collapse" >
    <tr> 
      <td width="20%" bgcolor="#FFFFFF">&nbsp;&nbsp;<b>添加封锁IP段:</b></td>
      <td width="30%" bgcolor="#FFFFFF"><input name="oneip" type="text" class="textfield" id="oneip"></td>
      <td width="30%" bgcolor="#FFFFFF"><input name="endip" type="text" class="textfield" id="endip"></td>
 <td width="20%" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="button" value="提交"></td>
    </tr>
  </table>
  <br>
</form>
<% set rs=conn.execute("select * from zhi_rui_s_stopip")%>
<TABLE width="98%" height=0 border=0 align=center cellPadding=3 cellSpacing=1 bgcolor="#327CBC" >
  <TBODY>
    <TR > 
      <TD  height=25 background="images/th_bg.gif" >&nbsp;&nbsp;<b><font color="#FFFFFF">IP封锁信息</font></b></TD>
    </TR>
    <TR> 
      <TD  align=middle valign="top" bgcolor="#FFFFFF" > 
	    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td height="25">状态</td>
            <td>起始</td>
            <td>终止</td>
            <td>时间</td>
            <td>操作</td>
          </tr>
<%
ipi=0
do while not rs.eof 
ipi=ipi+1
%>
<tr>
<td height="25">
<% 
if rs("viw")=0 then
Response.write("<font color='#009900'>")
end if
if rs("viw")=1 then
Response.write("<font color='#000000'>")
end if

Response.write("●</font>")
%></td>
            <td><%=rs("ip1")%></td>
            <td><%=rs("ip2")%></td>
            <td><%=rs("rdate")%></td>
            <td>
              <a href="?cls=open&id=<%=rs("id")%>">开通</a> 
              <a href="?cls=close&id=<%=rs("id")%>">禁止</a> 
<a href="?cls=del&id=<%=rs("id")%>" onClick="return confirm('删除一个IP段？！\n\n该操作不可恢复！可以设为开通,保留这个段.\n\n要删除请按[确定]\n\n不小心按错按[取消]反回！')">删除</a>
            </td>
          </tr>
<% 
rs.movenext
loop
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
          <tr> 
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" colspan="5" align="center"><font color="#009900">●开通 </font>　<font color="#FF0000"> ●禁止</font></td>
          </tr>
        </table>
	  </TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>
