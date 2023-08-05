<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_5c2.aspx.vb" Inherits="niengiam.WebForm22" %>
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
                        Font-Italic="False"   Caption="THỐNG KÊ KHỐI LƯỢNG THIẾT BỊ ĐÓNG CẮT TRÊN LƯỚI ĐIỆN TRUNG THẾ TRÊN SERVER GIS">
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
                <telerik:GridColumnGroup HeaderText="RMU" Name="RMU" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="REC" Name="REC" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="LBS" Name="LBS" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="DS" Name="DS" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="LTD" Name="LTD" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="LBFCO" Name="LBFCO" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="FCO" Name="FCO" HeaderStyle-HorizontalAlign="Center">
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
              <%--  <telerik:GridBoundColumn DataField="duongday" HeaderButtonType="TextButton"   
                                HeaderText="Đường dây" SortExpression="duongday" UniqueName="duongday" HeaderStyle-HorizontalAlign="Center"> 
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>--%>
                <telerik:GridBoundColumn DataField="RMU_DL" HeaderButtonType="TextButton"  ColumnGroupName="RMU"
                                HeaderText="ĐL" SortExpression="RMU_DL" UniqueName="RMU_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RMU_KH" HeaderButtonType="TextButton" ColumnGroupName="RMU"
                                HeaderText="KH" SortExpression="RMU_KH" UniqueName="RMU_KH" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="REC_DL" HeaderButtonType="TextButton" ColumnGroupName="REC"
                                HeaderText="ĐL" SortExpression="REC_DL" UniqueName="REC_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="REC_KH" HeaderButtonType="TextButton" ColumnGroupName="REC"
                                HeaderText="KH" SortExpression="REC_KH" UniqueName="REC_KH" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LBS_DL" HeaderButtonType="TextButton" ColumnGroupName="LBS"
                                HeaderText="ĐL" SortExpression="LBS_DL" UniqueName="LBS_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              <telerik:GridBoundColumn DataField="LBS_KH" HeaderButtonType="TextButton" ColumnGroupName="LBS"
                                HeaderText="KH" SortExpression="LBS_KH" UniqueName="LBS_KH" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DS_DL" HeaderButtonType="TextButton" ColumnGroupName="DS"
                                HeaderText="ĐL" SortExpression="DS_DL" UniqueName="DS_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              <telerik:GridBoundColumn DataField="DS_KH" HeaderButtonType="TextButton" ColumnGroupName="DS"
                                HeaderText="KH" SortExpression="DS_KH" UniqueName="DS_KH" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="LTD_DL" HeaderButtonType="TextButton" ColumnGroupName="LTD"
                                HeaderText="ĐL" SortExpression="LTD_DL" UniqueName="LTD_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              <telerik:GridBoundColumn DataField="LTD_KH" HeaderButtonType="TextButton" ColumnGroupName="LTD"
                                HeaderText="KH" SortExpression="LTD_KH" UniqueName="LTD_KH" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="LBFCO_DL" HeaderButtonType="TextButton" ColumnGroupName="LBFCO"
                                HeaderText="ĐL" SortExpression="LBFCO_DL" UniqueName="LBFCO_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              <telerik:GridBoundColumn DataField="LBFCO_KH" HeaderButtonType="TextButton" ColumnGroupName="LBFCO"
                                HeaderText="KH" SortExpression="LBFCO_KH" UniqueName="LBFCO_KH" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="FCO_DL" HeaderButtonType="TextButton" ColumnGroupName="FCO"
                                HeaderText="ĐL" SortExpression="FCO_DL" UniqueName="FCO_DL" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              <telerik:GridBoundColumn DataField="FCO_KH" HeaderButtonType="TextButton" ColumnGroupName="FCO"
                                HeaderText="KH" SortExpression="FCO_KH" UniqueName="FCO_KH" HeaderStyle-HorizontalAlign="Center">
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
    <telerik:RadWindow ID="radwindowPopup" runat="server" VisibleOnPageLoad="false" Height="550px"
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
                        RMU Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="RMUDL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        RMU Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="RMUKH" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        REC Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="RECDL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        REC Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="RECKH" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        LBS Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="LBSDL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        LBS Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="LBSKH" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        DS Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="DSDL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        DS Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="DSKH" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            
              <tr>
                    <td>
                        LTD Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="LTDDL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        LTD Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="LTDKH" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        LBFCO Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="LBFCODL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        LBFCO Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="LBFCOKH" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        FCO Điện lực :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="FCODL" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        FCO Khách hàng :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="FCOKH" Runat="server" Width="220">
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
                        </telerik:RadButton>
            </div>
        </ContentTemplate>
    </telerik:RadWindow>
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
