<%@language=vbscript codepage=936 %>
<%
if session("admin")<>1 then response.Redirect "default.asp"
response.buffer=true	
%>
<!--#include file="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<%
conn.close
set conn=nothing
dim Action,FoundErr,ErrMsg
Action=trim(request("Action"))
dim dbpath
dbpath=server.mappath(db)
%>
<html>
<head>
<title>数据库管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 15px;
	margin-top: 15px;
	margin-right: 15px;
	margin-bottom: 15px;
}
-->
</style></head>
<body>
<table border=0 width=100% align=center>
  <tr>
    <td width="22" align=left><font color="#FF0000"><img src="images/back.gif" width="17" height="17"></font> </td>
    <td width="96" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">回留言首页</a></td>
    <td width="857" align=right><!--#INCLUDE FILE="link.asp"-->
    </td>
</table>
<%
if Action="Backup" or Action="BackupData" then
    set conn=nothing
	call ShowBackup()
elseif Action="Compact" or Action="CompactData" then
    set conn=nothing
	call ShowCompact()
elseif Action="Restore" or Action="RestoreData" then
	set conn=nothing
	call ShowRestore()
elseif Action="SpaceSize" then
	call SpaceSize()
	set conn=nothing
else
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>错误参数！</li>"
	set conn=nothing
end if

sub ShowBackup()
%>
<form method="post" action="Database.asp?action=BackupData">
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a"> 
      <td height="22" align="center" valign="middle" class="tablebg<%=skin%>d"><b>备 份 数 据 库</b></td>
  </tr>
  <tr class="tablebg<%=skin%>d"> 
    <td height="150" align="center" valign="middle">
<%    
if request("action")="BackupData" then
	call backupdata()
else
%>
        <table width="100%" border="0" cellpadding="3" cellspacing="1">
          <tr> 
            <td width="200" height="33" align="right">备份目录：</td>
            <td><input type=text size=20 name=bkfolder value=Databackup></td>
            <td>相对路径目录，如目录不存在，将自动创建</td>
          </tr>
          <tr> 
            <td width="200" height="34" align="right">备份名称：</td>
            <td height="34"><input type=text size=20 name=bkDBname value="<%=date()%>"></td>
            <td height="34">不用输入文件名后缀（默认为“.asa”）。如有同名文件，将覆盖</td>
          </tr>
          <tr align="center"> 
            <td height="40" colspan="3"><input name="submit" type=submit value=" 开始备份 "></td>
          </tr>
        </table>
<%
end if
%>
    </td>
 </tr>
</table>
</form>
<%
end sub

sub ShowCompact()
%>
<form method="post" action="Database.asp?action=CompactData">
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
	<tr class="tablebg<%=skin%>a"> 
		<td height="22" align="center" valign="middle" class="tablebg<%=skin%>d"><b>数据库在线压缩</b></td>
	</tr>
	<tr class="tablebg<%=skin%>d">
		<td height="150" align="center" valign="middle"> 
<%    
if request("action")="CompactData" then
	call CompactData()
else
%>
      <br>
      <br>
      <br>
      压缩前，建议先备份数据库，以免发生意外错误。 <br>
      <br>
      <br>
	<input name="submit" type=submit value=" 压缩数据库 ">
        <br>
        <br>
<%
end if
%>
      </td>
    </tr>
  </table>
</form>
<%
end sub

sub ShowRestore()
%>
<form method="post" action="Database.asp?action=RestoreData">
	<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
        <tr class="tablebg<%=skin%>a"> 
      		<td height="22" align="center" valign="middle" class="tablebg<%=skin%>d"><b>数据库恢复</b></td>
        </tr>
        <tr class="tablebg<%=skin%>d">
            <td align="center" height="150" valign="middle"> 
        <%
if request("action")="RestoreData" then
	call RestoreData()
else
%>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="200" height="30" align="right">备份数据库路径（相对）：</td>
            <td height="30"><input name=backpath type=text id="backpath" value="DataBackup\data.mdb" size=50 maxlength="200"></td>
          </tr>
          <tr align="center"> 
            <td height="40" colspan="2"><input name="submit" type=submit value=" 恢复数据 "></td>
          </tr>
        </table>
<%
end if
%>
            </td>
        </tr>
  </table>
</form>
<%
end sub
sub SpaceSize()
	on error resume next
%>
<br>
<table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
	<tr class="tablebg<%=skin%>a"> 
		<td height="22" align="center" valign="middle" class="tablebg<%=skin%>d"><b>系统空间占用情况</b></td>
	</tr>
  <tr class="tablebg<%=skin%>d"> 
    <td width="100%" height="150" valign="middle">
	<blockquote><br>
      系统数据占用空间：&nbsp;<img src="images/bar.gif" width=<%=drawbar("lyDB")%> height=10>&nbsp;
      <%showSpaceinfo("lyDB")%>
      <br>
      <br>
      备份数据占用空间：&nbsp;<img src="images/bar.gif" width=<%=drawbar("databackup")%> height=10>&nbsp;
      <%showSpaceinfo("databackup")%>
      <br>
      <br>
      程序文件占用空间：&nbsp;<img src="images/bar.gif" width=<%=drawspecialbar%> height=10>&nbsp;
      <%showSpecialSpaceinfo("Program")%>
      <br>
      <br>
      系统图片占用空间：&nbsp;<img src="images/bar.gif" width=<%=drawbar("images")%> height=10>&nbsp;
      <%showSpaceinfo("images")%>
      <br>
      <br>
      上传文件占用空间：&nbsp;<img src="images/bar.gif" width=<%=drawbar("Upload")%> height=10>&nbsp;
      <%showSpaceinfo("Upload")%>
      <br>
      <br>
      系统占用空间总计： <img src="images/bar.gif" width=400 height=10> 
      <%showspecialspaceinfo("All")%>
	</blockquote> 	
    </td>
  </tr>
