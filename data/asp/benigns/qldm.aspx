<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="qldm.aspx.vb" Inherits="CDTD.qldm" %>

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
        <small id="titleTab">Quản lý danh mục</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="default.aspx"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
        <li> Quản lý danh mục</li>   
    </ol>
</section>

<section>
   
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="fa fa-table"></i>
                    <h3 class="box-title">Kết quả tìm kiếm: <label class="g_countRowsPaging"><asp:Label ID="lblCount" Text="" runat="server"></asp:Label></label></h3>

                    <div style="float:right; padding-top:10px; padding-right:10px;">
                        <telerik:RadComboBox runat="server" ID="cboNam" EnableLoadOnDemand="True"
                             HighlightTemplatedItems="true" Width="100px" AutoPostBack="true" />
                        <telerik:RadComboBox runat="server" ID="cboPhongBan" EnableLoadOnDemand="True"
                            DataTextField="TenPhongBan" DataSourceID="EntityDataSourcePhongBan"
                            DataValueField="Id" HighlightTemplatedItems="true" Width="250px" AutoPostBack="true" />
                    </div>
                </div>
                <div class="box-body no-padding">
                    <center>
                    


                    <telerik:RadGrid ID="grdData" Width="99%" runat="server" DataSourceID="EntityDataSourceData"
                        AllowPaging="false" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                        AllowAutomaticDeletes="true" AllowSorting="true">
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                            DataKeyNames="Id" CommandItemDisplay="Top">
                            <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                </telerik:GridEditCommandColumn>

                                <telerik:GridTemplateColumn DataField="NoiDungs" UniqueName="NoiDungs" HeaderText="Nội dung" SortExpression="NoiDungs">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl11112" Text='<%#Bind("NoiDungs")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="noidungs" Text='<%#Bind("NoiDungs")%>' TextMode="MultiLine" Width="400" Height="100" runat="server"></asp:TextBox>                                         
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn DataField="Cha_id" UniqueName="Cha_id" HeaderText="Cha ID" SortExpression="Cha_id" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">                               
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1111" Text='<%#Bind("Cha_id")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                         <telerik:RadComboBox runat="server" ID="cboCha" EnableLoadOnDemand="True"
                                            DataTextField="NoiDungs" DataSourceID="EntityDataSourceCha"
                                            DataValueField="Id" SelectedValue='<%#Bind("Cha_id")%>' HighlightTemplatedItems="true" Width="250px" />
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>

                                <telerik:GridNumericColumn DataField="DiemChuan" HeaderText="Điểm chuẩn" SortExpression="DiemChuan"
                                    UniqueName="DiemChuan" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                <telerik:GridNumericColumn DataField="TuCham" HeaderText="Tự chấm" SortExpression="TuCham"
                                    UniqueName="TuCham" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                <telerik:GridNumericColumn DataField="PhucTra" HeaderText="Phúc tra" SortExpression="PhucTra"
                                    UniqueName="PhucTra" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                                
                                <telerik:GridTemplateColumn DataField="IsShow" UniqueName="IsShow" HeaderText="Hiển thị" SortExpression="IsShow" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">                               
                                    <ItemTemplate>                                        
                                        <cc1:CheckBox ID="CheckBox1111" CheckedOverride='<%# Bind("IsShow") %>' Enabled="false" runat="server" />                                        
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <cc1:CheckBox ID="CheckBox11" CheckedOverride='<%# Bind("IsShow") %>' runat="server" />                                         
                                    </EditItemTemplate>
                              </telerik:GridTemplateColumn>    
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
                    <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities" EnableDelete="True" 
                        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                        EntitySetName="CDTD_DMTieuChi" Where="it.[Nam]=@Nam and it.[LoaiPhongBan]=@LoaiPhongBan" OrderBy="it.[Id]" 
                        EntityTypeFilter="CDTD_DMTieuChi"> 
                         <WhereParameters>                        
                            <asp:ControlParameter ControlID="cboNam" DbType="Int32" Name="MaDot" />
                            <asp:ControlParameter ControlID="cboPhongBan" DbType="Int32" Name="LoaiPhongBan" />
                        </WhereParameters>                          
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceCha" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="NoiDung" OrderBy="it.[Id]" Where="it.[Nam]=@Nam and it.[LoaiPhongBan]=@LoaiPhongBan" EntityTypeFilter="NoiDung">
                         <WhereParameters>                        
                            <asp:ControlParameter ControlID="cboNam" DbType="Int32" Name="Nam" />
                            <asp:ControlParameter ControlID="cboPhongBan" DbType="Int32" Name="LoaiPhongBan" />
                        </WhereParameters> 
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourcePhongBan" runat="server" 
                        ConnectionString="name=DiemThiDuaEntities" 
                        DefaultContainerName="DiemThiDuaEntities"
                        EntitySetName="PhongBan" OrderBy="it.[Id]" EntityTypeFilter="PhongBan">
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
