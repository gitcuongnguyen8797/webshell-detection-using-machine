<%@language=vbscript codepage=936 %>
<%Server.ScriptTimeOut=999999999
server.ScriptTimeout=50000000
if session("admin")<>1 then response.Redirect "default.asp"
response.buffer=true	
%>
<!--#include file="config.asp"-->
<!--#include file="background.asp"-->
<%
Const MaxPerPage=20
dim strFileName
dim Action
dim totalPut,CurrentPage,TotalPages
dim UploadDir,TruePath,fso,theFolder,theFile,thisfile,FileCount,TotalSize,TotalSize_Page
dim strFileType
dim sql,rs,strFiles,i
dim strDirName
Action=trim(Request("Action"))
UploadDir=request("UploadDir")
if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if
strFileName="UploadFileList.asp?UploadDir=" & UploadDir
if right(UploadDir,1)<>"/" then
	UploadDir=UploadDir & "/"
end if
TruePath=Server.MapPath(UploadDir)
%>

<html>
<head>
<title>�ϴ��ļ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
body {
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 15px;
	margin-bottom: 15px;
}
-->
</style>
</head>
<SCRIPT language=javascript>
function unselectall()
{
    if(document.myform.chkAll.checked){
	document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    } 	
}

function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
}

</script>
<body>
<div align="center">
  <center>
    <table border=0 width=100% align=center>
      <tr>
        <td width="22" align=left><font color="#FF0000"><img src="images/back.gif" width="17" height="17"></font> </td>
        <td width="96" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">��������ҳ</a></td>
        <td width="857" align=right><!--#INCLUDE FILE="link.asp"-->
        </td>
    </table>
<br>
  </CENTER>
</DIV>
<%
	set fso=CreateObject("Scripting.FileSystemObject")
	if Action="Del" then
		call DelFiles()
	elseif Action="DelAll" then
		call DelAll()
	elseif Action="Clear" or Action="DoClear" then
		call ClearFile()
	else
		call main()
	end if

sub main()
	if fso.FolderExists(TruePath)=False then
		response.write "�Ҳ����ļ��У���������������"
		exit sub
	end if
	
	FileCount=0
	TotalSize=0
	Set theFolder=fso.GetFolder(TruePath)
	For Each theFile In theFolder.Files
		FileCount=FileCount+1
		TotalSize=TotalSize+theFile.Size
	next
	totalPut=FileCount
	if currentpage<1 then
		currentpage=1
	end if
	if (currentpage-1)*MaxPerPage>totalput then
		if (totalPut mod MaxPerPage)=0 then
			currentpage= totalPut \ MaxPerPage
		else
			currentpage= totalPut \ MaxPerPage + 1
		end if
			end if
	if currentPage=1 then
		showContent     	
		showpage2 strFileName,totalput,MaxPerPage
		response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotalSize_Page\1024 & "</b> K</div>"
	else
		if (currentPage-1)*MaxPerPage<totalPut then
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotalSize_Page\1024 & "</b> K</div>"
		else
			currentPage=1
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotalSize_Page\1024 & "</b> K</div>"
		end if
	end if
end sub

sub showContent()
   	dim c
	FileCount=0
	TotalSize_Page=0
%>
<table width='100%' border="0" cellpadding="0" cellspacing="0" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>d">
  <form name="myform" method="Post" action="UploadFileList.asp" onsubmit="return confirm('ȷ��Ҫɾ��ѡ�е��ļ���');">
     <td>
<table width="100%" align="center" cellpadding="5" cellspacing="1">
  <tr >
    <%

For Each theFile In theFolder.Files
	c=c+1
	if FileCount>=MaxPerPage then
		exit for
	elseif c>MaxPerPage*(CurrentPage-1) then
