<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Chongoithau.aspx.vb" MasterPageFile="~/hcmpcadmin.master" Inherits="hcmpc.Chongoithau" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        function isFormValid() {
            var txtTitle = document.getElementById("<%=txttengoithau.ClientID %>");

            if (txtTitle.value == '') {
                alert("Vui lòng nhập tên dự án");
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
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= Luu.UniqueID %>','')">
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
                <a class="toolbar" href="dsmoithau.aspx">
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
					<div class="pagetitle icon-48-article-add"><h2>Quản lý mời thầu: <%=IIf(Request("ID") = "", "Mời thầu mới", "Chỉnh sửa mời thầu")%></h2></div>
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
                    STT         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtstt" runat="server" Width="500"></asp:TextBox>       
                </td>
            </tr>
            <tr>
                <td width="100">
                   Số KHLCNT          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadComboBox ID="KHLCNT" Runat="server" Width="500">
                    </telerik:RadComboBox>
                </td>
            </tr>
                     
            <tr>
                <td width="100">
                    S/Hiệu gói thầu          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtsohieu" runat="server" Width="500"></asp:TextBox>       
                </td>
            </tr>
            <tr>
                <td>
                    Tên gói thầu      
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txttengoithau" runat="server" Width="500"></asp:TextBox>              
                </td>
            </tr>
            <tr>
                <td>
                    Giá gói thầu <span style="color:Red">*</span>         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtgiagoithau" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Nguồn vốn      
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtnguonvon" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>    
            <tr>
                <td>
                   Hình thức lựa chọn NT        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                <asp:TextBox ID="txthinhthucchon" runat="server" Width="500"></asp:TextBox>
                    <%--<telerik:RadNumericTextBox ID="txtGia" Width="500" runat="server" Culture="vi-VN">
                        <NumberFormat DecimalDigits="0" />
                    </telerik:RadNumericTextBox>     --%>              
                </td>
            </tr>  
            <tr>
                <td>
                    Thời gian lựa chọn NT      
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtthoigianchon" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr> 
            <tr>
                <td>
                   Hình thức HĐ    
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txthinhthuchd" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr> 
            <tr>
                <td>
                    Thời gian thực hiện HĐ     
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtthoigianth" TextMode="MultiLine" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>                 
            <tr style="display:none">
                <td>
                      
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="right">
                   <asp:Button ID="Luu" runat="server" Width="80" Text="Lưu"></asp:Button>
                   <asp:Button ID="btnLuuThoat" runat="server" Width="80" Text="LưuThoat"></asp:Button>
                   <asp:Button ID="btnLuuMoi" runat="server" Width="80" Text="LưuMoi"></asp:Button>
                </td>
            </tr>  
        </table>
    </div>

 </div>


</asp:Content>
