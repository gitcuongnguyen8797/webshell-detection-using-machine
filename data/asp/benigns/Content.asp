<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type=text/css>
BODY{FONT-SIZE: 9pt;COLOR: #000000;FONT-FAMILY:  Arial,����;
scrollbar-face-color: #DEE3E7;scrollbar-highlight-color: #FFFFFF;scrollbar-shadow-color: #DEE3E7;scrollbar-3dlight-color: #D1D7DC;scrollbar-arrow-color:  #006699;scrollbar-track-color: #EFEFEF;scrollbar-darkshadow-color: #98AAB1;}
font{line-height : normal ;}
.quote{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#F3F3F3 }
.HtmlCode{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#FDFDDF }
</style></head>
<script language="javascript">
	function ctlent(eventobject)
	{
		if(event.ctrlKey && window.event.keyCode==13)
		{
			parent.document.form.submit();
		}
	}
</script>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onkeydown="ctlent();" title="Ctrl+Enterֱ���ύ" >
<%
Action=trim(request("Action"))
ArticleID=trim(request("ArticleID"))
if Action<>"" then
	if Action<>"1" then
	if ArticleId="" then
		response.write "��ָ��Ҫ�޸ĵ�����ID"
	else
		ArticleID=Clng(ArticleID)
		if Action="M2" then sql="select * from reply where ID1=" & ArticleID else sql="select * from guest where ID=" & ArticleID
		Set rs= Server.CreateObject("ADODB.Recordset")
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
			response.write "�Ҳ�������"
		else
			if Action="M2" then response.write rs("replycontent") else response.write rs("content")
		end if
		rs.close
		set rs=nothing
	end if
	else
		Set rs= Server.CreateObject("ADODB.Recordset")
		Set rs1= Server.CreateObject("ADODB.Recordset")
		rs1.open "Select * From option1",Conn,1,1
		response.Write("<DIV class=quote>")
		if request("id1")<>"" then 
			sql="select * from reply where ID1=" & request("id1")
			rs.open sql,conn,1,1
			response.Write("<b>����������<i>"&rs("replyname")&"</i>��"&rs("replydate")&"�ķ��ԣ�</b><br>")
			if rs("secret") then 
				response.Write("������Ϊ���Ļ�")
			else
				if rs1("show") and not rs("mark") then
					response.Write("������Ϊδ�������")
				else
					response.write (rs("replycontent")&"</font>")
				end if
			end if
		else 
			sql="select * from guest where ID=" & request("id") 
			rs.open sql,conn,1,1
			response.Write("<b><font size=2>����������<i>"&rs("username")&"</i>��"&rs("lydate")&"�ķ��ԣ�</b><br>")
			if rs("secret") then
				response.Write("������Ϊ���Ļ�")
			else
				if rs1("show") and not rs("mark") then
					response.Write("������Ϊδ�������")
				else
					response.write (rs("content"))
				end if
			end if
	    end if
		response.Write("</DIV>")
		response.Write("<P>")
		rs.close
		set rs=nothing			
	end if
end if
%>
</body>
</html>