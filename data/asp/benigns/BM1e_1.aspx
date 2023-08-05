<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1e_1.aspx.vb" Inherits="niengiam.BM1e_1" %>
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
                        <Scrolling AllowScroll="True" UseStaticHeaders="False" SaveScrollPosition="true" FrozenColumnsCount="2"></Scrolling>
                    </ClientSettings>
                   <HeaderStyle Width="210px"></HeaderStyle>
                  
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="Id" 
                        Caption="CÔNG TÁC CHỈNH ĐỊNH TRỊ SỐ BẢO VỆ RELAY/RECLOSER/CHÌ TRUNG THẾ"
                       >
                        <CommandItemSettings AddNewRecordText="Thêm Mới"/>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Trị số chỉnh định Relay/Recloser" Name="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="Trị số chì trung thế" Name="TriSoChi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                         <telerik:GridColumnGroup HeaderText="Khả năng phối hợp bảo vệ" Name="KhaNang" HeaderStyle-HorizontalAlign="Center">
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


                            <telerik:GridBoundColumn DataField="TramNgat" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Trạm Ngắt" SortExpression="TramNgat" UniqueName="TramNgat">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MayCat" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Máy cắt lộ ra trung thế  tại trạm trung gian" SortExpression="MayCat" UniqueName="MayCat">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
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
                            <telerik:GridBoundColumn DataField="NgayThucHien" HeaderButtonType="TextButton" ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ngày thực hiện chỉnh định" SortExpression="NgayThucHien" UniqueName="NgayThucHien">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ThietBiBaoVe" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Thiết bị bảo vệ" SortExpression="ThietBiBaoVe" UniqueName="ThietBiBaoVe">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TySoBienDong" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tỷ số biến dòng" SortExpression="TySoBienDong" UniqueName="TySoBienDong">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DatTuyen" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đặt tuyến pha" SortExpression="DatTuyen" UniqueName="DatTuyen">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value1" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="I>(A)" SortExpression="value1" UniqueName="value1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value2" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="t>" SortExpression="value2" UniqueName="value2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value3" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="I>>(A)" SortExpression="value3" UniqueName="value3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value4" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="t>>(giây)" SortExpression="value4" UniqueName="value4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DacTuyen" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đặc tuyến đất" SortExpression="DacTuyen" UniqueName="DacTuyen">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value5" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="IE>(A)" SortExpression="value5" UniqueName="value5">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value6" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="tE>" SortExpression="value6" UniqueName="value6">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value7" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="IE>>(A)" SortExpression="value7" UniqueName="value7">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="value8" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="tE>>(giây)" SortExpression="value8" UniqueName="value8">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LyDo" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Lý do chỉnh định" SortExpression="LyDo" UniqueName="LyDo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DonViThucHien" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChinhDinh" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Đơn vị thực hiện chỉnh định" SortExpression="DonViThucHien" UniqueName="DonViThucHien">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ThietBiBaoVe2" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChi" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Thiêt bị bảo vệ" SortExpression="ThietBiBaoVe2" UniqueName="ThietBiBaoVe2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DongDienDinhMuc" HeaderButtonType="TextButton"  ColumnGroupName="TriSoChi" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Dòng điện định mức(A)" SortExpression="DongDienDinhMuc" UniqueName="DongDienDinhMuc">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoLanVuotLenMC" HeaderButtonType="TextButton" HeaderStyle-Width="150px" ColumnGroupName="KhaNang" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số lần bật vượt cấp lên MC đầu nguồn" SortExpression="SoLanVuotLenMC" UniqueName="SoLanVuotLenMC">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoLanVuotLenREC" HeaderButtonType="TextButton" HeaderStyle-Width="150px" ColumnGroupName="KhaNang" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số lần bật vượt cấp lên REC" SortExpression="SoLanVuotLenREC" UniqueName="SoLanVuotLenREC">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TacDong" HeaderButtonType="TextButton"  ColumnGroupName="KhaNang" HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tác động chọn lọc" SortExpression="TacDong" UniqueName="TacDong">
                            </telerik:GridBoundColumn>
                        
                             <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Ghi Chú" SortExpression="GhiChu" UniqueName="GhiChu">
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

                 <telerik:RadGrid ID="GridBM1e2TH" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False"                     
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0"  >
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
                         Caption="BÁO CÁO TỔNG HỢP CÔNG TÁC CHỈNH ĐỊNH TRỊ SỐ"
                       >
                        <CommandItemSettings  ShowAddNewRecordButton="false"  />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
                        <Columns>
                        
                       
                              <telerik:GridBoundColumn DataField="DienLuc" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Công Ty Điện Lực" SortExpression="DienLuc" UniqueName="DienLuc">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoLanVuotLenMC" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số lần bật vượt cấp lên MC đầu nguồn" SortExpression="SoLanVuotcapLenMC" UniqueName="SoLanVuotcapLenMC">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoLanVuotLenREC" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Số lần bật vượt cấp lên REC " SortExpression="SoLanVuotCapLenREC" UniqueName="SoLanVuotCapLenREC">                              
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="TacDong" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center"
                                HeaderText="Tác Động Chọn Lọc" SortExpression="SoLanVuotCapLenREC" UniqueName="SoLanVuotCapLenREC">                              
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                          
                         
                                                                         

                     </Columns>
                        
                    
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
                </telerik:RadGrid>

     </div>
    


    <br />
     <div align="center">
        Chọn file :<asp:FileUpload ID="FileImport" runat="server" Height="22px" 
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
      <telerik:RadWindow ID="PopupThongKe" runat="server" VisibleOnPageLoad="false" Height="520px"
	                    Width="620px" Modal="true" BackColor="#DADADA" VisibleStatusbar="false" Behaviors="None" Title="Chỉnh Sửa BM-1e-1">
	<ContentTemplate>
	 <br />
        
          <table align="center">
            <tr>
                 <td>Trạm Trung Gian(110kV trở lên)</td>
                <td><telerik:RadComboBox ID="CBTramTrungGian" Runat="server"  Width="225" Skin="Vista"  autopostback="True" ontextchanged="CBTramTrungGian_TextChanged" >
                   </telerik:RadComboBox></td>
            </tr>
            <tr>
                <td>Trạm Ngắt </td>
               <td><telerik:RadComboBox ID="CBTramNgat" Runat="server"  Width="225" Skin="Vista" autopostback="True" ontextchanged="CBTramNgat_TextChanged"  >
                   </telerik:RadComboBox></td>
            </tr>         
             <tr>
                <td>Máy cắt lộ ra trung thế  tại trạm trung gian</td>
                <td><telerik:RadTextBox ID="txtMayCatLo" Runat="server" Width="220">
        </telerik:RadTextBox>

        </td>
            </tr>
            
          
             <tr>
                <td>Tuyến dây </td>
               <td><telerik:RadComboBox ID="CBTuyenDay" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
             
          <tr>
                <td>Nhánh rẽ</td>
               <td><telerik:RadComboBox ID="CBNhanhRe" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>
            </tr>
             <tr>
                <td>Điện áp (kV)</td>
                <td><telerik:RadComboBox ID="CBDienAp" Runat="server" Width="225" Skin="Vista" >
        </telerik:RadComboBox>

        </td>
            </tr>
             <tr>
                <td>Dòng ngắn mạch trên tuyến dây hoặc nhánh rẽ(kA)</td>
                <td> <telerik:RadNumericTextBox ID="txtDongNganMach" Runat="server" Width="220">
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
                <td>Ngày Thực Hiện Chỉnh Định</td>
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
                <td>Đặt tuyến pha</td>
                <td><telerik:RadTextBox ID="txtDatTuyen" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
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
                <td><telerik:RadTextBox ID="txtDacTuyen" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
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
                <td>Lý do chỉnh định</td>
                <td><telerik:RadTextBox ID="txtLyDo" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
            <tr>
                <td>Đơn vị thực hiện chỉnh định</td>
                 <td><telerik:RadComboBox ID="CBDonVi" Runat="server"  Width="225" Skin="Vista"  >
                   </telerik:RadComboBox></td>

        </td>
            </tr>
            <tr>
                <td>Thiêt bị bảo vệ</td>
                <td><telerik:RadTextBox ID="txtThietBi2" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadTextBox>

        </td>
            </tr>
            <tr>
                <td>Dòng điện định mức(A)</td>
                <td><telerik:RadTextBox ID="txtDongDien" Runat="server" Width="220">
        </telerik:RadTextBox>

        </td>
            </tr>
            <tr>
                <td>Số lần bật vượt cấp lên MC đầu nguồn</td>
                <td><telerik:RadNumericTextBox ID="txtVuotLenMC" Runat="server" Width="220">
        </telerik:RadNumericTextBox>

        </td>
            </tr>
            <tr>
                <td>Số lần bật vượt cấp lên REC</td>
                <td><telerik:RadNumericTextBox ID="txtVuotLenREC" Runat="server" Width="220" >
        </telerik:RadNumericTextBox>

        </td>
            </tr>
<tr>
                <td>Tác động chọn lọc</td>
                <td><telerik:RadNumericTextBox ID="txtTacDong" Runat="server" Width="220" TextMode="MultiLine" Rows="2">
        </telerik:RadNumericTextBox>

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
