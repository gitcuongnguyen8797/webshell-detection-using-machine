<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="import_soho.aspx.vb" Inherits="bckinhdoanh.import_soho" 
    title="Cập Nhật Số KH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

    <asp:GridView ID="GridView1" runat="server" Height="420px" Width="477px">
        
    </asp:GridView>

</div>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:415pt" width="550">
    <tr>
        <td colspan="3">
            <br />
                                    </td>
    </tr>
    <tr>
        <td colspan="3"><b>CẬP NHẬT DANH SÁCH NHÀ TRỌ THEO THÁNG</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>Tháng :</td>
        <td></td>
        <td><asp:DropDownList ID="cboThang" runat="server" AutoPostBack="True"></asp:DropDownList></td>
    </tr>
     <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td>Năm :</td>
        <td></td>
        <td><asp:DropDownList ID="cboNam" runat="server" AutoPostBack="True"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
    </tr>
   <tr>
        <td>File upload:</td>
        <td></td>
        <td><asp:FileUpload ID="upFile" runat="server" Text="Up" /></td>
    </tr>
       <tr>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
    </tr>
       <tr>
        <td>Dòng đầu</td>
        <td></td>
        <td><asp:TextBox ID="txtDongDau" runat="server" width="90"></asp:TextBox></td>
    </tr>
       <tr>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
    </tr>
       <tr>
        <td>Dòng cuối</td>
        <td></td>
        <td><asp:TextBox ID="txtDongCuoi" runat="server" width="90"></asp:TextBox></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td></td>
        <td></td>
    </tr>
       <tr>
        <td>&nbsp;</td>
        <td></td>
        <td>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" Width="72px" />
            <asp:Button ID="Button1" runat="server" Text="Xem Lưới" />
           </td>
    </tr>
    
       <tr>
        <td><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></td>
        <td></td>
        <td></td>
    </tr>
</table>

    
    <br />

    
&nbsp;
 

</asp:Content>
