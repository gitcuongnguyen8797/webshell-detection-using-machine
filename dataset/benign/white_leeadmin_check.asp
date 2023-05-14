<%
    if trim(request.cookies("ZhiRui")("ZhiRuiAdmin"))<>"" then
    session("ZhiRuiAdmin")=request.cookies("ZhiRui")("ZhiRuiAdmin")
    session("ZhiRuiUser")=request.cookies("ZhiRui")("ZhiRuiUser")
    session("AdminPurview")=request.cookies("ZhiRui")("AdminPurview")
    End if
	If trim(session("ZhiRuiAdmin"))="" then
	Response.Write("<script language=javascript>alert('系统超时或服务器会话丢失，请重新登录！');this.top.location.href='Admin_Login.asp';</script>")
	Response.end
	End if
	If session("ZhiRuiCheck")<>"ZhiRuiSystem" then
	Response.Write("<script language=javascript>alert('系统校验码错误，请重新登录！');this.top.location.href='Admin_Login.asp';</script>")
	Response.end
	End if
%>