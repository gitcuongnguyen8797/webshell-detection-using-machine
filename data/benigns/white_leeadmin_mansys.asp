<!DOCTYPE html>
<%
'========================================================================================
' �� �� ��: admin_mansys.asp
' ��    ��: �������ҵר������ϵͳ2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' ˵    ��: ϵͳ��������ͼ�νӿ� | ���������޸ĸô��ļ�Դ���룬��ȷ��������ȷ��ִ��
' �ļ�����: 2018-01-23
' �� �� ��: ����֮��
'========================================================================================
' ֣���Ĵ��������Ƽ����޹�˾.
'========================================================================================
' Copyright (C) 2001-2018 �����. All rights reserved.
' ��    վ: http://www.lfmesss.com
' �����ʼ�: support@lfmesss.com
' ��ϵ�ѣ�: 85112407
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

writeStr=writeStr & "LingFengNet_MS_web_name=" &"""" & request.form("LingFengNet_MS_web_name") & """"&"    '����վ������" & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_url=" & """" &request.form("LingFengNet_MS_web_url") & """"&"    '����վ��URL"& chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_sys_name=" & """" &request.form("LingFengNet_MS_sys_name") & """"&"    '������ϵͳ����"& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_sys_tem=" & chkquanban(request.form("LingFengNet_MS_sys_tem"))&"    '��ϵͳ��ҳ�沼�ַ��" & chr(13) & chr(10)  
if len(request.form("LingFengNet_MS_web_css"))>15 then
LingFengNet_MS_web_css=left(right(request.form("LingFengNet_MS_web_css"),15),11)
writeStr=writeStr & "LingFengNet_MS_web_css=" & """" &LingFengNet_MS_web_css& """"&"    '��ϵͳ��ҳ������" & chr(13) & chr(10)  
LingFengNet_MS_web_css_read=left(request.form("LingFengNet_MS_web_css"),(int(len(request.form("LingFengNet_MS_web_css")))-16))
writeStr=writeStr & "LingFengNet_MS_web_css_read=" &  """" &LingFengNet_MS_web_css_read& """"&"    '��ϵͳ��ҳ������˵��"  & chr(13) & chr(10)  
else
writeStr=writeStr & "LingFengNet_MS_web_css=" & """" &LingFengNet_MS_web_css& """"&"    '��ϵͳ��ҳ������" & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_css_read=" &  """" &LingFengNet_MS_web_css_read& """"&"    '��ϵͳ��ҳ������˵��"  & chr(13) & chr(10) 
end if
writeStr=writeStr & "LingFengNet_MS_web_ad=" & chkquanban(request.form("LingFengNet_MS_web_ad"))&"    '��ϵͳ��banner�������" & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_web_ad_url=" & """" &chan_chr(request.form("LingFengNet_MS_web_ad_url"))& """"&"    '��ϵͳ��banner�����Ϣ" & chr(13) & chr(10)  
if request.form("LingFengNet_MS_web_psor")="1" then
writeStr=writeStr & "LingFengNet_MS_web_w="&"""" & chkquanban(request.form("LingFengNet_MS_web_w"))&""""&"    '��ϵͳ��ҳ����" & chr(13) & chr(10)  
end if
if request.form("LingFengNet_MS_web_psor")="2" then
writeStr=writeStr & "LingFengNet_MS_web_w=" & chkquanban(request.form("LingFengNet_MS_web_w"))&"    '��ϵͳ��ҳ����" & chr(13) & chr(10)
end if
writeStr=writeStr & "LingFengNet_MS_web_h=" & chkquanban(request.form("LingFengNet_MS_web_h"))&"    '��ϵͳ��������" & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_f_s=" & chkquanban(request.form("LingFengNet_MS_web_f_s")) &" '���Լ��ظ������С " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_web_f_l=" & chkquanban(request.form("LingFengNet_MS_web_f_l"))  &" '���Լ��ظ������� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_bs=" & chkquanban(request.form("LingFengNet_MS_web_bs")) &"  'ͷ���ʾ���� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_bs_lx=" & chkquanban(request.form("LingFengNet_MS_web_bs_lx")) &"  '��ϵͳ�ı�ʾ��� " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_qq_ok=" & chkquanban(request.form("LingFengNet_MS_qq_ok")) &"    '�Ƿ񿪷�QQ������ѯ���� " &  chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_sousuo_lx=" & chkquanban(request.form("LingFengNet_MS_sousuo_lx")) &"    '�ÿ��û��������Է�ʽ " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_qq_lr=" & chkquanban(request.form("LingFengNet_MS_qq_lr")) &"    'QQ������ѯ�����ҳ���е�λ�� " &  chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_qq_jihe=" & """" &tosh_chr(request.form("LingFengNet_MS_qq_jihe")) & """"&"    '����QQ������ѯ���ܵĺ��� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_qq_gg=" &  """" & nobr_no(request.form("LingFengNet_MS_qq_gg")) & """"&"    'QQ������ѯ�������ʾ����ʾ�18���ַ����ڣ�"  & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messadmin=" & chkquanban(request.form("LingFengNet_MS_messadmin")) &"    '�Ƿ񿪷�����ʱ�Ĺٷ�֪ͨ " &  chr(13) & chr(10) 
LingFengNet_MS_messadmin_mess=chkquanban(nobr(request.form("LingFengNet_MS_messadmin_mess")))
writeStr=writeStr & "LingFengNet_MS_messadmin_mess=" & """" & LingFengNet_MS_messadmin_mess & """" &"    '�������ʱ��ʾ�Ĺٷ���Ϣ "& chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_web_top=" & chkquanban(request.form("LingFengNet_MS_web_top")) &"  '��ϵͳ��ͷ����ʽ��� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_web_top_con=" & """" & chan_chr(request.form("LingFengNet_MS_web_top_con")) & """" &"   '��ϵͳ��ͷ����ʽ˵�� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_how_filtrate=" & chkquanban(request.form("LingFengNet_MS_how_filtrate")) &"   '������Ϣ����ʽ " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_filtrate_word=" & """" & nobr_no(request.form("LingFengNet_MS_filtrate_word")) & """" &"    '�����˵�������Ϣ "& chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_maxword=" & chkquanban(request.form("LingFengNet_MS_maxword")) &"    '���������������������� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_maxword_re=" & chkquanban(request.form("LingFengNet_MS_maxword_re"))&"    '���������Իظ����������� " & chr(13) & chr(10) 
writeStr=writeStr & "db=" & """" &request.form("db") & """"&"    '���ݿ����� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_autobak=" & chkquanban(request.form("LingFengNet_MS_autobak"))&"    '�Ƿ��������ݿ��Զ����ݹ��ܡ� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messconten=" & chkquanban(request.form("LingFengNet_MS_messconten"))&"    '�Ƿ��������ݿ���� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messadminlogin=" & chkquanban(request.form("LingFengNet_MS_messadminlogin"))&"    '�Ƿ���ҳ����ʾ��������ڡ������ӡ� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_autoupdate=" & chkquanban(request.form("LingFengNet_MS_autoupdate"))&"    '�Ƿ�����������⹦�ܵ��Զ����ѹ��ܡ� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_admindb=" & request.form("LingFengNet_MS_admindb")&"    '����Ա���ϴ�ŷ�ʽ " & chr(13) & chr(10) 
if request.form("LingFengNet_MS_admindb")=1 then
writeStr=writeStr & "LingFengNet_MS_adminname=" & """" &tosh_chr(request.form("LingFengNet_MS_adminname")) & """"&"    '����Ա���� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_adminpass=" & """" &toshpass_chr(request.form("LingFengNet_MS_adminpass")) & """"&"    '����Ա���� "& chr(13) & chr(10)
'writeStr=writeStr & "LingFengNet_MS_adminbak_name=" & """" & adminbak_name_sys & """"&"    'ϵͳ�����ָ��ļ��� "& chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_adminpublicname=" & """" &tosh_chr(request.form("LingFengNet_MS_adminpublicname")) & """"&"    '����Ա�������� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ipadminlead=" & chkquanban(request.form("LingFengNet_MS_ipadminlead"))&"    '���������½��Դ���� " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_noadminiplead=" & """" & tosh_chr(chkquanban(request.form("LingFengNet_MS_noadminiplead"))) & """"&"    '�������������½��IP��ַ "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_adminiplead=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_adminiplead"))) & """"&"    '�����������½��IP��ַ "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_adminflg=" & """" &tosh_chr(chkquanban(request.form("LingFengNet_MS_adminflg"))) & """"&"    '��������ԱȨ�� "&  chr(13) & chr(10) 
end if
writeStr=writeStr & "LingFengNet_MS_ipadmin=" &chkquanban(request.form("LingFengNet_MS_ipadmin")) &"    '�Ƿ�����ʹ��IP��֤����Ա "&  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_proxylf=" & chkquanban(request.form("LingFengNet_MS_proxylf"))&"    '�Ƿ������û�ʹ�ô�����������IP��֤����Ա " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_user_admin_ip=" & """" &chkquanban(tosh_chr(request.form("LingFengNet_MS_user_admin_ip"))) & """"&"    '���й���Ȩ�޵�IP "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_user_ippur=" & chkquanban(nobr_no(request.form("LingFengNet_MS_user_ippur"))) &"    '�����ʹ��IP��֤����Ա��Ȩ�� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_todo=" &chkquanban(request.form("LingFengNet_MS_ToMail_todo")) &"    '�Ƿ�����ʹ�õ����ʼ����� "&  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_ServerPost=" & """" &request.form("LingFengNet_MS_ToMail_ServerPost") & """"&"    '�ʼ�����SMTP��������ַ "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_ServerAccount=" & """" &request.form("LingFengNet_MS_ToMail_ServerAccount") & """"&"    'Ĭ�ϵ��������¼�û��� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ToMail_ServerCommand=" & """" &request.form("LingFengNet_MS_ToMail_ServerCommand") & """"&"    '���������¼���� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_tomaillist=" & """" &tosh_chr(request.form("LingFengNet_MS_tomaillist")) & """"&"    '����Ա���� "& chr(13) & chr(10) 

