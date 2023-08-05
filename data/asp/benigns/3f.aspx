<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="3f.aspx.vb" Inherits="niengiam.WebForm13" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div align="center">
  <br />
    Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                 
                Đơn vị :   
           <telerik:radcombobox ID="CbodonVi" Runat="server" 
                       Skin="Hay" 
                       Width="200">
                   </telerik:radcombobox>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <telerik:radbutton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:radbutton>
      <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px">
     </telerik:RadButton>
    
     </div> 
     <br />
      <telerik:radgrid ID="GridVanBan" runat="server" AllowSorting="True" 
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
                    <MasterTableView AllowMultiColumnSorting="True"  DataKeyNames="ID" 
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="CHI TIẾT TÌNH HÌNH THEO DÕI BẢO TRÌ TRẠM KHÁCH HÀNG">
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="True" 
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
                            <telerik:GridColumnGroup HeaderText="Đã bảo trì" Name="DaBaoTri" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Khối lượng thực hiện theo thời gian" Name="KhoiLuongTH" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Khối lượng thực hiện lũy kế" Name="KhoiLuongLK" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                        </ColumnGroups>



                        <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>
                          <%--  <telerik:GridCheckBoxColumn UniqueName="ToiDa1LanNamTramGIS" HeaderText="Tối đa 1 lần/năm với trạm GIS" 
                DataField="ToiDa1LanNamTramGIS" AllowSorting="false">
            </telerik:GridCheckBoxColumn>--%>
            
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>

                            <telerik:GridBoundColumn DataField="ID" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="ID" UniqueName="ID" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="trampp" HeaderButtonType="TextButton" 
                                HeaderText="Trạm phân phối" SortExpression="trampp" UniqueName="trampp" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="danhsotram" HeaderButtonType="TextButton" 
                                HeaderText="Danh số trạm" SortExpression="danhsotram" UniqueName="danhsotram" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="congsuat" HeaderButtonType="TextButton" 
                                HeaderText="Công suất" SortExpression="congsuat" UniqueName="congsuat" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="tuyenday" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến dây" SortExpression="tuyenday" UniqueName="tuyenday" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="diachitram" HeaderButtonType="TextButton" 
                                HeaderText="Địa chỉ trạm" SortExpression="diachitram" UniqueName="diachitram" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ngaykt" HeaderButtonType="TextButton" 
                                HeaderText="Ngày kiểm tra" SortExpression="ngaykt" UniqueName="ngaykt" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="noidung" HeaderButtonType="TextButton" 
                                HeaderText="Nội dung" SortExpression="noidung" UniqueName="noidung" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridCheckBoxColumn DataField="chuabaotri" HeaderButtonType="TextButton" 
                                HeaderText="Chưa bảo trì" SortExpression="chuabaotri" UniqueName="chuabaotri" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridBoundColumn DataField="sohopdong" HeaderButtonType="TextButton"  ColumnGroupName="DaBaoTri"
                                HeaderText="Số hợp đồng/Văn bản" SortExpression="sohopdong" UniqueName="sohopdong" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridBoundColumn DataField="ngaybaotri" HeaderButtonType="TextButton"  ColumnGroupName="DaBaoTri"
                                HeaderText="Ngày" SortExpression="ngaybaotri" UniqueName="ngaybaotri" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TENDONVI" HeaderButtonType="TextButton" 
                                HeaderText="Công ty Điện lực" SortExpression="TENDONVI" UniqueName="TENDONVI" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TONGSOTRAMPP" HeaderButtonType="TextButton" 
                                HeaderText="Tổng số trạm khách hàng" SortExpression="TONGSOTRAMPP" UniqueName="TONGSOTRAMPP" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TONGTRAMKIEMTRA" HeaderButtonType="TextButton" ColumnGroupName="KhoiLuongTH"
                                HeaderText="Trạm đã kiểm tra" SortExpression="TONGTRAMKIEMTRA" UniqueName="TONGTRAMKIEMTRA" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="TONGTRAMCHUABAOTRI" HeaderButtonType="TextButton" ColumnGroupName="KhoiLuongTH"
                                HeaderText="Trạm có tồn tại chưa xử lý" SortExpression="TONGTRAMCHUABAOTRI" UniqueName="TONGTRAMCHUABAOTRI" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TONGTRAMDABAOTRI" HeaderButtonType="TextButton" ColumnGroupName="KhoiLuongTH"
                                HeaderText="Trạm đã bảo trì/xử lý tồn tại" SortExpression="TONGTRAMDABAOTRI" UniqueName="TONGTRAMDABAOTRI" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TONGTRAMKIEMTRALUYKE" HeaderButtonType="TextButton" ColumnGroupName="KhoiLuongLK"
                                HeaderText="Trạm đã kiểm tra" SortExpression="TONGTRAMKIEMTRALUYKE" UniqueName="TONGTRAMKIEMTRALUYKE" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TONGTRAMCHUABAOTRILUYKE" HeaderButtonType="TextButton" ColumnGroupName="KhoiLuongLK"
                                HeaderText="Trạm có tồn tại chưa xử lý" SortExpression="TONGTRAMCHUABAOTRILUYKE" UniqueName="TONGTRAMCHUABAOTRILUYKE" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TONGTRAMDABAOTRILUYKE" HeaderButtonType="TextButton" ColumnGroupName="KhoiLuongLK"
                                HeaderText="Trạm đã bảo trì/xử lý tồn tại" SortExpression="TONGTRAMDABAOTRILUYKE" UniqueName="TONGTRAMDABAOTRILUYKE" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            
                                       
                                             
                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>

     <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="350px"
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="CHI TIẾT TÌNH HÌNH THEO DÕI BẢO TRÌ TRẠM KHÁCH HÀNG !!">
	<ContentTemplate>
	 <br />
        
          <table align="center">
            <tr>
                <td align="left"">ID :</td>
                <td><telerik:RadTextBox ID="txtID" Runat="server" Width="220">
        </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>

            <tr>
                <td>Trạm phân phối :</td>
                <td><telerik:RadComboBox ID="cboTramPP" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
          

          <tr>
                <td>Ngày kiểm tra :</td>
                <td> <telerik:RadDatePicker ID="txtNgayKT" Runat="server" Culture="vi-VN" 
                       MinDate="1960-01-01" Width="225">
