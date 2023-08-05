<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="BM1e_2TH.aspx.vb" Inherits="niengiam.BM1e_2TH" %>
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
                         Caption="BÁO CÁO TỔNG HỢP CÔNG TÁC CHỈNH ĐỊNH TRỊ SỐ"
                       >
                        <CommandItemSettings  ShowAddNewRecordButton="false"  />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                        
                       
                              <telerik:GridBoundColumn DataField="DienLuc" HeaderButtonType="TextButton" 
                                HeaderText="Công Ty Điện Lực" SortExpression="DienLuc" UniqueName="DienLuc">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SoLanVuotLenMC" HeaderButtonType="TextButton" 
                                HeaderText="Số lần bật vượt cấp lên MC đầu nguồn" SortExpression="SoLanVuotcapLenMC" UniqueName="SoLanVuotcapLenMC">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="SoLanVuotLenREC" HeaderButtonType="TextButton" 
                                HeaderText="Số lần bật vượt cấp lên REC " SortExpression="SoLanVuotCapLenREC" UniqueName="SoLanVuotCapLenREC">                              
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="TacDong" HeaderButtonType="TextButton" 
                                HeaderText="Tác Động Chọn Lọc" SortExpression="SoLanVuotCapLenREC" UniqueName="SoLanVuotCapLenREC">                              
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
