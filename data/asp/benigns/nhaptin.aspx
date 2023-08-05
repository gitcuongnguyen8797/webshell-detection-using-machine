<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhaptin.aspx.vb" Inherits="hcmpc.nhaptin" ValidateRequest="false"  %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
         function isFormValid() {
             var txtTitle = document.getElementById("<%=txtTitle.ClientID %>");
             var txtTitle_Alias = document.getElementById("<%=txtTitle_Alias.ClientID %>");

             if (txtTitle.value == '') {
                 alert("Vui lòng nhập tiêu đề");
                 txtTitle.focus();
                 return false;
             }
             if (txtTitle_Alias.value == '') {
                 alert("Vui lòng nhập alias");
                 txtTitle_Alias.focus();
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
                <a class="toolbar" href="dstin.aspx">
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
					<div class="pagetitle icon-48-article-add"><h2>Quản lý bài viết: <%=IIf(Request("ID") = "", "Viết bài mới", "Chỉnh sửa bài viết")%></h2></div>
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
                    Thể loại          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadComboBox ID="cboSection" Runat="server" Width="300"></telerik:RadComboBox>          
                </td>
            </tr>
             <tr>
                <td>
                    Danh mục          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadComboBox ID="cboCat" Runat="server" Width="300"></telerik:RadComboBox>          
                </td>
            </tr>
            <tr>
                <td>
                    Tiêu đề <span style="color:Red">*</span>         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Alias <span style="color:Red">*</span>         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtTitle_Alias" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Nội dung ngắn        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtIntroText" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Từ khóa          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtMetaKeywords" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Từ khóa mô tả          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtMetaDescription" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                     Hình ảnh
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="left">
                   <asp:FileUpload ID="upFile" runat="server" Width="400px" />
                </td>
            </tr>

            <tr>
                <td>
                     Hình ảnh nhỏ
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="left">
                   <asp:FileUpload ID="upFileSmall" runat="server" Width="400px" />
                </td>
            </tr>

            <tr>
                <td>
                    File đính kèm
                </td>
                <td>
            
                </td>
                <td>
                <asp:FileUpload ID="upFileToServer" runat="server" Width="400px" /> &nbsp; <asp:Button ID="btnUpload" runat="server" Width="80" Text="Upload" Visible="false"></asp:Button><br />
                <asp:TextBox ID="txtTenFile" TextMode="SingleLine" runat="server" Width="200"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Tác giả bài viết          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>                    
                    <telerik:RadComboBox runat="server" ID="cboTGBaiViet" Filter="Contains" EnableLoadOnDemand="True" 
                                        DataTextField="HoTen"
                                        DataValueField="AuthorID" HighlightTemplatedItems="true" Width="300px" />    
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="tacgia.aspx">Thêm tác giả mới</a>      
                </td>
            </tr>
             <tr>
                <td>
                    Tác giả hình ảnh          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>                    
                    <telerik:RadComboBox runat="server" ID="cboTGHinhAnh" Filter="Contains" EnableLoadOnDemand="True" 
                                        DataTextField="HoTen"
                                        DataValueField="AuthorID" HighlightTemplatedItems="true" Width="300px" />          
                </td>
            </tr>
            <tr>
                <td>
                    Số lượng ảnh trong bài         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>                    
                    <telerik:RadNumericTextBox ID="txtSLAnh" Value="0" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" runat="server"></telerik:RadNumericTextBox>          
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <p style="margin-left:0px;">Soạn thảo nội dung bài viết:</p>                    
                    <CKEditor:CKEditorControl ID="txtFullText" runat="server" basePath="ckeditor/" >	
	                </CKEditor:CKEditorControl>
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
