<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2d1.aspx.vb" Inherits="niengiam.BM2d1" %>

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
                       Skin="Web20" 
                       Width="200">
                   </telerik:RadComboBox>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Web20" Text="Tìm kiếm" 
         Width="150px">
     </telerik:RadButton>
        <telerik:RadButton ID="Btn_XuatExcel" runat="server" Skin="Web20" 
            Text="Xuất excel">
        </telerik:RadButton>
    </div>
    <br />
    
    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            PageSize="20"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2"></Scrolling>
                    </ClientSettings>
                  <HeaderStyle Width="150px"></HeaderStyle>
                  
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id"
                        Caption="TỔNG HỢP TÌNH HÌNH TRANG BỊ THIẾT BỊ CHỈ BÁO SỰ CỐ LƯỚI TRUNG THẾ">
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

        <Columns>
              <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" 
                 Text="Cập nhật" UniqueName="GridButtonColumn1"   ImageUrl="../images/Edit.gif">                
            </telerik:GridButtonColumn>

             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" 
                 Text="X" UniqueName="BtXoa"  ConfirmText="Bạn có muốn xóa dữ liệu không?">              
            <HeaderStyle Width="50px"></HeaderStyle>
            </telerik:GridButtonColumn>

            <telerik:GridBoundColumn DataField="Id" HeaderText="ID" HeaderButtonType="TextButton"
            SortExpression="Id" UniqueName="Id" Visible="false">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TenTuyenDay" HeaderText="Tên tuyến dây"
            SortExpression="TenTuyenDay" UniqueName="TenTuyenDay">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="KehoachLNmoi" HeaderText=" Kế hoạch trang bị mới Lưới nổi (bộ)"
            SortExpression="KehoachLNmoi" UniqueName="KehoachLNmoi">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="KehoachLNgmoi" HeaderText="Kế hoạch trang bị mới Lưới ngầm (bộ)"
            SortExpression="KehoachLNgmoi" UniqueName="KehoachLNgmoi">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TongKehoachmoi" HeaderText="Tổng Kế hoạch trang bị mới"
            SortExpression="TongKehoachmoi" UniqueName="TongKehoachmoi">
            </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LapdatLnThang" HeaderText="Lắp đặt trong tháng Lưới nổi (bộ)"
            SortExpression="LapdatLnThang" UniqueName="LapdatLnThang">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="LapdatLngThang" HeaderText="Lắp đặt trong tháng Lưới ngầm (bộ)"
            SortExpression="LapdatLngThang" UniqueName="LapdatLngThang">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TongLapdatThang" HeaderText="Tổng Lắp đặt trong tháng	"
            SortExpression="TongLapdatThang" UniqueName="TongLapdatThang">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="SoLuoinoiLK" HeaderText="Số lượng (bộ) Lưới nổi Đã lắp đặt trên lưới (Lũy kế)"
            SortExpression="SoLuoinoiLK" UniqueName="SoLuoinoiLK">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoinoiLKBT" HeaderText="Tình trạng Lưới nổi	lũy kế vận hành Bình thường (bộ)"
            SortExpression="LuoinoiLKBT" UniqueName="LuoinoiLKBT">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoinoiLKHH" HeaderText="Tình trạng Lưới nổi	lũy kế vận hành Hư hỏng (bộ)"
            SortExpression="LuoinoiLKHH" UniqueName="LuoinoiLKHH">
            </telerik:GridBoundColumn>
                   
            <telerik:GridBoundColumn DataField="SoLuoingamLK" HeaderText="Số lượng (bộ) Lưới ngầm Đã lắp đặt trên lưới (Lũy kế)"
            SortExpression="SoLuoingamLK" UniqueName="SoLuoingamLK">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoingamLKBT" HeaderText="Tình trạng Lưới ngầm lũy kế vận hành Bình thường (bộ)"
            SortExpression="LuoingamLKBT" UniqueName="LuoingamLKBT">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoingamLKHH" HeaderText="Tình trạng Lưới ngầm lũy kế vận hành Hư hỏng (bộ)"
            SortExpression="LuoingamLKHH" UniqueName="LuoingamLKHH">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="TongLuoiLDLK" HeaderText="Số lượng (bộ) Đã lắp đặt trên lưới (Lũy kế)"
            SortExpression="TongLuoiLDLK" UniqueName="TongLuoiLDLK">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TongLuoiLDLKBT" HeaderText="Đã lắp đặt trên lưới (Lũy kế) Bình thường (bộ)"
            SortExpression="TongLuoiLDLKBT" UniqueName="TongLuoiLDLKBT">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TongLuoiLDLKHH" HeaderText="Đã lắp đặt trên lưới (Lũy kế) Hư hỏng (bộ)"
            SortExpression="TongLuoiLDLKHH" UniqueName="TongLuoiLDLKHH">
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
                <td>Kế hoạch trang bị mới Lưới nổi (bộ) :</td>
                <td>
                    <telerik:RadTextBox ID="txtSoluoinoimoi" Runat="server" Width="220">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Kế hoạch trang bị mới Lưới ngầm (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSoluoingammoi" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Tổng Kế hoạch trang bị mới :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTongsoluoimoi" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>              
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Lắp đặt trong tháng Lưới nổi (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtLuoinoithang" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Lắp đặt trong tháng Lưới ngầm (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtLuoingamthang" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr> 
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Tổng Lắp đặt trong tháng :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTongsoluoithang" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Số lượng (bộ) Lưới nổi Đã lắp đặt trên lưới (Lũy kế) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSoluoinoiluyke" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Tình trạng Lưới nổi	lũy kế vận hành Bình thường (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTinhtrangluoinoiluykebt" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Tình trạng Lưới nổi	lũy kế vận hành hư hỏng (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTinhtrangluoinoiluykehh" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Số lượng (bộ) Lưới ngầm Đã lắp đặt trên lưới (Lũy kế) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtSoluoingamluyke" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Tình trạng Lưới ngầm lũy kế vận hành Bình thường (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTinhtrangluoingamluykebt" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Tình trạng Lưới ngầm lũy kế vận hành hư hỏng (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTinhtrangluoingamluykehh" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
             <tr>
                <td>Số lượng (bộ) Đã lắp đặt trên lưới (Lũy kế) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTongluoiluyke" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>

               <tr>
                <td>Đã lắp đặt trên lưới (Lũy kế) Bình thường (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTongluoiluykebt" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
               <tr>
                <td>Đã lắp đặt trên lưới (Lũy kế) hư hỏng (bộ) :</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtTongluoiluykehh" Runat="server" Width="220" Enabled="false">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Ngày thực hiện :</td>
                <td>
                    <telerik:raddatepicker ID="dtNgayTH" Runat="server" 
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
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="150px" 
                       style="height: 26px" Skin="Office2007" OnClick="BOK_Click">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="150px" 
                       style="height: 26px" Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
