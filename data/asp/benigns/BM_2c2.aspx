<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2c2.aspx.vb" Inherits="niengiam.BM2c2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div.RadGrid .rgPager .rgAdvPart     
        {     
            display:none;        
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
        Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : 
        <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        Đơn vị :   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200">
                   </telerik:RadComboBox>  
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
    </div>
    <br />

    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                    style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            PageSize="20">
        <FooterStyle Font-Bold="False" Font-Italic="False" />
        <HeaderStyle Font-Bold="True" Font-Italic="False" />
        <CommandItemStyle Font-Bold="False" Font-Italic="False" />
        <ItemStyle Font-Bold="False" Font-Italic="False" />
        <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
         <ClientSettings>
              <Selecting AllowRowSelect="true" />
              <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2"></Scrolling>
         </ClientSettings>
         <HeaderStyle Width="100px"></HeaderStyle>
                                 
        <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
        <MasterTableView AllowMultiColumnSorting="True" Font-Bold="False" 
            Font-Italic="False">
        <CommandItemSettings AddNewRecordText=""   />
        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
        </ExpandCollapseColumn>
        <Columns>
            <telerik:GridBoundColumn DataField="TENDONVI" HeaderText="Công ty Điện lực"
            SortExpression="TENDONVI" UniqueName="TENDONVI">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Sophuongandangky" HeaderText="Số phương án đã đăng ký"
            SortExpression="Sophuongandangky" UniqueName="Sophuongandangky">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Sophuonganthuchien" HeaderText="Số phương án đã thực hiện"
            SortExpression="Sophuonganthuchien" UniqueName="Sophuonganthuchien">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="solanchuyentai" HeaderText="Số lần thao tác chuyển tải"
            SortExpression="solanchuyentai" UniqueName="solanchuyentai">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Sophuonganchuathuchien" HeaderText="Số phương án chưa thực hiện"
            SortExpression="Sophuonganchuathuchien" UniqueName="Sophuonganchuathuchien">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Tilethuchien" HeaderText="Tỷ lệ % thực hiện"
            SortExpression="Tilethuchien" UniqueName="Tilethuchien">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="SAIDI" HeaderText="SAIDI (∑Ti*Ki)/K"
            SortExpression="SAIDI" UniqueName="SAIDI">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SAIFI" HeaderText="SAIFI (Nj/K)"
            SortExpression="SAIFI" UniqueName="SAIFI">
            </telerik:GridBoundColumn>
            
        </Columns>
        <EditFormSettings  EditFormType="Template">
            <EditColumn UniqueName="EditCommandColumn1" >
            </EditColumn>
        </EditFormSettings>
        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />
        <HeaderStyle Font-Bold="False" Font-Italic="False" />
        <FooterStyle Font-Bold="True" Font-Italic="True" />
        </MasterTableView>
        <SelectedItemStyle Font-Bold="False" />
        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
        <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
        </HeaderContextMenu>
    </telerik:RadGrid>
    </div>
    <br /> 
    <div style="text-align:right;">
    </div>
    <br />    
      <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
