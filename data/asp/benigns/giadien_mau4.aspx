<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="giadien_mau4.aspx.vb" Inherits="bckinhdoanh.giadien_mau4" 
    title="Thống Kê Giá Điện Cho Hộ Nghèo - Hộ Thu Nhập Thấp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">

tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl67
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl68
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl69
	{mso-style-parent:style16;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style16;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	word-wrap: break-word;
	white-space:normal;}
.xl71
	{mso-style-parent:style16;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:center;
	vertical-align:middle;
	border:.0pt solid windowtext;
	white-space:normal;}
.xl71a
	{mso-style-parent:style16;
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:Fixed;
	text-align:right;
	vertical-align:middle;
	border:.0pt solid windowtext;
	white-space:normal;}	
.xl72
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl73
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;}
.xl74
	{mso-style-parent:style0;
	text-align:right;}
.xl75
	{mso-style-parent:style16;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;}
.xl76
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	text-align:center;
	white-space:normal;}
	
.xl78a
	{mso-style-parent:style0;
	text-align:right;
	white-space:normal;}
	
.xl79
	{mso-style-parent:style16;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl80
	{mso-style-parent:style0;

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:415pt" width="550">
        <colgroup>
            <col span="4" width="110" />
        </colgroup>
        <tr height="43">
            <td class="xl72" colspan="4" height="43" width="550">
               <br /><br /> GIÁ ĐIỆN CHO HỘ NGHÈO - HỘ THU NHẬP THẤP</td>
        </tr>
        <tr height="21">
            <td class="xl67" height="21">
            </td>
            <td class="xl67">
            </td>
            <td class="xl67">
            </td>
            <td class="xl67">
            </td>
        </tr>
        <tr height="10">
            <td class="xl72" height="10">
            </td>
            <td class="xl73">
            </td>
            <td class="xl73">
            </td>
            <td class="xl73">
            </td>
        </tr>
        <tr height="25">
            <td class="xl72" height="25" colspan="4">
                Tháng :   <asp:DropDownList ID="cboThang" runat="server" AutoPostBack="True">
                </asp:DropDownList> Năm : <asp:DropDownList ID="cboNam" runat="server" AutoPostBack="True">
                </asp:DropDownList>
             </td>
        </tr>
        <tr height="21">
            <td class="xl67" height="21">
            </td>
            <td class="xl67">
            </td>
            <td class="xl67">
            </td>
            <td class="xl67">
            </td>
        </tr>
        <tr height="21">
            <td class="xl74" colspan="4" height="21">
                Mẫu 04_HN-HTNT</td>
        </tr>
        <tr height="7">
            <td class="xl68" height="7">
                &nbsp;</td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl68">
                &nbsp;</td>
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="40">
            <td class="xl70" width="110" colspan="3">
                Số liệu hộ nghèo, hộ thu nhập thấp của địa phương</td>
            <td class="xl70" width="110" rowspan="2">
                Số lượng KH được hưởng giá ưu đãi theo hộ nghèo và hộ thu nhập thấp do PC quản lý</td>
        </tr>
        <tr height="30">
            <td class="xl70" width="110">
                Số lượng hộ nghèo</td>
            <td class="xl70" width="110">
                Số lượng hộ thu nhập thấp</td>
            <td class="xl70" width="110">
                Tổng</td>
        </tr>
        <tr height="21">
            <td class="xl70" height="21" width="110">
                (1)</td>
            <td class="xl70" width="110">
                (2)</td>
            <td class="xl70" width="110">
                (3)</td>
            <td class="xl70" width="110">
                (4)</td>
        </tr>
        <tr height="33">
            <td class="xl70" height="33" width="110">
                <asp:TextBox ID="txtSL_HoNgheo" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSL_HoTNT" runat="server" width="90"></asp:TextBox>
            </td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtTong" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSL_KH_UuDai" runat="server" width="90"></asp:TextBox></td>
        </tr>
        <tr height="21">
            <td class="xl66" height="21">
            </td>
            <td class="xl66">
            </td>
            <td class="xl66">
            </td>
            <td class="xl66">
            </td>
        </tr>
        <tr height="21">
            <td class="xl78a" colspan="4" height="21" align="right">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" Width="72px" />
                </td>
        </tr>
        <tr>
            <td colspan="4"> <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
&nbsp;

</asp:Content>
