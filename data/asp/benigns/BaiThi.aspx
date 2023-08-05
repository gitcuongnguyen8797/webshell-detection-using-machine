<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout/baithiLayout.Master" CodeBehind="BaiThi.aspx.vb" Inherits="QuanLyThi.BaiThi" %>
<%@ Register TagPrefix="uc" TagName="ucInfo1" Src="~/Controls/ucSectionNguoiDung.ascx" %>
<asp:Content ID="user" ContentPlaceHolderID="userInfo" runat="server">
    <uc:ucInfo1 ID="displayUserInfo" runat="server"></uc:ucInfo1>
</asp:Content>
<asp:Content ID="contentBaiThi" ContentPlaceHolderID="mainContent" runat="server">
    <style type="text/css">
tr
{
    line-height:1.7em;
}
#tblNoiDungCauHoi
{
    width:100%;
</style>
<div style="width:700px; padding:10px;">         
	<table id="tblNoiDungCauHoi">
		<tr>
        <td align="left">
            <asp:Label ID="lblThoiGian" runat="server" Font-Bold="true" 
                Font-Names="Times New Roman" Font-Size="X-Small" ForeColor="#647DD7"></asp:Label>
            </td>
        <td align="right" colspan="2">
            <asp:Label ID="lblTGConLai" runat="server" Font-Bold="true" 
                Font-Names="Times New Roman" Font-Size="X-Small" ForeColor="Maroon"></asp:Label>
            </td>
        </tr>
        <tr>
        <td colspan="3" align="center"">
            <asp:Label ID="lblThongBao" runat="server" Font-Bold="true" 
                ForeColor="DarkOrange"></asp:Label>
         </td>
        </tr>
        <tr>
        <td colspan="3" align="center"><asp:label id="lblCauHoi" ForeColor="MidnightBlue" runat="server" Font-Bold="true" Height="24px"
						Width="100%" Font-Size="Medium" Font-Names="Times New Roman"></asp:label></td>
        </tr>
        <tr>
        <td colspan="3" align="center">
            <asp:Label ID="lblHuongDan" runat="server" Font-Bold="true" Font-Size="Large" 
                ForeColor="RoyalBlue"></asp:Label>
        </td>
        </tr>
        <tr>
        <td colspan="3" align="center"><asp:image id="Image1" runat="server" Visible="False"></asp:image></td>
        </tr>
        <tr>
        <td colspan="3" align="center">&nbsp;</td>
        </tr>
        <tr>
        <td colspan="3" align="center">&nbsp;</td>
        </tr>
        <tr>
        <td colspan="3"><asp:RadioButtonList ID="list" runat="server"></asp:RadioButtonList></td>
        </tr>
        <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        </tr>
        <tr>
        <td colspan="3" align="right">
            <asp:Button ID="cmdtroVe" runat="server" BackColor="AliceBlue" 
                BorderStyle="Groove" Font-Size="X-Small" ForeColor="MidnightBlue" Height="32px" 
                Text="&lt;&lt; Trở về" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="cmdSave" runat="server" BackColor="#003366" 
                BorderStyle="Groove" Font-Bold="true" Font-Size="X-Small" ForeColor="Beige" 
                Height="32px" Text="Chấp nhận" />&nbsp;&nbsp;
            <asp:Button ID="cmdTiepTuc" runat="server" BackColor="AliceBlue" 
                BorderStyle="Groove" Font-Size="X-Small" ForeColor="MidnightBlue" Height="32px" 
                Text="Tiếp tục &gt;&gt;" />
         </td>
        </tr>
        <tr>
        <td></td>
        <td></td>
        <td>
        </td>
        </tr>
        <tr>
        <td align="right" colspan="3">
            <asp:Label ID="lblSoCautraLoi" runat="server" Font-Bold="true" 
                Font-Names="Courier New" Font-Size="X-Small" ForeColor="#647DD7"></asp:Label>
        </td>
        </tr>
        <tr>
        <td></td>
        <td></td>
        <td >
        </td>
        </tr>
        <tr>
        <td colspan="3" align="right">
            <asp:Button ID="cmdNopBai" runat="server" BackColor="AliceBlue" 
                BorderStyle="Groove" Font-Size="X-Small" ForeColor="MidnightBlue" 
                Text="Nộp bài" Width="86px" Height="32px"/>
        </td>
        </tr>
	</table>
</div>
</asp:Content>
