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
  <p><img src="images/write.gif" border=0><a href="guest_input.asp">��д����</a> 
    <%if session("useridname")="" then%>
    <img src="images/login.gif" width="16" height="16"><a href="login.asp">�û���¼</a> 
    <img src="images/registr.gif" width="16" height="16"><a href="guest_register.asp">�û�ע��</a> 
    <%end if%>
    <%if session("useridname")<>"" then%>
    <img src="images/edit.gif" width="13" height="15"><a href="guest_info.asp">�޸���Ϣ</a> 
    <img src="images/myword.gif" width="16" height="16" border="0"><a href="<%if session("list")=0 then%>default.asp?<%else%>default1.asp?<%end if%>text=<%=session("useridname")%>&option=4">�ҵ�����</a> 
    <%end if%>
    <img src="images/line.gif" width="19" height="17"><a href="user_line.asp">��������</a> 
    <img src="images/jh.gif" width="17" height="17" border=0><a href="<%if session("list")=0 then%>default.asp?<%else%>default1.asp?<%end if%>jinghua=1">�鿴����</a> 
    <%if session("useridname")<>"" then%>
    </a>
    <img src="images/passwd.gif" width="16" height="16" border="0"><a href="exit.asp">�˳���¼</a> 
    <%end if%>
    <%if session("admin")=1 then%>
    <img src="images/passwd.gif" width="16" height="16" border="0"><A onmouseover="showmenu(event,'<div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=user_manage.asp>�û�����</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=option.asp>����ѡ��</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=ly_del.asp>����ɾ��</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?UploadDir=upload>������ϴ��ļ�����</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?UploadDir=uploadreplay>�ظ����ϴ��ļ�����</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?UploadDir=uploadface>�ϴ�ͷ�����</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=UploadFileList.asp?Action=Clear>�ϴ�����</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=Backup>�������ݿ�</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=Restore>�ָ����ݿ�</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=Compact>ѹ�����ݿ�</a></div><div class=menuitems align=left><a style=font-size:9pt;line-height:14pt; href=Database.asp?Action=SpaceSize>�ռ�ռ��</a></div>')" style="CURSOR: hand">��������</A>
    <%end if%>
</p>
</div>
