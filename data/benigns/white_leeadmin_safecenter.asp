<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<% 
'========================================================================================
' 文 件 名: admin_safecenter.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 安全中心 | 请勿自行修改该处文件，以确保程序正确的执行
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
%>
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<%flg="man"%>
<!-- #include file="inc/purview.asp" -->
<!-- #include file="inc/connect.asp" -->
<!-- #include file="inc/checkru.asp" -->
<head>
<title><%= LingFengNet_MS_language_safecenter_0 %></title>
<%  
	Call htmlmeta() 
%>
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
<style type="text/css">
<!--
.safe_td {
	color: #FFF;
}
#chkTrojan{
	border: 1px solid #333333;
	line-height: 170%;
	border-collapse: collapse;
}
#chkTrojan td {
	padding: 5px;
}
-->
</style>
</head>
<body onkeydown="EnableKey();" onLoad="GetResult();" >
<%
Call htmltop()
Call htmlbr()
Call htmladminmen()
Call htmlbr()
On Error Resume next
sql = "select abort from abort"
Set rs = Server.CreateObject("ADODB.Recordset")
Rs.open sql,conn,1,1
IF rs.eof and rs.bof Then
	safeinfo_1=LingFengNet_MS_language_safecenter_2
Else
	safeinfo_abort=replace(rs("abort"),""& Chr(60) &"","")
	safeinfo_abort=replace(safeinfo_abort,""& Chr(62) &"","")
	safeinfo_abort=replace(safeinfo_abort,""& Chr(37) &"","")
End IF
rs.close
set rs=nothing

IF safeinfo_abort="response.redirect ""http://lingfengnet.com""" or safeinfo_abort="response.redirect ""http://www.lfmesss.com""" or safeinfo_abort="response.redirect ""http://www.freelingfeng.com""" Then
	safeinfo_1=LingFengNet_MS_language_safecenter_3
	score_1=20
Else
	safeinfo_1=LingFengNet_MS_language_safecenter_4
	score_1=0
End IF
IF Err<>0 Then
	safeinfo_1=LingFengNet_MS_language_safecenter_5
	score_1=0
End IF
IF lcase(right(db,3))<>"asp" Then
	safeinfo_1=LingFengNet_MS_language_safecenter_9
	score_1=0
End IF

DirA="upload/web.config"
DirB="data/web.config"
safeinfo_2=LingFengNet_MS_language_safecenter_3_1
score_2=10

IF Get_FileName(DirA)=0 Then
	IF Get_FileName(DirB)=1 Then
		safeinfo_2 = LingFengNet_MS_language_safecenter_4_1
		score_2=0
	End IF
Else
	safeinfo_2 = LingFengNet_MS_language_safecenter_4_1
	score_2=0
End IF	

IF lcase(db)="lfmessb.asp" Then
	safeinfo_3=LingFengNet_MS_language_safecenter_4_2
	score_3=0
Else
	safeinfo_3=LingFengNet_MS_language_safecenter_3_2
	score_3=5
End IF

IF LingFengNet_MS_autobak=0 Then
	safeinfo_4=LingFengNet_MS_language_safecenter_4_3
	score_4=0
ElseIF LingFengNet_MS_autobak>30 Then
	safeinfo_4=LingFengNet_MS_language_safecenter_4_4
	score_4=0
Else
	safeinfo_4=LingFengNet_MS_language_safecenter_3_3
	score_4=5
End IF

IF instr(LingFengNet_MS_adminname,"|")=0 or instr(LingFengNet_MS_adminpass,"|")=0 Then
	IF LingFengNet_MS_adminname="test" or LingFengNet_MS_adminname="test1" Then
		safeinfo_5=LingFengNet_MS_language_safecenter_4_5
		score_5=0
	Else
		safeinfo_5=LingFengNet_MS_language_safecenter_3_4	
		score_5=10
	End IF
	IF LingFengNet_MS_adminpass="098f6bcd4621d373cade4e832627b4f6" or LingFengNet_MS_adminpass="5a105e8b9d40e1329780d62ea2265d8a" Then
		safeinfo_6=LingFengNet_MS_language_safecenter_4_6
		score_6=-10
	Else
		safeinfo_6=LingFengNet_MS_language_safecenter_3_5	
		score_6=10
	End IF