<Calendar ID="Calendar3" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" runat="server"></Calendar>

<DateInput ID="DateInput3" DisplayDateFormat="yyyy/MM/dd" DateFormat="yyyy/MM/dd" runat="server"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:RadDatePicker></td>
            </tr>
              <tr>
            <td></td>
            </tr>


          <tr>
                <td>Nội dung tồn tại :</td>
                <td><telerik:RadTextBox ID="txtNoiDung" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

               <tr>
                <td>Chưa bảo trì :</td>
                <td> <telerik:RadButton ID="txtChuaBT" runat="server" ToggleType="CheckBox" ButtonType="StandardButton"
               AutoPostBack="false">
               <ToggleStates>
                    <telerik:RadButtonToggleState Text="Checked" PrimaryIconCssClass="rbToggleCheckboxChecked">
                    </telerik:RadButtonToggleState>
                    <telerik:RadButtonToggleState Text="UnChecked" PrimaryIconCssClass="rbToggleCheckbox">
                    </telerik:RadButtonToggleState>
               </ToggleStates>
          </telerik:RadButton></td>
            </tr>
              <tr>
            <td></td>
            </tr>

             <tr>
                <td>Số hợp đồng :</td>
                <td><telerik:RadTextBox ID="txtSoHopDong" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

            <tr>
                <td>Ngày bảo trì :</td>
                <td> <telerik:RadDatePicker ID="txtNgayBT" Runat="server" Culture="vi-VN" 
                       MinDate="1960-01-01" Width="225">
<Calendar ID="Calendar4" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" runat="server"></Calendar>

<DateInput ID="DateInput4" DisplayDateFormat="yyyy/MM/dd" DateFormat="yyyy/MM/dd" runat="server"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:RadDatePicker></td>
            </tr>
              <tr>
            <td></td>
            </tr>
                                 

             
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="150px" 
                      Skin="Office2007"  OnClick="BOK_Click1">
                   </telerik:RadButton></td>
                <td><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="150px" 
                      Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton></td>
            </tr>
          </table>
    
	</ContentTemplate>
	</telerik:RadWindow>
          
           <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
