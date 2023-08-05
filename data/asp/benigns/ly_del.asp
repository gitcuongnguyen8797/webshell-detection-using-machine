<%@language=vbscript codepage=936 %>
<%Session.Timeout=999%>
<!--#include file="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<%
if session("admin")<>1 then response.Redirect "default.asp"
%>
<html>
<head>
<title>批量删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 15px;
	margin-bottom: 15px;
}
-->
</style>
  <SCRIPT language=javascript>
function  save_onclick()
{
  var strTemp = document.form.datestart.value;
  if (strTemp.length == 0 )
  {
      alert("请输入起始日期！");
      document.form.datestart.focus();
      return false;
  }
  var strTemp = document.form.dateend.value;
  if (strTemp.length == 0 )
  {
      alert("请输入结束日期！");
      document.form.dateend.focus();
      return false;
  }
  return true;
}
</SCRIPT>
</head>
<body>
<table border=0 width=100% align=center>
  <tr>
    <td width="22" align=left><font color="#FF0000"><img src="images/back.gif" width="17" height="17"></font> </td>
    <td width="96" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">回留言首页</a></td>
    <td width="857" align=right><!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form action="" method="post" name="form" id="form" onsubmit="return save_onclick()">
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a"> 
      <td height="22" align="center" valign="middle" class="tablebg<%=skin%>d"><b>批 量 删 除 留 言 </b></td>
  </tr>
  <tr class="tablebg<%=skin%>d"> 
    <td height="150" align="center" valign="middle">
	<%if request.Form<>"" then
		a=0
		if request.Form("yd")<>"" and request.Form("yd")<>"0" then yd=" and yd<"&request.Form("yd")
		if request.Form("hf")<>"" and request.Form("hf")<>"0" then yd=" and hf<"&request.Form("hf")
		if request.Form("type")="1" then
			Set rs=server.createobject("ADODB.RECORDSET")
			rs.open "Select id From guest where lydate>=#"&request("datestart")&"# and lydate<=#"&request("dateend")&"#"&request.Form("jinghua"),Conn,3,3
			do while not rs.eof
				a=a+1
				conn.execute "delete from reply where id="&rs("id")
			rs.delete
			rs.movenext
			loop
			rs.close
			set rs=nothing
		else
			Set rs=server.createobject("ADODB.RECORDSET")
			rs.open "Select id From guest where lastdate>=#"&request("datestart")&"# and lastdate<=#"&request("dateend")&"#"&request.Form("jinghua"),Conn,3,3
			do while not rs.eof
				a=a+1
				conn.execute "delete from reply where id="&rs("id")
			rs.delete
			rs.movenext
			loop
			rs.close
			set rs=nothing
		end if
		response.Write("<font color=red><b>删除完毕！共删除了"&a&"条留言。</b></font>")
	else%>
        <table width="100%" border="0" cellpadding="3" cellspacing="1">
          <tr> 
            <td width="195" height="33"><div align="right"><span style="font-weight: bold">删除开始日期：</span></div></td>
            <td width="263"><font color="#00FF00">
              <input name="datestart" type="text" class="input1" id="datestart" size="25">
            </font></td>
            <td width="478">（输入留言主题的起始日期，格式为<%=date()%>）</td>
          </tr>
          <tr> 
            <td width="195" height="34" ><div align="right" style="font-weight: bold">删除结束日期：</div></td>
            <td height="34"><font color="#00FF00">
              <input name="dateend" type="text" class="input1" id="dateend" size="25">
            </font></td>
            <td height="34">（输入留言主题的结束日期，格式为<%=date()%>）</td>
          </tr>
          <tr align="center">
            <td width="195" height="33"><div align="right"><span style="font-weight: bold">时间确认：</span></div></td>
            <td height="40" colspan="2"><div align="left">
              <input name="type" type="radio" value="1" checked>
此日期为留言发表日期
<input type="radio" name="type" value="2">
此日期为留言发表日期</div></td>
          </tr>
          <tr align="center">
            <td width="195" height="33"><div align="right"><span style="font-weight: bold">阅读数：</span></div></td>
            <td height="40"><div align="left">略过阅读数大于等于<font color="#00FF00">
              <input name="yd" type="text" class="input1" id="yd" value="0" size="10">
</font>的留言</div></td>
            <td height="40"><div align="left">（请输入数字，不填为不略过）</div></td>
          </tr>
          <tr align="center">
            <td width="195" height="33"><div align="right"><span style="font-weight: bold">回复数：</span></div></td>
            <td height="40"><div align="left">略过回复数大于等于<font color="#00FF00">
            <input name="hf" type="text" class="input1" id="hf" value="0" size="10">
            </font>的留言</div></td>
            <td height="40"><div align="left">（请输入数字，不填为不略过）</div></td>
          </tr>
          <tr align="center">
            <td width="195" height="33"><div align="right"><span style="font-weight: bold">精华留言：</span></div></td>
            <td height="40"><div align="left">
              <input name="jinghua" type="checkbox" id="jinghua" value=" and jinghua=false" checked>
            略过精华留言</div></td>
            <td height="40"><div align="left">（勾选为精华留言不包括在删除范围）</div></td>
          </tr>
          <tr align="center"> 
            <td height="40" colspan="3"><input name="submit" type=submit value="删除留言"></td>
          </tr>
        </table><%end if%>
    </td>
 </tr>
</table>
</form>
<hr>
<!--#include file="bottom.asp"-->
</body>
</html>
