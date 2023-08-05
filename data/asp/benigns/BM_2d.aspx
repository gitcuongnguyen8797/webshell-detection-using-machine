<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2d.aspx.vb" Inherits="niengiam.BM2d" %>

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
         Ngày: <telerik:raddatepicker ID="CboLuachonthang" Runat="server" 
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
     <telerik:RadButton ID="BTimKiem" runat="server"  Text="Tìm kiếm"  Skin="Office2007" Width="100px">
     </telerik:RadButton>
        <telerik:RadButton ID="Btn_XuatExcel" runat="server"  Skin="Office2007" Width="100px" 
            Text="Xuất excel">
        </telerik:RadButton>
    </div>
    <br />
      <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                    style="margin-top: 0px" CellSpacing="0" AllowPaging="True">
        <FooterStyle Font-Bold="False" Font-Italic="False" />
        <HeaderStyle Font-Bold="True" Font-Italic="False" />
        <CommandItemStyle Font-Bold="False" Font-Italic="False" />
        <ItemStyle Font-Bold="False" Font-Italic="False" />
        <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
        <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2"></Scrolling>
            </ClientSettings>
            <HeaderStyle Width="120px"></HeaderStyle>              
        <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
        <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id"
                        Caption="THỐNG KÊ DANH SÁCH CHỈ BÁO SỰ CỐ">
        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
        </ExpandCollapseColumn>

        <Columns>
            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" 
                 Text="Cập nhật" UniqueName="Edit1"   ImageUrl="/images/Edit.gif">                
            </telerik:GridButtonColumn>

             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" 
                 Text="X" UniqueName="Delete"  ConfirmText="Bạn muốn xóa dữ liệu không?">                
            <HeaderStyle Width="50px"></HeaderStyle>
            </telerik:GridButtonColumn>

                        <telerik:GridBoundColumn DataField="Id" HeaderText="ID" HeaderButtonType="TextButton"
            SortExpression="Id" UniqueName="Id" Visible="false">
            </telerik:GridBoundColumn>

          
             <telerik:GridCalculatedColumn UniqueName="DayTrungThe" HeaderText="Tuyến trung thế" DataType="System.String" HeaderStyle-Width="120px"
                                 DataFields="TEN_TUYENDAY,TuyenDay" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>

            <telerik:GridBoundColumn DataField="Vitrilapdat" HeaderText="Vị trí lắp đặt" HeaderStyle-HorizontalAlign="Center"
            SortExpression="Vitrilapdat" UniqueName="Vitrilapdat">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Tenluoi" HeaderText="Loại" HeaderStyle-Width="80px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
            SortExpression="Tenluoi" UniqueName="Tenluoi">
            </telerik:GridBoundColumn>

           <telerik:GridBoundColumn DataField="Hieu" HeaderText="Hiệu" HeaderStyle-HorizontalAlign="Center"
            SortExpression="Hieu" UniqueName="Hieu">
            </telerik:GridBoundColumn>     
            
            <telerik:GridBoundColumn DataField="Mota" HeaderText="Tình trạng" HeaderStyle-Width="60px"   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
            SortExpression="Mota" UniqueName="Mota">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Dienap" HeaderText="Điện áp vận hành (kV)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
            SortExpression="Dienap" UniqueName="Dienap">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Tenhoatdong" HeaderText="Chế độ hoạt động" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
            SortExpression="Tenhoatdong" UniqueName="Tenhoatdong">
            </telerik:GridBoundColumn>

           <telerik:GridBoundColumn DataField="Dongsuco" HeaderText="Dòng phát hiện sự cố (A)" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px"
            SortExpression="Dongsuco" UniqueName="Dongsuco">
            </telerik:GridBoundColumn>     
            
               <telerik:GridBoundColumn DataField="Dongcaidat" HeaderText="Dòng cài đặt tác động (A)" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px"
            SortExpression="Dongcaidat" UniqueName="Dongcaidat">
            </telerik:GridBoundColumn>     
            
            <telerik:GridBoundColumn DataField="Thoigiantacdong" HeaderText="Thời gian tác động (ms)" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px"
            SortExpression="Thoigiantacdong" UniqueName="Thoigiantacdong">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Thoigiancaidat" HeaderText="Thời gian cài đặt tác động (ms)" HeaderStyle-HorizontalAlign="Center"
            SortExpression="Thoigiancaidat" UniqueName="Thoigiancaidat">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Namsanxuat" HeaderText="Năm Sản Xuất" HeaderStyle-Width="60px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
            SortExpression="Namsanxuat" UniqueName="Namsanxuat">
            </telerik:GridBoundColumn>

           <telerik:GridBoundColumn DataField="Namvanhanh" HeaderText="Năm Vận Hành" HeaderStyle-Width="80px"  HeaderStyle-HorizontalAlign="Center"
            SortExpression="Namvanhanh" UniqueName="Namvanhanh">
            </telerik:GridBoundColumn>     

              <telerik:GridBoundColumn DataField="Nuocsanxuat" HeaderText="Nước Sản Xuất" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px"
            SortExpression="Nuocsanxuat" UniqueName="Nuocsanxuat">
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


      <telerik:radgrid ID="GridVanBan2" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="22" AutoGenerateColumns="False"  Height="654px">
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
                        Font-Italic="False"   Caption="TỔNG HỢP TÌNH HÌNH VÀ NHU CẦU TRANG BỊ THIẾT BỊ CHỈ BÁO SỰ CỐ LƯỚI TRUNG THẾ">
                        <CommandItemSettings AddNewRecordText="" 
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
                            <telerik:GridColumnGroup HeaderText="Kế hoạch trang bị mới" Name="Kehoachmoi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Lắp đặt trong tháng" Name="Lapdatthang" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Đã lắp đặt trên lưới (Lũy kế)" Name="Lapdatluyke" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="Lưới nổi" Name="Luoinoi" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Lapdatluyke">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Lưới ngầm" Name="Luoingam" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Lapdatluyke">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Tổng" Name="Tong" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Lapdatluyke">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Tình trạng vận hành"	 Name="Vanhanhluoinoi" ParentGroupName="Luoinoi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</telerik:GridColumnGroup>
  <telerik:GridColumnGroup HeaderText="Tình trạng vận hành"	 Name="Vanhanhluoingam" ParentGroupName="Luoingam" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</telerik:GridColumnGroup>

  <telerik:GridColumnGroup HeaderText="Tình trạng vận hành"	 Name="Tongvanhanh" ParentGroupName="Tong" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</telerik:GridColumnGroup>

                        </ColumnGroups>

                        <Columns>
                                                 
                            <telerik:GridBoundColumn DataField="tendonvi" HeaderText="Công ty Điện lực" HeaderButtonType="TextButton"
                            SortExpression="tendonvi" UniqueName="tendonvi">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Soluoinoi" HeaderText="Lưới nổi (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Kehoachmoi" 
                            SortExpression="Soluoinoi" UniqueName="Soluoinoi">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Soluoingam" HeaderText="Lưới ngầm (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Kehoachmoi" 
                            SortExpression="Soluoingam" UniqueName="Soluoingam">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TongSoluoi" HeaderText="Tổng"  HeaderButtonType="TextButton"   ColumnGroupName="Kehoachmoi" 
                            SortExpression="TongSoluoi" UniqueName="TongSoluoi">
                            </telerik:GridBoundColumn>
           
                            <telerik:GridBoundColumn DataField="LuoinoiThang" HeaderText="Lưới nổi (bộ)"  HeaderButtonType="TextButton"   ColumnGroupName="Lapdatthang"
                            SortExpression="LuoinoiThang" UniqueName="LuoinoiThang">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LuoingamThang" HeaderText="Lưới ngầm (bộ)"  HeaderButtonType="TextButton"   ColumnGroupName="Lapdatthang"
                            SortExpression="LuoingamThang" UniqueName="LuoingamThang">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TongLuoiThang" HeaderText="Tổng"  HeaderButtonType="TextButton"   ColumnGroupName="Lapdatthang"
                            SortExpression="TongLuoiThang" UniqueName="TongLuoiThang">
                            </telerik:GridBoundColumn>


                             <telerik:GridBoundColumn DataField="LuoinoiLuyKe" HeaderText="Số lượng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Luoinoi"
            SortExpression="LuoinoiLuyKe" UniqueName="LuoinoiLuyKe">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoinoiTot" HeaderText="Bình thường (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoinoi"
            SortExpression="LuoinoiTot" UniqueName="LuoinoiTot">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Luoinoihuhong" HeaderText="Hư hỏng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoinoi"
            SortExpression="Luoinoihuhong" UniqueName="Luoinoihuhong">
            </telerik:GridBoundColumn>
                   
            <telerik:GridBoundColumn DataField="LuoingamLuyKe" HeaderText="Số lượng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Luoingam"
            SortExpression="LuoingamLuyKe" UniqueName="LuoingamLuyKe">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoingamTot" HeaderText="Bình thường (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoingam"
            SortExpression="LuoingamTot" UniqueName="LuoingamTot">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Luoingamhuhong" HeaderText="Hư hỏng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoingam"
            SortExpression="Luoingamhuhong" UniqueName="Luoingamhuhong">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Soluonglapdat" HeaderText="Số lượng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Tong"
            SortExpression="Soluonglapdat" UniqueName="Soluonglapdat">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluongbinhthuong" HeaderText="Bình thường (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Tongvanhanh"
            SortExpression="Soluongbinhthuong" UniqueName="Soluongbinhthuong">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluonghuhong" HeaderText="Hư hỏng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Tongvanhanh"
            SortExpression="Soluonghuhong" UniqueName="Soluonghuhong">
            </telerik:GridBoundColumn> 
           
                                     
                          
                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>
            
    <br /> 
    <div style="text-align:right;">
    </div>
    <br />    
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="550px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" Title="Tình hình trang thiết bị sự cố trung thế">
	<ContentTemplate>
	 <br />        
        <table align="center">
            <tr>
                <td align="left"">Tên tuyến dây :</td>
                <td>
                    <telerik:RadComboBox ID="cboTuyenDay" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Vị trí lắp đặt :</td>
                <td>
                    <telerik:RadTextBox ID="txtVitrilapdat" Runat="server" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Loại :</td>
                <td>
                    <telerik:RadComboBox ID="cboLoailuoi" Runat="server" Width="220px">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="Lưới nổi" Value="Lưới nổi" />
                            <telerik:RadComboBoxItem runat="server" Text="Lưới ngầm" Value="Lưới ngầm" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Hiệu :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtHieu" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>              
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Tình trạng :</td>
                <td>
                   <telerik:RadComboBox ID="cboTinhtrang" Runat="server" Width="220px">
                       <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Tốt" Value="Tốt" />
                           <telerik:RadComboBoxItem runat="server" Text="Hư hỏng" Value="Hư hỏng" />
                       </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Điện áp vận hành (kV) :</td>
                <td>
                    <telerik:RadComboBox ID="cboDienap" Runat="server" Width="220px">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="15" Value="15" />
                            <telerik:RadComboBoxItem runat="server" Text="22" Value="22" />
                        </Items>
                    </telerik:RadComboBox>
                </td>
            </tr> 
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Chế độ hoạt động :</td>
                <td>
                   <telerik:RadComboBox ID="cboChedohoatdong" Runat="server" Width="220px">
                       <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Tự động" Value="Tự động" />
                           <telerik:RadComboBoxItem runat="server" Text="Cài đặt" Value="Cài đặt" />
                       </Items>
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Dòng phát hiện sự cố (A) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtdongsuco" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Dòng cài đặt tác động (A) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtdongcaidat" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Thời gian tác động (ms) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtThoigiantacdong" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Thời gian cài đặt tác động (ms) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtThoigiancaidat" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
                 
            <tr>
                <td>Năm Sản Xuất :</td>
                <td>
                    <telerik:raddatepicker ID="Namsanxuat" Runat="server" 
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
                <td>Năm Vận Hành :</td>
                <td>
                    <telerik:raddatepicker ID="Namvanhanh" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                </td>
            </tr>

              <tr>
                <td></td>
            </tr>
            <tr>
                <td>Nước Sản Xuất:</td>
                <td><telerik:RadTextBox ID="txtNuocsanxuat" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
                </telerik:RadTextBox></td>
           </tr>
           <tr>
                <td></td>
            </tr
            <tr>
            </tr>
            <td>
            </td>
            <tr>
                <td>Ghi chú:</td>
                <td><telerik:RadTextBox ID="txtGhiChu" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
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
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"   Width="100px" 
                       Skin="Office2007" OnClick="BOK_Click">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"   Width="100px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>
    <br />
    <div align="center">
       
        <asp:Label ID="Label1" runat="server" Text=" Chọn File : "></asp:Label>
       
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
                        Font-Italic="False"   Caption="THỐNG KÊ DANH SÁCH CHỈ BÁO SỰ CỐ">
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
