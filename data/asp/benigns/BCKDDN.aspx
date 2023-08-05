<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="bckddn.aspx.vb" Inherits="DauNoi.WebForm4" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
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
			<div class="pagetitle icon-48-article"><h2>Báo cáo tổng hợp</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        
        <div>
            <asp:Label ID="Label2" runat="server" Text="Chọn Tháng"></asp:Label>
            <asp:DropDownList ID="DDThang" runat="server">
            </asp:DropDownList>
    <asp:Label ID="Label1" runat="server" Text="Chọn Năm"></asp:Label>
    <asp:DropDownList ID="drNam" runat="server" Width="145px">
    </asp:DropDownList>
    <asp:Button ID="Btn_Xuatexcel" runat="server" Font-Bold="True" 
        ForeColor="#000040" Text="Xuất Excel" Width="103px" />
    <asp:Button ID="Btexit" runat="server" Font-Bold="True" ForeColor="#000040" 
        Text="Thoát" Width="79px" />
        
        
    </div>
</div>

</asp:Content>
