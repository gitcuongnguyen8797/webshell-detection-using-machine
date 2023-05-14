<!DOCTYPE html>
<%
'========================================================================================
' 文 件 名: admin_mansys.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 系统参数设置图形接口 | 请勿自行修改该处文件源代码，以确保程序正确的执行
' 文件日期: 2018-01-23
' 设 计 者: 疾风之狼
'========================================================================================
' 郑州文达岭峰网络科技有限公司.
'========================================================================================
' Copyright (C) 2001-2018 岭峰网. All rights reserved.
' 网    站: http://www.lfmesss.com
' 电子邮件: support@lfmesss.com
' 联系ＱＱ: 85112407
'========================================================================================
%>
<!-- #include file="inc/md5_32.asp" -->
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<%flg="man"%>
<!-- #include file="inc/purview.asp" -->
<head>
<title><%= LingFengNet_MS_language_title_mansys %></title>
<%  
  call htmlmeta() 
%> 
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
<script language="JavaScript" type="text/javascript" src="inc/mouseok.js"></script>
</head>
<body onkeydown=EnableKey() >
<%if not request.form("set")="ok" then%>
<%
call htmltop()
call htmlbr()
call htmladminmen()
call htmlbr()
%>
<table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td class="bgc2"> 
      <table width="100%" border="0" cellspacing="1" cellpadding="3">
        <tr class="bgc"> 
          <td height=20 width=25% class="bgc"> 
            <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td height="30" valign="middle"> 
                  <div align="left"><%= LingFengNet_MS_language_mansys_mes_1 %></div>                </td>
              </tr>
              <tr> 
                <td height="30" valign="middle"> 
                  <div align="left"><%= LingFengNet_MS_language_mansys_mes_2 %> 
                    <a href="javascript:history.go(0)"><%= LingFengNet_MS_language_mansys_mes_3 %></a> </div>                </td>
              </tr>
              <tr> 
                <td height="30" valign="middle"> 
                  <form name="form" method="post" action="">
                    <table width="99%" border="0" cellspacing="4" cellpadding="0" class=nofix >
                      <tr> 
                        <td colspan="2" height="30"><strong><%= LingFengNet_MS_language_mansys_mes_4 %></strong></td>
                      </tr>
                      <tr> 
                        <td colspan="2" height="1" class="bgc2"></td>
                      </tr>
                      <tr id=tr0 onMouseOver="javascript:tr_mouse_over('tr0')" 
              onMouseOut="javascript:tr_mouse_out('tr0')"> 
                        <td width="29%" height="40"><input type="text" name="LingFengNet_MS_web_name" value="<%=LingFengNet_MS_web_name%>" size="25"></td>
                        <td valign="middle" width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_5 %></td>
                      </tr>
                      <tr id=tr1 onMouseOver="javascript:tr_mouse_over('tr1')" 
              onMouseOut="javascript:tr_mouse_out('tr1')"> 
                        <td width="29%" height="40"><input type="text" name="LingFengNet_MS_web_url" value="<%=LingFengNet_MS_web_url%>" size="25"></td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_6 %></td>
                      </tr>
                      <tr id=tr2 onMouseOver="javascript:tr_mouse_over('tr2')" 
              onMouseOut="javascript:tr_mouse_out('tr2')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_sys_name" value="<%=LingFengNet_MS_sys_name%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_7 %></td>
                      </tr>
                      <tr id=tr3 onMouseOver="javascript:tr_mouse_over('tr3')" 
              onMouseOut="javascript:tr_mouse_out('tr3')">
                        <td height="40"><input type="text" name="LingFengNet_MS_sys_tem" value="<%=LingFengNet_MS_sys_tem%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_8 %></td>
                      </tr>
                      <tr id=tr4 onMouseOver="javascript:tr_mouse_over('tr4')" 
              onMouseOut="javascript:tr_mouse_out('tr4')"> 
                        <td width="29%" height="40">
						<select name="LingFengNet_MS_web_css">
						<%
						Response.Write "<OPTION Selected>"& LingFengNet_MS_language_page_pageinfo &"&ensp;"& LingFengNet_MS_web_css_read &"</OPTION>" & vbCR
						set dir=server.CreateObject("scripting.filesystemobject")
						set myfiles=dir.getfolder(server.mappath(ImageFolderName & "style/css_ini/"))
						zhutiID=0
						For Each filefound in myfiles.files
							zhutiID=zhutiID+1
							filefound_1=left(filefound.name,(int(len(filefound.name))-16))
							response.write "<option value=" & filefound.name & ">"&zhutiID&"." & filefound_1 & "</option>" & vbCR
						Next
                        %>
				</select></td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_14 %></td>
                      </tr>
                      <tr  id=tr5 onMouseOver="javascript:tr_mouse_over('tr5')" 
              onMouseOut="javascript:tr_mouse_out('tr5')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_web_ad" value="<%=LingFengNet_MS_web_ad%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_15 %></td>
                      </tr>
                      <tr id=tr6 onMouseOver="javascript:tr_mouse_over('tr6')" 
              onMouseOut="javascript:tr_mouse_out('tr6')"> 
                        <td width="29%" height="40"> <textarea name="LingFengNet_MS_web_ad_url" rows="8" cols="23"><%=LingFengNet_MS_web_ad_url%></textarea></td>
                        <td width="71%" height="40"> <%if LingFengNet_MS_web_ad=0 then%>
                          <%= LingFengNet_MS_language_mansys_mes_16 %> 
                          <%end if%> <%if LingFengNet_MS_web_ad=1 then%>
                          <%= LingFengNet_MS_language_mansys_mes_17 %> 
                        <%end if%> </td>
                      </tr>
                      <tr id=tr7 onMouseOver="javascript:tr_mouse_over('tr7')" 
              onMouseOut="javascript:tr_mouse_out('tr7')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_web_w" value="<%=LingFengNet_MS_web_w%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_18 %>
                          <label><input type="radio" name="LingFengNet_MS_web_psor" value="2" checked>
                        <%= LingFengNet_MS_language_mansys_mes_20 %></label>
                          <label><input type="radio" name="LingFengNet_MS_web_psor" value="1">
                          <%= LingFengNet_MS_language_mansys_mes_19 %></label></td>
                      </tr>
                      <tr id=tr7_2 onMouseOver="javascript:tr_mouse_over('tr7_2')" 
              onMouseOut="javascript:tr_mouse_out('tr7_2')">
                        <td width="29%" height="40"><input type="text" name="LingFengNet_MS_web_h" value="<%=LingFengNet_MS_web_h%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_6 %></td>
                      </tr>
                      <tr id=tr7_3 onMouseOver="javascript:tr_mouse_over('tr7_3')" 
              onMouseOut="javascript:tr_mouse_out('tr7_3')">
                        <td height="40"><input type="text" name="LingFengNet_MS_web_f_s" value="<%=LingFengNet_MS_web_f_s%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_7 %></td>
                      </tr>
                      <tr id=tr7_4 onMouseOver="javascript:tr_mouse_over('tr7_4')" 
              onMouseOut="javascript:tr_mouse_out('tr7_4')">
                        <td height="40"><input type="text" name="LingFengNet_MS_web_f_l" value="<%=LingFengNet_MS_web_f_l%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_8 %></td>
                      </tr>
                      <tr id=tr10 onMouseOver="javascript:tr_mouse_over('tr10')" 
              onMouseOut="javascript:tr_mouse_out('tr10')">
                        <td width="29%" height="40"><input type="text" name="LingFengNet_MS_web_top" value="<%=LingFengNet_MS_web_top%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_3 %></td>
                      </tr>
                      <tr id=tr11 onMouseOver="javascript:tr_mouse_over('tr11')" 
              onMouseOut="javascript:tr_mouse_out('tr11')">
                        <td width="29%" height="40"><textarea name="LingFengNet_MS_web_top_con" rows="8" cols="23"><%=LingFengNet_MS_web_top_con%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_4 %></td>
                      </tr>
                      <tr id=tr11_1 onMouseOver="javascript:tr_mouse_over('tr11_1')" 
              onMouseOut="javascript:tr_mouse_out('tr11_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_sousuo_lx" value="<%=LingFengNet_MS_sousuo_lx%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_9 %></td>
                      </tr>
                      <tr id=tr12_1 onMouseOver="javascript:tr_mouse_over('tr12_1')" 
              onMouseOut="javascript:tr_mouse_out('tr12_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_qq_ok" value="<%=LingFengNet_MS_qq_ok%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_50_1 %></td>
                      </tr>
                      <tr id=tr12_2 onMouseOver="javascript:tr_mouse_over('tr12_2')" 
              onMouseOut="javascript:tr_mouse_out('tr12_2')">
                        <td height="40"><input type="text" name="LingFengNet_MS_qq_lr" value="<%=LingFengNet_MS_qq_lr%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_50_2 %></td>
                      </tr>
                      <tr id=tr12_3 onMouseOver="javascript:tr_mouse_over('tr12_3')" 
              onMouseOut="javascript:tr_mouse_out('tr12_3')">
                        <td height="40">
                        <textarea name="LingFengNet_MS_qq_jihe" rows="8" cols="23"><%=tohh_chr(LingFengNet_MS_qq_jihe)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_50_3 %></td>
                      </tr>
                      <tr id=tr12_4 onMouseOver="javascript:tr_mouse_over('tr12_4')" 
              onMouseOut="javascript:tr_mouse_out('tr12_4')">
                        <td height="40">
                        <textarea name="LingFengNet_MS_qq_gg" rows="2" cols="23"><%=LingFengNet_MS_qq_gg%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_50_4 %></td>
                      </tr>
                      <tr id=tr12 onMouseOver="javascript:tr_mouse_over('tr12')" 
              onMouseOut="javascript:tr_mouse_out('tr12')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messadmin" value="<%=LingFengNet_MS_messadmin%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_50 %></td>
                      </tr>
                      <tr id=tr13 onMouseOver="javascript:tr_mouse_over('tr13')" 
              onMouseOut="javascript:tr_mouse_out('tr13')">
                        <td height="40"><textarea name="LingFengNet_MS_messadmin_mess" rows="10" cols="33"><%=LingFengNet_MS_messadmin_mess%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_51 %></td>
                      </tr>
                      <tr id=tr14 onMouseOver="javascript:tr_mouse_over('tr14')" 
              onMouseOut="javascript:tr_mouse_out('tr14')">
                        <td height="40"><input type="text" name="db" value="<%=db%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_27 %></td>
                      </tr>
                      <tr id=tr14_1 onMouseOver="javascript:tr_mouse_over('tr14_1')" 
              onMouseOut="javascript:tr_mouse_out('tr14_1')">
                        <td height="40"><input name="LingFengNet_MS_autobak" type="text" value="<%=LingFengNet_MS_autobak%>" size="25" maxlength="2">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_27_0 %></td>
                      </tr>
                      <tr id=tr15 onMouseOver="javascript:tr_mouse_over('tr15')" 
              onMouseOut="javascript:tr_mouse_out('tr15')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messconten" value="<%=LingFengNet_MS_messconten%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_27_1 %></td>
                      </tr>
                      <tr id=tr16 onMouseOver="javascript:tr_mouse_over('tr16')" 
              onMouseOut="javascript:tr_mouse_out('tr16')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messadminlogin" value="<%=LingFengNet_MS_messadminlogin%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_27_2 %></td>
                      </tr>
                      <tr id=tr16_1 onMouseOver="javascript:tr_mouse_over('tr16_1')" 
              onMouseOut="javascript:tr_mouse_out('tr16_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_autoupdate" value="<%= LingFengNet_MS_autoupdate %>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_27_3 %></td>
                      </tr>
                      <tr>
                        <td height="40" colspan="2"><strong><%= LingFengNet_MS_language_mansys_mes_20_5 %></strong></td>
                      </tr>
					  <tr> 
                        <td colspan="2" height="1" class="bgc2"></td>
                      </tr>
                      <tr id=tr17 onMouseOver="javascript:tr_mouse_over('tr17')" 
              onMouseOut="javascript:tr_mouse_out('tr17')">
                        <td height="40"><input type="text" name="LingFengNet_MS_admindb" value="<%=LingFengNet_MS_admindb%>" size="25" readonly>                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_28 %></td>
                      </tr>
                      <%if LingFengNet_MS_admindb=1 then%>
                      <tr id=tr18 onMouseOver="javascript:tr_mouse_over('tr18')" 
              onMouseOut="javascript:tr_mouse_out('tr18')">
                        <td height="40"><textarea name="LingFengNet_MS_adminname" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_adminname)%></textarea>                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_29 %></td>
                      </tr>
                      <tr id=tr19 onMouseOver="javascript:tr_mouse_over('tr19')" onMouseOut="javascript:tr_mouse_out('tr19')">
                        <td height="40"><textarea name="LingFengNet_MS_adminpass" rows="6" cols="33"><%=tohh_chr(LingFengNet_MS_adminpass)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_30 %></td>
                      </tr>
                      <tr id=tr19_1 onMouseOver="javascript:tr_mouse_over('tr19_1')"  onMouseOut="javascript:tr_mouse_out('tr19_1')">
                        <td height="40"><textarea name="LingFengNet_MS_adminpublicname" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_adminpublicname)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_30_1 %></td>
                      </tr>
					  <%end if%>
                      <tr id=tr20 onMouseOver="javascript:tr_mouse_over('tr20')" 
              onMouseOut="javascript:tr_mouse_out('tr20')">
                        <td height="40"><textarea name="LingFengNet_MS_adminflg" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_adminflg)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_34 %></td>
                      </tr>
                      <tr id=tr21 onMouseOver="javascript:tr_mouse_over('tr21')" 
              onMouseOut="javascript:tr_mouse_out('tr21')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ipadmin" value="<%=LingFengNet_MS_ipadmin%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_35 %></td>
                      </tr>
                      <tr id=tr22 onMouseOver="javascript:tr_mouse_over('tr22')" 
              onMouseOut="javascript:tr_mouse_out('tr22')">
                        <td height="40"><input type="text" name="LingFengNet_MS_proxylf" value="<%=LingFengNet_MS_proxylf%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_36 %></td>
                      </tr>
                      <tr id=tr23 onMouseOver="javascript:tr_mouse_over('tr23')" 
              onMouseOut="javascript:tr_mouse_out('tr23')">
                        <td height="40">
                        <textarea name="LingFengNet_MS_user_admin_ip" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_user_admin_ip)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_37 %></td>
                      </tr>
                      <tr id=tr24 onMouseOver="javascript:tr_mouse_over('tr24')" 
              onMouseOut="javascript:tr_mouse_out('tr24')">
                        <td height="40"><input type="text" name="LingFengNet_MS_user_ippur" value="<%=LingFengNet_MS_user_ippur%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_39 %></td>
                      </tr>
                      <tr id=tr24_0 onMouseOver="javascript:tr_mouse_over('tr24_0')" 
              onMouseOut="javascript:tr_mouse_out('tr24_0')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ToMail_todo" value="<%=LingFengNet_MS_ToMail_todo%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_39_0 %></td>
                      </tr>
                      <tr id=tr24_1 onMouseOver="javascript:tr_mouse_over('tr24_1')" 
              onMouseOut="javascript:tr_mouse_out('tr24_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ToMail_ServerPost" value="<%=LingFengNet_MS_ToMail_ServerPost%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_39_1 %></td>
                      </tr>
                      <tr id=tr24_2 onMouseOver="javascript:tr_mouse_over('tr24_2')" 
              onMouseOut="javascript:tr_mouse_out('tr24_2')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ToMail_ServerAccount" value="<%=LingFengNet_MS_ToMail_ServerAccount%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_39_2 %></td>
                      </tr>
                      <tr id=tr24_3 onMouseOver="javascript:tr_mouse_over('tr24_3')" 
              onMouseOut="javascript:tr_mouse_out('tr24_3')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ToMail_ServerCommand" value="<%=LingFengNet_MS_ToMail_ServerCommand%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_39_3 %></td>
                      </tr>
                      <tr id=tr24_4 onMouseOver="javascript:tr_mouse_over('tr24_4')" 
              onMouseOut="javascript:tr_mouse_out('tr24_4')">
                        <td height="40"><textarea name="LingFengNet_MS_tomaillist" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_tomaillist)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_39_4 %></td>
                      </tr>
                      <tr> 
                        <td colspan="2" height="40"><strong><%= LingFengNet_MS_language_mansys_mes_21 %></strong></td>
                      </tr>
                      <tr> 
                        <td colspan="2" height="1" class="bgc2"></td>
                      </tr>
                      <tr id=tr25 onMouseOver="javascript:tr_mouse_over('tr25')" 
              onMouseOut="javascript:tr_mouse_out('tr25')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_how_filtrate" value="<%=LingFengNet_MS_how_filtrate%>" size="25">                        </td>
                        <td valign="middle" width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_22 %></td>
                      </tr>
                      <tr id=tr26 onMouseOver="javascript:tr_mouse_over('tr26')" 
              onMouseOut="javascript:tr_mouse_out('tr26')"> 
                        <td width="29%" height="40">
                        <textarea name="LingFengNet_MS_filtrate_word" rows="6" cols="23"><%=LingFengNet_MS_filtrate_word%></textarea></td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_23 %></td>
                      </tr>
                      <tr id=tr27 onMouseOver="javascript:tr_mouse_over('tr27')" 
              onMouseOut="javascript:tr_mouse_out('tr27')"> 
                        <td height="40">
