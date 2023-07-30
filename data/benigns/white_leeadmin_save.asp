<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: admin_save.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 留言存储文件 | 请勿自行修改该处文件，以确保程序正确的执行
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
<!-- #include file="inc/contencrypt.asp" -->
<%flg="save"%>
<!-- #include file="inc/purview_default.asp" -->
<!-- #include file="inc/connect.asp" -->
<!-- #include file="inc/checkru.asp" -->
<%
ip=Request.ServerVariables("REMOTE_HOST")

IF LingFengNet_MS_add_news_3=1 Then
	Response.Write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script Language=Javascript>alert('"& LingFengNet_MS_language_save_mes_51 &"');window.close();</script>"
	Response.End
End IF

IF Application("LingFengNet_MS_save_Load")+1>10 Then
	Response.Write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script Language=Javascript>alert('"& LingFengNet_MS_language_save_mes_43 &"');history.go(-1);</script>"
	Response.End
End IF

saveok=Trim(Request.Form("saveok"))

IF session("saveok")<>"" and saveok=session("saveok")  Then
	Response.Redirect ("addnew.asp")
	Response.End
End IF


IF LingFengNet_MS_messdoor=0 and Request.cookies("LingFengNet_MS_messdoortime")<>"" Then
	IF DateDiff("n",Request.cookies("LingFengNet_MS_messdoortime"),now())<LingFengNet_MS_messdoortimes Then
		Response.Write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script Language=Javascript>alert('"& LingFengNet_MS_language_save_mes_1 &""&LingFengNet_MS_messdoortimes&""& LingFengNet_MS_language_save_mes_2 &"');history.go(-1);</script>"
	    Response.End
	End IF
End IF

IF LingFengNet_MS_messdoorday=0 and Request.cookies("LingFengNet_MS_messdoorday_times")<>"" Then
	IF int(Request.cookies("LingFengNet_MS_messdoorday_times"))>LingFengNet_MS_messdoorday_times Then
		Response.Write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script Language=Javascript>alert('"& LingFengNet_MS_language_save_mes_3 &""&LingFengNet_MS_messdoorday_times&""& LingFengNet_MS_language_save_mes_4 &"，"& Request.cookies("LingFengNet_MS_messdoorday_times") &""& LingFengNet_MS_language_save_mes_5 &"');history.go(-1);</script>"
		Response.End
	End IF
End IF

username=LingFengNet_MS_data_stream_new(left(trim(request.form("username")),16))
post=LingFengNet_MS_data_stream_new(left(trim(request.form("post")),30))
tel=LingFengNet_MS_data_stream_new(trim(request.form("tel")))
IF LingFengNet_MS_mymail<>0 Then
	email="no"
Else
	email=LingFengNet_MS_data_stream_new(trim(request.form("email")))
	email = Replace(email,"＠","@")
End IF
IF LingFengNet_MS_myqq<>0 Then
	mes_s="no"
Else
	mes_s=LingFengNet_MS_data_stream_new(request.form("mes_s"))
End IF
ys2=LingFengNet_MS_data_stream_new(request.form("ys"))
lylx=LingFengNet_MS_data_stream_new(request.form("lylx"))
reg=LingFengNet_MS_data_stream_new(trim(request.form("reg")))
reg1=LingFengNet_MS_data_stream_new(request.form("reg1"))
mess=LingFengNet_MS_data_stream_new(trim(request.form("mess")))
face=LingFengNet_MS_data_stream_new(trim(request.form("face")))
content=LingFengNet_MS_data_stream_new(left(trim(request.form("contenttex")),LingFengNet_MS_maxword))
'content=replace(content,""& Chr(13) &"","<br>")
'content=replace(content,""& Chr(10) &"","<br>")

IF username="" Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_6 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF LingFengNet_MS_messchina=0 Then
	IF RegExp_LFW_vbs("%u30([A-F]|[0-9])",escape(username)) Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_8_2 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF	
	IF RegExp_LFW_vbs("&#([0-9]*)&#59;",escape(username)) Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_8_3 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF
	IF RegExp_LFW_vbs("[^\u4E00-\u9FA5]",username) Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_6 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF
	IF RegExp_LFW_vbs("^.{2,4}$",username)=false Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_8 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF
	
	IF RegExp_LFW_vbs("^\d.*$",username) Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_8_1 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF		
