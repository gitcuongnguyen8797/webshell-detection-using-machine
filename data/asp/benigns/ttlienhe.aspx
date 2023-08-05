<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="ttlienhe.aspx.vb" Inherits="hcmpc.ttlienhe" %>
<%@ Register assembly="hcmpc" namespace="hcmpc.Samples" tagprefix="cc1" %>
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
			<div class="pagetitle icon-48-article"><h2>Quản lý giao diện</h2></div>
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
        
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
             <div style="float:right; padding:5px">
                    <telerik:RadComboBox ID="cboVTHT" AutoPostBack="true" DataTextField="Title" DataSourceID="EntityDataSourceVTHT"
                                                DataValueField="ID" Runat="server" Width="250"></telerik:RadComboBox> 
                </div>
                <div style="clear:both"></div>
                <telerik:RadGrid ID="grdData" runat="server" DataSourceID="EntityDataSourceData"
                    AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                    AllowAutomaticDeletes="true" AllowSorting="true">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView DataSourceID="EntityDataSourceData" AutoGenerateColumns="False"
                        DataKeyNames="id" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn DataField="id" HeaderText="ID" SortExpression="id"
                                UniqueName="id" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="title" HeaderText="Tiêu đề" SortExpression="title"
                                UniqueName="title">
                            </telerik:GridBoundColumn>                           
                            <telerik:GridTemplateColumn DataField="image" HeaderText="Hình ảnh" UniqueName="image">
                                <ItemTemplate>
                                   <asp:Label ID="lbl1" Text='<%#Bind("image")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>             
                                    <asp:FileUpload ID="upImageURL" Width="352" runat="server" />                                  
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>                           
                            <telerik:GridBoundColumn DataField="url" HeaderText="Đường link" UniqueName="url"></telerik:GridBoundColumn> 
                             <telerik:GridTemplateColumn DataField="position" UniqueName="position" HeaderText="Vị trí" SortExpression="position">    
                                <ItemTemplate>
                                    <asp:Label ID="lbl" Text='<%#Bind("position")%>' runat="server"></asp:Label>
                                </ItemTemplate>                           
                                <EditItemTemplate>
                                     
                                </EditItemTemplate>
                              </telerik:GridTemplateColumn>
                              <telerik:GridDateTimeColumn DataField="startdate" HeaderText="Từ ngày" UniqueName="startdate" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" />
                              <telerik:GridDateTimeColumn DataField="enddate" HeaderText="Đến ngày" UniqueName="enddate" PickerType="DatePicker" DataFormatString="{0:dd/MM/yyyy}" />
                              <telerik:GridCheckBoxColumn DataField="is_published" HeaderText="Hiện thị" UniqueName="is_published"></telerik:GridCheckBoxColumn> 
                            <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                        </Columns>
                                                
                         <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                       

                        <EditFormSettings InsertCaption="Add new item" CaptionFormatString="Edit News Item: {0}"
                            CaptionDataField="NewsId" EditFormType="Template" >
                            <FormTemplate>
                                <table id="Table1" cellspacing="1" cellpadding="1" border="0">
                         
                                    <tr>
                                        <td>
                                            Tiêu đề:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox10" Text='<%# Bind( "title") %>' runat="server">
                                            </asp:TextBox>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td valign="top">
                                            Hình ảnh (300x170):
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox12" ReadOnly="true" Text='<%# Bind("image") %>' runat="server">
                                            </asp:TextBox>
                                            <br />
                                             <asp:FileUpload ID="txtFile" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Đường link:</td>
                                        <td>
                                             <asp:TextBox ID="TextBox1" Text='<%# Bind( "url") %>' runat="server">
                                                </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vị trí hiển thị:</td>
                                        <td>
                                            <telerik:RadComboBox runat="server" ID="RadComboBox1" EnableLoadOnDemand="True"
                                                DataTextField="Title" DataSourceID="EntityDataSourceVTHT"
                                                DataValueField="ID" SelectedValue='<%#Bind("idvitri")%>' HighlightTemplatedItems="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vị trí thứ tự:</td>
                                        <td>
                                            <telerik:RadComboBox runat="server" ID="cboPosition" EnableLoadOnDemand="True"
                                                DataTextField="position" DataSourceID="EntityDataSourcePosition"
                                                DataValueField="position" SelectedValue='<%#Bind("position")%>' HighlightTemplatedItems="true" />
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            Từ ngày       
                                        </td>                                        
                                        <td>
                                          <telerik:RadDatePicker ID="txtTuNgay" DBSelectedDate='<%#Bind("startdate")%>' DateInput-ReadOnly="true" runat="server" Culture="vi-VN">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Đến ngày       
                                        </td>                                        
                                        <td>
                                          <telerik:RadDatePicker ID="txtDenNgay" DBSelectedDate='<%#Bind("enddate")%>' DateInput-ReadOnly="true" runat="server" Culture="vi-VN">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hiển thị:</td>
                                        <td>
                                            <cc1:CheckBox ID="CheckBox1" CheckedOverride='<%# Bind( "is_published") %>' runat="server" />
                                           
                                        </td>
                                    </tr>                                    
                                </table>
                                <table style="width: 100%">
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="Button1" Text='<%# IIF(TypeOf Container is GridEditFormInsertItem,"Thêm mới","Cập nhật") %>'
                                                runat="server" CommandName='<%# IIF(TypeOf Container is GridEditFormInsertItem , "PerformInsert" , "Update") %>'>
                                            </asp:Button> 
                                            <asp:Button ID="Button2" Text="Quay lại" runat="server" CausesValidation="False" CommandName="Cancel">
                                            </asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </FormTemplate>
                        </EditFormSettings> 

                    </MasterTableView>
                </telerik:RadGrid>
                <asp:EntityDataSource ID="EntityDataSourceData" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="S_TT_CanBiet" Where="it.idvitri=@idvitri" OrderBy="it.[ID]" EntityTypeFilter="S_TT_CanBiet"> 
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cboVTHT" DbType="Int32" DefaultValue="0" Name="idvitri" />
                        </WhereParameters>                
                </asp:EntityDataSource>       
                <asp:EntityDataSource ID="EntityDataSourcePosition" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="S_Position" OrderBy="it.[position]" EntityTypeFilter="S_Position">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSourceVTHT" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="S_ViTriHienThi" OrderBy="it.[ID]" EntityTypeFilter="S_ViTriHienThi">
                </asp:EntityDataSource>         
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        
    </div>
</div>

</asp:Content>
