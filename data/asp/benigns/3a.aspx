<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="3a.aspx.vb" Inherits="niengiam.WebForm12" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>



 <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="500px"
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Công tác bảo trì lưới điện !!">
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
                <td>Trạm/Đường dây : <telerik:RadButton ID="CheckTram" runat="server" ToggleType="CheckBox" ButtonType="StandardButton"
               AutoPostBack="True" OnCheckedChanged="CheckTram_CheckedChanged">
               <ToggleStates>
                    <telerik:RadButtonToggleState Text="Checked" PrimaryIconCssClass="rbToggleCheckboxChecked">
                    </telerik:RadButtonToggleState>
                    <telerik:RadButtonToggleState Text="UnChecked" PrimaryIconCssClass="rbToggleCheckbox">
                    </telerik:RadButtonToggleState>
               </ToggleStates>
          </telerik:RadButton></td>
                <td><telerik:RadComboBox ID="cboTuyenDay" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>Hạng mục :</td>
                <td><telerik:RadTextBox ID="txtHangMuc" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
          
          <tr>
                <td>Khảo sát nhất thứ :</td>
                <td><telerik:RadTextBox ID="txtKSNhatThu" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

               <tr>
                <td>Khảo sát nhị thứ :</td>
                <td><telerik:RadTextBox ID="txtKSNhiThu" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

                      <tr>
                <td>Ngày Ban Hành :</td>
                <td> <telerik:RadDatePicker ID="txtNgayThucHien" Runat="server" Culture="vi-VN" 
                       MinDate="1960-01-01" Width="225">
<Calendar ID="Calendar1" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" runat="server"></Calendar>

<DateInput ID="DateInput1" DisplayDateFormat="yyyy/MM/dd" DateFormat="yyyy/MM/dd" runat="server"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:RadDatePicker></td>
            </tr>
              <tr>
            <td></td>
            </tr>
           
              <tr>
                <td>Khối lượng thực hiện :</td>
                <td><telerik:RadTextBox ID="txtKhoiLuong" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>Phân công thực hiện :</td>
                <td><telerik:RadTextBox ID="txtPhanCongTH" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>Phân công giám sát :</td>
                <td><telerik:RadTextBox ID="txtPhanCongGS" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

            <tr>
                <td>Bảng phân công :</td>
                <td>
                 <telerik:RadButton ID="txtBangPC" runat="server" ToggleType="CheckBox" ButtonType="StandardButton"
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
                <td>Cập nhật nhất thứ :</td>
                <td><telerik:RadTextBox ID="txtCNNhatThu" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>Cập nhật nhị thứ :</td>
                <td><telerik:RadTextBox ID="txtCNNhiThu" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>Nội dung cập nhật :</td>
                <td><telerik:RadTextBox ID="txtNoiDung" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>Đánh giá chất lượng :</td>
                <td><telerik:RadTextBox ID="txtDanhGia" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
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
    <div align="center">
    Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar3" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px"></telerik:RadButton>
      <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px">
     </telerik:RadButton>
     <br />
     <br />
    </div>


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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC BẢO TRÌ LƯỚI ĐIỆN 110KV">
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
                            <telerik:GridColumnGroup HeaderText="Khảo sát" Name="KhaoSat" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Phân công công tác" Name="PhanCong" HeaderStyle-HorizontalAlign="Center">
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
                          <%--  <telerik:GridCheckBoxColumn UniqueName="ToiDa1LanNamTramGIS" HeaderText="Tối đa 1 lần/năm với trạm GIS" 
                DataField="ToiDa1LanNamTramGIS" AllowSorting="false">
            </telerik:GridCheckBoxColumn>--%>
            
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                             <telerik:GridBoundColumn DataField="ID" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="ID" UniqueName="ID" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                          <%--  <telerik:GridBoundColumn DataField="TUYENDAY" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến dây" SortExpression="TUYENDAY" UniqueName="TUYENDAY" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>--%>
                             <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Đường dây"
                                 DataFields="ten_tuyenday, tuyenday" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
                            <telerik:GridBoundColumn DataField="HANGMUC" HeaderButtonType="TextButton" 
                                HeaderText="Hạng mục" SortExpression="HANGMUC" UniqueName="HANGMUC" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                          
                            <telerik:GridBoundColumn DataField="KHAOSATNHAT" HeaderButtonType="TextButton"   ColumnGroupName="KhaoSat"
                                HeaderText="Người/ đơn vị khảo sát nhất thứ" SortExpression="KHAOSATNHAT" UniqueName="KHAOSATNHAT" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="KHAOSATNHI" HeaderButtonType="TextButton"   ColumnGroupName="KhaoSat"
                                HeaderText="Người/ đơn vị khảo sát nhị thứ" SortExpression="KHAOSATNHI" UniqueName="KHAOSATNHI" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="NGAYTH" HeaderButtonType="TextButton" 
                                HeaderText="Ngày thực hiện công tác" SortExpression="NGAYTH" UniqueName="NGAYTH" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="KHOILUONGTH" HeaderButtonType="TextButton" 
                                HeaderText="Khối lượng thực hiện công tác" SortExpression="KHOILUONGTH" UniqueName="KHOILUONGTH" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PHANCONGTH" HeaderButtonType="TextButton"  ColumnGroupName="PhanCong"
                                HeaderText="Người/ Đơn vị thực hiện" SortExpression="PHANCONGTH" UniqueName="PHANCONGTH" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PHANCONGGS" HeaderButtonType="TextButton"  ColumnGroupName="PhanCong"
                                HeaderText="Người/ Đơn vị giám sát" SortExpression="PHANCONGGS" UniqueName="PHANCONGGS" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridCheckBoxColumn DataField="BANGPHANCONG" HeaderButtonType="TextButton"  ColumnGroupName="PhanCong"
                                HeaderText="Bảng phân công" SortExpression="BANGPHANCONG" UniqueName="BANGPHANCONG" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridCheckBoxColumn>

                            <telerik:GridBoundColumn DataField="CAPNHATNHAT" HeaderButtonType="TextButton"  ColumnGroupName="CapNhat"
                                HeaderText="Người/ đơn vị cập nhật nhất thứ" SortExpression="CAPNHATNHAT" UniqueName="CAPNHATNHAT" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="CAPNHATNHI" HeaderButtonType="TextButton"  ColumnGroupName="CapNhat"
                                HeaderText="Người/ đơn vị cập nhật nhị thứ" SortExpression="CAPNHATNHI" UniqueName="CAPNHATNHI" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="NOIDUNGCN" HeaderButtonType="TextButton"  ColumnGroupName="CapNhat"
                                HeaderText="Nội dung cập nhật" SortExpression="NOIDUNGCN" UniqueName="NOIDUNGCN" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CHATLUONG" HeaderButtonType="TextButton" 
                                HeaderText="Đánh giá chất lượng công tác" SortExpression="CHATLUONG" UniqueName="CHATLUONG" HeaderStyle-HorizontalAlign="Center">
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
         <div align="center">
        Chọn file :<asp:FileUpload ID="FileUpload1" runat="server" />
        <telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="100px" >
        </telerik:radbutton>
        <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="100px" >
        </telerik:radbutton>
        <br />
         <div align="center">  <asp:Label ID="LabelCapNhat" runat="server"
                    ForeColor="#CC0000"></asp:Label></div>
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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC BỌC HÓA LƯỚI ĐIỆN">
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

</asp:Content>
