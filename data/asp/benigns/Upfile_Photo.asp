<%@language=vbscript codepage=936 %>
<!--#include file="config.asp"-->
<!--#include file="Upfile_class.asp"-->
<%
const upload_type=0   '上传方法：0=无惧无组件上传类，1=FSO上传 2=lyfupload，3=aspupload，4=chinaaspupload
const SaveUpFilesPath="uploadface"
const UpFileType="jpg|gif|bmp|png|swf"
const MaxFileSize=102400

dim upload,oFile,formName,SavePath,filename,fileExt,oFileSize
dim EnableUpload
dim arrUpFileType
dim ranNum
dim msg,FoundErr
dim PhotoUrlID
msg=""
FoundErr=false
EnableUpload=false
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY{
BACKGROUND-COLOR: #E8F0FF;
font-size:9pt
}
.tx1 { height: 20px;font-size: 9pt; border: 1px solid; border-color: #000000; color: #0000FF}
-->
</style>
</head>
<body leftmargin="2" topmargin="5" marginwidth="0" marginheight="0">
<%
call upload_0()
%>
</body>
</html>
<%
sub upload_0()
	set upload=new upfile_class 
	upload.GetData(104857600) 
	if upload.err > 0 then 
		select case upload.err
			case 1
				response.write "请先选择你要上传的文件！"
			case 2
				response.write "你上传的文件总大小超出了最大限制（100M）"
		end select
		response.end
	end if
	PhotoUrlID=Clng(trim(upload.form("PhotoUrlID")))
	SavePath = SaveUpFilesPath
	if right(SavePath,1)<>"/" then SavePath=SavePath&"/"
	for each formName in upload.file
		EnableUpload=False
		set ofile=upload.file(formName)
		oFileSize=ofile.filesize
		if oFileSize<100 then
			msg="请先选择你要上传的文件！"
			FoundErr=True
		elseif oFileSize>(MaxFileSize*1024) then
 			msg="文件大小超过了限制，最大只能上传" & CStr(MaxFileSize) & "K的文件！"
			FoundErr=true
		end if

		fileExt=lcase(ofile.FileExt)
		arrUpFileType=split(UpFileType,"|")
		for i=0 to ubound(arrUpFileType)
			if fileEXT=trim(arrUpFileType(i)) then
				EnableUpload=true
				exit for
			end if
		next
		if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" or fileEXT="cer" or fileEXT="cdx" then
			EnableUpload=false
		end if
		if EnableUpload=false then
			msg="这种文件类型不允许上传！\n\n只允许上传这几种文件类型：" & UpFileType
			FoundErr=true
		end if
		
		
		strJS="<SCRIPT language=javascript>" & vbcrlf
		if FoundErr<>true then
			randomize
			ranNum=int(900*rnd)+100
			if upload.form("id")="" then
				filename=SavePath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
			else
				Set rs=server.createobject("ADODB.RECORDSET")
				rs.open "Select * From register where id=" &upload.form("id"),Conn,1,1
				if rs("myface")<>"" then
					filename=rs("myface")
				else
					filename=SavePath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
				end if
				rs.close
			end if

			ofile.SaveToFile Server.mappath(FileName)   '保存文件

			response.write "图片上传成功！图片大小为：" & cstr(round(oFileSize/1024)) & "K"
			strJS=strJS & "parent.document.form.myface.value='" & fileName & "';" & vbcrlf
			strJS=strJS & "parent.document.form.idface.src='" & fileName & "';" & vbcrlf
		else
			strJS=strJS & "alert('" & msg & "');" & vbcrlf
		  	strJS=strJS & "history.go(-1);" & vbcrlf
		end if
		set file=nothing
	next
		strJS=strJS & "</script>" & vbcrlf
		response.write strJS
	set upload=nothing
end sub
%>
