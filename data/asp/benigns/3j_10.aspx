<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="3j_10.aspx.vb" Inherits="niengiam.WebForm10" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
  <div align="center">
  Năm :&nbsp;
                   <telerik:RadComboBox ID="CboNam" Runat="server" 
                       Skin="Hay" 
                       Width="200px" >
                   </telerik:RadComboBox>
                    Đơn vị :&nbsp;
                   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Hay">
                   </telerik:RadComboBox> 
                  
     <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
       <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px">
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
                        Font-Italic="False"   Caption="THỐNG KÊ SỰ CỐ LƯỚI ĐIỆN HẠ THẾ THEO THỜI GIAN"
                       >
                        <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Tháng" Name="Thang" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                        </ColumnGroups>

                        <Columns>
                        
                             <telerik:GridBoundColumn DataField="NguyenNhan" HeaderButtonType="TextButton" 
                                HeaderText="Nguyên nhân" SortExpression="NguyenNhan" UniqueName="NguyenNhan" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="Thang1" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="1" SortExpression="Thang1" UniqueName="Thang1" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>
                          
                            <telerik:GridBoundColumn DataField="Thang2" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="2" SortExpression="Thang2" UniqueName="Thang2" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="Thang3" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="3" SortExpression="Thang3" UniqueName="Thang3" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="Thang4" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="4" SortExpression="Thang4" UniqueName="Thang4" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="Thang5" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="5" SortExpression="Thang5" UniqueName="Thang5" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                           <telerik:GridBoundColumn DataField="Thang6" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="6" SortExpression="Thang6" UniqueName="Thang6" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                               <telerik:GridBoundColumn DataField="Thang7" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="7" SortExpression="Thang7" UniqueName="Thang7" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>


                           <telerik:GridBoundColumn DataField="Thang8" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="8" SortExpression="Thang8" UniqueName="Thang8" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>


                           <telerik:GridBoundColumn DataField="Thang9" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="9" SortExpression="Thang9" UniqueName="Thang9" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>


                           <telerik:GridBoundColumn DataField="Thang10" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="10" SortExpression="Thang10" UniqueName="Thang10" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>


                           <telerik:GridBoundColumn DataField="Thang11" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="11" SortExpression="Thang11" UniqueName="Thang11" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>


                         <telerik:GridBoundColumn DataField="Thang12" HeaderButtonType="TextButton" ColumnGroupName="Thang"
                                HeaderText="12" SortExpression="Thang12" UniqueName="Thang12" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="TongSoVu" HeaderButtonType="TextButton" 
                                HeaderText="Tổng số vụ" SortExpression="TongSoVu" UniqueName="TongSoVu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="TiLe(%)" HeaderButtonType="TextButton"
                                HeaderText="Tỉ lệ (%)" SortExpression="TiLe(%)" UniqueName="TiLe(%)" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle> </telerik:GridBoundColumn>



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
  
</asp:Content>
