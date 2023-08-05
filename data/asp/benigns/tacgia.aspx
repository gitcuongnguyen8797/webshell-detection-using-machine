<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="tacgia.aspx.vb" Inherits="hcmpc.tacgia" %>
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
			<div class="pagetitle icon-48-user"><h2>Quản lý tác giả</h2></div>
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
       <asp:HiddenField ID="hdDonVi" Value="0" runat="server" />       
          
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="grdData" runat="server" DataSourceID="EntityDataSourceTacGia"
                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                    AllowAutomaticDeletes="true" AllowSorting="true">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView DataSourceID="EntityDataSourceTacGia" AutoGenerateColumns="False"
                        DataKeyNames="AuthorID" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn DataField="AuthorID" HeaderText="ID" SortExpression="AuthorID"
                                UniqueName="AuthorID" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HoTen" HeaderText="Họ tên" SortExpression="HoTen"
                                UniqueName="HoTen">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BiDanh" HeaderText="Bí danh" SortExpression="BiDanh"
                                UniqueName="BiDanh">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DiaChi" HeaderText="Phòng ban" UniqueName="DiaChi" Visible="false">
                            </telerik:GridBoundColumn>  
                            <telerik:GridBoundColumn DataField="Phone" HeaderText="Điện thoại" UniqueName="Phone">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email" UniqueName="Email">
                            </telerik:GridBoundColumn>  
                            <telerik:GridCheckBoxColumn DataField="Is_Block" HeaderText="Khóa" UniqueName="Is_Block"></telerik:GridCheckBoxColumn>  
                            <telerik:GridDateTimeColumn DataField="Register_Date" HeaderText="Ngày đăng ký" UniqueName="Register_Date" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" />  
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
                    EntitySetName="U_Author" Where="it.[DonVi_ID]=@dvid" OrderBy="it.[AuthorID]" EntityTypeFilter="U_Author">
                     <WhereParameters>                        
                        <asp:ControlParameter ControlID="hdDonVi" DbType="Int32" DefaultValue="0" Name="dvid" />
                    </WhereParameters>
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSourceDonVi" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="S_DonVi" Where="it.[DonVi_ID]=@dvid" OrderBy="it.[DonVi_ID]" EntityTypeFilter="S_DonVi">
                     <WhereParameters>                        
                        <asp:ControlParameter ControlID="hdDonVi" DbType="Int32" DefaultValue="0" Name="dvid" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</div>

</asp:Content>
