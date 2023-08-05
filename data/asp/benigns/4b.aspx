<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="4b.aspx.vb" Inherits="niengiam.BM4b" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



 <div align="center">   
    
 Từ ngày:
                   <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày:
                   <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar4" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
               Đơn vị :&nbsp;
                   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Hay" 
                       Width="200">
                   </telerik:RadComboBox>    

                    <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm Kiếm" 
         Width="100px" >
     </telerik:RadButton>


       <telerik:RadButton ID="BXuat" runat="server" Text="Xuất Excel"  Width="100px" 
                       Skin="Office2007" OnClick="BXuat_Click">
                   </telerik:RadButton>
    </div>
    <br />
     <div>
       <telerik:RadGrid ID="GridBM1a" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True"  >
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                  
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id" 
                        Caption="BÁO CÁO CÔNG TÁC KIỂM TRA HỆ THỐNG NỐI ĐẤT/CHỐNG SÉT">
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Kiểm tra hệ thống nối đất/ chống sét" Name="KiemTraHeThong" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                       
                        </ColumnGroups>

                        <Columns>
                          <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="ColumnEdit"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>   
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="ColumnDelete"  >
                            </telerik:GridButtonColumn>
                       
                              <telerik:GridBoundColumn DataField="TramDuongDay" HeaderButtonType="TextButton" 
                                HeaderText="Trạm/Đường Dây" SortExpression="TramDuongDay" UniqueName="TramDuongDay">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ViTriTru" HeaderButtonType="TextButton" 
                                HeaderText="Vị Trí Trụ" SortExpression="ViTriTru" UniqueName="ViTriTru">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayKiemTra" HeaderButtonType="TextButton" ColumnGroupName="KiemTraHeThong"
                                HeaderText="Ngày kiểm tra" SortExpression="NgayKiemTra" UniqueName="NgayKiemTra">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="KetQuaKiemTra" HeaderButtonType="TextButton" ColumnGroupName="KiemTraHeThong"
                                HeaderText="Kết quả kiểm tra " SortExpression="KetQuaKiemTra" UniqueName="KetQuaKiemTra">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="PhuongAn" HeaderButtonType="TextButton" 
                                HeaderText="Phương án xử lý" SortExpression="PhuongAn" UniqueName="PhuongAn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TienDo" HeaderButtonType="TextButton" 
                                HeaderText="Tiến độ" SortExpression="TienDo" UniqueName="TienDo">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="KetQuaThucHien" HeaderButtonType="TextButton" 
                                HeaderText="Kết quả thực hiện" SortExpression="KetQuaThucHien" UniqueName="KetQuaThucHien">
                            </telerik:GridBoundColumn>
                           
                             <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton" 
                                HeaderText="Ghi chú" SortExpression="GhiChu" UniqueName="GhiChu">
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
     <div align="center">
        Chọn file :<asp:FileUpload ID="FileUpload1" runat="server" Height="22px" 
             Width="217px" />
        <telerik:radbutton ID="XemTrenLuoi" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="100px" >
        </telerik:radbutton>
        <telerik:radbutton ID="LuuImport" runat="server" Skin="WebBlue" Text="Lưu" 
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
                        Font-Italic="False"   Caption="CÔNG TÁC ỨNG DỤNG PSS/E">
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


          
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="540px"
	                    Width="580px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-4b">
	<ContentTemplate>
	 <br />
        
          <table align="center">

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
                <td><telerik:RadComboBox ID="CBTramDuongDay" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>

             <tr>
                <td>Vị Trí Trụ :</td>
                <td><telerik:RadTextBox ID="txtViTriTru" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
                    
              <tr>
                <td>Ngày Kiểm Tra:</td>
                <td>  <telerik:raddatepicker ID="NgayKiemTra" Runat="server" 
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
                <td>Kết Quả Kiểm Tra :</td>
                <td><telerik:RadTextBox ID="txtKetQuaKiemTra" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
          
             <tr>
                <td>Phương Án Xử Lý :</td>
                <td><telerik:RadTextBox ID="txtPhuongAn" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
             
          
            <tr>
                <td>Tiến Độ :</td>
                <td><telerik:RadTextBox ID="txtTienDo" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
            
           
             <tr>
                <td>Kết Quả Thực Hiện :</td>
                <td><telerik:RadTextBox ID="txtKetQuaThucHien" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
           
             <tr>
                <td>Ghi Chú :</td>
                <td> <telerik:RadTextBox ID="txtGhiChu" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox></td>
            </tr>
              
            
              <tr>
            <td></td>
            </tr>
              </tr>
              <tr>
            <td></td>
            </tr>
            <tr>
                <td  align="right"><telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="100px" 
                      Skin="Office2007" OnClick="BOK_Click">
                   </telerik:RadButton></td>
                <td><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="100px" 
                      Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton></td>
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
