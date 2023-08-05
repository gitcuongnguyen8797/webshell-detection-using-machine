<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="dsmusic.aspx.vb" Inherits="hcmpc.dsmusic" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="hcmpc" namespace="hcmpc.Samples" tagprefix="cc1" %>

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
			<div class="pagetitle icon-48-article"><h2>Quản lý album nhạc</h2></div>
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
            #td1 input[type=text] {
                 width:350px;
            }
            #td1 input[type=image] {
                background: none;
                border: none;
                font-size: 13px;
                height: auto;
                line-height: auto;
            }
            .bor1{ border:solid 1px #DDD; width:49.4%; background-color:#fff; vertical-align:top;}
            .bor2{ border:solid 1px #DDD; background-color:#fff; vertical-align:top;}
            .tit{ background-color:#DDD; color:#146295; font-weight:bold; font-size:14px; text-align:center; padding:5px;}       
        </style>
        
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
            <table id="tbl" width="100%">
                    <tr>
                        <td class="bor1" id="td1">
             <div class="tit" style="margin-bottom:33px">Danh sách album bài hát</div>
             <telerik:RadGrid ID="grdAlbum" runat="server" DataSourceID="EntityDataSourceAlbumList"
                AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                AllowAutomaticDeletes="true" AllowSorting="true">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView DataSourceID="EntityDataSourceAlbumList" AutoGenerateColumns="False"
                    DataKeyNames="ID" CommandItemDisplay="Top">
                    <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                    <Columns>
                        <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                        </telerik:GridEditCommandColumn>
                        <telerik:GridBoundColumn DataField="ID" HeaderText="ID" SortExpression="ID"
                            UniqueName="ID" Visible="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" HeaderText="Tiêu đề" SortExpression="Title"
                            UniqueName="Title">
                        </telerik:GridBoundColumn>                                                               
                        <telerik:GridButtonColumn Text="Delete" ConfirmText="Xóa album với tất cả bài hát trong album?" CommandName="Delete" ButtonType="ImageButton" />
                    </Columns>
                     <NoRecordsTemplate>
                        <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                    </NoRecordsTemplate>
                    <EditFormSettings>
                        <EditColumn ButtonType="ImageButton" />
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:EntityDataSource ID="EntityDataSourceAlbumList" runat="server" 
                ConnectionString="name=WEBHCMPCEntities" 
                DefaultContainerName="WEBHCMPCEntities" EnableDelete="True" 
                EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                EntitySetName="A_MusicList" OrderBy="it.[ID]" EntityTypeFilter="A_MusicList">
            </asp:EntityDataSource>  
              </td>
                        <td></td>
                        <td class="bor1">
             <div class="tit">Danh sách bài hát</div>
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
                        DataKeyNames="ID" CommandItemDisplay="Top">
                        <CommandItemSettings AddNewRecordText="Thêm mới" RefreshText="Làm mới" />
                        <Columns>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn DataField="ID" HeaderText="ID" SortExpression="ID"
                                UniqueName="ID" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Title" HeaderText="Tiêu đề" SortExpression="Title"
                                UniqueName="Title">
                            </telerik:GridBoundColumn>                           
                            <telerik:GridTemplateColumn DataField="ImgUrl" HeaderText="Hình ảnh" UniqueName="ImgUrl">
                                <ItemTemplate>
                                   <asp:Label ID="lbl1" Text='<%#Bind("ImgUrl")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>             
                                    <asp:FileUpload ID="upImgUrl" Width="352" runat="server" />                                  
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>    
                            <telerik:GridTemplateColumn DataField="FileUrl" HeaderText="Tập tin" UniqueName="FileUrl">
                                <ItemTemplate>
                                   <asp:Label ID="lbl2" Text='<%#Bind("FileUrl")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>             
                                    <asp:FileUpload ID="upFileUrl" Width="352" runat="server" />                                  
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>                       
                            <telerik:GridBoundColumn DataField="TacGia" HeaderText="Tác giả" UniqueName="TacGia"></telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="LuotXem" HeaderText="Lượt xem" UniqueName="LuotXem"></telerik:GridBoundColumn>
                            <telerik:GridCheckBoxColumn DataField="Is_Published" HeaderText="Trạng thái" UniqueName="Is_Published"></telerik:GridCheckBoxColumn>  
                            <telerik:GridButtonColumn ConfirmText="Xóa bài hát?" Text="Delete"  CommandName="Delete" ButtonType="ImageButton" />
                        </Columns>
                                                
                         <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                       

                        <EditFormSettings InsertCaption="Add new item" CaptionFormatString="Edit News Item: {0}"
                            CaptionDataField="NewsId" EditFormType="Template" >
                            <FormTemplate>
                                <table id="Table1" cellspacing="1" cellpadding="1" border="0">
                                    <tr>
                                        <td>Album:</td>
                                        <td>
                                            <telerik:RadComboBox runat="server" ID="RadComboBox1" EnableLoadOnDemand="True"
                                                DataTextField="Title" DataSourceID="EntityDataSource1"
                                                DataValueField="ID" SelectedValue='<%#Bind("MusicListID")%>' HighlightTemplatedItems="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Tiêu đề:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox10" Text='<%# Bind( "Title") %>' runat="server">
                                            </asp:TextBox>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td valign="top">
                                            Hình ảnh nhỏ:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox12" ReadOnly="true" Text='<%# Bind("ImgUrl") %>' runat="server">
                                            </asp:TextBox>
                                            <br />
                                             <asp:FileUpload ID="txtFile" runat="server" />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td valign="top">
                                            Tập tin nhạc:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox22" ReadOnly="true" Text='<%# Bind("FileUrl") %>' runat="server">
                                            </asp:TextBox>
                                            <br />
                                             <asp:FileUpload ID="txtFile1" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tác giả:</td>
                                        <td>
                                             <asp:TextBox ID="TextBox1" Text='<%# Bind( "TacGia") %>' runat="server">
                                                </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>Lượt xem:</td>
                                        <td>
                                            <telerik:RadNumericTextBox ID="TextBox2" DataType="System.Int16" NumberFormat-DecimalDigits="0" DBValue='<%# Bind( "LuotXem") %>' runat="server"></telerik:RadNumericTextBox>
                                             
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái:</td>
                                        <td> 
                                            <cc1:CheckBox ID="CheckBox1" CheckedOverride='<%# Bind( "Is_Published") %>' runat="server" /> 
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
                    EntitySetName="A_Music" Where="it.MusicListID=@MusicListID" OrderBy="it.[ID]" EntityTypeFilter="A_Music"> 
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cboVTHT" DbType="Int32" DefaultValue="0" Name="MusicListID" />
                        </WhereParameters>                
                </asp:EntityDataSource> 
                <asp:EntityDataSource ID="EntityDataSourceVTHT" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="A_MusicList" OrderBy="it.[ID]" EntityTypeFilter="A_MusicList">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
                    ConnectionString="name=WEBHCMPCEntities" 
                    DefaultContainerName="WEBHCMPCEntities"
                    EntitySetName="A_MusicList" Where="it.ID=@ID" OrderBy="it.[ID]" EntityTypeFilter="A_MusicList">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="cboVTHT" DbType="Int32" DefaultValue="0" Name="ID" />
                    </WhereParameters>
                </asp:EntityDataSource>         
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
         </td>
        </tr>
       </table>
    </div>
</div>

</asp:Content>

