<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhaptext.aspx.vb" Inherits="hcmpc.nhaptext" %>

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
			<div class="pagetitle icon-48-article"><h2>Quản lý thông báo</h2></div>
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
                            <telerik:GridTemplateColumn HeaderText="Nội dung" UniqueName="noidung" DataField="noidung">
                                <EditItemTemplate>
                                    <telerik:RadEditor runat="server" ID="RadEditor1" Content='<%# Bind("noidung") %>' Width="800px" Height="400px" Skin="Vista">
                                      <Tools>
                                           <telerik:EditorToolGroup Tag="FileManagers">
                                                <telerik:EditorTool Name="ImageManager"></telerik:EditorTool>
                                                <telerik:EditorTool Name="FlashManager"></telerik:EditorTool>
                                                <telerik:EditorTool Name="SilverlightManager"></telerik:EditorTool>
                                                <telerik:EditorTool Name="MediaManager"></telerik:EditorTool>
                                                <telerik:EditorTool Name="DocumentManager"></telerik:EditorTool>
                                                <telerik:EditorTool Name="TemplateManager"></telerik:EditorTool>
                                           </telerik:EditorToolGroup>
                                           <telerik:EditorToolGroup>
                                                <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                <telerik:EditorSeparator></telerik:EditorSeparator>
                                                <telerik:EditorTool Name="ForeColor"></telerik:EditorTool>
                                                <telerik:EditorTool Name="BackColor"></telerik:EditorTool>
                                                <telerik:EditorSeparator></telerik:EditorSeparator>
                                                <telerik:EditorTool Name="FontName"></telerik:EditorTool>
                                                <telerik:EditorTool Name="RealFontSize"></telerik:EditorTool>
                                           </telerik:EditorToolGroup>
                                      </Tools>
                                      <ImageManager ViewPaths="~/upload_images"
                                           UploadPaths="~/upload_images"
                                           DeletePaths="~/upload_images"
                                           SearchPatterns="*.jpeg,*.jpg,*.png,*.gif,*.bmp"
                                            />
                                      <FlashManager ViewPaths="~/upload_images"
                                           UploadPaths="~/upload_images"
                                           DeletePaths="~/upload_images"
                                            />
                                      <MediaManager ViewPaths="~/upload_images"
                                           UploadPaths="~/upload_images"
                                           DeletePaths="~/upload_images"
                                            />
                                      <DocumentManager ViewPaths="~/upload_images"
                                           UploadPaths="~/upload_images"
                                           DeletePaths="~/upload_images"
                                            />
                                      <TemplateManager ViewPaths="~/upload_images"
                                           UploadPaths="~/upload_images"
                                           DeletePaths="~/upload_images"
                                           SearchPatterns="*.html,*.html"
                                            />
                                      <SilverlightManager ViewPaths="~/upload_images"
                                           UploadPaths="~/upload_images"
                                           DeletePaths="~/upload_images"
                                           SearchPatterns="*.xap"
                                           />                                      
                                 </telerik:RadEditor>                                                           
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl" runat="server" Text='<%#Eval("noidung") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>  
                            <telerik:GridTemplateColumn DataField="position" UniqueName="position" HeaderText="Vị trí" SortExpression="position">    
                                <ItemTemplate>
                                    <asp:Label ID="lbl1" Text='<%#Bind("position")%>' runat="server"></asp:Label>
                                </ItemTemplate>                           
                                <EditItemTemplate>
                                     <telerik:RadComboBox runat="server" ID="cboPosition" EnableLoadOnDemand="True" Width="355"
                                                DataTextField="Position" DataSourceID="EntityDataSourcePosition"
                                                DataValueField="Position" SelectedValue='<%#Bind("position")%>' HighlightTemplatedItems="true" />
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
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                    EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                    EntitySetName="S_Text" OrderBy="it.[id]" EntityTypeFilter="S_Text">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSourcePosition" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="S_Position" OrderBy="it.[position]" EntityTypeFilter="S_Position" />
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        
    </div>
</div>

</asp:Content>
