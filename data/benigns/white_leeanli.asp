<!--#include File="inc/anliconn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title><%=Rs("anliname")%> - <%=List("WebName")%></title>
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
<!--#include File="top.asp" --></div><div id="index-05"></div>
<div class="ny-middles">
<div class="ny-fenlei">
    <div class="right_menu">      
        <ul>
        <div id="index-aa"><span>产品中心</span></div>
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
%>               </ul><img src="images/r-bottom.jpg" />
    </div> 
	<!--#include File="left.asp" -->	
</div>
<div id="ny-mid">
	<div class="mianbao"> <span>当前位置：<a href='/'>首页</a>  > <%=Rs("anliname")%></span>
              
       <div style="margin-left:15px; text-align:left;">工程案例</div>
           </div>
		<div  class="products" style="float:left; width:750px;">		
			<div class="products">
			   <div class="jqzoom" style="margin-left:15px; margin-top:10px; line-height:25px;">
			       <div class="cppic" align="center"><IMG alt="<%=Rs("anliname")%>" src="<%=Rs("pic")%>"></DIV></div>
				
			</div><div align="center"><%=Rs("anliname")%></div>
			<div style="clear:both"></div>
			<div style=" line-height:25px; text-align:left;padding-left:15px;padding-right:15px;">
			产品说明：<%=Rs("body")%>
			<br>
<%set rs=conn.execute("select top 1 id,anliname from anli where id<"&rs("id")&" order by id desc")
if not rs.eof or not rs.bof then %>
<a href="anli.asp?id=<%=rs("id")%>">上一篇:<%=rs("anliname")%></a>
<%else%>
<a href="javascript:alert('这已经是第一条记录了！')">没有上一篇了 </a>
<%rs.close
	set rs=nothing
	end if%>
	<%set rs1=conn.execute("select top 1 id,anliname from anli where id>"&id&" order by id asc")
if not rs1.eof or not rs1.bof then%>
<a class='next' href="anli.asp?id=<%=rs1("id")%> ">下一篇:<%=rs1("anliname")%></a>
<%else%>
<a href="javascript:alert('这已经是最后一条记录了！');">没有下一篇了</a>
<%rs1.close
set rs1=nothing
end if%>
                </p>
				
			</div>
		</div>
		<img src="images/rnr-bottom.jpg" />
	</div><div style="clear:both;"></div>
</div>
<div id="index-11"></div>
<div id="index-12">
<!--#include File="foot.asp" --></div></div>
</body>
</html>