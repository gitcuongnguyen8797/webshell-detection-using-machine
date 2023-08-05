<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkevanbandi.aspx.vb" Inherits="VANPHONG.WebForm4" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="element-box">
    <div class="m">       
    <div style="height: 40px">
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
        <telerik:RadComboBox ID="CbodonVi" Runat="server" Skin="Vista">
        </telerik:RadComboBox>
      <asp:Button ID="Button1" runat="server" Text="Xem báo cáo" 
        Font-Bold="True" ForeColor="#000040" />
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" ForeColor="#000040" />
    </div>
    </div>

    </div>
    </div>
    <hr />

     <div>
    
    
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
                        Caption="THỐNG KÊ CHI TIẾT VĂN BẢN ĐI THEO ĐƠN VỊ" GridLines="Both" 
                        ForeColor="Blue" Frame="HSides" >
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
            <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Đơn vị" Name="Donvi" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
               
            </ColumnGroups>


                         <Columns>
                                     
                            <telerik:GridBoundColumn DataField="so_di" HeaderText="Số đi" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="so_di" UniqueName="so_di">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="so_ky_hieu" HeaderText="Số ký hiệu" HeaderStyle-HorizontalAlign="Center" HeaderButtonType="TextButton"  ItemStyle-HorizontalAlign="Left"   SortExpression="VBDI" UniqueName="VBDI">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Trich_yeu" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Trích yếu" SortExpression="Trich_yeu" UniqueName="Trich_yeu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="Ngay_Gui" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left"
                                HeaderText="Ngày gửi" SortExpression="Ngay_Gui" UniqueName="Ngay_Gui" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Ten_So" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Tên Sổ" SortExpression="Ten_So" UniqueName="Ten_So" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                        
                             <telerik:GridBoundColumn DataField="noisoanthao" HeaderButtonType="TextButton"  ColumnGroupName="Donvi"  ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Nơi gửi" SortExpression="noisoanthao" UniqueName="noisoanthao" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>
                             
                             <telerik:GridBoundColumn DataField="noi_nhan" HeaderButtonType="TextButton"  ColumnGroupName="Donvi"  ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Nơi nhận" SortExpression="noi_nhan" UniqueName="noi_nhan" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>                                                    
                            </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
                              </MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>
    
    
    </div>
</asp:Content>
