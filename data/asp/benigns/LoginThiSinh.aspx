<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout/mainLayout.Master" CodeBehind="LoginThiSinh.aspx.vb" Inherits="QuanLyThi.LoginThiSinh" %>
<%@Register tagprefix="uc" tagname="Login" src="~/Controls/ucLogin.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style type="text/css">
h3
{
      font-weight:bold;
}  
tblThiSinh
{
    width:500px;
    margin-left:150px;
}
tr
{
    height:1.7em;
}
.label
{
    color:#003663;
    font-family:Tahoma;
    font-weight:bold;
    width:200px;
    text-align:right;
}
.info
{
    width:300px;
    color: #647DD7;
    font-family: Arial;
    padding-left: 15px;
}
        .style1
        {
            color: #003663;
            font-family: Courier New;
            font-weight: bold;
            width: 200px;
            text-align: right;
            height: 1.6em;
        }
        .style2
        {
            width: 300px;
            color: #647DD7;
            font-family: Arial;
            padding-left: 15px;
            height: 1.6em;
        }
    </style>
<!-- <div style="display:table;">
    <div style="display:table-cell;padding-left:10px;">Mã số truy cập</div>
    <div style="display:table-cell;padding-left:10px;"><asp:TextBox ID="txtMaThiSinh" 
            runat="server" BackColor="#6699FF"></asp:TextBox></div>
    <div style="display:table-cell;padding-left:10px;"><asp:Button ID="btnSubmit" 
            runat="server" Text="Chấp nhận" BackColor="#003366" ForeColor="White" /></div>
    <div style="display:table-cell;padding-left:10px;"><asp:Label ID="lblThongBao" runat="server" ForeColor="OrangeRed" Visible="False"></asp:Label></div>
</div>
<div id="infoBox" runat="server" visible="false">
<table id="tblThiSinh" align="center">
<tr>
<td colspan=2 style="line-height:3em;text-align:center;"><asp:label id="lblInfo" 
        runat="server" Font-Size="Medium" Font-Bold="True" ForeColor="OrangeRed" 
        Font-Names="Times New Roman"></asp:label></td>
</tr>
<tr>
<td colspan=2 style="line-height:3em;text-align:center;"><h3>THÔNG TIN NHÂN VIÊN</h3></td>
</tr>
<tr>
<td class="style1">Họ tên:</td>
<td class="style2"><asp:label id="lblName" runat="server"></asp:label></td>
</tr>
<tr>
<td class="style1">Mã nhân viên:</td>
<td class="style2"><asp:label id="lblStaffID" runat="server"></asp:label></td>
</tr>
<tr>
<td class="label">Đơn vị:</td>
<td class="info">
			<asp:label id="lblPart" runat="server"></asp:label></td>
</tr>
<tr>
<td class="label">Chức vụ:</td>
<td class="info"><asp:label id="lblChucVu" runat="server"></asp:label></td>
</tr>
<tr>
<td class="label">Đề thi:</td>
<td class="info">
    <asp:DropDownList ID="drpBoDe" runat="server" Font-Bold="False" 
        Font-Names="Courier New" ForeColor="#647DD7" Font-Size="Medium">
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td>
						<asp:button id="cmdBack" runat="server" Font-Size="Small" ForeColor="AliceBlue" Font-Names="Arial"
								Width="91px" BackColor="#003366" BorderStyle="Solid" Text="<< Trở về"></asp:button>
</td>
<td align="right">
			<asp:button id="cmdStart" runat="server" Font-Size="Small" 
                ForeColor="AliceBlue" Font-Names="Arial"
				Width="111px" Font-Bold="True" BackColor="#003366" BorderStyle="Solid" Text=">>Bắt đầu>>"
				Height="22px"></asp:button></td>
</tr>
</table>
</div>-->
<uc:Login runat="server" ID="loginBox" />
</asp:Content>
