<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ping.aspx.vb" Inherits="IPTram.ping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" align="center">
            <tr>
                <td><asp:Label ID="lbIP" runat="server" Text="IP / name"></asp:Label> : </td>
                <td>&nbsp;<asp:TextBox ID="txtIP" runat="server">haontt</asp:TextBox></td>
                <td>&nbsp;<asp:Button ID="btnPing" runat="server" Text="Send" /></td>
            </tr>
            <tr>
                <td colspan="3"><asp:TextBox ID="txtStatus" runat="server" TextMode="MultiLine" Height="206px" Width="390px"></asp:TextBox></td>
            </tr>
        </table>
        
        
        
        <br />
        
    </div>
    </form>
</body>
</html>
