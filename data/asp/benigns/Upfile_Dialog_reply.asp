<!--#INCLUDE FILE="config.asp"-->
<%
Set rs=server.createobject("ADODB.RECORDSET")
rs.open "Select * From option1" ,Conn,1,1
MaxFileSize=rs("uploadsize")        '�ϴ��ļ���С����
Const SaveUpFilesPath="uploadreplay"        '����ϴ��ļ���Ŀ¼
rs.close
set rs=nothing
%>
<!--#include file="upfile_class.asp"-->
<%
const upload_type=0   '�ϴ�������0=������ϴ��࣬1=FSO�ϴ� 2=lyfupload��3=aspupload��4=chinaaspupload
const UpFileType_pic="jpg|gif|bmp|png"
const UpFileType_flash="swf"
const UpFileType_media="wmv|asf|avi|mpg"
const UpFileType_rm="ram|rm|ra"

dim upload,oFile,formName,SavePath,filename,fileExt,oFileSize
dim EnableUpload
dim UpFileType,arrUpFileType
dim ranNum
dim msg,FoundErr
dim DialogType
msg=""
FoundErr=false
EnableUpload=false
SavePath = SaveUpFilesPath   '����ϴ��ļ���Ŀ¼
if right(SavePath,1)<>"/" then SavePath=SavePath&"/" '��Ŀ¼���(/)
%>
<html>
<head>
<title>�ϴ��ļ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="editor_dialog.css">
</head>
<body bgColor=menu leftmargin="2" topmargin="5" marginwidth="0" marginheight="0">
<%
				call upload_0()  'ʹ�û���������ϴ���
%>
</body>
</html>
<%
sub upload_0()    'ʹ�û���������ϴ���
	set upload=new upfile_class ''�����ϴ�����
	upload.GetData(104857600)   'ȡ���ϴ�����,��������ϴ�100M
	if upload.err > 0 then  '�������
		select case upload.err
			case 1
				response.write "����ѡ����Ҫ�ϴ����ļ���"
			case 2
				response.write "���ϴ����ļ��ܴ�С������������ƣ�100M��"
		end select
		response.end
	end if
	DialogType=trim(upload.form("DialogType"))
	select case DialogType
	case "pic"
		UpFileType=UpFileType_pic
	case "flash"
		UpFileType=UpFileType_flash
	case "media"
		UpFileType=UpFileType_media
	case "rm"
		UpFileType=UpFileType_rm
	case else
		UpFileType=""
	end select
	for each formName in upload.file '�г������ϴ��˵��ļ�
		set ofile=upload.file(formName)  '����һ���ļ�����
		oFileSize=ofile.filesize
		if oFileSize<100 then
			msg="����ѡ����Ҫ�ϴ����ļ���"
			FoundErr=True
		elseif ofilesize>(MaxFileSize*1024) then
 			msg="�ļ���С���������ƣ����ֻ���ϴ�" & CStr(MaxFileSize) & "K���ļ���"
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
		if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" then
			EnableUpload=false
		end if
		if EnableUpload=false then
			msg="�����ļ����Ͳ������ϴ���\n\nֻ�����ϴ��⼸���ļ����ͣ�" & UpFileType
			FoundErr=true
		end if
		
		
		strJS="<SCRIPT language=javascript>" & vbcrlf
		if FoundErr<>true then
			randomize
			ranNum=int(900*rnd)+100
			filename=SavePath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt

			ofile.SaveToFile Server.mappath(FileName)   '�����ļ�

			response.write "�ļ��ϴ��ɹ���"
			strJS=strJS & "parent.document.form1.url.value='" & fileName & "';" & vbcrlf
			strJS=strJS & "parent.document.form1.UpFileName.value='" & fileName & "';" & vbcrlf
		else
			strJS=strJS & "alert('" & msg & "');" & vbcrlf
			strJS=strJS & "window.location='Upload_Dialog.asp?DialogType=" & DialogType & "';" & vbcrlf
		end if
		strJS=strJS & "</script>" & vbcrlf
		response.write strJS
		
		set file=nothing
	next
	set upload=nothing
end sub
%>