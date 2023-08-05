<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/myniengiam1.master" CodeBehind="4a2.aspx.vb" Inherits="niengiam.BM4a2" %>
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

<table id="tblPart1" cellspacing="2px" cellpadding="4px" width="100%" border="0px" align="left">
<tr >
    <td colspan="2">
        Đơn vị: &nbsp;
        <telerik:RadComboBox EnableScreenBoundaryDetection="false" ExpandDirection="Down" ID="rcboDonVi" Runat="server"  Width="300px" TabIndex="1" DataTextField="TenDonVi" DataValueField="MaDonVi" DataSourceID="sdsDonVi">
        </telerik:RadComboBox>
    </td>
</tr>
<tr >
    <td>
    Từ ngày: &nbsp;
    <telerik:RadDateTimePicker ID="rdtpTuNgay" Runat="server" Skin="Web20" TabIndex="2"  
    PickerType="DatePicker" TimePopupButton-Visible="False"
    DateInput-DateFormat="dd/MM/yyyy" DateInput-DisplayDateFormat="dd/MM/yyyy" >
    </telerik:RadDateTimePicker>
    </td>
    <td>
    Đến ngày: &nbsp;
    <telerik:RadDateTimePicker ID="rdtpDenNgay" Runat="server" Skin="Web20" TabIndex="3"  
    PickerType="DatePicker" TimePopupButton-Visible="False"
    DateInput-DateFormat="dd/MM/yyyy" DateInput-DisplayDateFormat="dd/MM/yyyy" >
    </telerik:RadDateTimePicker>
    </td>
</tr>
<tr >
    <td>
<telerik:RadButton ID="btnTimKiem" runat="server" Skin="Web20" Text="Tìm kiếm" Width="100px" TabIndex="4"></telerik:RadButton>
    </td>
</tr>
</table>
<br />
<table id="tblPart2" cellspacing="2px" cellpadding="4px" width="100%" border="0px" align="left">
<tr >
    <td >
<div id="divMsg" runat="server" style="float: left;">
    <asp:Label ID="Label1" runat="server" EnableViewState="False" Visible="false"></asp:Label>
    <br />
</div>
        </td>