<input type="text" name="LingFengNet_MS_maxword" value="<%=LingFengNet_MS_maxword%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_24 %></td>
                      </tr>
                      <tr id=tr28 onMouseOver="javascript:tr_mouse_over('tr28')" 
              onMouseOut="javascript:tr_mouse_out('tr28')">
                        <td height="40"><input type="text" name="LingFengNet_MS_maxword_re" value="<%=LingFengNet_MS_maxword_re%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_25 %></td>
                      </tr>
                      <tr> 
                        <td colspan="2" height="40"><strong><%= LingFengNet_MS_language_mansys_mes_26 %></strong></td>
                      </tr>
                      <tr> 
                        <td colspan="2" height="1" class="bgc2"></td>
                      </tr>
                      <tr id=tr29 onMouseOver="javascript:tr_mouse_over('tr29')" 
              onMouseOut="javascript:tr_mouse_out('tr29')">
                        <td height="40"><input type="text" name="LingFengNet_MS_mypagesize" value="<%=LingFengNet_MS_mypagesize%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40 %></td>
                      </tr>
                      <tr id=tr29_0 onMouseOver="javascript:tr_mouse_over('tr29_0')" 
              onMouseOut="javascript:tr_mouse_out('tr29_0')">
                        <td height="40"><input type="text" name="LingFengNet_MS_pagetosort" value="<%=LingFengNet_MS_pagetosort %>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_0%></td>
                      </tr>
                      <tr id=tr29_4 onMouseOver="javascript:tr_mouse_over('tr29_4')" 
              onMouseOut="javascript:tr_mouse_out('tr29_4')">
                        <td height="40"><input type="text" name="LingFengNet_MS_noaud" value="<%=LingFengNet_MS_noaud %>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_6%></td>
                      </tr>
                      <tr id=tr29_5 onMouseOver="javascript:tr_mouse_over('tr29_5')" 
              onMouseOut="javascript:tr_mouse_out('tr29_5')">
                        <td height="40"><input type="text" name="LingFengNet_MS_Rewrite" value="<%=LingFengNet_MS_Rewrite%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_7%></td>
                      </tr>
                      <tr id=tr29_1 onMouseOver="javascript:tr_mouse_over('tr29_1')" 
              onMouseOut="javascript:tr_mouse_out('tr29_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_add_news_1" value="<%=LingFengNet_MS_add_news_1%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_3 %></td>
                      </tr>
                      <tr id=tr29_2 onMouseOver="javascript:tr_mouse_over('tr29_2')" 
              onMouseOut="javascript:tr_mouse_out('tr29_2')">
                        <td height="40"><input type="text" name="LingFengNet_MS_add_news_2" value="addnew.html" size="25" readonly></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_4 %></td>
                      </tr>
                      <tr id=tr29_3 onMouseOver="javascript:tr_mouse_over('tr29_3')" 
              onMouseOut="javascript:tr_mouse_out('tr29_3')">
                        <td height="40"><input type="text" name="LingFengNet_MS_add_news_3" value="<%=LingFengNet_MS_add_news_3%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_5 %></td>
                      </tr>
                      <tr id=tr29_6 onMouseOver="javascript:tr_mouse_over('tr29_6')" 
              onMouseOut="javascript:tr_mouse_out('tr29_6')">
                        <td height="40"><input type="text" name="LingFengNet_MS_add_upload_1" value="<%=LingFengNet_MS_add_upload_1%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_8 %></td>
                      </tr>
                      <tr id=tr29_7 onMouseOver="javascript:tr_mouse_over('tr29_7')" 
              onMouseOut="javascript:tr_mouse_out('tr29_7')">
                        <td height="40"><input type="text" name="LingFengNet_MS_add_upload_2" value="<%=LingFengNet_MS_add_upload_2%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_9 %></td>
                      </tr>
                      <tr id=tr29_8 onMouseOver="javascript:tr_mouse_over('tr29_8')" 
              onMouseOut="javascript:tr_mouse_out('tr29_8')">
                        <td height="40"><textarea name="LingFengNet_MS_add_upload_3" rows="6" cols="23"><%=LingFengNet_MS_add_upload_3%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_10 %></td>
                      </tr>
                      <tr id=tr30 onMouseOver="javascript:tr_mouse_over('tr30')" 
              onMouseOut="javascript:tr_mouse_out('tr30')">
                        <td height="40"><input type="text" name="LingFengNet_MS_mymail" value="<%=LingFengNet_MS_mymail%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_1 %></td>
                      </tr>
                      <tr id=tr31 onMouseOver="javascript:tr_mouse_over('tr31')" 
              onMouseOut="javascript:tr_mouse_out('tr31')">
                        <td height="40"><input type="text" name="LingFengNet_MS_myqq" value="<%=LingFengNet_MS_myqq%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_40_2 %></td>
                      </tr>
                      <tr id=tr8 onMouseOver="javascript:tr_mouse_over('tr8')" 
              onMouseOut="javascript:tr_mouse_out('tr8')">
                        <td height="40"><input type="text" name="LingFengNet_MS_web_bs" value="<%=LingFengNet_MS_web_bs%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_1 %></td>
                      </tr>
                      <tr id=tr9 onMouseOver="javascript:tr_mouse_over('tr9')" 
              onMouseOut="javascript:tr_mouse_out('tr9')">
                        <td height="40"><input type="text" name="LingFengNet_MS_web_bs_lx" value="<%=LingFengNet_MS_web_bs_lx%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_20_2 %></td>
                      </tr>
                      <tr id=tr32 onMouseOver="javascript:tr_mouse_over('tr32')" 
              onMouseOut="javascript:tr_mouse_out('tr32')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messchina" value="<%=LingFengNet_MS_messchina%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_52 %></td>
                      </tr>
                      <tr id=tr33 onMouseOver="javascript:tr_mouse_over('tr33')" 
              onMouseOut="javascript:tr_mouse_out('tr33')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messreg" value="<%=LingFengNet_MS_messreg%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_53 %></td>
                      </tr>
					  <% If LingFengNet_MS_messreg = 2 Then %>
                      <tr id=tr33_1 onMouseOver="javascript:tr_mouse_over('tr33_1')" 
              onMouseOut="javascript:tr_mouse_out('tr33_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messreg_tx" value="<%=LingFengNet_MS_messreg_tx%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_53_1 %></td>
                      </tr>
					  <% End If %>
                      <tr id=tr33_2 onMouseOver="javascript:tr_mouse_over('tr33_2')" 
              onMouseOut="javascript:tr_mouse_out('tr33_2')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messlx" value="<%=LingFengNet_MS_messlx%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_53_2 %></td>
                      </tr>
                      <tr id=tr33_3 onMouseOver="javascript:tr_mouse_over('tr33_3')" 
              onMouseOut="javascript:tr_mouse_out('tr33_3')">
                        <td height="40"><textarea name="LingFengNet_MS_messlx_nr" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_messlx_nr)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_53_3 %></td>
                      </tr>
                      <tr id=tr34 onMouseOver="javascript:tr_mouse_over('tr34')" 
              onMouseOut="javascript:tr_mouse_out('tr34')"> 
                        <td width="29%" height="40"><input type="text" name="LingFengNet_MS_mypagesize_info" value="<%=LingFengNet_MS_mypagesize_info%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_41 %></td>
                      </tr>
                      <tr id=tr35 onMouseOver="javascript:tr_mouse_over('tr35')" 
              onMouseOut="javascript:tr_mouse_out('tr35')">
                        <td height="40"><input type="text" name="LingFengNet_MS_messguest" value="<%=LingFengNet_MS_messguest%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_49 %></td>
                      </tr>
                      <tr id=tr36 onMouseOver="javascript:tr_mouse_over('tr36')" 
              onMouseOut="javascript:tr_mouse_out('tr36')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ss" value="<%=LingFengNet_MS_ss%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_54 %></td>
                      </tr>
                      <tr id=tr36_1 onMouseOver="javascript:tr_mouse_over('tr36_1')" 
              onMouseOut="javascript:tr_mouse_out('tr36_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ss_dig" value="<%=LingFengNet_MS_ss_dig%>" size="25"></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_54_1 %></td>
                      </tr>                      
                      <tr id=tr37 onMouseOver="javascript:tr_mouse_over('tr37')" 
              onMouseOut="javascript:tr_mouse_out('tr37')"> 
                        <td height="40" width="29%"> <input type="text" name="LingFengNet_MS_oklist" value="<%=LingFengNet_MS_oklist%>" size="25">                        </td>
                        <td height="40" width="71%"><%= LingFengNet_MS_language_mansys_mes_42 %></td>
                      </tr>
                      <tr id=tr38 onMouseOver="javascript:tr_mouse_over('tr38')" 
              onMouseOut="javascript:tr_mouse_out('tr38')"> 
                        <td height="40" width="29%"> <input type="text" name="LingFengNet_MS_errlist" value="<%=LingFengNet_MS_errlist%>" size="25">                        </td>
                        <td height="40" width="71%"><%= LingFengNet_MS_language_mansys_mes_43 %></td>
                      </tr>
                      <tr id=tr39 onMouseOver="javascript:tr_mouse_over('tr39')" 
              onMouseOut="javascript:tr_mouse_out('tr39')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_mbl" value="<%=LingFengNet_MS_mbl%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_44 %></td>
                      </tr>
                      <tr id=tr40 onMouseOver="javascript:tr_mouse_over('tr40')" 
              onMouseOut="javascript:tr_mouse_out('tr40')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_pagemax" value="<%=LingFengNet_MS_pagemax%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_45 %></td>
                      </tr>
                      <tr id=tr41 onMouseOver="javascript:tr_mouse_over('tr41')" 
              onMouseOut="javascript:tr_mouse_out('tr41')">
                        <td height="40"><input type="text" name="LingFengNet_MS_refreshtime" value="<%=LingFengNet_MS_refreshtime%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_45_0 %></td>
                      </tr>
                      <tr>
                        <td height="40" colspan="2"><strong><%= LingFengNet_MS_language_mansys_mes_45_1 %></strong></td>
                      </tr>
                      <tr> 
                        <td colspan="2" height="1" class="bgc2"></td>
                      </tr>
                      <tr id=tr44 onMouseOver="javascript:tr_mouse_over('tr44')" 
              onMouseOut="javascript:tr_mouse_out('tr44')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ipadminlead" value="<%=LingFengNet_MS_ipadminlead%>" size="25">                        </td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_31 %></td>
                      </tr>
                      <tr id=tr45 onMouseOver="javascript:tr_mouse_over('tr45')" 
              onMouseOut="javascript:tr_mouse_out('tr45')">
                        <td height="40">
                        <textarea name="LingFengNet_MS_noadminiplead" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_noadminiplead)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_32 %></td>
                      </tr>
                      <tr id=tr46 onMouseOver="javascript:tr_mouse_over('tr46')" 
              onMouseOut="javascript:tr_mouse_out('tr46')">
                        <td height="40">
                        <textarea name="LingFengNet_MS_adminiplead" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_adminiplead)%></textarea></td>
                        <td height="40"><%= LingFengNet_MS_language_mansys_mes_33 %></td>
                      </tr>
                      <tr id=tr47 onMouseOver="javascript:tr_mouse_over('tr47')" 
              onMouseOut="javascript:tr_mouse_out('tr47')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_user_proxy" value="<%=LingFengNet_MS_user_proxy%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_46 %></td>
                      </tr>
                      <tr id=tr47_1 onMouseOver="javascript:tr_mouse_over('tr47_1')" 
              onMouseOut="javascript:tr_mouse_out('tr47_1')">
                        <td height="40"><input type="text" name="LingFengNet_MS_ynallow" value="<%=LingFengNet_MS_ynallow%>" size="25"></td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_46_1 %></td>
                      </tr>
                     <tr id=tr48 onMouseOver="javascript:tr_mouse_over('tr48')" 
              onMouseOut="javascript:tr_mouse_out('tr48')"> 
                        <td width="29%" height="40">
                        <textarea name="LingFengNet_MS_noallowip" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_noallowip)%></textarea></td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_47 %></td>
                      </tr>
                      <tr id=tr49 onMouseOver="javascript:tr_mouse_over('tr49')" 
              onMouseOut="javascript:tr_mouse_out('tr49')"> 
                        <td width="29%" height="40">
                        <textarea name="LingFengNet_MS_allowip" rows="6" cols="23"><%=tohh_chr(LingFengNet_MS_allowip)%></textarea></td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_48 %></td>
                      </tr>
                      <tr id=tr50 onMouseOver="javascript:tr_mouse_over('tr50')" 
              onMouseOut="javascript:tr_mouse_out('tr50')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_messdoor" value="<%=LingFengNet_MS_messdoor%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_55 %></td>
                      </tr>
                      <tr id=tr51 onMouseOver="javascript:tr_mouse_over('tr51')" 
              onMouseOut="javascript:tr_mouse_out('tr51')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_messdoortimes" value="<%=LingFengNet_MS_messdoortimes%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_56 %></td>
                      </tr>
                      <tr id=tr52 onMouseOver="javascript:tr_mouse_over('tr52')" 
              onMouseOut="javascript:tr_mouse_out('tr52')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_messdoorday" value="<%=LingFengNet_MS_messdoorday%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_57 %></td>
                      </tr>
                      <tr id=tr53 onMouseOver="javascript:tr_mouse_over('tr53')" 
              onMouseOut="javascript:tr_mouse_out('tr53')"> 
                        <td width="29%" height="40"> <input type="text" name="LingFengNet_MS_messdoorday_times" value="<%=LingFengNet_MS_messdoorday_times%>" size="25">                        </td>
                        <td width="71%" height="40"><%= LingFengNet_MS_language_mansys_mes_58 %></td>
                      </tr>
                    </table>
                    <p align="center">
                      <input type="submit" name="Submit" value="<%= LingFengNet_MS_language_mansys_mes_59 %>" class="buttonface">
                      <input type="hidden" name="set" value="ok">
                    </p>
                  </form>                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td></td>
  </tr>
