<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="serCheckData._Default" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <h1>Welcome to Data Check testing.</h1>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     
    <h3>Please choose a day:</h3>    
    <telerik:RadDatePicker ID="txtNgay" Calendar-CultureInfo="vi-VN" ToolTip="Chọn ngày" runat="server">
        <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>
     </telerik:RadDatePicker>
    <br />
    
    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label><br />
    <asp:Button ID="btnOK" runat="server" Text="OK" />
</asp:Content>
