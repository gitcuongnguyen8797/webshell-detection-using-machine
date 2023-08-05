<!--#include file = 'config.asp'-->
<%
session("useridname")=Request.cookies("ly")("useridname")
session("useridpassword")=Request.cookies("ly")("useridpassword")
if request("type")="1" then
	Set rs=server.createobject("ADODB.RECORDSET")
	rs.open "Select * From option1" ,Conn,1,1
	response.Write "document.write('<form action=ly/login.asp method=post name=form target=_blank><br>');"
	response.Write "document.write('用 户 名：');"
	response.Write "document.write('<input type=text name=name size=10 class=input1 value="""&session("useridname")&""" maxlength=20><br>');"
	response.Write "document.write(' 密　　码：');"
	response.Write "document.write('<input type=password name=pass size=10 class=input1 value="""&session("useridpassword")&""" maxlength=20><br>');"
	if rs("showcode") then
	response.Write "document.write(' 验 证 码：');"
	response.Write "document.write('<input type=text name=CheckCode size=5 maxlength=4 class=input1> <img src=ly/checkcode.asp><br>');"
	end if
	response.Write "document.write('登录保存：');"
	response.Write "document.write('<select name=expTime id=expTime>');"
	response.Write "document.write('<option selected>不保存</option>');"
	response.Write "document.write('<option value="&dateAdd("d",1,now)&">保存一天</option>');"
	response.Write "document.write('<option value="&dateAdd("ww",1,now)&">保存一周</option>');"
	response.Write "document.write('<option value="&dateAdd("m",1,now)&">保存一月</option>');"
	response.Write "document.write('<option value="&dateAdd("yyyy",1,now)&">保存一年</option>');"
	response.Write "document.write('</select><br>');"
	response.Write "document.write('<input type=submit value=""登 陆"" class=input2 name=Submit >&nbsp;');"	
	response.Write "document.write('<input name=clear type=button class=input2 id=clear value=""注 册"" onclick=location.href=""ly/guest_register.asp"">&nbsp;');"
	response.Write "document.write('<input name=clear2 type=button class=input2 id=clear2 value=""浏 览"" onclick=location.href=""ly/default.asp"">');"
	response.Write "document.write('</form>');"
	rs.close
	set rs=nothing
else
	reply=request("reply")
	Set rs=server.createobject("ADODB.RECORDSET")
	if reply="1" then
		select case request("order")
		case 1
		ordershow=" order by lastdate desc"
		case 2
		ordershow=" order by lydate desc"
		case 3
		ordershow=" order by yd desc"
		case 4
		ordershow=" order by hf desc"
		end select
			rs.open "Select top "&request("lycount")&" * From guest"&ordershow ,Conn,1,1
	else
		ordershow=" order by replydate desc"
		rs.open "Select top "&request("lycount")&" * From reply"&ordershow ,Conn,1,1
	end if
	 do while not rs.eof
		 info=request("info")
	  if reply="1" then           
		select case info
		case "1"
		   if rs("lastname")="——" then
		    	infoshow=" 『"&rs("lastdate")&" "&rs("username")&" 发表』" 
			else
		   	infoshow=" 『"&rs("lastdate")&" "&rs("lastname")&" 回复』" 
			end if 
		case "2"
			infoshow=" 『"&rs("lydate")&"』"
		case "3"
			infoshow=" 『"&rs("username")&"』"
		case "4"
			infoshow=" 『"&rs("username")&" "&rs("yd")&"』"
		case "5"
			infoshow=" 『"&rs("yd")&"』"
		case "6"
			infoshow=" 『"&formatdatetime((rs("lydate")),2)&" "&rs("username")&"』"
		case "7"
			infoshow=" 『"&formatdatetime((rs("lydate")),2)&"』"
		case "8"
			infoshow=" 『"&rs("lastdate")&"』" 
		end select
	  else
	  	select case info
		case "1"
		  	infoshow=" 『"&rs("replydate")&" "&rs("replyname")&"』"
		case "2"
			infoshow=" 『"&rs("replydate")&"』"
		case "3"
			infoshow=" 『"&rs("replyname")&"』"
		case "4"
			infoshow=" 『"&rs("replyname")&"』"
		case "5"
			infoshow=" 『"&rs("yd")&"』"
		case "6"
			infoshow=" 『"&formatdatetime((rs("replydate")),2)&" "&rs("replyname")&"』"
		case "7"
			infoshow=" 『"&formatdatetime((rs("replydate")),2)&"』"
		case "8"
			infoshow=" 『"&rs("lastdate")&"』" 
		end select
	  end if
		response.Write "document.write('·');"
		if request("pic")="1" then 
			response.Write "document.write('<img src=ly/images/"&rs("pic")&"></img>');"
		end if
		if reply="1" then
			if len(rs("subject"))>int(request("lylen")) then 
				response.Write "document.write('<a href=ly/show.asp?id="&rs("id")&" target=_blank>"&left(rs("subject"),int(request("lylen")))&"…</a>"&"');" 
			else 
				response.Write "document.write('<a href=ly/show.asp?id="&rs("id")&" target=_blank>"&rs("subject")&"</a>');"
			end if
			response.Write "document.write('"&infoshow&"<br>"&"');"
		else
			if len(rs("replycontent"))>int(request("lylen")) then 
				response.Write "document.write('<a href=ly/show.asp?id="&rs("id")&" target=_blank>"&left(rs("replycontent"),int(request("lylen")))&"…</a>"&"');"
			else 
				response.Write "document.write('<a href=ly/show.asp?id="&rs("id")&" target=_blank>"&rs("replycontent")&"</a>');"
			end if
			response.Write "document.write('"&infoshow&"<br>"&"');"
		end if
	rs.movenext
	loop
	rs.close
	set rs=nothing
end if
%>
