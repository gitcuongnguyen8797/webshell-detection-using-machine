<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="Chotchiso.aspx.vb" Inherits="bckinhdoanh.WebForm5" 
    title="NHẬP NĂNG SUẤT VÀ CHẤT LƯỢNG CHỐT CHỈ SỐ 2015" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <table border="0" cellpadding="0" cellspacing="0" width="600px">
        <tr>
            <td width="200px">&nbsp;</td>
            <td width="5px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center"><font color="green"><b>NĂNG SUẤT VÀ CHẤT LƯỢNG CHỐT CHỈ SỐ 2015</b></font><br /><br /></td>
        </tr>
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>Số điện kế cần chốt</b></div></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Tổng điện kế</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtTongDienKe" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK không còn tại chỗ</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtKhongConTaiCho" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr >
            <td align="right">SLĐK không sử dụng</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtKhongSuDung" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK phải chốt</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtPhaiChot" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>Số lượng điện kế chốt được trong ngày 16/3/2015 (trước 14 giờ)</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay1_ChotDuoc_Truoc14H" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay1_ChuaChot_Truoc14H" runat="server" Enabled="False"></asp:TextBox></td>
        </tr> 
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay1_LyDo_Trongai" runat="server"></asp:TextBox></td>
        </tr> 
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr style="visibility:hidden;">
            <td align="right">Năng xuất (%)</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Nangxuat" runat="server"></asp:TextBox></td>
        </tr>     
        
        
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>Số lượng điện kế chốt được đến hết ngày 16/3/2015 (đến 24h00 ngày 16/3/2015)</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay2_ChotDuoc" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay2_ChuaChot" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay2_LyDo_Trongai" runat="server"></asp:TextBox></td>
        </tr> 
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr style="visibility:hidden;">
            <td align="right">Năng xuất (%)</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay2_Nangxuat" runat="server"></asp:TextBox></td>
        </tr>      
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>Số lượng điện kế chốt được đến hết ngày 16/3/2015</b></div></td>
        </tr>
          <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay3_ChotDuoc" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay3_ChuaChot" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay3_LyDo_Trongai" runat="server"></asp:TextBox></td>
        </tr> 
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr style="visibility:hidden;">
            <td align="right">Năng xuất (%)</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txt_Ngay3_Nangxuat" runat="server"></asp:TextBox></td>
        </tr>      
        
         <tr>
            <td></td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Lưu" Width="80px"  AutoPostBack="true" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td colspan="3" height="5px">
                <font color="red"><asp:Label ID="lbMessage" runat="server" Text=""></asp:Label></font>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
