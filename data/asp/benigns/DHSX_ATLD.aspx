<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="DHSX_ATLD.aspx.vb" UICulture="vi" Culture="vi-VN" Inherits="niengiam.DHSX_ATLD" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controls/importExcel.ascx" TagPrefix="uc1" TagName="importExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="Scripts/jquery.min.js"></script>    
     <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/bootstrap-multiselect.js"></script>
    <link href="css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="Scripts/bootstrap-multiselect.js"
        type="text/javascript"></script>
    <script src="Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.MultiFile.js" type="text/javascript"></script>


     <style>
        .tableEmpty tr td {
        padding:1px;
        }
        .container {
    width: 75% !important;
}
    </style>


    <script type="text/javascript">
        $(function () {
            $('[id*=lstFruits]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-info">
        <div class="panel-heading" style="text-align: center;">
            <h4 class="text-center">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </h4>
            <div align="center" style="height: 50px">
                <asp:DropDownList ID="cboThang" class="form-control" Style="max-width: 350px; margin: auto;" AutoPostBack="true" OnTextChanged="cboThang_TextChanged" runat="server"></asp:DropDownList>
                <asp:DropDownList ID="cboNam" class="form-control" Style="max-width: 350px; margin: auto;" AutoPostBack="true" OnTextChanged="cboNam_TextChanged" runat="server"></asp:DropDownList>
             <!--   <div class="btn-group">-->
                <asp:Button ID="BTimKiem" runat="server" class="btn btn-warning" Text="Xem báo cáo" />
                <asp:Button ID="BtXuat_Excel" runat="server" class="btn btn-success" Text="Xuất excel" />
                <uc1:importExcel runat="server" ID="importExcel"  />
                <asp:Button ID="btngetdata" runat="server" class="btn btn-info" Text="Lấy số liệu" /> 
                <%--<asp:Button ID="btnchot" runat="server" class="btn btn-danger" Text="Chốt số liệu" />--%> 
  
            </div>
        </div>
        <div class="panel-body">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="Machitieu" AutoGenerateColumns="False" Width="100%">
                <SettingsDataSecurity AllowEdit="true" />
                <Settings ShowGroupPanel="false" ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" />
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" FixedStyle="Left" Width="50px">
                        <EditButton Visible="true">
                            <Image Url="~/images/editRed.png" Width="50%">
                            </Image>
                        </EditButton>
                        <UpdateButton>
                            <Image Url="~/images/saveGreen.png" Width="50%">
                            </Image>
                        </UpdateButton>
                        <CancelButton>
                            <Image Url="~/images/cancelRed.png" Width="50%">
                            </Image>
                        </CancelButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="STT" Name="STT" VisibleIndex="1" Caption="STT" FixedStyle="Left" Width="40px" ReadOnly="True">
                      <CellStyle HorizontalAlign="Center"></CellStyle>
                        <HeaderStyle VerticalAlign="Middle" />
                        <ExportCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                        </ExportCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CHITIEU" Name="CHITIEU" VisibleIndex="2" Caption="Chỉ tiêu" FixedStyle="Left" Width="300px" ReadOnly="true">
                        <HeaderStyle VerticalAlign="Middle" />
                        <ExportCellStyle HorizontalAlign="Left" Wrap="False"></ExportCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DVT" Name="DVT" VisibleIndex="3" Caption="Đơn vị tính" FixedStyle="Left" ReadOnly="true" Width="60px">
                        <HeaderStyle VerticalAlign="Middle" />
                        <ExportCellStyle HorizontalAlign="Left" Wrap="False"></ExportCellStyle>
                    </dx:GridViewDataTextColumn>
                <%--    <dx:GridViewDataTextColumn FieldName="Kehoach_EVN" Name="Kehoach_EVN" VisibleIndex="4" Caption="Kế hoạch EVN" FixedStyle="Left" ReadOnly="true" Width="90px">
                        <HeaderStyle VerticalAlign="Middle" />
                        <ExportCellStyle HorizontalAlign="Right" Wrap="False"></ExportCellStyle>
                        <CellStyle HorizontalAlign="Right"></CellStyle>
                         <PropertiesTextEdit DisplayFormatString="N2"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>

                     <dx:GridViewDataTextColumn FieldName="Kehoach_TCT" Name="Kehoach_TCT" VisibleIndex="4" Caption="Kế hoạch TCT" FixedStyle="Left" ReadOnly="true" Width="90px">
                        <HeaderStyle VerticalAlign="Middle" />
                        <ExportCellStyle HorizontalAlign="Right" Wrap="False"></ExportCellStyle>
                        <CellStyle HorizontalAlign="Right"></CellStyle>
                         <PropertiesTextEdit DisplayFormatString="N2"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>--%>
                    <dx:GridViewBandColumn Caption="THỰC HIỆN THÁNG [N] NĂM [N]"
                        Name="GrNam" VisibleIndex="5">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Thực hiện" FieldName="THUCHIEN_THANG" Width="90px" ReadOnly="false"
                                Name="THUCHIEN_THANG" VisibleIndex="0">
                              <PropertiesTextEdit DisplayFormatString="N2"/>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Thực hiện cùng kỳ" FieldName="THUCHIEN_THANG_CK" Width="90px"
                                Name="THUCHIEN_THANG_CK" VisibleIndex="1">
                               <PropertiesTextEdit DisplayFormatString="N2"/>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right"></CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn  Caption="± % so cùng kỳ" FieldName="TANGGIAM_THANG_CK" Width="80px"
                                Name="TANGGIAM_THANG_CK" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                <PropertiesTextEdit DisplayFormatString="P2"></PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="THỰC HIỆN LŨY KẾ [N] THÁNG NĂM [N]"
                        Name="GrNamLK" VisibleIndex="6" HeaderStyle-HorizontalAlign="Center">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Thực hiện" FieldName="THUCHIEN_NAM" Width="100px"
                                Name="THUCHIEN_NAM" VisibleIndex="0">
                                 <PropertiesTextEdit DisplayFormatString="N2"/>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Thực hiện cùng kỳ" FieldName="THUCHIEN_NAM_CK" Width="100px"
                                Name="THUCHIEN_NAM_CK" VisibleIndex="1">
                                <PropertiesTextEdit DisplayFormatString="N2"/>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn  Caption="± % so cùng kỳ" FieldName="TANGGIAM_CK" Width="80px"
                                Name="TANGGIAM_CK" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                <PropertiesTextEdit DisplayFormatString="P2"></PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </dx:GridViewDataTextColumn>

                          <%--   <dx:GridViewDataTextColumn Caption="So kế hoạch EVN" FieldName="Sosanh_kehoach_EVN" Width="80px"
                                Name="Sosanh_kehoach_EVN" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                <PropertiesTextEdit DisplayFormatString="P2"></PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="So kế hoạch TCT" FieldName="Sosanh_kehoach_TCT" Width="80px"
                                Name="Sosanh_kehoach_TCT" VisibleIndex="2" HeaderStyle-HorizontalAlign="Center">
                                <PropertiesTextEdit DisplayFormatString="P2"></PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </dx:GridViewDataTextColumn>--%>

                        </Columns>                        
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </dx:GridViewBandColumn>
                </Columns>
                <SettingsBehavior AllowGroup="False" AllowSort="false" AllowFocusedRow="false" />
                <SettingsPager Visible="False" Mode="ShowAllRecords">
                </SettingsPager>
                <SettingsEditing Mode="Inline">
                </SettingsEditing>
                <Settings HorizontalScrollBarMode="Auto" />
                   <Styles  Header-Wrap="True">
                    <Header Wrap="True" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="10pt"></Header>
                                        <Row Font-Size="10pt">
                   </Row>
                   <AlternatingRow BackColor="#DDDDDD">
                   </AlternatingRow>
                                        <Footer Font-Bold="True">
                   </Footer>
                                        </Styles>
            </dx:ASPxGridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="DHSX_ATBHLD_LOAD" SelectCommandType="StoredProcedure"  UpdateCommand="select * from AT_BHLD">
             <SelectParameters>
              <asp:Parameter DefaultValue="9" Name="Thang" Type="int32" />
                    <asp:Parameter DefaultValue="2019" Name="Nam" Type="Int32" />

            <%--   <asp:Parameter DefaultValue="2019" Name="Nam" Type="Int32" />
                <asp:Parameter DefaultValue="8" Name="Thang" Type="int32" />--%>
            </SelectParameters>           
        </asp:SqlDataSource>
            <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="ASPxGridView1">
                <PageHeader>
                    <Font Size="XX-Large"></Font>
                </PageHeader>
            </dx:ASPxGridViewExporter>
        </div>
    </div>
</asp:Content>
