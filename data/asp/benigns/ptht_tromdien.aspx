<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="ptht_tromdien.aspx.vb" Inherits="bckinhdoanh.ptht_tromdien" 
    title="Phân Tích Các Hình Thức Trộm Cắp Điện" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 84pt;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style3
        {
            width: 88pt;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style4
        {
            width: 83pt;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style5
        {
            height: 10pt;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style5a
        {
            height: 20.25pt;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: right;
            vertical-align: middle;
            white-space: nowrap;
            border: 0pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style6
        {
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style7
        {
            height: 20.25pt;
            width: 230px;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: left;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style8
        {
            height: 10pt;
            color: windowtext;
            font-size: 10.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center">
<h3>PHÂN TÍCH CÁC HÌNH THỨC TRỘM CẮP ĐIỆN</h3>
Tháng: &nbsp; <asp:DropDownList ID="cboThang" runat="server" AutoPostBack="true">
                </asp:DropDownList>
Năm: &nbsp; <asp:DropDownList ID="cboNam" runat="server" AutoPostBack="true">
                </asp:DropDownList>                
</div>
a<table border="0" cellpadding="0" cellspacing="0" class="style5" style="border-collapse:
 collapse;width:557pt" width="557">
        <colgroup>
            <col span="1" style="mso-width-source:userset;mso-width-alt:3474;
 width:71pt" width="95" />
            <col style="mso-width-source:userset;mso-width-alt:4096;width:84pt" 
                width="112" />
            <col style="mso-width-source:userset;mso-width-alt:4278;width:88pt" 
                width="117" />
            <col style="mso-width-source:userset;mso-width-alt:4022;width:83pt" 
                width="110" />
        </colgroup>
        <tr height="27">
            <td class="style8" height="27">
                &nbsp;HẠNG MỤC&nbsp;</td>
            <td class="style2" width="112">
                BB</td>
            <td class="style3" width="117">
                ĐNBT</td>
            <td class="style4" width="110">
                TBT</td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>CÂU TRỰC TIẾP</td>
            <td class="style5">
                <asp:TextBox ID="CauTrucTiep1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="CauTrucTiep2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="CauTrucTiep3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>CHÌ NIÊM</td>
            <td class="style5">
                <asp:TextBox ID="ChiNem1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="ChiNem2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="ChiNem3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                &nbsp;KHOAN LỖ</td>
            <td class="style5">
                <asp:TextBox ID="KhoanLo1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="KhoanLo2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="KhoanLo3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>NAM CHÂM</td>
            <td class="style5">
                <asp:TextBox ID="NamCham1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="NamCham2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="NamCham3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>MÁY TẠO DÒNG</td>
            <td class="style5">
                <asp:TextBox ID="MayTaoDong1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="MayTaoDong2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="MayTaoDong3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>CÔ LẬP TÍN HIỆU ĐO ĐẾM</td>
            <td class="style5">
                <asp:TextBox ID="CoLapTinHieu1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="CoLapTinHieu2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="CoLapTinHieu3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                &nbsp;ĐẢO PHA KẾT HỢP NGUỘI NGOÀI</td>
            <td class="style5">
                <asp:TextBox ID="DaoPha1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="DaoPha2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="DaoPha3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>HÒA HƠI</td>
            <td class="style5">
                <asp:TextBox ID="HoaHoi1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="HoaHoi2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="HoaHoi3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>ĐIỆN KẾ BỂ</td>
            <td class="style5">
                <asp:TextBox ID="DienKeBe1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="DienKeBe2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="DienKeBe3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                <span style="mso-spacerun:yes">&nbsp;</span>CÔ LẬP ÁP SỬ DỤNG TER</td>
            <td class="style5">
                <asp:TextBox ID="CoLapAp1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="CoLapAp2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="CoLapAp3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
        <tr height="27">
            <td class="style8" height="27">
                &nbsp;KHÁC&nbsp;</td>
            <td class="style5">
                <asp:TextBox ID="Khac1" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="Khac2" runat="server" class="style5a"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:TextBox ID="Khac3" runat="server" class="style5a"></asp:TextBox>
            </td>
        </tr>
    </table>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:557pt" width="557">
 <tr>
 <td align="right"><br /><asp:Button ID="btnSave" runat="server" Text="Lưu" Width="80px"  AutoPostBack="true" /></td>
 </tr>
 <tr>
 <td align="left"><br /><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></td>
 </tr>
 </table>    


</asp:Content>
