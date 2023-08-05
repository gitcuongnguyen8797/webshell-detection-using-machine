<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhapsection.aspx.vb" Inherits="hcmpc.nhapsection" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function isFormValid() {
             var txtTitle = document.getElementById("<%=txtTitle.ClientID %>");
             var txtName = document.getElementById("<%=txtName.ClientID %>");

             if (txtTitle.value == '') {
                 alert("Vui lòng nhập tiêu đề (VI)");
                 txtTitle.focus();
                 return false;
             }
             if (txtName.value == '') {
                 alert("Vui lòng nhập tiêu đề (EN)");
                 txtName.focus();
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
                <a class="toolbar" href="dssection.aspx">
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
					<div class="pagetitle icon-48-article-add"><h2>Quản lý danh mục: <%=IIf(Request("ID") = "", "Thêm danh mục mới", "Chỉnh sửa danh mục")%></h2></div>
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
            Danh mục          
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <telerik:RadComboBox ID="cboMenu" Runat="server" Width="300" AutoPostBack="true"></telerik:RadComboBox>          
        </td>
    </tr>
    <tr>
        <td width="100">
            Tiêu đề (VI) <span style="color:Red">*</span>         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtTitle" runat="server" Width="400"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td width="100">
            Tiêu đề (EN) <span style="color:Red">*</span>    
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtName" runat="server" Width="400"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td width="100">
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
        <td width="100">
            Thứ tự         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtOrdering" runat="server" Width="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td width="100">
            Trạng thái         
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:CheckBox ID="ckIs_Published" Text="" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>
            &nbsp;
        </td>
        <td>

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