</tr>
</table>
<br />
<telerik:RadGrid ID="RadGrid1" TabIndex="5" runat="server" DataSourceID="sdsGrid" GridLines="Both" PageSize="25" MasterTableView-Caption="BÁO CÁO CÔNG TÁC GIA CỐ TRẠM PHÒNG" MasterTableView-AlternatingItemStyle-BackColor="White" MasterTableView-ItemStyle-BackColor="#d5ebf9" MasterTableView-EditItemStyle-BackColor="#699ebe"
    AllowPaging="True" AllowSorting="True" AllowFilteringByColumn="false" AutoGenerateColumns="False" 
    AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
    OnItemDeleted="RadGrid1_ItemDeleted" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" OnUpdateCommand="RadGrid1_UpdateCommand" OnInsertCommand="RadGrid1_InsertCommand"
    Font-Bold="False" Font-Italic="False" Font-Names="Tahoma" Font-Underline="False" 
    ShowStatusBar="True" Skin="Vista" >
    <FooterStyle Font-Bold="True" Font-Italic="False" />
    <HeaderStyle Font-Bold="True" Font-Italic="False" Wrap="true" HorizontalAlign="Center" VerticalAlign="Middle"/>
    <CommandItemStyle Font-Bold="True" Font-Italic="False" />
    <ItemStyle Font-Bold="False" Font-Italic="False" />
    <PagerStyle Font-Bold="False" Font-Italic="False" Mode="NextPrevAndNumeric" />
    <GroupHeaderItemStyle Font-Bold="True" Font-Italic="True" />
    <MasterTableView AllowMultiColumnSorting="True" Width="100%"  CommandItemDisplay="Top"  Font-Bold="False" Font-Italic="False"   DataKeyNames="BM_4a2_Id" EditMode="PopUp" NoMasterRecordsText="Chưa có dữ liệu" >
        <EditFormSettings InsertCaption="Thêm mẫu tin mới" CaptionFormatString="Cập nhật thông tin cho mẫu tin #: {0}"
                CaptionDataField="BM_4a2_Id" PopUpSettings-Modal="true"/>
        <CommandItemSettings AddNewRecordText="Thêm mẫu tin mới"  RefreshText="" ShowExportToCsvButton="true" ShowExportToExcelButton="true" ShowExportToPdfButton="true" ShowExportToWordButton="true"/>
        <ColumnGroups>
            <telerik:GridColumnGroup HeaderText="Loại" Name="Loai" HeaderStyle-HorizontalAlign="Center">
            </telerik:GridColumnGroup>
            
        </ColumnGroups> 
        <Columns>
           <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" EditImageUrl="Images\file_edit.png" ButtonType="ImageButton"  EditText="Sửa" HeaderStyle-Width="1%" ItemStyle-Width="1%">
           </telerik:GridEditCommandColumn>
             <telerik:GridBoundColumn DataField="BM_4a2_Id" DataType="System.Int32" HeaderText="BM_4a2_Id" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false"/>
            
            <telerik:GridTemplateColumn HeaderText="STT" HeaderStyle-Width="2%" ItemStyle-Width="2%" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:Label ID="STT" runat="server" Width="30px"></asp:Label>
                    </ItemTemplate>
            </telerik:GridTemplateColumn>
             <telerik:GridBoundColumn DataField="DonVi" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"
                HeaderText="Đơn vị nhận gia cố" SortExpression="DonVi" UniqueName="DonVi" HeaderStyle-Width="15%" ItemStyle-Width="15%" >
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="TenTram" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" 
                HeaderText="Trạm" SortExpression="TenTram" UniqueName="TenTram" HeaderStyle-Width="15%" ItemStyle-Width="15%" >
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Tram_Id" DataType="System.Int32" HeaderText="Tram_Id" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false" />
             <telerik:GridBoundColumn DataField="Ten_TuyenDay" HeaderButtonType="TextButton"  HeaderStyle-HorizontalAlign="Center" 
                HeaderText="Tuyến dây" SortExpression="Ten_TuyenDay" UniqueName="Ten_TuyenDay" HeaderStyle-Width="15%" ItemStyle-Width="15%" >
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TuyenDay" DataType="String" HeaderText="TuyenDay" Display="false" HeaderStyle-Width="0%" ItemStyle-Width="0%" Visible="false" />
            <telerik:GridBoundColumn DataField="NoiDung" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                HeaderText="Nội dung thực hiện (gia cố hệ thống thông gió, cửa trạm…)" SortExpression="NoiDung" UniqueName="NoiDung" HeaderStyle-Width="30%" ItemStyle-Width="30%" >
            </telerik:GridBoundColumn>
             <telerik:GridBoundColumn DataField="NgayThucHien" DataFormatString="{0:dd/MM/yyyy}" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                HeaderText="Ngày thực hiện" SortExpression="NgayThucHien" UniqueName="NgayThucHien" HeaderStyle-Width="8%" ItemStyle-Width="8%" >
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="GhiChu" HeaderButtonType="TextButton" HeaderStyle-HorizontalAlign="Center"
                HeaderText="Ghi chú" SortExpression="GhiChu" UniqueName="GhiChu" HeaderStyle-Width="15%" ItemStyle-Width="15%" >
            </telerik:GridBoundColumn>
            
            <telerik:GridButtonColumn UniqueName="DeleteColumn" CommandName="Delete" ConfirmText="Bạn có chắc chắn xóa mẫu tin này?" Text="Xóa" ButtonType="ImageButton" ImageUrl="Images\delete.png" HeaderStyle-Width="1%" ItemStyle-Width="1%"/>
        </Columns>
                        
        <EditFormSettings EditFormType="Template" CaptionFormatString="Cập nhật thông tin cho mẫu tin #: {0}" CaptionDataField="BM_4a2_Id" PopUpSettings-ScrollBars="Auto" PopUpSettings-Width="600px" PopUpSettings-Height="450px" FormStyle-BorderWidth="4px">
                <FormTemplate>
                    <table id="Table1" cellspacing="2px" cellpadding="4px" width="100%" border="0px" align="center">
                        <tr>
                         <td>
                                Đơn vị:
                            </td>
                            <td>
                               <telerik:RadComboBox EnableScreenBoundaryDetection="false" ExpandDirection="Down" ID="rcboDonVi2" Runat="server"  Width="300px" TabIndex="1" DataTextField="TenDonVi" DataValueField="MaDonVi" DataSourceID="sdsDonVi2" SelectedValue='<%# Bind("MaDonVi")%>' OnSelectedIndexChanged ="rcboDonVi2_SelectedIndexChanged" AutoPostBack="true">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Đơn vị nhận gia cố:
                            </td>
                            <td>
                               <telerik:RadTextBox ID="RadTextBox1" Runat="server"  Text='<%# Bind("DonVi")%>' MaxLength="4000" Width="95%" TextMode="MultiLine" Rows="2" TabIndex="2">
                               </telerik:RadTextBox>
                            </td>
                            </td>
                        
                       
                        </tr>
                        <tr >
                            <td>
                                Trạm:
                            </td>
                            <td >
                               
                                <telerik:RadComboBox EnableScreenBoundaryDetection="false" ExpandDirection="Down" ID="RadComboBox1" Runat="server"  Width="300px" TabIndex="3" DataTextField="Ten" DataValueField="Tram_Id" DataSourceID="sdsTram" SelectedValue='<%# Bind("Tram_Id")%>'>
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                         <tr>
                         <td>
                                Tuyến dây:
                            </td>
                            <td>
                                <telerik:RadComboBox EnableScreenBoundaryDetection="false" ExpandDirection="Down" ID="rcboTuyenDay" Runat="server"  Width="300px" TabIndex="4" DataTextField="Ten_TuyenDay" DataValueField="TuyenDay" DataSourceID="sdsTuyenDay" SelectedValue='<%# DataBinder.Eval(Container.DataItem, "TuyenDay")%>'>
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        
                        <tr >
                            <td>
                                Nội dung:
                            </td>
                            <td >
                               <telerik:RadTextBox ID="RadTextBox2" Runat="server"  Text='<%# Bind("NoiDung")%>' MaxLength="4000" Width="95%" TextMode="MultiLine" Rows="5" TabIndex="5">
                            </telerik:RadTextBox>
                            </td>
                        </tr>
                        
                       
                        <tr >
                            <td>
                                Ngày thực hiện:
                            </td>
                            <td >
                               <telerik:RadDateTimePicker ID="rdtpNgayThucHien" Runat="server" Skin="Web20" TabIndex="5"  DbSelectedDate='<%# Bind("NgayThucHien")%>'
                                PickerType="DatePicker" SelectedDate='<%# IIf(Eval("NgayThucHien") Is DBNull.Value, "DateTime.Now", Eval("NgayThucHien"))%>'
                                DateInput-DateFormat="dd/MM/yyyy" DateInput-DisplayDateFormat="dd/MM/yyyy" TimePopupButton-Visible="False">        
                               </telerik:RadDateTimePicker>
                                <asp:RequiredFieldValidator ID="rfvNgayThucHien" runat="server" ControlToValidate="rdtpNgayThucHien" ForeColor="Red" Display="None" SetFocusOnError="true" ErrorMessage="Nhập thông tin [Ngày thực hiện]" ></asp:RequiredFieldValidator>
                                
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
        SelectCommand="SELECT BM_4a2.*, TenTram, TenDonVi, LD.TuyenDay AS TuyenDay, (LD.TuyenDay + ' - ' + LD.Ten_TuyenDay) AS Ten_TuyenDay FROM BM_4a2 LEFT JOIN DonVi ON BM_4a2.MaDonVi = DonVi.MaDonVi LEFT JOIN (SELECT DISTINCT TuyenDay, Ten_TuyenDay FROM LuoiDien WHERE DonVi = @MaDonVi) LD ON BM_4a2.TuyenDay = LD.TuyenDay LEFT JOIN (SELECT DISTINCT Id AS Tram_Id, Ten AS TenTram FROM DM_TramDuongDay) T ON BM_4a2.Tram_Id = T.Tram_Id WHERE BM_4a2.MaDonVi = @MaDonVi AND NgayThucHien BETWEEN @TuNgay AND @DenNgay"
        DeleteCommand="DELETE FROM [BM_4a2] WHERE [BM_4a2_Id] = @BM_4a2_Id"
        InsertCommand="INSERT INTO [BM_4a2] ([DonVi], [Tram_Id], [TuyenDay], [NoiDung], [GhiChu], [NgayThucHien], [MaDonVi]) 
        VALUES (@DonVi, @Tram_Id, @TuyenDay, @NoiDung, @GhiChu, @NgayThucHien, @MaDonVi)"
        UpdateCommand="UPDATE [BM_4a2] SET [DonVi] = @DonVi, [Tram_Id] = @Tram_Id, [TuyenDay] = @TuyenDay, [NoiDung] = @NoiDung, [GhiChu] = @GhiChu, [NgayThucHien] = @NgayThucHien, [MaDonVi] = @MaDonVi  WHERE [BM_4a2_Id] = @BM_4a2_Id">
        <UpdateParameters>
            <asp:Parameter Name="DonVi" Type="String" />
            <asp:Parameter Name="Tram_Id" Type="Int32" />
            <asp:Parameter Name="TuyenDay" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />  
            <asp:Parameter Name="GhiChu" Type="String" />  
            <asp:Parameter Name="NgayThucHien" Type="DateTime" />
            <asp:Parameter Name="MaDonVi" Type="String" />  
            <asp:Parameter Name="BM_4a2_Id" Type="Int32" />         
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="BM_4a2_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DonVi" Type="String" />
            <asp:Parameter Name="Tram_Id" Type="Int32" />
            <asp:Parameter Name="TuyenDay" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />  
            <asp:Parameter Name="GhiChu" Type="String" />  
             <asp:Parameter Name="NgayThucHien" Type="DateTime" />
            <asp:Parameter Name="MaDonVi" Type="String" />  
        </InsertParameters>
         <SelectParameters>
            <asp:ControlParameter ControlID="rcboDonVi" Name="MaDonVi" Type="String" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="rdtpTuNgay" Name="TuNgay" Type="DateTime" PropertyName="DateInput.SelectedDate" />
            <asp:ControlParameter ControlID="rdtpDenNgay" Name="DenNgay" Type="DateTime" PropertyName="DateInput.SelectedDate" />
        </SelectParameters>   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsDonVi" runat="server" ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [MaDonVi], [TenDonVi] FROM [DonVi]" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsDonVi2" runat="server" ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [MaDonVi], [TenDonVi] FROM [DonVi]" >
        
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsTram" runat="server" ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Id] AS [Tram_Id], [Ten] FROM [DM_TramDuongDay]" />
    
    <asp:SqlDataSource ID="sdsTuyenDay" runat="server" ConnectionString="<%$ ConnectionStrings:iReportConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [TuyenDay], (TuyenDay + ' - ' + Ten_TuyenDay) AS Ten_TuyenDay FROM [LuoiDien] WHERE [DonVi] = @MaDonVi" >
        <SelectParameters>
            <asp:ControlParameter ControlID="rcboDonVi" Name="MaDonVi" Type="String" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
<!-- Content End -->
    </asp:Content>