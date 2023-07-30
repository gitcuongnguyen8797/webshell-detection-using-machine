<!--#include File="inc/Conn.asp" -->
<%
 Set OOO00=Response:Set OO0OOO=Request:Set OOO000=Session:Set OO0OO0=Application:Set OOO0O=Server
If OOO000("AdminName")="" and OOO000("adminpass")="" Then
OOO00.Redirect "Error.asp?id=005"
Else
Sql="Select * From news where ID="&OO0OOO("ID")
Set Rs1=OOO0O.Createobject("Adodb.Recordset")
Rs1.open Sql,Conn, (102 * 21 - 2141), (102 * 21 - 2141)
if rs1.bof or rs1.eof then
OOO00.Write"<center>暂无产新闻<a href='admin_news_add.asp'><font color=red>添加新闻!</a></center>"
OOO00.end
else
end if
OOO00.Write(vbCrLf)
OOO00.Write("<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbCrLf)
OOO00.Write("<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbCrLf)
OOO00.Write("<head>" & vbCrLf)
OOO00.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"" />" & vbCrLf)
OOO00.Write("<title>修改数据</title>" & vbCrLf)
OOO00.Write("    <link rel=""stylesheet"" href=""css/main.css"">" & vbCrLf)
OOO00.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/themes/default/default.css"" />" & vbCrLf)
OOO00.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/plugins/code/prettify.css"" />" & vbCrLf)
OOO00.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/kindeditor.js""></script>" & vbCrLf)
OOO00.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/lang/zh_CN.js""></script>" & vbCrLf)
OOO00.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/plugins/code/prettify.js""></script>" & vbCrLf)
OOO00.Write("	<script>" & vbCrLf)
OOO00.Write("		KindEditor.ready(function(K) {" & vbCrLf)
OOO00.Write("			var editor1 = K.create('textarea[name=""body""]', {" & vbCrLf)
OOO00.Write("				cssPath : 'kindeditor-4.1.10-l/plugins/code/prettify.css'," & vbCrLf)
OOO00.Write("				uploadJson : 'kindeditor-4.1.10-l/asp/upload_json.asp'," & vbCrLf)
OOO00.Write("				fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'," & vbCrLf)
OOO00.Write("				allowFileManager : true," & vbCrLf)
OOO00.Write("				afterCreate : function() {" & vbCrLf)
OOO00.Write("					var self = this;" & vbCrLf)
OOO00.Write("					K.ctrl(document, 13, function() {" & vbCrLf)
OOO00.Write("						self.sync();" & vbCrLf)
OOO00.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OOO00.Write("					});" & vbCrLf)
OOO00.Write("					K.ctrl(self.edit.doc, 13, function() {" & vbCrLf)
OOO00.Write("						self.sync();" & vbCrLf)
OOO00.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OOO00.Write("					});" & vbCrLf)
OOO00.Write("				}" & vbCrLf)
OOO00.Write("			});" & vbCrLf)
OOO00.Write("			prettyPrint();" & vbCrLf)
OOO00.Write("		});" & vbCrLf)
OOO00.Write("	</script>" & vbCrLf)
OOO00.Write("	" & vbCrLf)
OOO00.Write("	<script>" & vbCrLf)
OOO00.Write("KindEditor.ready(function(K) {" & vbCrLf)
OOO00.Write("  var editor = K.editor({" & vbCrLf)
OOO00.Write("      fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'" & vbCrLf)
OOO00.Write("  });" & vbCrLf)
OOO00.Write("  K('#filemanager').click(function() {" & vbCrLf)
OOO00.Write("      editor.loadPlugin('filemanager', function() {" & vbCrLf)
OOO00.Write("          editor.plugin.filemanagerDialog({" & vbCrLf)
OOO00.Write("              viewType : 'VIEW'," & vbCrLf)
OOO00.Write("              dirName : 'image'," & vbCrLf)
OOO00.Write("              clickFn : function(url, title) {" & vbCrLf)
OOO00.Write("                  K('#url').val(url);" & vbCrLf)
OOO00.Write("                  editor.hideDialog();" & vbCrLf)
OOO00.Write("              }" & vbCrLf)
OOO00.Write("          });" & vbCrLf)
OOO00.Write("      });" & vbCrLf)
OOO00.Write("  });" & vbCrLf)
OOO00.Write("});" & vbCrLf)
OOO00.Write("</script>" & vbCrLf)
OOO00.Write("</head>" & vbCrLf)
OOO00.Write("<body>" & vbCrLf)
OOO00.Write("            <div class=""box_top"">" & vbCrLf)
OOO00.Write("              <div align=""center""> 修改")
OOO00.Write rs1("newsname")
OOO00.Write("</div>" & vbCrLf)
OOO00.Write("            </div>" & vbCrLf)
OOO00.Write("            <div class=""box_center"">" & vbCrLf)
OOO00.Write("  <form id=""myform"" name=""myform""  method=""post"" action=""?action=edit&id=")
OOO00.Write OO0OOO("id")
OOO00.Write(""">" & vbCrLf)
OOO00.Write("<table width=""90%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""list_table"">" & vbCrLf)
OOO00.Write("    <tr bgcolor=""#FFFFFF"">" & vbCrLf)
OOO00.Write("      <td><div align=""right"">新闻所属类别：</div></td>" & vbCrLf)
OOO00.Write("      <td height=""25"" colspan=""2""><select class=""input-text"" name=""classid"" id=""classid"">" & vbCrLf)
OOO00.Write("        ")
Set Rs=OOO0O.Createobject("Adodb.Recordset")
Sql="Select * From newsClass"
Rs.open Sql,Conn, (102 * 21 - 2141), (28 * 10 - 277)
Do While not Rs.Eof
OOO00.Write(vbCrLf)
OOO00.Write("        <option value=""")
OOO00.Write rs("id")
OOO00.Write(""" ")
if rs("name")=rs1("classname") then
OOO00.Write("selected")
end if
OOO00.Write(">")
OOO00.Write rs("name")
OOO00.Write("</option>" & vbCrLf)
OOO00.Write("        ")
Rs.Movenext
Loop
Rs.Close
Set Rs=nothing
OOO00.Write(vbCrLf)
OOO00.Write("      </select></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
OOO00.Write("    <tr>" & vbCrLf)
OOO00.Write("      <td><div align=""right"">新闻名称：</div></td>" & vbCrLf)
OOO00.Write("      <td><input name=""newsname"" class=""input-text lh30"" type=""text"" id=""newsname"" value=""")
OOO00.Write rs1("newsname")
OOO00.Write(""" size=""80"" maxlength=""150""></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
OOO00.Write("    <tr>" & vbCrLf)
OOO00.Write("      <td><div align=""right"">添加人：</div></td>" & vbCrLf)
OOO00.Write("      <td><input name=""user"" type=""text"" class=""input-text lh30"" id=""user"" value=""")
OOO00.Write rs1("user")
OOO00.Write(""" size=""22"" maxlength=""22""></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
OOO00.Write("    <tr>" & vbCrLf)
OOO00.Write("      <td><div align=""right"">新闻来源：</div></td>" & vbCrLf)
OOO00.Write("      <td><input name=""wzly"" type=""text"" class=""input-text lh30"" id=""wzly"" value=""")
OOO00.Write rs1("wzly")
OOO00.Write(""" size=""22"" maxlength=""50""></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
 
OOO00.Write("    <tr> " & vbCrLf)
OOO00.Write("      <td> <div align=""right"">内容简介：</div></td>" & vbCrLf)
OOO00.Write("      <td colspan=""3""><textarea name=""body"" style=""width:80%;height:400px;visibility:hidden;"">")
OOO00.Write rs1("body")
OOO00.Write("</textarea></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
OOO00.Write("    <tr> " & vbCrLf)
OOO00.Write("      <td><div align=""right"">发布时间：</div></td>" & vbCrLf)
OOO00.Write("      <td colspan=""3""><span class=""td"">" & vbCrLf)
OOO00.Write("        <input name=""sj"" type=""text"" class=""input-text lh30"" id=""sj"" value=""")
OOO00.Write rs1("sj")
OOO00.Write(""" size=""22"" maxlength=""22""  />" & vbCrLf)
OOO00.Write("        <input name=button type=button class=""input-text lh30"" onClick=""document.myform.sj.value='")
OOO00.Write (date())
OOO00.Write("'"" value=""设为当前时间"">" & vbCrLf)
OOO00.Write("      (请输入正确的日期格式)</span></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
OOO00.Write("    <tr> " & vbCrLf)
OOO00.Write("      <td>&nbsp;</td>" & vbCrLf)
OOO00.Write("      <td><input type=""submit"" class=""btn btn82 btn_save2"" name=""Submit"" value=""确 定""></td>" & vbCrLf)
OOO00.Write("    </tr>" & vbCrLf)
OOO00.Write("</table>  " & vbCrLf)
OOO00.Write("</form>" & vbCrLf)
OOO00.Write(" " & vbCrLf)
OOO00.Write("</body>" & vbCrLf)
OOO00.Write("</html>" & vbCrLf)
Rs1.Close
Set Rs1=nothing
end if
OOO00.Write(vbCrLf)
OOO00.Write("<!--修改 -->" & vbCrLf)
if OO0OOO("action")="edit" then
if OO0OOO("id")="" then
OOO00.write "参数不正确<a href=editbody.asp?id="&OO0OOO("id")&">返回</a>"
OOO00.end
end if
if OO0OOO("classid")<>""  then
Sql="Select * From newsclass where ID="&OO0OOO("classID")
Set Rs=OOO0O.Createobject("Adodb.Recordset")
Rs.open Sql,Conn, (102 * 21 - 2141), (102 * 21 - 2141)
nclass=rs("classid")
classname=rs("name")
Rs.Close
Set Rs=nothing
newsname=trim(OO0OOO("newsname"))
classid=trim(OO0OOO("classid"))
pic=trim(OO0OOO("pic"))
tj=trim(OO0OOO("tj"))
wzly=trim(OO0OOO("wzly"))
user=trim(OO0OOO("user"))
body=trim(OO0OOO("body"))
sj=trim(OO0OOO("sj"))
hits=trim(OO0OOO("hits"))
Set Rs=OOO0O.Createobject("Adodb.Recordset")
Sql="Select * from news Where ID="&OO0OOO("ID")
Rs.open Sql,Conn, (102 * 21 - 2141), (28 * 10 - 277)
if rs.eof and rs.bof then
OOO00.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>"
OOO00.End()
end if
if newsname=""  then
OOO00.Write("<script language=javascript>alert('新闻标题不能为空!');history.go(-1)</script>")
OOO00.end
end if
if classid=""  then
OOO00.Write("<script language=javascript>alert('新闻分类不能为空!');history.go(-1)</script>")
OOO00.end
end if
IF not isNumeric(OO0OOO("hits")) then
OOO00.write("<script>alert(""亲！，你填错了，浏览数必须为数字!""); history.go(-1);</script>")
OOO00.End
End If
rs("newsname")=newsname
rs("classid")=classid
rs("nclass")=nclass
rs("classname")=classname
rs("hits")=hits
rs("wzly")=wzly
rs("user")=user
rs("body")=body
rs("sj")=sj
rs.update
rs.close
Set Rs = Nothing
Conn.Close
Set Conn=nothing
OOO00.Redirect "admin_news.asp"
OOO00.end
else
OOO00.write "你好像少了什么没写吧<a href=admin_news_edit.asp?id="&OO0OOO("id")&">返回</a>"
OOO00.end
end if
OOO00.end
end if
%>