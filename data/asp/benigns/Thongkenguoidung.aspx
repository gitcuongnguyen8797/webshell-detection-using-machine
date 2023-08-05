<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkenguoidung.aspx.vb" Inherits="VANPHONG.WebForm9" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="element-box">
    <div class="m">       
    <div style="height: 60px">
    <div align="center">   
   <%--  <asp:Label ID="Label4" runat="server" Text="Chọn Xem:" 
              Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label><asp:RadioButton id="All" GroupName="Nguoidung" 
             Text=""  runat="server"/> 
    <asp:Label ID="Label1" runat="server" Text="Xem tất cả" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
              <asp:RadioButton id="NguoidungEoffice" GroupName="Nguoidung" 
             Text=""  runat="server"/>
          <asp:Label ID="Label3" runat="server" Text="Người dùng đơn vị" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
           --%>
        Đơn vị : <telerik:RadComboBox ID="CbodonVi"  AutoPostBack="true" ontextchanged="CbodonVi_TextChanged" Runat="server" Skin="Vista" Width="200px">
        </telerik:RadComboBox>
        <asp:Button ID="Button1" runat="server" Text="Xem In" 
        Font-Bold="True" ForeColor="Red" /> 
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" ForeColor="Red" />
    </div>
    </div>
    </div>
    </div>
     <hr />
   <telerik:radgrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False"  ShowGroupPanel="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            ShowFooter="True" PageSize="200">
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" Position="TopAndBottom" AlwaysVisible="true" />
                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" 
                        ReorderColumnsOnClient="True">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   
                        Caption="THỐNG KÊ NGƯỜI DÙNG SỬ DỤNG E-OFFICE" GridLines="Both" 
                        ForeColor="Blue" Frame="HSides" >
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>
            <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Đơn vị công tác" Name="Donvi" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
               
            </ColumnGroups>


                         <Columns>
                                     
                            <telerik:GridBoundColumn DataField="Ten_TCap" HeaderText="Tên đăng nhập" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="Ten_TCap" UniqueName="Ten_TCap">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Ten_DD" HeaderText="Họ Tên" HeaderStyle-HorizontalAlign="Center" HeaderButtonType="TextButton"  ItemStyle-HorizontalAlign="Left"   SortExpression="Ten_DD" UniqueName="Ten_DD">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Chuc_Vu" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Chức Vụ" SortExpression="Chuc_Vu" UniqueName="Chuc_Vu" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

<%--
                               <telerik:GridBoundColumn DataField="Ten_phong" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Phòng Ban" SortExpression="Ten_phong" UniqueName="Ten_phong" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>--%>

                              <telerik:GridBoundColumn DataField="EMail" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="EMail" SortExpression="EMail" UniqueName="EMail" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                             
                               <telerik:GridBoundColumn DataField="Ten_Donvi" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Phòng Ban" SortExpression="Ten_Donvi" UniqueName="Ten_Donvi" ColumnGroupName="Donvi" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Ten_phong" HeaderButtonType="TextButton"   ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Đơn Vị" ColumnGroupName="Donvi" SortExpression="Ten_phong" UniqueName="Ten_phong" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                             <%--telerik:GridBoundColumn DataField="Noi_Gui" HeaderButtonType="TextButton"  ColumnGroupName="Donvi"  ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Nơi gửi" SortExpression="Noi_Gui" UniqueName="Noi_Gui" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PB_NhanVB" HeaderButtonType="TextButton"  ColumnGroupName="Donvi"  ItemStyle-HorizontalAlign="Left" 
                                HeaderText="Phòng ban nhận" SortExpression="PB_NhanVB" UniqueName="PB_NhanVB" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>--%>

<%--<ItemStyle HorizontalAlign="Left"></ItemStyle>
                             </telerik:GridBoundColumn>         --%>                                           
                            </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
                              </MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:radgrid>
</asp:Content>
