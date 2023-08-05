<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="giadien_mau2.aspx.vb" Inherits="bckinhdoanh.giadien_mau2" 
    title="Giá Điện Cho Hộ Thu Nhập Thấp" %>
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

<link type="text/css" href="/jquery/css/smoothness/jquery-ui-1.8.19.custom.css" rel="Stylesheet" />	
<script type="text/javascript" src="/jquery/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/jquery/js/jquery-ui-1.8.19.custom.min.js"></script>
<script type="text/javascript" src="/jquery/js/calendar-vi.js"></script>
<script type="text/javascript">

	$(function() {
		$( "#<%=txtTuNgay.ClientID%>" ).datepicker({
			showOn: "button",
			buttonImage: "/jquery/images/calendar.gif",
			buttonImageOnly: true
		});
		
		$( "#<%=txtDenNgay.ClientID%>" ).datepicker({
			showOn: "button",
			buttonImage: "/jquery/images/calendar.gif",
			buttonImageOnly: true
		});
	});
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:415pt" width="550">
        <colgroup>
            <col span="5" width="110" />
        </colgroup>
        <tr height="43">
            <td class="xl76" colspan="5" height="43" width="550">
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
            <td class="xl67">
            </td>
        </tr>
        <tr height="21">
            <td class="xl72" colspan="5" height="21">
               Tuần báo cáo</td>
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
            <td class="xl73">
            </td>
        </tr>
        <tr height="25">
            <td class="xl71a" height="25">
                Từ :</td>
            <td class="xl71">
                <asp:TextBox ID="txtTuNgay" runat="server" width="70" AutoPostBack="true"></asp:TextBox></td>
            <td class="xl71a">
                Đến :<span style="mso-spacerun:yes">&nbsp;</span></td>
            <td class="xl71">
                <asp:TextBox ID="txtDenNgay" runat="server" width="70"></asp:TextBox></td>
            <td class="xl71">
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
            <td class="xl67">
            </td>
        </tr>
        <tr height="21">
            <td class="xl74" colspan="5" height="21">
                Mẫu 02_HN-HTNT</td>
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
            <td class="xl68">
                &nbsp;</td>
        </tr>
        <tr height="40">
            <td class="xl70" height="21" width="110" rowspan="2">
                Số lượng khách hàng được phổ biến chính sách ưu đãi giá điện</td>
            <td class="xl70" width="110" colspan="2">
                Số lượng khách hàng đăng ký sử dụng</td>
            <td class="xl70" width="110" rowspan="2">
            Số lượng khách hàng được giải quyết
                </td>
            <td class="xl70" width="110" rowspan="2">
                Số lượng khách hàng không còn đủ điều kiện sử dụng</td>
        </tr>
        <tr height="30">
            <td class="xl70" width="110">
                Đủ điều kiện</td>
            <td class="xl70" width="110">
                Không đủ điều kiện</td>
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
            <td class="xl70" width="110">
                (5)</td>
        </tr>
        <tr height="33">
            <td class="xl70" height="33" width="110">
                <asp:TextBox ID="txtSLKH_DuocPhoBien" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSLKH_DK_Dat" runat="server" width="90"></asp:TextBox>
            </td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSLKH_DK_KoDat" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSLKH_DuocGiaiQuyet" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSLKH_KhongDuDKSD" runat="server" width="90"></asp:TextBox></td>
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
            <td class="xl66">
            </td>
        </tr>
        <tr height="21">
            <td class="xl78a" colspan="5" height="21" align="right">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" Width="72px" />
                </td>
        </tr>
        <tr>
            <td colspan="5"> <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
&nbsp;

</asp:Content>
