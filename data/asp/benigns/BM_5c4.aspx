<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_5c4.aspx.vb" Inherits="niengiam.WebForm24" %>
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
                        Font-Italic="False"   Caption="THỐNG KÊ KHỐI LƯỢNG THIẾT BỊ CHÍNH TẠI CÁC TRẠM BIẾN ÁP TRUNG GIAN TRÊN SERVER GIS">
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
                <telerik:GridColumnGroup HeaderText="Điện áp 220kV" Name="220" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Điện áp 110kV" Name="110" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Điện áp 22kV" Name="22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Điện áp 15kV" Name="15" HeaderStyle-HorizontalAlign="Center">
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
              <telerik:GridCalculatedColumn UniqueName="TBA" HeaderText="Trạm biến áp"
                    DataFields="tentram, matram" Expression='{0} + "<br />"  + {1} '>
                </telerik:GridCalculatedColumn>
            
                <telerik:GridBoundColumn DataField="MBTLUC220" HeaderButtonType="TextButton"  ColumnGroupName="220"
                                HeaderText="MBT lực" SortExpression="MBTLUC220" UniqueName="MBTLUC220" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              
               <telerik:GridBoundColumn DataField="MBTTUDUNG220" HeaderButtonType="TextButton"  ColumnGroupName="220"
                                HeaderText="MBT tự dùng" SortExpression="MBTTUDUNG220" UniqueName="MBTTUDUNG220" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="MAYCAT220" HeaderButtonType="TextButton"  ColumnGroupName="220"
                                HeaderText="Máy cắt" SortExpression="MAYCAT220" UniqueName="MAYCAT220" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="DAOCACHLY220" HeaderButtonType="TextButton"  ColumnGroupName="220"
                                HeaderText="Dao cách ly" SortExpression="DAOCACHLY220" UniqueName="DAOCACHLY220" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="TUBU220" HeaderButtonType="TextButton"  ColumnGroupName="220"
                                HeaderText="Tụ bù" SortExpression="TUBU220" UniqueName="TUBU220" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="MBTLUC110" HeaderButtonType="TextButton"  ColumnGroupName="110"
                                HeaderText="MBT lực" SortExpression="MBTLUC110" UniqueName="MBTLUC110" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              
               <telerik:GridBoundColumn DataField="MBTTUDUNG110" HeaderButtonType="TextButton"  ColumnGroupName="110"
                                HeaderText="MBT tự dùng" SortExpression="MBTTUDUNG110" UniqueName="MBTTUDUNG110" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="MAYCAT110" HeaderButtonType="TextButton"  ColumnGroupName="110"
                                HeaderText="Máy cắt" SortExpression="MAYCAT110" UniqueName="MAYCAT110" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="DAOCACHLY110" HeaderButtonType="TextButton"  ColumnGroupName="110"
                                HeaderText="Dao cách ly" SortExpression="DAOCACHLY110" UniqueName="DAOCACHLY110" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="TUBU110" HeaderButtonType="TextButton"  ColumnGroupName="110"
                                HeaderText="Tụ bù" SortExpression="TUBU110" UniqueName="TUBU110" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>


                 <telerik:GridBoundColumn DataField="MBTLUC22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="MBT lực" SortExpression="MBTLUC22" UniqueName="MBTLUC22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              
               <telerik:GridBoundColumn DataField="MBTTUDUNG22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="MBT tự dùng" SortExpression="MBTTUDUNG22" UniqueName="MBTTUDUNG22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="MAYCAT22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="Máy cắt" SortExpression="MAYCAT22" UniqueName="MAYCAT22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="DAOCACHLY22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="Dao cách ly" SortExpression="DAOCACHLY22" UniqueName="DAOCACHLY22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="LBS22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="LBS" SortExpression="LBS22" UniqueName="LBS22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="FCO22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="FCO" SortExpression="FCO22" UniqueName="FCO22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>


                 <telerik:GridBoundColumn DataField="TUBU22" HeaderButtonType="TextButton"  ColumnGroupName="22"
                                HeaderText="Tụ bù" SortExpression="TUBU22" UniqueName="TUBU22" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                  <telerik:GridBoundColumn DataField="MBTLUC15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="MBT lực" SortExpression="MBTLUC15" UniqueName="MBTLUC15" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>
              
               <telerik:GridBoundColumn DataField="MBTTUDUNG15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="MBT tự dùng" SortExpression="MBTTUDUNG15" UniqueName="MBTTUDUNG15" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="MAYCAT15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="Máy cắt" SortExpression="MAYCAT15" UniqueName="MAYCAT15" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="DAOCACHLY15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="Dao cách ly" SortExpression="DAOCACHLY15" UniqueName="DAOCACHLY15" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="LBS15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="LBS" SortExpression="LBS15" UniqueName="LBS15" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="FCO15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="FCO" SortExpression="FCO15" UniqueName="FCO15" HeaderStyle-HorizontalAlign="Center">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridBoundColumn>


                 <telerik:GridBoundColumn DataField="TUBU15" HeaderButtonType="TextButton"  ColumnGroupName="15"
                                HeaderText="Tụ bù" SortExpression="TUBU15" UniqueName="TUBU15" HeaderStyle-HorizontalAlign="Center">
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
	                    Width="480px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="THỐNG KÊ KHỐI LƯỢNG THIẾT BỊ CHÍNH TẠI CÁC TRẠM BIẾN ÁP TRUNG GIAN TRÊN SERVER GIS !!">
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
                        Trạm biến áp :</td>
                    <td>
                        <telerik:RadComboBox ID="cboTram" Runat="server"  Width="225"  Skin="Vista">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>


                <tr>
                    <td>
                        MBT lực 220kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTLuc_220" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        MBT tự dùng 220kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTTuDung_220" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Máy cắt 220kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMayCat_220" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Dao cách ly 220kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDaoCachLy_220" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Tụ bù 220kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtTuBu_220" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        MBT lực 110kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTLuc_110" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        MBT tự dùng 110kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTTuDung_110" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Máy cắt 110kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMayCat_110" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            
              <tr>
                    <td>
                        Dao cách ly 110kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDaoCachLy_110" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Tụ bù 110kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtTuBu_110" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        MBT lực 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTLuc_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        MBT tự dùng 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTTuDung_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Máy cắt 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMayCat_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                <tr>
                    <td>
                        Dao cách ly 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDaoCachLy_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                
                <tr>
                    <td>
                        LBS 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtLBS_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
              

                <tr>
                    <td>
                        FCO 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtFCO_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                  
            
                <tr>
                    <td>
                        Tụ bù 22kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtTuBu_22" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>


                 <tr>
                    <td>
                        MBT lực 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTLuc_15" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        MBT tự dùng 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMBTTuDung_15" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                  <tr>
                    <td>
                        Máy cắt 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtMayCat_15" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                <tr>
                    <td>
                        Dao cách ly 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtDaoCachLy_15" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>

                
                <tr>
                    <td>
                        LBS 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtLBS_15" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
              

                <tr>
                    <td>
                        FCO 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtFCO_15" Runat="server" Width="220">
                    </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                  
            
                <tr>
                    <td>
                        Tụ bù 15kV :</td>
                    <td>
                       <telerik:RadNumericTextBox ID="txtTuBu_15" Runat="server" Width="220">
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
