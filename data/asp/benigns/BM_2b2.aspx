<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2b2.aspx.vb" Inherits="niengiam.BM2b2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            height: 20px;
        }
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
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Web20" Text="Tìm kiếm" 
         Width="150px">
     </telerik:RadButton>
    </div>
    <br />

    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Vista" 
                    style="margin-top: 0px" CellSpacing="0" AllowPaging="True">
        <FooterStyle Font-Bold="False" Font-Italic="False" />
        <HeaderStyle Font-Bold="True" Font-Italic="False" />
        <CommandItemStyle Font-Bold="False" Font-Italic="False" />
        <ItemStyle Font-Bold="False" Font-Italic="False" />
        <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
        <ClientSettings>
            <Selecting AllowRowSelect="true" />
            <Scrolling AllowScroll="true" UseStaticHeaders="true"></Scrolling>
        </ClientSettings>                  
        <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
        <MasterTableView AllowMultiColumnSorting="True" Font-Bold="False" 
            Font-Italic="False" DataKeyNames="Id">
        <CommandItemSettings AddNewRecordText=""   />
        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
        </ExpandCollapseColumn>
        <Columns>
           <telerik:GridBoundColumn DataField="Id" HeaderText="ID" HeaderButtonType="TextButton"
            SortExpression="Id" UniqueName="Id" Visible="false">
            </telerik:GridBoundColumn>

           <telerik:GridBoundColumn DataField="tendonvi" HeaderText="Công ty Điện lực"
            SortExpression="tendonvi" UniqueName="tendonvi">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="sokhquanly" HeaderText="Số khách hàng quản lý"
            SortExpression="sokhquanly" UniqueName="sokhquanly">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="soluothotline" HeaderText="Tổng số lượt thi công hotline"
            SortExpression="soluothotline" UniqueName="soluothotline">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="sokhmd" HeaderText="Tổng số khách hàng bị mất điện"
            SortExpression="sokhmd" UniqueName="sokhmd">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="sothoigianmd" HeaderText="Tổng thời gian mất điện của khách hàng"
            SortExpression="sothoigianmd" UniqueName="sothoigianmd">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="soluongkpp" HeaderText="Tổng sản lượng không phân phối được (kWh)"
            SortExpression="soluongkpp" UniqueName="soluongkpp">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SAIDI" HeaderText="SAIDI"
            SortExpression="SAIDI" UniqueName="SAIDI">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SAIFI" HeaderText="SAIFI"
            SortExpression="SAIFI" UniqueName="SAIFI">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="GhiChu" HeaderText="Ghi chú"
            SortExpression="GhiChu" UniqueName="GhiChu">
            </telerik:GridBoundColumn> 

            <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderStyle-Width="50px">
            

<HeaderStyle Width="50px"></HeaderStyle>
            </telerik:GridTemplateColumn>
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
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
