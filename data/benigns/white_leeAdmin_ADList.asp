<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|116,")=0 then 
  response.write ("<font color='red')>�㲻���иù���ģ��Ĳ���Ȩ�ޣ��뷵�أ�</font>")
  response.end
end if
'========�ж��Ƿ���й���Ȩ�� 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<script language="javascript" src="images/Admin.js"></script>
<title>�������</title></head>
<body>
<%
dim Result,StartDate,EndDate,Keyword
Result=request.QueryString("Result")
StartDate=request.QueryString("StartDate")
EndDate=request.QueryString("EndDate")
Keyword=request.QueryString("Keyword")
function PlaceFlag()
  if Result="Search" then
    Response.Write "��棺�б�&nbsp;->&nbsp;����&nbsp;->&nbsp;�ؼ���[<font color='red'>"&Keyword&"</font>]"
  else
    Response.Write "��棺�б�&nbsp;->&nbspȫ��"
  end if
end function  
%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap background="images/th_bg.gif"><font color="#FFFFFF">&nbsp;<strong>��棺��ӣ��޸� ���ã�����Ҫ���õĵط����� &lt;%advs(ID)%&gt; ���� ������ɾ��ԭ�� </strong></font></td>
  </tr>
  <tr>
    <td height="36" nowrap  bgcolor="#EBF2F9"><table width="100%" border="0" cellspacing="0">
      <tr>
        <form name="formSearch" method="post" action="Admin_Search.asp?Result=ADLO">
          <td nowrap> ����������ؼ��֣�<input name="Keyword" type="text" class="textfield" value="<%=Keyword%>" size="18">
          <input name="submitSearch" type="submit" class="button" value="����">
          </td>
        </form>
        <td align="right" nowrap><a href="Admin_AdList.asp" >����б�</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="Admin_AdEdit.asp?Result=Add">��ӹ��</a></td>
      </tr>
    </table>      </td>    
  </tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="0">
  <tr>
    <td height="30"><%PlaceFlag()%></td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form action="?Result=ADs" method="post" name="formDel" >
  <tr>
    <td width="30" nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong>���</strong></font></td>
    <td nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong>������</strong></font></td>
    <td width="120" nowrap background="images/th_bg.gif"><font color="#FFFFFF"><strong>�ߴ�</strong>�����أ�</font></td>
    <td width="128" nowrap background="images/th_bg.gif"><strong><font color="#FFFFFF">����ʱ��</font></strong></td>
    <td width="52" nowrap background="images/th_bg.gif"><strong><font color="#FFFFFF">�鿴����</font></strong></td>
    <td width="50" nowrap background="images/th_bg.gif"><strong><font color="#FFFFFF">����</font></strong></td>
    <td width="50" nowrap background="images/th_bg.gif"><input onClick="CheckOthers(this.form)" name="buttonOtherSelect" type="button" class="button"  id="submitOtherSelect" value="ѡ��" style="HEIGHT: 18px;WIDTH: 32px;"></td>
  </tr>
  <% ADsList() %>
  </form>
