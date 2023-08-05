<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1g.aspx.vb" Inherits="niengiam.BM1g" %>
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
                        Caption="CÔNG TÁC KHÔI PHỤC CHẾ ĐỘ VẬN HÀNH TỰ ĐỘNG CỦA CÁC BỘ OLTC"
                       >
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

                         <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Chế độ vận hành hiện tại" Name="CheDoVanHanh" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                       
                        </ColumnGroups>


                        <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="LichSu" HeaderStyle-Width="50px"  HeaderStyle-HorizontalAlign="Center"
                                Text="Lịch Sử" UniqueName="ColumnLichSu"   ImageUrl="Images\notice-info.png"  >
                            </telerik:GridButtonColumn>   
                          <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center"
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>   
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center"
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                       
                             <telerik:GridCalculatedColumn UniqueName="Tram" HeaderText="Trạm"
                                 DataFields="Tram, MaTram" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>

                            <telerik:GridBoundColumn DataField="MayBienThe" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Máy Biến Thế" SortExpression="MayBienThe" UniqueName="MayBienThe">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="mAuto" HeaderButtonType="TextButton"   ColumnGroupName="CheDoVanHanh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Auto" SortExpression="mAuto" UniqueName="mAuto">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="mManual" HeaderButtonType="TextButton"  ColumnGroupName="CheDoVanHanh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="manual" SortExpression="mManual" UniqueName="mManual">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="PhuongAn" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Phương án vận hành tự động" SortExpression="PhuongAn" UniqueName="PhuongAn">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NgayBatDau" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Thời điểm vận hành" SortExpression="NgayBatDau" UniqueName="NgayBatDau">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayKetThuc" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Thời gian dự kiến xử lý" SortExpression="NgayKetThuc" UniqueName="NgayKetThuc">
                            </telerik:GridBoundColumn>                            
                            
                             <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ghi chú" SortExpression="GhiChu" UniqueName="GhiChu">
                            </telerik:GridBoundColumn>  
                            
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="HoanThanh"  HeaderStyle-HorizontalAlign="Center"
                                ConfirmText="Xác nhận hoàn thành?" Text="Hoàn Thành" UniqueName="columnHoanThanh"   ImageUrl="Images\complete.png"  >
                            </telerik:GridButtonColumn>                          

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
   

          
    <div>
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="335px"
	                    Width="500px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-1g">
	<ContentTemplate>
	 <br />
        
          <table align="center">
             <tr>
                 <td>Trạm</td>
                <td><telerik:RadComboBox ID="CBTram" Runat="server"  Width="225" Skin="Vista"  autopostback="True" ontextchanged="CBTram_TextChanged">
                   </telerik:RadComboBox></td>
            </tr>
            
          
               <tr>
                 <td>Máy Biến Thế</td>
                <td><telerik:RadComboBox ID="CBMayBienThe" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
             
          <tr>
                 <td>Chế độ vận hành hiện tại</td>
                <td><telerik:RadComboBox ID="CBCheDo" Runat="server"  Width="225" Skin="Vista"  autopostback="True" ontextchanged="CBCheDo_TextChanged">
                   </telerik:RadComboBox></td>
            </tr>
            
           
             <tr>
                <td>Phương án vận hành tự động</td>
                <td><telerik:RadTextBox ID="txtPhuongAn" Runat="server" Width="220" TextMode="MultiLine" Rows="3">
        </telerik:RadTextBox>

        </td>
            </tr>
           <tr>
                <td>Thời điểm vận hành</td>
                <td>  <telerik:raddatepicker ID="NgayBatDau" Runat="server" 
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
                <td>Thời gian dự kiến xử lý</td>
                <td>  <telerik:raddatepicker ID="NgayKetThuc" Runat="server" 
         Skin="Web20">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>

        </td>
            </tr>
           
             <tr>
                <td>Ghi Chú :</td>
                <td> <telerik:RadTextBox ID="txtGhiChu" Runat="server" Width="220">
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







     <div>
      <telerik:RadWindow ID="PopUpLichSu" runat="server" VisibleOnPageLoad="false" Height="500px"
	                    Width="700px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Lịch Sử">
	<ContentTemplate>
	 <br />
         <table align="center">
         <tr>
         <td>
                      <div align="center">   
    
             Từ ngày:
                               <telerik:raddatepicker ID="LSDateTuNgay" Runat="server" 
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
                               <telerik:raddatepicker ID="LSDateDenNgay" Runat="server" 
                     Skin="Web20">
                                   <Calendar ID="Calendar4" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                                       UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                                   </Calendar>
                                   <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                                   </DateInput>
                                   <DatePopupButton HoverImageUrl="" ImageUrl="" />
                               </telerik:raddatepicker>
 

                                <telerik:RadButton ID="LSTimKiem" runat="server" Skin="Office2007" Text="Tìm Kiếm" 
                     Width="100px" >
                 </telerik:RadButton>


                   <telerik:RadButton ID="LSXuat" runat="server" Text="Xuất Excel"  Width="100px" 
                                Skin="Office2007" OnClick="BXuat_Click">
                               </telerik:RadButton>
                </div>
         </td>
         </tr>
             <tr>
                 <td>               
          <div>
       <telerik:RadGrid ID="GridLichSu" runat="server" AllowSorting="True" 
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
                        Caption="Lịch Sử"
                       >
                        <CommandItemSettings   ShowAddNewRecordButton="false" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                        
        
                              <telerik:GridBoundColumn DataField="Tram" HeaderButtonType="TextButton" 
                                HeaderText="Trạm" SortExpression="Tram" UniqueName="Tram">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MayBienThe" HeaderButtonType="TextButton" 
                                HeaderText="Máy Biến Thế" SortExpression="MayBienThe" UniqueName="MayBienThe">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="CheDoVanHanh" HeaderButtonType="TextButton" 
                                HeaderText="Chế độ vận hành" SortExpression="CheDoVanHanh" UniqueName="CheDoVanHanh">                              
                            </telerik:GridBoundColumn>                           
                             <telerik:GridBoundColumn DataField="PhuongAn" HeaderButtonType="TextButton" 
                                HeaderText="Phương án vận hành tự động" SortExpression="PhuongAn" UniqueName="PhuongAn">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NgayBatDau" HeaderButtonType="TextButton" 
                                HeaderText="Thời điểm vận hành" SortExpression="NgayBatDau" UniqueName="NgayBatDau">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayKetThuc" HeaderButtonType="TextButton" 
                                HeaderText="Thời gian dự kiến xử lý" SortExpression="NgayKetThuc" UniqueName="NgayKetThuc">
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="NgayChinhSua" HeaderButtonType="TextButton" 
                                HeaderText="Ngày Chỉnh Sửa" SortExpression="NgayChinhSua" UniqueName="NgayChinhSua">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NguoiNhap" HeaderButtonType="TextButton" 
                                HeaderText="Người Nhập" SortExpression="NguoiNhap" UniqueName="NguoiNhap">
                            </telerik:GridBoundColumn>                            
                            
                             <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton" 
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
     </td>
     </tr>
      <tr>
                <td><telerik:RadButton ID="RadButton1" runat="server" Text="Close"  Width="100px" 
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
