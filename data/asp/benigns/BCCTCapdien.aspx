<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="BCCTCapdien.aspx.vb" Inherits="DauNoi.WebForm5" %>
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
			<div class="pagetitle icon-48-article"><h2>Báo cáo cấp điện</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        
        <div>
    <asp:Label ID="Label1" runat="server" Text="Chọn Biên nhận khảo sát"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px"  AutoPostBack="True">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Xem in" Font-Bold="True" 
        ForeColor="#000040" Width="96px" />
    <asp:Button ID="Button2" runat="server" Text="Xuất Excel" Font-Bold="True" 
        ForeColor="#000040" />
    <br />
    </div>

    <CR:CrystalReportViewer ID="PHIEUKHAOSAT" runat="server" 
        AutoDataBind="true" />
        
        
    </div>
</div>

</asp:Content>
