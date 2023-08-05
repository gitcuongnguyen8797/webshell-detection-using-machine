<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="ThongkevanbanLoi.aspx.vb" Inherits="VANPHONG.WebForm10" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="element-box">
    <div class="m">       
    <div style="height: 60px">
    <div align="center">
    Từ ngày: 
        <telerik:RadDatePicker ID="DateTuNgay" Runat="server" Culture="vi-VN" 
            Skin="Web20">
    <Calendar ID="Calendar1"  UseColumnHeadersAsSelectors="False" Runat="server" 
                       UseRowHeadersAsSelectors="False" ViewSelectorText="x" Skin="Web20">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
    </telerik:RadDatePicker>
      Đến ngày : 
        <telerik:RadDatePicker ID="DateDenNgay" Runat="server" Culture="vi-VN" 
            Skin="Web20">
      <Calendar ID="Calendar4"  UseColumnHeadersAsSelectors="False" Runat="server" 
                       UseRowHeadersAsSelectors="False" ViewSelectorText="x" Skin="Web20">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
      </telerik:RadDatePicker>
       
        Đơn vị :<telerik:RadComboBox ID="CbodonVi" Runat="server" AutoPostBack="true" ontextchanged="CbodonVi_TextChanged" Width="200px" Skin="Vista">
        </telerik:RadComboBox> <asp:Button ID="Button1" runat="server" Text="Xem báo cáo" 
        Font-Bold="True" ForeColor="#000040" />
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" ForeColor="#000040" />
    </div>
    </div>

    </div>
    </div>
    <hr />

       <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False"  ShowGroupPanel="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            ShowFooter="True" PageSize="100">
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" Position="TopAndBottom" AlwaysVisible="true" />
                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" 
                        ReorderColumnsOnClient="True">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   
                        Caption="THỐNG KÊ SỐ VĂN BẢN GỬI NHẬN LỖI" GridLines="Both" 
                        ForeColor="Blue" Frame="HSides" >
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
            <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Thông tin đơn vị" Name="Donvi" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
               
            </ColumnGroups>


                         <Columns>
                                     
                            <telerik:GridBoundColumn DataField="Ma_DVGui" HeaderText="Đơn vị gửi" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="Ma_DVGui" UniqueName="Ma_DVGui" ColumnGroupName="Donvi">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Ma_DVNhan" HeaderText="Đơn vị nhận" HeaderStyle-HorizontalAlign="Center" HeaderButtonType="TextButton"  
                            ItemStyle-HorizontalAlign="Left"   SortExpression="Ma_DVNhan" UniqueName="Ma_DVNhan" ColumnGroupName="Donvi">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="So_Ky_Hieu" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Số ký hiệu" SortExpression="So_Ky_Hieu" UniqueName="So_Ky_Hieu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Trich_Yeu" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Trích Yếu" SortExpression="Trich_Yeu" UniqueName="Trich_Yeu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Ngay_Gui" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Ngày Gửi" SortExpression="Ngay_Gui" UniqueName="Ngay_Gui" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="Ngay_VB" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Ngày văn bản" SortExpression="Ngay_VB" UniqueName="Ngay_VB" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                             </telerik:GridBoundColumn>
                                                                            
                            </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
                              </MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>
</asp:Content>
