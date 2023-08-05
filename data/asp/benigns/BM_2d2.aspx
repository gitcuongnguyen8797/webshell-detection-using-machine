<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="BM_2d2.aspx.vb" Inherits="niengiam.BM2d2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div.RadGrid .rgPager .rgAdvPart     
        {     
            display:none;        
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
         Ngày: <telerik:raddatepicker ID="CboLuachonthang" Runat="server" 
         Skin="Web20" Culture="vi-VN">
                       <Calendar ID="Calendar2" Skin="Web20" UseColumnHeadersAsSelectors="False" Runat="server"
                           UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                       </Calendar>
                       <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />
                   </telerik:raddatepicker>
        
       
        Đơn vị :   <telerik:RadComboBox ID="CbodonVi" Runat="server" 
                       Skin="Office2007" 
                       Width="200">
                   </telerik:RadComboBox>  
     <telerik:RadButton ID="BTimKiem" runat="server"  Text="Tìm kiếm"  Skin="Office2007" Width="100px">
     </telerik:RadButton>
        <telerik:RadButton ID="Btn_XuatExcel" runat="server"  Skin="Office2007" Width="100px" 
            Text="Xuất excel">
        </telerik:RadButton>
    </div>
    <br />

    <div>
    

      <telerik:radgrid ID="GridVanBan2" runat="server" AllowSorting="True" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
        PageSize="22" AutoGenerateColumns="False"  Height="654px">
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
                        Font-Italic="False"   Caption="TỔNG HỢP TÌNH HÌNH VÀ NHU CẦU TRANG BỊ THIẾT BỊ CHỈ BÁO SỰ CỐ LƯỚI TRUNG THẾ">
                        <CommandItemSettings AddNewRecordText="" 
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

                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Kế hoạch trang bị mới" Name="Kehoachmoi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Lắp đặt trong tháng" Name="Lapdatthang" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Đã lắp đặt trên lưới (Lũy kế)" Name="Lapdatluyke" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                             <telerik:GridColumnGroup HeaderText="Lưới nổi" Name="Luoinoi" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Lapdatluyke">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Lưới ngầm" Name="Luoingam" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Lapdatluyke">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Tổng" Name="Tong" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Lapdatluyke">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Tình trạng vận hành"	 Name="Vanhanhluoinoi" ParentGroupName="Luoinoi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</telerik:GridColumnGroup>
  <telerik:GridColumnGroup HeaderText="Tình trạng vận hành"	 Name="Vanhanhluoingam" ParentGroupName="Luoingam" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</telerik:GridColumnGroup>

  <telerik:GridColumnGroup HeaderText="Tình trạng vận hành"	 Name="Tongvanhanh" ParentGroupName="Tong" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</telerik:GridColumnGroup>

                        </ColumnGroups>

                        <Columns>
                                                 
                            <telerik:GridBoundColumn DataField="tendonvi" HeaderText="Công ty Điện lực" HeaderButtonType="TextButton"
                            SortExpression="tendonvi" UniqueName="tendonvi">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Soluoinoi" HeaderText="Lưới nổi (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Kehoachmoi" 
                            SortExpression="Soluoinoi" UniqueName="Soluoinoi">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Soluoingam" HeaderText="Lưới ngầm (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Kehoachmoi" 
                            SortExpression="Soluoingam" UniqueName="Soluoingam">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TongSoluoi" HeaderText="Tổng"  HeaderButtonType="TextButton"   ColumnGroupName="Kehoachmoi" 
                            SortExpression="TongSoluoi" UniqueName="TongSoluoi">
                            </telerik:GridBoundColumn>
           
                            <telerik:GridBoundColumn DataField="LuoinoiThang" HeaderText="Lưới nổi (bộ)"  HeaderButtonType="TextButton"   ColumnGroupName="Lapdatthang"
                            SortExpression="LuoinoiThang" UniqueName="LuoinoiThang">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="LuoingamThang" HeaderText="Lưới ngầm (bộ)"  HeaderButtonType="TextButton"   ColumnGroupName="Lapdatthang"
                            SortExpression="LuoingamThang" UniqueName="LuoingamThang">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="TongLuoiThang" HeaderText="Tổng"  HeaderButtonType="TextButton"   ColumnGroupName="Lapdatthang"
                            SortExpression="TongLuoiThang" UniqueName="TongLuoiThang">
                            </telerik:GridBoundColumn>


                             <telerik:GridBoundColumn DataField="LuoinoiLuyKe" HeaderText="Số lượng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Luoinoi"
            SortExpression="LuoinoiLuyKe" UniqueName="LuoinoiLuyKe">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoinoiTot" HeaderText="Bình thường (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoinoi"
            SortExpression="LuoinoiTot" UniqueName="LuoinoiTot">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Luoinoihuhong" HeaderText="Hư hỏng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoinoi"
            SortExpression="Luoinoihuhong" UniqueName="Luoinoihuhong">
            </telerik:GridBoundColumn>
                   
            <telerik:GridBoundColumn DataField="LuoingamLuyKe" HeaderText="Số lượng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Luoingam"
            SortExpression="LuoingamLuyKe" UniqueName="LuoingamLuyKe">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LuoingamTot" HeaderText="Bình thường (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoingam"
            SortExpression="LuoingamTot" UniqueName="LuoingamTot">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Luoingamhuhong" HeaderText="Hư hỏng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Vanhanhluoingam"
            SortExpression="Luoingamhuhong" UniqueName="Luoingamhuhong">
            </telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField="Soluonglapdat" HeaderText="Số lượng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Tong"
            SortExpression="Soluonglapdat" UniqueName="Soluonglapdat">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluongbinhthuong" HeaderText="Bình thường (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Tongvanhanh"
            SortExpression="Soluongbinhthuong" UniqueName="Soluongbinhthuong">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Soluonghuhong" HeaderText="Hư hỏng (bộ)" HeaderButtonType="TextButton"   ColumnGroupName="Tongvanhanh"
            SortExpression="Soluonghuhong" UniqueName="Soluonghuhong">
            </telerik:GridBoundColumn> 
           
                                     
                          
                     </Columns>
                    </MasterTableView>
                    <SelectedItemStyle Font-Bold="False" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
            </telerik:radgrid>
            
    </div>
    <br /> 
        
   <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" Runat="server">
        </telerik:RadStyleSheetManager>
</asp:Content>
