<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="KT_SanLuong_KhongPhanPhoi.aspx.vb" Inherits="niengiam.KT_SanLuong_KhongPhanPhoi" UICulture="vi" Culture="vi-VN" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controls/importExcel.ascx" TagPrefix="uc1" TagName="importExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
                .center {
                    display: table;
                    width: 100%;
                    height: 400px; /* for demo only */
                   /* border: 1px dotted blue;*/
                }
                .v-align {
                    padding: 10px;
                  /*  border: 1px dashed gray;*/
                    display: table-cell;
                    text-align: center;
                    vertical-align: middle;
                    /*margin-left:50px;*/
                }
               .box {
                    width: 932px;
                    height: 100%;
                    background-color: White;
                    display: inline-block;
                    vertical-align: top;
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
            SẢN LƯỢNG KHÔNG PHÂN PHỐI</h4>
        
 
    <div align="center" style="height: 30px">
        <asp:DropDownList id="cboThang" class="form-control" style="max-width: 350px; margin: auto;" runat="server" AutoPostBack="true" OnTextChanged="cboThang_TextChanged">           
      </asp:DropDownList>
       &nbsp;<asp:DropDownList id="cboNam" class="form-control" style="max-width: 350px; margin: auto;" runat="server" AutoPostBack="true" OnTextChanged="cboNam_TextChanged">
           
      </asp:DropDownList>
        <asp:Button ID="BTimKiem" runat="server" class="btn btn-success" Text="Xem báo cáo"/>
        <asp:Button ID="BtXuat_Excel" runat="server" class="btn btn-warning" Text="Xuất Excel"/>
        <uc1:importExcel runat="server" id="importExcel" />
       
    </div>
  
              
       
    </div>
    <div class="center">
        <div class="v-align">
            <div class="box">
            <dx:ASPxGridView ID="grid" runat="server" DataSourceID="DemoDataSource1"
        KeyFieldName="EmployeeID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" />
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                <EditFormSettings VisibleIndex="0" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                <EditFormSettings VisibleIndex="1" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataMemoColumn FieldName="Notes" Visible="False">
                <EditFormSettings Visible="True" VisibleIndex="2" />
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                <EditFormSettings VisibleIndex="3" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                <EditFormSettings VisibleIndex="4" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                <EditFormSettings VisibleIndex="5" />
            </dx:GridViewDataColumn>
        </Columns>
        <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
        <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="768" />
        </EditFormLayoutProperties>
        <SettingsPopup>
            <EditForm Width="730">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
        <SettingsPager Mode="ShowAllRecords" />
    </dx:ASPxGridView>

          <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="NAM;THANG"  AutoGenerateColumns="False" Width="100%" Visible="false">
              <Settings ShowGroupPanel="false" ShowFooter="false" ShowGroupFooter="VisibleIfExpanded" />
               <Columns>
                  <%--<dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"  FixedStyle="Left" Width="50px" >
                        <editbutton visible="True">
                        <Image Url="~/images/editRed.png" Width="50%">
                        </Image>
                    </editbutton>
                    <UpdateButton>
                        <Image Url="~/images/saveGreen.png"  Width="50%">
                        </Image>
                    </UpdateButton>
                    <CancelButton>
                        <Image Url="~/images/cancelRed.png"  Width="50%">
                        </Image>
                    </CancelButton>
                  </dx:GridViewCommandColumn>--%>
                  <dx:GridViewDataTextColumn FieldName="STT" Name="STT" VisibleIndex="1" Caption="Tháng"  FixedStyle="Left" Width="60px" ReadOnly="True">
                       
                      <HeaderStyle VerticalAlign="Middle" />
                      <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                      </CellStyle>
                      <ExportCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                      </ExportCellStyle>
                       
                  </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="DINHKY" Name="DINHKY" VisibleIndex="2" Width="150px"
                      Caption="Công tác"  FixedStyle="Left" ShowInCustomizationForm="False">
                <PropertiesTextEdit DisplayFormatString="N2"/>
                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                     <HeaderStyle VerticalAlign="Middle" />
                     <ExportCellStyle HorizontalAlign="Center" Wrap="True">
                     </ExportCellStyle>
                  </dx:GridViewDataTextColumn> 
                  <dx:GridViewDataTextColumn Caption="Đột xuất" FieldName="DOTSUAT" Name="DOTSUAT" ShowInCustomizationForm="True" VisibleIndex="3" Width="140px">
                  <%--<PropertiesTextEdit DisplayFormatString="N2"/>--%>
                      <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                  </dx:GridViewDataTextColumn>

                  <dx:GridViewDataTextColumn  Caption="Sự cố" FieldName="SUCO" Name="SUCO" ShowInCustomizationForm="True" VisibleIndex="4" Width="140px">
                  <PropertiesTextEdit DisplayFormatString="N2"/>
                      <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                  </dx:GridViewDataTextColumn>
                <%--   <dx:GridViewDataTextColumn  Caption="Cao thế" FieldName="CAOTHE" Name="CAOTHE" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N2"/>
                      <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                  </dx:GridViewDataTextColumn>--%>
                  <dx:GridViewDataTextColumn  Caption="A2" FieldName="A2" Name="A2" ShowInCustomizationForm="True" VisibleIndex="5" Width="135px">
                    <%--<PropertiesTextEdit DisplayFormatString="N2"/>--%>
                        <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn  Caption="F81" FieldName="F81" Name="F81" ShowInCustomizationForm="True" VisibleIndex="6" Width="125px">
                <%--<PropertiesTextEdit DisplayFormatString="N2"/>--%>
                    <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn  Caption="Tổng SL (kWh)" FieldName="TONGSL" Name="TONGSL" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="7" ReadOnly="True" Width="180px">
                    <PropertiesTextEdit DisplayFormatString="N2"/>
                    <CellStyle HorizontalAlign="Right" VerticalAlign="Middle"></CellStyle>
                  </dx:GridViewDataTextColumn>
                 
              </Columns>
              <SettingsBehavior AllowGroup="False" />
              <SettingsPager NumericButtonCount="30" PageSize="30" Visible="False">
              </SettingsPager>
               


              <SettingsEditing Mode="Inline">
              </SettingsEditing>
              <Settings HorizontalScrollBarMode="Auto" ShowGroupButtons="False" />
               <SettingsPopup>
                   <EditForm AllowResize="True" HorizontalAlign="Center" VerticalAlign="Middle" />
              </SettingsPopup>
              <SettingsDataSecurity AllowEdit="true" AllowDelete="False" AllowInsert="False" />
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
            SelectCommand="KT_MAUKT1_SLKPP_LOAD"
            SelectCommandType="StoredProcedure"
            
  UpdateCommand="select * from DVTT_TTTTHTHSKV">
             <SelectParameters>
               <asp:Parameter DefaultValue="2016" Name="Nam" Type="Int32" />
                <%-- <asp:Parameter DefaultValue="0" Name="maDot" Type="int32" />
                <asp:Parameter DefaultValue="0" Name="madonvicuabotieuchi" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="showAll" Type="Int32" />--%>
                    
                 <asp:Parameter DefaultValue="7" Name="THANG" Type="Int32" />
                    
            </SelectParameters>
            

      
        </asp:SqlDataSource> 
          <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="ASPxGridView1" ReportHeader="{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil\fcharset238{\*\fname Times New Roman;}Times New Roman CE;}}
\viewkind4\uc1\pard\qc\f0\fs32 T\'ecnh h\'ecnh th\u7921?c hi\u7879?n ch\u7881?nh trang d\'e2y th\'f4ng tin tr\'ean tr\u7909? \f1\'f0i\f0\u7879?n\fs20\par
}
">
              <PageHeader>
                  <Font Size="XX-Large"></Font>
              </PageHeader>
          </dx:ASPxGridViewExporter>
    </div>
    <br /> 
   </div>
    </div>
    </div>
  
   
</asp:Content>
