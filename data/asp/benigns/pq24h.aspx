<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="pq24h.aspx.vb" Inherits="caothe.pq24h" 
    title="PQ 24H" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="JustGrid" namespace="JustGrid" tagprefix="jGrid" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/base2.css" type="text/css" media="all" />
    <link rel="stylesheet" href="caothe.css"type="text/css" media="all" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table width="2000" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
        <center><h2 style="text-transform:uppercase">SỐ LIỆU P, Q 24H </h2></center>
        
        <span class="lbText">Ngày</span> &nbsp;
        <telerik:RadDatePicker ID="dtPickerNgay" Runat="server" AutoPostBack="True">
            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>

            <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" AutoPostBack="True"></DateInput>
            
        </telerik:RadDatePicker>
        <br /><br />
        </td>
        </tr>
        <tr>
        <td valign="top">
        <!-- So Lieu -->
                
        <jGrid:JustGrid ID="mygrid"  Width="100%" CellPadding="5" BorderStyle="None" RowStyle-BorderStyle="None" runat="server" AlternatingRowStyle-BackColor="#EBEBEB" HeaderStyle-BackColor="#636363"></jGrid:JustGrid>
        
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="false" GridLines="None"
            Skin="Office2007" AlternatingItemStyle-BackColor="AntiqueWhite" Visible="false">
            
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
                    <telerik:GridBoundColumn DataField="STT" ItemStyle-Width="10" HeaderText="STT"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TRAM" ItemStyle-Width="300" HeaderText="Tên Trạm"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Udm" ItemStyle-Width="30" HeaderText="Udm"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P1" ItemStyle-Width="30" HeaderText="P1"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q1" ItemStyle-Width="30" HeaderText="Q1"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P2" ItemStyle-Width="30" HeaderText="P2"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q2" ItemStyle-Width="30" HeaderText="Q2"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P3" ItemStyle-Width="30" HeaderText="P3"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q3" ItemStyle-Width="30" HeaderText="Q3"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P4" ItemStyle-Width="30" HeaderText="P4"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q4" ItemStyle-Width="30" HeaderText="Q4"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P5" ItemStyle-Width="30" HeaderText="P5"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q5" ItemStyle-Width="30" HeaderText="Q5"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P6" ItemStyle-Width="30" HeaderText="P6"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q6" ItemStyle-Width="30" HeaderText="Q6"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P7" ItemStyle-Width="30" HeaderText="P7"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q7" ItemStyle-Width="30" HeaderText="Q7"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P8" ItemStyle-Width="30" HeaderText="P8"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q8" ItemStyle-Width="30" HeaderText="Q8"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P9" ItemStyle-Width="30" HeaderText="P9"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q9" ItemStyle-Width="30" HeaderText="Q9"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P10" ItemStyle-Width="30" HeaderText="P10"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q10" ItemStyle-Width="30" HeaderText="Q10"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P11" ItemStyle-Width="30" HeaderText="P11"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q11" ItemStyle-Width="30" HeaderText="Q11"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P12" ItemStyle-Width="30" HeaderText="P12"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q12" ItemStyle-Width="30" HeaderText="Q12"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P13" ItemStyle-Width="30" HeaderText="P13"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q13" ItemStyle-Width="30" HeaderText="Q13"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P14" ItemStyle-Width="30" HeaderText="P14"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q14" ItemStyle-Width="30" HeaderText="Q14"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P15" ItemStyle-Width="30" HeaderText="P15"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q15" ItemStyle-Width="30" HeaderText="Q15"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P16" ItemStyle-Width="30" HeaderText="P16"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q16" ItemStyle-Width="30" HeaderText="Q16"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P17" ItemStyle-Width="30" HeaderText="P17"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q17" ItemStyle-Width="30" HeaderText="Q17"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P18" ItemStyle-Width="30" HeaderText="P18"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q18" ItemStyle-Width="30" HeaderText="Q18"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P19" ItemStyle-Width="30" HeaderText="P19"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q19" ItemStyle-Width="30" HeaderText="Q19"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P20" ItemStyle-Width="30" HeaderText="P20"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q20" ItemStyle-Width="30" HeaderText="Q20"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P21" ItemStyle-Width="30" HeaderText="P21"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q21" ItemStyle-Width="30" HeaderText="Q21"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P22" ItemStyle-Width="30" HeaderText="P22"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q22" ItemStyle-Width="30" HeaderText="Q22"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P23" ItemStyle-Width="30" HeaderText="P23"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q23" ItemStyle-Width="30" HeaderText="Q23"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="P24" ItemStyle-Width="30" HeaderText="P24"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Q24" ItemStyle-Width="30" HeaderText="Q24"></telerik:GridBoundColumn>
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

