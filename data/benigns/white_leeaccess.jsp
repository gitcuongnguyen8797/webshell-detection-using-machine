<%@ page contentType="text/html;charset=UTF-8" errorPage="../error.jsp"%>
<%@ page import="com.hongshee.ejforum.util.PageUtils"%>
<%@ page import="com.hongshee.ejforum.data.UserDAO.UserInfo"%>
<%@ page import="com.hongshee.ejforum.common.ForumSetting"%>
<%
	UserInfo userinfo = PageUtils.getAdminUser(request, response);
	if (userinfo == null) return;
	ForumSetting setting = ForumSetting.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<LINK href="../style/admin.css" type=text/css rel=stylesheet>
<SCRIPT src="../../js/common.js" type=text/javascript></SCRIPT>
<SCRIPT src="../js/admin.js" type=text/javascript></SCRIPT>
</HEAD>
<BODY topMargin=10>
<TABLE cellSpacing=6 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE class=guide cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD><A onclick="parent.location='../index.htm'; return false;" 
		  	href="#">后台管理首页</A>&nbsp;&raquo;&nbsp;注册与访问控制</TD></TR></TBODY></TABLE><BR>
      <FORM id=settings name=settings onSubmit="checkfields(this); return false;" action="../perform.jsp" method=post>
	  <INPUT type=hidden name="act" value="basic_access">
		<A name=tb01></A>
      <TABLE class=info_tb cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR class=header>
          <TD colSpan=2>注册相关设置<A onClick="collapse_change('tb01','../images')" href="#"><IMG 
            id=menuimg_tb01 style="MARGIN-TOP: -12px; FLOAT: right; MARGIN-RIGHT: 8px" 
            src="../images/menu_reduce.gif" border=0></A> </TD></TR>
        <TBODY id=menu_tb01>
        <TR>
          <TD class=altbg1 width="45%"><B>新用户注册方式:</B><BR><SPAN 
            class=smalltxt><%= PageUtils.getString("access_1") %></SPAN></TD>
          <TD class=altbg2>
		  	<INPUT class=radio type=radio CHECKED 
            value="open" name=registerType id=registerType[open]> 开放式注册 - 注册后立即成为会员<BR>
			<INPUT class=radio type=radio value="close" 
            name=registerType id=registerType[close]> 封闭式注册 - 注册后需要经过人工审核才能成为会员<BR></TD></TR>
        <TR>
          <TD class=altbg1 vAlign=top width="45%"><B>用户信息保留关键字:</B><BR><SPAN 
            class=smalltxt><%= PageUtils.getString("access_2") %></SPAN></TD>
          <TD class=altbg2>
		  	<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('reserveWords', 1)" src="../images/zoomin.gif"> 
			<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('reserveWords', 0)" src="../images/zoomout.gif">
            <BR><TEXTAREA id=reserveWords name=reserveWords rows=6 cols=50 style="width:278px"></TEXTAREA></TD></TR>
        <TR>
          <TD class=altbg1 width="45%"><B>注册用户有效期限制(天):</B><BR><SPAN 
            class=smalltxt><%= PageUtils.getString("access_3") %></SPAN></TD>
          <TD class=altbg2><INPUT size=50 value=0 id=userExpireDays name=userExpireDays> 
          </TD></TR>
		</TBODY></TABLE><BR>
		<A name=tb02></A>
      <TABLE class=info_tb cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR class=header>
          <TD colSpan=2>访问控制相关设置<A onclick="collapse_change('tb02','../images')" href="#">
		  <IMG id=menuimg_tb02 style="MARGIN-TOP: -12px; FLOAT: right; MARGIN-RIGHT: 8px" 
		  	   src="../images/menu_reduce.gif" border=0></A> </TD></TR>
        <TBODY id=menu_tb02>
		<TR>
          <TD class=altbg1 vAlign=top width="45%"><B>IP 禁止列表:</B><BR><SPAN 
		    class=smalltxt><%= PageUtils.getString("access_4") %></SPAN></TD>
          <TD class=altbg2>
		  	<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('ipBanned', 1)" src="../images/zoomin.gif"> 
			<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('ipBanned', 0)" src="../images/zoomout.gif">
			<BR><TEXTAREA id=ipBanned name=ipBanned rows=6 cols=50 style="width:278px"></TEXTAREA></TD></TR>
        <TR>
          <TD class=altbg1 vAlign=top width="45%"><B>IP 访问列表:</B><BR><SPAN 
		   class=smalltxt><%= PageUtils.getString("access_5") %></SPAN></TD>
          <TD class=altbg2>
		  	<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('ipAllowed', 1)" src="../images/zoomin.gif"> 
			<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('ipAllowed', 0)" src="../images/zoomout.gif">
            <BR><TEXTAREA id=ipAllowed name=ipAllowed rows=6 cols=50 style="width:278px"></TEXTAREA></TD></TR>
        <TR>
          <TD class=altbg1 vAlign=top width="45%"><B>管理员后台 IP 访问列表:</B><BR><SPAN 
		   class=smalltxt><%= PageUtils.getString("access_6") %></SPAN></TD>
          <TD class=altbg2>
	  	<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('ipAdminAllowed', 1)" src="../images/zoomin.gif"> 
		<IMG onmouseover="this.style.cursor='pointer'" onclick="zoomtextarea('ipAdminAllowed', 0)" src="../images/zoomout.gif">
		<BR><TEXTAREA id=ipAdminAllowed name=ipAdminAllowed rows=6 cols=50 style="width:278px"></TEXTAREA></TD></TR>
		</TBODY></TABLE><BR>
      <CENTER><INPUT class=button type=submit value="提 交"></CENTER></FORM>
	  </TD></TR></TBODY></TABLE><BR><BR>
<script language="javascript">
function checkfields(theform) {
    var filter = /^\d+$/;
	var value = trim(theform.userExpireDays.value);
    if (!filter.test(value)) {
    	alert('注册用户有效期限制必须为整数');
      	theform.userExpireDays.focus();
		return;
	}
	theform.submit();
}
$('registerType[<%= setting.getHTMLStr(ForumSetting.ACCESS,"registerType") %>]').checked = "true";
$('settings').reserveWords.value = "<%= setting.getHTMLStr(ForumSetting.ACCESS,"reserveWords") %>";
$('settings').userExpireDays.value = 
	"<%= setting.getInt(ForumSetting.ACCESS,"userExpireDays") %>";
$('settings').ipBanned.value = "<%= setting.getHTMLStr(ForumSetting.ACCESS,"ipBanned") %>";
$('settings').ipAllowed.value = "<%= setting.getHTMLStr(ForumSetting.ACCESS,"ipAllowed") %>";
$('settings').ipAdminAllowed.value = "<%= setting.getHTMLStr(ForumSetting.ACCESS,"ipAdminAllowed") %>";
</script>	  
<%= PageUtils.getAdminFooter(request) %>
</BODY></HTML>