%>
    <td>
      <table width="100%" height="100%" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
        <tr class="tablebg<%=skin%>d">
          <td colspan="2" align="center">
            <%
		  strFileType=lcase(mid(theFile.Name,instrrev(theFile.Name,".")+1))
		  response.write "<a href='" & UploadDir & theFile.Name & "'>"
		  select case strFileType
		  case "jpg","gif","bmp","png"
			  	response.write "<img src='" & UploadDir & theFile.Name & "' width='140' height='100' border='0'></a>"
		  case "swf"
			  	response.write "<img src='images/filetype_flash.gif' width='140' height='100' border='0'></a>"
		  case "wmv","avi","asf","mpg"
			  	response.write "<img src='images/filetype_media.gif' width='140' height='100' border='0'></a>"
		  case "rm","ra","ram"
		  		response.write "<img src='images/filetype_rm.gif' width='140' height='100' border='0'></a>"
		  case "rar"
		    response.write "<img src='images/filetype_rar.gif' width='140' height='100' border='0'></a>"
		  case "zip"
		    response.write "<img src='images/filetype_zip.gif' width='140' height='100' border='0'></a>"
		  case "exe"
		    response.write "<img src='images/filetype_exe.gif' width='140' height='100' border='0'></a>"
		  case else
		  		response.write "<img src='images/filetype_other.gif' width='140' height='100' border='0'></a>"
		  end select
		  %>
          </td>
        </tr>
        <tr class="tablebg<%=skin%>d">
          <td align="right">�� �� ����</td>
          <td><%
		  	response.write "<a href='" & UploadDir & theFile.Name & "' target='_blank'>" & theFile.Name & "</a>"
		  %>
		  </td>
        </tr>
        <tr class="tablebg<%=skin%>d">
          <td align="right">�ļ���С��</td>
          <td><%=round(theFile.size/1024) & " K"%></td>
        </tr>
        <tr class="tablebg<%=skin%>d">
          <td align="right">�ļ����ͣ�</td>
          <td><%=theFile.type%></td>
        </tr>
        <tr class="tablebg<%=skin%>d">
          <td align="right">�޸�ʱ�䣺</td>
          <td><%=theFile.DateLastModified%></td>
        </tr>
        <tr class="tablebg<%=skin%>d">
          <td align="right">����ѡ�</td>
          <td><input name="FileName" type="checkbox" id="FileName" value="<%=theFile.Name%>" onclick="unselectall()">
            ѡ��&nbsp;&nbsp;&nbsp;&nbsp;<a href="UploadFileList.asp?Action=Del&FileName=<%=theFile.Name%>&UploadDir=<%=left(UploadDir,len(UploadDir)-1)%>" onclick="return confirm('�����Ҫɾ�����ļ���!')">ɾ��</a></td>
        </tr>
      </table>
    </td>
    <%
		FileCount=FileCount+1
		if FileCount mod 4=0 then response.write "</td><tr class='tdbg'>"
		TotalSize_Page=TotalSize_Page+theFile.Size
	end if
Next
%>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200" height="30"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox">
      ѡ�б�ҳ��ʾ�������ļ�</td>
    <td><input name="Action" type="hidden" id="Action" value="Del">
      <input name="UploadDir" type="hidden" id="UploadDir" value="<%=left(UploadDir,len(UploadDir)-1)%>">
              <input type="submit" name="Submit" value="ɾ��ѡ�е��ļ�" class="input2">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="submit" name="Submit2" value="ɾ�������ļ�" onClick="document.myform.Action.value='DelAll';" class="input2">
            </td>
  </tr>
</table>
</td></form></tr></table>
<%
end sub
sub ClearFile()
%>
<table width="100%" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a">
    <td height="22" align="center"><strong>�������õ��ϴ��ļ�</strong></td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="150">
<%
if Action="Clear" then
%>
<form name="form1" method="post" action="uploadfilelist.asp" onSubmit="javascript:if(document.form1.upload.checked==false&&document.form1.uploadreplay.checked==false&&document.form1.uploadface.checked==false){alert('��������ѡ��һ��Ҫ��յ�Ŀ¼��');return false;}">
&nbsp;&nbsp;&nbsp;&nbsp;�ڷ�������ʱ������������ϴ���ͼƬ��ȴ����û���ύ�������ʱ��һ�ã��ͻ�����������������ļ���������Ҫ����ʹ�ñ����ܽ�������      
<p>&nbsp;&nbsp;&nbsp;&nbsp;����ϴ��ļ��ܶ࣬�������������϶ִ࣬�б�������Ҫ�ķ��൱����ʱ�䣬���ڷ�������ʱִ�б�������</p>
<table width="85%"  border="0" align="center">
  <tr>
    <td><input name="upload" type="checkbox" id="upload" value="Yes" style="border: 0px;">
������ϴ��ļ�����</td>
    </tr>
  <tr>
    <td><input name="uploadreplay" type="checkbox" id="uploadreplay" value="Yes" style="border: 0px;">
�ظ����ϴ��ļ����� </td>
    </tr>
  <tr>
    <td><input name="uploadface" type="checkbox" id="uploadface" value="Yes" style="border: 0px;">
