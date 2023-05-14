<!--#include File="inc/Conn.asp" -->
<%
If Session("AdminName")="" and Session("adminpass")="" Then
Response.Redirect "Error.asp?id=005"
Else
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加企业幻灯片</title>
<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="kindeditor-4.1.10-l/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor-4.1.10-l/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor-4.1.10-l/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10-l/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10-l/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="body"]', {
				cssPath : 'kindeditor-4.1.10-l/plugins/code/prettify.css',
				uploadJson : 'kindeditor-4.1.10-l/asp/upload_json.asp',
				fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
			<script>
KindEditor.ready(function(K) {
  var editor = K.editor({
      fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'
  });
  K('#filemanager').click(function() {
      editor.loadPlugin('filemanager', function() {
          editor.plugin.filemanagerDialog({
              viewType : 'VIEW',
              dirName : 'image',
              clickFn : function(url, title) {
                  K('#url').val(url);
                  editor.hideDialog();
              }
          });
      });
  });
});
</script>
</head>
<body>
             <div class="box_top">
              <div align="center"><strong>添加企业幻灯片</strong></div>
            </div>
   <form onSubmit="return CheckForm();" action="?action=add" id="myform" class="jqtransform" name="myform" method="post">
<table width="90%" border="0" cellpadding="0" cellspacing="0" class="list_table">
    <tr>
      <td><div align="right"><font color="#FF0000">*</font>名称：</div></td>
      <td><input name="flashname" type="text" id="flashname" class="input-text" size="60" maxlength="150"></td>
    </tr>
    <TR>
      <TD><div align="right"><font color="#FF0000">*</font>图片地址：</div></TD>
      <TD><span class="b1_1">
        <input name="pic" type="text" class="input-text" id="url" size="50" maxlength="150">
        <input name="button2" type="button" id="filemanager" class="input-text" value="选择图库空间" />
        请上传图片图片类型为：jpg/jpeg/gif/png/bmp</span></TD>
    </TR>
    <TR>
      <TD><div align="right">上传图片：</div></TD>
      <TD><iframe src="upload.asp?action=simg" class="input-text lh30" width="400" height="28" frameborder="0" scrolling="no"></iframe></TD>
    </TR>
    <TR>
      <TD><div align="right">添加人：</div></TD>
      <TD><input  name=user class="input-text lh30" value=admin size=20 maxlength="22"></TD>
    </TR>
    <tr>
      <td><div align="right">链接：</div></td>
      <td><input  name="lianjie" class="input-text lh30" id="lianjie" value="#" size="60" maxlength="80" /></td>
    </tr>
 
    <tr> 
      <td><div align="right">添加时间：</div></td>
      <td><input name="sj" type="text" readonly class="input-text lh30" id="sj" value="<%=(Date)()%>" size="20" maxlength="19">&nbsp;  &nbsp;  <input type="submit" class="btn btn82 btn_save2"  name="Submit" value="确 定">
        &nbsp;  
       <input type="reset" class="btn btn82 btn_res" name="Submit2" value="重置">       </td>
    </tr>
</table>
</form> 
</body>
</html>
<%
end if
%>
<%
if request("action")="add" then
flashname=request.Form("flashname")
action=request.QueryString("action")
if action="add" then

set rsadd=server.CreateObject("adodb.recordset")
rsadd.open"select * from flash where flashname='"&flashname&"'",conn,1,3
if not rsadd.eof or not rsadd.bof then
response.Write("<script language=javascript>alert('有这篇企业幻灯片了，为了搜索引擎优化，请不要重名!');history.go(-1)</script>") 
response.End()
end if
end if

flashname=trim(request("flashname"))
pic=trim(request("pic"))
user=trim(request("user"))
lianjie=trim(request("lianjie"))
sj=trim(request("sj"))
if flashname=""  then 
response.Write("<script language=javascript>alert('企业幻灯片标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if pic=""  then 
response.Write("<script language=javascript>alert('企业幻灯片图片不能为空!');history.go(-1)</script>") 
response.end 
end if

set rs=server.CreateObject("ADODB.RecordSet")
Sql="Select * from flash"
Rs.Open Sql,Conn,1,3
Rs.AddNew
  rs("flashname")=flashname
  rs("pic")=pic
  rs("user")=user  
  rs("lianjie")=lianjie
  rs("sj")=sj
  rs.update
  rs.close
Set Rs = Nothing


set rs4=server.createobject("adodb.recordset")        
sql4="select top 1 * from flash order by id desc"       
SET Rs4=conn.execute(sql4)        
if not rs4.eof then         
do while not rs4.eof         
id=rs4("id")               
rs4.movenext         
loop         
end if         
rs4.close 

Response.Redirect "admin_flash.asp"
response.end
else
end if
response.end
%>
