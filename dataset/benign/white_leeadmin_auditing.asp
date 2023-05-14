<!DOCTYPE html>
<%@ language="vbscript" codepage ="936" %>
<%
'========================================================================================
' 文 件 名: admin_auditing.asp
' 版    本: 岭峰网行业专用留言系统2.01.0 (LFMessS 2018 - 2.01.0.F Build 180123)
' 说    明: 留言审核文件 | 请勿自行修改该处文件，以确保程序正确的执行
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
<!-- #include file="inc/sub_inc.asp" -->
<!-- #include file="inc/ip_purview.asp" -->
<!-- #include file="inc/contencrypt.asp" -->
<%flg="man_ts"%>
<!-- #include file="inc/purview.asp" -->
<!-- #include file="inc/checkru.asp" -->
<!-- #include file="inc/connect.asp" -->
<%  
gbookid=Request.QueryString("page")
sql="select encrypt,username,content,re,Auditing,silentlywords,enpass,topok,addtime,filemulu,lylx,ip from lfmessb where id="&gbookid
Set rs = Server.CreateObject("ADODB.Recordset")
Rs.open sql,conn,0,1
if	rs("encrypt")=1	then
	username=DeCrypt(rs("username"))
	content=DeCrypt(rs("content"))
	ip=DeCrypt(rs("ip"))
	if rs("re")="0" then
		re="0"
	else
		re=DeCrypt(rs("re"))
	end if
else
	username=rs("username")
	content=rs("content")
	ip=rs("ip")
	re=rs("re")
	lylx=rs("lylx")
	addtime=rs("addtime")
	filemulu=rs("filemulu")
	filemulu_dow="<a href=upload/"& filemulu &">"& LingFengNet_MS_language_upload_11&filemulu & "</a>"
end if
Auditing=rs("Auditing")
silentlywords=rs("silentlywords")
enpass=rs("enpass")
topok=rs("topok")
	
if session("LingFengNet_MS_admin_flg")="1" and 	Auditing<>0 then
	response.write "<META http-equiv=Content-Type content=text/html;charset="& LingFengNet_MS_language_meta_mes_1 &"><script type='text/javascript'>" 
	response.write "alert('"& LingFengNet_MS_language_Auditing_nook &" ');" 
	response.write "history.go(-1);" 
	response.write "</script>" 
	response.end
end if	
%>
<head>
<title><%= LingFengNet_MS_language_title_Auditing %></title>
<%  
  call htmlmeta() 
  if re<>"0" then
	  retext = re
	  text_opentext="<textarea name=re rows=8 id=re style=width:100%; onkeydown=showcon('re'); onkeyup=showcon('re'); onclick=showcon('re');>"&retext&"</textarea>"
	  text_opentext_1="&ensp;["& LingFengNet_MS_language_Warning_addnew_7 &"&ensp;<strong><span id='showcon'>?</span></strong>&ensp;"& LingFengNet_MS_language_Warning_addnew_5 &"]<br>&ensp;["& LingFengNet_MS_language_Warning_addnew_8 &"&ensp;<strong>"&LingFengNet_MS_maxword_re&"</strong>&ensp;"& LingFengNet_MS_language_Warning_addnew_5 &"]<br>&ensp;[<a href=javascript:set_Size(3,'re');>"&  LingFengNet_MS_language_addnew_content_mes_2 &"</a>]<br>&ensp;[<a href=javascript:set_Size(-3,'re');>"&  LingFengNet_MS_language_addnew_content_mes_3 &"</a>]"
	  checked_id_6="checked"
  else
	  retext = LingFengNet_MS_language_Auditing_neizhi
	  text_opentext=""
  end if
%>
<link rel="stylesheet" href="style/css/<%=LingFengNet_MS_web_css%>.css" type="text/css">
<link rel="shortcut icon" href="pic/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="pic/favicon.ico" type="image/x-icon">
</head>
<body onkeydown=EnableKey();>
<%
	call htmltop()
	call htmlbr()
	call htmladminmen()	
	call htmlbr()
