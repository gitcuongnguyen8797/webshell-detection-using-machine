<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1d_2.aspx.vb" Inherits="niengiam.BM1d_2" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     Từ ngày:
                   <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
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
         Skin="Web20">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>


                    <telerik:RadButton ID="BTimKiem" runat="server" Skin="Web20" Text="Tổng Hợp" 
         Width="185px">
     </telerik:RadButton>
   
    
       <telerik:RadButton ID="BXuat" runat="server" Text="Xuất Excel"  Width="150px" 
                       style="height: 26px" Skin="Office2007" OnClick="BXuat_Click">
                   </telerik:RadButton>
    

   
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
                        Font-Italic="False" 
                         Caption="BÁO CÁO TỔNG HỢP CÔNG TÁC TÍNH TOÁN TRỊ SỐ RELAY/RECLOSER"
                       >
                        <CommandItemSettings  ShowAddNewRecordButton="false"  />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                        
                       
                              <telerik:GridBoundColumn DataField="TramTrungGian" HeaderButtonType="TextButton" 
                                HeaderText="Trạm trung gian 
                                (110kV trở lên)" SortExpression="TramTrungGian" UniqueName="TramTrungGian">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TramNgat" HeaderButtonType="TextButton" 
                                HeaderText="Trạm Ngắt" SortExpression="TramNgat" UniqueName="TramNgat">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến Dây" SortExpression="TuyenDay" UniqueName="TuyenDay">                              
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="NhanhRe" HeaderButtonType="TextButton" 
                                HeaderText="Nhánh Rẽ" SortExpression="NhanhRe" UniqueName="NhanhRe">                              
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoPhatTuyenTuTrangTG" HeaderButtonType="TextButton" 
                                HeaderText="Số phát tuyến lộ ra từ trạm trung gian" SortExpression="SoPhatTuyenTuTrangTG" UniqueName="SoPhatTuyenTuTrangTG">                              
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoPhatTuyenTuTramNgat" HeaderButtonType="TextButton" 
                                HeaderText="Số phát tuyến lộ ra từ trạm ngắt" SortExpression="SoPhatTuyenTuTramNgat" UniqueName="SoPhatTuyenTuTramNgat">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoRECTrenTrucChinh" HeaderButtonType="TextButton" 
                                HeaderText="Số REC trên trục chính" SortExpression="SoRECTrenTrucChinh" UniqueName="SoRECTrenTrucChinh">                              
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoRECTrenNhanhRe" HeaderButtonType="TextButton" 
                                HeaderText="Số REC trên nhánh rẽ" SortExpression="SoRECTrenNhanhRe" UniqueName="SoRECTrenNhanhRe">                              
                            </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="TenDonVi" HeaderButtonType="TextButton" 
                                HeaderText="Đơn Vị" SortExpression="TenDonVi" UniqueName="TenDonVi">
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
          
    <div>
    
    </div>
      
      <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
