<!--#include file = "config.asp"-->
<%
if session("admin")<>1 and session("admin")<>2 then response.Redirect "default.asp"
		
Set rs=Server.CreateObject("ADODB.RecordSet")
SQL="Select * From guest"
rs.open SQL,Conn,3,3

select case request("act")
case 1
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		dsql="delete from reply where id="&rs("id")
		conn.execute(dsql)
	  	dsql="delete From guest where id="&rs("id")
		conn.execute(dsql)
	  end if
   rs.movenext
   loop 
info="ɾ�����Գɹ���"
case 2
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set top1=1 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�̶����˳ɹ���"
case 3
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set lock=1 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�������Գɹ���"
case 4
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set lastdate=now where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="�ᵽ��ǰ�ɹ���"
case 5
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set top1=0 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="ȡ���̶��ɹ���"
case 6
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set lock=0 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="��������ɹ���"
case 7
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set mark=1 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="������Գɹ���"
case 8
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set mark=0 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="ȡ����˳ɹ���"
case 9
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set jinghua=1 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="��Ϊ�����ɹ���"
case 10
   do while not rs.eof
   n=trim(cstr(rs("id")))
        if request.form(n)="on" then
		sql= "update guest set jinghua=0 where id="&rs("id")
      conn.execute(sql)
	  end if
   rs.movenext
   loop 
info="ȡ�������ɹ���"
end select
rs.close
set rs=nothing
conn.close
set conn=nothing
response.Redirect "post_ok.asp?info="&info
%>
