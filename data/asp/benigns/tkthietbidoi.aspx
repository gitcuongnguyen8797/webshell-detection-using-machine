<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="tkthietbidoi.aspx.vb" MasterPageFile="~/vanhanh.master" Inherits="caothe.tkthietbidoi" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="JustGrid" namespace="JustGrid" tagprefix="jGrid" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/base2.css" type="text/css" media="all" />
    <link rel="stylesheet" href="caothe.css"type="text/css" media="all" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
        <center><h2 style="text-transform:uppercase">THỐNG KÊ % CẬP NHẬT DỮ LIỆU</h2></center>
        <br /><br />
        </td>
     </tr>

    <tr>
        <td align="center">
         <B>Đội</B> <asp:DropDownList ID="lstDoi" runat="server" AutoPostBack="true"></asp:DropDownList>              
         <br /><br /> 
         <asp:DropDownList ID="lstBang" runat="server" Visible="false"></asp:DropDownList>              
         <asp:Button ID="btnXem" runat="server" Text="Xem" Visible="false" />
        </td>
    </tr>
        
        <tr>
        <td valign="top" align="center">
        <!-- So Lieu -->
        <br /><br />
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="false" GridLines="None"
            Skin="Office2007" AlternatingItemStyle-BackColor="AntiqueWhite" Visible="true">
            
<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Office2007"></HeaderContextMenu>

<MasterTableView NoMasterRecordsText="Không có dòng nào">
                <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                <RowIndicatorColumn>
                    <HeaderStyle Width="20px"></HeaderStyle>
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                    <HeaderStyle Width="20px"></HeaderStyle>
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="Bang" ItemStyle-Width="200" HeaderText="Bảng"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Tong" ItemStyle-Width="200" HeaderText="Tổng"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ConLai" ItemStyle-Width="200" HeaderText="Còn lại"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TyLe" ItemStyle-Width="200" HeaderText="% Cập nhật"></telerik:GridBoundColumn>
                </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
<FilterMenu EnableImageSprites="False"></FilterMenu>

</telerik:RadGrid>

<br /><br />
         <asp:GridView ID="GridView1" runat="server">
         </asp:GridView>
         
        <p align="center">
        
        <asp:Button ID="btnExport" runat="server" Width="80" Text="Excel" Visible="false" />
        
        </p>
        <!-- So Lieu End -->
        </td>
</tr>
</table>

</asp:Content>