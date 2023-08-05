<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout/baithiLayout.Master" CodeBehind="HetBaiThi.aspx.vb" Inherits="QuanLyThi.HetBaiThi" %>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
<style type="text/css">
tr
{
    line-height:1.5em;
    font-size:1em;
}
    .style1
    {
        width: 729px;
    }
</style>
<table style="width:100%;">
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="2" style="font-size:1.3em;font-weight:bold;text-align:center;color:#647DD7;"><h2>Đã hết câu hỏi của bài thi</h2></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td style="font-weight:bold;text-align:center;color:#647DD7;" class="style1">Chọn 
    các chức năng bên trái màn hình để xem lại bài thi hoặc nộp bài <asp:HyperLink ForeColor="DarkOrange" runat="server" Text="tại đây" NavigateUrl="~/XacNhanNopBai.aspx"></asp:HyperLink></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
</asp:Content>
