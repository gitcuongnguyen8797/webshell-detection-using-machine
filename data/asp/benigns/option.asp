<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<%if session("admin")<>1 then response.Redirect "default.asp"%>
<%
if request.Form("submit")="���ͨ��ȫ������" then
	dsql="update reply set mark=1"
	conn.execute(dsql)
	dsql="update guest set mark=1"
	conn.execute(dsql)	
	%>
	<script>alert("��ȫ�����ó�����ˣ�")</script>
	<%
end if
if request.Form("submit")=" �� �� " then
register=request.Form("register")
adminreply=request.Form("adminreply")
show=request.Form("show")
modal=request.Form("modal")
row1=request.Form("row1")
row2=request.Form("row2")
second1=request.Form("second1")
count1=request.Form("count")
killword=request.Form("killword")
stopword=request.Form("stopword")
killIP=request.Form("killIP")
background=request.Form("background")
bannerImg=request.Form("bannerImg")
bannerImgLink=request.Form("bannerImgLink")
lytitle=request.Form("lytitle")
webname=request.Form("webname")
weblink=request.Form("weblink")
muieditor=request.Form("muieditor")
regshow=request.Form("regshow")
lylength=request.Form("lylength")
lygg=request.Form("lygg")
skin=request.Form("skin1")
showmail=request.Form("showmail")
faceupload=request.Form("faceupload")
showcode=request.Form("showcode")
passuser=request.Form("passuser")
uploadsize=request.Form("uploadsize")
uploadtype=request.Form("uploadtype")
if killip="" then killip=","
if passuser="" then passuser=","
if right(passuser,1)<>"," then passuser=passuser&","
if left(passuser,1)<>"," then passuser=","&passuser
if background="" then background=" "
if bannerImg="" then bannerImg=" "
if bannerImgLink="" then bannerImgLink=" "
if lytitle="" then lytitle=" "
if webname="" then webname=" "
if weblink="" then weblink=" "
if lygg="" then lygg=" "
		rs11("register")=register
		rs11("adminreply")=adminreply
		rs11("show")=show
		rs11("modal")=modal
	    rs11("row1")=row1
		rs11("row2")=row2
		rs11("second1")=second1
		rs11("count")=count1
		rs11("killword")=killword
		rs11("stopword")=stopword
		rs11("killIP")=killIP
		rs11("background")=background
		rs11("bannerImg")=bannerImg
		rs11("bannerImgLink")=bannerImgLink
		rs11("lytitle")=lytitle
		rs11("webname")=webname
		rs11("weblink")=weblink	
		rs11("muieditor")=muieditor
		rs11("regshow")=regshow	
		rs11("lylength")=lylength
		rs11("lygg")=lygg
		rs11("skin")=skin
		rs11("showmail")=showmail
		rs11("faceupload")=faceupload
		rs11("showcode")=showcode
		rs11("passuser")=passuser
		rs11("uploadsize")=uploadsize
		rs11("uploadtype")=uploadtype
    	rs11.update
     response.Redirect "post_ok.asp?info=���԰����óɹ���"
conn.close
set conn=nothing
end if
%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ѡ��</title>
<link href="1.css" rel="stylesheet" type="text/css">
</head>

<body>
<table border=0 width=100% align=center>
  <tr> 
    <td align=center> 
      <!--#INCLUDE FILE="top.asp"-->
  </tr>
  <tr> 
    <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table>
<table border=0 width=100% align=center>
  <tr>
    <td width="3%" align=left><font color="#FF0000">&nbsp;<img src="images/home.gif" border=0></font></td>
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">������ҳ</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form action="" method="POST" name="form" id="form" >
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
    <tr class="tablebg<%=skin%>a">
      <td colspan="2">
        <p align="center"><strong>����ѡ��</strong></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>�Ƿ����ע��������ԣ�<br>
        </strong>����������ʱ�Ƿ���Ҫ��ע��
      </div></td>
      <td width="546" height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="register" type="radio" value="1" <%if rs11("register") then%>checked<%end if%>> 
      </font>�� <font color="#FFFFFF">
      <input type="radio" name="register" value="0" <%if not rs11("register") then%>checked<%end if%>>
      </font>�� </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>�Ƿ�ֻ�й���Ա��������Իظ���<br>
      </strong>�������οͻ�ע���û��Ƿ�ɻظ�����      </div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="adminreply" type="radio" value="1" <%if rs11("adminreply") then%>checked<%end if%>>