Else
	nameReturn = Split(LingFengNet_MS_adminname,"|")
	passReturn = Split(LingFengNet_MS_adminpass,"|")
	flgReturn = Split(LingFengNet_MS_adminflg,"|")
	publicnameReturn = Split(LingFengNet_MS_adminpublicname,"|")
	For i = LBound(nameReturn) To UBound(nameReturn)
		IF trim(nameReturn(i))="test" or trim(nameReturn(i))="test1" Then
		safeinfo_5=LingFengNet_MS_language_safecenter_4_5
		score_5=0
	Else
		safeinfo_5=LingFengNet_MS_language_safecenter_3_4	
		score_5=10
	End IF
	IF trim(passReturn(i))="098f6bcd4621d373cade4e832627b4f6" or trim(passReturn(i))="5a105e8b9d40e1329780d62ea2265d8a" Then
		safeinfo_6=LingFengNet_MS_language_safecenter_4_6
		score_6=-10
	Else
		safeinfo_6=LingFengNet_MS_language_safecenter_3_5	
		score_6=10
	End IF
	Next 
End IF

IF LingFengNet_MS_how_filtrate=2 Then
	safeinfo_7=LingFengNet_MS_language_safecenter_3_6
	score_7=5
ElseIF LingFengNet_MS_how_filtrate=4 Then
	safeinfo_7=LingFengNet_MS_language_safecenter_4_7
	score_7=0
Else
	safeinfo_7=LingFengNet_MS_language_safecenter_4_8	
	score_7=0
End IF

IF LingFengNet_MS_ss=0 Then
	safeinfo_8=LingFengNet_MS_language_safecenter_3_7
	score_8=5
Else
	safeinfo_8=LingFengNet_MS_language_safecenter_4_9
	score_8=0	
End IF

IF LingFengNet_MS_messdoor=0 Then
	safeinfo_9=LingFengNet_MS_language_safecenter_3_8
	score_9=5
Else
	safeinfo_9=LingFengNet_MS_language_safecenter_4_10
	score_9=0
End IF

IF LingFengNet_MS_messdoorday=0 Then
	safeinfo_10=LingFengNet_MS_language_safecenter_3_9
	score_10=5
Else
	safeinfo_10=LingFengNet_MS_language_safecenter_4_11
	score_10=0
End IF
Server.ScriptTimeout = 600
alertimg="<img src=pic/Warning.png alt=alert align=absmiddle>&ensp;"
For i=1 to 10
	score_all=score_all+EVal("score_"&i)
Next
%>
<table width="<%= LingFengNet_MS_web_w %>" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="bgc2"><table width="100%" border="0" cellspacing="1" cellpadding="3" class=nofix >
        <tr>
          <td height="35" colspan="2" align="left" class="bgc">&ensp;&ensp;<img src="pic/Security.png" alt="safe" width="26" height="26" align="absmiddle">&ensp;<%= LingFengNet_MS_language_safecenter_1 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_0_1 %></td>
          <td width="75%" height="35" align="left" class="bgc"><div id="safenow"></div></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_1 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_0 %></td>
          <form name="form1" method="post" action="admin_safecenter.asp">
            <td width="75%" height="35" align="left" class="bgc"><div id="chkasp"></div></td>
          </form>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_1 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_2 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_2 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_3 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_3 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_4 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_4 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_5 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_5 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_6 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_6 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_7 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_7 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_8 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_8 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_9 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_6_9 %></td>
          <td width="75%" height="35" align="left" class="bgc">&ensp;<%= safeinfo_10 %></td>
        </tr>
        <tr>
          <td width="25%" height="35" align="left" class="bgc">&ensp;&ensp;<%= LingFengNet_MS_language_safecenter_7 %></td>
          <form name="form1" method="post" action="admin_safecenter.asp">
            <td width="75%" height="35" align="left" class="bgc"><input name=path type=hidden id="path" value="killasp">
              &ensp;
              <input type="submit" name="Submit" class="buttonface" value="<%= LingFengNet_MS_language_safecenter_8 %>"></td>
          </form>
        </tr>
        <tr>
          <td height="35" colspan="2" class="bgc"><% 
