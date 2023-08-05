<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="giotruyen.aspx.vb" Inherits="caothe.giotruyen" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="100%" border="0" align="center">
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
                        <telerik:GridBoundColumn DataField="TBTID" HeaderText="TBTID" UniqueName="TBTID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TENTRAM01" HeaderText="Tên Trạm" UniqueName="TENTRAM01">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="GioTruyen01" HeaderText="Giờ Truyền" UniqueName="GioTruyen01">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TENTRAM02" HeaderText="Tên Trạm" UniqueName="TENTRAM02">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="GioTruyen02" HeaderText="Giờ Truyền" UniqueName="GioTruyen02">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TENTRAM03" HeaderText="Tên Trạm" UniqueName="TENTRAM03">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="GioTruyen03" HeaderText="Giờ Truyền" UniqueName="GioTruyen03">
                        </telerik:GridBoundColumn>
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
