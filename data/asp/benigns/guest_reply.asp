<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="ubblabel.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ظ�������</title>
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body onkeydown="if(event.keyCode==13 && event.ctrlKey) if(save_onclick1())document.form.submit()">
<%
session("useridname")=Request.cookies("ly")("useridname")
session("useridpassword")=Request.cookies("ly")("useridpassword")
session("admin")=Request.cookies("ly")("admin")
%>
<table border=0 width=100% align=center>
  <tr> 
    <td align=center> 
      <!--#INCLUDE FILE="top.asp"-->
  </tr>
  <tr> 
    <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table>
  <SCRIPT language=javascript>
function  save_onclick()
{
  document.form.Content.value=editor.HtmlEdit.document.body.innerHTML; 
  var strTemp = document.form.UserName.value;
  if (strTemp.length == 0 )
  {
      alert("�������û�����");
      document.form.UserName.focus();
      return false;
  }
  var strTemp = document.form.Content.value;
  if (strTemp.length == 0 )
  {
      alert("����д�������ݣ�");
      return false;
  }
  return true;
}
function  save_onclick1()
{
  var strTemp = document.form.UserName.value;
  if (strTemp.length == 0 )
  {
      alert("�������û�����");
      document.form.UserName.focus();
      return false;
  }
  var strTemp = document.form.Content.value;
  if (strTemp.length == 0 )
  {
      alert("����д�������ݣ�");
      return false;
  }
  return true;
}
function guestpreview()
{
document.preview.content.value=document.form.Content.value;
var popupWin = window.open('GuestPreview.asp', 'GuestPreview', 'scrollbars=yes,width=620,height=230');
document.preview.submit()
}
</SCRIPT>
</p>
<%
Set rs1=server.createobject("ADODB.RECORDSET")
rs1.open "Select * From guest where id="&request("id"),Conn,3,3
%>
<table border=0 width=100% align=center>
  <tr>
    <td width="3%" align=left><font color="#FF0000">&nbsp;<img src="images/home.gif" border=0></font></td>
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">������ҳ</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form action="reply_post.asp" method="POST" name="form" id="form" <%if rs11("muieditor")=1 then%>onsubmit="return save_onclick()"<%else%>onsubmit="return save_onclick1()"<%end if%>>
  <input type="hidden" name="form" value="SaveData">
  <input type="hidden" name="D_Date" value="<%=cstr(now())%>">
  <table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
    <tr class="tablebg<%=skin%>a">
      <td colspan="2">
        <p align="center"><strong>�ظ�����</strong></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�û���(<span class="style1" style="color: #FF0000">*</span>)��<br>
      </strong>ע���û�����������Ϊ0��10�ַ�</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
          <input name="UserName" type="text" class="input1" value="<%=session("useridname")%>" size="15">
      </font></div></td>
    </tr>
    <%if session("useridname")="" then%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�Ա�<br>
      </strong>��ѡ�������Ա�</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <select name="sex" size="1" id="select4">
            <option value="man" selected>��</option>
            <option value="woman">Ů</option>
          </select>
      </font></div></td>
    </tr>
    <%end if%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>����(<span class="style1" style="color: #FF0000">*</span>)��<br>
      </strong>���������룬���ִ�Сд </div></td>
      <td height="28" align="center"><div align="left">
          <input name="password" type="password" class="input1" id="password2" value="<%=session("useridpassword")%>" size="15">
          <%if session("useridname")="" then
		  if rs11("register") then%>
