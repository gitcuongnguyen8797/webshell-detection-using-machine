<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY{
BACKGROUND-COLOR: #e8f0ff;
font-size:9pt
}
.tx1 { height: 20px;font-size: 9pt; border: 1px solid; border-color: #000000; color: #0000FF}
-->
</style>

<SCRIPT language=javascript>
function check() 
{
	var strFileName=document.form1.FileName.value;
	var FileType;
	var ImgWH;
	if (strFileName=="")
	{
    	alert("请选择要上传的文件");
		document.form1.FileName.focus();
    	return false;
  	}
  	else
  	{
		FileType=strFileName.substr(strFileName.length-3)
		FileType=FileType.toLowerCase();
		if(FileType=="jpg" || FileType=="bmp" || FileType=="gif" || FileType=="png" )
		{
				document.form1.ImgWidth.value=0;
				document.form1.ImgHeight.value=0;
				document.form1.AlignType.value=0;
		}
		else if(FileType=="swf")
		{
				document.form1.ImgWidth.value=0;
				document.form1.ImgHeight.value=0;
		}
  	}
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0">
<form action="Upfile_Article_reply.asp" method="post" name="form1" onSubmit="return check()" enctype="multipart/form-data">
  <input name="FileName" type="FILE" class="tx1" size="20">
  <input type="submit" name="Submit" value="上传" style="border:1px double rgb(88,88,88);font:9pt">
  <input name="ImgWidth" type="hidden" id="ImgWidth">
  <input name="ImgHeight" type="hidden" id="ImgHeight">
  <input name="AlignType" type="hidden" id="AlignType">
</form>
</body>
</html>
