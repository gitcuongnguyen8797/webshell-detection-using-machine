<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkevanbanden.aspx.vb" Inherits="VANPHONG.WebForm5" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

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
       <asp:Label ID="Label4" runat="server" Text="Chọn" 
              Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
             <asp:RadioButton id="All" GroupName="Vanbanden" 
             Text=""  runat="server"/> 
    <asp:Label ID="Label1" runat="server" Text="Tất cả" 
              Font-Bold="false" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
           <asp:RadioButton id="TKNOIBO" GroupName="Vanbanden" 
             Text=""  runat="server"/>
          <asp:Label ID="Label2" runat="server" Text="Đến nội bộ" 
              Font-Bold="false" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
          <asp:RadioButton id="TKBENNGOAI" GroupName="Vanbanden" 
             Text=""  runat="server"/>
          <asp:Label ID="Label3" runat="server" Text="Đến bên ngoài" 
              Font-Bold="false" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Đơn vị :<telerik:RadComboBox ID="CbodonVi" Runat="server" AutoPostBack="true" ontextchanged="CbodonVi_TextChanged" Width="200px" Skin="Vista">
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
                        Caption="THỐNG KÊ TỔNG SỐ VĂN BẢN ĐẾN THEO ĐƠN VỊ" GridLines="Both" 
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
                                     
                            <telerik:GridBoundColumn DataField="so_den" HeaderText="Số đến" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="so_den" UniqueName="so_den">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="so_ky_hieu" HeaderText="Số ký hiệu" HeaderStyle-HorizontalAlign="Center" HeaderButtonType="TextButton"  ItemStyle-HorizontalAlign="Left"   SortExpression="so_ky_hieu" UniqueName="so_ky_hieu">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Trich_yeu" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Trích yếu" SortExpression="Trich_yeu" UniqueName="Trich_yeu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Ngay_Nhan" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Ngày nhận" SortExpression="Ngay_Nhan" UniqueName="Ngay_Nhan" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Ten_So" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Tên Sổ" SortExpression="Ten_So" UniqueName="Ten_So" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="Noi_Gui" HeaderButtonType="TextButton"  ColumnGroupName="Donvi"  ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Nơi gửi" SortExpression="Noi_Gui" UniqueName="Noi_Gui" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PB_NhanVB" HeaderButtonType="TextButton"  ColumnGroupName="Donvi"  ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Phòng ban nhận" SortExpression="PB_NhanVB" UniqueName="PB_NhanVB" HeaderStyle-HorizontalAlign="Center">
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
