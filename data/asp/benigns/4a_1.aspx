<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="4a_1.aspx.vb" Inherits="niengiam.WebForm15" %>
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
         Width="120px">
     </telerik:radbutton>
      <telerik:radbutton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="120px" >
     </telerik:radbutton>
     
     </div> 
     <br />
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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC BỌC HÓA LƯỚI ĐIỆN">
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
                <telerik:GridColumnGroup HeaderText="Loại" Name="Loai" HeaderStyle-HorizontalAlign="Center">
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
                         
                         <telerik:GridBoundColumn DataField="ID" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="ID" UniqueName="ID" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="VITRIDIEMHO" HeaderButtonType="TextButton" 
                                HeaderText="Vị trí điểm hở" SortExpression="VITRIDIEMHO" UniqueName="VITRIDIEMHO" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>
                        <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Đường dây"
                                 DataFields="ten_tuyenday, tuyenday" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
                              <%-- <telerik:GridBoundColumn DataField="TUYENDAY" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến dây" SortExpression="TUYENDAY" UniqueName="TUYENDAY" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>--%>

   <telerik:GridCheckBoxColumn DataField="MOINOI" HeaderButtonType="TextButton" ColumnGroupName="Loai"
                                HeaderText="Mối nối" SortExpression="MOINOI" UniqueName="MOINOI" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridCheckBoxColumn>

   <telerik:GridCheckBoxColumn DataField="TIEPXUCTHIETBI" HeaderButtonType="TextButton" ColumnGroupName="Loai"
                                HeaderText="Tiếp xúc thiết bị" SortExpression="TIEPXUCTHIETBI" UniqueName="TIEPXUCTHIETBI" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridCheckBoxColumn>

      <telerik:GridBoundColumn DataField="NgayKT" HeaderButtonType="TextButton"  DataFormatString="{0:dd/MM/yyyy}"
                                HeaderText="Ngày cập nhật" SortExpression="NgayKT" UniqueName="NgayKT" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>
                       
                        <telerik:GridBoundColumn DataField="MaDonVi" HeaderButtonType="TextButton"  
                                HeaderText="Mã đơn vị" SortExpression="MaDonVi" UniqueName="MaDonVi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>

                <telerik:RadWindow ID="radwindowPopup" runat="server" 
        VisibleOnPageLoad="false" Height="300px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
        VisibleStatusbar="false" Behaviors="None" 
        Title="BÁO CÁO CÔNG TÁC BỌC HÓA LƯỚI ĐIỆN !!" 
        BorderStyle="None">
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
                <td align="left"">Vị trí điểm hở :</td>
                <td><telerik:RadTextBox ID="txtViTri" Runat="server" Width="220">
        </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>


            <tr>
                <td>Tuyến dây :</td>
                <td><telerik:RadComboBox ID="cboTuyenDay" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          

          
            <tr>
                <td>Ngày kiểm tra :</td>
                <td> <telerik:RadDatePicker ID="dateNgayKT" Runat="server" Culture="vi-VN" 
                       MinDate="1960-01-01" Width="225">
<Calendar ID="Calendar4" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" runat="server"></Calendar>

<DateInput ID="DateInput4" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" runat="server"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:RadDatePicker></td>
            </tr>
              <tr>
            <td></td>
            </tr>


             <tr>
                <td>Mối nối :</td>
                <td><telerik:RadButton ID="CheckMoiNoi" runat="server" ToggleType="CheckBox" ButtonType="StandardButton"
               AutoPostBack="false">
               <ToggleStates>
                    <telerik:RadButtonToggleState Text="" PrimaryIconCssClass="rbToggleCheckboxChecked">
                    </telerik:RadButtonToggleState>
                    <telerik:RadButtonToggleState Text="" PrimaryIconCssClass="rbToggleCheckbox">
                    </telerik:RadButtonToggleState>
               </ToggleStates>
          </telerik:RadButton>
         <%-- <telerik:RadButton ID="CheckMoiNoi" runat="server" ToggleType="CheckBox" ButtonType="ToggleButton"
               AutoPostBack="false">
               <ToggleStates>
                    <telerik:RadButtonToggleState ></telerik:RadButtonToggleState>
                  
               </ToggleStates>
          </telerik:RadButton>--%>
          </td>
            </tr>
              <tr>
            <td></td>
            </tr>
          
           
        <tr>
                <td>Tiếp xúc thiết bị :</td>
                <td><telerik:RadButton ID="CheckTiepXuc" runat="server" ToggleType="CheckBox" ButtonType="StandardButton"
               AutoPostBack="false">
               <ToggleStates>
                    <telerik:RadButtonToggleState  PrimaryIconCssClass="rbToggleCheckboxChecked">
                    </telerik:RadButtonToggleState>
                    <telerik:RadButtonToggleState  PrimaryIconCssClass="rbToggleCheckbox">
                    </telerik:RadButtonToggleState>
               </ToggleStates>
          </telerik:RadButton></td>
            </tr>
              <tr>
            <td></td>
            </tr>
              
      
          </table>
    <div align="center">
    <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="120px" 
                      Skin="Office2007"  OnClick="BOK_Click1">
                   </telerik:RadButton><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="120px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
    </div>
	</ContentTemplate>
	</telerik:RadWindow>
          <br />
  <div align="center">  Chọn file :<asp:FileUpload ID="FileUpload1" runat="server" /><telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="120px" >
     </telerik:radbutton>        
           
      <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="120px" >
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
     
<br />

       <telerik:radscriptmanager ID="RadScriptManager1" Runat="server">
        </telerik:radscriptmanager>
        <telerik:radstylesheetmanager ID="RadStyleSheetManager1" Runat="server">
        </telerik:radstylesheetmanager>
</asp:Content>
