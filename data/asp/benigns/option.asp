<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<%if session("admin")<>1 then response.Redirect "default.asp"%>
<%
if request.Form("submit")="审核通过全部留言" then
	dsql="update reply set mark=1"
	conn.execute(dsql)
	dsql="update guest set mark=1"
	conn.execute(dsql)	
	%>
	<script>alert("已全部设置成已审核！")</script>
	<%
end if
if request.Form("submit")=" 提 交 " then
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
     response.Redirect "post_ok.asp?info=留言板设置成功！"
conn.close
set conn=nothing
end if
%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>功能选项</title>
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
    <td width="8%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">留言首页</a></td>
    <td width="89%" align=right>
      <!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<form action="" method="POST" name="form" id="form" >
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
    <tr class="tablebg<%=skin%>a">
      <td colspan="2">
        <p align="center"><strong>功能选项</strong></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>是否必须注册才能留言：<br>
        </strong>可设置留言时是否需要已注册
      </div></td>
      <td width="546" height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="register" type="radio" value="1" <%if rs11("register") then%>checked<%end if%>> 
      </font>是 <font color="#FFFFFF">
      <input type="radio" name="register" value="0" <%if not rs11("register") then%>checked<%end if%>>
      </font>否 </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>是否只有管理员或版主可以回复：<br>
      </strong>可设置游客或注册用户是否可回复主题      </div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="adminreply" type="radio" value="1" <%if rs11("adminreply") then%>checked<%end if%>>
</font>是 <font color="#FFFFFF">
<input type="radio" name="adminreply" value="0" <%if not rs11("adminreply") then%>checked<%end if%>>
</font>否<font color="#FFFFFF">      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>是否需要经过审核才能显示留言：<br>
        </strong>发表留言时是否需要管理员选择通过审核，未通过管理员审核的留言对游客及注册人员不显示</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="show" type="radio" value="1" <%if rs11("show") then%>checked<%end if%>>
</font>是 <font color="#FFFFFF">
<input type="radio" name="show" value="0" <%if not rs11("show") then%>checked<%end if%>>
</font>否<font color="#FFFFFF"> 
<input type="submit" class="input2" name="Submit" value="审核通过全部留言">
</font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>被过滤词语后自动禁止其留言：<br>
      </strong>发表的留言如涉及被过滤词语可自动禁止其留言，以防其再次发布      </div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="stopword" type="radio" value="1" <%if rs11("stopword") then%>checked<%end if%>>
</font>是 <font color="#FFFFFF">
<input type="radio" name="stopword" value="0" <%if not rs11("stopword") then%>checked<%end if%>>
</font>否<font color="#FFFFFF">      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>未注册用户是否允许查看留言内容：<br>
      </strong>未注册用户仅能查看留言标题，不能查看内容</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <input name="regshow" type="radio" value="1" <%if rs11("regshow") then%>checked<%end if%>>
        </font>是 <font color="#FFFFFF">
        <input type="radio" name="regshow" value="0" <%if not rs11("regshow") then%>checked<%end if%>>
      </font>否<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>是否允许用户上传头像：<br>
      </strong>打开此项允许用户上传自定义自己的显示头像</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <input name="faceupload" type="radio" value="1" <%if rs11("faceupload") then%>checked<%end if%>>
        </font>是 <font color="#FFFFFF">
        <input type="radio" name="faceupload" value="0" <%if not rs11("faceupload") then%>checked<%end if%>>
      </font>否<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><span style="font-weight: bold">是否显示用户邮件：</span><br>
      显示留言时在邮件一栏是否将用户的邮件显示</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="showmail" type="radio" value="1" <%if rs11("showmail") then%>checked<%end if%>>
      </font>是 <font color="#FFFFFF">
      <input type="radio" name="showmail" value="0" <%if not rs11("showmail") then%>checked<%end if%>>
      </font>否<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><span style="font-weight: bold">是否显示验证码：</span><br>
        登录是否显示验证码，以防止非法登录</div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
          <input name="showcode" type="radio" value="1" <%if rs11("showcode") then%>checked<%end if%>>
        </font>是 <font color="#FFFFFF">
        <input type="radio" name="showcode" value="0" <%if not rs11("showcode") then%>checked<%end if%>>
      </font>否<font color="#FFFFFF"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>默认显示方式：<br>
      </strong>访客进到留言板首页时显示的方式      </div></td>
      <td height="28" align="center"><div align="left"><font color="#FFFFFF">
        <input name="modal" type="radio" value="1" <%if rs11("modal")=1 then%>checked<%end if%>>
