<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: admin_makejs.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: js文件生成器 | 
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
<head>
<title></title>
<%  
  call htmlmeta() 
%> 
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
</head>
<body>
<%if request.form("set")<>"ok" then%>
<form action="admin_makejs.asp" method="post" name="makejs"><br>
<table width="99%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><input name="jsname" type="text" readonly value="add_js.js">
      <input name="js_button" type="submit" value="<%= LingFengNet_MS_language_w3c_04 %>">
      <input type="hidden" name="set" value="ok"></td>
  </tr>
</table>
</form>
</body>
</html>
<%
else
on error resume next
server.scripttimeout=9999999

function getHTTPPage(url) 
		dim Http 
		set Http=server.createobject("MSXML2.serverXMLHTTP") 
		Http.open "GET",url,false 
		Http.send() 
		if Http.readystate<>4 then 
		exit function 
		end if 
		getHTTPPage=bytesToBSTR(Http.responseBody,"GB2312") 
		set http=nothing 
		if err.number<>0 then err.Clear 
end function 

Function BytesToBstr(body,Cset)
        dim objstream
        set objstream = Server.CreateObject("adodb.stream")
        objstream.Type = 1
        objstream.Mode =3
        objstream.Open
        objstream.Write body
        objstream.Position = 0
        objstream.Type = 2
        objstream.Charset = Cset
        BytesToBstr = objstream.ReadText 
        objstream.Close
        set objstream = nothing
End Function

Function Newstring(wstr,strng)
        Newstring=Instr(lcase(wstr),lcase(strng))
        if Newstring<=0 then Newstring=Len(wstr)
End Function

        
		Path="http://"&request.servervariables("server_name")&replace(request.servervariables("script_name"),"admin_makejs.asp","")
        url=""&Path&"addnew.asp"
        wstr=gethttppage(url)
		
		start_inc=Newstring(wstr,"<!--openjs-->")
        over_inc=Newstring(wstr,"<!--endjs-->")
        body_inc=mid(wstr,start_inc,over_inc-start_inc)

if IsObjInstalled("Scripting.FileSystemObject") then
		writeStr_inc=body_inc
		toppath_inc = Server.Mappath("config/temp.zylf")
		Set fs = CreateObject("scripting.filesystemobject")
		
		If Not Fs.FILEEXISTS(toppath_inc) Then 
		Set Ts_inc = fs.createtextfile(toppath_inc, True)
		Ts_inc.close
		end if
		Set Ts_inc= Fs.OpenTextFile(toppath_inc,2)
		Ts_inc.writeline (writeStr_inc)
		Ts_inc.Close
		Set Ts_inc=Nothing		
		
	if fs.FileExists(server.mappath("config/temp.zylf")) then
		Set ts=fs.OpenTextFile(server.mappath("config/temp.zylf")) 
		do until ts.AtEndOfStream
			str=str+"document.writeln("""&ts.readLine &""");"& chr(13) & chr(10)
		loop		
		ts.close 
		str= Replace(str,"\","\\")
		str= Replace(str,"/","\/")
		str= Replace(str,"""","\""")
		str= Replace(str,"document.writeln(\""","document.writeln(""")
		str= Replace(str,"\"");",""");")
	else 
		response.write ""& LingFengNet_MS_language_w3c_12 &"&ensp;&ensp;&ensp;&ensp;<a href=""admin_makejs"&Get_Suffix()&""">"& LingFengNet_MS_language_w3c_06 &"</a>" 
		response.end 
	end if 

	writeStr=str
	jsname=Trim(Request.Form("jsname"))
	toppath = Server.Mappath(""& jsname &"")

	If Not Fs.FILEEXISTS(toppath) Then 
		Set Ts = fs.createtextfile(toppath, True)
		Ts.close
	end if
	Set Ts= Fs.OpenTextFile(toppath,2)
	Ts.writeline (writeStr)
	Ts.Close
	
	set file=fs.getfile(toppath_inc)
	file.delete
	set file=nothing
	
	Set Ts=Nothing
	Set Fs=Nothing
	html_web=chr(60)&"script charset=GB2312 src="&Path&jsname&chr(62)&chr(60)&"/script"&chr(62)
	html_web=server.htmlencode(html_web)
	Response.write ""& LingFengNet_MS_language_w3c_09 &"&ensp;&ensp;" &html_web& "&ensp;&ensp;"& LingFengNet_MS_language_w3c_10 &"<br><a href=""admin_makejs"&Get_Suffix()&""">"& LingFengNet_MS_language_w3c_06 &"</a>"
else
	Response.write ""& LingFengNet_MS_language_w3c_11 &"&ensp;&ensp;&ensp;&ensp;<a href=""admin_makejs"&Get_Suffix()&""">"& LingFengNet_MS_language_w3c_06 &"</a>"
end if

end if	
%>