����
<%else%>
(�ɲ�������Զ�ע���û���)
<%end if
end if%>
</div></td>
    </tr>
    <%if session("useridname")="" then%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�����ʼ���</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="Email" size="25" class="input1">
          <font color="0"> (��ע���û�������)</font></font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>������ҳ��</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="HomePage" size="25" Value="http://" class="input1">
          <font color="0">(��ע���û�������)</font> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>QQ��</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
          <input name="qq" type="text" class="input1" id="qq2" size="25">
          <font color="0"> (��ע���û�������)</font></font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>ͷ��</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left">
          <table width="100%"  border="0">
            <tr>
              <td width="9%"><select name="face" size="1" id="select5" onChange="document.all.idface.src=options[selectedIndex].value;">
                <option selected value="face/1.gif">1</option>
                <%for i=2 to 56%>
				<option value="face/<%=i%>.gif"><%=i%></option>
				<%next%>
              </select></td>
              <td width="11%"><img src="face/1.gif" width="72" height="122" id=idface ></td>
              <td width="80%"><a href="face.asp" target="_blank">��˲鿴ȫ��ͷ��Ԥ��</a><font color="#00FF00"><font color="0">(��ע���û�����ѡ)</font> </font></td>
            </tr>
          </table>
      </div></td>
    </tr>
    <%end if%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>���飺</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left">
          <table border="0" width="66%" cellspacing="1" cellpadding="0">
            <tr>
              <td width="5%" align="center"><input name="pic" type="radio" value="p1.gif" checked>
              </td>
              <td width="5%"><img src="images/p1.gif" width="22" height="22" border="0"></td>
              <td width="5%" align="center"><input type="radio" value="p2.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p2.gif" width="19" height="19" border="0"></td>
              <td width="5%" align="center"><input type="radio" value="p3.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p3.gif" width="19" height="19" border="0"></td>
              <td width="5%" align="center"><input type="radio" value="p4.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p4.gif" width="19" height="19" border="0"></td>
              <td width="5%"><input type="radio" value="p5.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p5.gif" width="19" height="19" border="0"></td>
              <td width="5%"><input type="radio" value="p6.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p6.gif" width="19" height="19" border="0"></td>
              <td width="5%"><input type="radio" value="p7.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p7.gif" width="19" height="19" border="0"></td>
              <td width="5%"><input type="radio" value="p8.gif" name="pic">
              </td>
              <td width="5%"><img src="images/p8.gif" width="19" height="19" border="0"></td>
              <td width="5%"><input type="radio" value="p9.gif" name="pic">
              </td>
              <td width="5%"><img border="0" src="images/p9.gif" width="19" height="19"></td>
              <td width="7%"><input type="radio" value="p9.gif" name="pic"></td>
              <td width="3%"><img border="0" src="images/p10.gif" width="19" height="19"></td>
              <td width="3%">&nbsp;</td>
              <td width="1%"><input type="radio" value="p9.gif" name="pic">
              </td>
              <td width="2%"><img border="0" src="images/p11.gif" width="22" height="22"></td>
            </tr>
            <tr>
              <td align="center"><input type="radio" value="p10.gif" name="pic">
              </td>
              <td><img border="0" src="images/p12.gif" width="19" height="19"></td>
              <td align="center"><input type="radio" value="p11.gif" name="pic">
              </td>
              <td><img border="0" src="images/p13.gif" width="19" height="19"></td>
              <td align="center"><input type="radio" value="p12.gif" name="pic">
              </td>
              <td><img border="0" src="images/p14.gif" width="22" height="22"></td>
              <td align="center"><input type="radio" value="p13.gif" name="pic">
              </td>
              <td><img border="0" src="images/p15.gif" width="22" height="22"></td>
              <td><input type="radio" value="p14.gif" name="pic">
              </td>
              <td><img border="0" src="images/p16.gif" width="22" height="22"></td>
              <td><input type="radio" value="p15.gif" name="pic">
              </td>
              <td><img border="0" src="images/p17.gif" width="22" height="22"></td>
              <td><input name="pic" type="radio" value="p16.gif">
              </td>
              <td><img border="0" src="images/p18.gif" width="22" height="22"></td>
              <td><input type="radio" value="p17.gif" name="pic">
              </td>
              <td><img border="0" src="images/p19.gif" width="22" height="22"></td>
              <td><input type="radio" value="p18.gif" name="pic">
              </td>
              <td><img border="0" src="images/p20.gif" width="22" height="22"></td>
              <td><input type="radio" value="p9.gif" name="pic"></td>
              <td><img border="0" src="images/p21.gif" width="22" height="22"></td>
              <td>&nbsp;</td>
              <td><input type="radio" value="p9.gif" name="pic">
              </td>
              <td><img border="0" src="images/p22.gif" width="22" height="22"></td>
            </tr>
          </table>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>���Ա��⣺</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left"><b><%=rs1("subject")%></b></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�������ݣ�</strong><br>
        <%if rs11("muieditor")=1 then%>�������밴Shift+Enter <br>
