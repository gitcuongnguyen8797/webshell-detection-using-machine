<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_5a.aspx.vb" Inherits="niengiam.BM5a" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div.RadGrid .rgPager .rgAdvPart     
        {     
            display:none;        
        } 
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày : 
        <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        Đơn vị :   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200">
                   </telerik:RadComboBox>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <telerik:RadButton ID="BTimKiem" runat="server" Text="Tìm kiếm"  Skin="Office2007" Width="100px">
     </telerik:RadButton>
        <telerik:RadButton ID="Btn_Xuatexcel" runat="server" Text="Xuất excel" 
             Skin="Office2007"   Width="100px">
        </telerik:RadButton>
        <telerik:RadButton ID="Btn_XuatLichsu" runat="server" Text="Xuất Lịch Sử" 
             Skin="Office2007"   Width="100px" Visible="False">
        </telerik:RadButton>
    </div>
    <br />

    <div>
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
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
                     <MasterTableView AllowMultiColumnSorting="True"  DataKeyNames="Id" 
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="TỔNG HỢP TÌNH HÌNH TRANG BỊ THIẾT BỊ CHỈ BÁO SỰ CỐ LƯỚI TRUNG THẾ">
                        <CommandItemSettings AddNewRecordText="Thêm mới" 
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
                            <telerik:GridColumnGroup HeaderText="Thu thập tín hiệu SCADA" Name="TinhieuScada" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Kết nối SCADA" Name="KetnoiScada" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="A2" Name="A2Tinhieu" HeaderStyle-HorizontalAlign="Center" ParentGroupName="TinhieuScada">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="TTĐĐ TP" Name="TTĐĐTPTINHIEU" HeaderStyle-HorizontalAlign="Center" ParentGroupName="TinhieuScada">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="A2" Name="A2Ketnoi" HeaderStyle-HorizontalAlign="Center" ParentGroupName="KetnoiScada">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="TTĐĐ TP" Name="TTĐĐTPKETNOI" HeaderStyle-HorizontalAlign="Center" ParentGroupName="KetnoiScada">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            
                        </ColumnGroups>

                           <Columns>


             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Log" HeaderStyle-Width="50px"  HeaderStyle-HorizontalAlign="Center"
                                Text="Log" UniqueName="Log"   ImageUrl="Images\notice-info.png"  >
                            </telerik:GridButtonColumn> 

            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" 
                 Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif">                
            </telerik:GridButtonColumn>

             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" 
                 Text="X" UniqueName="Delete"  ConfirmText="Bạn muốn xóa dữ liệu không?">                
            <HeaderStyle Width="50px"></HeaderStyle>
               </telerik:GridButtonColumn>

            <telerik:GridBoundColumn DataField="Id" HeaderText="Id" HeaderButtonType="TextButton"
            SortExpression="Id" UniqueName="Id" Visible="false">
            </telerik:GridBoundColumn>
           
           <telerik:GridCalculatedColumn UniqueName="Tram" HeaderText="Trạm" DataType="System.String" HeaderStyle-Width="120px"
                                 DataFields="TENTRAM, MATRAM" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>
           
            <telerik:GridCheckBoxColumn UniqueName="A2_DTH" HeaderText="Đủ tín hiệu"  HeaderButtonType="TextButton"   ColumnGroupName="A2Tinhieu"
            DataField="A2_DTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_TTH" HeaderText="Thiếu tín hiệu"   HeaderButtonType="TextButton"   ColumnGroupName="A2Tinhieu"
            DataField="A2_TTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_CCTH" HeaderText="Chưa có tín hiệu"   HeaderButtonType="TextButton"   ColumnGroupName="A2Tinhieu"
            DataField="A2_CCTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            
            <telerik:GridCheckBoxColumn UniqueName="TTDD_DTH" HeaderText="Đủ tín hiệu"  HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPTINHIEU"
            DataField="TTDD_DTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_TTH" HeaderText="Thiếu tín hiệu" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPTINHIEU"
            DataField="TTDD_TTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_CCTH" HeaderText="Chưa có tín hiệu" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPTINHIEU"
            DataField="TTDD_CCTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            
             <telerik:GridBoundColumn DataField="KeHoachThucHien" HeaderText="Kế hoạch thực hiện" HeaderButtonType="TextButton"   ColumnGroupName="TinhieuScada"
            SortExpression="KeHoachThucHien" UniqueName="KeHoachThucHien">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField="tendonvithuchien" HeaderText="Đơn vị thực hiện" HeaderButtonType="TextButton"   ColumnGroupName="TinhieuScada"
            SortExpression="tendonvithuchien" UniqueName="tendonvithuchien">
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày thực hiện" HeaderButtonType="TextButton"   ColumnGroupName="TinhieuScada"
            SortExpression="NoiDungCT" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn> 

            <telerik:GridCheckBoxColumn UniqueName="A2_DKN" HeaderText="Đang kết nối" HeaderButtonType="TextButton"   ColumnGroupName="A2Ketnoi"
            DataField="A2_DKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_MKN" HeaderText="mất kết nối" HeaderButtonType="TextButton"   ColumnGroupName="A2Ketnoi"
            DataField="A2_MKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_CCKN" HeaderText="Chưa có kết nối" HeaderButtonType="TextButton"   ColumnGroupName="A2Ketnoi"
            DataField="A2_CCKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_DKN" HeaderText="Đang kết nối" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPKETNOI"
            DataField="TTDD_DKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_MKN" HeaderText="Mất kết nối" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPKETNOI"
            DataField="TTDD_MKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_CCKN" HeaderText="Chưa có kết nối" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPKETNOI"
            DataField="TTDD_CCKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
 
            <telerik:GridBoundColumn DataField="Kehoachxuly" HeaderText="Kế hoạch xử lý" HeaderButtonType="TextButton"   ColumnGroupName="KetnoiScada"
            SortExpression="Kehoachxuly" UniqueName="Kehoachxuly">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField="tendonvixuly" HeaderText="Đơn vị xử lý" HeaderButtonType="TextButton"   ColumnGroupName="KetnoiScada"
            SortExpression="tendonvixuly" UniqueName="tendonvixuly">
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày xử lý" HeaderButtonType="TextButton"   ColumnGroupName="KetnoiScada"
            SortExpression="Ngayxuly" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn> 
             <telerik:GridBoundColumn DataField="GhiChu" HeaderText="Ghi chú"
            SortExpression="GhiChu" UniqueName="GhiChu">
            </telerik:GridBoundColumn>         
        </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
    </telerik:RadGrid>
    </div>

     
    <br /> 
    <div style="text-align:right;">
    </div>
    <br />    
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="550px"
	                    Width="480px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" Title="BÁO CÁO CÔNG TÁC GIÁM SÁT VẬN HÀNH HỆ THỐNG SCADA">
	<ContentTemplate>
	 <br />        
        <table align="center">
            <tr>
                <td align="left">Trạm :</td>
                <td>
                    <telerik:RadComboBox ID="cboTram" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
            <tr>
                <td>Kết nối SCADA A2 Đủ tín hiệu :</td>
                <td>
                    <asp:CheckBox ID="chkA2DTH" runat="server" />
                    
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Kết nối SCADA A2 Thiếu tín hiệu :</td>
                <td>
                    <asp:CheckBox ID="chkA2TTH" Runat="server" />
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Kết nối SCADA A2 chưa có tín hiệu :</td>
                <td>
                    <asp:CheckBox ID="chkA2CCTH" runat="server" />
                </td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td>Kết nối SCADA TTĐĐ Đủ tín hiệu :</td>
                <td>
                    <asp:CheckBox ID="chkTTDDDTH" runat="server" />
                    
                </td>
            </tr>              
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Kết nối SCADA TTĐĐ Thiếu tín hiệu :</td>
                <td>
                    <asp:CheckBox ID="chkTTDDTTH" runat="server" />
                    
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Kết nối SCADA TTĐĐ chưa có tín hiệu :</td>
                <td>
                    <asp:CheckBox ID="chkTTDDCCTH" runat="server" />
                    
                </td>
            </tr> 
            <tr>
                <td></td>
            </tr>

            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Kế hoạch thực hiện :</td>
                
                   <td><telerik:RadTextBox ID="txtKehoachTH" Runat="server" Width="220">
                </telerik:RadTextBox></td>
                    
                
            </tr> 
             <tr>
                <td></td>
            </tr>

            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Đơn vị thực hiện :</td>
                
                   <td>
                   <telerik:RadComboBox ID="cboDonviThuchien" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
                    
                
            </tr> 

             <tr>
                <td></td>
            </tr>
            <tr>
                <td>Ngày thực hiện :</td>
                <td>
                    <telerik:raddatepicker ID="NgayTH" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar4" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>

            <tr>
                 <td>Kết nối SCADA A2 Đang kết nối :</td>
                <td>
                    <asp:CheckBox ID="chkA2DKN" runat="server" />
                    
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Kết nối SCADA A2 mất kết nối :</td>
                <td>
                    <asp:CheckBox ID="chkA2MKN" runat="server" />
                    
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
            <tr>
                <td>Kết nối SCADA A2 chưa có kết nối :</td>
                <td>
                    <asp:CheckBox ID="chkA2CCKN" runat="server" />
                    
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
             <tr>
                 <td>Kết nối SCADA TTĐĐ Đang kết nối :</td>
                <td>
                    <asp:CheckBox ID="chkTTDDDKN" runat="server" />
                    
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
              <tr>
                <td>Kết nối SCADA TTĐĐ mất kết nối :</td>
                <td>
                    <asp:CheckBox ID="chkTTDDMKN" runat="server" />
                    
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
              <tr>
                <td>Kết nối SCADA TTĐĐ chưa có kết nối :</td>
                <td>
                    <asp:CheckBox ID="chkTTDDCCKN" runat="server" />
                    
                </td>
            </tr>            
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Kế hoạch xử lý:</td>
                <td><telerik:RadTextBox ID="txtKehoachXL" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
                </telerik:RadTextBox></td>
           </tr>

             <tr>
                <td></td>
            </tr>
            <tr>
                <td>Đơn vị xử lý :</td>
                
                   <td>
                   <telerik:RadComboBox ID="cboDonviXuly" Runat="server" Width="220">
                   </telerik:RadComboBox>
                </td>
                    
                
            </tr> 

           <tr>
                <td></td>
            </tr>
            <tr>
                <td>Ngày xử lý :</td>
                <td>
                    <telerik:raddatepicker ID="NgayXL" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar3" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                </td>
            </tr>
          
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Ghi chú:</td>
                <td><telerik:RadTextBox ID="txtGhiChu" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
                </telerik:RadTextBox></td>
           </tr>
           <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
           <tr>
            <td align="right">
                    <telerik:RadButton ID="BOK" runat="server" Text="OK"   Width="100px" 
                       Skin="Office2007" OnClick="BOK_Click">
                    </telerik:RadButton>
                </td>
                <td>
                    <telerik:RadButton ID="BThoat" runat="server" Text="Thoát"   Width="100px" 
                       Skin="Office2007" OnClick="BThoat_Click">
                   </telerik:RadButton>
                </td>
            </tr>           
          </table>    
	</ContentTemplate>
	</telerik:RadWindow>    
    </div>

     <div align="center">
  
        <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" /> 
         <telerik:radbutton ID="Radbutton2" runat="server" Skin="WebBlue" Text="Xem trên lưới" 
         Width="100px" Visible="False" >
     </telerik:radbutton>        
     <telerik:radbutton ID="Radbutton3" runat="server" Skin="WebBlue" Text="Lưu" 
         Width="100px" Visible="False" >
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
                        Font-Italic="False"   Caption="BÁO CÁO CÔNG TÁC TỔ CHỨC LẬP KẾ HOẠCH CẮT ĐIỆN CÔNG TÁC TRÊN LƯỚI ĐIỆN">
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
        <telerik:RadWindow ID="PopUpLogUser"  runat="server" VisibleOnPageLoad="false" Height="400px"
	                    Width="1200px" Modal="true" BackColor="#DADADA" 
            VisibleStatusbar="false" Behaviors="None" 
            Title="Thông Tin Cập Nhập Dữ liệu">

       <ContentTemplate>
	 <br />
         <table align="center">
             <tr>
                 <td>  
                  <div align="center">   
    
             Từ ngày:
                               <telerik:raddatepicker ID="LSDateTuNgay" Runat="server" 
                     Skin="Web20" SelectedDate="2014-01-01">
                                   <Calendar ID="Calendar5" Skin="Office2007" UseColumnHeadersAsSelectors="False" Runat="server"
                                       UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                                   </Calendar>
                                   <DateInput ID="DateInput5" DateFormat="dd/MM/yyyy" 
                                       DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
                                   </DateInput>
                                   <DatePopupButton HoverImageUrl="" ImageUrl="" />
                               </telerik:raddatepicker>
                              Đến ngày:
                               <telerik:raddatepicker ID="LSDateDenNgay" Runat="server" 
                     Skin="Web20">
                                   <Calendar ID="Calendar6" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                                       UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                                   </Calendar>
                                   <DateInput ID="DateInput6" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                                   </DateInput>
                                   <DatePopupButton HoverImageUrl="" ImageUrl="" />
                               </telerik:raddatepicker>
 

                                <telerik:RadButton ID="LSTimKiem" runat="server" Skin="Office2007" Text="Tìm Kiếm" 
                     Width="100px" onclick="LSTimKiem_Click" >
                 </telerik:RadButton>


                   <telerik:RadButton ID="LSXuat" runat="server" Text="Xuất Excel"  Width="100px" 
                                Skin="Office2007" OnClick="BXuat_Click">
                               </telerik:RadButton>
                </div>             
          <div>
       <telerik:RadGrid ID="GridLog" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
                  Height="250px"  >
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
                        Caption="TỔNG HỢP TÌNH HÌNH TRANG BỊ THIẾT BỊ CHỈ BÁO SỰ CỐ LƯỚI TRUNG THẾ"
                       >
                        <CommandItemSettings   ShowAddNewRecordButton="false" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>

                        <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>

                        <HeaderStyle Font-Bold="False" Font-Italic="False" />
                        <FooterStyle Font-Bold="True" Font-Italic="True" />

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Thu thập tín hiệu SCADA" Name="TinhieuScadalog" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Kết nối SCADA" Name="KetnoiScadalog" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="A2" Name="A2Tinhieulog" HeaderStyle-HorizontalAlign="Center" ParentGroupName="TinhieuScadalog">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="TTĐĐ TP" Name="TTĐĐTPTINHIEUlog" HeaderStyle-HorizontalAlign="Center" ParentGroupName="TinhieuScadalog">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="A2" Name="A2Ketnoilog" HeaderStyle-HorizontalAlign="Center" ParentGroupName="KetnoiScadalog">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="TTĐĐ TP" Name="TTĐĐTPKETNOIlog" HeaderStyle-HorizontalAlign="Center" ParentGroupName="KetnoiScadalog">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            
                        </ColumnGroups> 

                        <Columns>
                        
            <telerik:GridBoundColumn DataField="tendonvi" HeaderText="Đơn vị cập nhập"
            SortExpression="tendonvi" UniqueName="tendonvi">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="TENTRAM" HeaderText="Trạm"
            SortExpression="TENTRAM" UniqueName="TENTRAM">
            </telerik:GridBoundColumn>
            
            <telerik:GridCheckBoxColumn UniqueName="A2_DTH" HeaderText="Đủ tín hiệu"  HeaderButtonType="TextButton"   ColumnGroupName="A2Tinhieulog"
            DataField="A2_DTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_TTH" HeaderText="Thiếu tín hiệu"   HeaderButtonType="TextButton"   ColumnGroupName="A2Tinhieulog"
            DataField="A2_TTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_CCTH" HeaderText="Chưa có tín hiệu"   HeaderButtonType="TextButton"   ColumnGroupName="A2Tinhieulog"
            DataField="A2_CCTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            
            <telerik:GridCheckBoxColumn UniqueName="TTDD_DTH" HeaderText="Đủ tín hiệu"  HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPTINHIEUlog"
            DataField="TTDD_DTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_TTH" HeaderText="Thiếu tín hiệu" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPTINHIEUlog"
            DataField="TTDD_TTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_CCTH" HeaderText="Chưa có tín hiệu" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPTINHIEUlog"
            DataField="TTDD_CCTH" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
            
             <telerik:GridBoundColumn DataField="KeHoachThucHien" HeaderText="Kế hoạch thực hiện" HeaderButtonType="TextButton"   ColumnGroupName="TinhieuScadalog"
            SortExpression="KeHoachThucHien" UniqueName="KeHoachThucHien">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField="TH" HeaderText="Đơn vị thực hiện" HeaderButtonType="TextButton"   ColumnGroupName="TinhieuScadalog"
            SortExpression="TH" UniqueName="TH">
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày thực hiện" HeaderButtonType="TextButton"   ColumnGroupName="TinhieuScadalog"
            SortExpression="NoiDungCT" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn> 

            <telerik:GridCheckBoxColumn UniqueName="A2_DKN" HeaderText="Đang kết nối" HeaderButtonType="TextButton"   ColumnGroupName="A2Ketnoilog"
            DataField="A2_DKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_MKN" HeaderText="mất kết nối" HeaderButtonType="TextButton"   ColumnGroupName="A2Ketnoilog"
            DataField="A2_MKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="A2_CCKN" HeaderText="Chưa có kết nối" HeaderButtonType="TextButton"   ColumnGroupName="A2Ketnoilog"
            DataField="A2_CCKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_DKN" HeaderText="Đang kết nối" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPKETNOIlog"
            DataField="TTDD_DKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_MKN" HeaderText="Mất kết nối" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPKETNOIlog"
            DataField="TTDD_MKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>

            <telerik:GridCheckBoxColumn UniqueName="TTDD_CCKN" HeaderText="Chưa có kết nối" HeaderButtonType="TextButton"   ColumnGroupName="TTĐĐTPKETNOIlog"
            DataField="TTDD_CCKN" AllowSorting="false">
            </telerik:GridCheckBoxColumn>
 
            <telerik:GridBoundColumn DataField="Kehoachxuly" HeaderText="Kế hoạch xử lý" HeaderButtonType="TextButton"   ColumnGroupName="KetnoiScadalog"
            SortExpression="Kehoachxuly" UniqueName="Kehoachxuly">
            </telerik:GridBoundColumn>  
            <telerik:GridBoundColumn DataField="XL" HeaderText="Đơn vị xử lý" HeaderButtonType="TextButton"   ColumnGroupName="KetnoiScadalog"
            SortExpression="XL" UniqueName="XL">
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="NgayThucHien" HeaderText="Ngày xử lý" HeaderButtonType="TextButton"   ColumnGroupName="KetnoiScadalog"
            SortExpression="Ngayxuly" UniqueName="NgayThucHien">
            </telerik:GridBoundColumn> 
             <telerik:GridBoundColumn DataField="GhiChu" HeaderText="Ghi chú"
            SortExpression="GhiChu" UniqueName="GhiChu">   
            </telerik:GridBoundColumn>         
            <telerik:GridBoundColumn DataField="NgayHieuchinh" HeaderText="Ngày Cập Nhập"
            SortExpression="NgayHieuchinh" UniqueName="NgayHieuchinh">
            </telerik:GridBoundColumn>
                                      

                     </Columns>
                        
                    
                        <EditFormSettings  EditFormType="Template">
                            <EditColumn UniqueName="EditCommandColumn1" >
                            </EditColumn>
                        </EditFormSettings>
                        <AlternatingItemStyle Font-Bold="False" Font-Italic="False" />
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
                </telerik:RadGrid>
     </div>
     </td>
     </tr>
      <tr>
                <td><telerik:RadButton ID="RadButton1" runat="server" Text="Thoát"  Width="100px" 
                       Skin="Office2007" OnClick="Exit_Click">
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
