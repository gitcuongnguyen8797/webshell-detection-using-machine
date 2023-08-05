<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2a.aspx.vb" Inherits="niengiam._2a" %>

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
         Skin="Web20" Culture="vi-VN" FocusedDate="2014-01-01">
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
        Đơn vị :   
        <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200">
                   </telerik:RadComboBox>  
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
 <telerik:RadButton ID="BtXuat_Excel" runat="server" Skin="Office2007"   Width="100px"
            Text="Xuất excel">
        </telerik:RadButton>
    </div>
    <br />
          
    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="15" AutoGenerateColumns="False"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  DataKeyNames="idCatDien" 
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC TỔ CHỨC LẬP KẾ HOẠCH CẮT ĐIỆN CÔNG TÁC TRÊN LƯỚI ĐIỆN">
                        <CommandItemSettings AddNewRecordText="Thêm mới" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
                        <EditFormSettings  EditFormType="Template">
                            <EditColumn UniqueName="EditCommandColumn1" >
                            </EditColumn>
                        </EditFormSettings>
                        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>

                        <HeaderStyle Font-Bold="False" Font-Italic="False" />
                        <FooterStyle Font-Bold="True" Font-Italic="True" />

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Đánh giá khối lựơng thực hịên" Name="DanhgiaThuchien" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Đánh giá so với tiêu chí năm 2014" Name="DanhgiaTieuchi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Cập nhật hồ sơ sau bảo trì" Name="CapNhat" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                        </ColumnGroups>

                        <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>
                                    
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                             <telerik:GridBoundColumn DataField="idCatDien" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="idCatDien" UniqueName="idCatDien" Visible="false">
                            </telerik:GridBoundColumn>
                                                                  
                            <telerik:GridBoundColumn DataField="NoiDungCatDien" HeaderButtonType="TextButton" 
                                HeaderText="Nội dung/ khối lượng cắt điện" SortExpression="NoiDungCatDien" UniqueName="NoiDungCatDien">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày Thực Hiện" HeaderButtonType="TextButton" 
                            SortExpression="NgayThucHien" UniqueName="NgayThucHien">
                            </telerik:GridBoundColumn>
                                                       
                            <telerik:GridBoundColumn DataField="KhoiLuongThucHien" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaThuchien" HeaderText="Khối lượng thực hiện"
                             SortExpression="KhoiLuongThucHien" UniqueName="KhoiLuongThucHien">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="KhoiLuongConLai" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaThuchien"  HeaderText="Khối lượng chưa hoàn tất"
                            SortExpression="KhoiLuongConLai" UniqueName="KhoiLuongConLai">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="NguyenNhan" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaThuchien" HeaderText="Nguyên nhân"
                            SortExpression="NguyenNhan" UniqueName="NguyenNhan">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TiLeHoanTat" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaThuchien" HeaderText="Tỉ lệ hoàn tất trong đợt cắt điện"
                            SortExpression="TiLeHoanTat" UniqueName="TiLeHoanTat">
                            </telerik:GridBoundColumn>
                                
                            <telerik:GridCheckBoxColumn UniqueName="KHMatDienQua5Gio" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaTieuchi" HeaderText="KH mất điện quá 5 giờ/ lần/ 3 tháng" 
                            DataField="KHMatDienQua5Gio" AllowSorting="false">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridCheckBoxColumn UniqueName="ToiThieu3Thang" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaTieuchi" HeaderText="Tối thiểu 3 tháng" 
                            DataField="ToiThieu3Thang" AllowSorting="false">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridCheckBoxColumn UniqueName="ToiDa3LanNam" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaTieuchi" HeaderText="Tối đa 3 lần/ năm" 
                            DataField="ToiDa3LanNam" AllowSorting="false">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridCheckBoxColumn UniqueName="ToiThieu6Thang" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaTieuchi" HeaderText="Tối thiểu 6 tháng" 
                            DataField="ToiThieu6Thang" AllowSorting="false">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridCheckBoxColumn UniqueName="ToiDa2LanNamMBT" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaTieuchi" HeaderText="Tối đa 2 lần/ năm/MBT" 
                            DataField="ToiDa2LanNamMBT" AllowSorting="false">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridCheckBoxColumn UniqueName="ToiDa1LanNamTramGIS" HeaderButtonType="TextButton"   ColumnGroupName="DanhgiaTieuchi" HeaderText="Tối đa 1 lần/năm với trạm GIS" 
                            DataField="ToiDa1LanNamTramGIS" AllowSorting="false">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridBoundColumn DataField="GhiChu" HeaderText="Ghi Chú" HeaderButtonType="TextButton" 
                            SortExpression="GhiChu" UniqueName="GhiChu">
                            </telerik:GridBoundColumn>
                     </Columns>
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
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="550px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" Title="Cập nhật Kế hoạch cắt điện">
	<ContentTemplate>
	 <br />        
        <table align="center">
            <tr>
                <td align="left"">Nội dung cắt điện :</td>
                <td><telerik:RadTextBox ID="txtNoiDungCDNew" Runat="server" Width="220">
                    </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Khối lượng thực hiện:</td>
                <td>
                    <telerik:RadTextBox  ID="txtKLThucHienNew" runat="server" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Khối lượng Còn lại:</td>
                <td>
                    <telerik:RadTextBox ID="txtKLConLaiNew" runat="server" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Nguyên nhân :</td>
                <td>
                    <telerik:RadTextBox ID="txtNguyenNhanNew" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
                    </telerik:RadTextBox>
                </td>
            </tr>              
            <tr>
                <td></td>
            </tr>

              <tr>
                <td>Tỉ lệ hoàn tất trong đợt cắt điện (0->100) :</td>
                <td>

                <telerik:RadNumericTextBox ID="txtTiLeHoanTatNew" Runat="server" Width="220"   MinValue="0" MaxValue
                ="100" m="Please enter a valid between 0 and 100">

                    </telerik:RadNumericTextBox>                                   
                   </td>
            </tr>              
            <tr>
                <td></td>
            </tr>

            <tr>
                <td>Khách hàng mất điện quá 5 giờ/ lần/ 3 tháng</td>
                <td>
                    <asp:CheckBox ID="chkKHMatDienQua5Gio" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Tối thiểu 3 tháng</td>
                <td>
                    <asp:CheckBox ID="chkToiThieu3Thang" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Tối đa 3 lần/ năm</td>
                <td>
                    <asp:CheckBox ID="chkToiDa3LanNam" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Tối thiểu 6 tháng</td>
                <td>
                    <asp:CheckBox ID="chkToiThieu6Thang" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Tối đa 2 lần/ năm/MBT</td>
                <td>
                    <asp:CheckBox ID="chkToiDa2LanNamMBT" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Tối đa 1 lần/năm với trạm GIS</td>
                <td>
                    <asp:CheckBox ID="chkToiDa1LanNamTramGIS" runat="server" />
                </td>
            </tr>

             <tr>

                <td>Ngày thực hiện :</td>
                <td>
                    <telerik:raddatepicker ID="dtNgayTH" Runat="server" Width="220" 
         Skin="Web20">
                       <Calendar ID="Calendar3" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            
            <tr>
                <td>Ghi chú:</td>
                <td><telerik:RadTextBox ID="txtGhiChuNew" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
                </telerik:RadTextBox></td>
           </tr>
           <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
           <tr>
            <td align="right">
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="100px" 
                      Skin="Office2007" OnClick="BOK_Click">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="100px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>
    <div align="center">
    Chọn File : 
    
        <asp:FileUpload ID="FileUpload1" runat="server" /> <telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="100px" >
     </telerik:radbutton>        
     <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="100px" >
     </telerik:radbutton>
     <br />
     <br />
     <telerik:radgrid ID="GridFile" runat="server" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" 
        PageSize="15"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC TỔ CHỨC LẬP KẾ HOẠCH CẮT ĐIỆN CÔNG TÁC TRÊN LƯỚI ĐIỆN">
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
                        <EditFormSettings  EditFormType="Template">
                            <EditColumn UniqueName="EditCommandColumn1" >
                            </EditColumn>
                        </EditFormSettings>
                        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>

                        <HeaderStyle Font-Bold="False" Font-Italic="False" />
                        <FooterStyle Font-Bold="True" Font-Italic="True" />

               
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>
     
    </div>
    
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
