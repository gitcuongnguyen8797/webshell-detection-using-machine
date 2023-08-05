<%
on error resume next
Set Conn=Server.CreateObject("ADODB.Connection") 
db="lyDB/lyboard.mdb"
connstr ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source ="& Server.MapPath(db)
Conn.Open connstr
%>