</font>�� <font color="#FFFFFF">
<input type="radio" name="adminreply" value="0" <%if not rs11("adminreply") then%>checked<%end if%>>
</font>��<font color="#FFFFFF">      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>�Ƿ���Ҫ������˲�����ʾ���ԣ�<br>
        </strong>��������ʱ�Ƿ���Ҫ����Աѡ��ͨ����ˣ�δͨ������Ա��˵����Զ��οͼ�ע����Ա����ʾ</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="show" type="radio" value="1" <%if rs11("show") then%>checked<%end if%>>
</font>�� <font color="#FFFFFF">
<input type="radio" name="show" value="0" <%if not rs11("show") then%>checked<%end if%>>
</font>��<font color="#FFFFFF"> 
<input type="submit" class="input2" name="Submit" value="���ͨ��ȫ������">
</font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>�����˴�����Զ���ֹ�����ԣ�<br>
      </strong>������������漰�����˴�����Զ���ֹ�����ԣ��Է����ٴη���      </div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="stopword" type="radio" value="1" <%if rs11("stopword") then%>checked<%end if%>>
</font>�� <font color="#FFFFFF">
<input type="radio" name="stopword" value="0" <%if not rs11("stopword") then%>checked<%end if%>>
</font>��<font color="#FFFFFF">      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>δע���û��Ƿ�����鿴�������ݣ�<br>
      </strong>δע���û����ܲ鿴���Ա��⣬���ܲ鿴����</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <input name="regshow" type="radio" value="1" <%if rs11("regshow") then%>checked<%end if%>>
        </font>�� <font color="#FFFFFF">
        <input type="radio" name="regshow" value="0" <%if not rs11("regshow") then%>checked<%end if%>>
      </font>��<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>�Ƿ������û��ϴ�ͷ��<br>
      </strong>�򿪴��������û��ϴ��Զ����Լ�����ʾͷ��</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <input name="faceupload" type="radio" value="1" <%if rs11("faceupload") then%>checked<%end if%>>
        </font>�� <font color="#FFFFFF">
        <input type="radio" name="faceupload" value="0" <%if not rs11("faceupload") then%>checked<%end if%>>
      </font>��<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><span style="font-weight: bold">�Ƿ���ʾ�û��ʼ���</span><br>
      ��ʾ����ʱ���ʼ�һ���Ƿ��û����ʼ���ʾ</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="showmail" type="radio" value="1" <%if rs11("showmail") then%>checked<%end if%>>
      </font>�� <font color="#FFFFFF">
      <input type="radio" name="showmail" value="0" <%if not rs11("showmail") then%>checked<%end if%>>
      </font>��<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><span style="font-weight: bold">�Ƿ���ʾ��֤�룺</span><br>
        ��¼�Ƿ���ʾ��֤�룬�Է�ֹ�Ƿ���¼</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <input name="showcode" type="radio" value="1" <%if rs11("showcode") then%>checked<%end if%>>
        </font>�� <font color="#FFFFFF">
        <input type="radio" name="showcode" value="0" <%if not rs11("showcode") then%>checked<%end if%>>
      </font>��<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>Ĭ����ʾ��ʽ��<br>
      </strong>�ÿͽ������԰���ҳʱ��ʾ�ķ�ʽ      </div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="modal" type="radio" value="1" <%if rs11("modal")=1 then%>checked<%end if%>>
