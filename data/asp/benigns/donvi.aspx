<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="donvi.aspx.vb" Inherits="hcmpc.donvi" %>

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
			<div class="pagetitle icon-48-article"><h2>Quản lý đơn vị</h2></div>
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
          
      <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <telerik:RadGrid ID="grdData" runat="server" DataSourceID="EntityDataSourceData"
                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                    AllowAutomaticDeletes="true" AllowSorting="true" PageSize="17">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                        DataKeyNames="DonVi_ID" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn DataField="DonVi_ID" HeaderText="ID" SortExpression="DonVi_ID"
                                UniqueName="DonVi_ID" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>                            
                             <telerik:GridBoundColumn DataField="TenDonVi" HeaderText="Tên đơn vị" SortExpression="TenDonVi"
                                UniqueName="TenDonVi" />
                            <telerik:GridBoundColumn DataField="TenDayDu" HeaderText="Tên đầy đủ" SortExpression="TenDayDu"
                                UniqueName="TenDayDu" />
                            <telerik:GridBoundColumn DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi"
                                UniqueName="DiaChi" />
                            <telerik:GridBoundColumn DataField="DienThoai" HeaderText="Điện thoại" SortExpression="DienThoai"
                                UniqueName="DienThoai" />
                            <telerik:GridBoundColumn DataField="lat" HeaderText="Lat" SortExpression="lat"
                                UniqueName="lat" />
                            <telerik:GridBoundColumn DataField="lng" HeaderText="Lng" SortExpression="lng"
                                UniqueName="lng" />  
                            <telerik:GridBoundColumn DataField="MaCu" HeaderText="Mã cũ" SortExpression="MaCu"
                                UniqueName="MaCu" />                           
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
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="S_DonVi" OrderBy="it.[DonVi_ID]" EntityTypeFilter="S_DonVi">
                </asp:EntityDataSource>
                
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        
    </div>
</div>

</asp:Content>