%>
<table width="<%=LingFengNet_MS_web_w%>" border="0" cellspacing="0" cellpadding="0" align="center">
  <form name="Auditing" method="post" action="admin_auditingok<%= Get_Suffix() %>">
    <tr>
      <td class="bgc2"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr class="bgc">
            <td width="25%" height="40" rowspan="6"><div align="center">&ensp;<%=LingFengNet_MS_language_Auditing_Appear_howdo%>: </div></td>
            <td height="30" width="75%"><table width="100%" border="0" cellspacing="6" cellpadding="0">
                <tr id=tr00 onMouseOver="javascript:tr_mouse_over('tr00')" 
              onMouseOut="javascript:tr_mouse_out('tr00')">
                  <td width="14%"><%=LingFengNet_MS_language_Auditing_username%>: </td>
                  <td width="86%"><div align="left"><%=username%>&ensp;&ensp;&ensp;&ensp;<a href=http://www.lfmesss.com/lfmesss/ip/index.asp?ip=<%= ip %>&search=<%= ip %> target="_blank"  title="『 <%= username %> 』<%= LingFengNet_MS_language_messdef_ipp %>: <%= ip %>"><img alt="『 <%= username %> 』<%= LingFengNet_MS_language_messdef_ipp %>: <%= ip %>" border="0" src="pic/IP.png" valign="middle">&ensp;<%= LingFengNet_MS_language_Auditing_ipp %></a></div></td>
                </tr>
              </table></td>
          </tr>
          <tr class="bgc">
            <td height="30"><table width="100%" border="0" cellspacing="6" cellpadding="0">
              <tr id=tr01 onMouseOver="javascript:tr_mouse_over('tr01')" 
              onMouseOut="javascript:tr_mouse_out('tr01')">
                <td width="14%"><%=LingFengNet_MS_language_Auditing_addtimes%>: </td>
                <td width="86%"><div align="left"><%=addtime%></div></td>
              </tr>
            </table></td>
          </tr>
          <tr class="bgc">
            <td height="30"><table width="100%" border="0" cellspacing="6" cellpadding="0">
                <tr id=tr02 onMouseOver="javascript:tr_mouse_over('tr02')" 
              onMouseOut="javascript:tr_mouse_out('tr02')">
                  <td width="14%"><%=LingFengNet_MS_language_Auditing_con%>: </td>
                  <td width="86%"><div align="left">
                      <% If session("LingFengNet_MS_admin_flg")="3" Then %>
                      <textarea name="content" rows="6" id=content style="width:100%;"><%=content%></textarea>
                      <%Else%>
                      <%=content%>
                      <%End If%>
                    </div></td>
                </tr>
              </table></td>
          </tr>
          <tr class="bgc">
            <td height="30"><table width="100%" border="0" cellspacing="6" cellpadding="0">
                <tr id=tr03 onMouseOver="javascript:tr_mouse_over('tr03')" 
              onMouseOut="javascript:tr_mouse_out('tr03')">
                  <td width="14%"><%=LingFengNet_MS_language_Auditing_filemulu%>: </td>
                  <td width="86%"><%if filemulu="0" then%>
                    <%=LingFengNet_MS_language_Auditing_filemulu_no%>
                    <%else%>
                    <%=filemulu_dow%><% If session("LingFengNet_MS_admin_flg")="3" Then %>&ensp;&ensp;&ensp;&ensp;<label><input name="filedelok" type="checkbox" id="filedelok" value="yes" >&ensp;<%=LingFengNet_MS_language_Auditing_filemulu_delok%></label><%End If%>
                    <%end if%></td>
                </tr>
              </table></td>
          </tr>
          <tr class="bgc">
            <td height="30"><table width="100%" border="0" cellspacing="6" cellpadding="0">
              <tr id=tr04 onMouseOver="javascript:tr_mouse_over('tr04')" 
              onMouseOut="javascript:tr_mouse_out('tr04')">
                <td width="14%"><%=LingFengNet_MS_language_Auditing_Appear%>: </td>
                <td width="86%"><%if Auditing=0 then%>
                  <%=LingFengNet_MS_language_Auditing_Appear_mes_1%>
                  <% checked_id_1="checked" %>
                  <%elseif Auditing=1 then%>
                  <%=LingFengNet_MS_language_Auditing_Appear_mes_2%>
                  <% checked_id_1="checked" %>
                  <%elseif Auditing=2 and re<>"" then%>
                  <%=LingFengNet_MS_language_Auditing_Appear_mes_3%>
                  <% checked_id_2="checked" %>
                  <%elseif Auditing=2 then%>
                  <%=LingFengNet_MS_language_Auditing_Appear_mes_4%>
                  <% checked_id_3="checked" %>
                  <%elseif Auditing=3 then%>
                  <%=LingFengNet_MS_language_Auditing_Appear_mes_5%>
                  <% checked_id_4="checked" %>
                  <%elseif Auditing=5 then%>
                  <%=LingFengNet_MS_language_Auditing_Appear_mes_6%>
                  <% checked_id_5="checked" %>
                  <%end if%></td>
              </tr>
            </table></td>
          </tr>
          <tr class="bgc">
            <td height="30"><table width="100%" border="0" cellspacing="8" cellpadding="0">
                <tr id=tr0 onMouseOver="javascript:tr_mouse_over('tr0')" 
              onMouseOut="javascript:tr_mouse_out('tr0')">
                  <td height="30" colspan="2"><label>
                      <input type="radio" onClick="closetext()" name="sh" value="1" <%= checked_id_1 %>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_1%></label></td>
                </tr>
                <tr id=tr1 onMouseOver="javascript:tr_mouse_over('tr1')" 
              onMouseOut="javascript:tr_mouse_out('tr1')">
                  <td height="30" colspan="2"><label>
                      <input type="radio" onClick="closetext()" name="sh" value="2" <%= checked_id_2 %>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_2%></label></td>
                </tr>
                <tr id=tr2 onMouseOver="javascript:tr_mouse_over('tr2')" 
              onMouseOut="javascript:tr_mouse_out('tr2')">
                  <td height="30" colspan="2"><label>
                      <input type="radio" onClick="closetext()" name="sh" value="3" <%= checked_id_3 %>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_3%></label></td>
                </tr>
                <tr id=tr3 onMouseOver="javascript:tr_mouse_over('tr3')" 
              onMouseOut="javascript:tr_mouse_out('tr3')">
                  <td height="30" colspan="2"><label>
                      <input type="radio" onClick="closetext()" name="sh" value="0" <%= checked_id_4 %>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_4%></label></td>
                </tr>
                <tr id=tr4 onMouseOver="javascript:tr_mouse_over('tr4')" 
              onMouseOut="javascript:tr_mouse_out('tr4')">
                  <td height="30" colspan="2"><label>
                      <input type="radio" onClick="closetext()" name="sh" value="5" <%= checked_id_5 %>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_8%></label></td>
                </tr>
                <tr id=tr5 onMouseOver="javascript:tr_mouse_over('tr5')" 
              onMouseOut="javascript:tr_mouse_out('tr5')">
                  <td height="30" colspan="2"><label>
                      <input type="radio" name="sh" value="4" onClick="opentext()" <%= checked_id_6 %>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_5%><%=LingFengNet_MS_maxword_re%><%=LingFengNet_MS_language_Auditing_Appear_howdo_6%></label></td>
                </tr>
                <tr id=tr6 onMouseOver="javascript:tr_mouse_over('tr6')" 
              onMouseOut="javascript:tr_mouse_out('tr6')">
                  <td height="30" colspan="2"><label>
                      <input name="yesword" type="checkbox" id="yesword" value="yes" <%if silentlywords=1 then%>checked<%else%> disabled<%end if%>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_7%></label></td>
                </tr>
                <tr id=tr7 onMouseOver="javascript:tr_mouse_over('tr7')" 
              onMouseOut="javascript:tr_mouse_out('tr7')">
                  <td height="30" colspan="2"><label>
                      <input name="topok" type="checkbox" id="topok" value="yes" <%if topok=0 then%>checked<%end if%>>
                      <%=LingFengNet_MS_language_Auditing_Appear_howdo_9%></label></td>
                </tr>
                <tr id=tr08 onMouseOver="javascript:tr_mouse_over('tr08')" 
              onMouseOut="javascript:tr_mouse_out('tr08')">
                  <td width="85%" height="30"><div id="opentext"><%=text_opentext%></div></td>
                  <td width="15%" height="30" align="left" valign="bottom"><div id="opentext_1"><%=text_opentext_1%></div></td>
                </tr>
              </table></td>
          </tr>
          <tr class="bgc">
            <td colspan="2" height="40"><div align="center">
                <input type="submit" name="Submit" value="<%=LingFengNet_MS_language_Auditing_sub_1%>" class="buttonface">
                &ensp;&ensp;&ensp;&ensp;
                <input type="reset" name="Submit" value="<%=LingFengNet_MS_language_Auditing_sub_2%>" class="buttonface">
              </div></td>
          </tr>
        </table></td>
    </tr>
    <input name=gbookid type=hidden id="gbookid" value="<%=gbookid%>">
    <input name=reok type=hidden id="reok" value="">
    <input name=enpass type=hidden id="enpass" value="<%=enpass%>">
    <input name=wherefrom type=hidden id="wherefrom" value="<%=Get_ReplaceSuffix(Cstr(Request.ServerVariables("HTTP_REFERER")))%>">
  </form>
