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
<title>�����ҵ����</title>
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
              <div align="center"><strong>�����ҵ����</strong></div>
            </div>
   <form onSubmit="return CheckForm();" action="?action=add" id="myform" class="jqtransform" name="myform" method="post">
<table width="90%" border="0" cellpadding="0" cellspacing="0" class="list_table">
    <tr>
      <td><div align="right">���ƣ�</div></td>
      <td><input name="honorname" type="text" id="honorname" class="input-text" size="60" maxlength="150"></td>
    </tr>
    <TR>
      <TD><div align="right">ͼƬ��ַ��</div></TD>
      <TD><span class="b1_1">
        <input name="pic" type="text" class="input-text" id="url" size="50" maxlength="150">
        <input name="button2" type="button" id="filemanager" class="input-text" value="ѡ��ͼ��ռ�" />
        ���ϴ�ͼƬͼƬ����Ϊ��jpg/jpeg/gif/png/bmp</span></TD>
    </TR>
    <TR>
      <TD><div align="right">�ϴ�ͼƬ��</div></TD>
      <TD><iframe src="upload.asp?action=simg" class="input-text lh30" width="400" height="28" frameborder="0" scrolling="no"></iframe></TD>
    </TR>
    <TR>
      <TD><div align="right">����ˣ�</div></TD>
      <TD><input  name=user class="input-text lh30" value=<%=session("AdminName")%> size=20 maxlength="22"></TD>
    </TR>
    <tr>
      <td><div align="right">���ݼ�飺</div></td>
      <td><textarea name="body" style="width:700px;height:400px;visibility:hidden;"></textarea></td>
    </tr>
    <tr></td>
    </tr>
    <tr> 
      <td><div align="right">���ʱ�䣺</div></td>
      <td><input name="sj" type="text" readonly class="input-text lh30" id="sj" value="<%=(Date)()%>" size="20" maxlength="19">&nbsp;  &nbsp;  <input type="submit" class="btn btn82 btn_save2"  name="Submit" value="ȷ ��">
        &nbsp;  
       <input type="reset" class="btn btn82 btn_res" name="Submit2" value="����">       </td>
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
honorname=request.Form("honorname")
action=request.QueryString("action")
if action="add" then

set rsadd=server.CreateObject("adodb.recordset")
rsadd.open"select * from honor where honorname='"&honorname&"'",conn,1,3
if not rsadd.eof or not rsadd.bof then
response.Write("<script language=javascript>alert('����ƪ��ҵ�����ˣ�Ϊ�����������Ż����벻Ҫ����!');history.go(-1)</script>") 
response.End()
end if
end if

honorname=trim(request("honorname"))
pic=trim(request("pic"))
user=trim(request("user"))
body=trim(request("body"))
sj=trim(request("sj"))
if honorname=""  then 
response.Write("<script language=javascript>alert('��ҵ�������ⲻ��Ϊ��!');history.go(-1)</script>") 
response.end 
end if
if pic=""  then 
response.Write("<script language=javascript>alert('��ҵ����ͼƬ����Ϊ��!');history.go(-1)</script>") 
response.end 
end if

response.Write("<script language=javascript>alert('��ӳɹ�');history.go(-1)</script>") 
end if
response.end
%>
