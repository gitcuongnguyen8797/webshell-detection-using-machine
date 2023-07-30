<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|116,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<script language="Javascript">
function display(ID)
{
	if (document.getElementById(ID).style.display == "none") {
		document.getElementById(ID).style.display = "";
	}else{
		document.getElementById(ID).style.display = "none";
	}
}
</script>
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<title>信箱中心</title></head>
<body>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,ADsName,Content,FiewFlag,ViewFlag
dim ADsWidth,ADsHeight,Adurl,BigPic
ID=request.QueryString("ID")
call ADsEdit() 
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap background="images/th_bg.gif"><font color="#FFFFFF">&nbsp;<strong>广告：添加，修改广告相关的内容</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="Admin_AdEdit.asp?Result=Add" >添加广告</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="Admin_AdList.asp" >查看广告</a></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">广告标题：</td>
        <td><input name="ADsName" type="text" class="textfield" id="ADsName" style="WIDTH: 240;" value="<%=ADsName%>" maxlength="100">&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">广告类别：</td>
        <td><input name="fiewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if fiewFlag=1 then response.write ("checked")%>>
&nbsp;*&nbsp;勾选为FLASH/不勾选为作品格式&nbsp;<input name="ViewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if ViewFlag=1 then response.write ("checked")%>>
&nbsp;*&nbsp;首页幻灯显示</td>
      </tr>
      <tr>
        <td height="20" align="right">尺寸：</td>
        <td><input name="ADsWidth" type="text" class="textfield" id="ADsWidth" style="WIDTH: 60;" value="<%=ADsWidth%>" maxlength="4" onKeyDown="if(event.keyCode==13)event.returnValue=false" onChange="if(/\D/.test(this.value)){alert('宽度和高度只能输入整数！');this.value='150';}">&nbsp;宽×高&nbsp;<input name="ADsHeight" type="text" class="textfield" id="ADsHeight" style="WIDTH: 60;" value="<%=ADsHeight%>" maxlength="4" onKeyDown="if(event.keyCode==13)event.returnValue=false" onChange="if(/\D/.test(this.value)){alert('宽度和高度只能输入整数！');this.value='100';}">&nbsp;*&nbsp;至少150×100像素</td>
      </tr>
      <tr>
        <td height="20" align="right">广告图片：</td>
        <td>
		<input  type="text"  id="BigPic" class="textfield"  value="<%=BigPic%>" size="50" maxlength="100" name="BigPic">
		<input type="checkbox" onClick="display('upload');" id="box"/><label for='box'>上传文件</label><br>
		<div id="upload" style="display:none;">			
		<iframe frameborder=0 width=340 height=30 scrolling=no src="Admin_file.asp"></iframe>
		<script type="text/javascript">
		function callback(succeed,filename){
			if(!succeed){alert(BigPic);return;}
			document.getElementById("BigPic").value=filename;
		}
		</script>
		</div>
		</td>
      </tr>
      <tr>
        <td height="20" align="right">广告链接：</td>
        <td><input name="Adurl" type="text" class="textfield" id="Adurl" style="WIDTH: 240;" value="<%=Adurl%>" maxlength="100">
        &nbsp;请输入加：http://</td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">内容：<br>
        
        <td><textarea name="Content" rows="12" class="textfield" id="Content" style="WIDTH: 86%;" ><%=Content%></textarea></td>
      </tr>
      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="保存" style="WIDTH: 80;" ></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td valign="bottom">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
</BODY>
</HTML>
<%
sub ADsEdit()
  dim Action,rsCheckAdd,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑管理员
    set rs = server.createobject("adodb.recordset")
    if len(trim(request.Form("ADsName")))<1 then
      response.write ("<script language=javascript> alert('广告标题为必填项目！');history.back(-1);</script>")
      response.end
    end if
	if trim(request.Form("ADsWidth"))="" or trim(request.Form("ADsHeight"))="" then
      response.write ("<script language=javascript> alert('广告规格必须为150×100像素以上！');history.back(-1);</script>")
      response.end
	end if
	if trim(request.Form("ADsWidth"))<10 or trim(request.Form("ADsHeight"))<10 then
      response.write ("<script language=javascript> alert('广告规格必须为150×100像素以上！');history.back(-1);</script>")
      response.end
	end if
    if Result="Add" then '创建网站管理员
	  sql="select * from zhi_rui_s_AD"
      rs.open sql,conn,1,3
      rs.addnew	  
      rs("BigPic")=trim(Request.Form("BigPic"))
      rs("Adurl")=trim(Request.Form("Adurl"))
      rs("ADsName")=trim(Request.Form("ADsName"))
	  rs("Content")=Request.Form("Content")
	  if Request.Form("FiewFlag")=1 then
        rs("FiewFlag")=1
	  else
        rs("FiewFlag")=0
	  end if
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=1
	  else
        rs("ViewFlag")=0
	  end if
	  rs("Content")=Request.Form("Content")
	  rs("ADsWidth")=trim(Request.Form("ADsWidth"))
	  rs("ADsHeight")=trim(Request.Form("ADsHeight"))
	  rs("AddTime")=now()
	end if  
	if Result="Modify" then '修改网站管理员
      sql="select * from zhi_rui_s_AD where ID="&ID
      rs.open sql,conn,1,3
      rs("BigPic")=trim(Request.Form("BigPic"))
	  rs("Adurl")=trim(Request.Form("Adurl"))
      rs("ADsName")=trim(Request.Form("ADsName"))
	  if Request.Form("FiewFlag")=1 then
        rs("FiewFlag")=1
	  else
        rs("FiewFlag")=0
	  end if
	  if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=1
	  else
        rs("ViewFlag")=0
	  end if
	  rs("Content")=Request.Form("Content")
	  rs("ADsWidth")=trim(Request.Form("ADsWidth"))
	  rs("ADsHeight")=trim(Request.Form("ADsHeight"))
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑广告！');location.replace('Admin_AdList.asp');</script>"
  else '提取管理员
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from zhi_rui_s_AD where ID="& ID
      rs.open sql,conn,1,1
      BigPic=rs("BigPic")
	  Adurl=rs("Adurl")
	  ADsName=rs("ADsName")
	  FiewFlag=rs("FiewFlag")
	  ViewFlag=rs("ViewFlag")
	  ADsWidth=rs("ADsWidth")
	  ADsHeight=rs("ADsHeight")
      Content=rs("Content")
	  rs.close
      set rs=nothing 
	end if
  end if
end sub
%>