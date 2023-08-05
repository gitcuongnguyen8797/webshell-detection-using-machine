<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="qlnd.aspx.vb" Inherits="CDTD.qlnd" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="CDTD" namespace="CDTD.Samples" tagprefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .rgEditForm table tr td{ padding:5px;}
        .rgEditForm table tr td input[type=text], .rgEditForm table tr td textarea{ width:300px;}
        
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <aside id="system_content_region"><div class="right-side strech" style="min-height: 280px;">
    <section class="content-header">
    <h1>
        Hệ thống
        <small id="titleTab">Quản lý người dùng</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="default.aspx"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li> Quản lý người dùng</li>   
    </ol>
</section>

<section>
   
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="fa fa-table"></i>
                    <h3 class="box-title">Kết quả tìm kiếm: <label class="g_countRowsPaging"><asp:Label ID="lblCount" Text="" runat="server"></asp:Label></label></h3>
                </div>
                <div class="box-body no-padding">
                    <center>
                    <telerik:RadGrid ID="grdData" Width="99%" runat="server" DataSourceID="EntityDataSourceData"
                        AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                        AllowAutomaticDeletes="true" PageSize="50" AllowSorting="true">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                            DataKeyNames="Id" CommandItemDisplay="Top">
                            <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="Id" HeaderText="Id" SortExpression="Id"
                                    UniqueName="Id" Visible="false" ReadOnly="true">
                                </telerik:GridBoundColumn>                               
                                <telerik:GridBoundColumn DataField="FullName" HeaderText="Họ tên" SortExpression="FullName"
                                    UniqueName="FullName">
                                </telerik:GridBoundColumn>
                               <telerik:GridTemplateColumn DataField="UserName" UniqueName="UserName" HeaderText="Tên đăng nhập" SortExpression="UserName" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">                               
                                    <ItemTemplate>                                        
                                        <asp:Label ID="lbl1122" Text='<%#Bind("UserName")%>' runat="server"></asp:Label>                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt" Text='<%#Bind("UserName")%>' runat="server"></asp:TextBox>
                                                                               
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="MatKhau" HeaderText="Mật khẩu" SortExpression="MatKhau"
                                    UniqueName="MatKhau">
                                </telerik:GridBoundColumn>                                
                                <telerik:GridTemplateColumn DataField="ChamDiemChoDonViKhac" UniqueName="ChamDiemChoDonViKhac" HeaderText="Cho phép đăng nhập" SortExpression="ChamDiemChoDonViKhac" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">                               
                                    <ItemTemplate>                                        
                                        <cc1:CheckBox ID="CheckBox1111" CheckedOverride='<%# Bind("ChamDiemChoDonViKhac") %>' Enabled="false" runat="server" />                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <cc1:CheckBox ID="CheckBox11" CheckedOverride='<%# Bind("ChamDiemChoDonViKhac") %>' runat="server" />                                         
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                                
                                <telerik:GridDateTimeColumn DataField="NgayTao" HeaderText="Ngày đăng ký" UniqueName="NgayTao" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" Visible="false" /> 
                                
                                <telerik:GridTemplateColumn DataField="DonVi" UniqueName="DonVi" HeaderText="Đơn vị" SortExpression="DonVi" Visible="false">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl11" Text='<%#Bind("DonVi")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <telerik:RadComboBox runat="server" ID="cboDonVi" EnableLoadOnDemand="True"
                                            DataTextField="Ten" DataSourceID="EntityDataSourceDonVi"
                                            DataValueField="Id" SelectedValue='<%#Bind("DonVi")%>' HighlightTemplatedItems="true" Width="250px" />
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>                             
                              <telerik:GridTemplateColumn DataField="LoaiQuyen" UniqueName="LoaiQuyen" HeaderText="Nhóm quyền" SortExpression="LoaiQuyen" Visible="false">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl111" Text='<%#Bind("LoaiQuyen")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <telerik:RadComboBox runat="server" ID="cboGroup" EnableLoadOnDemand="True"
                                            DataTextField="Ten" DataSourceID="EntityDataSourceGroup"
                                            DataValueField="Id" SelectedValue='<%#Bind("LoaiQuyen")%>' HighlightTemplatedItems="true" Width="250px" />
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                                <%--<telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />--%>
                            </Columns>
                             <NoRecordsTemplate>
                                <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                            </NoRecordsTemplate>
                            <EditFormSettings>
                                <EditColumn ButtonType="ImageButton" />
                            </EditFormSettings>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities" EnableDelete="True" 
                        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                        EntitySetName="CDTD_User" OrderBy="it.[Id]" 
                        EntityTypeFilter="CDTD_User">                        
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceDonVi" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="CDTD_DMDonVi" OrderBy="it.[Id]" EntityTypeFilter="CDTD_DMDonVi">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceGroup" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="CDTD_LoaiQuyen" OrderBy="it.[Id]" EntityTypeFilter="CDTD_LoaiQuyen">
                    </asp:EntityDataSource>
                    
                   
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
