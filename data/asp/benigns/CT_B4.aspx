<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam1.Master" CodeBehind="CT_B4.aspx.vb" Inherits="niengiam.CT_B4" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
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
           Bảng 4: Doanh thu, giá bán và giá mua điện bình quân
            
        </h4>
        
 
    <div align="center" style="height: 30px">
    <asp:DropDownList id="cboThang" class="form-control" style="max-width: 350px; margin: auto;"
           runat="server">
           
      </asp:DropDownList>
       <asp:DropDownList id="cboNam" class="form-control" style="max-width: 350px; margin: auto;"
           runat="server">
           
      </asp:DropDownList>
      
        <asp:Button ID="BTimKiem" runat="server" class="btn btn-success" Text="Tìm kiếm"/>
        <asp:Button ID="BtXuat_Excel" runat="server" class="btn btn-warning" Text="Xuất excel"/>
   
          
    </div>
  
              
       
    </div>
    <div class="panel-body">
        

      <div>
          <dx:ASPxGridView ID="ASPxGridView1" runat="server" KeyFieldName="MaDV;Nam;Thang"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" Theme="Office2010Blue">
              <Columns>
                  <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"  FixedStyle="Left" >
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
                  </dx:GridViewCommandColumn>
                  <dx:GridViewDataTextColumn FieldName="ChiTieu" Name="ChiTieu" VisibleIndex="1" 
                      Caption="Chỉ tiêu"  FixedStyle="Left" Width="50px" ReadOnly="True">
                       
                      <HeaderStyle VerticalAlign="Middle" />
                      <ExportCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                      </ExportCellStyle>
                       
                  </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="DVT" Name="DVT" VisibleIndex="2" 
                      Caption="ĐVT"  FixedStyle="Left" ReadOnly="true">
                     <HeaderStyle VerticalAlign="Middle" />
                     <ExportCellStyle HorizontalAlign="Center" Wrap="True">
                     </ExportCellStyle>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewBandColumn Caption="Tháng [N]/2016" 
                      Name="GrThangNam" VisibleIndex="4">
                      <Columns>
                          <dx:GridViewDataTextColumn Caption="Thực hiện" FieldName="ThucHienThangNam" 
                              Name="ThucHienThangNam" VisibleIndex="0">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn Caption="± % so cùng kỳ năm 2015" 
                              FieldName="ThangNam_SoCungKy" Name="ThangNam_SoCungKy" ReadOnly="True" 
                              VisibleIndex="2">
                          </dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:GridViewBandColumn>
                 
                  <dx:GridViewBandColumn Caption="Lũy kế [N] Tháng năm 2016" 
                      Name="GrThangNamLK" VisibleIndex="5">
                      <Columns>
                          <dx:GridViewDataTextColumn Caption="Thực hiện" FieldName="ThucHienThangNam_LuyKe" 
                              Name="ThucHienThangNam_LuyKe" VisibleIndex="0" ReadOnly="True">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn Caption="± % so cùng kỳ năm 2015" 
                              FieldName="LK_ThangNam_SoCungKy" Name="LK_ThangNam_SoCungKy" 
                              ReadOnly="True" VisibleIndex="2">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn Caption="So KH 2016" FieldName="SoKeHoachNam" 
                              Name="SoKeHoachNam" ReadOnly="True" ShowInCustomizationForm="True" 
                              VisibleIndex="3">
                          </dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:GridViewBandColumn>
                 
                  <dx:GridViewDataTextColumn Caption="Kế hoạch năm 2016 " FieldName="KeHoachNam" 
                      Name="KeHoachNam" VisibleIndex="3">
                  </dx:GridViewDataTextColumn>
                 
              </Columns>
              <Settings ShowGroupPanel="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                <TotalSummary>
                     <dx:ASPxSummaryItem FieldName="KeHoachNam" SummaryType="Sum" DisplayFormat="{0}"/>
                    <dx:ASPxSummaryItem FieldName="ThucHienThangNam" SummaryType="Sum" DisplayFormat="{0}"/>
                    <dx:ASPxSummaryItem FieldName="ThucHienThangNamTruoc" SummaryType="Sum" DisplayFormat="{0}"/>
                    <dx:ASPxSummaryItem FieldName="ThucHienThangNam_LuyKe" SummaryType="Sum" DisplayFormat="{0}"/>
                     <dx:ASPxSummaryItem FieldName="ThucHienThangNamTruoc_LuyKe" SummaryType="Sum" DisplayFormat="{0}"/>
                    
                </TotalSummary>
               


              <SettingsEditing Mode="Inline">
              </SettingsEditing>
              <Settings HorizontalScrollBarMode="Auto" />
              <SettingsDataSecurity AllowEdit="true" />
               <Styles  Header-Wrap="True">
<Header Wrap="True"></Header>
                                        </Styles>
          </dx:ASPxGridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="DVTT_TKD_GETDANHSACH"
            SelectCommandType="StoredProcedure"
            
  UpdateCommand="select * from DVTT_TKD">
             <SelectParameters>
               <asp:Parameter DefaultValue="2016" Name="Nam" Type="Int32" />
                <asp:Parameter DefaultValue="10" Name="Thang" Type="int32" />
               <%-- <asp:Parameter DefaultValue="0" Name="madonvicuabotieuchi" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="showAll" Type="Int32" />--%>
                    
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
