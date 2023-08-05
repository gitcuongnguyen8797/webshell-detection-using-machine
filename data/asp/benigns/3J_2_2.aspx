<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="3J_2_2.aspx.vb" Inherits="niengiam.WebForm4" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


.RadComboBox_Web20
{
	font: 12px "Segoe UI", Arial, sans-serif;
	color: #000;
}

.RadComboBox
{
	vertical-align: middle;
    display: -moz-inline-stack;
    display: inline-block;
}

.RadComboBox
{
	text-align: left;
}

.RadComboBox *
{
	margin: 0;
	padding: 0;
}

.RadComboBox_Web20 .rcbReadOnly .rcbInputCellLeft { background-position: 0 0; }

.RadComboBox_Web20 .rcbInputCellLeft
{
	background-image: url('mvwres://Telerik.Web.UI, Version=2011.1.315.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Web20.ComboBox.rcbSprite.png');
}

.RadComboBox .rcbInputCellLeft
{
	background-color: transparent;
	background-repeat: no-repeat;
}

.RadComboBox_Web20 .rcbArrowCellRight
{
	background-image: url('mvwres://Telerik.Web.UI, Version=2011.1.315.40, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Web20.ComboBox.rcbSprite.png');
}

.RadComboBox .rcbArrowCellRight
{
	background-color: transparent;
	background-repeat: no-repeat;
}

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
    </telerik:RadStyleSheetManager>
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
    <div align="center">
 Năm :&nbsp;<telerik:RadComboBox ID="CboNam" Runat="server" 
                       Skin="Hay" 
                       Width="200px" Height="16px" >
                   </telerik:RadComboBox>
                    &nbsp;&nbsp;
                   <telerik:RadButton ID="BTimKiem" runat="server" Skin="WebBlue" Text="Tìm kiếm" 
         Width="100px">
     </telerik:RadButton>
      <telerik:RadButton ID="BXuatExcel" runat="server" Skin="WebBlue" Text="Xuất excel" 
         Width="100px" >
     </telerik:RadButton>
   </div>
    <br />
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
                                HeaderText="Điện lực" SortExpression="DienLuc" UniqueName="DienLuc">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Thang1" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 1" SortExpression="Thang1" UniqueName="Thang1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Thang2" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 2" SortExpression="Thang2" UniqueName="Thang2">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang3" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 3" SortExpression="Thang3" UniqueName="Thang3">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang4" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 4" SortExpression="Thang4" UniqueName="Thang4">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang5" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 5" SortExpression="Thang5" UniqueName="Thang5">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang6" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 6" SortExpression="Thang6" UniqueName="Thang6">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang7" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 7" SortExpression="Thang7" UniqueName="Thang7">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang8" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 8" SortExpression="Thang8" UniqueName="Thang8">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang9" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 9" SortExpression="Thang9" UniqueName="Thang9">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang10" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 10" SortExpression="Thang10" UniqueName="Thang10">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="Thang11" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 11" SortExpression="Thang11" UniqueName="Thang11">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Thang12" HeaderButtonType="TextButton" 
                                HeaderText="Tháng 12" SortExpression="Thang12" UniqueName="Thang12">
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
