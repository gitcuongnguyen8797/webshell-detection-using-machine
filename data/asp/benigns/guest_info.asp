<%@language=vbscript codepage=936 %>
<!--#INCLUDE file="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改注册信息</title>
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body onkeydown="if(event.keyCode==13 && event.ctrlKey) if(save_onclick())document.form.submit()">
<table border=0 width=100% align=center>
  <tr> 
    <td align=center> 
      <!--#INCLUDE FILE="top.asp"-->
  </tr>
  <tr> 
    <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table>
<%
Set rs=server.createobject("ADODB.RECORDSET")
if request.Form<>"" then
	 password=md5(Request.Form("password"))
	 mail=request.Form("email")
     HomePage=Trim(Request.Form("HomePage"))
	 qq=request.Form("qq")
	 face=request.Form("face")
	 sex=request.Form("sex")
	 if Request.Form("faceheight")="" then 
	 	faceheight=0 
	 else 
		faceheight=Request.Form("faceheight")
	 end if
	 if Request.Form("facewidth")="" then 
	 	facewidth=0 
	 else 
	 	facewidth=Request.Form("facewidth")
	 end if
	 if rs11("faceupload") then myface=Request.Form("myFace")
	 if homepage="http://" then homepage="" 
	  rs.open "Select * From register where username='" &session("useridname")& "'" ,Conn,3,3  
		rs("password1")=password
    	rs("mail")=mail
		rs("homepage")=homepage
		rs("qq")=qq
		rs("face")=face
		rs("sex")=sex
		rs("myface")=myface
		rs("faceheight")=faceheight
		rs("facewidth")=facewidth
    	rs.update
    	rs.close
     response.Redirect "post_ok.asp?info=注册信息修改成功！"
set rs=nothing
conn.close
set conn=nothing
end if
%>	
<SCRIPT language=javascript>
function  save_onclick()
{
  var strTemp = document.form.password.value;
  var strTemp1 = document.form.password2.value;
  if (strTemp!= strTemp1 )
  {
      alert("两次填写密码不一致！");
      document.form.password.focus();
      return false;
  }
  var strTemp = document.form.faceheight.value;
  if ((strTemp <1) || (strTemp >130))
  {
      alert("头像长度小于1或大于130");
      document.form.faceheight.focus();
      return false;
  }
  var strTemp = document.form.facewidth.value;
  if ((strTemp <1) || (strTemp >130))
  {
      alert("头像高度小于1或大于130");
      document.form.facewidth.focus();
      return false;
  }
  return true;  
}
</SCRIPT>
</p>
<% 
   rs.open "Select * From register where username='"&session("useridname")&"'",Conn,3,3
%>
<table border=0 width=100% align=center>
  <tr>
    <td width="3%" align=left><font color="#FF0000">&nbsp;<img src="images/home.gif" border=0></font></td>
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">留言首页</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form action="" method="POST" name="form" id="form" onsubmit="return save_onclick()">
  <input type="hidden" name="form" value="SaveData">
  <input type="hidden" name="D_Date" value="<%=cstr(now())%>">
  <table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
    <tr class="tablebg<%=skin%>a">
      <td colspan="3">
        <p align="center"><strong>修改注册信息</strong> </td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>用户名(<span class="style1" style="color: #FF0000">*</span>)：<br>
      </strong>注册用户名长度限制为0－10字符</div></td>
      <td height="28" colspan="2" align="center"><div align="left">
          <%=session("useridname")%></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>性别：<br>
      </strong>请选择您的性别</div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#FFFFFF">
          <select name="sex" size="1" id="select2">
            <option value="1" <%if rs("sex")=1 then%>selected<%end if%>>男</option>
            <option value="0"<%if rs("sex")=0 then%>selected<%end if%>>女</option>
          </select>
</font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>密码(<span class="style1" style="color: #FF0000">*</span>)：<br>
      </strong>请输入密码，区分大小写 </div></td>
      <td height="28" colspan="2" align="center"><div align="left">
          <input name="password" type="password" class="input1" id="password6" value="<%=session("useridpassword")%>" size="30">
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>重复密码(<span class="style1" style="color: #FF0000">*</span>)：<br>
      </strong>请再输一遍确认 </div></td>
      <td height="28" colspan="2" align="center"><div align="left">
          <input name="password2" type="password" class="input1" id="password25" value="<%=session("useridpassword")%>" size="30">
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>电子邮件：</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input name="Email" type="text" class="input1" value="<%=rs("mail")%>" size="30">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>个人主页：</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="HomePage" size="30" Value="<%=rs("homepage")%>" class="input1">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>QQ：</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input name="QQ" type="text" class="input1" id="QQ4" value="<%=rs("qq")%>" size="30">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="251" align="center"><div align="left"><strong>头像：</strong></div></td>
      <td height="28" colspan="2" align="center" valign="top"><div align="left">
          <table width="100%"  border="0">
            <tr>
              <td width="9%"><select name="face" size="1" id="select3" onChange="document.all.idface.src=options[selectedIndex].value;">
                <%for i=1 to 56%>
				<option <%if rs("face")="face/"&i&".gif" then%>selected<%end if%> value="face/<%=i%>.gif"><%=i%></option>
 				<%next%>
              </select></td>
              <td width="11%"><img src="<%if rs("myface")<>"" then response.write(rs("myface")) else response.write(rs("face"))%>" width="72" id=idface ></td>
              <td width="80%"><a href="face.asp" target="_blank">点此查看全部头像预览</a></td>
            </tr>
			
          </table>
      </div></td>
    </tr><%if rs11("faceupload") then%>
    <tr class="tablebg<%=skin%>d">
      <td height="28" align="center"><div align="left"><strong>头像上传：<br>
      </strong>若上传自定义头像则上面一项无效</div></td>
      <td width="217" height="28" align="center"><div align="left"><font color="#00FF00">
          <input name="myface" type="text" class="input1" id="QQ3" value="<%=rs("myface")%>" size="30">
      </font></div></td>
      <td width="470" align="center"><div align="left">
          <iframe style="top:2px" ID="UploadFiles" src="upload_Photo.asp?PhotoUrlID=0&id=<%=rs("id")%>" frameborder=0 scrolling=no width="320" height="25"></iframe>
          <br>
          宽：
          <input name="facewidth" type="text" id="facewidth" value="<%=rs("facewidth")%>" size="5">
(1-130) 高：
<input name="faceheight" type="text" id="faceheight" value="<%=rs("faceheight")%>" size="5">
(1-130)</div></td>
    </tr><%end if%>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="3" align="center"><input name="join" type="submit" class="input2" id="join4" value=" 提 交 " >
　
  <input name="B12" type="reset" class="input2" id="B124"  value=" 重 写 "  >
(Ctrl+Enter提交)</td>
    </tr>
  </table>
  <table border=0 width=100% align=center>
    <tr> 
      <td height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
    </tr>
    <tr> 
      <td align=center> 
	  <%rs.close
	  set rs=nothing%>
        <!--#INCLUDE FILE="bottom.asp"-->
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
<%
set rs=nothing
%>