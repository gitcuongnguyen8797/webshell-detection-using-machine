<!--#include file="../Include/config.asp"-->
<!--#include file="Admin_check.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|111,")=0 then 
  response.write ("<font color='red')>�㲻���иù���ģ��Ĳ���Ȩ�ޣ��뷵�أ�</font>")
  response.end
end if
'========�ж��Ƿ���й���Ȩ�� 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<script language="Javascript">
function display(ID)
{
	if (document.getElementById(ID).style.display == "none") {
		document.getElementById(ID).style.display = "";
	}else{
		document.getElementById(ID).style.display = "none";
	}
}
</script>
<title>admin</title>
</head>
<body>
<%
Sub ADODB_SaveToFile(ByVal strBody,ByVal File)
	On Error Resume Next
	Dim objStream,FSFlag,fs,WriteFile
	FSFlag = 1
	If DEF_FSOString <> "" Then
		Set fs = Server.CreateObject(DEF_FSOString)
		If Err Then
			FSFlag = 0
			Err.Clear
			Set fs = Nothing
		End If
	Else
		FSFlag = 0
	End If
	
	If FSFlag = 1 Then
		Set WriteFile = fs.CreateTextFile(Server.MapPath(File),True)
		WriteFile.Write strBody
		WriteFile.Close
		Set Fs = Nothing
	Else
		Set objStream = Server.CreateObject("ADODB.Stream")
		If Err.Number=-2147221005 Then 
			GBL_CHK_TempStr = "����������֧��ADODB.Stream���޷���ɲ�������ʹ��FTP�ȹ��ܣ���<font color=Red >Include/config.asp</font>�ļ������滻�ɿ�������"
			Err.Clear
			Set objStream = Noting
			Exit Sub
		End If
		With objStream
			.Type = 2
			.Open
			.Charset = "GB2312"
			.Position = objStream.Size
			.WriteText = strBody
			.SaveToFile Server.MapPath(File),2
			.Close
		End With
		Set objStream = Nothing
	End If
End Sub

