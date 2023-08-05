<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout/mainLayout.Master" CodeBehind="LoginQuanTri.aspx.vb" Inherits="QuanLyThi.LoginQuanTri" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style type="text/css">
table
{
    width:450px;
    font-family:"Times New Roman",Tahoma,Arial;
}
tr
{
    line-height:1.7em;
}
.label
{
    width:150px;
    color:#003663;
    font-family:"Times New Roman";
    text-align:right;
}
.info
{
    width:300px;
    padding-left:10px;
}
h3
{
    color:#003663;
    font-size:1.2em;
    font-weight:bold;
}
</style>
<div>
<table>
<tr>
<td colspan="2" align="center" style="line-height:2.5em;"><h3>THÔNG TIN ĐĂNG NHẬP</h3></td>
</tr>
<tr>
<td class="label">Tên đăng nhập:</td>
<td class="info"><asp:TextBox ID="txtUserName" runat="server" BackColor="#99CCFF" 
        Width="247px"></asp:TextBox></td>
</tr>
<tr>
<td class="label">Mật khẩu:</td>
<td class="info"><asp:TextBox ID="txtPassword" runat="server" BackColor="#99CCFF" 
        TextMode="Password"></asp:TextBox></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td>
    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" BackColor="#003366" 
        ForeColor="White" />
    </td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</div>
</asp:Content>
