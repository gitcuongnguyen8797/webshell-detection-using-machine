<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="5b2.aspx.vb" Inherits="niengiam.BM5b2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
</telerik:RadStyleSheetManager>
<p>
    <br />
</p>
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
</telerik:RadScriptManager>
<!-- Content Start -->
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        var popUp;
        function PopUpShowing(sender, eventArgs) {
            popUp = eventArgs.get_popUp();
            var gridWidth = sender.get_element().offsetWidth;
            var gridHeight = sender.get_element().offsetHeight;
            var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
            var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
            popUp.style.left = ((gridWidth - popUpWidth) / 2 + sender.get_element().offsetLeft).toString() + "px";
            popUp.style.top = ((gridHeight - popUpHeight) / 2 + sender.get_element().offsetTop).toString() + "px";
        }
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }
    </script>
</telerik:RadCodeBlock>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGrid1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                <telerik:AjaxUpdatedControl ControlID="divMsg" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<div id="divMsg" runat="server" style="float: left;">
    <asp:Label ID="Label1" runat="server" EnableViewState="False" Visible="false"></asp:Label>
</div>
<br />
<telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="sdsGrid" GridLines="Both" PageSize="25" MasterTableView-Caption="BÁO CÁO QUẢN LÝ HỆ THỐNG ĐO ĐẾM" MasterTableView-AlternatingItemStyle-BackColor="White" MasterTableView-ItemStyle-BackColor="#d5ebf9" MasterTableView-EditItemStyle-BackColor="#699ebe"
    AllowPaging="True" AllowSorting="True" AllowFilteringByColumn="false" AutoGenerateColumns="False" 
    AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
    OnItemDeleted="RadGrid1_ItemDeleted" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDataBound="RadGrid1_ItemDataBound"
    Font-Bold="False" Font-Italic="False" Font-Names="Tahoma" Font-Underline="False" 
    ShowStatusBar="True" Skin="Vista" >
    <FooterStyle Font-Bold="True" Font-Italic="False" />
    <HeaderStyle Font-Bold="True" Font-Italic="False" Wrap="true" HorizontalAlign="Center" VerticalAlign="Middle"/>
    <CommandItemStyle Font-Bold="True" Font-Italic="False" />
    <ItemStyle Font-Bold="False" Font-Italic="False" />
    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
    <MasterTableView AllowMultiColumnSorting="True" Width="100%"  CommandItemDisplay="Top"  Font-Bold="False" Font-Italic="False"   DataKeyNames="BM_5b2_Id" EditMode="PopUp" NoMasterRecordsText="Chưa có dữ liệu" >
        <EditFormSettings InsertCaption="Thêm mẫu tin mới" CaptionFormatString="Cập nhật thông tin cho mẫu tin #: {0}"
                CaptionDataField="BM_5b2_Id" PopUpSettings-Modal="true"/>
        <CommandItemSettings AddNewRecordText="Thêm mẫu tin mới"  RefreshText="" ShowExportToCsvButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true"/>
        <ColumnGroups>
            <telerik:GridColumnGroup HeaderText="Kết nối" Name="KN" HeaderStyle-HorizontalAlign="Center">
            </telerik:GridColumnGroup>
            
        </ColumnGroups> 
        <Columns>
           <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" EditImageUrl="Images\file_edit.png" ButtonType="ImageButton"  EditText="Sửa" HeaderStyle-Width="1%" ItemStyle-Width="1%">
           </telerik:GridEditCommandColumn>
             <telerik:GridBoundColumn DataField="BM_5b2_Id" DataType="System.Int32" HeaderText="BM_5b2_Id" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false"/>
            <telerik:GridBoundColumn DataField="MaBM" HeaderText="Mã số" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false"/>
            <telerik:GridTemplateColumn HeaderText="STT" HeaderStyle-Width="2%" ItemStyle-Width="2%" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:Label ID="STT" runat="server" Width="30px"></asp:Label>
                    </ItemTemplate>
            </telerik:GridTemplateColumn>
             <telerik:GridBoundColumn DataField="Ten" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" 
                HeaderText="Trạm" SortExpression="Ten" UniqueName="Ten" HeaderStyle-Width="18%" ItemStyle-Width="18%" >
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Tram_Id" DataType="System.Int32" HeaderText="Tram_Id" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false" />
            <telerik:GridBoundColumn DataField="TenNganLo" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" 
                HeaderText="Ngăn lộ" SortExpression="TenNganLo" UniqueName="TenNganLo" HeaderStyle-Width="12%" ItemStyle-Width="12%" >
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NganLo_Id" DataType="System.Int32" HeaderText="NganLo_Id" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false" />
            <telerik:GridBoundColumn DataField="MaDienKe" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                HeaderText="Mã điện kế" SortExpression="MaDienKe" UniqueName="MaDienKe" HeaderStyle-Width="10%" ItemStyle-Width="10%" >
            </telerik:GridBoundColumn>
                <telerik:GridBoundColumn ColumnGroupName="KN" DataField="TrangThaiKetNoi" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" 
                HeaderText="Kết nối" SortExpression="TrangThaiKetNoi" UniqueName="TrangThaiKetNoi" HeaderStyle-Width="5%" ItemStyle-Width="5%" >
            </telerik:GridBoundColumn>
                <telerik:GridBoundColumn ColumnGroupName="KN" DataField="NguyenNhan" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center" 
                HeaderText="Nguyên nhân" SortExpression="NguyenNhan" UniqueName="NguyenNhan" HeaderStyle-Width="20%" ItemStyle-Width="20%" >
            </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NgayKetNoi" DataFormatString="{0:dd/MM/yyyy}" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                HeaderText="Ngày kết nối/xử lý" SortExpression="NgayKetNoi" UniqueName="NgayKetNoi" HeaderStyle-Width="8%" ItemStyle-Width="8%" >
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                HeaderText="Ghi chú" SortExpression="GhiChu" UniqueName="GhiChu" HeaderStyle-Width="13%" ItemStyle-Width="13%" >
            </telerik:GridBoundColumn>
            <telerik:GridButtonColumn UniqueName="DeleteColumn" CommandName="Delete" ConfirmText="Bạn có chắc chắn xóa mẫu tin này?" Text="Xóa" ButtonType="ImageButton" ImageUrl="Images\delete.png" HeaderStyle-Width="1%" ItemStyle-Width="1%"/>
        </Columns>
                        
        <EditFormSettings EditFormType="Template" CaptionFormatString="Cập nhật thông tin cho mẫu tin #: {0}" CaptionDataField="BM_5b2_Id" PopUpSettings-ScrollBars="Auto" PopUpSettings-Width="600px" PopUpSettings-Height="350px" FormStyle-BorderWidth="4px">
                <FormTemplate>
                    <table id="Table1" cellspacing="2px" cellpadding="4px" width="100%" border="0px" align="center">
                        
                        <tr >
                            <td>
                                Trạm:
                            </td>
                            <td >
                               
                                <telerik:RadComboBox ID="RadComboBox1" Runat="server"  Width="250px" TabIndex="1" DataTextField="Ten" DataValueField="Tram_Id" DataSourceID="sdsTram" SelectedValue='<%# Bind("Tram_Id")%>' OnSelectedIndexChanged="RadComboBox1_SelectedIndexChanged">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr >
                            <td>
                                Ngăn lộ:
                            </td>
                            <td >
                               
                                <telerik:RadComboBox ID="RadComboBox2" Runat="server"  Width="250px" TabIndex="2" DataTextField="TenNganLo" DataValueField="NganLo_Id" DataSourceID="sdsNganLo" SelectedValue='<%# Bind("NganLo_Id")%>'>
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mã điện kế:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MaDienKe")%>' TabIndex="3" Width="95%" MaxLength="255">
                                </asp:TextBox>
                            </td>
                        
                       
                        </tr>
                         <tr>
                         <td>
                                Trạng thái kết nối:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TrangThaiKetNoi")%>' TabIndex="4" Width="30px" MaxLength="1">
                                </asp:TextBox>
                            </td>
                        </tr>
                        
                        
                        <tr >
                            <td>
                                Nguyên nhân:
                            </td>
                            <td >
                               <telerik:RadTextBox ID="RadTextBox0" Runat="server"  Text='<%# Bind("NguyenNhan")%>' MaxLength="4000" Width="95%" TextMode="MultiLine" Rows="3" TabIndex="5">
                            </telerik:RadTextBox>
                            </td>
                        </tr>

                        <tr >
                            <td>
                                Ngày kết nối/xử lý:
                            </td>
                            <td >
                               <telerik:RadDateTimePicker ID="RadDateTimePicker1" Runat="server" Skin="Web20" TabIndex="6"  
                               SelectedDate='<%# Bind("NgayKetNoi")%>' PickerType="DatePicker"
                                   DateInput-DateFormat="dd/MM/yyyy" DateInput-DisplayDateFormat="dd/MM/yyyy" TimePopupButton-Visible="False">
                                        
                               </telerik:RadDateTimePicker>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadDateTimePicker1" ForeColor="Red" Display="None" SetFocusOnError="true" ErrorMessage="Nhập thông tin [Ngày kết nối/xử lý]" ></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                        
                        <tr >
                            <td>
                                Ghi chú:
                            </td>
                            <td >
                               <telerik:RadTextBox ID="RadTextBox4" Runat="server"  Text='<%# Bind("GhiChu")%>' MaxLength="4000" Width="95%" TextMode="MultiLine" Rows="3" TabIndex="7">
                            </telerik:RadTextBox>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="Button1" Text='<%# IIf(TypeOf Container Is GridEditFormInsertItem, "Thêm", "Cập nhật")%>'
                                    runat="server" CommandName='<%# Iif (TypeOf Container is GridEditFormInsertItem, "PerformInsert", "Update") %>'>
                                </asp:Button>&nbsp;
                                <asp:Button ID="Button2" Text="Bỏ qua" runat="server" CausesValidation="False" CommandName="Cancel">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                               
                            </td>
                        </tr>
                    </table>
                </FormTemplate>
            </EditFormSettings>
            <ExpandCollapseColumn ButtonType="ImageButton" Visible="False" UniqueName="ExpandColumn">
                <HeaderStyle Width="0px"></HeaderStyle>
            </ExpandCollapseColumn>
        </MasterTableView>
        <ClientSettings>
            <ClientEvents OnRowDblClick="RowDblClick" />
            <ClientEvents OnPopUpShowing="PopUpShowing" />
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
</telerik:RadGrid>
    <asp:SqlDataSource ID="sdsGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>" ProviderName="System.Data.SqlClient"
        DeleteCommand="DELETE FROM [BM_5b2] WHERE [BM_5b2_Id] = @BM_5b2_Id"
        InsertCommand="INSERT INTO [BM_5b2] ([MaBM], [Tram_Id], [NganLo_Id], [MaDienKe], [TrangThaiKetNoi], [NguyenNhan], [NgayKetNoi], [GhiChu]) 
        VALUES ('', @Tram_Id, @NganLo_Id, @MaDienKe, @TrangThaiKetNoi, @NguyenNhan, @NgayKetNoi, @GhiChu)"
        SelectCommand="SELECT * FROM [BM_5b2], [DM_TramDuongDay], [DM_NganLo] WHERE [BM_5b2].[Tram_Id] = [Id] AND [BM_5b2].[NganLo_Id] = [DM_NganLo].[NganLo_Id]"
        UpdateCommand="UPDATE [BM_5b2] SET [MaBM] = '', [Tram_Id] = @Tram_Id, [NganLo_Id] = @NganLo_Id, [MaDienKe] = @MaDienKe, [TrangThaiKetNoi] = @TrangThaiKetNoi, [NguyenNhan] = @NguyenNhan, [NgayKetNoi] = @NgayKetNoi, [GhiChu] = @GhiChu WHERE [BM_5b2_Id] = @BM_5b2_Id">
        <UpdateParameters>
           
           <asp:Parameter Name="MaBM" Type="String" />
            <asp:Parameter Name="Tram_Id" Type="Int32" />
            <asp:Parameter Name="NganLo_Id" Type="Int32" />
            <asp:Parameter Name="MaDienKe" Type="String" />
            <asp:Parameter Name="TrangThaiKetNoi" Type="String" />
            <asp:Parameter Name="NguyenNhan" Type="String" />
             <asp:Parameter Name="NgayKetNoi" Type="DateTime" />
            <asp:Parameter Name="GhiChu" Type="String" />  
            <asp:Parameter Name="BM_5b2_Id" Type="Int32" />         
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="BM_5b2_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaBM" Type="String" />
            <asp:Parameter Name="Tram_Id" Type="Int32" />
            <asp:Parameter Name="NganLo_Id" Type="Int32" />
            <asp:Parameter Name="MaDienKe" Type="String" />
            <asp:Parameter Name="TrangThaiKetNoi" Type="String" />
            <asp:Parameter Name="NguyenNhan" Type="String" />
             <asp:Parameter Name="NgayKetNoi" Type="DateTime" />
            <asp:Parameter Name="GhiChu" Type="String" />
        </InsertParameters>
            
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsTram" runat="server" ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Id] AS [Tram_Id], [Ten] FROM [DM_TramDuongDay]" />
    <asp:SqlDataSource ID="sdsNganLo" runat="server" ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [NganLo_Id], [TenNganLo] FROM [DM_NganLo] WHERE [Tram_Id] = @SelectedTram_Id" >
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="SelectedTram_Id" Type="Int32" />
        </SelectParameters>
     </asp:SqlDataSource>
     
<!-- Content End -->
    </asp:Content>