<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="5c1.aspx.vb" Inherits="niengiam.WebForm21" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center">
        <br />Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
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
                        Font-Italic="False"   Caption="BÁO CÁO TÌNH HÌNH CẬP NHẬT DỮ LIỆU HẠ THẾ VÀO SERVER GIS">
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
                <telerik:GridColumnGroup HeaderText="Số liệu QLKT" Name="QLKT" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                  <telerik:GridColumnGroup HeaderText="Khối lượng đã tích lũy vào Server kỳ trước" Name="kytruoc" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Khối lượng đã cập nhật trong kỳ" Name="trongky" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                    <telerik:GridColumnGroup HeaderText="Khối lượng đã tích lũy vào Server" Name="tichluy" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                 <telerik:GridColumnGroup HeaderText=" Dữ liệu đã đưa vào khai thác" Name="khaithac" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                     <telerik:GridColumnGroup HeaderText="Tỷ lệ khai thác/QLKT" Name="tyle" HeaderStyle-HorizontalAlign="Center">
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
                    <telerik:GridBoundColumn DataField="TenDonVi" HeaderButtonType="TextButton"  
                                HeaderText="Tên đơn vị" SortExpression="TenDonVi" UniqueName="TenDonVi" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="MaDonVi" HeaderButtonType="TextButton"  
                                HeaderText="Mã đơn vị" SortExpression="MaDonVi" UniqueName="MaDonVi" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SotramQLKT" HeaderButtonType="TextButton"  ColumnGroupName="QLKT"
                                HeaderText="Số trạm" SortExpression="SotramQLKT" UniqueName="SotramQLKT" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DienkeQLKT" HeaderButtonType="TextButton" ColumnGroupName="QLKT"
                                HeaderText="Điện kế" SortExpression="DienkeQLKT" UniqueName="DienkeQLKT" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SotramKytruoc" HeaderButtonType="TextButton" ColumnGroupName="kytruoc"
                                HeaderText="Số trạm" SortExpression="SotramKytruoc" UniqueName="SotramKytruoc" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DienkeKytruoc" HeaderButtonType="TextButton" ColumnGroupName="kytruoc"
                                HeaderText="Điện kế" SortExpression="DienkeKytruoc" UniqueName="DienkeKytruoc" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="SotramTrongky" HeaderButtonType="TextButton" ColumnGroupName="trongky"
                                HeaderText="Số trạm" SortExpression="SotramTrongky" UniqueName="SotramTrongky" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DienkeTrongky" HeaderButtonType="TextButton" ColumnGroupName="trongky"
                                HeaderText="Điện kế" SortExpression="DienkeTrongky" UniqueName="DienkeTrongky" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="SotramTichluy" HeaderButtonType="TextButton" ColumnGroupName="tichluy"
                                HeaderText="Số trạm" SortExpression="SotramTichluy" UniqueName="SotramTichluy" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DienkeTichluy" HeaderButtonType="TextButton" ColumnGroupName="tichluy"
                                HeaderText="Điện kế" SortExpression="DienkeTichluy" UniqueName="DienkeTichluy" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="SotramKhaithac" HeaderButtonType="TextButton" ColumnGroupName="khaithac"
                                HeaderText="Số trạm" SortExpression="SotramKhaithac" UniqueName="SotramKhaithac" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DienkeKhaithac" HeaderButtonType="TextButton" ColumnGroupName="khaithac"
                                HeaderText="Điện kế" SortExpression="DienkeKhaithac" UniqueName="DienkeKhaithac" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
              </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SotramTyle" HeaderButtonType="TextButton" ColumnGroupName="tyle"
                                HeaderText="Số trạm" SortExpression="SotramTyle" UniqueName="SotramTyle" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DienkeTyle" HeaderButtonType="TextButton" ColumnGroupName="tyle"
                                HeaderText="Điện kế" SortExpression="DienkeTyle" UniqueName="DienkeTyle" HeaderStyle-HorizontalAlign="Center">
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
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="BÁO CÁO TÌNH HÌNH CẬP NHẬT DỮ LIỆU HẠ THẾ VÀO SERVER GIS !!">
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
                    <td align="left"">
                        Số trạm QLKT :</td>
                    <td>
                           <telerik:RadNumericTextBox ID="txtSoTramQLKT" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                <tr>
                    <td>
                        Điện kế QLKT :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDienKeQLKT" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
               
             
                <tr>
                    <td>
                        Số trạm kỳ trước :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtSoTramKytruoc" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                <tr>
                    <td>
                        Điện kế kỳ trước :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDienKeKytruoc" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Số trạm trong kỳ :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtSoTramTrongky" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                   <tr>
                    <td>
                        Điện kế trong kỳ :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDienKeTrongky" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Số trạm khai thác :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtSoTramKhaithac" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                   <tr>
                    <td>
                        Điện kế khai thác :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDienKeKhaithac" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
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
                        </telerik:RadButton></div>
        </ContentTemplate>
    </telerik:RadWindow>
    <br />
      
    <telerik:radscriptmanager ID="RadScriptManager1" Runat="server">
    </telerik:radscriptmanager>
    <telerik:radstylesheetmanager ID="RadStyleSheetManager1" Runat="server">
    </telerik:radstylesheetmanager>

</asp:Content>
