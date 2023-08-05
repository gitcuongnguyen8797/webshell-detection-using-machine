<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="chotcspk.aspx.vb" Inherits="bckinhdoanh.chotcspk" 
    title="Theo dõi tình hình chốt chỉ số đổi giá điện từ 10/12/2014" %>
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
            <td colspan="3" align="center"><font color="green"><b>THEO DÕI TÌNH HÌNH CHỐT CHỈ SỐ ĐỔI GIÁ ĐIỆN TỪ NGÀY 10/12/2014</b></font><br /><br /></td>
        </tr>
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>SỐ LƯỢNG ĐIỆN KẾ CẦN CHỐT</b></div></td>
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
         <tr style="visibility:hidden;">
            <td align="right">SLĐK phải chốt</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtPhaiChot" runat="server"></asp:TextBox></td>
        </tr>
        
        
        
        
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>CHỐT NGÀY 10/12/2014 (TRƯỚC 14 GIỜ)</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_ChotDuoc_Truoc14H_2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_LyDo_Truoc14H_2" runat="server"></asp:TextBox></td>
        </tr> 
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr style="visibility:hidden;">
            <td align="right">SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_ChuaChot_Truoc14H_2" runat="server"></asp:TextBox></td>
        </tr>     
        
        
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>CHỐT NGÀY 10/12/2014 (TRƯỚC 17 GIỜ)</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_ChotDuoc_Truoc14H" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_LyDo_Truoc14H" runat="server"></asp:TextBox></td>
        </tr> 
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr style="visibility:hidden;">
            <td align="right">SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_ChuaChot_Truoc14H" runat="server"></asp:TextBox></td>
        </tr>      
        
        
       
        
        
        
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>CHỐT CẢ NGÀY 11/12/2014 (TRƯỚC 16 GIỜ)</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_ChotDuoc" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
      
         <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_LyDo" runat="server"></asp:TextBox></td>
        </tr>  
        
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        
        <tr style="visibility:hidden;">
            <td align="right" >SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay1_ChuaChot" runat="server"></asp:TextBox></td>
        </tr>      
        
        
         <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>CHỐT CẢ NGÀY 12/12/2014 (TRƯỚC 16 GIỜ)</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">SLĐK chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay2_ChotDuoc" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        
         <tr>
            <td align="right">Lý do trở ngại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay2_LyDo" runat="server"></asp:TextBox></td>
        </tr>  
        
         <tr style="visibility:hidden;">
            <td align="right">SLĐK không chốt được</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtNgay2_ChuaChot" runat="server"></asp:TextBox></td>
        </tr>      
        <tr>
            <td colspan="3" height="5px"></td>
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
