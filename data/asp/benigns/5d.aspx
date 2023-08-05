<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="5d.aspx.vb" Inherits="niengiam.WebForm1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>
    <p>
        &nbsp;<br />
   </p>
   <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
</telerik:RadScriptManager>


   <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
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
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"   
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   DataKeyNames="DienLuc" 
                       >
                        <CommandItemSettings AddNewRecordText=""   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                              <telerik:GridBoundColumn DataField="DienLuc" HeaderButtonType="TextButton" 
                                HeaderText="Điện Lực" SortExpression="DienLuc" UniqueName="DienLuc">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoLanMatDien" HeaderButtonType="TextButton" 
                                HeaderText="Số Lần Mất điện" SortExpression="SoLanMatDien" UniqueName="SoLanMatDien">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="LTTSoVH" HeaderButtonType="TextButton" 
                                HeaderText="Sổ VH LTT" SortExpression="LTTSoVH" UniqueName="LTTSoVH">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="LTTChuongTrinh" HeaderButtonType="TextButton" 
                                HeaderText="Chương trình LTT" SortExpression="LTTChuongTrinh" UniqueName="LTTChuongTrinh">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="LTTTiLe" HeaderButtonType="TextButton" 
                                HeaderText="Tỉ Lệ LTT" SortExpression="LTTTiLe" UniqueName="LTTTiLe">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DTTSoVH" HeaderButtonType="TextButton" 
                                HeaderText="Sổ VH Trung thế" SortExpression="DTTSoVH" UniqueName="DTTSoVH">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DTTChuongTrinh" HeaderButtonType="TextButton" 
                                HeaderText="Chương trình Trung thế" SortExpression="DTTChuongTrinh" UniqueName="DTTChuongTrinh">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="DTTTiLe" HeaderButtonType="TextButton" 
                                HeaderText="Tỉ Lệ Trung thế" SortExpression="DTTTiLe" UniqueName="DTTTiLe">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="HTSoVH" HeaderButtonType="TextButton" 
                                HeaderText="Sổ VH hạ thế" SortExpression="HTSoVH" UniqueName="HTSoVH">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HTChuongTrinh" HeaderButtonType="TextButton" 
                                HeaderText="Chương trình hạ thế" SortExpression="HTChuongTrinh" UniqueName="HTChuongTrinh">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HTTiLe" HeaderButtonType="TextButton" 
                                HeaderText="Tỉ lệ hạ thế" SortExpression="HTTiLe" UniqueName="HTTiLe">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HieuChinh" HeaderButtonType="TextButton" 
                                HeaderText="Hiệu chỉnh" SortExpression="HieuChinh" UniqueName="HieuChinh">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Huy" HeaderButtonType="TextButton" 
                                HeaderText="Hủy" SortExpression="Huy" UniqueName="Huy">
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
</asp:Content>
