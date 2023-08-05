<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhapuser.aspx.vb" Inherits="hcmpc.nhapuser" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function isFormValid() {
             var txtUserName = document.getElementById("<%=txtUserName.ClientID %>");
             var txtName = document.getElementById("<%=txtName.ClientID %>");
             var txtEmail = document.getElementById("<%=txtEmail.ClientID %>");
             var txtPass = document.getElementById("<%=txtPass.ClientID %>");
             var txtPass2 = document.getElementById("<%=txtPass2.ClientID %>");

             if (txtName.value == '') {
                 alert("Vui lòng nhập họ tên!");
                 txtName.focus();
                 return false;
             }
             if (txtUserName.value == '') {
                 alert("Vui lòng nhập tên đăng nhập!");
                 txtUserName.focus();
                 return false;
             }
             if (txtEmail.value == '') {
                 alert("Vui lòng nhập email!");
                 txtEmail.focus();
                 return false;
             }
             if (!isEmail(txtEmail.value)) {
                 alert("Email không hợp lệ!");
                 txtEmail.focus();
                 return false;
             }
             if (txtPass.value != txtPass2.value) {
                 alert("Xác nhận mật khẩu không đúng!");
                 txtPass2.focus();
                 return false;
             }
                          
             return true;
         }
         function isEmail(emailAddress) {
             var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
             return pattern.test(emailAddress);
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
                <a class="toolbar" href="dsuser.aspx">
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
					<div class="pagetitle icon-48-user-add"><h2>Quản lý người dùng: <%=IIf(Request("ID") = "", "Thêm người dùng mới", "Chỉnh sửa tài khoản")%></h2></div>
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
        <td>
            Họ tên <span style="color:Red">*</span>    
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtName" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td width="130">
            Tên người dùng <span style="color:Red">*</span>         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:TextBox ID="txtUserName" runat="server" Width="300"></asp:TextBox> 
            <asp:TextBox ID="txtUser" runat="server" Width="300" style=" display:none"></asp:TextBox>           
        </td>
    </tr>         
    <tr>
        <td>
            Mật khẩu         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:TextBox ID="txtPass1" TextMode="Password" runat="server" Width="300" style=" display:none"></asp:TextBox> 
            <asp:TextBox ID="txtPass" TextMode="Password" runat="server" Width="300"></asp:TextBox>                      
        </td>
    </tr>
    <tr>
        <td>
            Xác nhận mật khẩu         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtPass2" TextMode="Password" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Mã nhân viên   
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtMaNV" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Email <span style="color:Red">*</span>    
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtEmail" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Số điện thoại   
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtSDT" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>   
    <tr>
        <td>
           Đơn vị          
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <telerik:RadComboBox ID="drDonVi" Runat="server" Width="300"></telerik:RadComboBox>          
        </td>
    </tr>
    <tr>
        <td>
            Nhóm          
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <telerik:RadComboBox ID="drGroup" Runat="server" Width="300"></telerik:RadComboBox>          
        </td>
    </tr>
    <tr>
        <td>
            Phòng/Ban   
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtPhongBan" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Cấp theo CV số   
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtCVSo" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Upload CV
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:FileUpload ID="upImageURL" runat="server" Width="502px" /><br /> 
            <asp:Label ID="lblImageURL" ForeColor="Red" runat="Server"></asp:Label>                 
        </td>
    </tr>
    <tr>
        <td>
            Upload Hình
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:FileUpload ID="upHinhUrl" runat="server" Width="502px" /><br /> 
            <asp:Label ID="lblHinhUrl" ForeColor="Red" runat="Server"></asp:Label>                 
        </td>
    </tr>
    <tr>
        <td>
            Khóa thành viên         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:CheckBox ID="ckIs_Block" Text="" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            Ngày đăng ký    
        </td>
        <td>
            &nbsp;
        </td>
        <td>           
            <asp:Label ID="lblNgayDK" runat="server"></asp:Label>
        </td>
    </tr>
    <tr style="height:2px"></tr>
    <tr>
        <td>
            Đăng nhập lần cuối    
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:Label ID="lblDNLC" runat="server"></asp:Label>           
        </td>
    </tr>
    <tr style="display:none">
        <td width="100">
                      
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
