<%@language=vbscript codepage=936 %>
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="background.asp"-->
<%
if session("admin")<>1 then response.Redirect "default.asp" 
		
if (request.Form<>"") and (request.Form("search")=0) then
Set rs=Server.CreateObject("ADODB.RecordSet")
	sql="SELECT * FROM register"
rs.open SQL,Conn,3,3
select case request("act")
case 1
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update register set level1='����' where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�ɹ�������ѣ�"
case 2
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update register set level1='�α�' where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�ɹ���ɼα���"
case 3
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update register set level1='����Ա' where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�ɹ���ɹ���Ա��"
case 4
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql="delete from register where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�û�ɾ���ɹ���"
case 5
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update register set level1='����' where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�ɹ���ɰ�����"
case 6
Set rs1=Server.CreateObject("ADODB.RecordSet")
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
			sql="SELECT username FROM register where id="&rs("id")
			rs1.open SQL,Conn,1,1
			username=rs1("username")
			rs1.close
			sql="SELECT count(*) as usercount FROM guest where username='"&username&"'"
			rs1.open SQL,Conn,1,1
			usercount=rs1("usercount")
			rs1.close
			sql="SELECT count(*) as usercount FROM reply where replyname='"&username&"'"
			rs1.open SQL,Conn,1,1
			usercount=usercount+rs1("usercount")		
			rs1.close
			sql= "update register set count1="&usercount&" where id="&rs("id")
      		conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�������ؼ���ɣ�"
end select

response.Redirect "post_ok.asp?info="&info
end if
   Set rs=server.createobject("ADODB.RECORDSET")
if request.Form("text")<>"" then
   	sql="SELECT * FROM register where username='"&request.Form("text")&"' order by count1 desc,id"
else
   sql="SELECT * FROM register order by count1 desc,id"
end if
   rs.open sql,conn,3,3
   	 dim maxperpage,url,PageNo
	 url="user_manage.asp"
	 Set rs1=server.createobject("ADODB.RECORDSET")
     rs1.open "Select * From option1",Conn,3,3
     rs.pagesize=rs1("row2")
	 maxperpage=rs.pagesize
	 rs1.close
	 PageNo=REQUEST("PageNo")
	 if PageNo="" or PageNo=0 then PageNo=1
	 RS.AbsolutePage=PageNo
	 TSum=rs.pagecount
	 RowCount=rs.PageSize
	 PageNo=PageNo+1
	 PageNo=PageNo-1
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û�����</title>
<link href="1.css" rel="stylesheet" type="text/css">
</head>

<body>
<table border=0 width=100% align=center>
        <tr> 
          <td width="100%" align=center> 
            <!--#INCLUDE FILE="top.asp"-->        </tr>
        <tr> 
          <td align=center><hr size=1 width=100% noshade color=#C0C0C0></tr>
</table></td>
<table border=0 width=100% align=center>
    <tr><td width="3%" align=left><font color="#FF0000"><img src="images/home.gif" border=0></font> <font color=#000000><font color=#000000></font></font></td>
      <td width="14%" align=left><a href="<%if session("list")=0 then%>default.asp<%else%>default1.asp<%end if%>">������ҳ</a></td>
      <td width="83%" align=right>
      <!--#INCLUDE FILE="link.asp"-->    </td>
