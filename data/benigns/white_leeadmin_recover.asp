<!DOCTYPE html>
<!-- 
'========================================================================================
' 文 件 名: admin_recover.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 系统恢复登陆页面 | 请小心修改为自己的风格
' 文件日期: 2018-01-23
' 设 计 者: 疾风之狼
'========================================================================================
' 郑州文达岭峰网络科技有限公司.
'========================================================================================
' Copyright (C) 2001-2018 岭峰网. All rights reserved.
' 网    站: http://www.lfmesss.com
' 电子邮件: support@lfmesss.com
' 联系ＱＱ: 85112407
'========================================================================================
-->
<%@ language="vbscript" codepage ="936" %>
<%flg="manok"%>
<!-- #include file="inc/sub_inc_recover.asp" -->
<!-- #include file="inc/recover.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<!-- #include file="inc/checkru.asp" -->
<!--#include file="inc/md5_32.asp"-->

<%
if Request("set")="ok" then

	adminname=trim(request("LingFengNet_MS_adminname"))
	adminpass=trim(request("LingFengNet_MS_adminpass"))
	if len(adminpass)<>32 then
		adminpass=LFW_md5_32_pass(adminpass)
	end if
	reg=Request("reg")
	
	if adminname="" or adminpass="" then
			response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
			response.write "alert('"& LingFengNet_MS_language_Warning_login_1 &"');" 
			response.write "history.go(-1);" 
			response.write "</script>" 
			response.end
	end if
	
	if Not IsNumeric(reg) Then
			response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
			response.write "alert('"& LingFengNet_MS_language_Warning_login_2 &"');" 
			response.write "history.go(-1);" 
			response.write "</script>" 
			response.end
	end if
	
	if CLng(reg)<>clng(session("LFW_Safecode")) then
			response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
			response.write "alert('"& LingFengNet_MS_language_Warning_login_2 &"');" 
			response.write "history.go(-1);" 
			response.write "</script>" 
			response.end
	end if
	
	if instr(LingFengNet_MS_adminname,adminname)=0 or instr(LingFengNet_MS_adminpass,adminpass)=0 then
			response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
			response.write "alert('"& LingFengNet_MS_language_Warning_login_2 &"');" 
			response.write "history.go(-1);" 
			response.write "</script>" 
			response.end
	end if
	
	if instr(LingFengNet_MS_adminname,"|")=0 or instr(LingFengNet_MS_adminpass,"|")=0 then
			if LingFengNet_MS_adminname=adminname and LingFengNet_MS_adminpass=adminpass then
				session("LingFengNet_MS_admin")="ok"
				session("LingFengNet_MS_admin_flg")=LingFengNet_MS_adminflg
				recoverok()
			end if	
	else	
	
			nameReturn = Split(LingFengNet_MS_adminname,"|")
			passReturn = Split(LingFengNet_MS_adminpass,"|")
			flgReturn = Split(LingFengNet_MS_adminflg,"|")

			For i = LBound(nameReturn) To UBound(nameReturn)
				if trim(nameReturn(i))=adminname and trim(passReturn(i))=adminpass then 
					session("LingFengNet_MS_admin")="ok"
					session("LingFengNet_MS_admin_flg")=flgReturn(i)
					exit for
				end if
			Next 
			recoverok()
	end if
end if
%>
<head>
<title><%= LingFengNet_MS_language_title_login %></title>
<%  
  call htmlmeta() 
%> 
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<script type="text/javascript" src="inc/md532.js"></script>
<script type="text/javascript">
function checklogin() {
	if (document.myform.LingFengNet_MS_adminname.value=="") {
		alert("<%= LingFengNet_MS_language_Warning_login_1 %>");
		myform.LingFengNet_MS_adminname.focus();
		return false;
	}
	if (document.myform.LingFengNet_MS_adminpass.value=="") {
		alert("<%= LingFengNet_MS_language_Warning_login_1 %>");
		myform.LingFengNet_MS_adminpass.focus();
		return false;
	}
	if (document.myform.reg.value=="") {
		alert("<%= LingFengNet_MS_language_Warning_login_1 %>");
		myform.reg.focus();
		return false;
	}
	document.getElementById("LingFengNet_MS_adminpass").value=md5(document.getElementById("LingFengNet_MS_adminpass").value);
	return true;
}

