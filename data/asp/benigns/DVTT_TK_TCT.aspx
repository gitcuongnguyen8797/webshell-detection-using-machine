<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="DVTT_TK_TCT.aspx.vb" UICulture="vi" Culture="vi-VN"  Inherits="niengiam.DVTT_TK_TCT" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controls/importExcel.ascx" TagPrefix="uc1" TagName="importExcel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Scripts/jquery.min.js"></script>    
     <%--<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />--%>
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
            <asp:Label runat="server" Text="TỔNG HỢP TỒN KHO VTTB TỔNG CÔNG TY CUỐI THÁNG [N] NĂM [2017]" ID="lblTitle"></asp:Label>
            
        </h4>
        
 
    <div align="center" style="height: 30px">
    <asp:DropDownList id="cboThang" class="form-control" style="max-width: 350px; margin: auto;"
        AutoPostBack="true" OnTextChanged="cboThang_TextChanged"   runat="server">
           
      </asp:DropDownList>
       <asp:DropDownList id="cboNam" class="form-control" style="max-width: 350px; margin: auto;"
        AutoPostBack="true" OnTextChanged="cboNam_TextChanged"   runat="server">
           
      </asp:DropDownList>
      
        <asp:Button ID="BTimKiem" runat="server" class="btn btn-success" Text="Xem báo cáo"/>
        <asp:Button ID="BtXuat_Excel" runat="server" class="btn btn-warning" Text="Xuất excel"/>
        <uc1:importExcel runat="server" id="importExcel"  />
         <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Lấy số liệu"/>  
    </div>
  
              
       
    </div>
    <div class="panel-body">
        
        <asp:Label ID="donvitinh" Text="Đơn vị tính: đồng" runat="server" style="font-style: italic;font-size: 12px;"></asp:Label>
      <div>
          <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="MaDV;Nam;Thang"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
               <Settings ShowGroupPanel="false" ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" />
              <Columns>
                  <dx:GridViewDataTextColumn FieldName="mota" Name="mota" VisibleIndex="1" Caption="Hạng mục"  FixedStyle="Left" ReadOnly="True" Width="270px">
                       
                      <HeaderStyle VerticalAlign="Middle" />
                      <ExportCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                      </ExportCellStyle>
                       
                  </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="DinhMuc2016" Name="DinhMuc2016" VisibleIndex="2" Caption="Định mức 2016"  FixedStyle="Left" ReadOnly="true" Width="120px">
                     <HeaderStyle VerticalAlign="Middle" />
                     <ExportCellStyle HorizontalAlign="Center" Wrap="True">
                     </ExportCellStyle>
                     <PropertiesTextEdit DisplayFormatString="N0"></PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn  PropertiesTextEdit-DisplayFormatString="N0" Caption="Tồn kho cuối năm 2015" VisibleIndex="3" FieldName="TonKhoCuoiNam2015" Name="TonKhoCuoiNam2015" Width="120px">
<PropertiesTextEdit DisplayFormatString="N0"></PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="N0" Caption="Tồn kho cuối tháng [N-1]/2017" VisibleIndex="4" FieldName="TonKhoCuoiThangTruoc" Name="TonKhoCuoiThangTruoc" Width="120px">
<PropertiesTextEdit DisplayFormatString="N0"></PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="N0" Caption="Tồn kho cuối tháng [N] /2017" VisibleIndex="5" FieldName="TonKhoCuoiThangHienTai" Name="TonKhoCuoiThangHienTai" Width="120px">
<PropertiesTextEdit DisplayFormatString="N0"></PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="N0" Caption="ChiTieuId" VisibleIndex="0" FieldName="ChiTieuId" Name="ChiTieuId" Visible="False">
<PropertiesTextEdit DisplayFormatString="N0"></PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewBandColumn Caption="Chênh lệch so định mức" Name="GrCLSoDinhMuc" VisibleIndex="8">
                      <Columns>
                          <dx:GridViewDataTextColumn Caption="Giá trị" FieldName="ChenhLechDinhMuc_GiaTri" Name="ChenhLechDinhMuc_GiaTri" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                              <PropertiesTextEdit DisplayFormatString="N0">
                              </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn Caption="Tỷ lệ (%)" FieldName="ChenhLechDinhMuc_TyLe" Name="ChenhLechDinhMuc_TyLe" ShowInCustomizationForm="True" VisibleIndex="1">
                              <PropertiesTextEdit DisplayFormatString="P2">
                              </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:GridViewBandColumn>
                  <dx:GridViewBandColumn Caption="Chênh lệch so với tháng trước" Name="GrCLSoThangTruoc" VisibleIndex="9">
                      <Columns>
                          <dx:GridViewDataTextColumn Caption="Giá trị" FieldName="ChenhLechThangTruoc_GiaTri" Name="ChenhLechThangTruoc_GiaTri" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                              <PropertiesTextEdit DisplayFormatString="N0">
                              </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn Caption="Tỷ lệ (%)" FieldName="ChenhLechThangTruoc_TyLe" Name="ChenhLechThangTruoc_TyLe" ShowInCustomizationForm="True" VisibleIndex="1">
                              <PropertiesTextEdit DisplayFormatString="P2">
                              </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:GridViewBandColumn>
                  <dx:GridViewBandColumn Caption="Chênh lệch 
so cuối năm 2015" Name="GrCLSo2015" VisibleIndex="12">
                      <Columns>
                          <dx:GridViewDataTextColumn Caption="Giái trị" FieldName="ChenhLechSoCuoiNam2015_GiaTri" Name="ChenhLechSoCuoiNam2015_GiaTri" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                              <PropertiesTextEdit DisplayFormatString="N0">
                              </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn Caption="Tỷ lệ (%)" FieldName="ChenhLechSoCuoiNam2015_TyLe" Name="ChenhLechSoCuoiNam2015_TyLe" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="P2">
                              </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>
                      </Columns>
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
            SelectCommand="VT_TonKho_TCT_GETDANHSACH"
            SelectCommandType="StoredProcedure">
             <SelectParameters>
               <asp:Parameter DefaultValue="2016" Name="Nam" Type="Int32" />
                <asp:Parameter DefaultValue="10" Name="Thang" Type="int32" />
                    
            </SelectParameters>
            

      
        </asp:SqlDataSource> 
          <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="ASPxGridView1">
              <PageHeader>
                  <Font Size="XX-Large"></Font>
              </PageHeader>
          </dx:ASPxGridViewExporter>
    </div>
    <br /> 
    </div>
</div>
   
</asp:Content>
