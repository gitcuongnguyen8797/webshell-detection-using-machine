<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1a.aspx.vb" Inherits="niengiam.BM1a" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <div align="center">   
    
 Từ ngày:
                   <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar ID="Calendar3" Skin="Office2007" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" 
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
 

                    <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm Kiếm" 
         Width="100px" >
     </telerik:RadButton>


       <telerik:RadButton ID="BXuat" runat="server" Text="Xuất Excel"  Width="100px" 
                    Skin="Office2007" OnClick="BXuat_Click">
                   </telerik:RadButton>
    </div>
   <br />
     <div
     >
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
                        Caption="RÀ SOÁT TÌNH HÌNH KHAI THÁC PHỤ TẢI CÁC MÁY BIẾN THẾ 110KV">
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                        
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" 
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>   
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                       
                             <telerik:GridCalculatedColumn UniqueName="Tram" HeaderText="Trạm"
                                 DataFields="Tram, MaTram" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>


                             <telerik:GridBoundColumn DataField="MayBienThe" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Máy Biến Thế" SortExpression="MayBienThe" UniqueName="MayBienThe">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TaiDinhMuc" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tải định mức MBT" SortExpression="TaiDinhMuc" UniqueName="TaiDinhMuc">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TenLoRa" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tên lộ ra XDM/Máy cắt" SortExpression="TenLoRa" UniqueName="TenLoRa">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="CapDienAp" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Cấp Điện Áp" SortExpression="CapDienAp" UniqueName="CapDienAp">                              
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DonViKhaiThac" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đơn Vị Khai Thác" SortExpression="DonViKhaiThac" UniqueName="DonViKhaiThac">                              
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="TienDoThucHien" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tiến Độ Thực Hiện" SortExpression="TienDoThucHien" UniqueName="TienDoThucHien">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NgayKhaiThac" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ngày Đưa Vào Khai Thác" SortExpression="NgayKhaiThac" UniqueName="NgayKhaiThac">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TaiKhaiThac" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tải Khai Thác" SortExpression="TaiKhaiThac" UniqueName="TaiKhaiThac">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayChinhSua" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ngày Cập Nhật" SortExpression="NgayChinhSua" UniqueName="NgayChinhSua">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
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
                        Font-Italic="False"   Caption="RÀ SOÁT TÌNH HÌNH KHAI THÁC PHỤ TẢI CÁC MÁY BIẾN THẾ 110KV">
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


     </div>
     <br />
          
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="500px"
	                    Width="580px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-1a">
	<ContentTemplate>
	 <br />
        
          <table align="center">
            <tr>
                 <td>Trạm:</td>
                <td><telerik:RadComboBox ID="CBTram" Runat="server"  Width="225" Skin="Vista"  autopostback="True" ontextchanged="CBTram_TextChanged">
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
                 <td>Máy biến thế:</td>
                <td><telerik:RadComboBox ID="CBMayBienThe" Runat="server"  Width="225" Skin="Vista" autopostback="True" ontextchanged="CBMayBienThe_TextChanged" >
                   </telerik:RadComboBox></td>
            </tr>
             <tr>
                 <td>Tải định mức MBT</td>
                <td><telerik:RadComboBox ID="CBTaiDinhMuc" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
                    
             <tr>
                <td>Tên lộ ra XDM/Máy cắt:</td>
                <td><telerik:RadTextBox ID="txtTenLoRa" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>           
          
             <tr>
                 <td>Điện Áp (kV):</td>
                <td><telerik:RadComboBox ID="CBDienAp" Runat="server"  Width="225" Skin="Vista" >
                   </telerik:RadComboBox></td>
            </tr>
             
              <tr>
                 <td>Đơn vị khai thác:</td>
                <td><telerik:RadComboBox ID="CBDonViKhaiThac" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
             <tr>
                 <td>Tiến độ thực hiện:</td>
                <td><telerik:RadComboBox ID="CBTienDo" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>

            <tr>
                <td>Ngày đưa vào khai thác</td>
                <td>  <telerik:raddatepicker ID="ngayduavaokhaithac" Runat="server" Width="225"
         Skin="Web20">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>

        </td>
            </tr>

                       
           
             <tr>
                <td>Tải khai thác (A):</td>
                <td>
                <telerik:RadNumericTextBox ID="txtTaiKhaiThac" Runat="server" Width="220" >
        </telerik:RadNumericTextBox>


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
