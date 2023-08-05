<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="xemsolieu.aspx.vb" Inherits="caothe.xemsolieu" 
    title="" %>
    
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/base2.css" type="text/css" media="all" />
    <link rel="stylesheet" href="caothe.css"type="text/css" media="all" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
        &nbsp;
        </td>
        <td width="210" valign="top">
        <!-- Danh sach tram -->
        <table width="210" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
        <span class="lbText">Ngày</span> &nbsp;
        <telerik:RadDatePicker ID="dtPickerNgay" Runat="server" AutoPostBack="True">
            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" AutoPostBack="True"></DateInput>
        </telerik:RadDatePicker>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td colspan="3" height="5px">&nbsp;</td>
    </tr>
            <tr>
            <td width="200" valign="top" valign="middle">    
            <span class="lbText">Trạm</span> &nbsp;
                <telerik:RadComboBox ID="cboTram" Runat="server" Width="150px" AutoPostBack="true">
                </telerik:RadComboBox>
                
            </td>
            <td width="10" valign="top">    
            &nbsp;
            </td>
            <td valign="top">    
                
            </td>
            </tr>
            <tr>
            <td colspan="3" height="5px">&nbsp;</td>
            </tr>

    <tr>
        <td>
            <telerik:RadListBox ID="lstDiemDo" runat="server" Width="200px" AutoPostBack="true"></telerik:RadListBox>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
        </table>
        <!-- Danh sach tram end -->
        </td>
        <td>
        </td>
        <td valign="top">
        <!-- So Lieu -->
        <center><h2 style="text-transform:uppercase">SỐ LIỆU ĐO ĐẾM TRẠM <%=m_sTram %> <br>NGÀY <%=m_sNgay %> <br><%=m_sDiemDo%> </h2></center>
        
        
        
        
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="True" GridLines="None"
            Skin="Office2007">
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
                </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
            </MasterTableView>
<FilterMenu EnableImageSprites="False"></FilterMenu>

</telerik:RadGrid>
        <p align="right">
        
        <asp:Button ID="btnExport" runat="server" Width="80" Text="Excel" />
        
        </p>
        <!-- So Lieu End -->
        </td>
</tr>
</table>



</asp:Content>
