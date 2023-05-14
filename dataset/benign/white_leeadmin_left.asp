<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>智睿软件系统--后台控制面板<</title>
<link rel="stylesheet" type="text/css" href="images/skin/left.css" />
<script language="JavaScript">
function showsubmenu(sid) {
	var whichEl = document.getElementById("submenu" + sid);
	var menuTitle = document.getElementById("menuTitle" + sid);
	if (whichEl!=null) {
		if (whichEl.style.display == "none"){
			whichEl.style.display='';
			if (menuTitle!=null)
			menuTitle.className='menu_title';
		}else{
			whichEl.style.display='none';
			if (menuTitle!=null)
			menuTitle.className='menu_title2';
		}
	}
}
</script>
</head>
<body>
<table class="listflow" cellspacing="0" cellpadding="0" height="100%">
	<tr>
		<td valign="top" class="listbg">
<%
Dim ChannelName,ChannelDir,ModuleName,strModules,intModules,Rs
intModules = Request("m")
If intModules=0 Then
%>
		<dl>
			<dt class="menu_title" id="menuTitle0" onClick="showsubmenu(0)">系统设置 </dt>
			<dd id="submenu0">
				<ul>
				    <li><a href="Admin_Config.asp" target="mainFrame">网站配置</a> | <a href="Admin_Lekc.asp" target="mainFrame">扩展管理</a></li>
   					<li><a href="Admin_Lekc.asp" target="mainFrame">扩展管理</a> | <a href="Admin_AdList.asp" target="mainFrame">广告管理</a></li>
					<li><a href="Admin_sql_admin.asp" target="mainFrame">安全注入</a> | <a href="Admin_Ip.asp" target="mainFrame">封锁管理</a> </li>
					<li><a href="Admin_Uplist.asp" target="mainFrame">附件管理</a></li>
				</ul>
			</dd>
		</dl>
<%
End If
If intModules=1 Then
%>
		<dl>
			<dt class="menu_title" id="menuTitle1" onClick="showsubmenu(1)">帐号管理</dt>
			<dd id="submenu1">
				<ul>
				    <li><a href="Admin_List.asp" target="mainFrame">管 理 员</a> | <a href="Admin_PassUp.asp" target="mainFrame">密码修改</a></li>
				</ul>
			</dd>
		</dl>
<%
End If
If intModules=2 Then
%>
		<dl>
			<dt class="menu_title" id="menuTitle2" onClick="showsubmenu(2)">类别管理</dt>
			<dd id="submenu2">
				<ul>
				  <li><a href="Admin_citys.asp" target="mainFrame">国籍类别</a> | <a href="Admin_select.asp" target="mainFrame">侨外类别</a></li>
				  <li><a href="Admin_selcj.asp" target="mainFrame">残疾类别</a> | <a href="Admin_Selnj.asp" target="mainFrame">年级类别</a></li>
				  <li><a href="Admin_Selbj.asp" target="mainFrame">班级类别</a></li>				
				 </ul>
			</dd>
		</dl>
<%
End If
If intModules=9 Then
%>
		<dl>
			<dt class="menu_title" id="menuTitle9" onClick="showsubmenu(9)">招生管理</dt>
			<dd id="submenu9">
				<ul>
				  <li><a href="Admin_Order.asp" target="mainFrame">学籍管理</a> | <a href="Admin_teched.asp?Result=Add" target="mainFrame">添加学籍</a></li>
				  <li><a href="Admin_KcTest.asp" target="mainFrame">学籍导入</a> | <a href="KcDemo.xls" target="mainFrame">样表下载</a></li>
				</ul>
			</dd>
		</dl>
<%
End If
%>
		</td>
	</tr>
	<tr>
		<td class="navbottom" style="background-repeat:no-repeat;"></td>
	</tr>
</table>
</body>
</html>