If request("action")="Edit" then
SiteTitle = replace(Trim(Request.Form("SiteTitle")),CHR(34),"'")
Lelogo = replace(Trim(Request.Form("Images")),CHR(34),"'")
SiteUrl = replace(Trim(Request.Form("SiteUrl")),CHR(34),"'")
email = replace(Trim(Request.Form("email")),CHR(34),"'")
Tel = replace(Trim(Request.Form("Tel")),CHR(34),"'")
Address = replace(Trim(Request.Form("Address")),CHR(34),"'")
SitePath = replace(Trim(Request.Form("SitePath")),CHR(34),"'")
DataName = replace(Trim(Request.Form("DataName")),CHR(34),"'")
SqlNo = replace(Trim(Request.Form("SqlNo")),CHR(34),"'")
SiteUp = replace(Trim(Request.Form("SiteUp")),CHR(34),"'")
Sitekeywords = replace(Trim(Request.Form("Sitekeywords")),CHR(34),"'")
Sitedescription = replace(Trim(Request.Form("Sitedescription")),CHR(34),"'")
Htmledit = replace(Trim(Request.Form("Htmledit")),CHR(34),"'")
SiteTcp = replace(Trim(Request.Form("SiteTcp")),CHR(34),"'")
Certif = replace(Trim(Request.Form("Certif")),CHR(34),"'")
Dim n,TempStr
	TempStr = ""
	TempStr = TempStr & chr(60) & "%" & VbCrLf
	TempStr = TempStr & "Dim SiteTitle,Lelogo,SiteUrl,email,tel,address,SitePath,DataName,SqlNo,SiteUp,Sitekeywords,Sitedescription,Css,SiteTcp,Certif" & VbCrLf & VbCrLf
	TempStr = TempStr & "'=====��վ����" & VbCrLf 
	TempStr = TempStr & "SiteTitle="& Chr(34) & SiteTitle & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "Lelogo="& Chr(34) & Lelogo & Chr(34) &"" & VbCrLf 
	TempStr = TempStr & "'=====ע�ⲻҪ�������" & VbCrLf 
	TempStr = TempStr & "SiteUrl="& Chr(34) & SiteUrl & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "'=====��Ŀ¼ֱ����/" & VbCrLf
	TempStr = TempStr & "email="& Chr(34) & email & Chr(34) &" '��ϵ�ʼ�" & VbCrLf
	TempStr = TempStr & "tel="& Chr(34) & tel & Chr(34) &" '��ϵ�绰" & VbCrLf
	TempStr = TempStr & "address="& Chr(34) & address & Chr(34) &" '��ϵ��ַ" & VbCrLf
	TempStr = TempStr & "SitePath="& Chr(34) & SitePath & Chr(34) &"" & VbCrLf & VbCrLf
	TempStr = TempStr & "'==============================" & VbCrLf
	TempStr = TempStr & "DataName="& Chr(34) & DataName & Chr(34) &" '���ݿ�����" & VbCrLf
	TempStr = TempStr & "SqlNo="& Chr(34) & SqlNo & Chr(34) &" '���ݿ�����" & VbCrLf
	TempStr = TempStr & "SiteUp="& Chr(34) & SiteUp & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "Sitekeywords="& Chr(34) & Sitekeywords & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "Sitedescription="& Chr(34) & Sitedescription & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "SiteTcp="& Chr(34) & SiteTcp & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "'=====��ʾ����=====" & VbCrLf
	TempStr = TempStr & "Certif="& Chr(34) & Certif & Chr(34) &"" & VbCrLf
	TempStr = TempStr & "%" & chr(62) & VbCrLf
	ADODB_SaveToFile TempStr,"../Include/Config.asp"
	If GBL_CHK_TempStr = "" Then
		Response.Write("<script language=javascript>alert('�޸ĳɹ���');this.location.href='admin_Config.asp';</script>")
	Else
		%><table width=""98%"" align=""center"" border=""1"" cellspacing=""0"" cellpadding=""4"" class=lanyubk style=""border-collapse: collapse""><tr><td class=lanyuss>�������ϸ���</td></tr><tr class=lanyuds><td align=""center"" height=""66"">&gt;<%=GBL_CHK_TempStr%>&lt;<br><br>
		<textarea name="fileContent" cols="1" rows="1"><%=Server.htmlencode(TempStr)%></textarea></td></tr></table><%
		GBL_CHK_TempStr = ""
	End If
	End if
	%>
	<form action="?Action=Edit" method="post"  name="myform">
	<table border="0" align="center" cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
	  <tr>
		<td height="30" colspan="2" background="images/skin/th_bg.gif" class="admintitle"> �޸���վ��������</td>
	  </tr>
	  <tr>
		<td width="20%" height="25" bgcolor="EBF2F9" class="tdleft">��վ���ƣ�</td>
		<td height="25" bgcolor="EBF2F9"><input name="SiteTitle" type="text" id="SiteTitle" value="<%=SiteTitle%>" size="40" class="textfield"></td>
	  </tr>
	  <tr>
		<td width="20%" height="25" bgcolor="EBF2F9" class="tdleft">��վLOGO��</td>
		<td height="25" bgcolor="EBF2F9">
		<input name="Images"type="text" class="textfield" id="Images" value="<%=Lelogo%>" size="50"> 
		<input type="checkbox" onClick="display('upload');" id="box"/><label for='box'>�ϴ��ļ�</label> *������ϴ��Ķ�Ӧ��LOGOͼƬ <br>
		<div id="upload" style="display:none;">			
		<iframe frameborder=0 width=340 height=30 scrolling=no src="Admin_file.asp"></iframe>
		<script type="text/javascript">
		function callback(succeed,filename){
			if(!succeed){alert(Vflv);return;}
			document.getElementById("Images").value=filename;
		}
		</script>
		</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��½��֤��</td>
		<td height="12" bgcolor="EBF2F9"><input name="Certif"type="text" class="textfield" id="Certif" value="<%=Certif%>" size="40"> 
		*��½��֤��</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��վ������</td>
		<td height="12" bgcolor="EBF2F9"><input name="SiteUrl"type="text" class="textfield" id="SiteUrl" value="<%=SiteUrl%>" size="40"> 
		�磺www.ZhiRui.net,��Ҫ"http://"</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��վ�ʼ���</td>
		<td height="12" bgcolor="EBF2F9"><input name="email"type="text" class="textfield" id="mail" value="<%=email%>" size="40"> 
		�磺88888888@126.com</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��ϵ�绰��</td>
		<td height="12" bgcolor="EBF2F9"><input name="Tel"type="text" class="textfield" id="Tel" value="<%=Tel%>" size="40"> 
		�磺010-88888888</td>
	  </tr>
		<tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��ϵ��ַ��</td>
		<td height="12" bgcolor="EBF2F9"><input name="Address"type="text" class="textfield" id="Address" value="<%=Address%>" size="40"> 
		�磺�й���������·</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��װĿ¼��</td>
		<td height="-3" bgcolor="EBF2F9"><input name="SitePath"type="text" class="textfield" id="SitePath" value="<%=SitePath%>" size="40">
		  ��վ��װĿ¼����Ŀ¼����д&quot;/&quot;���ݲ�֧�ֶ���Ŀ¼��</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">���ݿ����ƣ�</td>
		<td height="0" bgcolor="EBF2F9"><input name="DataName"type="text" class="textfield" id="DataName" value="<%=DataName%>" size="40">
		  �����DataĿ¼�µ����ݿ����Ʋ��ڴ���д,��SQL���ֶ��޸�inclunde/conn.asp </td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">���ݿ⣺</td>
		<td bgcolor="EBF2F9"><input name="SqlNo" type="radio" class="noborder" value="1"<%IF ""&SqlNo&""=1 then Response.Write("checked") end if%>>
	MSSQL
	  <input name="SqlNo" type="radio" class="noborder" value="0"<%IF ""&SqlNo&""=0 then Response.Write("checked") end if%>>
	Access</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">�ϴ�Ŀ¼��</td>
		<td height="5" bgcolor="EBF2F9"><input name="SiteUp"type="text" class="textfield" id="SiteUp" value="<%=SiteUp%>" size="40">
		  ����Ĵ���,���ֹ������ϴ�Ŀ¼��</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">�� �� �֣�</td>
		<td height="25" bgcolor="EBF2F9"><input name="SiteKeywords" type="text" class="textfield" id="SiteKeywords" value="<%=SiteKeywords%>" size="40"> 
		��վ�����������Ĺؼ���</td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">��վ������</td>
		<td bgcolor="EBF2F9"><input name="Sitedescription" type="text" class="textfield" id="Sitedescription" value="<%=Sitedescription%>" size="100"></td>
	  </tr>
	  <tr>
		<td height="25" bgcolor="EBF2F9" class="tdleft">������ţ�</td>
		<td height="-3" bgcolor="EBF2F9"><input name="SiteTcp" type="text" class="textfield" id="SiteTcp" value="<%=SiteTcp%>" size="40"></td>
	  </tr>
	</table> 
        <table border="0" align="center" cellpadding="3" cellspacing="2" bgcolor="#FFFFFF" class="admintable">
          <tr>
            <td height="25" align="center" bgcolor="EBF2F9"><input name="Submit" type="submit" class="button" id="Submit" value="ȷ���޸�"></td>
          </tr>
        </table>
		</form>
<%
Function IsObjInstalled(strClassString)
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If Err = 0 Then IsObjInstalled = True
	If Err = -2147352567 Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function
%>
</body>
</html>