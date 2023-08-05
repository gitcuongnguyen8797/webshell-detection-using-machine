<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkesovanban.aspx.vb" Inherits="VANPHONG.WebForm3" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="element-box">
    <div class="m">       
    <div style="height: 60px">
    <div align="center">
        Từ ngày:<telerik:raddatepicker ID="DateTuNgay" Runat="server" Culture="vi-VN" 
            Skin="Office2007">
         <Calendar ID="Calendar1"  UseColumnHeadersAsSelectors="False" Runat="server" 
                       UseRowHeadersAsSelectors="False" ViewSelectorText="x" 
                Skin="Office2007">
                       </Calendar>
                       <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
        </telerik:raddatepicker>
         Đến ngày : 
        <telerik:raddatepicker ID="DateDenNgay" Runat="server" Culture="vi-VN" 
            Skin="Office2007">
                       <Calendar ID="Calendar4"  UseColumnHeadersAsSelectors="False" Runat="server" 
                       UseRowHeadersAsSelectors="False" ViewSelectorText="x" Skin="Office2007">
                       </Calendar>
                       <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" Runat="server" >
                       </DateInput>
                       <DatePopupButton HoverImageUrl="" ImageUrl="" />

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                   </telerik:raddatepicker>
   
    <asp:Button ID="Button1" runat="server" Text="Xem In" 
        Font-Bold="True" ForeColor="#000040" />
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" ForeColor="#000040" />
    </div>
    </div>

    </div>
    </div>
    <hr />
    <div>
    
    
        <telerik:RadGrid ID="GridVanBan" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    Font-Bold="True" Font-Italic="True" Font-Names=".VnTime" Font-Underline="False" 
                    GridLines="None" ShowStatusBar="True" Skin="Office2007" 
                     style="margin-top: 0px" CellSpacing="0" AllowPaging="True" 
            ShowGroupPanel="false" ShowFooter="True"  PageSize="30">
                    <FooterStyle Font-Bold="False" Font-Italic="False" />
                    <HeaderStyle Font-Bold="True" Font-Italic="False" />
                    <CommandItemStyle Font-Bold="False" Font-Italic="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" />
                    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" PageSizes="30" />
                    <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" 
                        ReorderColumnsOnClient="True">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
                    <MasterTableView AllowMultiColumnSorting="True"  
                        CommandItemDisplay="Top"  Font-Bold="False" 
                        Font-Italic="False"   
                        Caption="THỐNG KÊ TỔNG SỐ VĂN BẢN ĐI ĐẾN THEO ĐƠN VỊ" GridLines="Both" 
                        ForeColor="Blue" Frame="HSides" >
                        <CommandItemSettings AddNewRecordText="Thêm mới" ShowAddNewRecordButton="False" 
                            ShowRefreshButton="False"   />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Created="True">
                        </ExpandCollapseColumn>

            <ColumnGroups>
                <telerik:GridColumnGroup HeaderText="Văn bản đến" Name="Vanbanden" HeaderStyle-HorizontalAlign="Center">
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </telerik:GridColumnGroup>
               
            </ColumnGroups>
