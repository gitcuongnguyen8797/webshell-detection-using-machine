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
<title>ע�����û���</title>
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
	 if strLength(UserName)>10 then response.Redirect "error.asp?info=�û������ȴ���10���ַ���"
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
	  response.Redirect "error.asp?info=�û����Ѵ��ڣ�"
	  end if
		response.Redirect "post_ok.asp?info=ע��ɹ���"
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
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">������ҳ</a></td>
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
      alert("�������û�����");
      document.form.UserName.focus();
      return false;
  }
  var strTemp = document.form.password.value;
  if (strTemp.length == 0 )
  {
      alert("���������룡");
      document.form.password.focus();
      return false;
  }
  var strTemp =document.form.password.value;
  var strTemp1 =document.form.password2.value;
  if (strTemp!=strTemp1)
  {
      alert("�����������벻һ�£�");
      document.form.password.focus();
      return false;
  }
  var strTemp = document.form.faceheight.value;
  if ((strTemp <1) || (strTemp >130))
  {
      alert("ͷ�񳤶�С��1�����130");
      document.form.faceheight.focus();
      return false;
  }
  var strTemp = document.form.facewidth.value;
  if ((strTemp <1) || (strTemp >130))
  {
      alert("ͷ��߶�С��1�����130");
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
        <p align="center"><strong>ע�����û���</strong>        </td>
    </tr><%if not rs11("register") then%>
    <tr>
      <td colspan="3" class="tablebg<%=skin%>d"><div align="center">�����԰岻ע��Ҳ�ɷ��ԣ�ע������û��������������뷽�ɷ��ԡ���<span style="color: #FF0000">*</span>��Ϊ�����</div></td>
    </tr><%end if%>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>�û���(<span class="style1" style="color: #FF0000">*</span>)��<br>
        </strong>ע���û�����������Ϊ0��10�ַ�</div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
        <input name="UserName" type="text" class="input1" id="UserName" size="30" maxlength="10">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>�Ա�<br>
      </strong>��ѡ�������Ա�</div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#FFFFFF">
        <select name="sex" size="1" id="select4">
          <option value="1" selected>��</option>
          <option value="0">Ů</option>
        </select>
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>����(<span class="style1" style="color: #FF0000">*</span>)��<br>
      </strong>���������룬���ִ�Сд </div></td>
      <td height="28" colspan="2" align="center"><div align="left">
        <input name="password" type="password" id="password" size="30" class="input1">
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>�ظ�����(<span class="style1" style="color: #FF0000">*</span>)��<br>
      </strong>������һ��ȷ�� </div></td>
      <td height="28" colspan="2" align="center"><div align="left">
        <input name="password2" type="password" id="password23" size="30" class="input1">
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>�����ʼ���</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="Email" size="30" class="input1">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>������ҳ��</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="HomePage" size="30" Value="http://" class="input1">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>QQ��</strong></div></td>
      <td height="28" colspan="2" align="center"><div align="left"><font color="#00FF00">
        <input name="QQ" type="text" class="input1" id="QQ3" size="30">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="258" align="center"><div align="left"><strong>ͷ��<br>
      </strong>���ϴ��Զ���ͷ���������Ч</div></td>
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
            <td width="80%"><a href="face.asp" target="_blank">��˲鿴ȫ��ͷ��Ԥ��</a></td>
          </tr>
        </table>
</div>        </td>
    </tr><%if rs11("faceupload") then%>
    <tr class="tablebg<%=skin%>d">
      <td height="28" align="center"><div align="left"><strong>ͷ���ϴ���<br>
      </strong>���ϴ��Զ���ͷ��������һ����Ч</div></td>
      <td width="222" height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="myface" type="text" class="input1" id="QQ3" size="30">
        <br>
        </font></div></td>
      <td width="458" align="center"><div align="left"><iframe style="top:2px" ID="UploadFiles" src="upload_Photo.asp?PhotoUrlID=0" frameborder=0 scrolling=no width="320" height="25"></iframe>
          <br>
          ��
          <input name="facewidth" type="text" id="facewidth" value="100" size="5">
(1-130) �ߣ�
<input name="faceheight" type="text" id="faceheight" value="100" size="5">
(1-130)</div></td>
    </tr>
	<%end if%>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="3" align="center"><input name="join" type="submit" class="input2" id="join2" value=" �� �� " >
��
  <input name="B12" type="reset" class="input2" id="B122"  value=" �� д "  >
(Ctrl+Enter�ύ)</td>
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
