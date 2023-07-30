<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.hongshee.ejforum.util.PageUtils"%>
<%@ page import="com.hongshee.ejforum.common.ForumSetting"%>
<%@ page import="com.hongshee.ejforum.common.CacheManager"%>
<%@ page import="com.hongshee.ejforum.common.IConstants"%>
<%@ page import="com.hongshee.ejforum.data.UserDAO.UserInfo"%>
<%@ page import="com.hongshee.ejforum.data.BoardDAO.BoardVO"%>
<%@ page import="com.hongshee.ejforum.data.SectionDAO.SectionVO"%>
<%@ page import="com.hongshee.ejforum.data.GroupDAO.GroupVO"%>
<%
	UserInfo userinfo = PageUtils.getSessionUser(request,response);

	GroupVO userGroup = PageUtils.getGroupVO(userinfo);
	if (userGroup.rights.indexOf(IConstants.PERMIT_VISIT_FORUM) < 0)
	{
		request.setAttribute("errorMsg", "很抱歉，您缺乏足够的访问权限");
		request.getRequestDispatcher("/error.jsp").forward(request, response);
		return;
	}

	boolean isModerator = false;
	if (userGroup.groupID == 'A' || userGroup.groupID == 'M' || userGroup.groupID == 'S')
		isModerator = true;

	String ctxPath = request.getContextPath();
	String serverName = request.getServerName();
	if (ctxPath.length()>1)
		serverName = serverName + ctxPath;

	String forumName = ForumSetting.getInstance().getForumName();
	String title = PageUtils.getTitle(forumName);
	String[] menus = PageUtils.getHeaderMenu(request, userinfo);
	String homeUrl = "./index.jsp";
	String forumStyle = PageUtils.getForumStyle(request, response, null);

	CacheManager cache = CacheManager.getInstance();
    ArrayList sections = cache.getSections();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>网页搜索 - <%= title %></TITLE>
<LINK href="styles/<%= forumStyle %>/ejforum.css" type=text/css rel=stylesheet>
</HEAD>
<BODY onkeydown="if(event.keyCode==27) return false;" onload="clickgoogle()">
<SCRIPT src="js/common.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/ajax.js" type=text/javascript></SCRIPT>
<%= PageUtils.getTopInfo(request) %>
<DIV class=wrap>
<DIV id=header>
<%= PageUtils.getHeader(request, title) %>
<%= PageUtils.getHeadAdBanner(request, null) %>
</DIV>
<%= menus[0] %>
<DIV id=nav><A href="<%= homeUrl %>"><%= forumName %></A> &raquo;&nbsp; 网页搜索</DIV>
<FORM id=frmsearch action="search_result.jsp" method=post onsubmit="return validate(this)" target="_blank">
<DIV class="mainbox formbox">
<H1>网页搜索</H1>
<TABLE cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
    <TH width="10%">搜索方式</TH>
    <TD width="40%">
	  <LABEL><INPUT onclick="clickgoogle()" type=radio CHECKED value=google name=searchfield 
	  			id="searchfield_google"> Google 搜索</LABEL> 
	  <LABEL><INPUT onclick="clickgoogle()" type=radio value=title name=searchfield
	  			id="searchfield_title"> 标题搜索</LABEL> 
	  <LABEL><INPUT onclick="clickgoogle()" type=radio value=content name=searchfield
	  			id="searchfield_content"> 全文搜索（主题+回复）</LABEL> </TD>
	 <TD width="50%">最新的主题可能不会被搜索到</TD></TR></TBODY>
  <TBODY>
  <TR>
    <TH><LABEL for=keys>关键字</LABEL></TH>
    <TD><INPUT id=keys maxLength=50 size=60 name=keys></TD>
    <TD>多个关键字之间请用空格或逗号分隔, 比如&nbsp;"科幻 小说"&nbsp;表示同时包含这两个关键字</TD></TR></TBODY>
  <TBODY id=notgoogle1>
  <TR>
    <TH><LABEL for=uid>用户名</LABEL></TH>
    <TD><INPUT id=uid maxLength=50 size=60 name=uid></TD>
    <TD>用户名或用户昵称</TD></TR></TBODY>
  <TBODY id=notgoogle3>
  <TR>
    <TH width="10%">主题类型</TH>
    <TD width="40%">
	  <LABEL><INPUT type=radio CHECKED value="" name=topictype id="topictype[]"> 全部主题</LABEL> 
	  <LABEL><INPUT type=radio value="D" name=topictype> 精华主题</LABEL> 
	  <LABEL><INPUT type=radio value="V" name=topictype> 投票主题</LABEL> 
	  <LABEL><INPUT type=radio value="R" name=topictype> 悬赏主题</LABEL> </TD>
	 <TD width="50%">&nbsp;</TD></TR></TBODY>
  <TBODY id=notgoogle4>
  <TR>
    <TH width="10%">主题属性</TH>
    <TD width="40%">
	  <LABEL><INPUT type=checkbox value="I" name=topicprops id="topicprops[I]"> 包含图片</LABEL> 
	  <LABEL><INPUT type=checkbox value="F" name=topicprops id="topicprops[F]"> 包含媒体</LABEL> 
	  <LABEL><INPUT type=checkbox value="T" name=topicprops id="topicprops[T]"> 包含附件</LABEL> </TD>
	 <TD width="50%">&nbsp;</TD></TR></TBODY>
  <TBODY id=notgoogle2>
  <TR>
    <TD vAlign=top><LABEL for=boardid>搜索范围</LABEL></TD>
    <TD>
	  <SELECT id=boardid style="width: 335px" name=boardid> 
	    <OPTION value="" selected>所有版块</OPTION> 
		<OPTION value="">&nbsp;</OPTION> 
