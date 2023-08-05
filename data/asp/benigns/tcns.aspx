<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tcns.aspx.vb" Inherits="CDTD.tcns" %>

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
        Chấm điểm
        <small id="titleTab">Ban tổ chức nhân sự</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="default.aspx"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li> Ban tổ chức nhân sự</li>   
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
                        AllowAutomaticDeletes="true" AllowSorting="true">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                            DataKeyNames="User_ID" CommandItemDisplay="Top">
                            <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID"
                                    UniqueName="User_ID" Visible="false" ReadOnly="true">
                                </telerik:GridBoundColumn>                               
                                <telerik:GridBoundColumn DataField="Name" HeaderText="Họ tên" SortExpression="Name"
                                    UniqueName="Name">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Username" HeaderText="Tên đăng nhập" SortExpression="Username"
                                    UniqueName="Username">
                                </telerik:GridBoundColumn> 
                                <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                                    UniqueName="Email">
                                </telerik:GridBoundColumn>    
                                <telerik:GridBoundColumn DataField="Password" HeaderText="Mật khẩu" SortExpression="Password"
                                    UniqueName="Password">
                                </telerik:GridBoundColumn>                                
                                <telerik:GridTemplateColumn DataField="Usertype" UniqueName="Usertype" HeaderText="IsAdmin" SortExpression="Usertype" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">                               
                                    <ItemTemplate>                                        
                                        <cc1:CheckBox ID="CheckBox1111" CheckedOverride='<%# Bind("Usertype") %>' Enabled="false" runat="server" />                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <cc1:CheckBox ID="CheckBox11" CheckedOverride='<%# Bind("Usertype") %>' runat="server" />                                         
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Is_Block" UniqueName="Is_Block" HeaderText="Khóa" SortExpression="Is_Block">                               
                                    <ItemTemplate>                                        
                                        <cc1:CheckBox ID="CheckBox111" CheckedOverride='<%# Bind("Is_Block") %>' Enabled="false" runat="server" />                                                                                
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <cc1:CheckBox ID="CheckBox1" CheckedOverride='<%# Bind("Is_Block") %>' runat="server" />                                                                                  
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                                <telerik:GridDateTimeColumn DataField="Register_Date" HeaderText="Ngày đăng ký" UniqueName="Register_Date" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" Visible="false" /> 
                                <telerik:GridDateTimeColumn DataField="LastVisit_Date" HeaderText="Lần cuối đăng nhập" UniqueName="LastVisit_Date" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" Visible="false" /> 
                                <telerik:GridTemplateColumn DataField="DonVi_ID" UniqueName="DonVi_ID" HeaderText="Đơn vị" SortExpression="DonVi_ID" Visible="false">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl11" Text='<%#Bind("DonVi_ID")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <telerik:RadComboBox runat="server" ID="cboDonVi" EnableLoadOnDemand="True"
                                            DataTextField="TenDayDu" DataSourceID="EntityDataSourceDonVi"
                                            DataValueField="DonVi_ID" SelectedValue='<%#Bind("DonVi_ID")%>' HighlightTemplatedItems="true" Width="250px" />
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                              <telerik:GridTemplateColumn DataField="Group_ID" UniqueName="Group_ID" HeaderText="Nhóm quyền" SortExpression="Group_ID" Visible="false">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl111" Text='<%#Bind("Group_ID")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <telerik:RadComboBox runat="server" ID="cboGroup" EnableLoadOnDemand="True"
                                            DataTextField="Name" DataSourceID="EntityDataSourceGroup"
                                            DataValueField="Group_ID" SelectedValue='<%#Bind("Group_ID")%>' HighlightTemplatedItems="true" Width="250px" />
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>

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
                    <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities" EnableDelete="True" 
                        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                        EntitySetName="U_User" OrderBy="it.[User_ID]" 
                        EntityTypeFilter="U_User">                        
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceDonVi" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="S_DonVi" OrderBy="it.[DonVi_ID]" EntityTypeFilter="S_DonVi">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceGroup" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="U_Group" OrderBy="it.[Group_ID]" EntityTypeFilter="U_Group">
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
</asp:Content>