</table>
<script language="JavaScript" type="text/javascript" src="inc/mouseok.js"></script> 
<script language="javascript">
var maxword = <%= LingFengNet_MS_maxword_re %>;
function opentext(){
  document.getElementById("opentext").innerHTML = "<textarea name=re rows=8 id=re style=width:100%; onkeydown=showcon('re'); onkeyup=showcon('re');><%=retext%></textarea>";
  document.getElementById("opentext_1").innerHTML = "&ensp;[<%= LingFengNet_MS_language_Warning_addnew_7 %>&ensp;<strong><span id='showcon'></span></strong>&ensp;<%= LingFengNet_MS_language_Warning_addnew_5 %>]<br>&ensp;[<%= LingFengNet_MS_language_Warning_addnew_8 %>&ensp;<strong>"+maxword+"</strong>&ensp;<%= LingFengNet_MS_language_Warning_addnew_5 %>]<br>&ensp;[<a href=javascript:set_Size(3,'re');><%= LingFengNet_MS_language_addnew_content_mes_2 %></a>]<br>&ensp;[<a href=javascript:set_Size(-3,'re');><%= LingFengNet_MS_language_addnew_content_mes_3 %></a>";
  showcon("re")
}

function closetext(){
  document.getElementById("opentext").innerHTML = "";
  document.getElementById("opentext_1").innerHTML = "";
}

function showcon(theform) {
	message = document.getElementById(theform).value.length
	messagetxt = document.getElementById(theform).value
	document.getElementById("showcon").innerHTML = message;
	document.getElementById("reok").value = messagetxt;
}

function set_Size(num,objname){
	var obj=document.getElementById(objname)
	if (parseInt(obj.rows)+num>=3) {
		obj.rows = parseInt(obj.rows) + num;	
	}
	if (num>0)
	{
		obj.width="90%";
	}
}
showcon('re');
</script>
</body>
</html>
<%
	call htmlbr()
	call htmlend()
%>