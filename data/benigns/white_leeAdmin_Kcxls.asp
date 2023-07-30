<!--#include file="../Include/conig.asp"-->
<!--#include file="../Include/md5.asp"-->
<!--#include file="Admin_check.asp"-->
<!--#include file="Admin_Loadls.asp"--> 
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|914,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限 
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<title>EXECL数据导入</title>
</head>
<body>
<p>
  <%
session.CodePage=936
Server.ScriptTimeOut=600000
set upload=new upload_5xsoft
set file=upload.file("file1")
if file.fileSize>1200000 then
	Response.Write "<script language=javascript>alert('您选择的文件过大');window.close();</script>"
   end if 
    if file.fileSize>0 then
    filename=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
    filename=filename+"."
    filenameend=file.filename
    filenameend=split(filenameend,".")
    if filenameend(1)="xls" then
        filename=filename&filenameend(1)
        file.saveAs Server.mappath("markTest/"&filename)
    else
        response.write "数据格式不对！"
        response.write "<a href=Admin_kcTest.asp>返回</a>"
  response.end()
    end if
    set file=nothing
else
        response.write "文件不能为空！"
        response.write "<a href=Admin_kcTest.asp>返回</a>"
  response.end()
End if
set upload=nothing
'上传XLS文件结束，下面从上传的XLS文件中读取数据写入到SQL数据库
   strAddr=server.MapPath("markTest/"&filename)
   set excelconn=server.createobject("adodb.connection") 
   excelconn.open "Provider = Microsoft.Jet.OLEDB.4.0 ; Data Source = "+strAddr+";Extended Properties='Excel 8.0;HDR=NO;IMEX=1'" 
 sql="select * from [Sheet1$]"
