<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp" -->
<!--#include file="ubbcode.asp"-->
<!--#include file="md5.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<%
     UserName=Trim(Request.Form("UserName"))
	 if UserName="" then response.Redirect "error.asp?info=请输入用户名！"
	 password=Trim(request.Form("password"))
	 pic=Trim(request.Form("pic"))
	 secret=request.Form("secret")
	 id3=request.Form("id2")
	 replydate=now
	 IPinfo = Request.servervariables("REMOTE_ADDR")
	 lastname=UserName
	 if request.Form("all")="1" then
		sex=Request.Form("sex")
		Face=Trim(Request.Form("Face"))
		if face="" then face="face/1.gif"
		Email=Trim(Request.Form("Email"))
		HomePage=Trim(Trim(Request.Form("HomePage")))
		qq=Trim(request.Form("qq"))
	 else
		sex="1"
		Face="face/1.gif"
		Email=""
		HomePage=""
		qq="" 
	 end if
	 if secret<>1 then secret=0
	dim strSiteUrl
	strSiteUrl=request.ServerVariables("HTTP_REFERER")
	strSiteUrl=lcase(left(strSiteUrl,instrrev(strSiteUrl,"/")))
	 content=Request.Form("content")
	 if content="" then response.Redirect "error.asp?info=回复不能为空！"
	 if (rs11("lylength")<>0) and (strLength(UserName)>rs11("lylength")) then response.Redirect "error.asp?info=留言长度大于"&rs11("lylength")&"个汉字！"
	 Content=replace(Content,strSiteUrl,"")
	Set rs=server.createobject("ADODB.RECORDSET")
	rs.open "Select * From option1" ,Conn,3,3
	register=rs("register")
	if (session("admin")<>"1" and rs("adminreply")) and (session("admin")<>2 and rs("adminreply")) then 
		response.Redirect("error.asp?info=此留言不允许会员回复！")
	end if
	if (request.Form("all")=0) or (rs11("muieditor")=0 or rs11("muieditor")=2) then
		content=HTMLEncode(content)
	end if
	content=replace(content,"'","""")
	strSiteUrl=request.ServerVariables("HTTP_REFERER")
	strSiteUrl=lcase(left(strSiteUrl,instrrev(strSiteUrl,"/")))
	Content=replace(Content,strSiteUrl,"")

if session("keeptime")="" then 
	session("keeptime")=now
else if (dateDiff("s",session("keeptime"),now)<=rs("second1")) and ((session("admin")<>1) and (session("admin")<>2)) then 
	response.Redirect("error.asp?info=请不要灌水")
else session("keeptime")=now
end if
end if

Dim serchIP
Dim strB
strB=rs("killIP")
if strB<>"" then 
	serchIP=Split(strB,",")
	for i=0 to ubound(serchIP)
		if IPinfo=serchIP(i) then response.Redirect "error.asp?info=系统已经禁止了你的发言！"
	next
end if

Dim arrayx
Dim strA
strtemp=content
strA=rs("killword")
if strA<>"" then
arrayx=Split(strA,",")
for i=0 to ubound(arrayx)
strtemp=replace(strtemp,arrayx(i),"***")
next
end if
if strtemp<>content then
	if rs("stopword") then
		rs("killIP")=rs("killIP")&","&IPinfo
		rs.update
	end if
end if
content=strtemp
	 if homepage="http://" then homepage="" 
      rs.close
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
	  if (rs.eof) and (register) then response.Redirect("error.asp?info=未注册用户不能留言")
	  if not (rs.eof or rs.bof) then
	  	if rs("password1")<>md5(password) then response.Redirect "error.asp?info=用户名已注册，密码错误！"     
	  else
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
	  rs.close
	  rs.open "Select * from guest where ID="&ID3 ,Conn,2,3
if (session("admin")<>1 and rs("lock")) and (session("admin")<>1 and rs("lock")) then 
	response.Redirect("error.asp?info=此留言已被锁定！")
end if
rs("lastdate")=replydate
rs("hf")=rs("hf")+1
rs("lastname")=username
rs.update
rs.close
set rs=nothing
	  if (session("admin")=1) or (session("admin")=2) then
	  	mark=true
	  else
			 if (Instr(rs11("passuser"),","&UserName)>0) or (Instr(rs11("passuser"),","&UserName&",")>0) or (Instr(rs11("passuser"),","&UserName&",")>0) then
				mark=true
			 else
				mark=false
			 end if
	 end if
	sql="Insert Into reply (ID,replyname,replycontent,replydate,ip,face,mail,HomePage,pic,secret,qq,mark)  Values('"&ID3&"','"& UserName &"','"& content &"','"& replydate&"','"& IPinfo&"','"& face&"','"& Email&"','"& HomePage&"','"& pic&"',"& secret&",'"&qq&"',"&mark&")"
	conn.Execute sql 
conn.close
set conn=nothing
response.redirect "reply_post_ok.asp?id="&ID3
%>