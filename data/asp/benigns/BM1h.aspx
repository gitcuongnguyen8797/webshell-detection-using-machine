<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1h.aspx.vb" Inherits="niengiam.BM1h" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <div align="center">       
 
              Năm :&nbsp;
                   <telerik:RadComboBox ID="CboNam" Runat="server" 
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
                         Caption="CÔNG TÁC ỨNG DỤNG PSS/E">
                       
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Tiêu chí tính toán" Name="TieuChi" HeaderStyle-HorizontalAlign="Center">
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
                       
                              <telerik:GridBoundColumn DataField="HangMuc" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Hạng mục" SortExpression="HangMuc" UniqueName="HangMuc">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SuDungPSS" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Sử dụng PSS/E" SortExpression="SuDungPSS" UniqueName="SuDungPSS">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DamBaoCung" HeaderButtonType="TextButton"   ColumnGroupName="TieuChi" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đảm bảo cung cấp điện" SortExpression="DamBaoCung" UniqueName="DamBaoCung">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="ToiUuTuBu" HeaderButtonType="TextButton" ColumnGroupName="TieuChi" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tối ưu tụ bù" SortExpression="ToiUuTuBu" UniqueName="ToiUuTuBu">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="GiamTonThat" HeaderButtonType="TextButton" ColumnGroupName="TieuChi" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Giảm tổn thất" SortExpression="GiamTonThat" UniqueName="GiamTonThat">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Khac" HeaderButtonType="TextButton" ColumnGroupName="TieuChi" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Khác" SortExpression="Khac" UniqueName="Khac">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DanhGia" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đánh Giá" SortExpression="DanhGia" UniqueName="DanhGia">
                            </telerik:GridBoundColumn>
                           
                             <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
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
     </div>
     



<%--      <br />
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
    </div>   --%>



          
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="480px"
	                    Width="450px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-1h">
	<ContentTemplate>
	 <br />
        
          <table align="center">
            <tr>
                 <td>Năm:</td>
                <td><telerik:RadComboBox ID="CBNam" Runat="server"  Width="225" Skin="Office2007" >
                   </telerik:RadComboBox></td>
            </tr>

            <tr>
                <td>Hạng Mục</td>
                <td><telerik:RadTextBox ID="txtHangMuc" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
        </telerik:RadTextBox>

        </td>
            </tr>

             <tr>
                <td>Sử dụng PSS/E</td>
                <td><asp:CheckBox ID="txtSuDung" runat="server" />

        </td>
            </tr>           

    
<tr>
<td style="text-align:left;vertical-align:top">Tiêu Chí Tính Toán:</td>
<td>
          <table align="left">         
            
             <tr>
                <td><asp:CheckBox ID="txtDamBaoCung" runat="server" />
                <td>Đảm bảo cung cấp điện</td>             

        </td>
            </tr>
             
          <tr>
                <td><asp:CheckBox ID="txtToiUu" runat="server" />
                <td>Tối ưu tụ bù</td>
                

        </td>
            </tr>
            
           
             <tr>
                <td><asp:CheckBox ID="txtGiamTonThat" runat="server" />
                <td>Giảm tổn thất</td>
                

        </td>
            </tr>
           <tr>
                <td><asp:CheckBox ID="txtKhac" runat="server" />
                <td>Khác</td>               
        </td>
            </tr>

    </table>
    </td>
</tr>
             <tr>
                <td>Đánh Giá</td>
                <td><telerik:RadTextBox ID="txtDanhGia" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
        </telerik:RadTextBox>

        </td>
            </tr>
             <tr>
                <td>Ghi Chú :</td>
                <td> <telerik:RadTextBox ID="txtGhiChu" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
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
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="100px" 
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
