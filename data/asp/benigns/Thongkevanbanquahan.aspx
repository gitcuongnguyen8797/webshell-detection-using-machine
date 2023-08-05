<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkevanbanquahan.aspx.vb" Inherits="VANPHONG.WebForm6" %>
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
    Từ ngày: <telerik:RadDatePicker ID="DateTuNgay" Runat="server" Culture="vi-VN" 
            Skin="Office2007">
    <Calendar ID="Calendar1"  UseColumnHeadersAsSelectors="False" Runat="server" 
                       UseRowHeadersAsSelectors="False" ViewSelectorText="x" Skin="Web20">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
    </telerik:RadDatePicker>
      Đến ngày : <telerik:RadDatePicker ID="DateDenNgay" Runat="server" Culture="vi-VN" 
            Skin="Office2007">
      <Calendar ID="Calendar4"  UseColumnHeadersAsSelectors="False" Runat="server" 
                       UseRowHeadersAsSelectors="False" ViewSelectorText="x" Skin="Web20">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
      </telerik:RadDatePicker>
       <asp:Label ID="Label4" runat="server" Text="Xem chức năng:" 
              Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
             <asp:RadioButton id="Chualam" GroupName="Chuathuchien" 
             Text=""  runat="server"/> 
    <asp:Label ID="Label1" runat="server" Text="Chưa giải quyết" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
           <asp:RadioButton id="Lamsauthoigian" GroupName="Chuathuchien" 
             Text=""  runat="server"/>
          <asp:Label ID="Label2" runat="server" Text="Giải quyết sau thời hạn" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
         
        <telerik:RadComboBox ID="CbodonVi" Runat="server" Skin="Vista" autopostback="True" ontextchanged="CbodonVi_TextChanged">
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
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" Position="TopAndBottom" AlwaysVisible="true"/>
                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" 
                        ReorderColumnsOnClient="True">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   
                        Caption="THỐNG KÊ SỐ VĂN BẢN QUÁ HẠN" GridLines="Both" 
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
                                     
                            <telerik:GridBoundColumn DataField="ten_tcap" HeaderText="Tên đăng nhập" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ten_tcap" UniqueName="ten_tcap">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ten_dd" HeaderText="Tên người dùng" HeaderStyle-HorizontalAlign="Center" HeaderButtonType="TextButton"  ItemStyle-HorizontalAlign="Center"   SortExpression="ten_dd" UniqueName="ten_dd">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="tongsd" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Center" 
                                HeaderText="Số văn bản quá hạn" SortExpression="tongsd" UniqueName="tongsd" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="ten_phong" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Center" 
                                HeaderText="Phòng ban" SortExpression="ten_phong" UniqueName="ten_phong" HeaderStyle-HorizontalAlign="Center">
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
