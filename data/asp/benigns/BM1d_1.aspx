<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1d_1.aspx.vb" Inherits="niengiam.BM1d_1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div align="center">   
    <br />
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
                       <Calendar ID="Calendar4" Skin="Office2007" UseColumnHeadersAsSelectors="False" Runat="server"
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
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
             Height="500px"  >

                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="false" SaveScrollPosition="true" FrozenColumnsCount="2"></Scrolling>
                    </ClientSettings>
                   <HeaderStyle Width="210px"></HeaderStyle>

                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id" 
                         Caption="CÔNG TÁC TÍNH TOÁN TRỊ SỐ BẢO VỆ RELAY/RECLOSER"
                       >
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>


                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Trị số chỉnh định Relay/Recloser" Name="TriSo" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="Số phát tuyến và recloser đã được tính toán" Name="SoPhatTuyen" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                       
                        </ColumnGroups>


                        <Columns>
                         <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit1" HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center"
                                Text="Cập nhật" UniqueName="Edit1"   ImageUrl="Images\Edit.gif"  >
                            </telerik:GridButtonColumn>   
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center"
                                ConfirmText="Xóa văn bản này?" Text="Delete" UniqueName="Delete"  >
                            </telerik:GridButtonColumn>
                       
                             
                             <telerik:GridCalculatedColumn UniqueName="TramTrungGian" HeaderText="Trạm Trung Gian(110kV trở lên)"
                                 DataFields="TramTrungGian, MaTram" Expression='{0} + "<br />"  + {1} '>
                             </telerik:GridCalculatedColumn>

                            <telerik:GridBoundColumn DataField="MayCat" HeaderButtonType="TextButton" HeaderStyle-Width="300px" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Máy cắt lộ ra trung thế  tại trạm trung gian" SortExpression="MayCat" UniqueName="MayCat">
                                
    
                                
                              
                                
    
                                
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TramNgat" HeaderButtonType="TextButton"  HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Trạm Ngắt" SortExpression="TramNgat" UniqueName="TramNgat">                              
<HeaderStyle Width="100px"></HeaderStyle>
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tuyến dây" SortExpression="TuyenDay" UniqueName="TuyenDay">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="NhanhRe" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Nhánh rẽ" SortExpression="NhanhRe" UniqueName="NhanhRe">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DienAp" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Điện áp (kV)" SortExpression="DienAp" UniqueName="DienAp">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DongNganMach" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Dòng ngắn mạch trên tuyến dây hoặc nhánh rẽ(kA)" SortExpression="DongNganMach" UniqueName="DongNganMach">
                            </telerik:GridBoundColumn>  
                            <telerik:GridBoundColumn DataField="BangTriSo" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Bảng trị số/Công văn số" SortExpression="BangTriSo" UniqueName="BangTriSo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayBanHanh" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ngày ban hành" SortExpression="NgayBanHanh" UniqueName="NgayBanHanh">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DonViYeuCau" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đơn vị yêu cầu tính toán" SortExpression="DonViYeuCau" UniqueName="DonViYeuCau">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NgayYeuCau" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ngày yêu cầu tính toán" SortExpression="NgayYeuCau" UniqueName="NgayYeuCau">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="LyDo" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Lý do yêu cầu tính toán" SortExpression="LyDo" UniqueName="LyDo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ThietBiBaoVe" HeaderButtonType="TextButton" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Thiết bị bảo vệ" SortExpression="ThietBiBaoVe" UniqueName="ThietBiBaoVe">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TySoBienDong" HeaderButtonType="TextButton"  ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tỷ số biến dòng" SortExpression="TySoBienDong" UniqueName="TySoBienDong">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DacTuyen" HeaderButtonType="TextButton"  ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đặc tuyến pha" SortExpression="DacTuyen" UniqueName="DacTuyen">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value1" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="I>(A)" SortExpression="value1" UniqueName="value1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value2" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="t>" SortExpression="value2" UniqueName="value2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value3" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="I>>(A)" SortExpression="value3" UniqueName="value3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value4" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="t>>(giây)" SortExpression="value4" UniqueName="value4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DacTuyen1" HeaderButtonType="TextButton"  ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đặc tuyến đất" SortExpression="DacTuyen1" UniqueName="DacTuyen1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value5" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="IE>(A)" SortExpression="value5" UniqueName="value5">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value6" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="tE>" SortExpression="value6" UniqueName="value6">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value7" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="IE>>(A)" SortExpression="value7" UniqueName="value7">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value8" HeaderButtonType="TextButton" HeaderStyle-Width="70px" ColumnGroupName="TriSo" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="tE>>(giây)" SortExpression="value8" UniqueName="value8">
                            </telerik:GridBoundColumn>                         
                            <telerik:GridBoundColumn DataField="SoPhatTuyenTuTrangTG" HeaderButtonType="TextButton" HeaderStyle-Width="100px"  ColumnGroupName="SoPhatTuyen" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số phát tuyến lộ ra từ trạm trung gian" SortExpression="SoPhatTuyenTuTrangTG" UniqueName="SoPhatTuyenTuTrangTG">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoPhatTuyenTuTramNgat" HeaderButtonType="TextButton" HeaderStyle-Width="100px" ColumnGroupName="SoPhatTuyen" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số phát tuyến lộ ra từ trạm ngắt" SortExpression="SoPhatTuyenTuTramNgat" UniqueName="SoPhatTuyenTuTramNgat">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoRECTrenTrucChinh" HeaderButtonType="TextButton" HeaderStyle-Width="100px" ColumnGroupName="SoPhatTuyen" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số REC trên trục chính" SortExpression="SoRECTrenTrucChinh" UniqueName="SoRECTrenTrucChinh">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoRECTrenNhanhRe" HeaderButtonType="TextButton"  ColumnGroupName="SoPhatTuyen" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số REC trên nhánh rẽ" SortExpression="SoRECTrenNhanhRe" UniqueName="SoRECTrenNhanhRe">
                            </telerik:GridBoundColumn>   
                                             
                             <telerik:GridHyperLinkColumn  HeaderButtonType="TextButton"  DataTextField="FileUpload" DataNavigateUrlFields="FileUpload"   HeaderStyle-Width="110px" HeaderStyle-HorizontalAlign="Center"
                            HeaderText="File Văn bản" SortExpression="FileVanBan" UniqueName="FileUpload" DataNavigateUrlFormatString="~/Upload/{0}"  >
                            </telerik:GridHyperLinkColumn>
                                                 

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

                <telerik:RadGrid ID="GridBM1d2TH" runat="server" AllowSorting="True" 
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
                        Font-Italic="False" 
                         Caption="BÁO CÁO TỔNG HỢP CÔNG TÁC TÍNH TOÁN TRỊ SỐ RELAY/RECLOSER"
                       >
                        <CommandItemSettings  ShowAddNewRecordButton="false"  />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                        
                       
                              <telerik:GridBoundColumn DataField="TramTrungGian" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Trạm trung gian 
                                (110kV trở lên)" SortExpression="TramTrungGian" UniqueName="TramTrungGian"> 
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TramNgat" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Trạm Ngắt" SortExpression="TramNgat" UniqueName="TramNgat">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tuyến Dây" SortExpression="TuyenDay" UniqueName="TuyenDay">                              
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="NhanhRe" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Nhánh Rẽ" SortExpression="NhanhRe" UniqueName="NhanhRe">                              
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoPhatTuyenTuTrangTG" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số phát tuyến lộ ra từ trạm trung gian" SortExpression="SoPhatTuyenTuTrangTG" UniqueName="SoPhatTuyenTuTrangTG">                              
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoPhatTuyenTuTramNgat" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số phát tuyến lộ ra từ trạm ngắt" SortExpression="SoPhatTuyenTuTramNgat" UniqueName="SoPhatTuyenTuTramNgat">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoRECTrenTrucChinh" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số REC trên trục chính" SortExpression="SoRECTrenTrucChinh" UniqueName="SoRECTrenTrucChinh">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoRECTrenNhanhRe" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số REC trên nhánh rẽ" SortExpression="SoRECTrenNhanhRe" UniqueName="SoRECTrenNhanhRe">                              
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
        Chọn file :
        <asp:FileUpload ID="FileImport" runat="server" Height="22px" 
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
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="450px"
	                    Width="680px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-1d-1">
	<ContentTemplate>
	 <br />
        
          <table align="center">
            <tr>
                 <td>Trạm Trung Gian(110kV trở lên)</td>
                <td><telerik:RadComboBox ID="CBTramTrungGian" Runat="server"  Width="225" Skin="Vista" autopostback="True" ontextchanged="CBTramTrungGian_TextChanged" >
                   </telerik:RadComboBox></td>
            </tr>
                    
             <tr>
                <td>Máy cắt lộ ra trung thế  tại trạm trung gian</td>
                <td><telerik:RadTextBox ID="txtMayCatLo" Runat="server" Width="220">
        </telerik:RadTextBox>

        </td>
            </tr>
            
           <tr>
                <td>Trạm Ngắt </td>
               <td><telerik:RadComboBox ID="CBTramNgat" Runat="server"  Width="225" Skin="Vista" autopostback="True" ontextchanged="CBTramNgat_TextChanged"  >
                   </telerik:RadComboBox></td>
            </tr>

             <tr>
                <td>Tuyến dây </td>
               <td><telerik:RadComboBox ID="CBTuyenDay" Runat="server"  Width="225" Skin="Vista"  autopostback="True" ontextchanged="CBTuyenDay_TextChanged">
                   </telerik:RadComboBox></td>
            </tr>
             
          <tr>
                <td>Nhánh rẽ</td>
               <td><telerik:RadComboBox ID="CBNhanhRe" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
             <tr>
                <td>Điện áp (kV)</td>
                <td><telerik:RadComboBox ID="CBDienAp" Runat="server" Width="225" Skin="Vista">
        </telerik:RadComboBox>

        </td>
            </tr>
             <tr>
                <td>Dòng ngắn mạch trên tuyến dây hoặc nhánh rẽ(kA)</td>
                <td>
        <telerik:RadNumericTextBox ID="txtDongNganMach" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
            
             <tr>
                <td>Bảng trị số/Công văn số</td>
                <td><telerik:RadTextBox ID="txtBangTriSo" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
             <tr>
                <td>Ngày Ban Hành</td>
                <td>  <telerik:raddatepicker ID="NgayBanHanh" Runat="server" 
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
                <td>Đơn Vị Yêu Cầu Tính Toán </td>
               <td><telerik:RadComboBox ID="CBDonVi" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>

            <tr>
                <td>Ngày Yêu Cầu Tính Toán</td>
                <td>  <telerik:raddatepicker ID="NgayYeuCau" Runat="server" 
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
                <td>Lý Do Yêu Cầu Tính Toán</td>
                <td><telerik:RadTextBox ID="txtLyDo" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>


             <tr>
                <td>Thiết bị bảo vệ</td>
                <td><telerik:RadTextBox ID="txtThietBi" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
             <tr>
                <td>Tỷ số biến dòng</td>
                <td><telerik:RadTextBox ID="txtTySo" Runat="server" Width="220" >
        </telerik:RadTextBox>

        </td>
            </tr>
             <tr>
                <td>Đặc tuyến pha</td>
                <td><telerik:RadTextBox ID="txtDacTuyen" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
             <tr>
                <td>I>(A)</td>
                <td><telerik:RadNumericTextBox ID="value1" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>t></td>
                <td><telerik:RadNumericTextBox ID="value2" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>I>>(A)</td>
                <td><telerik:RadNumericTextBox ID="value3" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>t>>(giây)</td>
                <td><telerik:RadNumericTextBox ID="value4" Runat="server" Width="220" >
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>Đặc tuyến đất</td>
                <td><telerik:RadTextBox ID="txtDacTuyen1" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
             <tr>
                <td>IE>(A)</td>
                <td><telerik:RadNumericTextBox ID="value5" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>tE></td>
                <td><telerik:RadNumericTextBox ID="value6" Runat="server" Width="220" >
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>IE>>(A)</td>
                <td><telerik:RadNumericTextBox ID="value7" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>tE>>(giây)</td>
                <td><telerik:RadNumericTextBox ID="value8" Runat="server" Width="220" >
        </telerik:RadNumericTextBox>

        </td>
            </tr>
             <tr>
                <td>Số phát tuyến lộ ra từ trạm trung gian</td>
                <td><telerik:RadNumericTextBox ID="txtSoPhatTuyenTuTrangTG" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
          
            <tr>
                <td>Số phát tuyến lộ ra từ trạm ngắt</td>
                <td><telerik:RadNumericTextBox ID="txtSoPhatTuyenTuTramNgat" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
            <tr>
                <td>Số REC trên trục chính</td>
                <td><telerik:RadNumericTextBox ID="txtSoRECTrenTrucChinh" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
            <tr>
                <td>Số REC trên nhánh rẽ</td>
                <td><telerik:RadNumericTextBox ID="txtSoRECTrenNhanhRe" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
                       
            <tr>
                 <td>File Văn Bản :</td>
                <td><asp:FileUpload ID="FileUploadControl" runat="server" Width="220" /></td>
            </tr>
            
              
           
              <tr>
            <td></td>
            </tr>
            <tr>
                <td align="right"><telerik:RadButton ID="BOK" runat="server" Text="OK"  Width="100px" 
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