������һ���밴Enter<%end if%><br>
��֧��UBB��ǩ</div></td>
      <td height="28" align="center" valign="top"><div align="left">
	  <%if rs11("muieditor")=1 then%>
               <textarea name="Content" style="display:none"></textarea> 
              <iframe ID="editor" src="editor_reply.asp?Action=<%=request("quote")%>&id=<%=request("id")%>&id1=<%=request("id1")%>" frameborder=1 scrolling=no width="620" height="405"></iframe>
	  <%else if rs11("muieditor")=2 then
	  call showubb()
	  if request("quote")="1" then
		Set rs2=server.createobject("ADODB.RECORDSET")
		if request("id1")="" then
			rs2.open "Select * From guest where id="&request("id"),Conn,1,1
		else	
			rs2.open "Select * From reply where id1="&request("id1"),Conn,1,1
		end if
	  end if
	  %>
	  <textarea name="Content" cols="60" rows="5" id="Content"><%if request("quote")="1" then 
	  if request("id1")="" then
	  	response.Write("<DIV class=quote><b>����������<i>"&rs2("username")&"</i>��"&rs2("lydate")&"�ķ��ԣ�</b><br>"&rs2("content")&"</font></DIV><P>")
	  else
	  	response.Write("<DIV class=quote><b>����������<i>"&rs2("replyname")&"</i>��"&rs2("replydate")&"�ķ��ԣ�</b><br>"&rs2("replycontent")&"</font></DIV><P>")
	  end if
	  end if
		%></textarea>
	  <%
	  if request("quote")="1" then
	  	rs2.close
	  	set rs2=nothing
	  end if
	  %>  
	  <%else
	  if request("quote")="1" then
		Set rs2=server.createobject("ADODB.RECORDSET")
		if request("id1")="" then
			rs2.open "Select * From guest where id="&request("id"),Conn,1,1
		else	
			rs2.open "Select * From reply where id1="&request("id1"),Conn,1,1
		end if
	  end if
%>
	  <textarea name="Content" cols="60" rows="5" id="Content"><%if request("quote")="1" then 
	  if request("id1")="" then
	  	response.Write("<DIV class=quote><b>����������<i>"&rs2("username")&"</i>��"&rs2("lydate")&"�ķ��ԣ�</b><br>"&rs2("content")&"</font></DIV><P>")
	  else
	  	response.Write("<DIV class=quote><b>����������<i>"&rs2("replyname")&"</i>��"&rs2("replydate")&"�ķ��ԣ�</b><br>"&rs2("replycontent")&"</font></DIV><P>")
	  end if
	  end if
		%></textarea>
	  <%
	  if request("quote")="1" then
	  	rs2.close
	  	set rs2=nothing
	  end if
	  end if
	  end if%>
  <%
  rs1.close
  set rs1=nothing
%>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>���Թ��ܣ�</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left">
          <input name="secret" type="checkbox" id="secret3" value="1">
���Ļ�(ֻ��<strong>��¼</strong>��ſɿ����Լ������Լ��ظ�������)</div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="2" align="center"><input name="join" type="submit" class="input2" id="join2" value=" �� �� ">
��
  <%if rs11("muieditor")=2 then%>
  <input name="join" type="button" class="input2" id="join3" value=" Ԥ �� " onclick=guestpreview()>
��
<%end if%>
<input name="B12" type="reset" class="input2" id="B122"  value=" �� д "  >
(Ctrl+Enter�ύ) ��<font color="#00FF00">
<input name="id2" type="hidden" id="id22" value="<%=request("id")%>">
</font>
<input name="all" type="hidden" id="all2" value="1"></td>
    </tr>
  </table>
</form>
		<form name=preview action="GuestPreview.asp" method=post target=GuestPreview>
		<input type=hidden name=title value=><input type=hidden name=content value=>
		</form>
</body>
</html>
<!--#INCLUDE FILE="bottom.asp"-->