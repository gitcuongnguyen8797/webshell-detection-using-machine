<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<!--#include file="../Include/md5.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
if Instr(session("AdminPurview"),"|913,")=0 then 
  response.write ("<font color='red')>�㲻���иù���ģ��Ĳ���Ȩ�ޣ��뷵�أ�</font>")
  response.end
end if
'========�ж��Ƿ���й���Ȩ��
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<link href="images/Admin_css.css" type=text/css rel=stylesheet>
<link href="images/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="Images/Disp.js"></script>
<script language="javascript" src="Images/admin.js"></script>
<script type="text/javascript" src="AienUpload/init.js"></script>
<script language="javascript" type="text/javascript" src="../Include/date/WdatePicker.js"></script>
<title>ѧ������</title>
</head>
<body>
<% 
dim Action,Result,ID,njname,bjname,password
Dim a001,a002,a003,a004,a005,a006,a007,a008,a009,a010,a011,a012,a013,a014,a015,a016,a017,a018,a019,a020,a021,a022,a023,a024,a025
Dim a026,a027,a028,a029,a030,a031,a032,a033,a034,a035,a036,a037,a038,a039,a040,a041,a042,a043,a044,a045,a046,a047,a048,a049,a050
Dim a051,a052,a053,a054,a055,a056,a057,a058,a059,a060,a061,a062,a063,a064,a065,a066,a067,a068,a069,a070,a071,a072,a073

    Result=Trim(request.QueryString("Result"))
    Action=Trim(request.QueryString("Action"))
    ID=Cint(request.QueryString("ID"))
	
call InfoEdit() 
%>
<table width="99%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="25" nowrap background="images/skin/th_bg.gif"><font color="#FFFFFF">&nbsp;<strong>ѧ���鿴����ӣ��޸�ѧ��</strong></font></td>
  </tr>
  <tr>
    <td height="30" align="center" nowrap  bgcolor="#EBF2F9"><a href="Admin_teched.asp?Result=Add" >���ѧ��</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="Admin_order.asp" >�鿴ѧ��</a></td>
  </tr>
