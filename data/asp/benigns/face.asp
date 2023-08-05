<%@language=vbscript codepage=936 %>
<html>
<head>
<title>¡Ù—‘∞ÂÕ∑œÒ</title>
<link rel="stylesheet" href="style/<%=skin%>.css" type="text/css">
<link href="1.css" rel="stylesheet" type="text/css">
</head>
<body>
<script>
function changeimage(imagename)
{ 
	window.opener.document.form.face.value="face/"+imagename+".gif";
	window.opener.document.form.idface.src="face/"+imagename+".gif";
	window.close();
}
</script>
<table style="BORDER-LEFT:#0098c8 1PX SOLID;BORDER-RIGHT:#0098c8 1PX SOLID;BORDER-TOP:#0098c8 1PX SOLID;BORDER-BOTTOM:#0098c8 1PX SOLID" border="0" width="444" cellspacing="0" cellpadding="10" bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center" >
<%k=1
for i=1 to 7%>
  <tr> 
    <%for j=1 to 8%>
    <td width="100%" height="36" align="center" class="table001"><a href="#"><img src="face/<%=k%>.gif" border="0" onclick="changeimage('<%=i*j%>')" style="cursor:hand"></a><br> 
    <%=k%> </td>
    <%k=k+1
	next%>
  </tr>
  <%next%>
</table>
</body>
</html>