elseIF LingFengNet_MS_messchina=1 Then
	IF RegExp_LFW_vbs("^([a-z]|[A-Z])[\w.]{0,16}$",username)=false Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_7 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF
	IF RegExp_LFW_vbs("^.{3,16}$",username)=false Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_8 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF
elseIF LingFengNet_MS_messchina=2 Then
	IF RegExp_LFW_vbs("^.{2,16}$",username)=false Then 
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_8 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
	End IF	
End IF

IF InStr(username,"|")<>0 Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_9 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF post="" Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_11 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF InStr(post,"|")<>0 Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_12 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF RegExp_LFW_vbs("^[0-9]{7,13}$",tel)=false and tel<>"" Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_14 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF mes_s<>"no" and mes_s="qq" and  not IsNumeric(mess)  Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_16 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF email<>"" and (ChkMail(email)=false and email<>"no") Then
	    response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_17 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF content=""  Then
	    response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_18 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF not IsNumeric(reg) and LingFengNet_MS_messreg<>0 Then
	    response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	    response.write "alert('"& LingFengNet_MS_language_save_mes_19 &"');" 
	    response.write "history.go(-1);" 
	    response.write "</script>" 
	    response.end
End IF

IF LingFengNet_MS_messreg=1 Then
	IF clng(reg)<>clng(reg1) Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
		response.write "alert('"& LingFengNet_MS_language_save_mes_19 &"');" 
		response.write "history.go(-1);" 
		response.write "</script>" 
		response.end
	End IF
End IF

IF LingFengNet_MS_messreg=2 Then
	IF clng(reg)<>clng(session("LFW_Safecode")) Then
		response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
		response.write "alert('"& LingFengNet_MS_language_save_mes_19 &"');" 
		response.write "history.go(-1);" 
		response.write "</script>" 
		response.end
	End IF
End IF

Select case mes_s
	case "qq"
	mess=LingFengNet_MS_language_save_mes_20&mess
	case "msn"
	mess=LingFengNet_MS_language_save_mes_21&mess
	case "pp"
	mess=LingFengNet_MS_language_save_mes_22&mess
	case "uc"
	mess=LingFengNet_MS_language_save_mes_23&mess
	case "yahoo"
	mess=LingFengNet_MS_language_save_mes_24&mess
	case "no"
	mess=LingFengNet_MS_language_save_mes_25
End Select

IF tel="" Then tel=LingFengNet_MS_language_save_mes_26
%>
<!-- #include file="inc/filtrate.asp" -->
<%
username=server.htmlencode(username)
email=server.htmlencode(email)
post=server.htmlencode(post)
mess=server.htmlencode(mess)
content=server.htmlencode(content)
IF email="" or email="no" Then  email=LingFengNet_MS_language_save_mes_26

IF LingFengNet_MS_messconten=0 Then
	username=EnCrypt(username)
	post=EnCrypt(post)
	ip=EnCrypt(ip)
	tel=EnCrypt(tel)
	email=EnCrypt(email)
	mess=EnCrypt(mess)
	content=EnCrypt(content)
	rsencrypt=1
ElseIF LingFengNet_MS_messconten=1 Then
	username=username
	post=post
	ip=ip
	tel=tel
	email=email
	mess=mess
	content=nobr(content)
	rsencrypt=0
End IF

IF lylx<>"" and LingFengNet_MS_messlx = 0 Then
	lylx = lylx
Else
	lylx = "无"
End IF		

IF ys2="ys" Then
%>
<!-- #include file="inc/enpass.asp" -->
<!-- #include file="inc/md5_32.asp" -->
<%
	enpassok=lcase(get_enpass(LingFengNet_MS_ss_dig))
	enpassok=replace(enpassok,left(enpassok,1),sjs())
	silentlywords=1
	rsenpass=LFW_md5_32_pass(enpassok)
	'rsenpass=enpassok
	enpass_word=LingFengNet_MS_language_save_mes_27_1
	copy_password="　|　<a href=""#"" onclick=""copyText(document.getElementById('tbid')"">"&LingFengNet_MS_language_save_mes_27_5&"</a>"
Else
	silentlywords=0
	rsenpass="0"
	enpass_word=LingFengNet_MS_language_save_mes_27
End IF

IF session("Auditingmess")="ok" Then
	Auditing=2
ElseIF session("Auditingmess")="bad" Then
	Auditing=3
Else
	Auditing=0
End IF

IF LingFengNet_MS_web_bs=0 Then
	face=face
Else
	face="1.jpg"