</font>������ <font color="#FFFFFF">
<input type="radio" name="modal" value="2" <%if rs11("modal")=2 then%>checked<%end if%>>
</font>���԰�<font color="#FFFFFF">      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>���԰�Ĭ����ɫ������<br>
      </strong>�ÿͽ������԰���ҳʱ��ʾ����ɫ</div></td>
      <td height="28" align="center"><div align="left">
        <select name="skin1" id="skin1">
          <option value="1" selected>�������</option>
          <option value="2" <%if rs11("skin")=2 then response.write("selected")%>>ˮ����ɫ</option>
		  <option value="3" <%if rs11("skin")=3 then response.write("selected")%>>���ⰻȻ</option>
		  <option value="4" <%if rs11("skin")=4 then response.write("selected")%>>��Ұ����</option>
		  <option value="5" <%if rs11("skin")=5 then response.write("selected")%>>ŨŨ����</option>
		  <option value="6" <%if rs11("skin")=6 then response.write("selected")%>>���Ӻ���</option>
        </select>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>���԰巽ʽ�鿴ʱÿҳ��ʾ��������</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="row1" type="text" class="input1" id="row12" value="<%=rs11("row1")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>��������ʽ�鿴ʱÿҳ��ʾ��������</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="row2" type="text" class="input1" id="row2" value="<%=rs11("row2")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>���Լ��ʱ��(����ˮ)��<br>
      </strong>����Թ���Ա����������ʱ��Ч      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="second1" type="text" class="input1" id="second2" value="<%=rs11("second1")%>" size="30" >
      </font>��<font color="#00FF00">&nbsp; </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><p align="left"><strong>����ʱ�������������<br>
      </strong>������������ݵĳ��������ƣ�0Ϊ�����ƣ�</p></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="lylength" type="text" class="input1" id="second2" value="<%=rs11("lylength")%>" size="30" >
      </font>����<font color="#00FF00"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>�Զ����˴���(�ð�Ƕ���,�ָ�)��<br>
      </strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="killword" type="text" class="input1" id="killword2" value="<%=rs11("killword")%>" size="30" maxlength="255" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>��ָֹ��IP����(�ð�Ƕ���,�ָ�)��</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="killip" type="text" class="input1" id="killip" value="<%=rs11("killIP")%>" size="30" maxlength="255" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>���԰������ֵ��</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="count" type="text" class="input1" id="count2" value="<%=rs11("count")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>����ͼ��·����<br>
        </strong>��ÿҳ��ʾ����ͼ�񣬴����Ϊ��</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="background" type="text" class="input1" id="background2" value="<%=rs11("background")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>ҳ���Ϸ����ͼƬ·����<br>
      </strong>ÿҳ�Ϸ���bannerͼƬ·���������Ϊ��</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="bannerImg" type="text" class="input1" id="bannerImg2" value="<%=rs11("bannerImg")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>ҳ���Ϸ����ͼƬ���ӣ�<br>
      </strong>ÿҳ�Ϸ���bannerͼƬ���ӣ������Ϊ��      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="bannerImgLink" type="text" class="input1" id="bannerImgLink2" value="<%=rs11("bannerImgLink")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>���԰���ʾ���⣺<br>
        </strong>���԰���ҳ��ʾ�ı���</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="lytitle" type="text" class="input1" id="lytitle2" value="<%=rs11("lytitle")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>��վ���ƣ�<br>
        </strong>��������վ������
      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="webname" type="text" class="input1" id="webname2" value="<%=rs11("webname")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>��վ��ַ��<br>
        </strong>��������վ�ĵ�ַ
      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="weblink" type="text" class="input1" id="weblink2" value="<%=rs11("weblink")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>������ҳ������Ϣ��<br>
      </strong>��ʾ�����԰淽ʽ����������ʽ�����Ĺ�����Ϣ����Ϊ��</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="lygg" type="text" class="input1" id="weblink2" value="<%=rs11("lygg")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left" style="font-weight: bold">�༭��ʹ�÷�����</div>
        <div align="left">�๦�ܱ༭�����ļ��ϴ��ȸ�ʽ���ã�UBB�༭�����ܱ༭��ʽ��ǩ����ʹ��ʱ����������ͨ����</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        </font><font color="#FFFFFF">
      </font><font color="#FFFFFF">
      </font><font color="#FFFFFF"> 
      <select name="muieditor" id="muieditor">
        <option value="1" <%if rs11("muieditor")=1 then response.write("selected")%>>�๦���ı��༭��</option>
        <option value="2" <%if rs11("muieditor")=2 then response.write("selected")%>>UBB��ǩ�༭��</option>
        <option value="0" <%if rs11("muieditor")=0 then response.write("selected")%>>��ʹ�ñ༭��</option>
      </select>
      </font><font color="#00FF00">        </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left">
        <div align="left" style="font-weight: bold">�ϴ��ļ���С���ƣ�</div>
        <div align="left">�����˴�С���ļ���������� </div>
      </div></td>
      <td height="28" align="center"><div align="left">
        <input name="uploadsize" type="text" class="input1" id="weblink2" value="<%=rs11("uploadsize")%>" size="30">
K      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left">
        <div align="left" style="font-weight: bold">�����ϴ����ļ����ͣ�</div>
        <div align="left">��ʹ��|�ָ��������ϴ�ָ�����͵��ļ�</div>
      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="uploadtype" type="text" class="input1" id="weblink2" value="<%=rs11("uploadtype")%>" size="30">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><span style="font-weight: bold">���״̬ʱ������˵��û�<strong>(�ð�Ƕ���,�ָ�)</strong>��</span><br>
�����������˲�����ʾ���˴�����������˵��û�������ֱ����ʾ</div></td>
      <td height="28" align="center"><div align="left">
        <textarea name="passuser" cols="30" rows="5" id="passuser"><%=rs11("passuser")%></textarea>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="2" align="center"><input name="Submit" type="submit" class="input2" id="join3" value=" �� �� " >
��
  <input name="B12" type="reset" class="input2" id="B123"  value=" �� д "  >
</td>
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
</form>
</body>
</html>
