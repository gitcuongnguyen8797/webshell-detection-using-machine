<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="logSheet220.aspx.vb" Inherits="caothe.logSheet220" 
    title="Log Sheet 220" %>
    
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
    <tr><td valign="top" align="center"><br /><br />
        <font color="Maroon" face="Tahoma" size="3"><asp:Label ID="lbTram" runat="server" Text="LOG SHEET 220 BÌNH TÂN"></asp:Label></font><br /><br />
        </td>
    </tr>
    <tr><td valign="top" align="center">
    
        &nbsp;<br /><br />
    </td></tr>
    <tr><td valign="top" align="center">
        <table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100px" valign="top" align="left">
        <div runat="server" id="divNgay1">Ngày: </div></td>
                <td>&nbsp;</td>
                <td align="left">
        <telerik:RadDatePicker ID="dtPickerNgay" Runat="server" AutoPostBack="True">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" AutoPostBack="True"></DateInput>
        </telerik:RadDatePicker>
                <br /><br />
                </td>
            </tr>
            <tr>
                <td width="100px">
                </td>
                <td>&nbsp;</td>
                <td align="left">
                <telerik:RadButton ID="btnBaoCao" runat="server" Text="Xuất Báo Cáo">
                </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td width="100px">
                </td>
                <td>&nbsp;</td>
                <td align="left"><br /><br /><font color="red"><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></font></td>
            </tr>
        </table>
        </td>
    </tr>
</table>

</asp:Content>
