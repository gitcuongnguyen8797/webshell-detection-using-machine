<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="dongbo.aspx.vb" Inherits="serCheckData.dongbo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="head">
    
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>Đồng Bộ Số Liệu Đo Xa</h2></div>
		</div>
    </div>
    <div id="system-message-container">            
        <asp:PlaceHolder ID="msg" runat="server">                
        </asp:PlaceHolder> 
    </div>
    <div id="element-box">
        <div class="m">
             <h3>Chọn thông tin đồng bộ số liệu:</h3>    
    
            <asp:DropDownList ID="lstNCC" runat="server">
                <asp:ListItem Text="ICDREC" Value="1" Selected></asp:ListItem>
                <asp:ListItem Text="VIETTEL" Value="2"></asp:ListItem>
                <asp:ListItem Text="VINASINO" Value="3"></asp:ListItem>
                <asp:ListItem Text="SAOVIET" Value="4"></asp:ListItem>
                <asp:ListItem Text="IFC" Value="5"></asp:ListItem>
            </asp:DropDownList>
    
            <br /><br />
    
            <telerik:RadDatePicker ID="txtNgay" Calendar-CultureInfo="vi-VN" ToolTip="Chọn ngày" runat="server">
                <DateInput DateFormat="dd/MM/yyyy"> 
                    </DateInput>
             </telerik:RadDatePicker>
            <br />
    
            <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="btnOK" runat="server" Text="OK" />
        </div>
    </div> 
    
</asp:Content>
