<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhapnhomtin.aspx.vb" Inherits="hcmpc.nhapnhomtin" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        function isFormValid() {
            var txtTitle = document.getElementById("<%=txtTitle.ClientID %>");

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
                <a class="toolbar" href="dsnhomtin.aspx">
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
					<div class="pagetitle icon-48-article-add"><h2>Quản lý Cẩm Nang - Ấn Phẩm: <%= IIf(Request("ID") = "", "Cẩm nang - Ấn phẩm mới", "Chỉnh sửa Cẩm nang - Ấn Phẩm")%></h2></div>
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
                   <asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Tập tin Upload       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:FileUpload ID="upFileUpload" runat="server" Width="502px" /><br /> 
                    <asp:Label ID="lblFileUpload" ForeColor="Red" runat="Server"></asp:Label>     
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
                    <asp:FileUpload ID="upImgThump" runat="server" Width="502px" /><br /> 
                    <asp:Label ID="lblImgThump" ForeColor="Red" runat="Server"></asp:Label>                 
                </td>
            </tr>  
            <tr>
                <td>
                    Loại cẩm nang - ấn phẩm       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <telerik:RadComboBox ID="cboLoaiNhomTin" Runat="server" Width="300">
                    <Items>
                        <telerik:RadComboBoxItem Value="1" Text="CÁC VĂN BẢN VỀ QUY ĐỊNH – NGHỊ ĐỊNH – THÔNG TƯ – LUẬT ĐIỆN LỰC" />
                        <telerik:RadComboBoxItem Value="2" Text="Bản tin công đoàn" />
                        <telerik:RadComboBoxItem Value="3" Text="Bản tin Zoom" /> 
                        <telerik:RadComboBoxItem Value="4" Text="Danh Sách Các Điểm Thu Tiền Điện Qua Ngân Hàng" />
                        <telerik:RadComboBoxItem Value="5" Text="Cẩm nang Văn hóa EVNHCMC" />   
                        <telerik:RadComboBoxItem Value="6" Text="Cẩm nang sử dụng điện An toàn – Tiết kiệm" />  
                        <telerik:RadComboBoxItem Value="7" Text="Cẩm nang Văn hóa EVN" /> 
                        <telerik:RadComboBoxItem Value="8" Text="Cẩm nang thanh toán tiền điện không dùng tiền mặt" />                     
                    </Items>
                   </telerik:RadComboBox>
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