</table>
</body>
</html>
<%
call htmlbr()
call htmlend()
response.end
else
call setsys()
end if
sub setsys()
%>
<!--#include file="inc/chkform.asp"-->
<!--#include file="inc/fw_rising.asp" -->
<%
randomize timer
s=1+int(rnd*10000)
adminbak_name = "config/recover/recover"& s &"_setup.asp"

writeStr=writeStr & "LingFengNet_MS_web_name=" &"""" & request.form("LingFengNet_MS_web_name") & """"&"    '你网站的名称" & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_url=" & """" &request.form("LingFengNet_MS_web_url") & """"&"    '你网站的URL"& chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_sys_name=" & """" &request.form("LingFengNet_MS_sys_name") & """"&"    '该留言系统名称"& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_sys_tem=" & chkquanban(request.form("LingFengNet_MS_sys_tem"))&"    '该系统的页面布局风格" & chr(13) & chr(10)  
if len(request.form("LingFengNet_MS_web_css"))>15 then
LingFengNet_MS_web_css=left(right(request.form("LingFengNet_MS_web_css"),15),11)
writeStr=writeStr & "LingFengNet_MS_web_css=" & """" &LingFengNet_MS_web_css& """"&"    '该系统的页面主题" & chr(13) & chr(10)  
LingFengNet_MS_web_css_read=left(request.form("LingFengNet_MS_web_css"),(int(len(request.form("LingFengNet_MS_web_css")))-16))
writeStr=writeStr & "LingFengNet_MS_web_css_read=" &  """" &LingFengNet_MS_web_css_read& """"&"    '该系统的页面主题说明"  & chr(13) & chr(10)  
else
writeStr=writeStr & "LingFengNet_MS_web_css=" & """" &LingFengNet_MS_web_css& """"&"    '该系统的页面主题" & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_css_read=" &  """" &LingFengNet_MS_web_css_read& """"&"    '该系统的页面主题说明"  & chr(13) & chr(10) 
end if
writeStr=writeStr & "LingFengNet_MS_web_ad=" & chkquanban(request.form("LingFengNet_MS_web_ad"))&"    '该系统的banner广告类型" & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_web_ad_url=" & """" &chan_chr(request.form("LingFengNet_MS_web_ad_url"))& """"&"    '该系统的banner广告信息" & chr(13) & chr(10)  
if request.form("LingFengNet_MS_web_psor")="1" then
writeStr=writeStr & "LingFengNet_MS_web_w="&"""" & chkquanban(request.form("LingFengNet_MS_web_w"))&""""&"    '该系统的页面宽度" & chr(13) & chr(10)  
end if
if request.form("LingFengNet_MS_web_psor")="2" then
writeStr=writeStr & "LingFengNet_MS_web_w=" & chkquanban(request.form("LingFengNet_MS_web_w"))&"    '该系统的页面宽度" & chr(13) & chr(10)
end if
writeStr=writeStr & "LingFengNet_MS_web_h=" & chkquanban(request.form("LingFengNet_MS_web_h"))&"    '该系统的区块间距" & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_f_s=" & chkquanban(request.form("LingFengNet_MS_web_f_s")) &" '留言及回复字体大小 " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_web_f_l=" & chkquanban(request.form("LingFengNet_MS_web_f_l"))  &" '留言及回复字体间距 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_bs=" & chkquanban(request.form("LingFengNet_MS_web_bs")) &"  '头像标示功能 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_bs_lx=" & chkquanban(request.form("LingFengNet_MS_web_bs_lx")) &"  '该系统的标示风格 " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_qq_ok=" & chkquanban(request.form("LingFengNet_MS_qq_ok")) &"    '是否开放QQ在线咨询功能 " &  chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_sousuo_lx=" & chkquanban(request.form("LingFengNet_MS_sousuo_lx")) &"    '访客用户查找留言方式 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_qq_lr=" & chkquanban(request.form("LingFengNet_MS_qq_lr")) &"    'QQ在线咨询面板在页面中的位置 " &  chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_qq_jihe=" & """" &tosh_chr(request.form("LingFengNet_MS_qq_jihe")) & """"&"    '用于QQ在线咨询功能的号码 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_qq_gg=" &  """" & nobr_no(request.form("LingFengNet_MS_qq_gg")) & """"&"    'QQ在线咨询面板里显示的提示语（18个字符以内）"  & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messadmin=" & chkquanban(request.form("LingFengNet_MS_messadmin")) &"    '是否开放留言时的官方通知 " &  chr(13) & chr(10) 
LingFengNet_MS_messadmin_mess=chkquanban(nobr(request.form("LingFengNet_MS_messadmin_mess")))
writeStr=writeStr & "LingFengNet_MS_messadmin_mess=" & """" & LingFengNet_MS_messadmin_mess & """" &"    '添加留言时显示的官方信息 "& chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_web_top=" & chkquanban(request.form("LingFengNet_MS_web_top")) &"  '该系统的头部样式类别 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_top_con=" & """" & chan_chr(request.form("LingFengNet_MS_web_top_con")) & """" &"   '该系统的头部样式说明 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_how_filtrate=" & chkquanban(request.form("LingFengNet_MS_how_filtrate")) &"   '垃圾信息处理方式 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_filtrate_word=" & """" & nobr_no(request.form("LingFengNet_MS_filtrate_word")) & """" &"    '被过滤的文字信息 "& chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_maxword=" & chkquanban(request.form("LingFengNet_MS_maxword")) &"    '允许发的留言正文最多的字数 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_maxword_re=" & chkquanban(request.form("LingFengNet_MS_maxword_re"))&"    '允许发的留言回复的最多的字数 " & chr(13) & chr(10) 
writeStr=writeStr & "db=" & """" &request.form("db") & """"&"    '数据库名称 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_autobak=" & chkquanban(request.form("LingFengNet_MS_autobak"))&"    '是否启用数据库自动备份功能。 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messconten=" & chkquanban(request.form("LingFengNet_MS_messconten"))&"    '是否启动数据库加密 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messadminlogin=" & chkquanban(request.form("LingFengNet_MS_messadminlogin"))&"    '是否在页面显示“管理入口”的连接。 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_autoupdate=" & chkquanban(request.form("LingFengNet_MS_autoupdate"))&"    '是否启用升级检测功能的自动提醒功能。 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_admindb=" & request.form("LingFengNet_MS_admindb")&"    '管理员资料存放方式 " & chr(13) & chr(10) 
if request.form("LingFengNet_MS_admindb")=1 then
writeStr=writeStr & "LingFengNet_MS_adminname=" & """" &tosh_chr(request.form("LingFengNet_MS_adminname")) & """"&"    '管理员姓名 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_adminpass=" & """" &toshpass_chr(request.form("LingFengNet_MS_adminpass")) & """"&"    '管理员密码 "& chr(13) & chr(10)
'writeStr=writeStr & "LingFengNet_MS_adminbak_name=" & """" & adminbak_name_sys & """"&"    '系统紧急恢复文件名 "& chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_adminpublicname=" & """" &tosh_chr(request.form("LingFengNet_MS_adminpublicname")) & """"&"    '管理员公开名称 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ipadminlead=" & chkquanban(request.form("LingFengNet_MS_ipadminlead"))&"    '超级管理登陆来源控制 " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_noadminiplead=" & """" & tosh_chr(chkquanban(request.form("LingFengNet_MS_noadminiplead"))) & """"&"    '不允许超级管理登陆的IP地址 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_adminiplead=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_adminiplead"))) & """"&"    '允许超级管理登陆的IP地址 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_adminflg=" & """" &tosh_chr(chkquanban(request.form("LingFengNet_MS_adminflg"))) & """"&"    '超级管理员权限 "&  chr(13) & chr(10) 
end if
writeStr=writeStr & "LingFengNet_MS_ipadmin=" &chkquanban(request.form("LingFengNet_MS_ipadmin")) &"    '是否允许使用IP验证管理员 "&  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_proxylf=" & chkquanban(request.form("LingFengNet_MS_proxylf"))&"    '是否允许用户使用代理服务器获得IP验证管理员 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_user_admin_ip=" & """" &chkquanban(tosh_chr(request.form("LingFengNet_MS_user_admin_ip"))) & """"&"    '具有管理权限的IP "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_user_ippur=" & chkquanban(nobr_no(request.form("LingFengNet_MS_user_ippur"))) &"    '分配给使用IP验证管理员的权限 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_todo=" &chkquanban(request.form("LingFengNet_MS_ToMail_todo")) &"    '是否允许使用电子邮件推送 "&  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_ServerPost=" & """" &request.form("LingFengNet_MS_ToMail_ServerPost") & """"&"    '邮件发件SMTP服务器地址 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_ServerAccount=" & """" &request.form("LingFengNet_MS_ToMail_ServerAccount") & """"&"    '默认电子邮箱登录用户名 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_ServerCommand=" & """" &request.form("LingFengNet_MS_ToMail_ServerCommand") & """"&"    '电子邮箱登录密码 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_tomaillist=" & """" &tosh_chr(request.form("LingFengNet_MS_tomaillist")) & """"&"    '管理员姓名 "& chr(13) & chr(10) 

