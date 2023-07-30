<!--#include file="Mo.Lib.Upload.asp"-->
<style>
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<%
dim Upload,File,returnValue,uploadResult
const UploadPath ="../upload/"
set Upload = new MoLibUpload
Upload.AllowFileTypes = "*.rar;*.jpg;*.bmp;*.gif;*.zip;*.flv;*.png;*.doc;*.7z;*.xls;*.doc;*.docx;*.ppt;*.flv;*.mpg;*mp4;*.wmv"
Upload.AllowMaxFileSize = "512MB"
Upload.AllowMaxSize = "512mb"
Upload.CharSet = "GB2312"
uploadResult = false
if not Upload.GetData() then 
	returnValue = Upload.Description
else
	Upload.SavePath =UploadPath
	Set File = Upload.Save("file1",0,true)
	if File.Succeed then
		uploadResult = true
		returnValue = File.FileName
	else
		returnValue = File.Exception
	end if
end if
returnValue = Replace(UploadPath,"../","") & returnValue
set Upload = nothing
%>
<script type="text/javascript">
window.parent.callback(<%=lcase(uploadResult)%>,"<%=replace(returnValue,"""","\""")%>");
</script>
<a href="javascript:window.history.back(0);" style="font-size: 9pt; font-family: ËÎÌå">·µ»Ø</a>
