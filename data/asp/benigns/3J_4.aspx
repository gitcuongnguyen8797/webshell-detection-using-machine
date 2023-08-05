<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="WebForm7.aspx.vb" Inherits="niengiam.WebForm7" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
    </telerik:RadStyleSheetManager>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
    <br />
    <div align="center">
     Từ ngày:
                   <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01" Culture="vi-VN">
                       <Calendar ID="Calendar1" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-01-01" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày:
                   <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-04-24" Culture="vi-VN">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" 
                           DisplayDateFormat="dd/MM/yyyy" Runat="server" SelectedDate="2014-04-24" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
     Đơn vị :&nbsp;
                   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200">
                   </telerik:RadComboBox>
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="Office2007" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>

       <telerik:RadButton ID="BXuatExcel" runat="server" Skin="Office2007" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>
     </div>
     <br />
     <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
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
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   Caption="THỐNG KÊ SỰ CỐ LƯỚI ĐIỆN TRUNG THẾ THEO NGUYÊN NHÂN"
                       >
                         <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Theo nguyên nhân" Name="NguyenNhan" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Theo tài sản" Name="TaiSan" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                        </ColumnGroups>

                        <Columns>
                        
                             <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến dây" SortExpression="TuyenDay" UniqueName="TuyenDay" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="ctyDienLuc" HeaderButtonType="TextButton" 
                                HeaderText="Điện lực" SortExpression="ctyDienLuc" UniqueName="ctyDienLuc" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="NOCHI" HeaderButtonType="TextButton"  ColumnGroupName="NguyenNhan"
                                HeaderText="Nổ chì" SortExpression="NOCHI" UniqueName="NOCHI" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="DUTDAY" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Đứt dây" SortExpression="DUTDAY" UniqueName="DUTDAY" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PHONGSU" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Phóng sứ" SortExpression="PHONGSU" UniqueName="PHONGSU" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="PHONGSU" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Phóng sứ" SortExpression="PHONGSU" UniqueName="PHONGSU" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="DUTCODAU" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Đứt cò đấu" SortExpression="DUTCODAU" UniqueName="DUTCODAU" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="SUCOTHIETBI" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Sự cố thiết bị" SortExpression="SUCOTHIETBI" UniqueName="SUCOTHIETBI" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="SUCOCAP" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Sự cố cáp" SortExpression="SUCOCAP" UniqueName="SUCOCAP" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="DOCOT" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Đổ cột" SortExpression="DOCOT" UniqueName="DOCOT" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="SETDANH" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Sét đánh" SortExpression="SETDANH" UniqueName="SETDANH" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="CAYROI" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Cây rơi" SortExpression="CAYROI" UniqueName="CAYROI" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="VATLA" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Vật lạ" SortExpression="VATLA" UniqueName="VATLA" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="DONGVAT" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Động vật" SortExpression="DONGVAT" UniqueName="DONGVAT" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="THICONG" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Thi công" SortExpression="THICONG" UniqueName="THICONG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>
                                     
                                   <telerik:GridBoundColumn DataField="XEMANG" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Xe máng" SortExpression="XEMANG" UniqueName="XEMANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>
                                
                                       <telerik:GridBoundColumn DataField="NGUYENNHANKHAC" HeaderButtonType="TextButton" ColumnGroupName="NguyenNhan"
                                HeaderText="Nguyên nhân khác" SortExpression="NGUYENNHANKHAC" UniqueName="NGUYENNHANKHAC" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>
                                
                                  <telerik:GridBoundColumn DataField="dienluc" HeaderButtonType="TextButton" ColumnGroupName="TaiSan"
                                HeaderText="Điện lực" SortExpression="dienluc" UniqueName="dienluc" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>
                                
                            <telerik:GridBoundColumn DataField="khachhang" HeaderButtonType="TextButton" ColumnGroupName="TaiSan"
                                HeaderText="Khách hàng" SortExpression="khachhang" UniqueName="khachhang" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>
                                
                                  <telerik:GridBoundColumn DataField="tongso" HeaderButtonType="TextButton" 
                                HeaderText="Tổng số" SortExpression="tongso" UniqueName="tongso" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>  </telerik:GridBoundColumn>
                                
                                                            
                     </Columns>


                        <CommandItemSettings AddNewRecordText=""   />
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
                </telerik:RadGrid>
    
</asp:Content>