writeStr=writeStr & "LingFengNet_MS_mypagesize=" & chkquanban(request.form("LingFengNet_MS_mypagesize"))  &"    '每页显示留言数 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_pagetosort=" & chkquanban(request.form("LingFengNet_MS_pagetosort"))  &"    '设定留言ID排序方式 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_noaud=" & chkquanban(request.form("LingFengNet_MS_noaud"))  &"    '设定是否对游客显示未审核留言条数 "& chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_Rewrite=" & chkquanban(request.form("LingFengNet_MS_Rewrite"))  &"    '设定是否启用伪静态 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_news_1=" & chkquanban(request.form("LingFengNet_MS_add_news_1"))  &"    '留言界面使用动态还是静态文件 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_news_2=" & """" &request.form("LingFengNet_MS_add_news_2")  & """"  &"    '静态留言文件的文件名 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_news_3=" & chkquanban(request.form("LingFengNet_MS_add_news_3"))  &"    '是否启用留言功能 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_upload_1=" & chkquanban(request.form("LingFengNet_MS_add_upload_1"))  &"    '是否启用附件上传功能 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_upload_2=" & chkquanban(request.form("LingFengNet_MS_add_upload_2"))  &"    '默认允许上传的最大文件 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_upload_3=" & """" &chkquanban(request.form("LingFengNet_MS_add_upload_3"))  & """"  &"    '默认允许上传的文件类型 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_mymail=" & chkquanban(request.form("LingFengNet_MS_mymail")) &"    '是否启用电子邮件 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_myqq=" & chkquanban(request.form("LingFengNet_MS_myqq"))  &"    '是否启用即时通讯工具 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_mypagesize_info=" & chkquanban(request.form("LingFengNet_MS_mypagesize_info")) &"    '信息汇总每页显示信息数 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_oklist=" & chkquanban(request.form("LingFengNet_MS_oklist")) &"    '合法登陆记录的天数 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_errlist=" & chkquanban(request.form("LingFengNet_MS_errlist")) &"    '非法登陆记录的天数 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_mbl=" & chkquanban(request.form("LingFengNet_MS_mbl")) &"    '数据库最大ID的位数 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_pagemax=" & chkquanban(request.form("LingFengNet_MS_pagemax")) &"    '页数最大ID的位数 " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_user_proxy=" & chkquanban(request.form("LingFengNet_MS_user_proxy")) &"    '访问者代理服务器权限控制 " & chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_ynallow=" & chkquanban(request.form("LingFengNet_MS_ynallow")) &"    '访问者来源控制 " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_noallowip=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_noallowip"))) & """"&"    '不仅允许访问IP "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_allowip=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_allowip"))) & """"&"    '仅允许访问IP "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messguest=" & chkquanban(request.form("LingFengNet_MS_messguest"))  &"    '是否开启游客访问被授权公开的留言 " &  chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_messchina=" & chkquanban(request.form("LingFengNet_MS_messchina")) &"    '是否开启姓名的中文验证 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ss=" & chkquanban(request.form("LingFengNet_MS_ss")) &"    '是否开启隐私保护功能 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messlx=" & chkquanban(request.form("LingFengNet_MS_messlx")) &"    '是否开启留言类型功能 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messlx_nr=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_messlx_nr"))) & """"&"    '留言类型的内容 "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ss_dig=" & chkquanban(request.form("LingFengNet_MS_ss_dig")) &"    '悄悄话密码位数 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messreg=" & chkquanban(request.form("LingFengNet_MS_messreg")) &"    '是否开启验证码功能 " &  chr(13) & chr(10)
If LingFengNet_MS_messreg = 2 Then
writeStr=writeStr & "LingFengNet_MS_messreg_tx=" & chkquanban(request.form("LingFengNet_MS_messreg_tx")) &"    '图形验证码功能的具体设置 " &  chr(13) & chr(10)  
End If
writeStr=writeStr & "LingFengNet_MS_messdoor=" & chkquanban(request.form("LingFengNet_MS_messdoor")) &"    '是否开启防骚扰功能 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messdoortimes=" & chkquanban(request.form("LingFengNet_MS_messdoortimes")) &"    '防骚扰功能的间隔时间 " &   chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messdoorday=" & chkquanban(request.form("LingFengNet_MS_messdoorday")) &"    '是否开启高级防骚扰功能 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messdoorday_times=" & chkquanban(request.form("LingFengNet_MS_messdoorday_times")) &"    '高级防骚扰功能的限制次数 " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_refreshtime=" & chkquanban(request.form("LingFengNet_MS_refreshtime")) &"    '首页自动刷新间隔时间 " &   chr(13) & chr(10) 

