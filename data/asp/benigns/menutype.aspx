<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="menutype.aspx.vb" Inherits="hcmpc.menutype" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        function isFormValid() {
            var txtTitle = document.getElementById("<%=txtName.ClientID %>");

            if (txtTitle.value == '') {
                alert("Vui lòng nhập tiêu đề");
                txtTitle.focus();
                return false;
            }

            return true;
        }    
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            <ul>
                <li id="toolbar-apply" class="button">
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= btnLuu.UniqueID %>','')">
                <span class="icon-32-apply">
                </span>
                Lưu
                </a>
                </li>

                <li id="toolbar-save" class="button">
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= btnLuuThoat.UniqueID %>','')">
                <span class="icon-32-save">
                </span>
                Lưu và thoát
                </a>
                </li>

                <li id="toolbar-save-new" class="button">
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= btnLuuMoi.UniqueID %>','')">
                <span class="icon-32-save-new">
                </span>
                Lưu &amp; thêm mới
                </a>
                </li>

                <li id="toolbar-cancel" class="button">
                <a class="toolbar" href="menuitem.aspx">
                <span class="icon-32-cancel">
                </span>
                Hủy bỏ
                </a>
                </li>

                <li class="divider">
                </li>

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
					<div class="pagetitle icon-48-article-add"><h2>Quản lý Menu: <%= IIf(Request("ID") = "", "Thêm menu mới", "Chỉnh sửa menu")%></h2></div>
			</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box" style="font-size:12px;">
    <div class="m">
        <table border="0" width="100%" cellspacing="5">  
            <tr>
                <td width="100">
                    Tiêu đề <span style="color:Red">*</span>         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtName" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Url       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtUrl" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Parent
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadComboBox ID="cboParent" Runat="server" Width="300">                    
                   </telerik:RadComboBox>
             
                </td>
            </tr>            
            <tr>
                <td>
                    Level      
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <telerik:RadComboBox ID="cboLevel" Runat="server" Width="300">
                    <Items>
                        <telerik:RadComboBoxItem Value="1" Text="1" />
                        <telerik:RadComboBoxItem Value="2" Text="2" />
                        <telerik:RadComboBoxItem Value="3" Text="3" />                        
                    </Items>
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    Vị trí        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <telerik:RadComboBox ID="cboPosition" Runat="server" Width="300" DataTextField="position" DataSourceID="EntityDataSourcePosition"
                     DataValueField="position" HighlightTemplatedItems="true">                    
                   </telerik:RadComboBox>
                   <asp:EntityDataSource ID="EntityDataSourcePosition" runat="server" 
                        ConnectionString="name=WEBHCMPCEntities" 
                        DefaultContainerName="WEBHCMPCEntities"
                        EntitySetName="S_Position" OrderBy="it.[position]" EntityTypeFilter="S_Position">
                    </asp:EntityDataSource>
                </td>
            </tr> 
            <tr>
                <td>
                    Hình ảnh
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:FileUpload ID="upImageURL" runat="server" Width="502px" /><br /> 
                    <asp:Label ID="lblImageURL" ForeColor="Red" runat="Server"></asp:Label>                 
                </td>
            </tr>    
            <tr style="display:none">
                <td>
                      
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="right">
                   <asp:Button ID="btnLuu" runat="server" Width="80" Text="Lưu"></asp:Button>
                   <asp:Button ID="btnLuuThoat" runat="server" Width="80" Text="LưuThoat"></asp:Button>
                   <asp:Button ID="btnLuuMoi" runat="server" Width="80" Text="LưuMoi"></asp:Button>
                </td>
            </tr>  
        </table>
    </div>

 </div>


</asp:Content>
