<!--#INCLUDE FILE="config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ת������</title>
<style type="text/css">
<!--
.style1 {
	font-size: medium;
	color: #FF0000;
}
.style2 {color: #FF0000}
-->
</style>
</head>
<body>
<script language=javascript>
function convert(type1)
{
var strTemp = document.form.txt.value;
if (strTemp.length == 0)
  {
      alert("������9seek���Ա����ݿ�·����");
      document.form.txt.focus();
      return;
  }
url = "9seekConvert.asp?type1="+type1+"&txt="+strTemp
window.location.href =url 
}
</script>
<%
if request("type1")="a" then
Set Conn1=Server.CreateObject("ADODB.Connection") 
connstr1 ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source ="& Server.MapPath(request("txt"))
Conn1.Open connstr1
session("path")=request("txt")
Set rs=server.createobject("ADODB.RECORDSET")
rs.open "Select * From option1" ,Conn,3,3
Set rs1=server.createobject("ADODB.RECORDSET")
rs1.open "Select * From GBconst" ,Conn1,3,3
rs("row1")=rs1("rcPerPage1")
rs("row2")=rs1("rcPerPage2")
rs("register")=rs1("mustReg")
rs("adminreply")=rs1("masterRe")
rs("modal")=rs1("defaultStyle")
rs("second1")=rs1("postLimit")
rs("killword")=rs1("killWord")
rs("webname")=rs1("title")
rs("weblink")=rs1("homepage")
rs.update
rs.close
session("a")=1
response.Redirect "9seekConvert.asp"
end if


if request("type1")="b" then
Set Conn1=Server.CreateObject("ADODB.Connection") 
connstr1 ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source ="& Server.MapPath(request("txt"))
Conn1.Open connstr1
session("path")=request("txt")
Set rs1=server.createobject("ADODB.RECORDSET")
rs1.open "Select * From [user]" ,Conn1,3,3
do while not rs1.eof
Randomize
tt="face/"&Cstr(int(rnd() *56)+1)&".gif"
if rs1("GBuserclass")=0 then class1="����"
if rs1("GBuserclass")=1 then class1="����"
if rs1("GBuserclass")=2 then class1="����Ա"
	  sql="Insert Into register (username,password1,mail,homepage,face,sex,level1,count1,qq)  Values('"& rs1("username")&"','"& rs1("userPassword")&"','"&rs1("userEmail")&"','"&rs1("homepage")&"','"&tt&"','"&rs1("sex")&"','"&class1&"','"&rs1("GBpostNum")&"','"&rs1("oicq")&"')"
	  conn.Execute sql
rs1.movenext
loop
session("b")=1
response.Redirect "9seekConvert.asp"
end if


if request("type1")="c" then
Set Conn1=Server.CreateObject("ADODB.Connection") 
connstr1 ="Provider = Microsoft.Jet.OLEDB.4.0; Data Source ="& Server.MapPath(request("txt"))
Conn1.Open connstr1
session("path")=request("txt")
Set rs=server.createobject("ADODB.RECORDSET")
Set rs1=server.createobject("ADODB.RECORDSET")
Set rs2=server.createobject("ADODB.RECORDSET")
Set rs3=server.createobject("ADODB.RECORDSET")
rs1.open "Select * From ly" ,Conn1,3,3
do while not rs1.eof
Randomize
tt="face/"&Cstr(int(rnd() *56)+1)&".gif"
if rs1("rt")=0 then
	 sql="Insert Into guest (username,face,sex,homepage,mail,subject,content,IP,lydate,lastdate,hf,yd,pic,secret,top1,lock,qq,lastname,jinghua)  Values('"&rs1("name") &"','"&tt&"','"&rs1("male")&"','"&rs1("url")&"', '"&rs1("email")&"','"&rs1("title")&"','"&rs1("nei")&"','"&rs1("ip")&"','"&rs1("t")&"','"&rs1("reTime")&"',"&rs1("hf")&","&rs1("yd")&",'"&rs1("pic")&"',"&rs1("IsPrivate")&","&rs1("isTop")&","&rs1("IsLock")&",'"&rs1("qq")&"','"&"����"&"',"&rs1("jh")&")"
	 conn.Execute sql
	 rs.open "Select * From guest" ,Conn,3,3
	 rs.movelast
	 rs2.open "Select * From ly where rt="&rs1("id") ,Conn1,3,3
	 if not rs2.eof then 
	 do while not rs2.eof
	 	sql="Insert Into reply (ID,replyname,replycontent,replydate,ip,face,mail,HomePage,pic,secret,qq)  Values('"&rs("id")&"','"&rs2("name") &"','"&rs2("nei")&"','"&rs2("t")&"','"&rs2("ip")&"','"&tt&"','"&rs2("email")&"','"&rs2("url")&"','"&rs2("pic")&"',"&rs2("IsPrivate")&",'"&rs2("qq")&"')"
	 	conn.Execute sql
	 	rs2.movenext
	 loop
	 rs3.open "Select * From reply where id="&rs("id")&" order by id1 desc",Conn,3,3
	 if not rs3.eof then
	 rs("lastname")=rs3("replyname")
	 rs.update
	 rs3.close
	 end if
	 end if
	 rs2.close
	 rs.close
end if	 
rs1.movenext
loop
rs1.close
session("c")=1
response.Redirect "9seekConvert.asp"
end if
if session("path")="" then session("path")="/9seekGB5.2/db/global.asa"
%>
<div align="center">
  <p class="style1">9seek���Ա�ת��Դ�๦�����԰�ͨ�ó���</p>
  <form action="" method="post" name="form" id="form">
    <p>����9seek���Ա����ݿ�����·������ַ����
      <input name="txt" type="text" id="txt" value="<%=session("path")%>" size="50">
    </p>
    <p>
      <input type="button" name="Submit" value="ת��9seek������������Դ��������" onClick="javascript:convert('a');">
      <%if session("a")=1 then%><span class="style2">ת���ɹ���</span><%end if%></p>
    <p>
      <input type="button" name="Submit" value="ת��9seek�û���������Դ�û�����" onClick="javascript:convert('b');">
      <%if session("b")=1 then%><span class="style2">ת���ɹ���</span><%end if%></p>
    <p>
      <input type="button" name="Submit" value="ת��9seek������������Դ��������" onClick="javascript:convert('c');">
      <%if session("c")=1 then%><span class="style2">ת���ɹ���</span><%end if%></p>
    <p>˵����ת���ٶ��ӷ������ٶȼ����ݶ��ٶ����������ĵȴ���</p>
  </form>
  <p align="center">��ת����������Դ�����ұ�д��</p>
</div>
</body>
</html>
<%session("a")=0
session("b")=0
session("c")=0
%>