<%
	if (sections != null)
	{
		SectionVO tmpSection = null;
		BoardVO tmpBoard = null;
		StringBuilder sb = new StringBuilder();
		
		for (int i=0; i<sections.size(); i++)	
		{
			tmpSection = (SectionVO)sections.get(i);
			if (tmpSection.boardList == null) continue;
			sb.append("<OPTION value=\"s").append(tmpSection.sectionID).append("\">")
			  .append(tmpSection.sectionName).append("</OPTION>\n");
			for (int j=0; j<tmpSection.boardList.size(); j++)
			{
				tmpBoard = (BoardVO)tmpSection.boardList.get(j);
				if (tmpBoard.state == 'I' && !isModerator) continue;
				sb.append("<OPTION value=\"").append(tmpBoard.boardID).append("\">&nbsp;&nbsp;&nbsp;&nbsp; &gt; ")
				  .append(tmpBoard.boardName).append("</OPTION>\n");
			}
		}
		out.write(sb.toString());
	}
%>
	  </SELECT></TD>
	<TD>&nbsp;</TD></TR></TBODY>
  <TBODY>
  <TR class="btns">
    <TH>&nbsp;</TH>
    <TD height="30"><BUTTON class=submit name=btnsearch type=submit>搜索</BUTTON></TD>
	<TD>&nbsp;</TD></TR></TBODY></TABLE></DIV></FORM>
<SCRIPT type=text/javascript>
function validate(theform) {
	if ((!$("topicprops[I]").checked && !$("topicprops[F]").checked && !$("topicprops[T]").checked
		&& $("topictype[]").checked) || $('searchfield_google').checked)
	{
		if (trim(theform.keys.value) == '') {
			alert("请输入搜索关键字");
			theform.keys.focus();
			return false;
		}
	}

	if (trim(theform.keys.value) != '') {
		var x = new Ajax();
	   	x.get('ajax?act=statkeys&keys=' + encodeURIComponent(trim(theform.keys.value)), null);
	}

	if($('searchfield_google').checked) {
		window.open("http://www.google.com.hk/search?ie=UTF-8&oe=UTF-8&hl=zh-CN&sitesearch="
       	         	+ "<%= serverName %>&q=" + trim(theform.keys.value));
		return false;
	}
	return true;
}
function clickgoogle() {
	if($('searchfield_google').checked) {
		$('notgoogle1').style.display = 'none';
		$('notgoogle2').style.display = 'none';
		$('notgoogle3').style.display = 'none';
		$('notgoogle4').style.display = 'none';
	} else {
		$('notgoogle1').style.display = '';
		$('notgoogle2').style.display = '';
		$('notgoogle3').style.display = '';
		$('notgoogle4').style.display = '';
	}
}
</SCRIPT>
</DIV>
<%= menus[1]==null?"":menus[1] %>
<%= menus[2]==null?"":menus[2] %>
<%= PageUtils.getFooter(request, forumStyle) %>
</BODY></HTML>
