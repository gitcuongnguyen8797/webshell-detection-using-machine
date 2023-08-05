<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="3J_2_1.aspx.vb" Inherits="niengiam.WebForm3" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
   <div align="center">Năm :&nbsp;
                   <telerik:RadComboBox ID="CboNam" Runat="server" 
                       Skin="Hay" 
                       Width="200px" >
                   </telerik:RadComboBox>
                    Đơn vị :&nbsp;
                   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Hay">
                   </telerik:RadComboBox>  Loại mất điện :&nbsp;
                   <telerik:RadComboBox ID="CboSuCo" Runat="server" 
                       Skin="Hay">
                       <Items>
                           <telerik:RadComboBoxItem runat="server" Text="Mất điện" Value="Mất điện" />
                           <telerik:RadComboBoxItem runat="server" Text="Sự cố" Value="Sự cố" />
                       </Items>
                   </telerik:RadComboBox>
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
       <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>
    </div> 
    <br /> 
    <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" 
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
                        Font-Italic="False"   Caption="THỐNG KÊ SỰ CỐ LƯỚI ĐIỆN TRUNG THẾ THEO THỜI GIAN"
                       >
                       <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Tháng" Name="Thang" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                        </ColumnGroups>

                        <Columns>
                        
                             <telerik:GridBoundColumn DataField="TuyenDay" HeaderButtonType="TextButton" 
                                HeaderText="Tuyến dây" SortExpression="TuyenDay" UniqueName="TuyenDay" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DienLuc" HeaderButtonType="TextButton" 
                                HeaderText="Điện lực" SortExpression="DienLuc" UniqueName="DienLuc" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="thang1" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="1" SortExpression="thang1" UniqueName="thang1" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="thang2" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="2" SortExpression="thang2" UniqueName="thang2" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang3" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="3" SortExpression="thang3" UniqueName="thang3" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang4" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="4" SortExpression="thang4" UniqueName="thang4" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang5" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="5" SortExpression="thang5" UniqueName="thang5" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang6" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="6" SortExpression="thang6" UniqueName="thang6" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang7" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="7" SortExpression="thang7" UniqueName="thang7" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang8" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="8" SortExpression="thang8" UniqueName="thang8" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang9" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="9" SortExpression="thang9" UniqueName="thang9" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang10" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="10" SortExpression="thang10" UniqueName="thang10" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang11" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="11" SortExpression="thang11" UniqueName="thang11" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="thang12" HeaderButtonType="TextButton"   ColumnGroupName="Thang"
                                HeaderText="12" SortExpression="thang12" UniqueName="thang12" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tongsovu" HeaderButtonType="TextButton"   
                                HeaderText="Tổng số vụ" SortExpression="tongsovu" UniqueName="tongsovu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="tile(%)" HeaderButtonType="TextButton"  
                                HeaderText="Tỉ lệ (%)" SortExpression="tile(%)" UniqueName="tile(%)" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
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
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <br />
   </p>
   </asp:Content>