set rs=server.CreateObject("adodb.recordset") 
 rs.open sql,excelconn,1,1 
 if not(rs.bof and rs.eof) then
  rs.movenext
  do while not rs.eof
    sql1="select * from zhi_rui_s_status where a007 ='"&rs(6)&"' "
	set rs1=server.CreateObject("adodb.recordset")  
    rs1.open sql1,conn,1,3
	if (rs1.eof and rs1.bof) then
       rs1.addnew
	   
		rs1("a001")=	Trim(rs(0))
		rs1("a002")=	Trim(rs(1))
		rs1("a003")=	Trim(rs(2))
		rs1("a004")=	Trim(rs(3))
		rs1("a005")=	Trim(rs(4))
		rs1("a006")=	Trim(rs(5))
		rs1("a007")=	Trim(rs(6))
		rs1("a008")=	Trim(rs(7))
		rs1("a009")=	Trim(rs(8))
		rs1("a010")=	Trim(rs(9))
		rs1("a011")=	Trim(rs(10))
		rs1("a012")=	Trim(rs(11))
		rs1("a013")=	Trim(rs(12))
		rs1("a014")=	Trim(rs(13))
		rs1("a015")=	Trim(rs(14))
		rs1("a016")=	Trim(rs(15))
		rs1("a017")=	Trim(rs(16))
		rs1("a018")=	Trim(rs(17))
		rs1("a019")=	Trim(rs(18))
		rs1("a020")=	Trim(rs(19))
		rs1("a021")=	Trim(rs(20))
		rs1("a022")=	Trim(rs(21))
		rs1("a023")=	Trim(rs(22))
		rs1("a024")=	Trim(rs(23))
		rs1("a025")=	Trim(rs(24))
		rs1("a026")=	Trim(rs(25))
		rs1("a027")=	Trim(rs(26))
		rs1("a028")=	Trim(rs(27))
		rs1("a029")=	Trim(rs(28))
		rs1("a030")=	Trim(rs(29))
		rs1("a031")=	Trim(rs(30))
		rs1("a032")=	Trim(rs(31))
		rs1("a033")=	Trim(rs(32))
		rs1("a034")=	Trim(rs(33))
		rs1("a035")=	Trim(rs(34))
		rs1("a036")=	Trim(rs(35))
		rs1("a037")=	Trim(rs(36))
		rs1("a038")=	Trim(rs(37))
		rs1("a039")=	Trim(rs(38))
		rs1("a040")=	Trim(rs(39))
		rs1("a041")=	Trim(rs(40))
		rs1("a042")=	Trim(rs(41))
		rs1("a043")=	Trim(rs(42))
		rs1("a044")=	Trim(rs(43))
		rs1("a045")=	Trim(rs(44))
		rs1("a046")=	Trim(rs(45))
		rs1("a047")=	Trim(rs(46))
		rs1("a048")=	Trim(rs(47))
		rs1("a049")=	Trim(rs(48))
		rs1("a050")=	Trim(rs(49))
		rs1("a051")=	Trim(rs(50))
		rs1("a052")=	Trim(rs(51))
		rs1("a053")=	Trim(rs(52))
		rs1("a054")=	Trim(rs(53))
		rs1("a055")=	Trim(rs(54))
		rs1("a056")=	Trim(rs(55))
		rs1("a057")=	Trim(rs(56))
		rs1("a058")=	Trim(rs(57))
		rs1("a059")=	Trim(rs(58))
		rs1("a060")=	Trim(rs(59))
		rs1("a061")=	Trim(rs(60))
		rs1("a062")=	Trim(rs(61))
		rs1("a063")=	Trim(rs(62))
		rs1("a064")=	Trim(rs(63))
		rs1("a065")=	Trim(rs(64))
		rs1("a066")=	Trim(rs(65))
		rs1("a067")=	Trim(rs(66))
		rs1("a068")=	Trim(rs(67))
		rs1("a069")=	Trim(rs(68))
		rs1("a070")=	Trim(rs(69))
		rs1("a071")=	Trim(rs(70))
		rs1("a072")=	Trim(rs(71))
		rs1("a073")=	Trim(rs(72))
		
		rs1("njname")=	Trim(rs(73))
		rs1("bjname")=	Trim(rs(74))
	    rs1("Password")=md5(Trim(rs(75)))

     rs1.update
     rs1.close
     else
	 set rs1=nothing
    sql2="select * from zhi_rui_s_statusDemo"
	set rs2=server.CreateObject("adodb.recordset")  
    rs2.open sql2,conn,1,3
	rs2.addnew
	   rs2("a001")=rs(0)
       rs2("a002")=rs(1)
       rs2("a003")=rs(2)
   rs2.update
   rs2.close
   end if   
   rs.movenext
  loop
 end if
 rs.close()  

 set rs=nothing 
 set rs1=nothing
 excelconn.Close()   
 set excelconn=nothing
	Response.Write "<script language=javascript>alert('恭喜你,数据导入成功！');</script>"
	response.write("数据批量导入完成！<br>")
	response.write("返回【<a href='Admin_Order.asp'>学籍信息管理</a>】查看<br>")
	response.write("以下数据由于数据库已经存在相关记录，所以没有被输入！")
	dim rs3 ,sql3,rs4,sql4
	set rs3=server.createobject("adodb.recordset")
	sql3 = "select * from zhi_rui_s_statusDemo"
	rs3.open sql3,conn,1,3
	response.write"<table width='450' border='1' style='border-collapse: collapse; text-align:center'>"
    do while Not rs3.EOF 
	response.write"<tr><td width='33%'>"& rs3("a001")&"</td>"
    response.write"<td width='33%'>"&rs3("a002")&"</td>"
    response.write"<td width='33%'>"&rs3("a003")&"</td></tr>"
	rs3.MoveNext
			 loop
	rs3.close
	set rs3=nothing
	response.write"</table>"
	set rs4=server.createobject("adodb.recordset")
	sql4="delete from zhi_rui_s_statusDemo"
	rs4.open sql4,conn,1,1
	rs4.close
	set rs4=nothing
	conn.close
	set conn=nothing
 %>
</body>
</html> 