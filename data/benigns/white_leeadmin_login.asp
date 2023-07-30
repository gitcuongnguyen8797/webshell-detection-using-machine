
<%
'主要是使随机出现的作品数字随机
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理员登陆</title>
<link href="images/style_left.css" type=text/css rel=stylesheet>
<SCRIPT type=text/javascript>
    <!--
    if(self!=top){top.location=self.location;} 
    function ShowSoftKeyboard(obj)
    {
        if((typeof(CheckLoaded) == "function"))
        {
            password1 = obj;
            showkeyboard();
            Calc.password.value = '';
        }
        else
        {
            return false;
        }
    }
    // -->
    </SCRIPT>

<SCRIPT src="images/softkeyboard.js" type=text/javascript></SCRIPT>
</head>
<BODY id=loginbody>
<form name="AdminLogin" method="post" action="Admin_Cklogin.asp">
<DIV id=adminboxall>
<DIV class=adminboxtop></DIV>
<DIV id=adminboxmain>
<div style=" margin-left:380px;">
<INPUT id=IbtnEnter style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 76px; HEIGHT: 26px; BORDER-RIGHT-WIDTH: 0px" type=image src="images/admin_menu.gif" name=IbtnEnter> 
</div>
</DIV>
<DIV class=adminboxbottom>
<DIV id=login>
<UL>
  <LI class=text>用户名：<BR>
  <DIV class=box1><input class=smallInput name="LoginName" type="text" id="LoginName" Style="width:80px;"></DIV></LI>
  <LI class=text>密 码：<BR>
  <DIV class=box2><input class=smallInput name="LoginPassword" type="password" id="LoginPassword" Style="width:80px;"></DIV></LI>
  <LI class=text>认证码：<BR>
  <DIV class=box3><input class=smallInput name="Renzhen" type="text" id="code" size="Renzhen" Style="width:50px;"/></DIV></LI>
  <LI class=text>验证码：<BR>
  <DIV class=box4>
   <input class=smallInput name="code" type="text" id="code" size="8" maxlength="5"/>&nbsp;<img src="../Include/code.asp" border="0" alt="看不清楚请点击刷新验证码" onClick="this.src='../Include/code.asp'"/> 
  </DIV></LI>
  </UL>
  </DIV>
  </DIV>
</FORM>
</BODY>
</html>