tpstr=replace(writestr,chr(13) & chr(10) ,"<br>")
tpstr="&lt;%<br>" & tpstr & "%&gt;"
writestr="<" & "%" & chr(13) & chr(10) & writestr & chr(13) & chr(10) & "%" & ">"
response.write tpstr

adminbak = adminbak & "LingFengNet_MS_adminname=" & """" &tosh_chr(request.form("LingFengNet_MS_adminname")) & """"&"    '管理员姓名 "& chr(13) & chr(10) 
adminbak = adminbak & "LingFengNet_MS_adminpass=" & """" &toshpass_chr(request.form("LingFengNet_MS_adminpass")) & """"&"    '管理员密码 "& chr(13) & chr(10)
adminbak = adminbak & "LingFengNet_MS_adminflg=" & """" &tosh_chr(chkquanban(request.form("LingFengNet_MS_adminflg"))) & """"&"    '管理员权限 "& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_name=""岭峰网""    '你网站的名称"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_url=""http://www.lfmesss.com""    '你网站的URL"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_sys_name=""行业专用留言系统""    '该留言系统名称"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_sys_tem=0    '该系统的页面布局风格"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_css=""a0509100101""    '该系统的页面主题"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_css_read=""蓝色淡雅""    '该系统的页面主题说明"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_ad=0    '该系统的banner广告类型"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_ad_url=""http://www.lfmesss.com""    '该系统的banner广告信息"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_w=""100%""    '该系统的页面宽度"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_h=2    '该系统的区块间距"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_f_s=9 '留言及回复字体大小 "& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_f_l=16 '留言及回复字体间距 "
adminbak = "<" & "%" & chr(13) & chr(10) & adminbak & chr(13) & chr(10) & "%" & ">"

