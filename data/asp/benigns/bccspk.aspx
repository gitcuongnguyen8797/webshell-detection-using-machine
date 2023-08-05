<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bccspk.aspx.vb" Inherits="bckinhdoanh.bccspk" 
    title="Bao Cao CSPK" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    <table border="0" cellpadding="0" cellspacing="0" width="600px">
        <tr>
            <td width="200px">&nbsp;</td>
            <td width="5px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center"><font color="green"><b>THEO DÕI TÌNH HÌNH CHỐT CHỈ SỐ ĐỔI GIÁ ĐIỆN TỪ NGÀY 01/06/2014</b></font><br /><br /></td>
        </tr>
        <tr>
            <td></td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Lưu" Width="80px"  AutoPostBack="true" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td colspan="3" height="5px">
                <font color="red"><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></font>
            </td>
        </tr>
    </table>
</div>

</asp:Content>
