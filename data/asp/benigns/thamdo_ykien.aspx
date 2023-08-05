<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="thamdo_ykien.aspx.vb" Inherits="hcmpc.thamdo_ykien" %>

<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
</head>
<body style="background:#013f9d; color:#13f9d">
    <form id="form1" runat="server">
   <table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:#ffffff">
      <tr>
        <td width="100%" height="25" align="right">
		<%=datePost%>
        </td>
      </tr>
    </table>
        
        <table width="100%" cellspacing=3 cellpadding=3 border=0>		
		<tr>
        <td style="font-weight:bold"><font color="#ffffff">
			<%=cauhoi %>
		    </font>
        </td>
       </tr>
	</table>
    
    
    
    <table border=0 cellspacing=3 cellpadding=3 width="100%">
    
    <%
        If Not objTieuChi Is Nothing Then
            If objTieuChi.Rows.Count > 0 Then
                For Each r As DataRow In objTieuChi.Rows%> 	
    <tr height=22>
		
		<td bgcolor="#ffffff" class=chu_12xanhtim>
		<%=r("QuestionText") %>
        </td>
		<td bgcolor="#ffffff" class=chu_12xanhtim>
			<table cellspacing=0 cellpadding=0 border=0 align=left height=20 style="width:100%">
				<tr>
                    <%
                        Dim a As Double = Math.Round((r("soluong") / tong), 5) * 100
                        Dim str As String = ""
                        If (a <= 0) Then
                            str = "1px"
                        Else
                            str = a & "%"
                        End If
                        %>
					<td width='<%=str%>' bgcolor=#FF3300>&nbsp;</td>
					<td class=chu_12xanhtim><%=a%>%</td>
				</tr>
			</table>
		</td>
		<td bgcolor="#ffffff" class=chu_12xanhtim align=right><%=r("soluong")%> phiếu</td>
	</tr>
	
    
    <%
                      Next
                  End If
              End If
                         %>


	
    
    <tr height=25>
		<td bgcolor="#ffffff" colspan=3 align=right class=chu_12xanhtim>Tổng Cộng : <%=tong%> phiếu</td></tr>
	</table>

	<table width="100%" cellspacing=3 cellpadding=3 border=0>
	<tr>	
		<td height=20 valign=bottom align=right><a href="JavaScript:window.close()" class=Time><font color="#ffffff">[Trở Về]</font></a></td>
	</tr>
	</table>
    </form>
</body>
</html>
