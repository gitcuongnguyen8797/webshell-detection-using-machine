 <!--#include File="inc/Conns.asp" -->
<%
 Set TTLT=Response:Set TTLL=Request:Set TTLLT=Session:Set TLTTT=Application:Set TTLLL=Server
classid=TTLL.QueryString("classid")
ye= (40 * 39 - 1559)
IF not isNumeric(TTLL("page")) then
TTLT.write("<script>alert(""��������""); history.go(-1);</script>")
TTLT.End
End If
sql="select * from [anli] where queren="+cstr(ye)+""
if classid<>"" then sql=sql + " and classid='"&classid&"'"
sql=sql + " order by px_id desc,id desc"
Dim fileName,postion,time
fileName = TTLL.ServerVariables("script_name")
postion = InstrRev(fileName,"/")+ (40 * 39 - 1559)
fileName = Mid(fileName,postion)
set rscp=TTLLL.CreateObject("adodb.recordset")
rscp.open sql,conn, (40 * 39 - 1559), (40 * 39 - 1559)
if rscp.bof or rscp.eof then
TTLT.write("<script>alert(""������Ϣ""); history.go(-1);</script>")
TTLT.End
else
pages= (49 * 33 - 1608)
rscp.pagesize=pages
if not isempty(TTLL.QueryString("page")) then
thispage=clng(TTLL.QueryString("page"))
else
thispage= (40 * 39 - 1559)
end if
rscpcount=rscp.recordcount
if thispage="" then thispage= (40 * 39 - 1559)
if thispage< (40 * 39 - 1559) then thispage= (40 * 39 - 1559)
if (thispage- (40 * 39 - 1559))*pages>rscpcount then
if (rscpcount mod pages)= (57 * 59 - 3363) then
thispage=rscpcount\pages
else
thispage=rscpcount\pages+ (40 * 39 - 1559)
end if
end if
if(rscpcount mod pages)= (57 * 59 - 3363) then
allpages=rscpcount\pages
else
allpages=rscpcount\pages+ (40 * 39 - 1559)
end if
rscp.absolutepage=thispage
i= (40 * 39 - 1559)
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>���̰��� - <%=List("WebName")%></title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="css/master.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function() {
  Cms.siteFlow("",location.href, document.referrer);
});
</script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery1.3.2.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
</head>
<body id="index">
<div class="pageWidth" id="box_root">
  <div id="box_main">
    <!--#include File="top.asp" -->
</div><div id="index-05"></div>
<div class="ny-middles" >
<div class="ny-fenlei">
    <div class="right_menu">      
        <ul>
        <div id="index-aa"><span>��Ʒ����</span></div>
                <% set rsfl=server.CreateObject("adodb.recordset")
rsfl.open"select top 10 * from (select * from Productclass order by px_id asc)",conn,1,1
if not rsfl.eof or not rsfl.bof then
do while not rsfl.eof 
%><li><a href="ProductAll.asp?classid=<%=rsfl("id")%>"><%=left(rsfl("name"),12)%></a></li>
<%if not rsfl.eof or not rsfl.bof then rsfl.movenext
loop
end if
rsfl.close
set rsfl=nothing
%> 
              </ul><img src="images/r-bottom.jpg" />
    </div> 
	<!--#include File="left.asp" -->	
</div>
<div id="ny-mid">
	<div class="mianbao"><span>��ǰλ�ã�<a href='/'>��ҳ</a> > ���̰���</span>
		 
	<div style="margin-left:15px; text-align:left;">���̰���</div>
		</div>
    <div class="products" align="center">
		 <ul style=" width:700px;" align="center">
              
		   <%do while not rscp.eof and  pages>0 %>	<li>
			   <div style="width:210px;"> <a href="anli.asp?id=<%=rscp("id")%>">
			   <img src="<%=rscp("pic")%>" align="left" width="210" height="158"/></a></div>  
			   <div align="center" style="line-height:35px; "><%=left(rscp("anliname"),50)%></div>
			</li>        <%if (i mod 3) =0 then%>
      <%end if%>
      <%pages = pages - 1
rscp.movenext
i=i+1
loop
end if%>               
		 </ul>	
		 <div style="clear:both;"></div>
		<div id="pages" class="text-c">
<a >������Ϣ��<font color="#FF0000"><%=rscp.recordcount%></font>����</a>
                  <a class="a1">����<font color="#FF0000"><%=allpages%></font>��ҳ</a>&nbsp;<a class="a1">��ǰ�ڡ�<font color="#FF0000"><%= thispage %></font>��ҳ</a>&nbsp;
                            <% if thispage<>1 then %>
                  ��<a href="<%=filename&"?page=1"%>">��ҳ</a>�� ��<a href="<%=filename&"?page="&(thispage-1)%>">��һҳ</a>��
                  <% End If %>
                  <% if thispage<>allpages then %>
                  <a href="<%=filename&"?page="&(thispage+1)%>">����һҳ��</a><a href="<%=filename&"?page="&allpages&""%>">��ĩҳ��</a>
                <% End If %>				   
		</div>			
	</div>	 	
	<img src="images/rnr-bottom.jpg" />
</div><div style="clear:both;"></div>
</div>
<!--end center-->
<div id="index-11"></div>
<div id="index-12">
  <!--#include File="foot.asp" -->
</div></div>
</body>
</html>