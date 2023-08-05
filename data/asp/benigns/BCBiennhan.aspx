<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.master" CodeBehind="bcbiennhan.aspx.vb" Inherits="DauNoi.WebForm1" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
			<div class="pagetitle icon-48-article"><h2>Báo cáo biên nhận</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        
        <div style="height: 60px">Chọn số yêu cầu :<asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="True" OnTextChanged="DropDownList1_TextChanged"></asp:DropDownList> 
            <asp:Label ID="Label1" runat="server" Text="Năm báo cáo"></asp:Label>
            <asp:DropDownList ID="DDNam" runat="server" OnTextChanged="DDNam_TextChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:Button ID="BtnXem" runat="server" Text="Xem in" Width="86px" />
            <asp:Button ID="Btn_Xuatexcel" runat="server" Text="Xuất Excel" />
        </div>
          <CR:CrystalReportViewer ToolPanelView="None" ID="PhieuBienNhan" runat="server" 
            AutoDataBind="true" />
        
        
    </div>
</div>

</asp:Content>
