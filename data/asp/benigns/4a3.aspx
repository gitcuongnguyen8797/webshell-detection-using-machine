<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="4a3.aspx.vb" Inherits="niengiam.BM4a3" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


  <div align="center">   
    
 Từ ngày:
                   <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar ID="Calendar3" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
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
                        Caption="CÔNG TÁC SỬ DỤNG THIẾT BỊ NGĂN NGỪA ĐỘNG VẬT XÂM NHẬP LƯỚI ĐIỆN">
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Loại thiết bị" Name="LoaiThietBi" HeaderStyle-HorizontalAlign="Center">
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
                       
                              <telerik:GridBoundColumn DataField="ViTri" HeaderButtonType="TextButton" 
                                HeaderText="Vị trí trụ lắp thiết bị" SortExpression="ViTri" UniqueName="ViTri">
                            </telerik:GridBoundColumn>
                      
                             <telerik:GridCalculatedColumn UniqueName="TuyenDay" HeaderText="Thuộc tuyến dây"
                                 DataFields="TuyenDay, MaTuyenDay" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>



                             <telerik:GridBoundColumn DataField="GiapBocInox" HeaderButtonType="TextButton" ColumnGroupName="LoaiThietBi"
                                HeaderText="Giáp bọc Inox" SortExpression="GiapBocInox" UniqueName="GiapBocInox">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ChongChongTuQuay" HeaderButtonType="TextButton" ColumnGroupName="LoaiThietBi"
                                HeaderText="Chong chóng tự quay" SortExpression="ChongChongTuQuay" UniqueName="ChongChongTuQuay">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DiaChongSoc" HeaderButtonType="TextButton" ColumnGroupName="LoaiThietBi"
                                HeaderText="Đĩa chống sóc" SortExpression="DiaChongSoc" UniqueName="DiaChongSoc">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DaSatCoDinhNhon" HeaderButtonType="TextButton" ColumnGroupName="LoaiThietBi"
                                HeaderText="Đà sắt có đinh nhọn" SortExpression="DaSatCoDinhNhon" UniqueName="DaSatCoDinhNhon">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Khac" HeaderButtonType="TextButton" ColumnGroupName="LoaiThietBi"
                                HeaderText="Khác" SortExpression="Khac" UniqueName="Khac">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NgayThucHien" HeaderButtonType="TextButton" 
                                HeaderText="Ngày Thực Hiện" SortExpression="NgayThucHien" UniqueName="NgayThucHien">
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
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="400px"
	                    Width="580px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-4a3">
	<ContentTemplate>
	 <br />
        
          <table align="center">
           <tr>
                <td>Vị trí trụ lắp thiết bị :</td>
                <td><telerik:RadTextBox ID="txtViTri" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
            <tr>
                 <td>Thuộc Tuyến Dây :</td>
                <td><telerik:RadComboBox ID="CBTuyenDay" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
                    
              <tr>
                <td>Giáp bọc Inox</td>
                <td><asp:CheckBox ID="txtGiapBocInox" runat="server" />

        </td>
            </tr>
             
          <tr>
                <td>Chong chóng tự quay</td>
                <td><asp:CheckBox ID="txtChongChongTuQuay" runat="server" />

        </td>
            </tr>
            
           
             <tr>
                <td>Đĩa chống sóc</td>
                <td><asp:CheckBox ID="txtDiaChongSoc" runat="server" />

        </td>
            </tr>
            <tr>
                <td>Đà sắt có đinh nhọn</td>
                <td><asp:CheckBox ID="txtDaSatCoDinhNhon" runat="server" />

        </td>
            </tr>
        
           <tr>
                <td>Khác</td>
                <td><asp:CheckBox ID="txtKhac" runat="server" />

        </td>
            </tr>
            
          
                        
           <tr>
                <td>Ngày thực hiện:</td>
                <td>  <telerik:raddatepicker ID="NgayThucHien" Runat="server" 
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
