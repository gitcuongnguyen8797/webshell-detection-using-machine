<!--#include File="inc/Conn.asp" -->
<%
 Set OO0OO=Response:Set OO0O0=Request:Set OO0O0O=Session:Set OO00OO=Application:Set OO0O00=Server
If OO0O0O("AdminName")="" and OO0O0O("adminpass")="" Then
OO0OO.Redirect "Error.asp?id=005"
Else
Sql="Select * from about where ID="&OO0O0("ID")
Set Rs1=OO0O00.Createobject("Adodb.Recordset")
Rs1.open Sql,Conn, (107 * 30 - 3209), (107 * 30 - 3209)
if rs1.bof or rs1.eof then
OO0OO.Write"<center>暂无产信息<a href='admin_about_add.asp'><font color=red>添加信息!</a></center>"
OO0OO.end
else
end if
OO0OO.Write(vbCrLf)
OO0OO.Write("<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">" & vbCrLf)
OO0OO.Write("<html xmlns=""http://www.w3.org/1999/xhtml"">" & vbCrLf)
OO0OO.Write("<head>" & vbCrLf)
OO0OO.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"" />" & vbCrLf)
OO0OO.Write("<title>修改数据</title>" & vbCrLf)
OO0OO.Write("    <link rel=""stylesheet"" href=""css/main.css"">" & vbCrLf)
OO0OO.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/themes/default/default.css"" />" & vbCrLf)
OO0OO.Write("	<link rel=""stylesheet"" href=""kindeditor-4.1.10-l/plugins/code/prettify.css"" />" & vbCrLf)
OO0OO.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/kindeditor.js""></script>" & vbCrLf)
OO0OO.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/lang/zh_CN.js""></script>" & vbCrLf)
OO0OO.Write("	<script charset=""utf-8"" src=""kindeditor-4.1.10-l/plugins/code/prettify.js""></script>" & vbCrLf)
OO0OO.Write("	<script>" & vbCrLf)
OO0OO.Write("		KindEditor.ready(function(K) {" & vbCrLf)
OO0OO.Write("			var editor1 = K.create('textarea[name=""body""]', {" & vbCrLf)
OO0OO.Write("				cssPath : 'kindeditor-4.1.10-l/plugins/code/prettify.css'," & vbCrLf)
OO0OO.Write("				uploadJson : 'kindeditor-4.1.10-l/asp/upload_json.asp'," & vbCrLf)
OO0OO.Write("				fileManagerJson : 'kindeditor-4.1.10-l/asp/file_manager_json.asp'," & vbCrLf)
OO0OO.Write("				allowFileManager : true," & vbCrLf)
OO0OO.Write("				afterCreate : function() {" & vbCrLf)
OO0OO.Write("					var self = this;" & vbCrLf)
OO0OO.Write("					K.ctrl(document, 13, function() {" & vbCrLf)
OO0OO.Write("						self.sync();" & vbCrLf)
OO0OO.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO0OO.Write("					});" & vbCrLf)
OO0OO.Write("					K.ctrl(self.edit.doc, 13, function() {" & vbCrLf)
OO0OO.Write("						self.sync();" & vbCrLf)
OO0OO.Write("						K('form[name=example]')[0].submit();" & vbCrLf)
OO0OO.Write("					});" & vbCrLf)
OO0OO.Write("				}" & vbCrLf)
OO0OO.Write("			});" & vbCrLf)
OO0OO.Write("			prettyPrint();" & vbCrLf)
OO0OO.Write("		});" & vbCrLf)
OO0OO.Write("	</script>" & vbCrLf)
OO0OO.Write("</head>" & vbCrLf)
OO0OO.Write("<body>" & vbCrLf)
OO0OO.Write("            <div class=""box_top"">" & vbCrLf)
OO0OO.Write("              <div align=""center""> 修改")
OO0OO.Write rs1("aboutname")
OO0OO.Write("</div>" & vbCrLf)
OO0OO.Write("            </div>" & vbCrLf)
OO0OO.Write("            <div class=""box_center"">" & vbCrLf)
OO0OO.Write("  <form id=""myform"" name=""myform""  method=""post"" action=""?action=edit&id=")
OO0OO.Write OO0O0("id")
OO0OO.Write(""">" & vbCrLf)
OO0OO.Write("<table width=""90%"" border=""0"" cellpadding=""0"" cellspacing=""0"" class=""list_table"">" & vbCrLf)
OO0OO.Write("    <tr>" & vbCrLf)
OO0OO.Write("      <td><div align=""right"">信息名称：</div></td>" & vbCrLf)
OO0OO.Write("      <td><input name=""aboutname"" class=""input-text lh30"" type=""text"" id=""aboutname"" value=""")
OO0OO.Write rs1("aboutname")
OO0OO.Write(""" size=""80"" maxlength=""150""></td>" & vbCrLf)
OO0OO.Write("    </tr>" & vbCrLf)
OO0OO.Write("    <tr>" & vbCrLf)
OO0OO.Write("      <td><div align=""right"">添加人：</div></td>" & vbCrLf)
OO0OO.Write("      <td><input name=""user"" type=""text"" class=""input-text lh30"" id=""user"" value=""")
OO0OO.Write rs1("user")
OO0OO.Write(""" size=""22"" maxlength=""22""></td>" & vbCrLf)
OO0OO.Write("    </tr>" & vbCrLf)
OO0OO.Write("    <tr> " & vbCrLf)
OO0OO.Write("      <td> <div align=""right"">内容简介：</div></td>" & vbCrLf)
OO0OO.Write("      <td colspan=""3""><textarea name=""body"" style=""width:80%;height:400px;visibility:hidden;"">")
OO0OO.Write rs1("body")
OO0OO.Write("</textarea></td>" & vbCrLf)
OO0OO.Write("    </tr>" & vbCrLf)
OO0OO.Write("    <tr> " & vbCrLf)
OO0OO.Write("      <td><div align=""right"">发布时间：</div></td>" & vbCrLf)
OO0OO.Write("      <td colspan=""3""><span class=""td"">" & vbCrLf)
OO0OO.Write("        <input name=""sj"" type=""text"" class=""input-text lh30"" id=""sj"" value=""")
OO0OO.Write rs1("sj")
OO0OO.Write(""" size=""22"" maxlength=""22""  />" & vbCrLf)
OO0OO.Write("        <input name=button type=button class=""input-text lh30"" onClick=""document.myform.sj.value='")
OO0OO.Write (date())
OO0OO.Write("'"" value=""设为当前时间"">" & vbCrLf)
OO0OO.Write("      (请输入正确的日期格式)</span></td>" & vbCrLf)
OO0OO.Write("    </tr>" & vbCrLf)
OO0OO.Write("    <tr> " & vbCrLf)
OO0OO.Write("      <td>&nbsp;</td>" & vbCrLf)
OO0OO.Write("      <td><input type=""submit"" class=""btn btn82 btn_save2"" name=""Submit"" value=""确 定""></td>" & vbCrLf)
OO0OO.Write("    </tr>" & vbCrLf)
OO0OO.Write("</table>  " & vbCrLf)
OO0OO.Write("</form>" & vbCrLf)
OO0OO.Write(" " & vbCrLf)
OO0OO.Write("</body>" & vbCrLf)
OO0OO.Write("</html>" & vbCrLf)
Rs1.Close
Set Rs1=nothing
end if
OO0OO.Write(vbCrLf)
OO0OO.Write("<!--修改 -->" & vbCrLf)
if OO0O0("action")="edit" then
if OO0O0("id")="" then
OO0OO.write "参数不正确<a href=admin_about_edit.asp?id="&OO0O0("id")&">返回</a>"
OO0OO.end
end if
aboutname=trim(OO0O0("aboutname"))
user=trim(OO0O0("user"))
body=trim(OO0O0("body"))
sj=trim(OO0O0("sj"))
Set Rs=OO0O00.Createobject("Adodb.Recordset")
Sql="Select * from about Where ID="&OO0O0("ID")
Rs.open Sql,Conn, (107 * 30 - 3209), (100 * 11 - 1097)
if rs.eof and rs.bof then
OO0OO.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>"
OO0OO.End()
end if
if aboutname=""  then
OO0OO.Write("<script language=javascript>alert('信息标题不能为空!');history.go(-1)</script>")
OO0OO.end
end if
if body=""  then
OO0OO.Write("<script language=javascript>alert('信息内容不能为空!');history.go(-1)</script>")
OO0OO.end
end if
rs("aboutname")=aboutname
rs("user")=user
rs("body")=body
rs("sj")=sj
rs.update
rs.close
Set Rs = Nothing
Conn.Close
Set Conn=nothing
OO0OO.Redirect "admin_about.asp"
OO0OO.end
end if
%>