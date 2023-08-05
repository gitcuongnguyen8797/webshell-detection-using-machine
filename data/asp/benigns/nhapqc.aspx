<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhapqc.aspx.vb" Inherits="hcmpc.nhapqc" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        function isFormValid() {
            var txtTitle = document.getElementById("<%=txtName.ClientID %>");

            if (txtTitle.value == '') {
                alert("Vui lòng nhập tên quảng cáo");
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
                <a class="toolbar" href="dsquangcao.aspx">
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
					<div class="pagetitle icon-48-article-add"><h2>Quản lý quảng cáo: <%=IIf(Request("ID") = "", "Quảng cáo mới", "Chỉnh sửa quảng cáo")%></h2></div>
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
                    Loại quảng cáo
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadComboBox ID="cboType" Runat="server" Width="300">
                    <Items>
                        <telerik:RadComboBoxItem Value="1" Text="Đơn vị thành viên" />
                        <telerik:RadComboBoxItem Value="2" Text="Đơn vị trong ngành" />
                        <telerik:RadComboBoxItem Value="3" Text="Thông tin cần biết" />  
                        <telerik:RadComboBoxItem Value="4" Text="Chính sách chất lượng" />                     
                    </Items>
                   </telerik:RadComboBox>
             
                </td>
            </tr>                      
            <tr>
                <td width="100">
                    Tên quảng cáo <span style="color:Red">*</span>         
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
                    Mô tả        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtNoiDung" runat="server" Width="500"></asp:TextBox>
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
            <tr>
                <td>
                    Click URL        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtClickURL" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Width       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtWidth" Text="0" runat="server" Width="300"></asp:TextBox>
                </td>
            </tr> 
            <tr>
                <td>
                    Height       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtHeight" Text="0" runat="server" Width="300"></asp:TextBox>
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
                   <telerik:RadComboBox ID="cboPosition" Runat="server" Width="300">
                    <Items>
                        <telerik:RadComboBoxItem Value="1" Text="1" />
                        <telerik:RadComboBoxItem Value="2" Text="2" />
                        <telerik:RadComboBoxItem Value="3" Text="3" />
                        <telerik:RadComboBoxItem Value="4" Text="4" />
                        <telerik:RadComboBoxItem Value="5" Text="5" />
                        <telerik:RadComboBoxItem Value="6" Text="6" />
                        <telerik:RadComboBoxItem Value="7" Text="7" />
                    </Items>
                   </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    Từ ngày        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadDatePicker ID="txtTuNgay" DateInput-ReadOnly="true" runat="server" Culture="vi-VN">
                    </telerik:RadDatePicker>
                </td>
            </tr>  
            <tr>
                <td>
                    Đến ngày        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadDatePicker ID="txtDenNgay" DateInput-ReadOnly="true" runat="server" Culture="vi-VN">
                    </telerik:RadDatePicker>
                </td>
            </tr>  
            <tr>
                <td>
                    Num Click       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtNum_Click" Text="0" runat="server" Width="300" ReadOnly="true"></asp:TextBox>
                </td>
            </tr> 
            <tr>
                <td>
                    Thống kê       
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:CheckBox ID="chkThongKe" runat="server" />
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
