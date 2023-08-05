<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="3b.aspx.vb" Inherits="niengiam.WebForm5" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>



 <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="300px"
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="BÁO CÁO CÔNG TÁC THEO DÕI VẬN HÀNH CÁC ĐƯỜNG DÂY VÀ TRẠM !!">
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
                    <telerik:RadButtonToggleState  PrimaryIconCssClass="rbToggleCheckboxChecked">
                    </telerik:RadButtonToggleState>
                    <telerik:RadButtonToggleState  PrimaryIconCssClass="rbToggleCheckbox">
                    </telerik:RadButtonToggleState>
               </ToggleStates>
          </telerik:RadButton></td>
                <td><telerik:RadComboBox ID="txtTuyenDay" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>Tần suất kiểm tra :</td>
                <td><telerik:RadTextBox ID="txtTanSuat" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
          
          <tr>
                <td>Ngày kiểm tra :</td>
                <td> <telerik:RadDatePicker ID="txtNgayKT" Runat="server" Culture="vi-VN" 
                       MinDate="1960-01-01" Width="225">
<Calendar ID="Calendar2" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x" runat="server"></Calendar>

<DateInput ID="DateInput2" DisplayDateFormat="yyyy/MM/dd" DateFormat="yyyy/MM/dd" runat="server"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:RadDatePicker></td>
            </tr>
              <tr>
            <td></td>
            </tr>


          <tr>
                <td>Kết quả kiểm tra :</td>
                <td><telerik:RadTextBox ID="txtKetQua" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

               <tr>
                <td>Phương án xử lý :</td>
                <td><telerik:RadTextBox ID="txtPhuongAn" Runat="server" Width="220" >
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

            <tr>
                <td>Ngày hoàn tất :</td>
                <td> <telerik:RadDatePicker ID="txtNgayHT" Runat="server" Culture="vi-VN" 
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
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="120px" 
                    Skin="Office2007"  OnClick="BOK_Click1">
                   </telerik:RadButton></td>
                <td><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="120px" 
                     Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton></td>
            </tr>
          </table>
    
	</ContentTemplate>
	</telerik:RadWindow>

    <div align="center">

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
                       <Calendar ID="Calendar4" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="120px"></telerik:RadButton>

       <telerik:RadButton ID="BXuat" runat="server" Text="Xuất Excel"  Width="120px" 
                       Skin="WebBlue" OnClick="BXuat_Click">
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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC THEO DÕI VẬN HÀNH CÁC ĐƯỜNG DÂY VÀ TRẠM ">
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
                              <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Đường dây"
                                 DataFields="ten_tuyenday, tuyenday" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
                            <telerik:GridBoundColumn DataField="TANSUAT" HeaderButtonType="TextButton" 
                                HeaderText="Tần suất kiểm tra" SortExpression="TANSUAT" UniqueName="TANSUAT" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                          
                            <telerik:GridBoundColumn DataField="NgayKiemTra" HeaderButtonType="TextButton"   
                                HeaderText="Ngày kiểm tra" SortExpression="NgayKiemTra" UniqueName="NgayKiemTra" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="KETQUAKT" HeaderButtonType="TextButton"  
                                HeaderText="Kết quả kiểm tra" SortExpression="KETQUAKT" UniqueName="KETQUAKT" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                       
                            <telerik:GridBoundColumn DataField="PHUONGAN" HeaderButtonType="TextButton"   
                                HeaderText="Phương án xử lý" SortExpression="PHUONGAN" UniqueName="PHUONGAN" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayHoanThanh" HeaderButtonType="TextButton"  
                                HeaderText="Ngày hoàn thành" SortExpression="NgayHoanThanh" UniqueName="NgayHoanThanh" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
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
        Chọn file :<asp:FileUpload ID="FileUpload1" runat="server" Height="22px" 
             Width="217px" />
        <telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC THEO DÕI VẬN HÀNH CÁC ĐƯỜNG DÂY VÀ TRẠM">
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
