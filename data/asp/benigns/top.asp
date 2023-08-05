<!--#INCLUDE FILE="config.asp"-->
<% Set rs10=server.createobject("ADODB.RECORDSET")
   rs10.open "Select * From option1",Conn,3,3
%>
<div align="center"><%if rs10("bannerImg")<>"" and rs10("bannerImg")<>" " then%>
<%if right(rs10("bannerImg"),3)="swf" then%>

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="778" height="60">
  <param name="movie" value="<%=rs10("bannerImg")%>">
  <param name="quality" value="high">
  <embed src="<%=rs10("bannerImg")%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="778" height="60"></embed>
</object>
<%else%>
<a href="<%=rs10("bannerImgLink")%>"><img src="<%=rs10("bannerImg")%>" border="0"></a>
<%end if%> 
<%end if%> 
