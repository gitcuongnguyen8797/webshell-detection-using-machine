<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="3.aspx.vb" Inherits="niengiam.WebForm6" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




   
       <div align="center">  Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
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
                   Loại mất điện :&nbsp;
                   <telerik:RadComboBox ID="CboSuCo" Runat="server" 
                       Skin="Office2010Blue" >
                       <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Mất điện" Value="Mất điện" />
                           <telerik:RadComboBoxItem runat="server" Text="Sự cố" Value="Sự cố" />
                       </Items>
                   </telerik:RadComboBox>

                Đơn vị :   
           <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2010Blue" 
                       Width="200">
                   </telerik:RadComboBox> 
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
    <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>
     </div> 
        
      
   

     <br />
   
     <div>
       <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
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
                        Font-Italic="False"   DataKeyNames="LanMatDien" 
                        Caption="THỐNG KÊ CÁC TRƯỜNG HỢP MẤT ĐIỆN" GridLines="Both" 
                       >
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
               <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Mã" Name="Ma" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridColumnGroup>
               
            </ColumnGroups>
                        <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>
                           
                              <telerik:GridBoundColumn DataField="LanMatDien" HeaderButtonType="TextButton" 
                                HeaderText="Lần Mất điện" SortExpression="LanMatDien" UniqueName="LanMatDien" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                         <%--   <telerik:GridBoundColumn DataField="DuongDay" HeaderButtonType="TextButton" 
                                HeaderText="Đường dây" SortExpression="DuongDay" UniqueName="DuongDay" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>--%>
                              <telerik:GridCalculatedColumn UniqueName="duongday" HeaderText="Đường dây"
                                DataFields="ten_tuyenday, maphantu" Expression='{0} + "<br />"  + {1} '>
                               </telerik:GridCalculatedColumn>
                             <telerik:GridBoundColumn DataField="Loai" HeaderButtonType="TextButton" 
                                HeaderText="Loại" SortExpression="Loai" UniqueName="Loai" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NgayMatDien" HeaderButtonType="TextButton" 
                                HeaderText="Ngày Mất điện" SortExpression="NgayMatDien" UniqueName="NgayMatDien" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ThoiGianMat" HeaderButtonType="TextButton" 
                                HeaderText="Thời gian mất" SortExpression="ThoiGianMat" UniqueName="ThoiGianMat" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NgayCoDien" HeaderButtonType="TextButton" 
                                HeaderText="Ngày Có điện" SortExpression="NgayCoDien" UniqueName="NgayCoDien" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ThoiGianCo" HeaderButtonType="TextButton" 
                                HeaderText="Thời Gian có" SortExpression="ThoiGianCo" UniqueName="ThoiGianCo" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="ThoiGianMatDien" HeaderButtonType="TextButton" 
                                HeaderText="Thời Gian mất điện" SortExpression="ThoiGianMatDien" UniqueName="ThoiGianMatDien" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ViTri" HeaderButtonType="TextButton" 
                                HeaderText="Vị trí" SortExpression="ViTri" UniqueName="ViTri" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="LyDo" HeaderButtonType="TextButton" 
                                HeaderText="Lý do" SortExpression="LyDo" UniqueName="LyDo" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NguyenNhan" HeaderButtonType="TextButton" 
                                HeaderText="Nguyên Nhân" SortExpression="NguyenNhan" UniqueName="NguyenNhan" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ChiTiet" HeaderButtonType="TextButton"  ColumnGroupName="Ma"
                                HeaderText="Chi tiết" SortExpression="ChiTiet" UniqueName="ChiTiet" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TongHop" HeaderButtonType="TextButton"  ColumnGroupName="Ma"
                                HeaderText="Tổng hợp" SortExpression="TongHop" UniqueName="TongHop" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TaiSan" HeaderButtonType="TextButton" 
                                HeaderText="Tài Sản" SortExpression="TaiSan" UniqueName="TaiSan" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PhanLoai" HeaderButtonType="TextButton" 
                                HeaderText="Phân Loại" SortExpression="PhanLoai" UniqueName="PhanLoai" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SuCo" HeaderButtonType="TextButton" 
                                HeaderText="Sự cố" SortExpression="SuCo" UniqueName="SuCo" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoBienBan" HeaderButtonType="TextButton" 
                                HeaderText="Số biên bản" SortExpression="SoBienBan" UniqueName="SoBienBan" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayBienBan" HeaderButtonType="TextButton"  DataFormatString="{0:dd/MM/yyyy}"
                                HeaderText="Ngày biên bản" SortExpression="NgayBienBan" UniqueName="NgayBienBan" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                      
                             <telerik:GridHyperLinkColumn  HeaderButtonType="TextButton"  DataTextField="FileVanBan" DataNavigateUrlFields="FileVanBan" 
                                HeaderText="File Văn bản" SortExpression="FileVanBan" UniqueName="FileVanBan" DataNavigateUrlFormatString="~/Upload/{0}" HeaderStyle-HorizontalAlign="Center" >
                            </telerik:GridHyperLinkColumn>

                            <telerik:GridBoundColumn DataField="thoigianupfile" HeaderButtonType="TextButton" 
                                HeaderText="Thời gian up file" SortExpression="thoigianupfile" UniqueName="thoigianupfile" HeaderStyle-HorizontalAlign="Center">
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
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" 
                        Skin="Forest">
                    </HeaderContextMenu>
                </telerik:RadGrid>
     </div>
       <telerik:RadGrid ID="RadGrid1" runat="server">
       <ClientSettings AllowColumnsReorder="true" AllowDragToGroup="true" ReorderColumnsOnClient="true">
            <Scrolling AllowScroll="true" UseStaticHeaders="true"></Scrolling>
            <Resizing AllowColumnResize="true" EnableRealTimeResize="true" />
        </ClientSettings>
        <GroupingSettings ShowUnGroupButton="true"></GroupingSettings>
        <MasterTableView EnableHeaderContextMenu="true">
            <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Product Details" Name="ProductDetails" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Location" Name="Location">
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Category" Name="Category" ParentGroupName="ProductDetails">
                </telerik:GridColumnGroup>
                <telerik:GridColumnGroup HeaderText="Order Details" Name="OrderDetails" ParentGroupName="ProductDetails"
                    HeaderStyle-HorizontalAlign="Center">
                </telerik:GridColumnGroup>
            </ColumnGroups>
            <Columns>
                <telerik:GridBoundColumn UniqueName="SupplierName" DataField="SupplierName" HeaderText="Supplier Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="Address" DataField="Address" ColumnGroupName="Location"
                    HeaderText="Address">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="City" DataField="City" ColumnGroupName="Location"
                    HeaderText="City">
                </telerik:GridBoundColumn>
                <telerik:GridNumericColumn UniqueName="ID" DataField="ID" ColumnGroupName="Category"
                    HeaderText="ID">
                </telerik:GridNumericColumn>
                <telerik:GridBoundColumn UniqueName="CategoryName" DataField="CategoryName" ColumnGroupName="Category"
                    HeaderText="Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="ProductName" DataField="ProductName" ColumnGroupName="ProductDetails"
                    HeaderText="Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="Quantity" DataField="Quantity" ColumnGroupName="ProductDetails"
                    HeaderText="Quantity">
                </telerik:GridBoundColumn>
                <telerik:GridNumericColumn UniqueName="Freight" DataField="Freight" ColumnGroupName="OrderDetails"
                    HeaderText="Freight">
                </telerik:GridNumericColumn>
                <telerik:GridDateTimeColumn UniqueName="OrderDate" DataField="OrderDate" ColumnGroupName="OrderDetails"
                    HeaderText="Date">
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn UniqueName="OrderAddress" DataField="OrderAddress" ColumnGroupName="OrderDetails"
                    HeaderText="Address">
                </telerik:GridBoundColumn>
                <telerik:GridNumericColumn UniqueName="Price" DataField="Price" ColumnGroupName="ProductDetails"
                    HeaderText="Price">
                </telerik:GridNumericColumn>
            </Columns>
        </MasterTableView>
       </telerik:RadGrid>
     <br />
          
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="450px"
	                    Width="480px" BackColor="#DADADA" VisibleStatusbar="False" 
            Behaviors="None" Title="Thống kê trường hợp mất điện" KeepInScreenBounds="True">
	<ContentTemplate>
	 <br />
        
          <table align="center">
            <tr>
                <td align="left"">Lần mất điện :</td>
                <td><telerik:RadTextBox ID="txtLanMatDien" Runat="server" Width="220" ReadOnly="True">
        </telerik:RadTextBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
          
              <tr>
            <td></td>
            </tr>
          
             <tr>
                <td>Nguyên nhân :</td>
                <td><telerik:RadTextBox ID="txtNguyenNhan" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
        </telerik:RadTextBox>
    <%--    <telerik:RadComboBox ID="CboNguyenNhan" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox>--%>
        </td>
            </tr>
              <tr>
            <td></td>
            </tr>
          
             <tr>
                 <td>Mã tổng hợp :</td>
                <td><telerik:RadComboBox ID="CboMaTH" Runat="server"  Width="225" Skin="Hay"  AutoPostBack="true"  OnSelectedIndexChanged="CboMaTH_SelectedIndexChanged" >
                   </telerik:RadComboBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>
           
             <tr>
               
                     <td>Mã chi tiết :</td>
                <td> 
                  <telerik:RadComboBox ID="CboMaCT" Runat="server"  Width="225" Skin="Hay"  >
                   </telerik:RadComboBox>
                   
                   </td>
            </tr>
              <tr>
            <td></td>
            </tr>
           
             <tr>
                <td>Tài sản :</td>
                <td> <telerik:RadComboBox ID="CboTaiSan" Runat="server"  Width="225" Skin="Hay"  >
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
            <td></td>
            </tr>
           
             <tr>
                <td>Phân loại :</td>
                <td> 
                 <telerik:RadComboBox ID="txtPhanLoai" Runat="server"  Skin="Hay" >
                       <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Sự cố" Value="Sự cố" />
                           <telerik:RadComboBoxItem runat="server" Text="Hiện tượng bất thường" Value="Hiện tượng bất thường" />
                       </Items>
                   </telerik:RadComboBox>
                 </td>
            </tr>
              <tr>
            <td></td>
            </tr>
             <tr>
                <td>Tên Sự Cố:</td>
                <td> <telerik:RadTextBox ID="txtTenSuCo" Runat="server" Width="220">
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                 <td>Số Biên Bản :</td>
                <td><telerik:RadTextBox ID="txtSoBienBan" Runat="server" Width="220">
        </telerik:RadTextBox></td>
            </tr>
              <tr>
            <td></td>
            </tr>

              <tr>
                 <td>Ngày Biên Bản :</td>
                <td><telerik:raddatepicker ID="DateNgayBienBan" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar3" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker></td>
            </tr>
              <tr>
            <td></td>
              </tr>

               <tr>
                 <td>File Văn Bản :</td>
                <td><asp:FileUpload ID="FileUploadControl" runat="server" Width="220" /></td>
            </tr>
              <tr>
            <td></td>
            </tr>


           </tr>
              <tr>
            <td></td>
            </tr>
              </tr>
              <tr>
            <td></td>
            </tr>
              </tr>
              <tr>
            <td></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="150px" 
                       Skin="Office2007" OnClick="BOK_Click">
                   </telerik:RadButton></td>
                <td><telerik:RadButton ID="BThoat" runat="server" Text="Thoát"  Width="150px" 
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