</table>
</BODY>
</HTML>
<%
'-----------------------------------------------------------
function ADsList()
  dim idCount'��¼����
  dim pages'ÿҳ����
      pages=20
  dim pagec'��ҳ��
  dim page'ҳ��
      page=clng(request("Page"))
  dim pagenc'ÿҳ��ʾ�ķ�ҳҳ������=pagenc*2+1
      pagenc=2
  dim pagenmax'ÿҳ��ʾ�ķ�ҳ�����ҳ��
  dim pagenmin'ÿҳ��ʾ�ķ�ҳ����Сҳ��
  dim datafrom'���ݱ���
      datafrom="zhi_rui_s_Ad"
  dim datawhere'��������
      if Result="Search" then
	     datawhere="where ( ADsName like '%" & Keyword &_
		           "%')"
	  else
        datawhere=""
	  end if
  dim sqlid'��ҳ��Ҫ�õ���id
  dim Myself,PATH_INFO,QUERY_STRING'��ҳ��ַ�Ͳ���
      PATH_INFO = request.servervariables("PATH_INFO")
	  QUERY_STRING = request.ServerVariables("QUERY_STRING")'
      if QUERY_STRING = "" or Instr(PATH_INFO & "?" & QUERY_STRING,"Page=")=0 then
	    Myself = PATH_INFO & "?"
	  else
	    Myself = Left(PATH_INFO & "?" & QUERY_STRING,Instr(PATH_INFO & "?" & QUERY_STRING,"Page=")-1)
	  end if
  dim taxis'�������� asc,desc
      taxis="order by id desc"
  dim i'����ѭ��������
  dim rs,sql'sql���
  '��ȡ��¼����
  sql="select count(ID) as idCount from ["& datafrom &"]" & datawhere
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,0,1
  idCount=rs("idCount")
  '��ȡ��¼����

  if(idcount>0) then'�����¼����=0,�򲻴���
    if(idcount mod pages=0)then'�����¼��������ÿҳ����������,��=��¼����/ÿҳ����+1
	  pagec=int(idcount/pages)'��ȡ��ҳ��
   	else
      pagec=int(idcount/pages)+1'��ȡ��ҳ��
    end if
	'��ȡ��ҳ��Ҫ�õ���id============================================
    '��ȡ���м�¼��id��ֵ,��Ϊֻ��id�����ٶȺܿ�
    sql="select id from ["& datafrom &"] " & datawhere & taxis
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    rs.pagesize = pages 'ÿҳ��ʾ��¼��
    if page < 1 then page = 1
    if page > pagec then page = pagec
    if pagec > 0 then rs.absolutepage = page  
    for i=1 to rs.pagesize
	  if rs.eof then exit for  
	  if(i=1)then
	    sqlid=rs("id")
	  else
	    sqlid=sqlid &","&rs("id")
	  end if
	  rs.movenext
    next
  '��ȡ��ҳ��Ҫ�õ���id����============================================
  end if
'-----------------------------------------------------------
'-----------------------------------------------------------
  if(idcount>0 and sqlid<>"") then'�����¼����=0,�򲻴���
    '��inˢѡ��ҳ�����Ե�����,����ȡ��ҳ���������,�����ٶȿ�
    sql="select * from ["& datafrom &"] where id in("& sqlid &") "&taxis
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,0,1
    while(not rs.eof)'������ݵ����
	  Response.Write "<tr bgcolor='#EBF2F9' onMouseOver = ""this.style.backgroundColor = '#FFFFFF'"" onMouseOut = ""this.style.backgroundColor = ''"" style='cursor:hand'>" & vbCrLf
      Response.Write "<td nowrap>"&rs("ID")&"</td>" & vbCrLf
      Response.Write "<td nowrap>"&Left(rs("ADsName"),48)&"</td>" & vbCrLf
      Response.Write "<td nowrap>"&rs("ADsWidth")&"��"&rs("ADsHeight")&"&nbsp;px</td>" & vbCrLf
      Response.Write "<td nowrap>"&rs("AddTime")&"</td>" & vbCrLf
      Response.Write "<td nowrap>"&rs("ClickNumber")&"</td>" & vbCrLf
      Response.Write "<td width='48' nowrap><a href='Admin_AdEdit.asp?Result=Modify&ID="&rs("ID")&"' ><font color='#330099'>�޸�</font></a></td>" & vbCrLf
      Response.Write "<td width='14' nowrap><input name='selectID' type='checkbox' value='"&rs("ID")&"' style='HEIGHT: 13px;WIDTH: 13px;'></td>" & vbCrLf
      Response.Write "</tr>" & vbCrLf
	  rs.movenext
    wend
    Response.Write "<tr>" & vbCrLf
    Response.Write "<td colspan='8' nowrap  bgcolor='#EBF2F9' align='Right'><input name='submit' type='submit' class='button'  id='submitDelSelect' value='ɾ����ѡ'></td>" & vbCrLf
    Response.Write "</tr>" & vbCrLf
  else
    response.write "<tr><td height='50' align='center' colspan='8' nowrap  bgcolor='#EBF2F9'>���޹��</td></tr>"
  end if
