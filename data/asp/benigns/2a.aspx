<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="2a.aspx.vb" Inherits="niengiam.BM_2a" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Vista" 
                    style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            Height="120px">
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
            Font-Italic="False" DataKeyNames="idCatDien">
        <CommandItemSettings AddNewRecordText=""   />
        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
        </ExpandCollapseColumn>
        <Columns>
            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                Text="Cập nhật" UniqueName="GridButtonColumn1" ImageUrl="Images\Edit.gif"  HeaderStyle-Width="100px">
            </telerik:GridButtonColumn>
            <telerik:GridBoundColumn DataField="idCatDien" HeaderText="ID" HeaderButtonType="TextButton"
            SortExpression="idCatDien" UniqueName="idCatDien" Visible="false">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NoiDungCatDien" HeaderText="Nội dung/ khối lượng cắt điện"
            SortExpression="NoiDungCatDien" UniqueName="NoiDungCatDien">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="KhoiLuongThucHien" HeaderText="Khối lượng thực hiện"
            SortExpression="KhoiLuongThucHien" UniqueName="KhoiLuongThucHien">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="KhoiLuongConLai" HeaderText="Khối lượng chưa hoàn tất"
            SortExpression="KhoiLuongConLai" UniqueName="KhoiLuongConLai">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NguyenNhan" HeaderText="Nguyên nhân"
            SortExpression="NguyenNhan" UniqueName="NguyenNhan">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn UniqueName="KHMatDienQua5Gio" HeaderText="KH mất điện quá 5 giờ/ lần/ 3 tháng" 
                DataField="KHMatDienQua5Gio" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ToiThieu3Thang" HeaderText="Tối thiểu 3 tháng" 
                DataField="ToiThieu3Thang" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ToiDa3LanNam" HeaderText="Tối đa 3 lần/ năm" 
                DataField="ToiDa3LanNam" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ToiThieu6Thang" HeaderText="Tối thiểu 6 tháng" 
                DataField="ToiThieu6Thang" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ToiDa2LanNamMBT" HeaderText="Tối đa 2 lần/ năm/MBT" 
                DataField="ToiDa2LanNamMBT" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            <telerik:GridCheckBoxColumn UniqueName="ToiDa1LanNamTramGIS" HeaderText="Tối đa 1 lần/năm với trạm GIS" 
                DataField="ToiDa1LanNamTramGIS" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            <telerik:GridBoundColumn DataField="GhiChu" HeaderText="Ghi chú"
            SortExpression="GhiChu" UniqueName="GhiChu">
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
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="450px"
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
                    <telerik:RadNumericTextBox ID="txtKLThucHienNew" runat="server" Width="220" NumberFormat-DecimalDigits="2">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Khối lượng Còn lại:</td>
                <td>
                    <telerik:RadNumericTextBox ID="txtKLConLaiNew" runat="server" Width="220" NumberFormat-DecimalDigits="2">
                    </telerik:RadNumericTextBox>
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
                <td>Ghi chú:</td>
                <td><telerik:RadTextBox ID="txtGhiChuNew" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
                </telerik:RadTextBox></td>
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
