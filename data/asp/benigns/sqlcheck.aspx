<%@ Page Language="vb" MasterPageFile="~/ASite.Master" AutoEventWireup="false" CodeBehind="sqlcheck.aspx.vb" Inherits="serCheckData.sqlcheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">        
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>CHECK SQL SERVER</h2></div>
		</div>
    </div>
    <div id="system-message-container">            
        <asp:PlaceHolder ID="msg" runat="server">                
        </asp:PlaceHolder> 
    </div>
    <div id="element-box">
        <div class="m">




    <table align="center">
       <tr>
            <td colspan="3"><font color="blue"><h2>CHECK SQL SERVER FOR TESTING PURPOSE</h2></font></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbServer" runat="server" Text="Server"></asp:Label></td>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtServer" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbDBName" runat="server" Text="DB Name"></asp:Label></td>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtDBName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbUser" runat="server" Text="DB User"></asp:Label></td>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbPassword" runat="server" Text="DB Password"></asp:Label></td>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnCheck" runat="server" Text="OK" /><asp:Button ID="btnReset" runat="server" Text="Reset" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <font color="red"><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></font>
            </td>
        </tr>
        
    </table>
   


         </div>
    </div>
</asp:Content>
