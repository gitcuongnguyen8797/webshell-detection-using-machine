<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="3j_5.aspx.vb" Inherits="niengiam.WebForm9" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <br />
 <div align="center">
                      Ngày biến động : <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                     Đơn vị :   
           <telerik:radcombobox ID="CbodonVi" Runat="server" 
                       Skin="Hay" 
                       Width="200">
                   </telerik:radcombobox>  &nbsp;
            <telerik:radbutton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="150px">
     </telerik:radbutton>
      <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>
</div>
 <br />
      <telerik:radgrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="20" AutoGenerateColumns="False"  >
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
                        Font-Italic="False"   Caption="TỔNG HỢP TÌNH HÌNH THỬ NGHIỆM ĐỊNH KỲ MBT PHÂN PHỐI TẠI CÔNG TY ĐIỆN LỰC">
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
                            <telerik:GridColumnGroup HeaderText="Số lượng phương tiện trang bị thực hiện tự thử nghiệm" Name="SoLuong" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Kế hoạch thử nghiệm định kỳ năm" Name="KeHoachTN" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Khối lượng thực hiện tháng" Name="KhoiLuongTH" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                                 <telerik:GridColumnGroup HeaderText="Tự thử nghiệm" Name="KhoiLuongTHTu"  ParentGroupName="KhoiLuongTH" HeaderStyle-HorizontalAlign="Center"> 
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                                 <telerik:GridColumnGroup HeaderText="Công ty Thí nghiệm Điện thử nghiệm" Name="KhoiLuongTHTND"  ParentGroupName="KhoiLuongTH"  HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                                 <telerik:GridColumnGroup HeaderText="Tổng" Name="KhoiLuongTHTong"  ParentGroupName="KhoiLuongTH"  HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="Khối lượng thực hiện lũy kế" Name="KhoiLuongLK"    HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="Tự thử nghiệm" Name="KhoiLuongLKTuTN"    ParentGroupName="KhoiLuongLK"  HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Công ty Thí nghiệm Điện thử nghiệm" Name="KhoiLuongLKTND"    ParentGroupName="KhoiLuongLK"  HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Tổng" Name="KhoiLuongLKTong"    ParentGroupName="KhoiLuongLK"  HeaderStyle-HorizontalAlign="Center">
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

                            <telerik:GridBoundColumn DataField="id" HeaderButtonType="TextButton" 
                                HeaderText="ID" SortExpression="id" UniqueName="id">
                            </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tendonvi" HeaderButtonType="TextButton" 
                                HeaderText="Công ty Điện lực" SortExpression="tendonvi" UniqueName="tendonvi">  <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="maydoda" HeaderButtonType="TextButton"  ColumnGroupName="SoLuong"
                                HeaderText="Máy đo điện áp phóng điện dầu cách điện" SortExpression="maydoda" UniqueName="maydoda">  <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="maydodtmc" HeaderButtonType="TextButton"  ColumnGroupName="SoLuong"
                                HeaderText="Máy đo điện trở 1 chiều" SortExpression="maydodtmc" UniqueName="maydodtmc">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="maydodtcd" HeaderButtonType="TextButton"  ColumnGroupName="SoLuong"
                                HeaderText="Máy đo điện trở cách điện" SortExpression="maydodtcd" UniqueName="maydodtcd">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="kehoachmay" HeaderButtonType="TextButton"  ColumnGroupName="KeHoachTN"
                                HeaderText="Máy" SortExpression="kehoachmay" UniqueName="kehoachmay">
                           </telerik:GridBoundColumn>
                           
                           <telerik:GridBoundColumn DataField="kehoachkva" HeaderButtonType="TextButton"  ColumnGroupName="KeHoachTN"
                                HeaderText="kVA" SortExpression="kehoachkva" UniqueName="kehoachkva">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tutnmay" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongTHTu"
                                HeaderText="Máy" SortExpression="tutnmay" UniqueName="tutnmay">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tutnkva" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongTHTu"
                                HeaderText="kVA" SortExpression="tutnkva" UniqueName="tutnkva">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tndmay" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongTHTND"
                                HeaderText="Máy" SortExpression="tndmay" UniqueName="tndmay">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tndkva" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongTHTND"
                                HeaderText="kVA" SortExpression="tndkva" UniqueName="tndkva">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tongmay" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongTHTong"
                                HeaderText="Máy" SortExpression="tongmay" UniqueName="tongmay">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="tongkva" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongTHTong"
                                HeaderText="kVA" SortExpression="tongkva" UniqueName="tongkva">
                           </telerik:GridBoundColumn>

                         


                           <telerik:GridBoundColumn DataField="TuTNMayLuyKe" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongLKTuTN"
                                HeaderText="Máy" SortExpression="TuTNMayLuyKe" UniqueName="TuTNMayLuyKe">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="TuTNKVALuyKe" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongLKTuTN"
                                HeaderText="kVA" SortExpression="TuTNKVALuyKe" UniqueName="TuTNKVALuyKe">
                           </telerik:GridBoundColumn>
                           
                           <telerik:GridBoundColumn DataField="TNDMayLuyKe" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongLKTND"
                                HeaderText="Máy" SortExpression="TNDMayLuyKe" UniqueName="TNDMayLuyKe">
                           </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="TNDKVALuyKe" HeaderButtonType="TextButton"  ColumnGroupName="KhoiLuongLKTND"
                                HeaderText="kVA" SortExpression="TNDKVALuyKe" UniqueName="TNDKVALuyKe">
                           </telerik:GridBoundColumn>

 

                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>

     <telerik:radwindow ID="radwindowPopup" runat="server" 
        VisibleOnPageLoad="false" Height="450px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
        VisibleStatusbar="false" Behaviors="None" 
        Title="TÌNH HÌNH THỬ NGHIỆM ĐỊNH KỲ MBT PHÂN PHỐI TẠI CÔNG TY ĐIỆN LỰC !!">
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
                <td></td>
                <td> Tháng:<telerik:RadComboBox ID="CboThang" Runat="server"  Width="50"  Skin="Vista">
                   </telerik:RadComboBox>Năm:<telerik:RadComboBox ID="CboNam" Runat="server"  Width="50"  Skin="Vista">
                   </telerik:RadComboBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>


            <tr>
                <td>Máy đo điện áp phóng điện :</td>
                <td><telerik:RadNumericTextBox ID="txtMayDoDA" Runat="server"  Width="225"  Skin="Vista">
                   </telerik:RadNumericTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>Máy đo điện trở 1 chiều :</td>
                <td><telerik:RadNumericTextBox ID="txtMayDoDTMC" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
          
           
        <tr>
                <td>Máy đo điện trở cách điện :</td>
                <td><telerik:RadNumericTextBox ID="txtMayDoDTCD" Runat="server" Width="220"  >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

             
        <tr>
                <td>Kế hoạch thử nghiệm định kỳ máy:</td>
                <td><telerik:RadNumericTextBox ID="txtKeHoachMay" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                <td>Kế hoạch thử nghiệm định kỳ kVA:</td>
                <td><telerik:RadNumericTextBox ID="txtKeHoachKVA" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>


            <tr>
                <td>Tự thử nghiệm máy :</td>
                <td><telerik:RadNumericTextBox ID="txtTuTNMay" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

               <tr>
                <td>Tự thử nghiệm KVA :</td>
                <td><telerik:RadNumericTextBox ID="txtTuTNKVA" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

         <tr>
                <td>Công ty TND thử nghiệm máy :</td>
                <td><telerik:RadNumericTextBox ID="txtTNDMay" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>


         <tr>
                <td>Công ty TND thử nghiệm KVA :</td>
                <td><telerik:RadNumericTextBox ID="txtTNDKVA" Runat="server" Width="220" >
        </telerik:RadNumericTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

          
          </table>
          <div align="center">
    <telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="150px" 
                        Skin="Office2007"  OnClick="BOK_Click1">
                   </telerik:RadButton><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="150px" 
                        Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton></div>
	</ContentTemplate>
	</telerik:radwindow>
    <br />
  
           <telerik:radscriptmanager ID="RadScriptManager1" Runat="server">
        </telerik:radscriptmanager>
        <telerik:radstylesheetmanager ID="RadStyleSheetManager1" Runat="server">
        </telerik:radstylesheetmanager>
<br />

</asp:Content>
