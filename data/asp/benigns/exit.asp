<%
response.buffer=true
session.abandon 
session("admin")=0
session("useridname")=""
session("useridpassword")=""
session("showmodal")=""
cookiePath=request.servervariables("path_info")
cookiePath=left(cookiePath,instrRev(cookiePath,"/"))
response.cookies("ly").Path=cookiePath
response.cookies("ly").expires=now-1
if session("list")=0 then response.Redirect "default.asp" else response.Redirect "default1.asp"
%>
