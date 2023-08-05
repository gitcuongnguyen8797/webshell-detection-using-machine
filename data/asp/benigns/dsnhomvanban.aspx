<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="dsnhomvanban.aspx.vb" Inherits="hcmpc.dsnhomvanban" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-user"><h2>Quản lý nhóm pháp chế</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        
        <style>
           
            #<%=grdData.ClientID%> input[type=image] {
                background: none;
                border: none;
                font-size: 13px;
                height: auto;
                line-height: auto;
            }
            
            #<%=grdData.ClientID%> input[type=text], select 
            {
                width:350px;
                
            }
                   
        </style>
            
          
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="grdData" runat="server" DataSourceID="EntityDataSourceTacGia"
                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                    AllowAutomaticDeletes="true" AllowSorting="true">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView DataSourceID="EntityDataSourceTacGia" AutoGenerateColumns="False"
                        DataKeyNames="VanBan_Type" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn DataField="VanBan_Type" HeaderText="ID" SortExpression="VanBan_Type"
                                UniqueName="VanBan_Type" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Title" HeaderText="Tiêu đề" SortExpression="Title"
                                UniqueName="Title">
                            </telerik:GridBoundColumn>                           
                            <telerik:GridCheckBoxColumn DataField="Is_Published" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Trạng thái" UniqueName="Is_Published"></telerik:GridCheckBoxColumn>
                            <telerik:GridTemplateColumn DataField="NhomID" UniqueName="NhomID" HeaderText="Nhóm" SortExpression="NhomID" Visible="false">                               
                                <ItemTemplate>
                                    <asp:Label ID="lbl11" Text='<%#Bind("NhomID")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                     <telerik:RadComboBox runat="server" ID="cboDonVi" EnableLoadOnDemand="True"
                                        DataTextField="TenNhom" DataSourceID="EntityDataSourceDonVi"
                                        DataValueField="NhomID" SelectedValue='<%#Bind("NhomID")%>' HighlightTemplatedItems="true" Width="250px" />   
                                                               
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
                <asp:EntityDataSource ID="EntityDataSourceTacGia" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="A_VanBan_Type" OrderBy="it.[VanBan_Type]" EntityTypeFilter="A_VanBan_Type">                     
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSourceDonVi" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="A_VanBan_Nhom" OrderBy="it.[NhomID]" EntityTypeFilter="A_VanBan_Nhom">                    
                </asp:EntityDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</div>

</asp:Content>