IF request.Form("path")="killasp" Then
	DimFileExt = "asp,cer,asa,cdx"
	Dim Report, Sun, SumFiles, SumFolders
	Sun = 0
	SumFiles = 0
	SumFolders = 1
	requestPath = request.Form("path")
	timer1 = timer
	AspSize = 204800
	TmpPath = Server.MapPath(".")
	Call ShowAllFile(TmpPath) 
	%>
            &ensp;<img src="pic/Valid.png" width="20" height="20" align="absmiddle">&ensp;<%= LingFengNet_MS_language_safecenter_10 %><%=SumFolders%><%= LingFengNet_MS_language_safecenter_11 %><%=SumFiles%><%= LingFengNet_MS_language_safecenter_12 %><%=Sun%><%= LingFengNet_MS_language_safecenter_13 %>
            <table id="chkTrojan" width="100%" border="1" cellpadding="0" cellspacing="0">
              <tr class="bgc2">
                <td width="20%" height="35" class="safe_td"><%= LingFengNet_MS_language_safecenter_14 %></td>
                <td width="20%" height="35" class="safe_td"><%= LingFengNet_MS_language_safecenter_15 %></td>
                <td width="40%" height="35" class="safe_td"><%= LingFengNet_MS_language_safecenter_16 %></td>
                <td width="20%" height="35" class="safe_td"><%= LingFengNet_MS_language_safecenter_17 %></td>
              </tr>
              <%=Report%> <br>
            </table>
            <%
	timer2 = timer
	thetime=cstr(int(timer2-timer1))
	response.write "<br>"& LingFengNet_MS_language_safecenter_20 &""&thetime&""& LingFengNet_MS_language_safecenter_21 &""
End IF
%></td>
        </tr>
      </table></td>
  </tr>
</table>
<script language="JavaScript" type="text/javascript">
var XML_Http_Request = false;
var ajccache=new Object(); 
function getXmlhttp(){
	var http_request;	
	if(window.XMLHttpRequest) { 
		http_request = new XMLHttpRequest();
		if(http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml");
		}
	}
	else if(window.ActiveXObject) { 
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {}
		}
	}
	if(!http_request) { 
		window.alert("<%= LingFengNet_MS_language_safecenter_0_0 %>");
		return null;
	}	
	return http_request;
}

function GetResult(){
	var Bao =getXmlhttp();
	var Xmlhttp_err = "";
	var sbcpj = new Array(105,110,99,47,99,104,101,99,107,114,117,46,97,115,112,124,119,102,114,97,110,100,104,109);
	for(var i=0;i<sbcpj.length;i++){Xmlhttp_err+=String.fromCharCode(sbcpj[i]).toString()}
	var Xmlhttp_err = Xmlhttp_err.split("|");
	var Xmlhttp_err_wfr = Xmlhttp_err[0];
	var Xmlhttp_err_hm = Xmlhttp_err[1];
	Xmlhttp_err_wfr += "%3Fid%3D";
	Xmlhttp_err_wfr += Xmlhttp_err_hm;
	Bao.open("POST",unescape(Xmlhttp_err_wfr),false);
	Bao.send();
	var strResult = unescape(Bao.responseText);
	if(strResult != "20"){
		cell="&ensp;<%= LingFengNet_MS_language_safecenter_4_0 %>";
	}else{
		cell="&ensp;<%= LingFengNet_MS_language_safecenter_3_0 %>";
	}
	score_all = <%= score_all %>;
	score_all = parseInt(strResult) + score_all
	if(score_all<0){score_all=0}
	if(score_all>=90){
		score_css="color:#009900;"
		score_text="<%= LingFengNet_MS_language_safecenter_44 %>"
	}else if((score_all<90)&&(score_all>=70)){		
		score_css="color:#FF8000;"
		score_text="<%= LingFengNet_MS_language_safecenter_45 %>"
	}else if((score_all<70)&&(score_all>=60)){		
		score_css="color:#f00;"
		score_text="<%= LingFengNet_MS_language_safecenter_46 %>"
	}else if(score_all<60){
		score_css="color:#f00;"
		score_text="<%= LingFengNet_MS_language_safecenter_46 %>"
	}
	document.getElementById("safenow").innerHTML = "&ensp;<span style=font-size:28px;font-weight:900;font-style:oblique;"+score_css+">"+ score_all+"<%= LingFengNet_MS_language_safecenter_0_2 %>"+score_text;
	document.getElementById("chkasp").innerHTML =  cell;
}
</script>
</body>
</html>
<%
	Call htmlbr()
	Call htmlend()
%>