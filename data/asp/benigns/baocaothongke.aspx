<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="baocaothongke.aspx.vb" MasterPageFile="~/hcmpcadmin.master" Inherits="hcmpc.baocaothongke" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    
        
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="toolbar-box">
	<div class="m">		
			<div class="pagetitle icon-48-excel"><h2>Báo Cáo Thống Kê</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">
        <fieldset id="filter-bar">
        <div class="filter-search fltlft">            
		     <select onchange="this.form.submit()" class="inputbox" id="KieuBaoCao" runat="Server">
				    <option value="-1">- Chọn thống kê báo cáo -</option>
				    <%--<option value="1">Tin tức đề mục</option>
                    <option value="2">Quảng cáo</option>                    
                    <option value="3">Tin tức chi tiết</option>
                    <option value="4">Tác giả</option>
                    <option value="5">Phim, Ảnh phóng sự, EVNHCMC qua ảnh</option>--%>
			</select>
              Từ ngày    
                    &nbsp;
                    <telerik:RadDatePicker ID="txtTuNgay" DateInput-ReadOnly="true" runat="server" Culture="vi-VN"
                    DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2013-01-01"
                    AutoPostBack=true>
                    </telerik:RadDatePicker>
               
                    Đến ngày        
               
                    &nbsp;
                    <telerik:RadDatePicker ID="txtDenNgay" DateInput-ReadOnly="true" runat="server" Culture="vi-VN"
                    DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" AutoPostBack=true>
                    </telerik:RadDatePicker>

                    <select onchange="this.form.submit()" class="inputbox" id="TheoNgayThangNam" runat="Server">
				    <option value="1">Theo Ngày</option>
				    <option value="2">Theo Tháng/Năm</option>
                    
			</select>
                    </div>
          <div class="filter-select fltrt">
            <asp:Button ID="btnXuatExcel" runat="server" Width="80" Text="Xuất Excel" ></asp:Button>
          </div>
		    
	    </fieldset>
        <link rel="stylesheet" href="css/grid.css" type="text/css" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                    <telerik:RadGrid ID="GridBCTTThongKe" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
             Height="600px"  >

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
                        Font-Italic="False"   DataKeyNames="section_ID" 
                         Caption="THỐNG KÊ TIN TỨC THEO ĐỀ MỤC"
                       >
                       <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>


                    
                                
                        <Columns>                            
                            <telerik:GridBoundColumn DataField="STT" HeaderText="STT" UniqueName="STT"
                                Visible="false">
                            </telerik:GridBoundColumn>                                               
                            <telerik:GridButtonColumn CommandName="title" DataTextField="title" Text="title"
                                UniqueName="title" HeaderText="Đề Mục">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100" />
                            </telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="Thang1" HeaderText="Tháng 1">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang2" HeaderText="Tháng 2">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang3" HeaderText="Tháng 3">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang4" HeaderText="Tháng 4">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang5" HeaderText="Tháng 5">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang6" HeaderText="Tháng 6">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang7" HeaderText="Tháng 7">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang8" HeaderText="Tháng 8">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang9" HeaderText="Tháng 9">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang10" HeaderText="Tháng 10">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang11" HeaderText="Tháng 11">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang12" HeaderText="Tháng 12">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 


                            <telerik:GridBoundColumn DataField="TongCong" HeaderText="Tổng Cộng">    
                                <HeaderStyle Font-Bold="true" Width="100" />                                                   
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="LuotTruyCap" HeaderText="Lượt Truy Cập">    
                                <HeaderStyle Font-Bold="true" Width="100" />                                                   
                            </telerik:GridBoundColumn>                                                            
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>


              


                

            <telerik:RadGrid ID="GridThongKeBCChiTiet" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True">
       
         <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="section_ID" 
                         Caption="THỐNG KÊ TIN TỨC CHI TIẾT THEO ĐỀ MỤC"
                       >
                        <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
            <GroupByExpressions>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField HeaderText="Đề Mục" FieldName="TenSection"
                           />
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldName="TenSection" SortOrder="None" ></telerik:GridGroupByField>
                    </GroupByFields>
                </telerik:GridGroupByExpression>
              
            </GroupByExpressions>
            
             <Columns>                       
                            <telerik:GridBoundColumn DataField="STT" HeaderText="STT" UniqueName="STT"
                                Visible="false">
                            </telerik:GridBoundColumn>                                               
                           <telerik:GridBoundColumn DataField="TieuDe" HeaderText="Tên Bài">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="TacGiaBaiViet" HeaderText="Tên giả bài viết">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="TacGiaAnh" HeaderText="Tác giả ảnh">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="Ngay" HeaderText="Ngày Đăng">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn>                              
                            <telerik:GridBoundColumn DataField="SoLuot" HeaderText="Lượt Truy Cập">    
                                <HeaderStyle Font-Bold="true" Width="100" />                                                   
                            </telerik:GridBoundColumn>                                                            
                        </Columns>


        </MasterTableView>
        <ClientSettings ReorderColumnsOnClient="True" AllowDragToGroup="True" AllowColumnsReorder="True">
            <Selecting AllowRowSelect="True"></Selecting>
            <Resizing AllowRowResize="True" AllowColumnResize="True" EnableRealTimeResize="True"
                ResizeGridOnColumnResize="False"></Resizing>
        </ClientSettings>
        <GroupingSettings ShowUnGroupButton="true"></GroupingSettings>
    </telerik:RadGrid>



     <telerik:RadGrid ID="GridThongKeBCQuangCao" runat="server" AutoGenerateColumns="False" GridLines="None"
                    AllowPaging="True" AllowSorting="True" PageSize="20" AllowMultiRowSelection="true">
                    <MasterTableView DataKeyNames="Banner_ID">                
                        <Columns>                            
                            <telerik:GridBoundColumn DataField="tenquangcao" HeaderText="Tên quảng cáo" UniqueName="tenquangcao"
                                Visible="true">
                            </telerik:GridBoundColumn>                                               
                            <telerik:GridImageColumn DataType="System.String" DataImageUrlFields="ImageURL"
                                DataImageUrlFormatString="../{0}" AlternateText="Customer image" DataAlternateTextField="ContactName"
                                ImageAlign="Left" ImageHeight="100px" ImageWidth="150px" HeaderText="Hình Ảnh" >
                                <HeaderStyle Font-Bold="true" width="200px"/> 
                            </telerik:GridImageColumn>
                            <telerik:GridBoundColumn DataField="NgayDang" HeaderText="Ngày đăng">    
                                <HeaderStyle Font-Bold="true" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="NgayKetThuc" HeaderText="Ngày kết thúc">    
                                <HeaderStyle Font-Bold="true" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="SoLuot" HeaderText="Số lượt người xem">    
                                <HeaderStyle Font-Bold="true"  />                                                   
                            </telerik:GridBoundColumn>                                                            
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>



                 <telerik:RadGrid ID="GridThongKeTacGia" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
             Height="600px"  >

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
                        Font-Italic="False"   DataKeyNames="STT" 
                         Caption="THỐNG KÊ TÁC GIẢ"
                       >
                       <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>


                    
                                
                        <Columns>                            
                            <telerik:GridBoundColumn DataField="STT" HeaderText="STT" UniqueName="STT"
                                Visible="false">
                            </telerik:GridBoundColumn>                                               
                            <telerik:GridButtonColumn CommandName="HoTen" DataTextField="HoTen" Text="HoTen"
                                UniqueName="title" HeaderText="Họ & Tên">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100" />
                            </telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="TenDonVi" HeaderText="Đơn Vị">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="PhongBan" HeaderText="Phòng Ban">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Email" HeaderText="Email">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Phone" HeaderText="Điện Thoại">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="SoBai" HeaderText="Số Lượng Bài Viết">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="SoAnh" HeaderText="Số Lượng Ảnh">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="STT" HeaderText="Xếp Thứ Hạng">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                                                                        
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>





                <telerik:RadGrid ID="GridThongKebBaiVietTheoTacGia" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True">
       
         <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="STT" 
                         Caption="THỐNG KÊ BÀI VIẾT THEO TÁC GIẢ"
                       >
                        <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
            <GroupByExpressions>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField HeaderText="Tác Giả" FieldName="HoTen"
                           />
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldName="HoTen" SortOrder="None" ></telerik:GridGroupByField>
                    </GroupByFields>
                </telerik:GridGroupByExpression>
              
            </GroupByExpressions>
            
             <Columns>                       
                                                                         
                           <telerik:GridBoundColumn DataField="Title" HeaderText="Tên Bài">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="ngaydang" HeaderText="Ngày Đăng">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="soluot" HeaderText="Lượt Truy Cập">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                                               
                        </Columns>


        </MasterTableView>
        <ClientSettings ReorderColumnsOnClient="True" AllowDragToGroup="True" AllowColumnsReorder="True">
            <Selecting AllowRowSelect="True"></Selecting>
            <Resizing AllowRowResize="True" AllowColumnResize="True" EnableRealTimeResize="True"
                ResizeGridOnColumnResize="False"></Resizing>
        </ClientSettings>
        <GroupingSettings ShowUnGroupButton="true"></GroupingSettings>
    </telerik:RadGrid>


               

 <telerik:RadGrid ID="GridThongKeOnlineTheoNgay" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
             Height="600px"  >

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
                        Font-Italic="False"   DataKeyNames="Ngay" 
                         Caption="THỐNG KÊ ONLINE THEO NGÀY"
                       >
                       <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>


                    
                                
                        <Columns>                            
                            <telerik:GridBoundColumn DataField="Ngay" HeaderText="Ngày" UniqueName="Ngay"                               >
                            </telerik:GridBoundColumn>                                             
                            <telerik:GridBoundColumn DataField="SoLuot" HeaderText="Số Lượt Online">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn>                                                           
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>



    <telerik:RadGrid ID="GridThongKeOnlineTheoThangNam" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
             Height="600px"  >

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
                        Font-Italic="False"   DataKeyNames="Nam" 
                         Caption="THỐNG KÊ ONLINE THEO THÁNG, NĂM"
                       >
                       <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>


                    
                                
                        <Columns>                            
                            <telerik:GridBoundColumn DataField="Nam" HeaderText="Năm">
                            </telerik:GridBoundColumn>                                             
                            <telerik:GridBoundColumn DataField="Thang1" HeaderText="Tháng 1">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang2" HeaderText="Tháng 2">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang3" HeaderText="Tháng 3">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang4" HeaderText="Tháng 4">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang5" HeaderText="Tháng 5">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang6" HeaderText="Tháng 6">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang7" HeaderText="Tháng 7">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang8" HeaderText="Tháng 8">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang9" HeaderText="Tháng 9">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang10" HeaderText="Tháng 10">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang11" HeaderText="Tháng 11">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="Thang12" HeaderText="Tháng 12">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn>                                                         
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>



 

    <telerik:RadGrid ID="GridThongKeQuanTri" runat="server" AutoGenerateColumns="False" GridLines="None"
                    AllowPaging="True" AllowSorting="True" PageSize="20" AllowMultiRowSelection="true">
                    <MasterTableView DataKeyNames="STT">                
                        <Columns>                            
                           <telerik:GridBoundColumn DataField="name" HeaderText="Tên Người Quản Trị">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn>                   
                           <telerik:GridBoundColumn DataField="DonVi" HeaderText="Đơn Vị">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="PhongBan" HeaderText="Phòng Ban">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="SDT" HeaderText="Số Điện Thoại Liên Lạc">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="NgayCap" HeaderText="Ngày Cấp">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="DeMuc" HeaderText="Quản Lý Các Đề Mục">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="CVSo" HeaderText="Cấp Theo CV Số">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                                                                                   
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>




                <telerik:RadGrid ID="GridThongKeThamDoYKien" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
             Height="600px"  >

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
                        Font-Italic="False"   DataKeyNames="STT" 
                         Caption="THỐNG KÊ THĂM DÒ Ý KIẾN"
                       >
                       <CommandItemSettings  ShowAddNewRecordButton="false" ShowRefreshButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>


                    
                                
                        <Columns>                            
                            
                            <telerik:GridBoundColumn DataField="STT" HeaderText="STT">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="QuestionText" HeaderText="Danh Sách Câu Hỏi">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="TieuChi" HeaderText="Các Tiêu Chí Khảo Sát">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="SoLuong" HeaderText="Tổng Cộng Số Phiếu">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="DateStart" HeaderText="Thời Gian Bắt Đầu">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                             <telerik:GridBoundColumn DataField="DateEnd" HeaderText="Thời Gian Kết Thúc">    
                                <HeaderStyle Font-Bold="true" Width="200" />                                                  
                            </telerik:GridBoundColumn> 
                                                          
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>




            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</div>
 <div style="display:none">
    <asp:Button ID="btnEdit" runat="server" Text="edit" />
    <asp:Button ID="btnPublish" runat="server" Text="public" />
    <asp:Button ID="btnUnPublish" runat="server" Text="unpublic" />
    <asp:Button ID="btnFeature" runat="server" Text="feature" />
    <asp:Button ID="btnDelete" runat="server" Text="delete" />    
</div>

</asp:Content>
