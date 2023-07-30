<!--#include File="inc/Conn.asp" -->
<%
Set OO00OO00OO=Response:Set OO00OO00O0=Request:Set OO00OO0OO=Session:Set OO00OO000O=Application:Set OO00OO0O0=Server
If OO00OO0OO("AdminName")="" and OO00OO0OO("adminpass")="" Then
OO00OO00OO.Redirect "Error.asp?id=005"
Else
Sql="Select * from honor where ID="&OO00OO00O0("ID")
Set Rs1=OO00OO0O0.Createobject("Adodb.Recordset")
Rs1.open Sql,Conn, (13 * 42 - 545), (13 * 42 - 545)
if rs1.bof or rs1.eof then
OO00OO00OO.Write"<center>暂无产荣誉<a href='admin_honor_add.asp'><font color=red>添加荣誉!</a></center>"
OO00OO00OO.end
else
end if
OO00OO00OO.Write(vbCrLf)
OO00OO00OO.Write("<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbCrLf)
OO00OO00OO.Write("<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbCrLf)
OO00OO00OO.Write("<head>" & vbCrLf)
OO00OO00OO.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"" />" & vbCrLf)
OO00OO00OO.Write("<title>修改数据</title>" & vbCrLf)
OO00OO00OO.Write("    <link rel=""stylesheet"" href=""css/main.css"">" & vbCrLf)
OO00OO00OO.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/themes/default/default.css"" />" & vbCrLf)
OO00OO00OO.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/plugins/code/prettify.css"" />" & vbCrLf)
OO00OO00OO.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/kindeditor.js""></script>" & vbCrLf)
OO00OO00OO.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/lang/zh_CN.js""></script>" & vbCrLf)
OO00OO00OO.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/plugins/code/prettify.js""></script>" & vbCrLf)
OO00OO00OO.Write("	<script>" & vbCrLf)
OO00OO00OO.Write("		KindEditor.ready(function(K) {" & vbCrLf)
OO00OO00OO.Write("			var editor1 = K.create('textarea[name=""body""]', {" & vbCrLf)
OO00OO00OO.Write("				cssPath : 'kindeditor-4.1.10-l/plugins/code/prettify.css'," & vbCrLf)
OO00OO00OO.Write("				uploadJson : 'kindeditor-4.1.10-l/asp/upload_json.asp'," & vbCrLf)
OO00OO00OO.Write("				fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'," & vbCrLf)
OO00OO00OO.Write("				allowFileManager : true," & vbCrLf)
OO00OO00OO.Write("				afterCreate : function() {" & vbCrLf)
OO00OO00OO.Write("					var self = this;" & vbCrLf)
OO00OO00OO.Write("					K.ctrl(document, 13, function() {" & vbCrLf)
OO00OO00OO.Write("						self.sync();" & vbCrLf)
OO00OO00OO.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO00OO00OO.Write("					});" & vbCrLf)
OO00OO00OO.Write("					K.ctrl(self.edit.doc, 13, function() {" & vbCrLf)
OO00OO00OO.Write("						self.sync();" & vbCrLf)
OO00OO00OO.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO00OO00OO.Write("					});" & vbCrLf)
OO00OO00OO.Write("				}" & vbCrLf)
OO00OO00OO.Write("			});" & vbCrLf)
OO00OO00OO.Write("			prettyPrint();" & vbCrLf)
OO00OO00OO.Write("		});" & vbCrLf)
OO00OO00OO.Write("	</script>" & vbCrLf)
OO00OO00OO.Write("		<script>" & vbCrLf)
OO00OO00OO.Write("KindEditor.ready(function(K) {" & vbCrLf)
OO00OO00OO.Write("  var editor = K.editor({" & vbCrLf)
OO00OO00OO.Write("      fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'" & vbCrLf)
OO00OO00OO.Write("  });" & vbCrLf)
OO00OO00OO.Write("  K('#filemanager').click(function() {" & vbCrLf)
OO00OO00OO.Write("      editor.loadPlugin('filemanager', function() {" & vbCrLf)
OO00OO00OO.Write("          editor.plugin.filemanagerDialog({" & vbCrLf)
OO00OO00OO.Write("              viewType : 'VIEW'," & vbCrLf)
OO00OO00OO.Write("              dirName : 'image'," & vbCrLf)
OO00OO00OO.Write("              clickFn : function(url, title) {" & vbCrLf)
OO00OO00OO.Write("                  K('#url').val(url);" & vbCrLf)
OO00OO00OO.Write("                  editor.hideDialog();" & vbCrLf)
OO00OO00OO.Write("              }" & vbCrLf)
OO00OO00OO.Write("          });" & vbCrLf)
OO00OO00OO.Write("      });" & vbCrLf)
OO00OO00OO.Write("  });" & vbCrLf)
OO00OO00OO.Write("});" & vbCrLf)
OO00OO00OO.Write("</script>" & vbCrLf)
OO00OO00OO.Write("</head>" & vbCrLf)
OO00OO00OO.Write("<body>" & vbCrLf)
OO00OO00OO.Write("            <div class=""box_top"">" & vbCrLf)
OO00OO00OO.Write("              <div align=""center""> 修改")
OO00OO00OO.Write rs1("honorname")
OO00OO00OO.Write("</div>" & vbCrLf)
OO00OO00OO.Write("            </div>" & vbCrLf)
OO00OO00OO.Write("            <div class=""box_center"">" & vbCrLf)
OO00OO00OO.Write("  <form id=""myform"" name=""myform""  method=""post"" action=""?action=edit&id=")
OO00OO00OO.Write OO00OO00O0("id")
OO00OO00OO.Write(""">" & vbCrLf)
OO00OO00OO.Write("<table width=""90%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""list_table"">" & vbCrLf)
OO00OO00OO.Write("    <tr>" & vbCrLf)
OO00OO00OO.Write("      <td width=""20%""><div align=""right"">荣誉名称：</div></td>" & vbCrLf)
OO00OO00OO.Write("      <td width=""45%""><input name=""honorname"" class=""input-text lh30"" type=""text"" id=""honorname"" value=""")
OO00OO00OO.Write rs1("honorname")
OO00OO00OO.Write(""" size=""40"" maxlength=""150""></td>" & vbCrLf)
OO00OO00OO.Write("      <td width=""35%"" rowspan=""4""><a href=""")
OO00OO00OO.Write rs1("pic")
OO00OO00OO.Write(""" target=""_blank""><img src=""")
OO00OO00OO.Write rs1("pic")
OO00OO00OO.Write(""" alt=""点击放大"" width=""270"" height=""200"" border=""0""></a></td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("    <tr>" & vbCrLf)
OO00OO00OO.Write("      <td><div align=""right"">图片：</div></td>" & vbCrLf)
OO00OO00OO.Write("      <td><input name=""pic"" type=""text"" class=""input-text lh30""  id=""url"" value=""")
OO00OO00OO.Write rs1("pic")
OO00OO00OO.Write(""" size=""50"" maxlength=""150"">" & vbCrLf)
OO00OO00OO.Write("      <input name=""button2"" type=""button"" id=""filemanager"" class=""input-text lh30"" value=""选取已上传图片"" /></td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("    <tr>" & vbCrLf)
OO00OO00OO.Write("      <td><div align=""right"">重新上传新图片：</div></td>" & vbCrLf)
OO00OO00OO.Write("      <td><iframe src=""upload.asp?action=simg"" class=""input-text lh30"" width=""350"" height=""25"" frameborder=""0"" scrolling=""no""></iframe></td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("    <tr>" & vbCrLf)
OO00OO00OO.Write("      <td><div align=""right"">添加人：</div></td>" & vbCrLf)
OO00OO00OO.Write("      <td><input name=""user"" type=""text"" class=""input-text lh30"" id=""user"" value=""")
OO00OO00OO.Write rs1("user")
OO00OO00OO.Write(""" size=""22"" maxlength=""22""></td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("    <tr> " & vbCrLf)
OO00OO00OO.Write("      <td> <div align=""right"">内容简介：</div></td>" & vbCrLf)
OO00OO00OO.Write("      <td colspan=""4""><textarea name=""body"" style=""width:80%;height:400px;visibility:hidden;"">")
OO00OO00OO.Write rs1("body")
OO00OO00OO.Write("</textarea></td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("    <tr> " & vbCrLf)
OO00OO00OO.Write("      <td><div align=""right"">发布时间：</div></td>" & vbCrLf)
OO00OO00OO.Write("      <td colspan=""4""><span class=""td"">" & vbCrLf)
OO00OO00OO.Write("        <input name=""sj"" type=""text"" class=""input-text lh30"" id=""sj"" value=""")
OO00OO00OO.Write rs1("sj")
OO00OO00OO.Write(""" size=""22"" maxlength=""22""  />" & vbCrLf)
OO00OO00OO.Write("        <input name=button type=button class=""input-text lh30"" onClick=""document.myform.sj.value='")
OO00OO00OO.Write (date())
OO00OO00OO.Write("'"" value=""设为当前时间"">" & vbCrLf)
OO00OO00OO.Write("      (请输入正确的日期格式)</span></td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("    <tr> " & vbCrLf)
OO00OO00OO.Write("      <td>&nbsp;</td>" & vbCrLf)
OO00OO00OO.Write("      <td><input type=""submit"" class=""btn btn82 btn_save2"" name=""Submit"" value=""确 定""></td>" & vbCrLf)
OO00OO00OO.Write("      <td>&nbsp;</td>" & vbCrLf)
OO00OO00OO.Write("    </tr>" & vbCrLf)
OO00OO00OO.Write("</table>  " & vbCrLf)
OO00OO00OO.Write("</form>" & vbCrLf)
OO00OO00OO.Write(" " & vbCrLf)
OO00OO00OO.Write("</body>" & vbCrLf)
OO00OO00OO.Write("</html>" & vbCrLf)
Rs1.Close
Set Rs1=nothing
end if
OO00OO00OO.Write(vbCrLf)
OO00OO00OO.Write("<!--修改 -->" & vbCrLf)
if OO00OO00O0("action")="edit" then
if OO00OO00O0("id")="" then
OO00OO00OO.write "参数不正确<a href=admin_honor_edit.asp?id="&OO00OO00O0("id")&">返回</a>"
OO00OO00OO.end
end if
honorname=trim(OO00OO00O0("honorname"))
user=trim(OO00OO00O0("user"))
pic=trim(OO00OO00O0("pic"))
body=trim(OO00OO00O0("body"))
sj=trim(OO00OO00O0("sj"))
Set Rs=OO00OO0O0.Createobject("Adodb.Recordset")
Sql="Select * from honor Where ID="&OO00OO00O0("ID")
Rs.open Sql,Conn, (13 * 42 - 545), (53 * 32 - 1693)
if rs.eof and rs.bof then
OO00OO00OO.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>"
OO00OO00OO.End()
end if
if honorname=""  then
OO00OO00OO.Write("<script language=javascript>alert('荣誉标题不能为空!');history.go(-1)</script>")
OO00OO00OO.end
end if
if pic=""  then
OO00OO00OO.Write("<script language=javascript>alert('荣誉 图片 不能为空!');history.go(-1)</script>")
OO00OO00OO.end
end if
rs("honorname")=honorname
rs("pic")=pic
rs("user")=user
rs("body")=body
rs("sj")=sj
rs.update
rs.close
Set Rs = Nothing
Conn.Close
Set Conn=nothing
OO00OO00OO.Redirect "admin_honor.asp"
OO00OO00OO.end
end if
%>