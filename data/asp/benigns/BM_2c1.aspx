<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2c1.aspx.vb" Inherits="niengiam.BM2c1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<style type="text/css">
        .style4
        {
            height: 20px;
        }
        div.RadGrid .rgPager .rgAdvPart     
        {     
            display:none;        
        } 
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
<div align="center">
        &nbsp;&nbsp;
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
        Đơn vị :   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200">
                   </telerik:RadComboBox>  
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
        <telerik:RadButton ID="BtXuat_Excel" runat="server" Skin="Office2007"  Width="100px"
            Text="Xuất Excel">
        </telerik:RadButton>
    </div>
    <br />

     <div>
     <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="20" AutoGenerateColumns="False"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevNumericAndAdvanced" Position="TopAndBottom" AlwaysVisible="true" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  DataKeyNames="Id" 
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
                            <telerik:GridColumnGroup HeaderText="Phụ tải trước khi đóng mạch vòng (A)" Name="PhutaiTruocdongMV" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Công tác bảo trì, chuyển nguồn" Name="Baotri" HeaderStyle-HorizontalAlign="Center">
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
                             <telerik:GridBoundColumn DataField="Id" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="Id" UniqueName="Id" Visible="false">
                            </telerik:GridBoundColumn>
                                       
                            <telerik:GridBoundColumn DataField="Tendonvi" HeaderText="Đơn vị" HeaderButtonType="TextButton" 
            SortExpression="Tendonvi" UniqueName="Tendonvi">
            </telerik:GridBoundColumn>

             <telerik:GridCalculatedColumn UniqueName="day1" HeaderText="Tuyến dây số 1" DataType="System.String" HeaderStyle-Width="120px"
                                 DataFields="TEN_TUYENDAY1,TUYENDAY1" Expression='{0} + "<br />"  + {1} '>
<HeaderStyle Width="120px"></HeaderStyle>
                             </telerik:GridCalculatedColumn>
           
           <telerik:GridCalculatedColumn UniqueName="day2" HeaderText="Tuyến dây số 2 (công tác)" DataType="System.String" HeaderStyle-Width="120px"
                                 DataFields="TEN_TUYENDAY2,TUYENDAY2" Expression='{0} + "<br />"  + {1} '>
