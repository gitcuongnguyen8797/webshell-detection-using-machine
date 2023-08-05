<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="lichsu.aspx.vb" Inherits="CDTD.lichsu" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="CDTD" namespace="CDTD.Samples" tagprefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
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
        Hệ thống
        <small id="titleTab">Nhật ký người dùng</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="default.aspx"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li> Nhật ký người dùng</li>   
    </ol>
</section>

<section>
   
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="fa fa-table"></i>
                    <h3 class="box-title">Kết quả: <label class="g_countRowsPaging"><asp:Label ID="lblCount" Text="" runat="server"></asp:Label></label></h3>

                </div>
                <div class="box-body no-padding">
                    <center>
                    


                    <telerik:RadGrid ID="grdData" Width="99%" runat="server"
                        AllowPaging="true" PageSize="50" AllowSorting="true">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView AutoGenerateColumns="False"
                            DataKeyNames="Id" CommandItemDisplay="Top">
                            <CommandItemSettings AddNewRecordText="Thêm mới" ShowRefreshButton="false" ShowAddNewRecordButton="false" RefreshText="Làm mới" />
                            <Columns>                                
                                
                                <telerik:GridBoundColumn DataField="NguoiDung" HeaderText="Người dùng" SortExpression="NguoiDung"
                                    UniqueName="NguoiDung" />
                                <telerik:GridBoundColumn DataField="TenDot" HeaderText="Đợt thi" SortExpression="TenDot"
                                    UniqueName="TenDot" />  
                              <telerik:GridBoundColumn DataField="NgaySua" DataType="System.DateTime" HeaderText="Ngày sửa"
                                SortExpression="NgaySua" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" UniqueName="NgaySua">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>


                            </Columns>
                             <NoRecordsTemplate>
                                <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                            </NoRecordsTemplate>
                            <EditFormSettings>
                                <EditColumn ButtonType="ImageButton" />
                            </EditFormSettings>
                        </MasterTableView>
                    </telerik:RadGrid>
                                                                               
                    </center>

                </div><!-- /.box -->
                <div class="box-footer clearfix">
                    <div class="row">
                        
                    </div>
                </div>
            </div>
        </div><!-- /.col -->
    </div>
</section>    


</aside>
    
        
<asp:PlaceHolder ID="msg" runat="server">                
     </asp:PlaceHolder>
</asp:Content>
