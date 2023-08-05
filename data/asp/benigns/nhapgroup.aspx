<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhapgroup.aspx.vb" Inherits="hcmpc.nhapgroup" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function isFormValid() {
             var txtName = document.getElementById("<%=txtName.ClientID %>");

             if (txtName.value == '') {
                 alert("Vui lòng tiêu đề nhóm!");
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
                <a class="toolbar" href="dsgroup.aspx">
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
					<div class="pagetitle icon-48-groups-add"><h2>Quản lý người dùng: <%=IIf(Request("ID") = "", "Thêm nhóm người dùng mới", "Chỉnh sửa nhóm người dùng")%></h2></div>
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
        <td width="130">
           Cấp truy cập          
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <telerik:RadComboBox ID="drAcccess" Runat="server" Width="300"></telerik:RadComboBox>          
        </td>
    </tr>
    <tr>
        <td>
            Tiêu đề nhóm <span style="color:Red">*</span>    
        </td>
        <td>
            &nbsp;
        </td>
        <td>
           <asp:TextBox ID="txtName" runat="server" Width="300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Mô tả
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Width="300"></asp:TextBox>             
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
