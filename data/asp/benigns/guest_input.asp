<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<!--#INCLUDE FILE="md5.asp"-->
<!--#INCLUDE FILE="ubbcode.asp"-->
<!--#INCLUDE FILE="ubblabel.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>д������</title>
<link href="1.css" rel="stylesheet" type="text/css">
</head>
  <SCRIPT language=javascript>
function  save_onclick()
{
  document.form.Content.value=editor.HtmlEdit.document.body.innerHTML; 
  var strTemp = document.form.subject.value;
  if (strTemp.length == 0 )
  {
      alert("���������Ա��⣡");
      document.form.subject.focus();
      return false;
  }
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
  var strTemp = document.form.subject.value;
  if (strTemp.length == 0 )
  {
      alert("���������Ա��⣡");
      document.form.subject.focus();
      return false;
  }
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
<body onkeydown="if(event.keyCode==13 && event.ctrlKey) if(save_onclick1())document.form.submit()">
<%
session("useridname")=Request.cookies("ly")("useridname")
session("useridpassword")=Request.cookies("ly")("useridpassword")
session("admin")=Request.cookies("ly")("admin")
%>
<table border=0 width=100% align=center>
  <tr> 
    <td width="100%" align=center> 
      <!--#INCLUDE FILE="top.asp"-->  </tr>
  <tr> 
    <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table>
<%
if request.Form<>"" then
	 register=rs11("register")
     UserName=Trim(Request.Form("UserName"))
	 if UserName="" then response.Redirect "error.asp?info=�������û�����"
	 password=Trim(request.Form("password"))
	 Email=Trim(Request.Form("Email"))
     HomePage=Trim(Trim(Request.Form("HomePage")))
	 qq=Trim(request.Form("qq"))
	 sex=Request.Form("sex")
     Face=Trim(Request.Form("Face"))
     Subject=Trim(HTMLEncode(Request.Form("Subject")))
	 pic=Trim(request.Form("pic"))
	 secret=request.Form("secret")
	 fontcolor=Trim(request.Form("fontcolor"))
	 if secret<>1 then secret=0
     content=Request.Form("content")
	 if (rs11("lylength")<>0) and (strLength(UserName)>rs11("lylength")) then response.Redirect "error.asp?info=���Գ��ȴ���"&rs11("lylength")&"�����֣�"
	dim strSiteUrl
	strSiteUrl=request.ServerVariables("HTTP_REFERER")
	strSiteUrl=lcase(left(strSiteUrl,instrrev(strSiteUrl,"/")))
	Content=replace(Content,strSiteUrl,"")
	 content=replace(content,"'","""")
	 if rs11("muieditor")=0 or rs11("muieditor")=2 then
		content=HTMLEncode(content)
	 end if
	 level=request.Form("level1")
	 IPinfo = Request.servervariables("REMOTE_ADDR")
     bookdate =now

if session("keeptime")="" then 
	session("keeptime")=now
else if (dateDiff("s",session("keeptime"),now)<=rs11("second1")) and ((session("admin")<>1) and (session("admin")<>2)) then 
	response.Redirect("error.asp?info=�벻Ҫ��ˮ")
else session("keeptime")=now
end if
end if

Dim serchIP
Dim strB
strB=rs11("killIP")
if strB<>"" then 
	serchIP=Split(strB,",")
	for i=0 to ubound(serchIP)
		if IPinfo=serchIP(i) then response.Redirect "error.asp?info=ϵͳ�Ѿ���ֹ����ķ��ԣ�"
	next
end if

Dim arrayx
Dim strA
strtemp=content
strtemp1=Subject
strA=rs11("killword")
if strA<>"" then 
arrayx=Split(strA,",")
for i=0 to ubound(arrayx)
strtemp=replace(strtemp,arrayx(i),"***")
strtemp1=replace(strtemp1,arrayx(i),"***")
next
end if
if (strtemp<>content) or (strtemp1<>Subject) then
	if rs11("stopword") then
		rs11("killIP")=rs11("killIP")&","&IPinfo
		rs11.update
	end if
end if
content=strtemp
Subject=strtemp1

	 if homepage="http://" then homepage="" 
	 Set rs=server.createobject("ADODB.RECORDSET")
	  rs.open "Select * From register where username='" & request("username")& "'" ,Conn,3,3
	  if (username<>"") and (password<>"") and (not rs.eof) then
	  if (rs("username")=username) and (rs("password1")=md5(password)) then
	  	homepage=rs("homepage")
	  	Email=rs("mail")
		qq=rs("qq")
		rs("count1")=rs("count1")+1
		rs.update
	  end if
	  end if
      if (rs.eof) and (register) then response.Redirect("error.asp?info=δע���û���������")
	  if not (rs.eof or rs.bof) then 
	  	if rs("password1")<>md5(password) then response.Redirect "error.asp?info=�û�����ע�ᣬ�������" 
		rs.close    
	  else
	    rs.close
		if password<>"" then
		sql="Insert Into register (username,password1,mail,homepage,face,sex,count1,qq)  Values('"& UserName&"','"& md5(password)&"','"&email&"','"&homepage&"','"&face&"','"&sex&"',1,'"&qq&"')"
	  	conn.Execute sql
		cookiePath=request.servervariables("path_info")
		cookiePath=left(cookiePath,instrRev(cookiePath,"/"))
		response.cookies("ly").Path=cookiePath
		response.cookies("ly")("useridname")=username
		response.cookies("ly")("useridpassword")=password
		end if
	  end if
	  if (session("admin")=1) or (session("admin")=2) then
	  	mark=true
	  else
			 if (Instr(rs11("passuser"),","&UserName)>0) or (Instr(rs11("passuser"),","&UserName&",")>0) or (Instr(rs11("passuser"),","&UserName&",")>0) then
				mark=true
			 else
				mark=false
			 end if
	 end if
	 sql="Insert Into guest (username,face,sex,homepage,mail,subject,content,IP,lydate,lastdate,pic,secret,qq,lastname,mark,fontcolor)  Values('"& UserName &"','"& Face &"','"& sex &"','"& HomePage &"', '"& Email &"','"& Subject &"','"&content &"','"& IPinfo &"','"& bookdate &"','"& bookdate &"','"& pic &"',"& secret &",'"&qq&"','����',"&mark&",'"&fontcolor&"')"
	 conn.Execute sql
	 rs.open "Select * From guest order by id desc" ,Conn,1,1
	 id=rs("id")
	 rs.close
	 set rs=nothing
conn.close
set conn=nothing
	response.Redirect "guest_save_ok.asp?id="&id
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
<form action="" method="POST" name="form" id="form" <%if rs11("muieditor")=1 then%>onsubmit="return save_onclick()"<%else%>onsubmit="return save_onclick1()"<%end if%>>
  <input type="hidden" name="form" value="SaveData">
  <input type="hidden" name="D_Date" value="<%=cstr(now())%>">
  <table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
    <tr class="tablebg<%=skin%>a">
      <td colspan="2">
        <p align="center"><strong>д������</strong> </td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�û�����<br>
      </strong>�û�����������Ϊ0��10�ַ�</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
          <input name="UserName" type="text" class="input1" value="<%=session("useridname")%>" size="15" maxlength="10">
      </font></div></td>
    </tr>
	<%if session("useridname")="" then%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�Ա�<br>
      </strong>��ѡ�������Ա�</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <select name="sex" size="1" id="select">
            <option value="1" selected>��</option>
            <option value="0">Ů</option>
          </select>
</font></div></td>
    </tr>
	<%end if%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>���룺<br>
      </strong>���������룬���ִ�Сд </div></td>
      <td height="28" align="center"><div align="left">
          <input name="password" type="password" class="input1" id="password3" value="<%=session("useridpassword")%>" size="15">
<%if session("useridname")="" then%>
          <%if rs11("register") then%>
����
<%else%>
(�ɲ�������Զ�ע���û���)
<%end if%>
<%end if%>
</div></td>
    </tr>
	<%if session("useridname")="" then%>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�����ʼ���</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
          <input type="text" name="Email" size="25" class="input1">
          <font color="0"> (��ע���û�������)</font> </font></div></td>
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
          <input name="QQ" type="text" class="input1" id="QQ2" size="25">
          <font color="0"> (��ע���û�������)</font> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>ͷ��</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left">
          <table width="100%"  border="0">
            <tr>
              <td width="9%"><select name="face" size="1" id="select2" onChange="document.all.idface.src=options[selectedIndex].value;">
                <option value="face/1.gif" selected>1</option>
                <%for i=2 to 56%>
				<option value="face/<%=i%>.gif"><%=i%></option>
				<%next%>
              </select></td>
              <td width="11%"><img src="face/1.gif" width="72" height="122" id=idface ></td>
              <td width="80%"><a href="face.asp" target="_blank">��˲鿴ȫ��ͷ��Ԥ��</a><font color="#00FF00"><font color="0">(ע���û�����ѡ)</font> </font></td>
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
            <td width="5%" align="center"><input name="pic" type="radio" value="p16.gif" checked>
            </td>
            <td width="5%"><img src="images/p16.gif" width="22" height="22" border="0"></td>
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
            <td width="5%"><img src="images/p7.gif" width="22" height="22" border="0"></td>
            <td width="5%"><input type="radio" value="p8.gif" name="pic">
            </td>
            <td width="5%"><img src="images/p8.gif" width="22" height="22" border="0"></td>
            <td width="5%"><input type="radio" value="p9.gif" name="pic">
            </td>
            <td width="5%"><img border="0" src="images/p9.gif" width="19" height="19"></td>
            <td width="7%"><input type="radio" value="p10.gif" name="pic"></td>
            <td width="3%"><img border="0" src="images/p10.gif" width="19" height="19"></td>
            <td width="1%"><input type="radio" value="p11.gif" name="pic">
            </td>
            <td width="2%"><img border="0" src="images/p11.gif" width="22" height="22"></td>
          </tr>
          <tr>
            <td align="center"><input type="radio" value="p12.gif" name="pic">
            </td>
            <td><img border="0" src="images/p12.gif" width="19" height="19"></td>
            <td align="center"><input type="radio" value="p13.gif" name="pic">
            </td>
            <td><img border="0" src="images/p13.gif" width="19" height="19"></td>
            <td align="center"><input type="radio" value="p14.gif" name="pic">
            </td>
            <td><img border="0" src="images/p14.gif" width="22" height="22"></td>
            <td align="center"><input type="radio" value="p15.gif" name="pic">
            </td>
            <td><img border="0" src="images/p15.gif" width="22" height="22"></td>
            <td><input type="radio" value="p1.gif" name="pic">
            </td>
            <td><img border="0" src="images/p1.gif" width="22" height="22"></td>
            <td><input type="radio" value="p17.gif" name="pic">
            </td>
            <td><img border="0" src="images/p17.gif" width="22" height="22"></td>
            <td><input name="pic" type="radio" value="p18.gif">
            </td>
            <td><img border="0" src="images/p18.gif" width="22" height="22"></td>
            <td><input type="radio" value="p19.gif" name="pic">
            </td>
            <td><img border="0" src="images/p19.gif" width="22" height="22"></td>
            <td><input type="radio" value="p20.gif" name="pic">
            </td>
            <td><img border="0" src="images/p20.gif" width="22" height="22"></td>
            <td><input type="radio" value="p21.gif" name="pic"></td>
            <td><img border="0" src="images/p21.gif" width="22" height="22"></td>
            <td><input type="radio" value="p22.gif" name="pic">
            </td>
            <td><img border="0" src="images/p22.gif" width="22" height="22"></td>
          </tr>
        </table>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>���Ա��⣺</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left"><font color="#00FF00">
        <input name="subject" type="text" class="input1" id="subject2" size="50" maxlength="50" >
        <%if (session("admin")=1) or (session("admin")=2) then%><select name="fontcolor" id="fontcolor">
          <option selected>������Ŀ</option>
          <option value="red">��ɫ��Ŀ</option>
          <option value="green">��ɫ��Ŀ</option>
          <option value="blue">��ɫ��Ŀ</option>
        </select><%end if%>
</font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>�������ݣ�</strong><br>
<%if rs11("muieditor")=1 then%>�������밴Shift+Enter <br>
������һ���밴Enter<%end if%><br>
��֧��UBB��ǩ</div></td>
      <td height="28" align="center" valign="top"><div align="left">
	  <%if rs11("muieditor")=1 then%>
	  <textarea name="Content" style="display:none"></textarea> 
	  <iframe ID="editor" src="editor.asp" frameborder=1 scrolling=no width="620" height="405"></iframe>
	  <%else if rs11("muieditor")=2 then%>
	  <% call showubb()%>
	  <textarea name="Content" cols="60" rows="5" id="Content"></textarea>
	  <%else%>
	  <textarea name="Content" cols="60" rows="5" id="Content"></textarea>
	  <%end if
	  end if%>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="220" align="center"><div align="left"><strong>���Թ��ܣ�</strong></div></td>
      <td height="28" align="center" valign="top"><div align="left">
        <input name="secret" type="checkbox" id="secret2" value="1">
���Ļ�(ֻ��<strong>��¼</strong>��ſɿ����Լ������Լ��ظ�������)</div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="2" align="center"><input name="join" type="submit" class="input2" id="join3" value=" �� �� " >
��
  <%if rs11("muieditor")=2 then%>
  <input name="join" type="button" class="input2" id="join3" value=" Ԥ �� " onclick=guestpreview()>
��  <%end if%>
<input name="B12" type="reset" class="input2" id="B123"  value=" �� д "  >
(Ctrl+Enter�ύ)</td>
    </tr>
  </table>
  <table border=0 width=100% align=center>
    <tr> 
      <td width="100%" height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
    </tr>
    <tr> 
      <td align=center> 
        <!--#INCLUDE FILE="bottom.asp"-->
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
		<form name=preview action="GuestPreview.asp" method=post target=GuestPreview>
		<input type=hidden name=title value=><input type=hidden name=content value=>
		</form>
</body>
</html>
<%
set rs=nothing
%>