</table>
<HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0>
<form action="" method="post" name="form" id="form">
  <table width="100%" align="center" cellpadding="5" cellspacing="1" class="tablebg<%=skin%>b">
  <tr class="tablebg<%=skin%>a"> 
    <td><div align="center"><b>�û���</b></div></td>
    <td width="228" align="center"><b>�����ʼ�</b></td>
    <td width="258" align="center"><b>������ҳ</b></td>
    <td width="65" align="center"><strong>QQ</strong></td>
    <td width="79" align="center"><b>ͷ��</b></td>
    <td width="70" align="center"><b>������</b></td>
    <td width="44" align="center"><strong>�޸�</strong></td>
    <td width="42" align=center><b>����</b> </td>
  </tr>
  <% DO WHILE NOT rs.EOF AND RowCount>0%>
  <tr class="tablebg<%=skin%>d"> 
    <td width="114" height="28"> 
      <div align="center"><font color=#000000><%=rs("username")%></font></div></td>
    <td align="center"><font color=#000000><a href="mailto:<%=rs("mail")%>"><%=rs("mail")%></a></font></td>
    <td align="center"><font color=#000000><a href="<%=rs("homepage")%>" target="_blank"><%=rs("homepage")%></a></font></td>
    <td align="center"><font color=#000000><a href="http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=rs("qq")%>" target="_blank"><%=rs("qq")%></a></font></td>
    <td align="center"><font color=#000000><%=rs("level1")%></font></td>
    <td align="center"><font color=#000000><%=rs("count1")%></font></td>
      <td align="center"><font color=#000000><a href="user_manage_edit.asp?id=<%=rs("id")%>">�޸�</a></font></td>
    <td align="center" ><input name="<%=rs("id")%>" type="checkbox" id="<%=rs("id")%>3" value="on"></td>
  </tr>
  <%
      rs.MoveNext
	  RowCount = RowCount - 1 
      Loop%>
</table>
<TABLE width=100% height="5" border=0 align=center cellPadding=3 cellSpacing=0>
  <TBODY>
    <TR> 
        <TD width="41%" style="LETTER-SPACING: 1px"><div align="left"><a href=### onClick=checkAll()>
            <input name="search" type="hidden" id="search" value="0">
  ȫѡ</a> <a href=### onClick=checkNone() >ȫ��ѡ</a> <a href=### onClick=checkRev() >��ѡ</a>
  <select name=act class=input2>
      <option value="1">��Ϊ����</option>
      <option value="2">��Ϊ�α�</option>
      <option value="5">��Ϊ����</option>
      <option value="3">��Ϊ����Ա</option>
      <option value="4">ɾ�����û�</option>
      <option value="6" selected>�ؼƷ�����</option>
  </select>
  <input name="goto" type=submit class=input2 id="goto2" value="ȷ��">
      </div></TD>
        <TD><div align="right">
            <% call showpage(url,rs.RECORDCOUNT,maxperpage,false,true,"��ע���û�") %>
        </div></TD>
    </TR>
  </TBODY>
</TABLE>
</form> 
<table border=0 width=100% align=center>
          <tr>
            <td width="100%"> 
                              <form name="form" method="post" action="">
                                <div align="center">
                                  <%  
	  set guest=nothing 
      set rs = nothing%>
                                  <IMG src="images/search.gif" width="16" height="16" align=absMiddle>�����û�����
                                  <input 
      class=input1 size=25 name=text>
��
<input name="submit" type=submit class=input2 value=" �� �� ">
                                <input name="search" type="hidden" id="search" value="1">
                                </div>
                              </form>            </td>
          </tr>
          <tr>
            <td height=12><HR SIZE=1 WIDTH=100% NOSHADE COLOR=#C0C0C0></td>
          </tr>
          <tr>
            
        <td align=center>
          <!--#INCLUDE FILE="bottom.asp"-->
      </tr></td>
</table>
</body>
</html>
<script language="JavaScript">
function checkAll()
{
	var objID;
	objID=document.forms[0].elements;
	for (var i=0 ;i<objID.length-2;i++)
	{
		objID[i].checked=true;
	}
}

function checkNone()
{
	var objID;
	objID=document.forms[0].elements;
	for (var i=0 ;i<objID.length-2;i++)
	{
		objID[i].checked=false;
	}
}

function checkRev()
{
	var objID;
	objID=document.forms[0].elements;
	for (var i=0 ;i<objID.length-2;i++)
	{
		if (objID[i].checked==true)
			objID[i].checked=false;
		else
			objID[i].checked=true;
	}
}
</script>