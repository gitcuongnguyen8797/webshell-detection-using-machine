 <!--#include File="inc/Conn.asp" -->
<%
 Set OO00OO0O00=Response:Set OO00OO0OO=Request:Set OO00OO0OO0=Session:Set OO00OO0O0=Application:Set OO00OO0O0O=Server
If OO00OO0OO0("AdminName")="" and OO00OO0OO0("adminpass")="" Then
OO00OO0O00.Redirect "Error.asp?id=005"
Else
Sql="Select * from anli where ID="&OO00OO0OO("ID")
Set Rs1=OO00OO0O0O.Createobject("Adodb.Recordset")
Rs1.open Sql,Conn, (52 * 95 - 4939), (52 * 95 - 4939)
if rs1.bof or rs1.eof then
OO00OO0O00.Write"<center>暂无产案例<a href='admin_anli_add.asp'><font color=red>添加案例!</a></center>"
OO00OO0O00.end
else
end if
OO00OO0O00.Write(vbCrLf)
OO00OO0O00.Write("<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbCrLf)
OO00OO0O00.Write("<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbCrLf)
OO00OO0O00.Write("<head>" & vbCrLf)
OO00OO0O00.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"" />" & vbCrLf)
OO00OO0O00.Write("<title>修改数据</title>" & vbCrLf)
OO00OO0O00.Write("    <link rel=""stylesheet"" href=""css/main.css"">" & vbCrLf)
OO00OO0O00.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/themes/default/default.css"" />" & vbCrLf)
OO00OO0O00.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/plugins/code/prettify.css"" />" & vbCrLf)
OO00OO0O00.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/kindeditor.js""></script>" & vbCrLf)
OO00OO0O00.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/lang/zh_CN.js""></script>" & vbCrLf)
OO00OO0O00.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/plugins/code/prettify.js""></script>" & vbCrLf)
OO00OO0O00.Write("	<script>" & vbCrLf)
OO00OO0O00.Write("		KindEditor.ready(function(K) {" & vbCrLf)
OO00OO0O00.Write("			var editor1 = K.create('textarea[name=""body""]', {" & vbCrLf)
OO00OO0O00.Write("				cssPath : 'kindeditor-4.1.10-l/plugins/code/prettify.css'," & vbCrLf)
OO00OO0O00.Write("				uploadJson : 'kindeditor-4.1.10-l/asp/upload_json.asp'," & vbCrLf)
OO00OO0O00.Write("				fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'," & vbCrLf)
OO00OO0O00.Write("				allowFileManager : true," & vbCrLf)
OO00OO0O00.Write("				afterCreate : function() {" & vbCrLf)
OO00OO0O00.Write("					var self = this;" & vbCrLf)
OO00OO0O00.Write("					K.ctrl(document, 13, function() {" & vbCrLf)
OO00OO0O00.Write("						self.sync();" & vbCrLf)
OO00OO0O00.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO00OO0O00.Write("					});" & vbCrLf)
OO00OO0O00.Write("					K.ctrl(self.edit.doc, 13, function() {" & vbCrLf)
OO00OO0O00.Write("						self.sync();" & vbCrLf)
OO00OO0O00.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO00OO0O00.Write("					});" & vbCrLf)
OO00OO0O00.Write("				}" & vbCrLf)
OO00OO0O00.Write("			});" & vbCrLf)
OO00OO0O00.Write("			prettyPrint();" & vbCrLf)
OO00OO0O00.Write("		});" & vbCrLf)
OO00OO0O00.Write("	</script>" & vbCrLf)
OO00OO0O00.Write("		<script>" & vbCrLf)
OO00OO0O00.Write("KindEditor.ready(function(K) {" & vbCrLf)
OO00OO0O00.Write("  var editor = K.editor({" & vbCrLf)
OO00OO0O00.Write("      fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'" & vbCrLf)
OO00OO0O00.Write("  });" & vbCrLf)
OO00OO0O00.Write("  K('#filemanager').click(function() {" & vbCrLf)
OO00OO0O00.Write("      editor.loadPlugin('filemanager', function() {" & vbCrLf)
OO00OO0O00.Write("          editor.plugin.filemanagerDialog({" & vbCrLf)
OO00OO0O00.Write("              viewType : 'VIEW'," & vbCrLf)
OO00OO0O00.Write("              dirName : 'image'," & vbCrLf)
OO00OO0O00.Write("              clickFn : function(url, title) {" & vbCrLf)
OO00OO0O00.Write("                  K('#url').val(url);" & vbCrLf)
OO00OO0O00.Write("                  editor.hideDialog();" & vbCrLf)
OO00OO0O00.Write("              }" & vbCrLf)
OO00OO0O00.Write("          });" & vbCrLf)
OO00OO0O00.Write("      });" & vbCrLf)
OO00OO0O00.Write("  });" & vbCrLf)
OO00OO0O00.Write("});" & vbCrLf)
OO00OO0O00.Write("</script>" & vbCrLf)
OO00OO0O00.Write("</head>" & vbCrLf)
OO00OO0O00.Write("<body>" & vbCrLf)
OO00OO0O00.Write("            <div class=""box_top"">" & vbCrLf)
OO00OO0O00.Write("              <div align=""center""> 修改")
OO00OO0O00.Write rs1("anliname")
OO00OO0O00.Write("</div>" & vbCrLf)
OO00OO0O00.Write("            </div>" & vbCrLf)
OO00OO0O00.Write("            <div class=""box_center"">" & vbCrLf)
OO00OO0O00.Write("  <form id=""myform"" name=""myform""  method=""post"" action=""?action=edit&id=")
OO00OO0O00.Write OO00OO0OO("id")
OO00OO0O00.Write(""">" & vbCrLf)
OO00OO0O00.Write("<table width=""90%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""list_table"">" & vbCrLf)
OO00OO0O00.Write("    <tr>" & vbCrLf)
OO00OO0O00.Write("      <td width=""20%""><div align=""right"">案例名称：</div></td>" & vbCrLf)
OO00OO0O00.Write("      <td width=""45%""><input name=""anliname"" class=""input-text lh30"" type=""text"" id=""anliname"" value=""")
OO00OO0O00.Write rs1("anliname")
OO00OO0O00.Write(""" size=""40"" maxlength=""150""></td>" & vbCrLf)
OO00OO0O00.Write("      <td width=""35%"" rowspan=""4""><a href=""")
OO00OO0O00.Write rs1("pic")
OO00OO0O00.Write(""" target=""_blank""><img src=""")
OO00OO0O00.Write rs1("pic")
OO00OO0O00.Write(""" alt=""点击放大"" width=""270"" height=""200"" border=""0""></a></td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("    <tr>" & vbCrLf)
OO00OO0O00.Write("      <td><div align=""right"">图片：</div></td>" & vbCrLf)
OO00OO0O00.Write("      <td><input name=""pic"" type=""text"" class=""input-text lh30""  id=""url"" value=""")
OO00OO0O00.Write rs1("pic")
OO00OO0O00.Write(""" size=""50"" maxlength=""150"">" & vbCrLf)
OO00OO0O00.Write("      <input name=""button2"" type=""button"" id=""filemanager"" class=""input-text lh30"" value=""选取已上传图片"" /></td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("    <tr>" & vbCrLf)
OO00OO0O00.Write("      <td><div align=""right"">重新上传新图片：</div></td>" & vbCrLf)
OO00OO0O00.Write("      <td><iframe src=""upload.asp?action=simg"" class=""input-text lh30"" width=""350"" height=""25"" frameborder=""0"" scrolling=""no""></iframe></td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("    <tr>" & vbCrLf)
OO00OO0O00.Write("      <td><div align=""right"">添加人：</div></td>" & vbCrLf)
OO00OO0O00.Write("      <td><input name=""user"" type=""text"" class=""input-text lh30"" id=""user"" value=""")
OO00OO0O00.Write rs1("user")
OO00OO0O00.Write(""" size=""22"" maxlength=""22""></td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("    <tr> " & vbCrLf)
OO00OO0O00.Write("      <td> <div align=""right"">内容简介：</div></td>" & vbCrLf)
OO00OO0O00.Write("      <td colspan=""4""><textarea name=""body"" style=""width:80%;height:400px;visibility:hidden;"">")
OO00OO0O00.Write rs1("body")
OO00OO0O00.Write("</textarea></td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("    <tr> " & vbCrLf)
OO00OO0O00.Write("      <td><div align=""right"">发布时间：</div></td>" & vbCrLf)
OO00OO0O00.Write("      <td colspan=""4""><span class=""td"">" & vbCrLf)
OO00OO0O00.Write("        <input name=""sj"" type=""text"" class=""input-text lh30"" id=""sj"" value=""")
OO00OO0O00.Write rs1("sj")
OO00OO0O00.Write(""" size=""22"" maxlength=""22""  />" & vbCrLf)
OO00OO0O00.Write("        <input name=button type=button class=""input-text lh30"" onClick=""document.myform.sj.value='")
OO00OO0O00.Write (date())
OO00OO0O00.Write("'"" value=""设为当前时间"">" & vbCrLf)
OO00OO0O00.Write("      (请输入正确的日期格式)</span></td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("    <tr> " & vbCrLf)
OO00OO0O00.Write("      <td>&nbsp;</td>" & vbCrLf)
OO00OO0O00.Write("      <td><input type=""submit"" class=""btn btn82 btn_save2"" name=""Submit"" value=""确 定""></td>" & vbCrLf)
OO00OO0O00.Write("      <td>&nbsp;</td>" & vbCrLf)
OO00OO0O00.Write("    </tr>" & vbCrLf)
OO00OO0O00.Write("</table>  " & vbCrLf)
OO00OO0O00.Write("</form>" & vbCrLf)
OO00OO0O00.Write(" " & vbCrLf)
OO00OO0O00.Write("</body>" & vbCrLf)
OO00OO0O00.Write("</html>" & vbCrLf)
Rs1.Close
Set Rs1=nothing
end if
OO00OO0O00.Write(vbCrLf)
OO00OO0O00.Write("<!--修改 -->" & vbCrLf)
if OO00OO0OO("action")="edit" then
if OO00OO0OO("id")="" then
OO00OO0O00.write "参数不正确<a href=admin_anli_edit.asp?id="&OO00OO0OO("id")&">返回</a>"
OO00OO0O00.end
end if
anliname=trim(OO00OO0OO("anliname"))
user=trim(OO00OO0OO("user"))
pic=trim(OO00OO0OO("pic"))
body=trim(OO00OO0OO("body"))
sj=trim(OO00OO0OO("sj"))
Set Rs=OO00OO0O0O.Createobject("Adodb.Recordset")
Sql="Select * from anli Where ID="&OO00OO0OO("ID")
Rs.open Sql,Conn, (52 * 95 - 4939), (76 * 89 - 6761)
if rs.eof and rs.bof then
OO00OO0O00.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>"
OO00OO0O00.End()
end if
if anliname=""  then
OO00OO0O00.Write("<script language=javascript>alert('案例标题不能为空!');history.go(-1)</script>")
OO00OO0O00.end
end if
if pic=""  then
OO00OO0O00.Write("<script language=javascript>alert('案例 图片 不能为空!');history.go(-1)</script>")
OO00OO0O00.end
end if
rs("anliname")=anliname
rs("pic")=pic
rs("user")=user
rs("body")=body
rs("sj")=sj
rs.update
rs.close
Set Rs = Nothing
Conn.Close
Set Conn=nothing
OO00OO0O00.Redirect "admin_anli.asp"
OO00OO0O00.end
end if
%>