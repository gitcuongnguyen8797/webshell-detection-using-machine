<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="import.aspx.vb" Inherits="CDTD.import" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="CDTD" namespace="CDTD.Samples" tagprefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        function isFormValid() {
            var upFileUpload = document.getElementById("<%=upFileUpload.ClientID %>");
            var txtDongBD = document.getElementById("<%=txtDongBD.ClientID %>");
            var txtDongKT = document.getElementById("<%=txtDongKT.ClientID %>");

            if (upFileUpload.value == '') {
                alert("Chọn tập tin upload!!!");
                upFileUpload.focus();
                return false;
            }

            if (txtDongBD.value == '') {
                alert("Nhập dòng bắt đầu!!!");
                txtDongBD.focus();
                return false;
            }

            if (txtDongKT.value == '' || txtDongKT.value == '0') {
                alert("Nhập dòng kết thúc!!!");
                txtDongKT.focus();
                return false;
            }

            return true;
        }    
    </script>
    <style>
        .rgEditForm table tr td{ padding:5px;}
        .rgEditForm table tr td input[type=text], .rgEditForm table tr td textarea{ width:300px;}
        
        span.gi {
            float: left;
        }
        span.gi {
            color: #d7d7d7;
            font-weight: bold;
            margin-right: 5px;
        }
        .RadGrid_Default .rgRow td,.RadGrid_Default .rgAltRow td
        {
            font-size:95%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <aside id="system_content_region"><div class="right-side strech" style="min-height: 280px;">
    <section class="content-header">
    <h1>
        Quản lý danh mục các tiêu chí
    </h1>
    <ol class="breadcrumb">
        <li><a href="default.aspx"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li> Danh mục các tiêu chí</li>   
    </ol>
</section>

<section>
   
    <div class="row">        
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="fa fa-table"></i>
                    <h3 class="box-title">Kết quả: <label class="g_countRowsPaging"><asp:Label ID="lblCount" Text="" runat="server"></asp:Label></label></h3>
                    <div style="float:right; padding-top:10px; padding-right:10px;">
                        <telerik:RadComboBox runat="server" ID="cboDot" EnableLoadOnDemand="True"
                                    DataTextField="Ten"
                                    DataValueField="Id" HighlightTemplatedItems="true" Width="250px" AutoPostBack="true" />
                        <telerik:RadComboBox runat="server" ID="cboDonVi1" EnableLoadOnDemand="True"
                            DataTextField="Ten"
                            DataValueField="Id" HighlightTemplatedItems="true" Width="300px" AutoPostBack="true" />
                    </div>
                </div>
                
                <div class="box-body no-padding" style=" overflow:scroll; height:300px;">
                    <center>
                    


                    <telerik:RadGrid ID="grdData" Width="99%" runat="server"
                        AllowPaging="false" PageSize="50" AllowSorting="true">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView AutoGenerateColumns="False"
                            DataKeyNames="Id" CommandItemDisplay="Top">
                            <CommandItemSettings AddNewRecordText="Thêm mới" ShowRefreshButton="false" ShowAddNewRecordButton="false" RefreshText="Làm mới" />
                            <Columns>
                                
                                <telerik:GridTemplateColumn DataField="Ten" UniqueName="Ten" HeaderText="Tiêu chí" SortExpression="Ten">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl11112" Text='<%#Bind("Ten")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="noidungs" Text='<%#Bind("Ten")%>' TextMode="MultiLine" Width="400" Height="100" runat="server"></asp:TextBox>                                         
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn DataField="ParentID" UniqueName="ParentID" HeaderText="Cha ID" SortExpression="ParentID" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1111" Text='<%#Bind("ParentID")%>' runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdID" Value='<%#Bind("Id")%>' runat="server" />
                                         <asp:HiddenField ID="hdIsCha" Value="0" runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>                                        
                                        <asp:TextBox ID="parentid" Text='<%#Bind("ParentID")%>' TextMode="MultiLine" Width="400" Height="100" runat="server"></asp:TextBox>   
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                                <telerik:GridNumericColumn DataField="DiemChuan" HeaderText="Điểm chuẩn" SortExpression="DiemChuan"
                                    UniqueName="DiemChuan" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />                                                                                                
                                   
                              <telerik:GridBoundColumn DataField="Id" HeaderText="ID" SortExpression="Id"
                                    UniqueName="Id" ReadOnly="true" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                            </Columns>
                             <NoRecordsTemplate>
                                <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                            </NoRecordsTemplate>
                            <EditFormSettings>
                                <EditColumn ButtonType="ImageButton" />
                            </EditFormSettings>
                        </MasterTableView>
                    </telerik:RadGrid>
                    
                             
                    <asp:EntityDataSource ID="EntityDataSourceDonVi" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="CDTD_DMDonVi" EntityTypeFilter="CDTD_DMDonVi">
                    </asp:EntityDataSource>                                       
                    </center>
                    
                </div>                
                <!-- /.box -->
                <div class="box-footer clearfix">
                    <div class="row">
                        
                        


                    </div>
                </div>
            </div>
        </div><!-- /.col -->
        <section id="dashboard_box3" class="col-md-12">
            <div class="box box-success">
                <div class="box-header">
                    <i class="fa fa-bars"></i><h3 class="box-title">Import Tiêu Chí (.XLS)</h3>
                </div>
                <div style="overflow: auto" class="box-body table-responsive padding" id="divTable">
                    <table width="100%" cellspacing="0" cellpadding="0" class="table table-striped table-bordered" borfder="0">                        
                        <tr>
                            <td>Tập tin upload</td>                            
                            <td>
                                <asp:FileUpload ID="upFileUpload" runat="server" Width="502px" /><br /> 
                                <asp:Label ID="lblFileUpload" ForeColor="Red" runat="Server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Dòng bắt đầu <span style="color:Red">*</span>
                            </td>                           
                            <td>
                                <telerik:RadNumericTextBox DataType="System.Int16" NumberFormat-DecimalDigits="0" Value="0" ID="txtDongBD"  runat="server"></telerik:RadNumericTextBox>  
                                 <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtDongBD"></asp:RequiredFieldValidator>         
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Dòng kết thúc <span style="color:Red">*</span>
                            </td>                           
                            <td>
                                <telerik:RadNumericTextBox DataType="System.Int16" NumberFormat-DecimalDigits="0" Value="0" ID="txtDongKT"  runat="server"></telerik:RadNumericTextBox>    
                                <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txtDongKT"></asp:RequiredFieldValidator>          
                            </td>
                        </tr>
                        <tr>
                            <td>Đơn vị</td>
                            <td>
                                <telerik:RadListBox ID="lstDonVi" runat="server" CheckBoxes="true" ShowCheckAll="true" Width="300"
                                    Height="300px" DataSourceID="EntityDataSourceDonVi" DataTextField="Ten" DataValueField="Id">                                    
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Khối chức năng</td>
                            <td>
                                <telerik:RadListBox ID="lstKhoiChucNang" runat="server" CheckBoxes="true" ShowCheckAll="true" Width="300"
                                    Height="300px" DataSourceID="EntityDataSourceDonVi" DataTextField="Ten" DataValueField="Id">                                    
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                
                                <asp:Button ID="btnSave" runat="server" Width="100" CssClass="btn btn-primary" Text="Lưu" />
                                
                            </td>                            
                        </tr>
                    </table>
                </div>
           </div>
       </section>
    </div>
</section>    


</aside>
    
        
<asp:PlaceHolder ID="msg" runat="server">                
     </asp:PlaceHolder>
</asp:Content>
