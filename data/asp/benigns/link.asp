<meta content=text/html;charset=gb2312 http-equiv=content-type>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
<SCRIPT language=JavaScript src="Menu.js"></SCRIPT>
<DIV class=menuskin id=popmenu 
onmouseover="clearhidemenu();highlightmenu(event,'on')" style="Z-INDEX: 100" 
onmouseout="highlightmenu(event,'off');dynamichide(event)"></DIV>
<div align="right">
  <p><img src="images/write.gif" border=0><a href="guest_input.asp">填写留言</a> 
    <%if session("useridname")="" then%>
    <img src="images/login.gif" width="16" height="16"><a href="login.asp">用户登录</a> 
    <img src="images/registr.gif" width="16" height="16"><a href="guest_register.asp">用户注册</a> 
    <%end if%>
    <%if session("useridname")<>"" then%>
    <img src="images/edit.gif" width="13" height="15"><a href="guest_info.asp">修改信息</a> 
    <img src="images/myword.gif" width="16" height="16" border="0"><a href="<%if session("list")=0 then%>default.asp?<%else%>default1.asp?<%end if%>text=<%=session("useridname")%>&option=4">我的留言</a> 
    <%end if%>
    <img src="images/line.gif" width="19" height="17"><a href="user_line.asp">发言排名</a> 
    <img src="images/jh.gif" width="17" height="17" border=0><a href="<%if session("list")=0 then%>default.asp?<%else%>default1.asp?<%end if%>jinghua=1">查看精华</a> 
    <%if session("useridname")<>"" then%>
    </a>
    <img src="images/passwd.gif" width="16" height="16" border="0"><a href="exit.asp">退出登录</a> 
    <%end if%>
    <%if session("admin")=1 then%>
    <img src="images/passwd.gif" width="16" height="16" border="0"><A onmouseover="showmenu(event,'<div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=user_manage.asp>用户管理</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=option.asp>功能选项</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=ly_del.asp>批量删除</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?UploadDir=upload>主题的上传文件管理</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?UploadDir=uploadreplay>回复的上传文件管理</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?UploadDir=uploadface>上传头像管理</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?Action=Clear>上传清理</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=Backup>备份数据库</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=Restore>恢复数据库</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=Compact>压缩数据库</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=SpaceSize>空间占用</a></div>')" style="CURSOR: hand">管理中心</A>
    <%end if%>
</p>
</div>