function newverifypic()
{
	var timenow = new Date().getTime();
	url="showcode_math.asp";
	id = url.indexOf('?');
	if(id >= 0  ){
		if(id == (url.length-1))
			url = url +"t="+ timenow;
		else 
			url = url +"&t="+ timenow;
	}else{
		url = url +"?t="+ timenow;
	}

	document.getElementById("verifypic").src=url;
}
	
</script>
</head>
<body onkeydown=EnableKey() >
<%
call htmltop()
call htmlbr()
%>
  <table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0" align="center">
  <form name="myform" method="post" action="admin_recover.asp" onSubmit="return checklogin()">
    <tr> 
      <td class="bgc2"> <table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr class="bgc"> 
            <td height=30 width=25% class="bgc"> <div align="left">&ensp;<%= LingFengNet_MS_language_messdef_login_name %></div></td>
            <td height="30" width="75%" class="bgc"> <div align="left"> 
                <input type="text" name="LingFengNet_MS_adminname" size="25" maxlength="25">
              </div></td>
          </tr>
          <tr class="bgc"> 
            <td height=9 width=25% class="bgc"> <div align="left">&ensp;<%= LingFengNet_MS_language_messdef_login_pass %></div></td>
            <td height="30" width="75%" class="bgc"> <div align="left"> 
                <input type="password" name="LingFengNet_MS_adminpass" size="25" maxlength="25">
              </div></td>
          </tr>
          <tr class="bgc"> 
            <td height=30 width=25% class="bgc">&ensp;<%= LingFengNet_MS_language_messdef_login_Att %></td>
            <td height="30" width="75%" class="bgc"> <input type="text" name="reg" size="8" maxlength="10" class="input"> 
              <%= LingFengNet_MS_language_messdef_login_left %>&ensp;
              <img id="verifypic" src="showcode_math.asp" border="1" align="absmiddle" onClick="newverifypic()">
              <%= LingFengNet_MS_language_messdef_login_right %><input name=set type=hidden id="set" value="ok"> </td>
          </tr>
          <tr class="bgc"> 
            <td height=30 colspan="2" class="bgc"> <div align="center"> 
                <input type="submit" name="Submit" value="<%= LingFengNet_MS_language_messdef_login_submit %>"  class="button">
                &ensp;&ensp; 
                <input type="reset" name="reset" value="<%= LingFengNet_MS_language_messdef_login_reset %>"  class="button">
              </div></td>
          </tr>
        </table></td>
    </tr>
	</form>
  </table>
<%
call htmlbr()
call htmlend()
%>
</body>
</html>
<%
Sub recoverok()
	On Error Resume Next
	dbpath=LingFengNet_MS_language_meta_mes_1 &"_setup_sys_1.asp"
	if IsObjInstalled("Scripting.FileSystemObject") then
		Set Fso=server.createobject("scripting.filesystemobject")
		Dbpath="config/" & dbpath 
		fso1=server.mappath(dbpath)
		fso2=server.mappath("config/"& LingFengNet_MS_language_meta_mes_1 &"_setup.asp")  
		fso.copyfile fso1,fso2,true
		set fso=nothing
		Response.Write "<script Language=Javascript>alert('"& LingFengNet_MS_language_Warning_mansuper_1 &"')</script><html><head><meta http-equiv='refresh' content='0;url=admin_mansys.asp'><META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"></head><body>"
	'	Response.Redirect "admin_mansys.asp"
		response.end
	else
		Response.Write "<script Language=Javascript>alert('"& LingFengNet_MS_language_Warning_mansuper_2 &""&dbpath&""& LingFengNet_MS_language_Warning_mansuper_3 &"');window.close();</script>"
		response.end
	end if
End Sub
%>