<HeaderStyle Width="120px"></HeaderStyle>
                             </telerik:GridCalculatedColumn> 

            <telerik:GridBoundColumn DataField="Vitrimachvong" HeaderText="Vị trí đóng kết mạch vòng" HeaderButtonType="TextButton" 
            SortExpression="Vitrimachvong" UniqueName="Vitrimachvong">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DienAp" HeaderText="Điện áp (kV)" HeaderButtonType="TextButton" 
            SortExpression="DienAp" UniqueName="DienAp">
            </telerik:GridBoundColumn>
            
            <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày Công tác"
            SortExpression="NgayThucHien" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn> 

            <telerik:GridBoundColumn DataField="PhuTaituyen1" HeaderText="Phụ tải tuyến dây số 1" HeaderButtonType="TextButton"   ColumnGroupName="PhutaiTruocdongMV"
            SortExpression="PhuTaituyen1" UniqueName="PhuTaituyen1">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PhuTaituyen2" HeaderText="Phụ tải tuyến dây số 2" HeaderButtonType="TextButton"   ColumnGroupName="PhutaiTruocdongMV"
            SortExpression="PhuTaituyen2" UniqueName="PhuTaituyen2">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PhuTaidongmv" HeaderText="Phụ tải sau khi đóng mạch vòng(A)"
            SortExpression="PhuTaidongmv" UniqueName="PhuTaidongmv">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TGBaoTri" HeaderText="Thời gian bảo trì(phút)" HeaderButtonType="TextButton" ColumnGroupName="Baotri"
            SortExpression="TGBaoTri" UniqueName="TGBaoTri">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SoKHMatDien" HeaderText="Số khách hàng" HeaderButtonType="TextButton" ColumnGroupName="Baotri"
            SortExpression="SoKHMatDien" UniqueName="SoKHMatDien">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TongTGMatDien" HeaderText="Tổng thời gian mất điện khách hàng (phút) " HeaderButtonType="TextButton" ColumnGroupName="Baotri"
            SortExpression="TongTGMatDien" UniqueName="TongTGMatDien">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SLKhongPhanPhoi" HeaderText="Sản lượng không phân phối được (kWh)" HeaderButtonType="TextButton" ColumnGroupName="Baotri"
            SortExpression="SLKhongPhanPhoi" UniqueName="SLKhongPhanPhoi">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField=" SAIDI" HeaderText="SAIDI" HeaderButtonType="TextButton" ColumnGroupName="Baotri" DataFormatString ="{0:###,##0.00}" DataType="System.Decimal"
            SortExpression="SAIDI" UniqueName="SAIDI">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField="SAIFI" HeaderText="SAIFI" HeaderButtonType="TextButton" ColumnGroupName="Baotri"  DataFormatString ="{0:###,##0.00}" DataType="System.Decimal"
            SortExpression="SAIFI" UniqueName="SAIFI">
            </telerik:GridBoundColumn> 
             
             <telerik:GridBoundColumn DataField="NoiDungCT" HeaderText="Nội dung công việc" HeaderButtonType="TextButton" ColumnGroupName="Baotri"
            SortExpression="NoiDungCT" UniqueName="NoiDungCT">
            </telerik:GridBoundColumn> 
                                     
                          
                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
    </telerik:RadGrid>

    <telerik:RadGrid ID="GridVanBan2" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                    style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            PageSize="30" Height="450px">
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
            Font-Italic="False"   Caption="BÁO CÁO TỔNG HỢP CÔNG TÁC ĐÓNG KẾT MẠCH VÒNG">
        <CommandItemSettings AddNewRecordText=""   />
        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                Created="True">
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

            <telerik:GridBoundColumn DataField="SAIDI" HeaderText="SAIDI (∑Ti*Ki)/K" DataFormatString ="{0:###,##0.00}" DataType="System.Decimal"
            SortExpression="SAIDI" UniqueName="SAIDI">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="SAIFI" HeaderText="SAIFI (Nj/K)" DataFormatString ="{0:###,##0.00}" DataType="System.Decimal"
            SortExpression="SAIFI" UniqueName="SAIFI">
            </telerik:GridBoundColumn>
            
        </Columns>
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
    </telerik:RadGrid>

    </div>
    <br /> 
    
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="550px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" Title="BÁO CÁO ĐÓNG KẾT MẠCH VÒNG">
	<ContentTemplate>
	 <br />        
        <table align="center">

            <tr>
                <td align="left">Tuyến dây số 1 :</td>
                <td>
                    <telerik:RadComboBox ID="cboTuyenDay1" Runat="server" Width="220" 
                        autopostback="True" ontextchanged="cboTuyenDay1_TextChanged" 
                        Skin="Office2007">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td align="left">
                    Tuyến dây số 2 :</td>
                <td>
                    <telerik:RadComboBox ID="cboTuyenDay2" Runat="server" EnableLoadOnDemand="True" 
                        Skin="Office2007" Width="220">
                    </telerik:RadComboBox>
                </td>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Vị trí đóng kết mạch vòng:</td>
                <td>
                    <telerik:RadTextBox ID="txtdongmachvong" Runat="server" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Điện áp (kV) :</td>
                <td>
                    <telerik:RadComboBox ID="chondienap" Runat="server" Width="220" 
                        Skin="Office2007">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Phụ Tải Tuyến dây số 1:</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtPhuTaituyenday1" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Phụ Tải Tuyến dây số 2 :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtPhuTaituyenday2" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Phụ tải sau khi đóng mạch vòng (A):</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtPhuTaisaudongmachvong" Runat="server" 
                        Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Thời gian bảo trì (phút) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtThoigianbaotri" Runat="server" 
                        AutoPostBack="true" ontextchanged="txtThoigianbaotri_TextChanged" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Số khách hàng mất điện:</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSokhachhangmatdien" Runat="server" 
                        AutoPostBack="true" ontextchanged="txtSokhachhangmatdien_TextChanged" 
                        Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Tổng thời gian mất điện khách hàng (phút) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtThoigianmatdienkhachhang" Runat="server" 
                        Enabled="false" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Sản lượng không phân phối được (kWh) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSanluongkhongphanphoi" Runat="server" 
                        Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    SAIDI :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSAIDI" Runat="server" Enabled="false" 
                        Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    SAIFI :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSAIFI" Runat="server" Enabled="false" 
                        Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày thực hiện :</td>
                <td>
                    <telerik:RadDatePicker ID="dtNgayTH" Runat="server" Skin="Web20">
                        <Calendar ID="Calendar3" Runat="server" Skin="Web20" 
                            UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" 
                            ViewSelectorText="x">
                        </Calendar>
                        <DateInput ID="DateInput3" Runat="server" DateFormat="dd/MM/yyyy" 
                            DisplayDateFormat="dd/MM/yyyy">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Nội dung công tác :</td>
                <td>
                    <telerik:RadTextBox ID="txtNDCongTac" Runat="server" Rows="3" 
                        TextMode="MultiLine" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <telerik:RadButton ID="BOK" runat="server" OnClick="BOK_Click" 
                        Skin="Office2007" Text="Cập Nhập" Width="100px">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" OnClick="BThoat_Click" 
                        Skin="Office2007" Text="Thoát" Width="100px">
                    </telerik:RadButton>
                </td>
            </tr>
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>
        <div align="center">
    
        <asp:Label ID="Label1" runat="server" Text=" Chọn File : " Visible="False" 
                Enabled="False"></asp:Label>
    
        <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" Enabled="False" /> 
            <telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="100px" Visible="False" Enabled="False" >
     </telerik:radbutton>        
     <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="100px" Visible="False" Enabled="False" >
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
