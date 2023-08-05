<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_5c3.aspx.vb" Inherits="niengiam.WebForm23" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
        <br />&nbsp;Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
            <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
            </Calendar>
            <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
            </DateInput>
            <DatePopupButton HoverImageUrl="" ImageUrl="" />
        </telerik:raddatepicker>
                  Đến ngày : 
        <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
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
        </telerik:radcombobox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <telerik:radbutton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
        </telerik:radbutton>
        <telerik:radbutton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
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
                        Font-Italic="False"   Caption="THỐNG KÊ KHỐI LƯỢNG ĐƯỜNG DÂY TRUNG THẾ TRÊN SERVER GIS">
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
                <telerik:GridColumnGroup HeaderText="Đường dây nổi" Name="duongdaynoi" HeaderStyle-HorizontalAlign="Center">
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
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Đường dây"
                    DataFields="ten_tuyenday, tuyenday" Expression='{0} + "<br />"  + {1} '>
                </telerik:GridCalculatedColumn>
         
                <telerik:GridBoundColumn DataField="LOAIPHA1" HeaderButtonType="TextButton"  ColumnGroupName="duongdaynoi"
                                HeaderText="Loại dây pha 1" SortExpression="LOAIPHA1" UniqueName="LOAIPHA1" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
            
               <telerik:GridBoundColumn DataField="LOAIPHA2" HeaderButtonType="TextButton"  ColumnGroupName="duongdaynoi"
                                HeaderText="Loại dây pha 2" SortExpression="LOAIPHA2" UniqueName="LOAIPHA2" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="LOAIPHA3" HeaderButtonType="TextButton"  ColumnGroupName="duongdaynoi"
                                HeaderText="Loại dây pha 3" SortExpression="LOAIPHA3" UniqueName="LOAIPHA3" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="LOAITRUNGHOA" HeaderButtonType="TextButton"  ColumnGroupName="duongdaynoi"
                                HeaderText="Loại dây trung hòa" SortExpression="LOAITRUNGHOA" UniqueName="LOAITRUNGHOA" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                  <telerik:GridBoundColumn DataField="CAPNGAM" HeaderButtonType="TextButton"  
                                HeaderText="Cáp ngầm" SortExpression="CAPNGAM" UniqueName="CAPNGAM" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                
                  <telerik:GridBoundColumn DataField="CHIEUDAI" HeaderButtonType="TextButton"  
                                HeaderText="Chiều dài(m)" SortExpression="CHIEUDAI" UniqueName="CHIEUDAI" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                  <telerik:GridBoundColumn DataField="SOHUU" HeaderButtonType="TextButton"  
                                HeaderText="Sở hữu" SortExpression="SOHUU" UniqueName="SOHUU" HeaderStyle-HorizontalAlign="Center">
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
    <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="400px"
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="THỐNG KÊ KHỐI LƯỢNG ĐƯỜNG DÂY TRUNG THẾ TRÊN SERVER GIS !!">
        <ContentTemplate>
            <br />
            <table align="center">
                <tr>
                    <td align="left"">
                        ID :</td>
                    <td>
                        <telerik:RadTextBox ID="txtID" Runat="server" Width="220">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Tuyến dây :</td>
                    <td>
                        <telerik:RadComboBox ID="cboTuyenDay" Runat="server"  Width="225"  Skin="Vista">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>


                <tr>
                    <td>
                        Loại dây pha 1 :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtLoaiPha1" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Loại dây pha 2 :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtLoaiPha2" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Loại dây pha 3 :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtLoaiPha3" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Loại dây trung hòa :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtTrungHoa" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Cáp ngầm :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtCapNgam" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Chiều dài(m) :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtChieuDai" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Sở hữu :</td>
                    <td>
                       <telerik:RadComboBox ID="CboSoHuu" Runat="server"  Width="225"  Skin="Vista">
                        <Items>
                           <telerik:RadComboBoxItem runat="server" Text="ĐL" Value="ĐL" />
                           <telerik:RadComboBoxItem runat="server" Text="KH" Value="KH" />
                       </Items>
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
              
                         
                  
                   
            </table>
            <div align="center">
                      <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="100px" 
                      Skin="Office2007"  OnClick="BOK_Click">
                        </telerik:RadButton>
                   
                        <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="100px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                        </telerik:RadButton>
            </div>
        </ContentTemplate>
    </telerik:RadWindow>
    <br />
<%--    <div align="center">
        Chọn file :<asp:FileUpload ID="FileUpload1" runat="server" />
        <telerik:radbutton ID="Radbutton1" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
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
    </div>--%>
    <br />
    <telerik:radscriptmanager ID="RadScriptManager1" Runat="server">
    </telerik:radscriptmanager>
    <telerik:radstylesheetmanager ID="RadStyleSheetManager1" Runat="server">
    </telerik:radstylesheetmanager>
</asp:Content>