�ϴ�ͷ������</td>
    </tr>
</table>
<p align="center"><input name="Action" type="hidden" id="Action" value="DoClear">
      <input type="submit" name="Submit3" value=" ��ʼ���� " class="input2">
</p>
</form>
<%
else
	call DoClear()
end if
%>    </td>
  </tr>
</table>
<%
end sub
%>
<hr>
<!--#include file="bottom.asp"-->
</body> 
</html>
<%
sub showpage2(sfilename,totalnumber,maxperpage)
	dim n, i,strTemp
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table align='center'><form name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
	strTemp=strTemp & "�� <b>" & totalnumber & "</b> ���ļ���ռ�� <b>" & TotalSize\1024 & "</b> K&nbsp;&nbsp;&nbsp;"
	'sfilename=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "��ҳ ��һҳ&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "&page=1'>��ҳ</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "&page=" & (CurrentPage-1) & "'>��һҳ</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "��һҳ βҳ"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "&page=" & (CurrentPage+1) & "'>��һҳ</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "&page=" & n & "'>βҳ</a>"
  	end if
   	strTemp=strTemp & "&nbsp;ҳ�Σ�<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>ҳ "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & "���ļ�/ҳ"
	strTemp=strTemp & "&nbsp;ת����<select name='page' size='1' onchange='javascript:submit()'>"   
    for i = 1 to n   
   		strTemp=strTemp & "<option value='" & i & "'"
		if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
		strTemp=strTemp & ">��" & i & "ҳ</option>"   
	next
	strTemp=strTemp & "</select>"
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub

sub DelFiles()
	dim whichfile,arrFileName,i
	whichfile=trim(Request("FileName"))
	if whichfile="" then exit sub
	if instr(whichfile,",")>0 then
		arrFileName=split(whichfile,",")
		for i=0 to ubound(arrFileName)
			if left(trim(arrFileName(i)),3)<>"../" and left(trim(arrFileName(i)),1)<>"/" then
				whichfile=server.MapPath(UploadDir & trim(arrFileName(i)))
				set thisfile=fso.GetFile(whichfile)
				thisfile.Delete True
			end if
		next
	else
		if left(whichfile,3)<>"../" and left(whichfile,1)<>"/" then
			Set thisfile = fso.GetFile(server.MapPath(UploadDir & whichfile))
			thisfile.Delete True
		end if
	end if
	call main()
end sub

sub DelAll()
	Set theFolder=fso.GetFolder(TruePath)
	For Each theFile In theFolder.Files
		theFile.Delete True
	next
	call main()
end sub

sub DoClear()
	set rs=server.CreateObject("adodb.recordset")
	if trim(request("upload"))="Yes" then
		strFiles=""
		sql="select content from guest"
		rs.open sql,conn,1,1
		do while not rs.eof
			if rs(0)<>"" then
				strFiles=strFiles & "|" & rs(0)
			end if
			rs.movenext
		loop
		rs.close
		call DelFile_Useless("upload","������ϴ��ļ�")
	end if
	
	if trim(request("uploadreplay"))="Yes" then
		strFiles=""
		sql="select replycontent from reply"
		rs.open sql,conn,1,1
		do while not rs.eof
			if rs(0)<>"" then
				strFiles=strFiles & "|" & rs(0)
			end if
			rs.movenext
		loop
		rs.close
		call DelFile_Useless("uploadreplay","�ظ����ϴ��ļ�")
	end if
	
	if trim(request("uploadface"))="Yes" then
		strFiles=""
		sql="select myface from register"
		rs.open sql,conn,1,1
		do while not rs.eof
			if rs(0)<>"" then
				strFiles=strFiles & "|" & rs(0)
			end if
			rs.movenext
		loop
		rs.close
		call DelFile_Useless("uploadface","�ϴ�ͷ��")
	end if

	set rs=nothing
end sub

sub DelFile_Useless(strDir,strDirName)
	dim i
	i=0
	Set theFolder=fso.GetFolder(server.MapPath(strDir))
	For Each theFile In theFolder.Files
		if instr(strFiles,theFile.Name)<=0 then
			theFile.Delete True
			i=i+1
		end if
	next
	response.write "����ִ�гɹ����� <font color=blue>" & strDirName & "</font> Ŀ¼�й�ɾ���� <font color=red><b>" & i & "</b></font> �����õ��ļ���<br><br>"
end sub
%>