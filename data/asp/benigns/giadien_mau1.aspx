<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="giadien_mau1.aspx.vb" Inherits="bckinhdoanh.giadien_mau1" 
    title="Giá Cho Người Lao Động" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">

.style0
	{text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	border:none;
}
td
	{
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	text-align:general;
	vertical-align:bottom;
	border:none;
	white-space:nowrap;
}
.xl66
{	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
}
.xl67
	{
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	}
.xl68
	{
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	text-align:center;}
.xl69
	{
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl71
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:center;
	vertical-align:middle;
	border:.0pt solid windowtext;
	white-space:normal;}
.xl71a
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:right;
	vertical-align:middle;
	border:.0pt solid windowtext;
	white-space:normal;}	
.xl72
	{
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	
	text-align:center;
	vertical-align:middle;}
.xl73
	{
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	
	text-align:left;
	vertical-align:middle;}
.xl74
	{
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
	{}

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
            <br /><br />
                GIÁ ĐIỆN CHO
                <br />
                CÔNG NHÂN, SINH VIÊN, NGƯỜI LAO ĐỘNG THUÊ NHÀ ĐỂ Ở</td>
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
                Mẫu 01_SVNLD</td>
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
        <tr height="21">
            <td class="xl70" height="21" width="110">
                Số cam kết</td>
            <td class="xl70" width="110">
                Số BBLV</td>
            <td class="xl70" width="110">
                Số BB
                VPHC</td>
            <td class="xl70" width="110">
                Số BB VPHC<br />
                đã xử lý</td>
            <td class="xl70" width="110">
                Tiền phạt</td>
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
                <asp:TextBox ID="txtSoCamKet" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSoBB_LV" runat="server" width="90"></asp:TextBox>
            </td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSoBB_VP" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtSoBB_VPXL" runat="server" width="90"></asp:TextBox></td>
            <td class="xl70" width="110">
                <asp:TextBox ID="txtTienPhat" runat="server" width="90"></asp:TextBox></td>
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
