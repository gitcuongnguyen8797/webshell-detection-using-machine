<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="resetpasstram.aspx.vb" Inherits="caothe.resetpasstram" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="860" border="0" align="center">
    <tr>
    <td align="center">
    
<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
            AllowPaging="True" AllowSorting="True" PageSize="20" Skin="Office2007">
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
                        <telerik:GridBoundColumn DataField="USERNAME" HeaderText="Người Dùng" UniqueName="USERNAME">
                        </telerik:GridBoundColumn>
                        <telerik:GridHyperLinkColumn HeaderText="Reset" UniqueName="Reset" DataNavigateUrlFormatString="resetpasstram.aspx?ID={0}" DataNavigateUrlFields="USERNAME" Text="RESET"></telerik:GridHyperLinkColumn>
                </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
<FilterMenu EnableImageSprites="False"></FilterMenu>
</telerik:RadGrid>   

    </td>
    </tr>
  <tr><td><asp:Label ID="lbMessage" runat="server"></asp:Label> </td></tr>
</table>

</asp:Content>
