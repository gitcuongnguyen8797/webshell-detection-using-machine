<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.master" CodeBehind="frmThoaThuan2.aspx.vb" Inherits="DauNoi.frmThoaThuan2" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
			<div class="pagetitle icon-48-article"><h2>Báo cáo thỏa thuận khách hàng</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
 <div>
   

</div>
<div id="element-box">
    <div class="m"> 
    <div style="height: 60px">
 <asp:Label ID="Label1" runat="server" Text="Số biên nhận"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" Width="169px"  
                AutoPostBack="True" OnTextChanged="DropDownList1_TextChanged">
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="Năm báo cáo"></asp:Label>
            <asp:DropDownList ID="DDNam" runat="server" OnTextChanged="DDNam_TextChanged" AutoPostBack="True">
            </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Xem in" Font-Bold="True" 
        ForeColor="#000040" />
    <asp:Button ID="Button2" runat="server" Text="Xuất Excel" Font-Bold="True" 
        ForeColor="#000040" />
    <asp:Button ID="Button3" runat="server" Text="Xuất Word" Font-Bold="True" 
        ForeColor="#000040" Visible="False" Enabled="False" />
    </div>
          <CR:CrystalReportViewer ID="CrystalReportViewer1" ToolPanelView="None" runat="server" AutoDataBind="true" />
        
        
    </div>
</div>

</asp:Content>



