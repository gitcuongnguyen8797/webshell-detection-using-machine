 <!--#include File="inc/Conn.asp" -->
<%
 Set OO00OO0OO0=Response:Set OO00OO0O0O=Request:Set OO00OOO00=Session:Set OO00OO0O00=Application:Set OO00OO0OOO=Server
If OO00OOO00("AdminName")="" and OO00OOO00("adminpass")="" Then
OO00OO0OO0.Redirect "Error.asp?id=005"
Else
Sql="Select * From Product where ID="&OO00OO0O0O("ID")
Set Rs1=OO00OO0OOO.Createobject("Adodb.Recordset")
Rs1.open Sql,Conn, (49 * 87 - 4262), (49 * 87 - 4262)
if rs1.bof or rs1.eof then
OO00OO0OO0.Write"<center>暂无产产品<a href='admin_Product_add.asp'><font color=red>添加产品!</a></center>"
OO00OO0OO0.end
else
end if
OO00OO0OO0.Write(vbCrLf)
OO00OO0OO0.Write("<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbCrLf)
OO00OO0OO0.Write("<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbCrLf)
OO00OO0OO0.Write("<head>" & vbCrLf)
OO00OO0OO0.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"" />" & vbCrLf)
OO00OO0OO0.Write("<title>修改数据</title>" & vbCrLf)
OO00OO0OO0.Write("    <link rel=""stylesheet"" href=""css/main.css"">" & vbCrLf)
OO00OO0OO0.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/themes/default/default.css"" />" & vbCrLf)
OO00OO0OO0.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/plugins/code/prettify.css"" />" & vbCrLf)
OO00OO0OO0.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/kindeditor.js""></script>" & vbCrLf)
OO00OO0OO0.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/lang/zh_CN.js""></script>" & vbCrLf)
OO00OO0OO0.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/plugins/code/prettify.js""></script>" & vbCrLf)
OO00OO0OO0.Write("	<script>" & vbCrLf)
OO00OO0OO0.Write("		KindEditor.ready(function(K) {" & vbCrLf)
OO00OO0OO0.Write("			var editor1 = K.create('textarea[name=""body""]', {" & vbCrLf)
OO00OO0OO0.Write("				cssPath : 'kindeditor-4.1.10-l/plugins/code/prettify.css'," & vbCrLf)
OO00OO0OO0.Write("				uploadJson : 'kindeditor-4.1.10-l/asp/upload_json.asp'," & vbCrLf)
OO00OO0OO0.Write("				fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'," & vbCrLf)
OO00OO0OO0.Write("				allowFileManager : true," & vbCrLf)
OO00OO0OO0.Write("				afterCreate : function() {" & vbCrLf)
OO00OO0OO0.Write("					var self = this;" & vbCrLf)
OO00OO0OO0.Write("					K.ctrl(document, 13, function() {" & vbCrLf)
OO00OO0OO0.Write("						self.sync();" & vbCrLf)
OO00OO0OO0.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO00OO0OO0.Write("					});" & vbCrLf)
OO00OO0OO0.Write("					K.ctrl(self.edit.doc, 13, function() {" & vbCrLf)
OO00OO0OO0.Write("						self.sync();" & vbCrLf)
OO00OO0OO0.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO00OO0OO0.Write("					});" & vbCrLf)
OO00OO0OO0.Write("				}" & vbCrLf)
OO00OO0OO0.Write("			});" & vbCrLf)
OO00OO0OO0.Write("			prettyPrint();" & vbCrLf)
OO00OO0OO0.Write("		});" & vbCrLf)
OO00OO0OO0.Write("	</script>" & vbCrLf)
OO00OO0OO0.Write("	" & vbCrLf)
OO00OO0OO0.Write("	<script>" & vbCrLf)
OO00OO0OO0.Write("KindEditor.ready(function(K) {" & vbCrLf)
OO00OO0OO0.Write("  var editor = K.editor({" & vbCrLf)
OO00OO0OO0.Write("      fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'" & vbCrLf)
OO00OO0OO0.Write("  });" & vbCrLf)
OO00OO0OO0.Write("  K('#filemanager').click(function() {" & vbCrLf)
OO00OO0OO0.Write("      editor.loadPlugin('filemanager', function() {" & vbCrLf)
OO00OO0OO0.Write("          editor.plugin.filemanagerDialog({" & vbCrLf)
OO00OO0OO0.Write("              viewType : 'VIEW'," & vbCrLf)
OO00OO0OO0.Write("              dirName : 'image'," & vbCrLf)
OO00OO0OO0.Write("              clickFn : function(url, title) {" & vbCrLf)
OO00OO0OO0.Write("                  K('#url').val(url);" & vbCrLf)
OO00OO0OO0.Write("                  editor.hideDialog();" & vbCrLf)
OO00OO0OO0.Write("              }" & vbCrLf)
OO00OO0OO0.Write("          });" & vbCrLf)
OO00OO0OO0.Write("      });" & vbCrLf)
OO00OO0OO0.Write("  });" & vbCrLf)
OO00OO0OO0.Write("});" & vbCrLf)
OO00OO0OO0.Write("</script>" & vbCrLf)
OO00OO0OO0.Write("</head>" & vbCrLf)
OO00OO0OO0.Write("<body>" & vbCrLf)
OO00OO0OO0.Write("            <div class=""box_top"">" & vbCrLf)
OO00OO0OO0.Write("              <div align=""center""> 修改")
OO00OO0OO0.Write rs1("Productname")
OO00OO0OO0.Write("</div>" & vbCrLf)
OO00OO0OO0.Write("            </div>" & vbCrLf)
OO00OO0OO0.Write("            <div class=""box_center"">" & vbCrLf)
OO00OO0OO0.Write("  <form id=""myform"" name=""myform""  method=""post"" action=""?action=edit&id=")
OO00OO0OO0.Write OO00OO0O0O("id")
OO00OO0OO0.Write(""">" & vbCrLf)
OO00OO0OO0.Write("<table width=""90%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""list_table"">" & vbCrLf)
OO00OO0OO0.Write("    <tr bgcolor=""#FFFFFF"">" & vbCrLf)
OO00OO0OO0.Write("      <td width=""18%""><div align=""right"">产品所属类别：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td height=""25"" colspan=""3""><select class=""input-text"" name=""classid"" id=""classid"">" & vbCrLf)
OO00OO0OO0.Write("        ")
Set Rs=OO00OO0OOO.Createobject("Adodb.Recordset")
Sql="Select * From ProductClass"
Rs.open Sql,Conn, (49 * 87 - 4262), (83 * 21 - 1740)
Do While not Rs.Eof
OO00OO0OO0.Write(vbCrLf)
OO00OO0OO0.Write("        <option value=""")
OO00OO0OO0.Write rs("id")
OO00OO0OO0.Write(""" ")
if rs("name")=rs1("classname") then
OO00OO0OO0.Write("selected")
end if
OO00OO0OO0.Write(">")
OO00OO0OO0.Write rs("name")
OO00OO0OO0.Write("</option>" & vbCrLf)
OO00OO0OO0.Write("        ")
Rs.Movenext
Loop
Rs.Close
Set Rs=nothing
OO00OO0OO0.Write(vbCrLf)
OO00OO0OO0.Write("      </select></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("    <tr>" & vbCrLf)
OO00OO0OO0.Write("      <td><div align=""right"">产品名称：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td width=""45%""><input name=""Productname"" class=""input-text lh30"" type=""text"" id=""Productname"" value=""")
OO00OO0OO0.Write rs1("Productname")
OO00OO0OO0.Write(""" size=""80"" maxlength=""150""></td>" & vbCrLf)
OO00OO0OO0.Write("      <td width=""37%"" rowspan=""7""><a href=""")
OO00OO0OO0.Write rs1("pic")
OO00OO0OO0.Write(""" target=""_blank""><img src=""")
OO00OO0OO0.Write rs1("pic")
OO00OO0OO0.Write(""" alt=""点击放大"" width=""270"" height=""200"" border=""0"" /></a></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("	<tr>" & vbCrLf)
OO00OO0OO0.Write("	  <td><div align=""right"">产品关键词：</div></td>" & vbCrLf)
OO00OO0OO0.Write("	  <td><input name=""Productkey"" class=""input-text lh30"" type=""text"" id=""Productkey"" value=""")
OO00OO0OO0.Write rs1("Productkey")
OO00OO0OO0.Write(""" size=""80"" maxlength=""150"" /></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("	<tr>" & vbCrLf)
OO00OO0OO0.Write("	  <td><div align=""right"">产品标题优化说明：</div></td>" & vbCrLf)
OO00OO0OO0.Write("	  <td><input name=""Productsm"" class=""input-text lh30"" type=""text"" id=""Productsm"" value=""")
OO00OO0OO0.Write rs1("Productsm")
OO00OO0OO0.Write(""" size=""80"" maxlength=""150"" /></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("	<tr><td><div align=""right"">图片：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td><input name=""pic"" type=""text"" class=""input-text lh30""  id=""url"" value=""")
OO00OO0OO0.Write rs1("pic")
OO00OO0OO0.Write(""" size=""50"" maxlength=""150"">" & vbCrLf)
OO00OO0OO0.Write("      <input name=""button2"" type=""button"" id=""filemanager"" class=""input-text lh30"" value=""选取已上传图片"" /></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("    <tr>" & vbCrLf)
OO00OO0OO0.Write("      <td><div align=""right"">重新上传新图片：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td><iframe src=""upload.asp?action=simg"" class=""input-text lh30"" width=""350"" height=""25"" frameborder=""0"" scrolling=""no""></iframe></td>" & vbCrLf)
OO00OO0OO0.Write("    <tr>" & vbCrLf)
OO00OO0OO0.Write("      <td><div align=""right"">添加人：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td><input name=""user"" type=""text"" class=""input-text lh30"" id=""user"" value=""")
OO00OO0OO0.Write rs1("user")
OO00OO0OO0.Write(""" size=""22"" maxlength=""22""></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("    " & vbCrLf)
OO00OO0OO0.Write("    <tr> " & vbCrLf)
OO00OO0OO0.Write("      <td><div align=""right"">发布时间：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td colspan=""4""><span class=""td"">" & vbCrLf)
OO00OO0OO0.Write("        <input name=""sj"" type=""text"" class=""input-text lh30"" id=""sj"" value=""")
OO00OO0OO0.Write rs1("sj")
OO00OO0OO0.Write(""" size=""10"" maxlength=""10""  />" & vbCrLf)
OO00OO0OO0.Write("        <input name=button type=button class=""input-text lh30"" onClick=""document.myform.sj.value='")
OO00OO0OO0.Write (date())
OO00OO0OO0.Write("'"" value=""设为当前时间"">" & vbCrLf)
OO00OO0OO0.Write("      (请输入正确的日期格式)</span></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("    <tr> " & vbCrLf)
OO00OO0OO0.Write("      <td> <div align=""right"">内容简介：</div></td>" & vbCrLf)
OO00OO0OO0.Write("      <td colspan=""4""><textarea name=""body"" style=""width:80%;height:400px;visibility:hidden;"">")
OO00OO0OO0.Write rs1("body")
OO00OO0OO0.Write("</textarea></td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("    <tr> " & vbCrLf)
OO00OO0OO0.Write("      <td>&nbsp;</td>" & vbCrLf)
OO00OO0OO0.Write("      <td><input type=""submit"" class=""btn btn82 btn_save2"" name=""Submit"" value=""确 定""></td>" & vbCrLf)
OO00OO0OO0.Write("      <td>&nbsp;</td>" & vbCrLf)
OO00OO0OO0.Write("    </tr>" & vbCrLf)
OO00OO0OO0.Write("</table>  " & vbCrLf)
OO00OO0OO0.Write("</form>" & vbCrLf)
OO00OO0OO0.Write(" " & vbCrLf)
OO00OO0OO0.Write("</body>" & vbCrLf)
OO00OO0OO0.Write("</html>" & vbCrLf)
Rs1.Close
Set Rs1=nothing
end if
OO00OO0OO0.Write(vbCrLf)
OO00OO0OO0.Write("<!--修改 -->" & vbCrLf)
if OO00OO0O0O("action")="edit" then
page=OO00OO0O0O("page")
classID=OO00OO0O0O("classID")
keyword=OO00OO0O0O("keyword")
if OO00OO0O0O("id")="" then
OO00OO0OO0.write "参数不正确<a href=admin_Product_edit.asp?id="&OO00OO0O0O("id")&">返回</a>"
OO00OO0OO0.end
end if
if OO00OO0O0O("classid")<>""  then
Sql="Select * From Productclass where ID="&OO00OO0O0O("classID")
Set Rs=OO00OO0OOO.Createobject("Adodb.Recordset")
Rs.open Sql,Conn, (49 * 87 - 4262), (49 * 87 - 4262)
nclass=rs("classid")
classname=rs("name")
Rs.Close
Set Rs=nothing
Productname=trim(OO00OO0O0O("Productname"))
Productkey=trim(OO00OO0O0O("Productkey"))
Productsm=trim(OO00OO0O0O("Productsm"))
classid=trim(OO00OO0O0O("classid"))
pic=trim(OO00OO0O0O("pic"))
tj=trim(OO00OO0O0O("tj"))
user=trim(OO00OO0O0O("user"))
body=trim(OO00OO0O0O("body"))
sj=trim(OO00OO0O0O("sj"))
Set Rs=OO00OO0OOO.Createobject("Adodb.Recordset")
Sql="Select * from Product Where ID="&OO00OO0O0O("ID")
Rs.open Sql,Conn, (49 * 87 - 4262), (83 * 21 - 1740)
if rs.eof and rs.bof then
OO00OO0OO0.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>"
OO00OO0OO0.End()
end if
if Productname=""  then
OO00OO0OO0.Write("<script language=javascript>alert('产品标题不能为空!');history.go(-1)</script>")
OO00OO0OO0.end
end if
if classid=""  then
OO00OO0OO0.Write("<script language=javascript>alert('产品分类不能为空!');history.go(-1)</script>")
OO00OO0OO0.end
end if
if pic=""  then
OO00OO0OO0.Write("<script language=javascript>alert('产品图片不能为空!');history.go(-1)</script>")
OO00OO0OO0.end
end if
rs("Productname")=Productname
rs("Productkey")=Productkey
rs("Productsm")=Productsm
rs("classid")=classid
rs("nclass")=nclass
rs("classname")=classname
rs("pic")=pic
rs("user")=user
rs("body")=body
rs("sj")=sj
rs.update
rs.close
Set Rs = Nothing
Conn.Close
Set Conn=nothing
OO00OO0OO0.Redirect "admin_Product.asp"
OO00OO0OO0.end
else
OO00OO0OO0.write "你好像少了什么没写吧<a href=admin_Product_edit.asp?id="&OO00OO0O0O("id")&">返回</a>"
OO00OO0OO0.end
end if
OO00OO0OO0.end
end if
%>