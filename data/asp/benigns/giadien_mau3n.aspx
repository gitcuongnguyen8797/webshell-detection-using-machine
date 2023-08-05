<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="giadien_mau3n.aspx.vb"  MasterPageFile="~/siteadmin.master" Inherits="bckinhdoanh.giadien_mau3n" %>


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
	padding-top:0px;
	padding-right:0px;
	padding-left:0px;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	text-align:general;
	vertical-align:bottom;
	border:none;
}

.xlmiddle
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
}

.xlmiddle67
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	width:66px;
}

.xlmiddle150
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	width:150px;
}

.xlleft
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	width:150px;
}

.xlleft150
	{
	color:windowtext;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	width:150px;
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
	width:70px;
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	
			<div align="center">
			    <h3>THỐNG KÊ SỐ LIỆU NHÀ TRỌ TRÊN ĐỊA BÀN CỦA CÔNG TY ĐIỆN LỰC</h3>
			    
			    Tháng :   <asp:DropDownList ID="cboThang" runat="server" AutoPostBack="True">
                </asp:DropDownList> Năm : <asp:DropDownList ID="cboNam" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                <br /><br />
			</div>

<div align="center">
<br />            
<br />            
<br />
          

            <asp:table id="tblDynamic" runat="server" Width="970" style="border-collapse:
 collapse;"></asp:table>
 
      
            <table id="Table3" cellSpacing="1" cellPadding="1" width="950" border="0px" align="center" style="border-collapse:
                collapse;">
                <tr>
                    <td align="right"><br /><asp:button id="btnLuu" runat="server" Width="72px" Text="Lưu"></asp:button></td>
                </tr>
                <tr>
                    <td align="left"><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></td>
                </tr>
                </table>

</div>
 
</asp:Content>

