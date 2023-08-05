<%@ Page Language="vb" MasterPageFile="~/ASite.Master" AutoEventWireup="false" CodeBehind="telnet.aspx.vb" Inherits="serCheckData.telnet" %>

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
			<div class="pagetitle icon-48-article"><h2>TELNET</h2></div>
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
            <td colspan="3"><font color="blue"><h2>TELNET FOR TESTING PURPOSE</h2></font></td>
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
                <asp:Label ID="lbPort" runat="server" Text="Port"></asp:Label></td>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="txtPort" runat="server" Text="80"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnCheck" runat="server" Text="OK" /></td>
        </tr>
        <tr>
            <td></td>
            <td>&nbsp;</td>
            <td>
                <font color="red"><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></font>
            </td>
        </tr>
        
    </table>
    


</div>
    </div>
</asp:Content>