</table>
<br> 
<form name="editForm" method="post" action="Admin_DosSave.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
<table width="99%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1" >
  <tr>
    <td height="24" align="center" nowrap bgcolor="#EBF2F9">
	<table id="Nav_profile_basic" class="app_table">
      <tbody>
        <tr align="left" bgcolor="#D9DDE9">
          <td colspan="2" class="text14b">���ѧ��ѧ����Ϣ </td>
        </tr>
        <tr>
          <td align="right" class="text12">�꼶���</td>
          <td align="left" class="text12">
		<%
				Response.Write "<select name='njname' class='select' class='Nkebox'>"
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select id,Cname from Zhi_rui_s_Clnj order by id asc"
				Response.Write("<option value='0'>ѡ���꼶���</option>")
				rsc.open sqlc,conn,1,3
				do while not rsc.eof
				Response.Write"<option value='"&rsc("Cname")&"'"
				if Trim(njname)=rsc("Cname") then 
				response.write " selected='selected' "
				End if
				Response.Write" >"&rsc("Cname")&"</option>"
				rsc.movenext
				loop
				rsc.close
				set rsc=nothing 
				Response.Write"</select> "
		%>
		  </td>
        </tr>
        <tr>
          <td align="right" class="text12">�༶���</td>
          <td align="left" class="text12">
		  <%
				Response.Write "<select name='bjname' class='select' class='Nkebox'>"
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select id,Cname from Zhi_rui_s_Clbj order by id asc"
				Response.Write("<option value='0'>ѡ��༶���</option>")
				rsc.open sqlc,conn,1,3
				do while not rsc.eof
				Response.Write"<option value='"&rsc("Cname")&"'"
				if Trim(bjname)=rsc("Cname") then 
				response.write " selected='selected' "
				End if
				Response.Write" >"&rsc("Cname")&"</option>"
				rsc.movenext
				loop
				rsc.close
				set rsc=nothing 
				Response.Write"</select> "
		%>
		  </td>
        </tr>
        <tr>
          <td width="25%" align="right" class="text12">�ʺ�����</td>
          <td align="left" class="text12"><input type="password" class="app_table_input_200" name="Password" size="100"  ></td>
        </tr>
        <tr>
          <td width="25%" align="right" class="text12">ѧ��������ʶ</td>
          <td align="left" class="text12"><input type="text" class="app_table_input_300" name="a001" size="100"  value="<%=a001%>"></td>
        </tr>
        <tr>
          <td align="right" class="text12">ѧУ��ʶ��</td>
          <td align="left" class="text12"><input type="text" class="app_table_input_200" name="a002" size="100"  value="<%=a002%>"></td>
        </tr>
        <tr>
          <td align="right" class="text12">����</td>
          <td align="left" class="text12"><input type="text" class="app_table_input_200" name="a003" size="40"  value="<%=a003%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ա�</td>
          <td align="left" class="text12"><input type="text" class="app_table_input_200" name="a004" size="40"  value="<%=a004%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a004.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="Ů" select="select">Ů</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">��������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a005" size="40"  value="<%=a005%>" />
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">���֤������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a006" size="40"  value="<%=a006%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a006.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="�������֤" select="select">�������֤</option>
                <option value="�����������" select="select">�����������</option>
                <option value="������������" select="select">������������</option>
                <option value="̨�����������½ͨ��֤" select="select">̨�����������½ͨ��֤</option>
                <option value="�������þ�ס֤" select="select">�������þ�ס֤</option>
                <option value="����" select="select">����</option>
                <option value="���ڱ�" select="select">���ڱ�</option>
                <option value="����" select="select">����</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">���֤������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a007" size="40"  value="<%=a007%>" />
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">������������������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a008" size="40"  value="<%=a008%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">����</td>
          <td align="left" class="text12"><input name="a009" id="a009" type="text" class="app_table_input_80" size="6"  value="<%=a009%>" />
              <select name="select" class="app_table_input_auto" onchange="options[selectedIndex].value;document.all.a009.value=options[selectedIndex].value">
                <option value="">��ѡ������</option>
                <option value="����">����</option>
                <option value="�ɹ���">�ɹ���</option>
                <option value="����">����</option>
                <option value="����">����</option>
                <option value="ά�����">ά�����</option>
                <option value="����">����</option>
                <option value="����">����</option>
                <option value="������">������</option>
                <option value="����">����</option>
                <option value="����">����</option>
                <option value="����">����</option>
                <option value="��ɽ��">��ɽ��</option>
                <option value="׳��">׳��</option>
                <option value="������">������</option>
                <option value="����">����</option>
                <option value="����">����</option>
                <option value="��������">��������</option>
                <option value="������">������</option>
                <option value="����">����</option>
                <option value="������">������</option>
                <option value="����">����</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="ˮ��">ˮ��</option>
                <option value="������">������</option>
                <option value="�¶�������">�¶�������</option>
                <option value="����">����</option>
                <option value="��������">��������</option>
                <option value="���α����">���α����</option>
                <option value="��������">��������</option>
                <option value="���¿���">���¿���</option>
                <option value="������">������</option>
                <option value="Ǽ��">Ǽ��</option>
                <option value="������">������</option>
                <option value="����˹��">����˹��</option>
                <option value="������">������</option>
                <option value="ԣ����">ԣ����</option>
                <option value="���״���">���״���</option>
                <option value="������">������</option>
                <option value="���">���</option>
                <option value="���Ӷ���">���Ӷ���</option>
                <option value="ô����">ô����</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="ŭ��">ŭ��</option>
                <option value="�°���">�°���</option>
                <option value="����">����</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="�Ű���">�Ű���</option>
                <option value="ë����">ë����</option>
                <option value="������">������</option>
                <option value="��ŵ��">��ŵ��</option>
                <option value="���Ѫͳ�й�����ʿ">���Ѫͳ�й�����ʿ</option>
                <option value="����">����</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">����/����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a010" size="40"  value="<%=a010%>" />
              <%
				Response.Write "<SELECT onchange=options[selectedIndex].value;document.all.a010.value=options[selectedIndex].value> "
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select id,Cname from Zhi_rui_s_CLss order by id asc"
				Response.Write("<option value=''>ѡ��</option>")
				rsc.open sqlc,conn,1,3
				do while not rsc.eof
				Response.Write"<option value='"&rsc("Cname")&"'"
				Response.Write" >"&rsc("Cname")&"</option>"
				rsc.movenext
				loop
				rsc.close
				set rsc=nothing 
				Response.Write"</select> "
		%>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�۰�̨����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a011" size="40"  value="<%=a011%>" />
              <%
				Response.Write "<SELECT onchange=options[selectedIndex].value;document.all.a011.value=options[selectedIndex].value> "
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select id,Cname from Zhi_rui_s_zLss order by id asc"
				Response.Write("<option value=''>ѡ��</option>")
				rsc.open sqlc,conn,1,3
				do while not rsc.eof
				Response.Write"<option value='"&rsc("Cname")&"'"
				Response.Write" >"&rsc("Cname")&"</option>"
				rsc.movenext
				loop
				rsc.close
				set rsc=nothing 
				Response.Write"</select> "
		%>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">��������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a012" size="40"  value="<%=a012%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a012.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��ũҵ����" select="select">��ũҵ����</option>
                <option value="ũҵ����" select="select">ũҵ����</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�������ڵ���������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a013" size="40"  value="<%=a013%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">��סַ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input" name="a014" size="40"  value="<%=a014%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">�м�����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a015" size="40"  value="<%=a015%>" />
              <%
				Response.Write "<SELECT onchange=options[selectedIndex].value;document.all.a015.value=options[selectedIndex].value> "
				set rsc=server.CreateObject("ADODB.recordset")
				sqlc="select id,Cname from Zhi_rui_s_zLcj order by id asc"
				Response.Write("<option value=''>ѡ��</option>")
				rsc.open sqlc,conn,1,3
				do while not rsc.eof
				Response.Write"<option value='"&rsc("Cname")&"'"
				Response.Write" >"&rsc("Cname")&"</option>"
				rsc.movenext
				loop
				rsc.close
				set rsc=nothing 
				Response.Write"</select> "
		%>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ������Ů</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a016" size="40"  value="<%=a016%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a016.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ����ض�ͯ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a017" size="40"  value="<%=a017%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a017.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="�����ض�ͯ" select="select">�����ض�ͯ</option>
                <option value="�������ض�ͯ" select="select">�������ض�ͯ</option>
                <option value="˫�����ض�ͯ" select="select">˫�����ض�ͯ</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ��������Ա��Ǩ��Ů</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a018" size="40"  value="<%=a018%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a018.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ�¶�</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a019" size="40"  value="<%=a019%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a019.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a020" size="40"  value="<%=a020%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">����״��</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a021" size="40"  value="<%=a021%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a021.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="����������" select="select">����������</option>
                <option value="һ������" select="select">һ������</option>
                <option value="�����Բ�" select="select">�����Բ�</option>
                <option value="������ȱ��" select="select">������ȱ��</option>
                <option value="�м�" select="select">�м�</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">������ò</td>
          <td align="left" class="text12"><input type="text" class="app_table_input_200" name="a022" size="40"  value="<%=a022%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a022.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="�й���Ա" select="select">�й���Ա</option>
                <option value="�й�Ԥ����Ա" select="select">�й�Ԥ����Ա</option>
                <option value="������Ա" select="select">������Ա</option>
                <option value="Ⱥ��" select="select">Ⱥ��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">���</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a023" size="40"  value="<%=a023%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">��ѧ����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a024" size="40"  value="<%=a024%>" />
          *��:2017.09.01</td>
        </tr>
        <tr>
          <td align="right" class="text12">��ѧ��ʽ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a025" size="40"  value="<%=a025%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a025.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��������׶�����" select="select">��������׶�����</option>
                <option value="�ͽ���ѧ" select="select">�ͽ���ѧ</option>
                <option value="��������" select="select">��������</option>
                <option value="��������" select="select">��������</option>
                <option value="���н׶�����" select="select">���н׶�����</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ͷ���ʽ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a026" size="40"  value="<%=a026%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a026.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="�߶�" select="select">�߶�</option>
                <option value="סУ" select="select">סУ</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">ͨ�ŵ�ַ</td>
          <td align="left" class="text12"><input type="text" class="app_table_input" name="a027" size="40"  value="<%=a027%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">��ͥ��ַ</td>
          <td align="left" class="text12"><input type="text" class="app_table_input" name="a028" size="40" value="<%=a028%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">��ϵ�绰</td>
          <td align="left" class="text12"><input type="text" class="app_table_input" name="a029" size="40" value="<%=a029%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">��������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a030" size="40"  value="<%=a030%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ��ܹ�ѧǰ����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a031" size="40"  value="<%=a031%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a031.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ���Ҫ��������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a032" size="40"  value="<%=a032%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a032.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ�����һ��</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a033" size="40"  value="<%=a033%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a033.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ���ʿ���Ÿ���Ů</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a034" size="40"  value="<%=a034%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a034.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">����ѧ����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a035" size="40"  value="<%=a035%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">����ѧ��ʽ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a036" size="40"  value="<%=a036%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a036.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="����" select="select">����</option>
                <option value="������ͨ" select="select">������ͨ</option>
                <option value="�ҳ����н���" select="select">�ҳ����н���</option>
                <option value="У��" select="select">У��</option>
                <option value="����" select="select">����</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ���Ҫ����У��</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a037" size="40"  value="<%=a037%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a037.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="��" select="select">��</option>
                <option value="��" select="select">��</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a038" size="40"  value="<%=a038%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">���֤����Ч��</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a039" size="40"  value="<%=a039%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">Ѫ��</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a040" size="40"  value="<%=a040%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">�س�</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a041" size="40"  value="<%=a041%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">ѧ������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a042" size="40"  value="<%=a042%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">����ѧ��</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a043" size="40"  value="<%=a043%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">ѧ����Դ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a044" size="40"  value="<%=a044%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a044.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="������ѧ" select="select">������ѧ</option>
                <option value="���" select="select">���</option>
                <option value="����" select="select">����</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">��������</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a045" size="40"  value="<%=a045%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">��ҳ��ַ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a046" size="40"  value="<%=a046%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">�Ƿ�����������ѧλ</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a047" size="40"  value="<%=a047%>" /></td>
        </tr>
        <tr>
          <td align="right" class="text12">���Ͷ�</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a048" size="40"  value="<%=a048%>" />
              <select name="select" onchange="options[selectedIndex].value;document.all.a048.value=options[selectedIndex].value">
                <option value="" select="select">ѡ��</option>
                <option value="�����Ͷ�" select="select">�����Ͷ�</option>
                <option value="�����м����Ͷ�" select="select">�����м����Ͷ�</option>
                <option value="�����м����Ͷ�" select="select">�����м����Ͷ�</option>
                <option value="�����м����Ͷ�" select="select">�����м����Ͷ�</option>
                <option value="�����м����Ͷ�" select="select">�����м����Ͷ�</option>
              </select>
          </td>
        </tr>
        <tr>
          <td align="right" class="text12">����</td>
          <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a049" size="40"  value="<%=a049%>" /></td>
        </tr>
      </tbody>
    </table>
      <table id="Nav_profile_image" class="app_table">
        <tbody>
          <tr align="left" bgcolor="#D9DDE9">
            <td colspan="2" class="text14b">��Ҫ��ͥ��Ա1��ϵ </td>
          </tr>
          <!--��ͥ��Ա -->
          <tr>
            <td align="right" class="text12">��Ա1����</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a050" size="40"  value="<%=a050%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1��ϵ</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a051" size="40"  value="<%=a051%>" />
                <select name="select" onchange="options[selectedIndex].value;document.all.a051.value=options[selectedIndex].value">
                  <option value="" select="select">ѡ��</option>
                  <option value="����" select="select">����</option>
                  <option value="ĸ��" select="select">ĸ��</option>
                  <option value="�游ĸ�����游ĸ" select="select">�游ĸ�����游ĸ</option>
                  <option value="�ֵܽ���" select="select">�ֵܽ���</option>
                  <option value="����" select="select">����</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1��ϵ˵��</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a052" size="40"  value="<%=a052%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1��סַ</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input" name="a053" size="40"  value="<%=a053%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1�������ڵ���������</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a054" size="40"  value="<%=a054%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1��ϵ�绰</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a055" size="40"  value="<%=a055%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1�Ƿ�໤��</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a056" size="40"  value="<%=a056%>" />
                <select name="select" onchange="options[selectedIndex].value;document.all.a056.value=options[selectedIndex].value">
                  <option value="" select="select">ѡ��</option>
                  <option value="��" select="select">��</option>
                  <option value="��" select="select">��</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1���֤������</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a057" size="40"  value="<%=a057%>" />
                <select name="select" onchange="options[selectedIndex].value;document.all.a057.value=options[selectedIndex].value">
                  <option value="" select="select">ѡ��</option>
                  <option value="�������֤" select="select">�������֤</option>
                  <option value="�����������" select="select">�����������</option>
                  <option value="������������" select="select">������������</option>
                  <option value="̨�����������½ͨ��֤" select="select">̨�����������½ͨ��֤</option>
                  <option value="�������þ�ס֤" select="select">�������þ�ס֤</option>
                  <option value="����" select="select">����</option>
                  <option value="���ڱ�" select="select">���ڱ�</option>
                  <option value="����" select="select">����</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1���֤����</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a058" size="40"  value="<%=a058%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1����</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a059" size="40"  value="<%=a059%>" />
                <select name="select" class="app_table_input_auto" onchange="options[selectedIndex].value;document.all.a059.value=options[selectedIndex].value">
                  <option value="">��ѡ������</option>
                  <option value="����">����</option>
                  <option value="�ɹ���">�ɹ���</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="ά�����">ά�����</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="��ɽ��">��ɽ��</option>
                  <option value="׳��">׳��</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="��������">��������</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="ˮ��">ˮ��</option>
                  <option value="������">������</option>
                  <option value="�¶�������">�¶�������</option>
                  <option value="����">����</option>
                  <option value="��������">��������</option>
                  <option value="���α����">���α����</option>
                  <option value="��������">��������</option>
                  <option value="���¿���">���¿���</option>
                  <option value="������">������</option>
                  <option value="Ǽ��">Ǽ��</option>
                  <option value="������">������</option>
                  <option value="����˹��">����˹��</option>
                  <option value="������">������</option>
                  <option value="ԣ����">ԣ����</option>
                  <option value="���״���">���״���</option>
                  <option value="������">������</option>
                  <option value="���">���</option>
                  <option value="���Ӷ���">���Ӷ���</option>
                  <option value="ô����">ô����</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="ŭ��">ŭ��</option>
                  <option value="�°���">�°���</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="�Ű���">�Ű���</option>
                  <option value="ë����">ë����</option>
                  <option value="������">������</option>
                  <option value="��ŵ��">��ŵ��</option>
                  <option value="���Ѫͳ�й�����ʿ">���Ѫͳ�й�����ʿ</option>
                  <option value="����">����</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1������λ</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a060" size="40"  value="<%=a060%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա1ְ��</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a061" size="40"  value="<%=a061%>" /></td>
          </tr>
        </tbody>
      </table>
      <table id="Nav_profile_family" class="app_table">
        <tbody>
          <tr align="left" bgcolor="#D9DDE9">
            <td colspan="2" class="text14b">��Ҫ��ͥ��Ա2��ϵ </td>
          </tr>
          <!--��ͥ��Ա -->
          <tr>
            <td align="right" class="text12">��Ա2����</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a062" size="40"  value="<%=a062%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2��ϵ</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a063" size="40"  value="<%=a063%>" />
                <select name="select" onchange="options[selectedIndex].value;document.all.a063.value=options[selectedIndex].value">
                  <option value="" select="select">ѡ��</option>
                  <option value="����" select="select">����</option>
                  <option value="ĸ��" select="select">ĸ��</option>
                  <option value="�游ĸ�����游ĸ" select="select">�游ĸ�����游ĸ</option>
                  <option value="�ֵܽ���" select="select">�ֵܽ���</option>
                  <option value="����" select="select">����</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2��ϵ˵��</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a064" size="40"  value="<%=a064%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2��סַ</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input" name="a065" size="40"  value="<%=a065%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2�������ڵ���������</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a066" size="40"  value="<%=a066%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2��ϵ�绰</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a067" size="40"  value="<%=a067%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2�Ƿ�໤��</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a068" size="40"  value="<%=a068%>" />
                <select name="select" onchange="options[selectedIndex].value;document.all.a068.value=options[selectedIndex].value">
                  <option value="" select="select">ѡ��</option>
                  <option value="��" select="select">��</option>
                  <option value="��" select="select">��</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2���֤������</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a069" size="40"  value="<%=a069%>" />
                <select name="select" onchange="options[selectedIndex].value;document.all.a069.value=options[selectedIndex].value">
                  <option value="" select="select">ѡ��</option>
                  <option value="�������֤" select="select">�������֤</option>
                  <option value="�����������" select="select">�����������</option>
                  <option value="������������" select="select">������������</option>
                  <option value="̨�����������½ͨ��֤" select="select">̨�����������½ͨ��֤</option>
                  <option value="�������þ�ס֤" select="select">�������þ�ס֤</option>
                  <option value="����" select="select">����</option>
                  <option value="���ڱ�" select="select">���ڱ�</option>
                  <option value="����" select="select">����</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2���֤����</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a070" size="40"  value="<%=a070%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2����</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a071" size="40"  value="<%=a071%>" />
                <select name="select" class="app_table_input_auto" onchange="options[selectedIndex].value;document.all.a071.value=options[selectedIndex].value">
                  <option value="">��ѡ������</option>
                  <option value="����">����</option>
                  <option value="�ɹ���">�ɹ���</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="ά�����">ά�����</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="��ɽ��">��ɽ��</option>
                  <option value="׳��">׳��</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="����">����</option>
                  <option value="��������">��������</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="ˮ��">ˮ��</option>
                  <option value="������">������</option>
                  <option value="�¶�������">�¶�������</option>
                  <option value="����">����</option>
                  <option value="��������">��������</option>
                  <option value="���α����">���α����</option>
                  <option value="��������">��������</option>
                  <option value="���¿���">���¿���</option>
                  <option value="������">������</option>
                  <option value="Ǽ��">Ǽ��</option>
                  <option value="������">������</option>
                  <option value="����˹��">����˹��</option>
                  <option value="������">������</option>
                  <option value="ԣ����">ԣ����</option>
                  <option value="���״���">���״���</option>
                  <option value="������">������</option>
                  <option value="���">���</option>
                  <option value="���Ӷ���">���Ӷ���</option>
                  <option value="ô����">ô����</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="ŭ��">ŭ��</option>
                  <option value="�°���">�°���</option>
                  <option value="����">����</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="�Ű���">�Ű���</option>
                  <option value="ë����">ë����</option>
                  <option value="������">������</option>
                  <option value="��ŵ��">��ŵ��</option>
                  <option value="���Ѫͳ�й�����ʿ">���Ѫͳ�й�����ʿ</option>
                  <option value="����">����</option>
                </select>
            </td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2������λ</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a072" size="40"  value="<%=a072%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12">��Ա2ְ��</td>
            <td align="left" nowrap="nowrap" class="text12"><input type="text" class="app_table_input_200" name="a073" size="40"  value="<%=a073%>" /></td>
          </tr>
          <tr>
            <td align="right" class="text12"></td>
            <td align="left" nowrap="nowrap" class="text12"><input name="submitSaveEdit" type="submit"  id="submitSaveEdit" value="����"  class="login_button"></td>
          </tr>
        </tbody>
    </table>
  </form>