</table>
<%
end sub
%>
<hr>
<div align="center">桃源多功能留言板 V3.0<br>
Copyright(C) 2004-2005 <A href="http://www.mytaoyuan.com/" target=_blank><B><FONT 
face=Arial><span class="style2">www.</span></FONT><FONT 
face=Arial color=#cc3300><FONT color=#ff9900>mytaoyuan</FONT></FONT><span class="style3"><FONT 
face=Arial>.com</FONT></span></B></A> All Rights Reserved
</div>
</body>
</html>
<%
sub BackupData()
	dim bkfolder,bkdbname,fso
	bkfolder=trim(request("bkfolder"))
	bkdbname=trim(request("bkdbname"))
	if bkfolder="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>请指定备份目录！</li>"
	end if
	if bkdbname="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>请指定备份文件名</li>"
	end if
	if FoundErr=True then exit sub
	bkfolder=server.MapPath(bkfolder)
	Set Fso=server.createobject("scripting.filesystemobject")
	if fso.FileExists(dbpath) then
		If fso.FolderExists(bkfolder)=false Then
			fso.CreateFolder(bkfolder)
		end if
		fso.copyfile dbpath,bkfolder & "\" & bkdbname & ".asa"
		response.write "<center>备份数据库成功，备份的数据库为 " & bkfolder & "\" & bkdbname & ".asa</center>"
	Else
		response.write "<center>找不到数据库，请使用记事本打开本页并修改第14行的数据库路径。</center>"
	End if
end sub

sub CompactData()
	Dim fso, Engine, strDBPath
	strDBPath = left(dbPath,instrrev(DBPath,"\"))
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	If fso.FileExists(dbPath) Then
		Set Engine = CreateObject("JRO.JetEngine")
		Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbpath," Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb"
		fso.CopyFile strDBPath & "temp.mdb",dbpath
		fso.DeleteFile(strDBPath & "temp.mdb")
		Set fso = nothing
		Set Engine = nothing
		response.write "数据库压缩成功!"
	Else
		response.write "数据库没有找到!请使用记事本打开本页并修改第14行的数据库路径"
	End If
end sub

sub RestoreData()
	dim backpath,fso
	backpath=request.form("backpath")
	if backpath="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>请指定原备份的数据库文件名！<li>"
		exit sub	
	end if
	backpath=server.mappath(backpath)
	Set Fso=server.createobject("scripting.filesystemobject")
	if fso.fileexists(backpath) then  					
		fso.copyfile Backpath,Dbpath
		response.write "成功恢复数据！"
	else
		response.write "找不到指定的备份文件！请使用记事本打开本页并修改第14行的数据库路径"	
	end if
end sub

Sub ShowSpaceInfo(drvpath)
	dim fso,d,size,showsize
	set fso=server.createobject("scripting.filesystemobject") 		
	drvpath=server.mappath(drvpath) 		 		
	set d=fso.getfolder(drvpath) 		
	size=d.size
	showsize=size & "&nbsp;Byte" 
	if size>1024 then
	   size=(size\1024)
	   showsize=size & "&nbsp;KB"
	end if
	if size>1024 then
	   size=(size/1024)
	   showsize=formatnumber(size,2) & "&nbsp;MB"		
	end if
	if size>1024 then
	   size=(size/1024)
	   showsize=formatnumber(size,2) & "&nbsp;GB"	   
	end if   
	response.write "<font face=verdana>" & showsize & "</font>"
End Sub	

Sub Showspecialspaceinfo(method)
	dim fso,d,fc,f1,size,showsize,drvpath 		
	set fso=server.createobject("scripting.filesystemobject")
	drvpath=server.mappath("pic")
	drvpath=left(drvpath,(instrrev(drvpath,"\")-1))
	set d=fso.getfolder(drvpath) 		
	
	if method="All" then 		
		size=d.size
	elseif method="Program" then
		set fc=d.Files
		for each f1 in fc
			size=size+f1.size
		next	
	end if	
	
	showsize=size & "&nbsp;Byte" 
	if size>1024 then
	   size=(size\1024)
	   showsize=size & "&nbsp;KB"
	end if
	if size>1024 then
	   size=(size/1024)
	   showsize=formatnumber(size,2) & "&nbsp;MB"		
	end if
	if size>1024 then
	   size=(size/1024)
	   showsize=formatnumber(size,2) & "&nbsp;GB"	   
	end if   
	response.write "<font face=verdana>" & showsize & "</font>"
end sub 	 	 	

Function Drawbar(drvpath)
	dim fso,drvpathroot,d,size,totalsize,barsize
	set fso=server.createobject("scripting.filesystemobject")
	drvpathroot=server.mappath("pic")
	drvpathroot=left(drvpathroot,(instrrev(drvpathroot,"\")-1))
	set d=fso.getfolder(drvpathroot)
	totalsize=d.size
	
	drvpath=server.mappath(drvpath) 		
	set d=fso.getfolder(drvpath)
	size=d.size
	
	barsize=cint((size/totalsize)*400)
	Drawbar=barsize
End Function 	

Function Drawspecialbar()
	dim fso,drvpathroot,d,fc,f1,size,totalsize,barsize
	set fso=server.createobject("scripting.filesystemobject")
	drvpathroot=server.mappath("pic")
	drvpathroot=left(drvpathroot,(instrrev(drvpathroot,"\")-1))
	set d=fso.getfolder(drvpathroot)
	totalsize=d.size
	
	set fc=d.files
	for each f1 in fc
		size=size+f1.size
	next	
	
	barsize=cint((size/totalsize)*400)
	Drawspecialbar=barsize
End Function 	
%>