writeStr=writeStr & "LingFengNet_MS_mypagesize=" & chkquanban(request.form("LingFengNet_MS_mypagesize"))  &"    'ÿҳ��ʾ������ "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_pagetosort=" & chkquanban(request.form("LingFengNet_MS_pagetosort"))  &"    '�趨����ID����ʽ "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_noaud=" & chkquanban(request.form("LingFengNet_MS_noaud"))  &"    '�趨�Ƿ���ο���ʾδ����������� "& chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_Rewrite=" & chkquanban(request.form("LingFengNet_MS_Rewrite"))  &"    '�趨�Ƿ�����α��̬ "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_news_1=" & chkquanban(request.form("LingFengNet_MS_add_news_1"))  &"    '���Խ���ʹ�ö�̬���Ǿ�̬�ļ� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_news_2=" & """" &request.form("LingFengNet_MS_add_news_2")  & """"  &"    '��̬�����ļ����ļ��� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_news_3=" & chkquanban(request.form("LingFengNet_MS_add_news_3"))  &"    '�Ƿ��������Թ��� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_upload_1=" & chkquanban(request.form("LingFengNet_MS_add_upload_1"))  &"    '�Ƿ����ø����ϴ����� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_upload_2=" & chkquanban(request.form("LingFengNet_MS_add_upload_2"))  &"    'Ĭ�������ϴ�������ļ� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_add_upload_3=" & """" &chkquanban(request.form("LingFengNet_MS_add_upload_3"))  & """"  &"    'Ĭ�������ϴ����ļ����� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_mymail=" & chkquanban(request.form("LingFengNet_MS_mymail")) &"    '�Ƿ����õ����ʼ� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_myqq=" & chkquanban(request.form("LingFengNet_MS_myqq"))  &"    '�Ƿ����ü�ʱͨѶ���� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_mypagesize_info=" & chkquanban(request.form("LingFengNet_MS_mypagesize_info")) &"    '��Ϣ����ÿҳ��ʾ��Ϣ�� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_oklist=" & chkquanban(request.form("LingFengNet_MS_oklist")) &"    '�Ϸ���½��¼������ " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_errlist=" & chkquanban(request.form("LingFengNet_MS_errlist")) &"    '�Ƿ���½��¼������ " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_mbl=" & chkquanban(request.form("LingFengNet_MS_mbl")) &"    '���ݿ����ID��λ�� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_pagemax=" & chkquanban(request.form("LingFengNet_MS_pagemax")) &"    'ҳ�����ID��λ�� " & chr(13) & chr(10)
writeStr=writeStr & "LingFengNet_MS_user_proxy=" & chkquanban(request.form("LingFengNet_MS_user_proxy")) &"    '�����ߴ��������Ȩ�޿��� " & chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_ynallow=" & chkquanban(request.form("LingFengNet_MS_ynallow")) &"    '��������Դ���� " & chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_noallowip=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_noallowip"))) & """"&"    '�����������IP "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_allowip=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_allowip"))) & """"&"    '���������IP "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messguest=" & chkquanban(request.form("LingFengNet_MS_messguest"))  &"    '�Ƿ����οͷ��ʱ���Ȩ���������� " &  chr(13) & chr(10)  
writeStr=writeStr & "LingFengNet_MS_messchina=" & chkquanban(request.form("LingFengNet_MS_messchina")) &"    '�Ƿ���������������֤ " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ss=" & chkquanban(request.form("LingFengNet_MS_ss")) &"    '�Ƿ�����˽�������� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messlx=" & chkquanban(request.form("LingFengNet_MS_messlx")) &"    '�Ƿ����������͹��� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messlx_nr=" & """" & chkquanban(tosh_chr(request.form("LingFengNet_MS_messlx_nr"))) & """"&"    '�������͵����� "& chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_ss_dig=" & chkquanban(request.form("LingFengNet_MS_ss_dig")) &"    '���Ļ�����λ�� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messreg=" & chkquanban(request.form("LingFengNet_MS_messreg")) &"    '�Ƿ�����֤�빦�� " &  chr(13) & chr(10)
If LingFengNet_MS_messreg = 2 Then
writeStr=writeStr & "LingFengNet_MS_messreg_tx=" & chkquanban(request.form("LingFengNet_MS_messreg_tx")) &"    'ͼ����֤�빦�ܵľ������� " &  chr(13) & chr(10)  
End If
writeStr=writeStr & "LingFengNet_MS_messdoor=" & chkquanban(request.form("LingFengNet_MS_messdoor")) &"    '�Ƿ�����ɧ�Ź��� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messdoortimes=" & chkquanban(request.form("LingFengNet_MS_messdoortimes")) &"    '��ɧ�Ź��ܵļ��ʱ�� " &   chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messdoorday=" & chkquanban(request.form("LingFengNet_MS_messdoorday")) &"    '�Ƿ����߼���ɧ�Ź��� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_messdoorday_times=" & chkquanban(request.form("LingFengNet_MS_messdoorday_times")) &"    '�߼���ɧ�Ź��ܵ����ƴ��� " &  chr(13) & chr(10) 
writeStr=writeStr & "LingFengNet_MS_refreshtime=" & chkquanban(request.form("LingFengNet_MS_refreshtime")) &"    '��ҳ�Զ�ˢ�¼��ʱ�� " &   chr(13) & chr(10) 

tpstr=replace(writestr,chr(13) & chr(10) ,"<br>")
tpstr="&lt;%<br>" & tpstr & "%&gt;"
writestr="<" & "%" & chr(13) & chr(10) & writestr & chr(13) & chr(10) & "%" & ">"
response.write tpstr

adminbak = adminbak & "LingFengNet_MS_adminname=" & """" &tosh_chr(request.form("LingFengNet_MS_adminname")) & """"&"    '����Ա���� "& chr(13) & chr(10) 
adminbak = adminbak & "LingFengNet_MS_adminpass=" & """" &toshpass_chr(request.form("LingFengNet_MS_adminpass")) & """"&"    '����Ա���� "& chr(13) & chr(10)
adminbak = adminbak & "LingFengNet_MS_adminflg=" & """" &tosh_chr(chkquanban(request.form("LingFengNet_MS_adminflg"))) & """"&"    '����ԱȨ�� "& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_name=""�����""    '����վ������"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_url=""http://www.lfmesss.com""    '����վ��URL"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_sys_name=""��ҵר������ϵͳ""    '������ϵͳ����"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_sys_tem=0    '��ϵͳ��ҳ�沼�ַ��"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_css=""a0509100101""    '��ϵͳ��ҳ������"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_css_read=""��ɫ����""    '��ϵͳ��ҳ������˵��"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_ad=0    '��ϵͳ��banner�������"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_ad_url=""http://www.lfmesss.com""    '��ϵͳ��banner�����Ϣ"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_w=""100%""    '��ϵͳ��ҳ����"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_h=2    '��ϵͳ��������"& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_f_s=9 '���Լ��ظ������С "& chr(13) & chr(10)
adminbak=adminbak & "LingFengNet_MS_web_f_l=16 '���Լ��ظ������� "
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