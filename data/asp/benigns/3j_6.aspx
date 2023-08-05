<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="3j_6.aspx.vb" Inherits="niengiam.WebForm2" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                   <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
     </telerik:RadScriptManager>
     Từ ngày:
                   <telerik:raddatepicker ID="DateTuNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-01-01">
                       <Calendar Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                           Runat="server" SelectedDate="2014-01-01" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                  Đến ngày:
                   <telerik:raddatepicker ID="DateDenNgay" Runat="server" 
         Skin="Web20" SelectedDate="2014-04-28">
                       <Calendar Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" 
                           Runat="server" SelectedDate="2014-04-28" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
                     Loại mất điện :&nbsp;
                   <telerik:RadComboBox ID="CboSuCo" Runat="server" 
                       Skin="Hay">
                       <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Mất điện" Value="Mất điện" />
                           <telerik:RadComboBoxItem runat="server" Text="Sự cố" Value="Sự cố" />
                       </Items>
                   </telerik:RadComboBox>
     Đơn vị :&nbsp;
                   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Hay" 
                       Width="200">
                   </telerik:RadComboBox>
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
        <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>

     <br />
     <br />
    <%-- <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" PageSize="20"  >
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
                        Font-Italic="False"   DataKeyNames="tuyenday"  Caption="THỐNG KÊ SỰ CỐ LƯỚI ĐIỆN TRUNG THẾ THEO TẦN SUẤT"
                       >
                        <CommandItemSettings AddNewRecordText=""  ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                              <telerik:GridBoundColumn DataField="tuyenday" HeaderButtonType="TextButton" 
                                HeaderText="Tên tuyến dây" SortExpression="tuyenday" UniqueName="tuyenday">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TanSuat" HeaderButtonType="TextButton" 
                                HeaderText="Tần suất Mất điện" SortExpression="TanSuat" UniqueName="TanSuat">
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
                </telerik:RadGrid>--%>
                <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" PageSize="20" 
                       AutoGenerateColumns="False"  >
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
                        Font-Italic="False"   Caption="THỐNG KÊ MẤT ĐIỆN LƯỚI ĐIỆN TRUNG THẾ THEO TẦN SUẤT"
                       >
                   
                  <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Số lần" Name="solan" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridColumnGroup>
               
            </ColumnGroups>
                        <Columns>
                       
                           
                              <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến dây" SortExpression="TuyenDay" UniqueName="TuyenDay" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tansuat" HeaderButtonType="TextButton" 
                                HeaderText="Tần suất mất điện" SortExpression="tansuat" UniqueName="tansuat" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="tenviettat" HeaderButtonType="TextButton" 
                                HeaderText="Điện lực" SortExpression="tenviettat" UniqueName="tenviettat" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="solan1" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="1" SortExpression="solan1" UniqueName="solan1" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan2" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="2" SortExpression="solan2" UniqueName="solan2" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan3" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="3" SortExpression="solan3" UniqueName="solan3" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan4" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="4" SortExpression="solan4" UniqueName="solan4" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan5" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="5" SortExpression="solan5" UniqueName="solan5" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan6" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="6" SortExpression="solan6" UniqueName="solan6" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan7" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="7" SortExpression="solan7" UniqueName="solan7" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan8" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="8" SortExpression="solan8" UniqueName="solan8" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan9" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="9" SortExpression="solan9" UniqueName="solan9" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solan10" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText="10" SortExpression="solan10" UniqueName="solan10" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="solanhon10" HeaderButtonType="TextButton"  ColumnGroupName="solan"
                                HeaderText=">10" SortExpression="solanhon10" UniqueName="solanhon10" HeaderStyle-HorizontalAlign="Center">
                            </telerik:GridBoundColumn>
                          
                     </Columns>
                         
                    


                        <CommandItemSettings AddNewRecordText="" ShowAddNewRecordButton="False" 
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
                </telerik:RadGrid>


    </asp:Content>