'-----------------------------------------------------------
'-----------------------------------------------------------
  Response.Write "<tr>" & vbCrLf
  Response.Write "<td colspan='8' nowrap  bgcolor='#D7E4F7'>" & vbCrLf
  Response.Write "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>" & vbCrLf
  Response.Write "<tr>" & vbCrLf
  Response.Write "<td>���ƣ�<font color='#ff6600'>"&idcount&"</font>����¼&nbsp;ҳ�Σ�<font color='#ff6600'>"&page&"</font></strong>/"&pagec&"&nbsp;ÿҳ��<font color='#ff6600'>"&pages&"</font>��</td>" & vbCrLf
  Response.Write "<td align='right'>" & vbCrLf
  '���÷�ҳҳ�뿪ʼ===============================
  pagenmin=page-pagenc '����ҳ�뿪ʼֵ
  pagenmax=page+pagenc '����ҳ�����ֵ
  if(pagenmin<1) then pagenmin=1 '���ҳ�뿪ʼֵС��1��=1
  if(page>1) then response.write ("<a href='"& myself &"Page=1'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>9</font></a>&nbsp;") '���ҳ�����1����ʾ(��һҳ)
  if(pagenmin>1) then response.write ("<a href='"& myself &"Page="& page-(pagenc*2+1) &"'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>7</font></a>&nbsp;") '���ҳ�뿪ʼֵ����1����ʾ(��ǰ)
  if(pagenmax>pagec) then pagenmax=pagec '���ҳ�����ֵ������ҳ��,��=��ҳ��
  for i = pagenmin to pagenmax'ѭ�����ҳ��
	if(i=page) then
	  response.write ("&nbsp;<font color='#ff6600'>"& i &"</font>&nbsp;")
	else
	  response.write ("[<a href="& myself &"Page="& i &">"& i &"</a>]")
	end if
  next
  if(pagenmax<pagec) then response.write ("&nbsp;<a href='"& myself &"Page="& page+(pagenc*2+1) &"'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>8</font></a>&nbsp;") '���ҳ�����ֵС����ҳ������ʾ(����)
  if(page<pagec) then response.write ("<a href='"& myself &"Page="& pagec &"'><font style='FONT-SIZE: 14px; FONT-FAMILY: Webdings'>:</font></a>&nbsp;") '���ҳ��С����ҳ������ʾ(���ҳ)	
  '���÷�ҳҳ�����===============================
  Response.Write "��������&nbsp;<input name='SkipPage' onKeyDown='if(event.keyCode==13)event.returnValue=false' onchange=""if(/\D/.test(this.value)){alert('ֻ������תĿ��ҳ��������������');this.value='"&Page&"';}"" style='HEIGHT: 18px;WIDTH: 40px;'  type='text' class='textfield' value='"&Page&"'>&nbsp;ҳ" & vbCrLf
  Response.Write "<input style='HEIGHT: 18px;WIDTH: 20px;' name='submitSkip' type='button' class='button' onClick='GoPage("""&Myself&""")' value='GO'>" & vbCrLf
  Response.Write "</td>" & vbCrLf
  Response.Write "</tr>" & vbCrLf
  Response.Write "</table>" & vbCrLf
  rs.close
  set rs=nothing
  Response.Write "</td>" & vbCrLf  
  Response.Write "</tr>" & vbCrLf
'-----------------------------------------------------------
'-----------------------------------------------------------
end function 
if request("Result") = "ADs" then 
	SelectID=request("SelectID")
    if SelectID<>"" then  conn.execute "delete from zhi_rui_s_Ad where id in ("&SelectID&")"
    response.redirect request.servervariables("http_referer")
end if
%>