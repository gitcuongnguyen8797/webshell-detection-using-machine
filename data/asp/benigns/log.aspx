<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="log.aspx.vb" Inherits="hcmpc.log" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript" src="../js/popup.js"></script>
    <script type="text/javascript">
   
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            <ul>
                <li id="toolbar-help" class="button">
                <a class="toolbar" rel="help" href="#">
                <span class="icon-32-help">
                </span>
                Trợ giúp
                </a>
                </li>
            </ul>
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>Quản lý lịch sử: Lịch sử</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        <link rel="stylesheet" href="css/grid.css" type="text/css" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="mygrid" runat="server" AutoGenerateColumns="False" GridLines="None"
                    AllowPaging="True" AllowSorting="True" PageSize="20" AllowMultiRowSelection="true">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView AutoGenerateColumns="False"
                        DataKeyNames="ID">                
                        <Columns>                           
                            <telerik:GridBoundColumn DataField="ID" HeaderText="ID" UniqueName="ID"
                                Visible="false">
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="Action" HeaderText="Action">    
                                <HeaderStyle Font-Bold="true" />                                                  
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="ContentSQL" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="100" UniqueName="ContentSQL" DataField="ContentSQL">
                                <ItemTemplate>
                                    <div id='d<%#Eval("id") %>' style="background-color:#DDD;border:1px solid #666;display:none;width:500px;height:300px; overflow:auto; text-align:left; padding:5px; color:Red;"><%# Eval("ContentSQL")%></div>
                                    <a style=" font-size:12px; color:#333;" href="#" onclick="Popup.show('d<%#Eval("id") %>');return false;">Chi tiết</a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>   
                            <telerik:GridBoundColumn DataField="ClientIP" HeaderText="ClientIP">    
                                <HeaderStyle Font-Bold="true" />             
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="MAC" HeaderText="MAC">    
                                <HeaderStyle Font-Bold="true"  />                                             
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="Time" DataType="System.DateTime" HeaderText="Ngày"
                                SortExpression="Time" DataFormatString="{0:dd/MM/yyyy HH:mm}" UniqueName="Time">
                                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" Width="100" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>   
                            <telerik:GridBoundColumn DataField="UserName" HeaderText="Người dùng">    
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100" />     
                                <ItemStyle HorizontalAlign="Center" />                                              
                            </telerik:GridBoundColumn> 
                            <telerik:GridBoundColumn DataField="TableName" HeaderText="Table Name">    
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100" />     
                                <ItemStyle HorizontalAlign="Center" />                                              
                            </telerik:GridBoundColumn>        
                            <telerik:GridBoundColumn DataField="ID" HeaderText="ID" UniqueName="ID">    
                                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" Width="100" />                           
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>
                
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</div>
 <div style="display:none">
    
</div>

</asp:Content>