if IsObjInstalled("Scripting.FileSystemObject") then
toppath = Server.Mappath("config/"& LingFengNet_MS_language_meta_mes_1 &"_setup.asp")
admin_toppath = Server.Mappath(""& adminbak_name &"")
del_admin_toppath = Server.Mappath("config/recover")
Set fs = CreateObject("scripting.filesystemobject")
Fs.copyfile toppath,server.mappath("config/bak_"& LingFengNet_MS_language_meta_mes_1 &"_setup.asp")
If Not Fs.FILEEXISTS(toppath) Then 
Set Ts = fs.createtextfile(toppath, True)
Ts.close
end if
Set Ts= Fs.OpenTextFile(toppath,2)
Ts.writeline (writeStr)
Ts.Close

If Not Fs.FILEEXISTS(admin_toppath) Then 

Set oFolder = fs.GetFolder(del_admin_toppath)
for each file in oFolder.Files	
	temp = del_admin_toppath & "/" & file.Name
fs.DeleteFile(temp)
next
set oFolder = nothing
set osubFolders = nothing

Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
filename=server.mappath("inc/recover.asp")
admin_recover_writestr = "<"&chr(37)&LingFengNet_MS_language_mansys_mes_61&chr(37)&">"
admin_recover_writestr = admin_recover_writestr & chr(13) & chr(10)&"<!-- "&chr(35) &"include file=""../"& adminbak_name &""" -->"
Set MyTextFile=MyFileObject.OpenTextFile(filename,2,TRUE)
MyTextFile.Write(admin_recover_writestr)
MyTextFile.Close

Set Ts = fs.createtextfile(admin_toppath, True)
Ts.close
end if
Set Ts= Fs.OpenTextFile(admin_toppath,2)
Ts.writeline (adminbak)
Ts.Close

Set Ts=Nothing
Set Fs=Nothing
if request.form("LingFengNet_MS_add_news_1")=1 then
LingFengNet_MS_language_Warning_mansys_XX=LingFengNet_MS_language_Warning_mansys_3
else
LingFengNet_MS_language_Warning_mansys_XX=LingFengNet_MS_language_Warning_mansys_1
end if
Response.write "<script Language=Javascript>alert('"& LingFengNet_MS_language_Warning_mansys_XX &"');this.location.href=""admin_mansys"&Get_Suffix()&"""</script>"
else
Response.write "<script Language=Javascript>alert('"& LingFengNet_MS_language_Warning_mansys_2 &"');this.location.href=""admin_mansys"&Get_Suffix()&"""</script>"
end if
end sub
%>