</font>讨论区 <font color="#FFFFFF">
<input type="radio" name="modal" value="2" <%if rs11("modal")=2 then%>checked<%end if%>>
</font>留言板<font color="#FFFFFF">      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>留言板默认配色方案：<br>
      </strong>访客进到留言板首页时显示的配色</div></td>
      <td height="28" align="center"><div align="left">
        <select name="skin1" id="skin1">
          <option value="1" selected>蓝天白云</option>
          <option value="2" <%if rs11("skin")=2 then response.write("selected")%>>水晶紫色</option>
		  <option value="3" <%if rs11("skin")=3 then response.write("selected")%>>秋意盎然</option>
		  <option value="4" <%if rs11("skin")=4 then response.write("selected")%>>绿野仙踪</option>
		  <option value="5" <%if rs11("skin")=5 then response.write("selected")%>>浓浓绿意</option>
		  <option value="6" <%if rs11("skin")=6 then response.write("selected")%>>橘子红了</option>
        </select>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>留言板方式查看时每页显示留言数：</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="row1" type="text" class="input1" id="row12" value="<%=rs11("row1")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>讨论区方式查看时每页显示留言数：</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="row2" type="text" class="input1" id="row2" value="<%=rs11("row2")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>留言间隔时间(防灌水)：<br>
      </strong>此项对管理员及版主留言时无效      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="second1" type="text" class="input1" id="second2" value="<%=rs11("second1")%>" size="30" >
      </font>秒<font color="#00FF00">&nbsp; </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><p align="left"><strong>留言时允许最多字数：<br>
      </strong>此项对留言内容的长度有限制（0为不限制）</p></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="lylength" type="text" class="input1" id="second2" value="<%=rs11("lylength")%>" size="30" >
      </font>个字<font color="#00FF00"> </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>自动过滤词语(用半角逗号,分隔)：<br>
      </strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="killword" type="text" class="input1" id="killword2" value="<%=rs11("killword")%>" size="30" maxlength="255" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>禁止指定IP留言(用半角逗号,分隔)：</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="killip" type="text" class="input1" id="killip" value="<%=rs11("killIP")%>" size="30" maxlength="255" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>留言板计数器值：</strong></div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="count" type="text" class="input1" id="count2" value="<%=rs11("count")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>背景图像路径：<br>
        </strong>在每页显示背景图像，此项可为空</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="background" type="text" class="input1" id="background2" value="<%=rs11("background")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>页面上方横幅图片路径：<br>
      </strong>每页上方的banner图片路径，此项可为空</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="bannerImg" type="text" class="input1" id="bannerImg2" value="<%=rs11("bannerImg")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>页面上方横幅图片链接：<br>
      </strong>每页上方的banner图片链接，此项可为空      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="bannerImgLink" type="text" class="input1" id="bannerImgLink2" value="<%=rs11("bannerImgLink")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>留言板显示标题：<br>
        </strong>留言板首页显示的标题</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="lytitle" type="text" class="input1" id="lytitle2" value="<%=rs11("lytitle")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>网站名称：<br>
        </strong>输入您网站的名称
      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="webname" type="text" class="input1" id="webname2" value="<%=rs11("webname")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td width="403" align="center"><div align="left"><strong>网站地址：<br>
        </strong>输入您网站的地址
      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="weblink" type="text" class="input1" id="weblink2" value="<%=rs11("weblink")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><strong>留言首页公告信息：<br>
      </strong>显示在留言版方式和讨论区方式顶部的公告信息，可为空</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="lygg" type="text" class="input1" id="weblink2" value="<%=rs11("lygg")%>" size="30" >
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left" style="font-weight: bold">编辑器使用方案：</div>
        <div align="left">多功能编辑器带文件上传等格式设置，UBB编辑器仅能编辑格式标签，不使用时仅能输入普通文字</div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        </font><font color="#FFFFFF">
      </font><font color="#FFFFFF">
      </font><font color="#FFFFFF"> 
      <select name="muieditor" id="muieditor">
        <option value="1" <%if rs11("muieditor")=1 then response.write("selected")%>>多功能文本编辑器</option>
        <option value="2" <%if rs11("muieditor")=2 then response.write("selected")%>>UBB标签编辑器</option>
        <option value="0" <%if rs11("muieditor")=0 then response.write("selected")%>>不使用编辑器</option>
      </select>
      </font><font color="#00FF00">        </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left">
        <div align="left" style="font-weight: bold">上传文件大小限制：</div>
        <div align="left">超过此大小的文件将不予接受 </div>
      </div></td>
      <td height="28" align="center"><div align="left">
        <input name="uploadsize" type="text" class="input1" id="weblink2" value="<%=rs11("uploadsize")%>" size="30">
K      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left">
        <div align="left" style="font-weight: bold">允许上传的文件类型：</div>
        <div align="left">请使用|分隔，仅能上传指定类型的文件</div>
      </div></td>
      <td height="28" align="center"><div align="left"><font color="#00FF00">
        <input name="uploadtype" type="text" class="input1" id="weblink2" value="<%=rs11("uploadtype")%>" size="30">
      </font></div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td align="center"><div align="left"><span style="font-weight: bold">审核状态时无需审核的用户<strong>(用半角逗号,分隔)</strong>：</span><br>
如果留言需审核才能显示，此处设置无须审核的用户，可以直接显示</div></td>
      <td height="28" align="center"><div align="left">
        <textarea name="passuser" cols="30" rows="5" id="passuser"><%=rs11("passuser")%></textarea>
      </div></td>
    </tr>
    <tr class="tablebg<%=skin%>d">
      <td height="28" colspan="2" align="center"><input name="Submit" type="submit" class="input2" id="join3" value=" 提 交 " >
　
  <input name="B12" type="reset" class="input2" id="B123"  value=" 重 写 "  >
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
