<%@language=vbscript codepage=936 %>
<html>
<head>
<title>系统空间占用情况</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td {
	font-size: 12px;
}
-->
</style>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<%
	call SpaceSize()
%>
<%
sub SpaceSize()
	on error resume next
%>
<br>
<table width="90%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
	<tr class="tablebg<%=skin%>a"> 
		<td height="22" align="center" valign="middle"><b>系统空间占用情况</b></td>
	</tr>
  <tr class="tablebg<%=skin%>d"> 
    <td width="100%" height="86" valign="middle">
	<blockquote>
	  <table width="80%" border="0">
<%
 set fo=Server.CreateObject("Scripting.FileSystemObject")
 set gFolder=fo.GetFolder(Server.mappath("./"))
 for each theFolder in gFolder.SubFolders
 %>
        <tr>
          <td width="26%"><%=response.write(theFolder.Name&"：")%></td>
          <td width="74%">&nbsp;<img src="bar.gif" width=<%=drawbar(theFolder.Name)%> height=10>&nbsp;<%showSpaceinfo(theFolder.Name)%></td>
        </tr>
 <%next%>
        <tr>
          <td width="26%">当前目录下文件占用空间：</td>
          <td width="74%">&nbsp;<img src="bar.gif" width=<%=drawspecialbar%> height=10>&nbsp;<%showSpecialSpaceinfo("Program")%></td>
        </tr>
      
        <tr>
          <td width="26%">系统占用空间总计：</td>
          <td width="74%">&nbsp;<img src="bar.gif" width=400 height=10>&nbsp; <%showspecialspaceinfo("All")%></td>
        </tr>
	  </table>
    </td>
  </tr>
  <tr class="tablebg<%=skin%>d">
    <td height="21" valign="middle"><div align="center">程序制作：桃源工作室</div></td>
  </tr>
</table>
<br>
<%
end sub
%>
</body>
</html>
<%
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

%>