End IF

IF Session("nameok") <> "" Then
	filemulu = Session("nameok")
Else
	filemulu = "0"
End IF	
	

IF Application("LingFengNet_MS_save_Load")="" Then
	Application.Lock
	Application("LingFengNet_MS_save_Load")=1
	Application.UnLock
ElseIF Application("LingFengNet_MS_save_Load")>=1 Then
	Application.Lock
	Application("LingFengNet_MS_save_Load")=Application("LingFengNet_MS_save_Load")+1
	Application.UnLock
End IF

sql="insert into lfmessb (username,post,ip,tel,email,mess,content,encrypt,addtime,silentlywords,enpass,Auditing,face,topok,lylx,filemulu)  values ('"&username&"','"&post&"','"&ip&"','"&tel&"','"&email&"','"&mess&"','"&content&"',"&rsencrypt&",now(),"&silentlywords&",'"&rsenpass&"',"&Auditing&",'"&face&"',1,'"&lylx&"','"&filemulu&"')"
conn.Execute(sql)
conn.close
Set conn=nothing	

IF LingFengNet_MS_messdoor=0 Then
	Response.cookies("LingFengNet_MS_messdoortime") = now()
	Response.cookies("LingFengNet_MS_messdoortime").Expires = now()+LingFengNet_MS_messdoortimes
End IF
	
IF LingFengNet_MS_messdoorday=0 Then
	
	IF Request.cookies("LingFengNet_MS_messdoorday_times")="" Then 
		LingFengNet_MS_messdoorday_times_lin=0
	Else  
		LingFengNet_MS_messdoorday_times_lin=Request.cookies("LingFengNet_MS_messdoorday_times")
	End IF
		Response.cookies("LingFengNet_MS_messdoorday_times") = LingFengNet_MS_messdoorday_times_lin+1
		Response.cookies("LingFengNet_MS_messdoorday_times").Expires = now()+1		
End IF	

Application.Lock
IF Application("LingFengNet_MS_save_Load")-1>0 Then
Application("LingFengNet_MS_save_Load")	=Application("LingFengNet_MS_save_Load")-1
Else
Application("LingFengNet_MS_save_Load")=0
End IF
Application.UnLock

IF LingFengNet_MS_ToMail_todo<>"0" Then
messemail=LingFengNet_MS_language_save_mes_54&content&LingFengNet_MS_language_save_mes_55&now()&LingFengNet_MS_language_save_mes_56
LingFengNet_MS_tomaillistReturn = Split(LingFengNet_MS_tomaillist,"|")
For i = LBound(LingFengNet_MS_tomaillistReturn) To UBound(LingFengNet_MS_tomaillistReturn)
Call SendSysMail (LingFengNet_MS_language_save_mes_57,LingFengNet_MS_tomaillistReturn(i),LingFengNet_MS_language_save_mes_58,messemail)
Next
End IF


Response.Write "<html><head><META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><link rel=""stylesheet"" href=""style/css/"& LingFengNet_MS_web_css&".css"" type=""text/css""><title>"&LingFengNet_MS_language_save_mes_27_2&"</title><script type=""text/javascript"">function copyText(obj)   {  var rng = document.body.createTextRange();  rng.moveToElementText(obj);  rng.scrollIntoView();  rng.select();  rng.execCommand(""Copy"");  rng.collapse(false);  alert("""&LingFengNet_MS_language_save_mes_27_6&""")} </script> </head><body><table width="&LingFengNet_MS_web_w&" border=""0"" cellspacing=""0"" cellpadding=""0"">    <tr>       <td class=""bgc2"">         <table width=""100%"" border=""0"" cellspacing=""1"" cellpadding=""3"">          <tr>             <td class=""bgc"" height=""30"">&ensp;&ensp;"& LingFengNet_MS_language_save_mes_27_2 &"</td>          </tr>          <tr>             <td  class=""bgc1"" height=""160""><p><span id=""tbid"">"& enpass_word &""& enpassok &"</span></p><br><div align=center><a href=""default"&Get_Suffix()&""">"&LingFengNet_MS_language_save_mes_27_3&"</a>　|　<a href=""javascript:window.close()"">"&LingFengNet_MS_language_save_mes_27_4&"</a>"&copy_password&"</div>            </td>          </tr>        </table>      </td>    </tr>  </table></body></html>"
Session("saveok")=saveok
Session("nameok")=""
Response.End
%>