</BODY>
</HTML>
<%
sub InfoEdit()
  dim Action,rsRepeat,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '����༭��Ʒ
  
    set rs = server.createobject("adodb.recordset")
     if Result="Add" then '����ѧ��

	  sql="select * from zhi_rui_s_status"
      rs.open sql,conn,1,3
      rs.addnew
	  
	rs("njname")=	CheckStr(request.form("njname"))
	rs("bjname")=	CheckStr(request.form("bjname"))
      if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>16  then
        response.write "<script language=javascript> alert('����Ա���������ַ���Ϊ6-20λ��');history.back(-1);</script>"
        response.end
      end if
	rs("password")=	md5(Trim(request.form("Password")))
	rs("a001")=	CheckStr(request.form("a001"))
	rs("a002")=	CheckStr(request.form("a002"))
	rs("a003")=	CheckStr(request.form("a003"))
	rs("a004")=	CheckStr(request.form("a004"))
	rs("a005")=	CheckStr(request.form("a005"))
	rs("a006")=	CheckStr(request.form("a006"))
	rs("a007")=	CheckStr(request.form("a007"))
	rs("a008")=	CheckStr(request.form("a008"))
	rs("a009")=	CheckStr(request.form("a009"))
	rs("a010")=	CheckStr(request.form("a010"))
	rs("a011")=	CheckStr(request.form("a011"))
	rs("a012")=	CheckStr(request.form("a012"))
	rs("a013")=	CheckStr(request.form("a013"))
	rs("a014")=	CheckStr(request.form("a014"))
	rs("a015")=	CheckStr(request.form("a015"))
	rs("a016")=	CheckStr(request.form("a016"))
	rs("a017")=	CheckStr(request.form("a017"))
	rs("a018")=	CheckStr(request.form("a018"))
	rs("a019")=	CheckStr(request.form("a019"))
	rs("a020")=	CheckStr(request.form("a020"))
	rs("a021")=	CheckStr(request.form("a021"))
	rs("a022")=	CheckStr(request.form("a022"))
	rs("a023")=	CheckStr(request.form("a023"))
	rs("a024")=	CheckStr(request.form("a024"))
	rs("a025")=	CheckStr(request.form("a025"))
	rs("a026")=	CheckStr(request.form("a026"))
	rs("a027")=	CheckStr(request.form("a027"))
	rs("a028")=	CheckStr(request.form("a028"))
	rs("a029")=	CheckStr(request.form("a029"))
	rs("a030")=	CheckStr(request.form("a030"))
	rs("a031")=	CheckStr(request.form("a031"))
	rs("a032")=	CheckStr(request.form("a032"))
	rs("a033")=	CheckStr(request.form("a033"))
	rs("a034")=	CheckStr(request.form("a034"))
	rs("a035")=	CheckStr(request.form("a035"))
	rs("a036")=	CheckStr(request.form("a036"))
	rs("a037")=	CheckStr(request.form("a037"))
	rs("a038")=	CheckStr(request.form("a038"))
	rs("a039")=	CheckStr(request.form("a039"))
	rs("a040")=	CheckStr(request.form("a040"))
	rs("a041")=	CheckStr(request.form("a041"))
	rs("a042")=	CheckStr(request.form("a042"))
	rs("a043")=	CheckStr(request.form("a043"))
	rs("a044")=	CheckStr(request.form("a044"))
	rs("a045")=	CheckStr(request.form("a045"))
	rs("a046")=	CheckStr(request.form("a046"))
	rs("a047")=	CheckStr(request.form("a047"))
	rs("a048")=	CheckStr(request.form("a048"))
	rs("a049")=	CheckStr(request.form("a049"))
	rs("a050")=	CheckStr(request.form("a050"))
	rs("a051")=	CheckStr(request.form("a051"))
	rs("a052")=	CheckStr(request.form("a052"))
	rs("a053")=	CheckStr(request.form("a053"))
	rs("a054")=	CheckStr(request.form("a054"))
	rs("a055")=	CheckStr(request.form("a055"))
	rs("a056")=	CheckStr(request.form("a056"))
	rs("a057")=	CheckStr(request.form("a057"))
	rs("a058")=	CheckStr(request.form("a058"))
	rs("a059")=	CheckStr(request.form("a059"))
	rs("a060")=	CheckStr(request.form("a060"))
	rs("a061")=	CheckStr(request.form("a061"))
	rs("a062")=	CheckStr(request.form("a062"))
	rs("a063")=	CheckStr(request.form("a063"))
	rs("a064")=	CheckStr(request.form("a064"))
	rs("a065")=	CheckStr(request.form("a065"))
	rs("a066")=	CheckStr(request.form("a066"))
	rs("a067")=	CheckStr(request.form("a067"))
	rs("a068")=	CheckStr(request.form("a068"))
	rs("a069")=	CheckStr(request.form("a069"))
	rs("a070")=	CheckStr(request.form("a070"))
	rs("a071")=	CheckStr(request.form("a071"))
	rs("a072")=	CheckStr(request.form("a072"))
	rs("a073")=	CheckStr(request.form("a073"))
	
	rs("AddTime")=now()
	
	 rs.update
	 rs.close
     set rs=nothing 

	  
	end if  
	if Result="Modify" then '�޸�ѧ��
      sql="select * from zhi_rui_s_status where ID="&ID
      rs.open sql,conn,1,3
	rs("njname")=	CheckStr(request.form("njname"))
	rs("bjname")=	CheckStr(request.form("bjname"))
	
    if trim(Request.Form("Password"))<>"" then
	    if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>20  then
          response.write "<script language=javascript> alert('����Ա���������ַ���Ϊ6-20λ��');history.back(-1);</script>"
          response.end
        end if
	    rs("Password")=md5(Trim(request.form("Password")))
	end if
	
	rs("a001")=	CheckStr(request.form("a001"))
	rs("a002")=	CheckStr(request.form("a002"))
	rs("a003")=	CheckStr(request.form("a003"))
	rs("a004")=	CheckStr(request.form("a004"))
	rs("a005")=	CheckStr(request.form("a005"))
	rs("a006")=	CheckStr(request.form("a006"))
	rs("a007")=	CheckStr(request.form("a007"))
	rs("a008")=	CheckStr(request.form("a008"))
	rs("a009")=	CheckStr(request.form("a009"))
	rs("a010")=	CheckStr(request.form("a010"))
	rs("a011")=	CheckStr(request.form("a011"))
	rs("a012")=	CheckStr(request.form("a012"))
	rs("a013")=	CheckStr(request.form("a013"))
	rs("a014")=	CheckStr(request.form("a014"))
	rs("a015")=	CheckStr(request.form("a015"))
	rs("a016")=	CheckStr(request.form("a016"))
	rs("a017")=	CheckStr(request.form("a017"))
	rs("a018")=	CheckStr(request.form("a018"))
	rs("a019")=	CheckStr(request.form("a019"))
	rs("a020")=	CheckStr(request.form("a020"))
	rs("a021")=	CheckStr(request.form("a021"))
	rs("a022")=	CheckStr(request.form("a022"))
	rs("a023")=	CheckStr(request.form("a023"))
	rs("a024")=	CheckStr(request.form("a024"))
	rs("a025")=	CheckStr(request.form("a025"))
	rs("a026")=	CheckStr(request.form("a026"))
	rs("a027")=	CheckStr(request.form("a027"))
	rs("a028")=	CheckStr(request.form("a028"))
	rs("a029")=	CheckStr(request.form("a029"))
	rs("a030")=	CheckStr(request.form("a030"))
	rs("a031")=	CheckStr(request.form("a031"))
	rs("a032")=	CheckStr(request.form("a032"))
	rs("a033")=	CheckStr(request.form("a033"))
	rs("a034")=	CheckStr(request.form("a034"))
	rs("a035")=	CheckStr(request.form("a035"))
	rs("a036")=	CheckStr(request.form("a036"))
	rs("a037")=	CheckStr(request.form("a037"))
	rs("a038")=	CheckStr(request.form("a038"))
	rs("a039")=	CheckStr(request.form("a039"))
	rs("a040")=	CheckStr(request.form("a040"))
	rs("a041")=	CheckStr(request.form("a041"))
	rs("a042")=	CheckStr(request.form("a042"))
	rs("a043")=	CheckStr(request.form("a043"))
	rs("a044")=	CheckStr(request.form("a044"))
	rs("a045")=	CheckStr(request.form("a045"))
	rs("a046")=	CheckStr(request.form("a046"))
	rs("a047")=	CheckStr(request.form("a047"))
	rs("a048")=	CheckStr(request.form("a048"))
	rs("a049")=	CheckStr(request.form("a049"))
	rs("a050")=	CheckStr(request.form("a050"))
	rs("a051")=	CheckStr(request.form("a051"))
	rs("a052")=	CheckStr(request.form("a052"))
	rs("a053")=	CheckStr(request.form("a053"))
	rs("a054")=	CheckStr(request.form("a054"))
	rs("a055")=	CheckStr(request.form("a055"))
	rs("a056")=	CheckStr(request.form("a056"))
	rs("a057")=	CheckStr(request.form("a057"))
	rs("a058")=	CheckStr(request.form("a058"))
	rs("a059")=	CheckStr(request.form("a059"))
	rs("a060")=	CheckStr(request.form("a060"))
	rs("a061")=	CheckStr(request.form("a061"))
	rs("a062")=	CheckStr(request.form("a062"))
	rs("a063")=	CheckStr(request.form("a063"))
	rs("a064")=	CheckStr(request.form("a064"))
	rs("a065")=	CheckStr(request.form("a065"))
	rs("a066")=	CheckStr(request.form("a066"))
	rs("a067")=	CheckStr(request.form("a067"))
	rs("a068")=	CheckStr(request.form("a068"))
	rs("a069")=	CheckStr(request.form("a069"))
	rs("a070")=	CheckStr(request.form("a070"))
	rs("a071")=	CheckStr(request.form("a071"))
	rs("a072")=	CheckStr(request.form("a072"))
	rs("a073")=	CheckStr(request.form("a073"))
	
	rs("AddTime")=now()
	  
	 rs.update
	 rs.close
     set rs=nothing 
	end if

    response.write "<script language=javascript> alert('�ɹ��༭ѧ������');location.replace('Admin_techLi.asp');</script>"
  else '��ȡѧ��
	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from zhi_rui_s_status where ID="& ID
      rs.open sql,conn,1,1
	  
      if rs.bof and rs.eof then
        response.write ("���ݿ��ȡ��¼����")
        response.end
      end if
	  
	njname=	rs("njname")
	bjname=	rs("bjname") 
	a001=	rs("a001")
	a002=	rs("a002")
	a003=	rs("a003")
	a004=	rs("a004")
	a005=	rs("a005")
	a006=	rs("a006")
	a007=	rs("a007")
	a008=	rs("a008")
	a009=	rs("a009")
	a010=	rs("a010")
	a011=	rs("a011")
	a012=	rs("a012")
	a013=	rs("a013")
	a014=	rs("a014")
	a015=	rs("a015")
	a016=	rs("a016")
	a017=	rs("a017")
	a018=	rs("a018")
	a019=	rs("a019")
	a020=	rs("a020")
	a021=	rs("a021")
	a022=	rs("a022")
	a023=	rs("a023")
	a024=	rs("a024")
	a025=	rs("a025")
	a026=	rs("a026")
	a027=	rs("a027")
	a028=	rs("a028")
	a029=	rs("a029")
	a030=	rs("a030")
	a031=	rs("a031")
	a032=	rs("a032")
	a033=	rs("a033")
	a034=	rs("a034")
	a035=	rs("a035")
	a036=	rs("a036")
	a037=	rs("a037")
	a038=	rs("a038")
	a039=	rs("a039")
	a040=	rs("a040")
	a041=	rs("a041")
	a042=	rs("a042")
	a043=	rs("a043")
	a044=	rs("a044")
	a045=	rs("a045")
	a046=	rs("a046")
	a047=	rs("a047")
	a048=	rs("a048")
	a049=	rs("a049")
	a050=	rs("a050")
	a051=	rs("a051")
	a052=	rs("a052")
	a053=	rs("a053")
	a054=	rs("a054")
	a055=	rs("a055")
	a056=	rs("a056")
	a057=	rs("a057")
	a058=	rs("a058")
	a059=	rs("a059")
	a060=	rs("a060")
	a061=	rs("a061")
	a062=	rs("a062")
	a063=	rs("a063")
	a064=	rs("a064")
	a065=	rs("a065")
	a066=	rs("a066")
	a067=	rs("a067")
	a068=	rs("a068")
	a069=	rs("a069")
	a070=	rs("a070")
	a071=	rs("a071")
	a072=	rs("a072")
	a073=	rs("a073")
	  
	  rs.close
      set rs=nothing 
    end if
  end if
end sub
%>