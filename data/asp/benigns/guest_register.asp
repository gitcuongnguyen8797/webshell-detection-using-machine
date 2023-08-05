<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%if request.Form<>"" then%>
<meta http-equiv="refresh" content="2;<%if session("list")=0 then%>url=default.asp<%else%>url=default1.asp<%end if%>">
<%end if%>
<title>注册新用户名</title>
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
if request.Form<>"" then
     UserName=Request.Form("UserName")
	 if strLength(UserName)>10 then response.Redirect "error.asp?info=用户名长度大于10个字符！"
	 password=request.Form("password")
	 Email=Request.Form("Email")
     HomePage=Trim(Request.Form("HomePage"))
	 qq=request.Form("QQ")
	 sex=Request.Form("sex")
     Face=Request.Form("Face")
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
      Set rs=server.createobject("ADODB.RECORDSET")
	  rs.open "Select * From register where username='" & request("username")& "'" ,Conn,3,3
	  if rs.eof then
	  sql="Insert Into register (username,password1,mail,homepage,face,sex,qq,myface,faceheight,facewidth)  Values('"& UserName&"','"& md5(password)&"','"&email&"','"&homepage&"','"&face&"','"&sex&"','"&qq&"','"&myface&"',"&faceheight&","&facewidth&")"
	  conn.Execute sql
cookiePath=request.servervariables("path_info")
cookiePath=left(cookiePath,instrRev(cookiePath,"/"))
response.cookies("ly").Path=cookiePath
response.cookies("ly")("useridname")=username
response.cookies("ly")("useridpassword")=password
      else
	  response.Redirect "error.asp?info=用户名已存在！"
	  end if
		response.Redirect "post_ok.asp?info=注册成功！"
	 rs.close
	 set rs=nothing
conn.close
set conn=nothing
response.end
end if
%>
<table border=0 width=100% align=center>
  <tr>
    <td width="3%" align=left><font color="#FF0000">&nbsp;<img src="images/home.gif" border=0></font></td>
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">留言首页</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<SCRIPT language=javascript>
function  save_onclick()
{
  var strTemp = document.form.UserName.value;
  if (strTemp.length == 0 )
  {
      alert("请输入用户名！");
      document.form.UserName.focus();
      return false;
  }
  var strTemp = document.form.password.value;
  if (strTemp.length == 0 )
  {
      alert("请输入密码！");
      document.form.password.focus();
      return false;
  }
  var strTemp =document.form.password.value;
  var strTemp1 =document.form.password2.value;
  if (strTemp!=strTemp1)
  {
      alert("两次输入密码不一致！");
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
<form action="" method="POST" name="form" id="form" onsubmit="return save_onclick()">
  <input type="hidden" name="form" value="SaveData">
  <input type="hidden" name="D_Date" value="<%=cstr(now())%>">
  <table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
    <tr class="tablebg<%=skin%>a">
      <td colspan="3">
        <p align="center"><strong>注册新用户名</strong>        </td>
    </tr><%if not rs11("register") then%>
    <tr>
      <td colspan="3" class="tablebg<%=skin%>d"><div align="center">本留言板不注册也可发言，注册后保留用户名，须输入密码方可发言。带<span style="color: #FF0000">*</span>的为必填项。</div></td>
    </tr><%end if%>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>用户名(<span class="style1" style="color: #FF0000">*</span>)：<br>
        </strong>注册用户名长度限制为0－10字符</div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
        <input name="UserName" type="text" class="input1" id="UserName" size="30" maxlength="10">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>性别：<br>
      </strong>请选择您的性别</div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#FFFFFF">
        <select name="sex" size="1" id="select4">
          <option value="1" selected>男</option>
          <option value="0">女</option>
        </select>
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>密码(<span class="style1" style="color: #FF0000">*</span>)：<br>
      </strong>请输入密码，区分大小写 </div></td>
      <td height="28" colspan="2" align="center"><div align="left">
        <input name="password" type="password" id="password" size="30" class="input1">
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>重复密码(<span class="style1" style="color: #FF0000">*</span>)：<br>
      </strong>请再输一遍确认 </div></td>
      <td height="28" colspan="2" align="center"><div align="left">
        <input name="password2" type="password" id="password23" size="30" class="input1">
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>电子邮件：</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="Email" size="30" class="input1">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>个人主页：</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="HomePage" size="30" Value="http://" class="input1">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>QQ：</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
        <input name="QQ" type="text" class="input1" id="QQ3" size="30">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>头像：<br>
      </strong>若上传自定义头像则此项无效</div></td>
      <td height="28" colspan="2" align="center" valign="top"><div align="left">
        <table width="100%"  border="0">
          <tr>
            <td width="9%"><select name="face" size="1" id="select5" onChange="document.all.idface.src=options[selectedIndex].value;">
              <option value="face/1.gif" selected>1</option>
              <%for i=2 to 56%>
			  <option value="face/<%=i%>.gif"><%=i%></option>
				<%next%>
            </select></td>
            <td width="11%"><img src="face/1.gif" width="72" height="122" align="left" id=idface ></td>
            <td width="80%"><a href="face.asp" target="_blank">点此查看全部头像预览</a></td>
          </tr>
        </table>
</div>        </td>
    </tr><%if rs11("faceupload") then%>
    <tr class="tablebg<%=skin%>d">
      <td height="28" align="center"><div align="left"><strong>头像上传：<br>
      </strong>若上传自定义头像则上面一项无效</div></td>
      <td width="222" height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="myface" type="text" class="input1" id="QQ3" size="30">
        <br>
        </font></div></td>
      <td width="458" align="center"><div align="left"><iframe style="top:2px" ID="UploadFiles" src="upload_Photo.asp?PhotoUrlID=0" frameborder=0 scrolling=no width="320" height="25"></iframe>
          <br>
          宽：
          <input name="facewidth" type="text" id="facewidth" value="100" size="5">
(1-130) 高：
<input name="faceheight" type="text" id="faceheight" value="100" size="5">
(1-130)</div></td>
    </tr>
	<%end if%>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="3" align="center"><input name="join" type="submit" class="input2" id="join2" value=" 提 交 " >
　
  <input name="B12" type="reset" class="input2" id="B122"  value=" 重 写 "  >
(Ctrl+Enter提交)</td>
    </tr>
  </table>
  <table border=0 width=100% align=center>
    <tr> 
      <td height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
    </tr>
    <tr> 
      <td align=center> 
        <!--#INCLUDE FILE="bottom.asp"-->
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