<%--
                          <ColumnGroups>
                            <telerik:GridColumnGroup HeaderText="Văn bản đến" Name="Vanbanden" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                          
                             <telerik:GridColumnGroup HeaderText="Lưới nổi" Name="Vanbandenmang" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Vanbanden">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                            <telerik:GridColumnGroup HeaderText="Lưới ngầm" Name="Vanbandengiay" HeaderStyle-HorizontalAlign="Center" ParentGroupName="Vanbanden">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridColumnGroup>
                         
                        </ColumnGroups>--%>

                         <Columns>
                           
          
                            <telerik:GridBoundColumn DataField="Ten_Donvi" HeaderText="Công ty Điện lực" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                            SortExpression="Ten_Donvi" UniqueName="Ten_Donvi">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VBDI" HeaderText="Tổng số văn bản đi" HeaderStyle-HorizontalAlign="Center" HeaderButtonType="TextButton" DataType="System.Decimal" DataFormatString="{0:N0}" ItemStyle-HorizontalAlign="Right"   SortExpression="VBDI" UniqueName="VBDI">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="VBDENMANG" HeaderButtonType="TextButton"  ColumnGroupName="Vanbanden"  ItemStyle-HorizontalAlign="Right" DataType="System.Decimal" DataFormatString="{0:N0}"
                                HeaderText="Số văn bản đến mạng" SortExpression="VBDENMANG" UniqueName="VBDENMANG" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                             </telerik:GridBoundColumn>


                             <telerik:GridBoundColumn DataField="VBDENGIAY" HeaderButtonType="TextButton"  ColumnGroupName="Vanbanden"  ItemStyle-HorizontalAlign="Right" DataType="System.Decimal" DataFormatString="{0:N0}"
                                HeaderText="Số văn bản đến giấy" SortExpression="VBDENGIAY" UniqueName="VBDENGIAY" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                             </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VBDEN" HeaderButtonType="TextButton"  ColumnGroupName="Vanbanden"  ItemStyle-HorizontalAlign="Right" DataType="System.Decimal" DataFormatString="{0:N0}"
                                HeaderText="Tổng số văn bản đến" SortExpression="VBDEN" UniqueName="VBDEN" HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                             </telerik:GridBoundColumn>
<%--
                            <telerik:GridBoundColumn DataField="VBDENMANG" HeaderText="Số văn bản đến mạng" ItemStyle-HorizontalAlign="Right" DataType="System.Int32" DataFormatString="{0:N0}" HeaderButtonType="TextButton"    
                            SortExpression="VBDENMANG" UniqueName="VBDENMANG">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="VBDENGIAY" HeaderText="Số văn bản đến giấy" ItemStyle-HorizontalAlign="Right" DataType="System.Int32" DataFormatString="{0:N0}" HeaderButtonType="TextButton"   
                            SortExpression="VBDENGIAY" UniqueName="VBDENGIAY">
                            </telerik:GridBoundColumn>
           
                            <telerik:GridBoundColumn DataField="VBDEN" HeaderText="Văn bản đển" ItemStyle-HorizontalAlign="Right" DataType="System.Int32" DataFormatString="{0:N0}"  HeaderButtonType="TextButton"   
                            SortExpression="VBDEN" UniqueName="VBDEN">
                            </telerik:GridBoundColumn>--%>
                                           
                            </Columns>
                          <%--  <telerik:GridNumericColumn DataField="VBDENMANG" DecimalDigits="2" 
                        FilterControlAltText="Filter column column" HeaderText="UES Fee" 
                        UniqueName="VBDENMANG" DataFormatString="{0:c}" Aggregate="VBDENMANG" FooterAggregateFormatString="{0:c}">
                        <ItemStyle HorizontalAlign="right" />
                        <HeaderStyle HorizontalAlign="Right" />
                        <FooterStyle HorizontalAlign="Right"/>
                    </telerik:GridNumericColumn>--%>
 <%--<GroupFooterTemplate>
            Tổng số văn bản đi:
            <!-- the footer totals can be accessed using Eval() -->
            <asp:Label ID="Label1" runat="server" Text='<%#Eval("VBDI") %>'>
            </asp:Label>
            <!-- if you want to place cells inside the footer template, you should put a closing tag after the content of the first one (without an opening one) and skip the last </td> tag in the template.
            This is so because the template is rendered inside a single <td> and HTML validation would fail if you were to put regular <td></td> elements here-->
            </td>
            <td>
                Tổng số văn bản đến mạng:
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("VBDENMANG") %>'>
                </asp:Label>
            </td>
            <td>
                Tổng số văn bản đến giấy:
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("VBDENGIAY") %>'>
                </asp:Label>
            </td>
            <td>
               Tổng số văn bản đến:
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("VBDEN") %>'>
                </asp:Label>
        </GroupFooterTemplate>--%>
<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
                              </MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>
                            </telerik:RadGrid>
    
    
    </div>
</asp:Content>
