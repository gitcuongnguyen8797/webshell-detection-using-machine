<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发生错误</title>
<link href="1.css" rel="stylesheet" type="text/css">
</head>

<body>
<table border=0 width=100% align=center>
  <tr> 
    <td width="100%" align=center> 
      <!--#INCLUDE FILE="top.asp"-->
    <%info=request("info")%>  </tr>
  <tr> 
    <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table>
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a">
    <td>
      <p align="center"><strong>错误信息</strong> </td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="28" align="center"><div align="center">
      <p><font color="#FF0000"><b>发生错误<br>
      </b></font> <%=info%> </p>
      <form name="form">
        <input name="button" type="button" class="input2" onClick=window.history.back(); value="返回前页" >
      </form>
      <p align="center">：：：
          <%if session("list")=0 then%>
          <a href="default.asp">回留言板首页面</a>
          <%else%>
          <a href="default1.asp">回留言板首页面</a>
          <%end if%>
  ：：：      
    </div></td>
  </tr>
</table>
<table border=0 width=100% align=center>
  <tr> 
    <td width="100%"> 
      <%  
	  set guest=nothing 
      set rs = nothing%>    </td>
  </tr>
  <tr> 
    <td height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
  </tr>
  <tr> 
    <td align=center> 
      <!--#INCLUDE FILE="bottom.asp"-->
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
