<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="qlhinhanh.aspx.vb" Inherits="hcmpc.qlhinhanh" %>

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
			<div class="pagetitle icon-48-article"><h2>Quản lý hình ảnh</h2></div>
		</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box">
    <div class="m">        
        
        <telerik:RadFileExplorer runat="server" ID="FileExplorer1" Width="100%" Height="520px">
                <Configuration ViewPaths="~/upload_images" UploadPaths="~/upload_images"
                    DeletePaths="~/upload_images" SearchPatterns="*.jpeg,*.jpg,*.png,*.gif,*.bmp,*.doc,*.docx,*.pdf,*.xlsx,*.xls,*.swf"></Configuration>
        </telerik:RadFileExplorer>
        
    </div>
</div>

</asp:Content>
