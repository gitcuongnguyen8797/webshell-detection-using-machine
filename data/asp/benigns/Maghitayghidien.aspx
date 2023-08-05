<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="Maghitayghidien.aspx.vb" Inherits="bckinhdoanh.WebForm2" 
    title="THỐNG KÊ CÁC MÃ GHI TAY CỦA GHI ĐIỆN" %>
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
            <td colspan="3" align="center"><font color="green"><b>THỐNG KÊ CÁC MÃ GHI TAY CỦA GHI ĐIỆN</b></font><br /><br /></td>
        </tr>
        <tr>
        <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>
               Năm</b><asp:DropDownList ID="DropDownList1" runat="server" Height="28px" autopostback="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"
        ontextchanged="DropDownList1_TextChanged"
                Width="199px">
                <asp:ListItem Value="2012"></asp:ListItem>
                <asp:ListItem Value="2013"></asp:ListItem>
                <asp:ListItem Value="2014"></asp:ListItem>
                <asp:ListItem Value="2015"></asp:ListItem>
                <asp:ListItem Value="2016"></asp:ListItem>
                   </asp:DropDownList>
                                            </div></td><td>
                                            &nbsp;</td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>
                SỐ LƯỢNG MÃ T 1 KỲ</b></div></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Tổng số</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaT1ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaT1ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
          
              
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px">
                <b>&nbsp;SỐ LƯỢNG MÃ T TRÊN 2 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số lượng</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaT2ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaT2ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        <tr>
            <td align="right">Đã xử lý </td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtDaxulymaT" runat="server" AutoPostBack="True" 
         OnTextChanged="txtDaxulymaT_TextChanged"></asp:TextBox></td>
        </tr> 
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr style="visibility:hidden;">
            <td align="right">Còn lại<td>&nbsp;</td>
            <td><asp:TextBox ID="txtConlaimaT" runat="server"></asp:TextBox></td>
        </tr>     
        
        
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px">
                <b>SỐ LƯỢNG MÃ V 1 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaV1ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaV1ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
          
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px"><b>SỐ LƯỢNG MÃ V TRÊN 2 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số lượng</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaV2ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaV2ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
      
         <tr>
            <td align="right">Đã xử lý</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtDaxulyMaV" runat="server" AutoPostBack="True" 
         OnTextChanged="txtDaxulyMaV_TextChanged"></asp:TextBox></td>
        </tr>  
        
        <tr>
            <td colspan="3" height="5px"><hr width="50%" height="1px"></td>
        </tr>
        
        <tr style="visibility:hidden;">
            <td align="right" >Còn lại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtConlaimaV" runat="server"></asp:TextBox></td>
        </tr>      
        
         <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px">
                <b>SỐ LƯỢNG MÃ L 1 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaL1ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaL1ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
          
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><b>SỐ LƯỢNG MÃ L TRÊN 2 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số lượng</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaL2ky" runat="server" AutoPostBack="true" OnTextChanged="txtMaL2ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
      
         <tr>
            <td align="right">Đã xử lý</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtDaxulyMaL" runat="server" AutoPostBack="true" OnTextChanged="txtDaxulyMaL_TextChanged"></asp:TextBox></td>
        </tr>  
        
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        
        <tr style="visibility:hidden;">
            <td align="right" >Còn lại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtConlaimaL" runat="server"></asp:TextBox></td>
        </tr>      
        
               <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px">
                <b>SỐ LƯỢNG MÃ G 1 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaG1ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaG1ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
          
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><b>SỐ LƯỢNG MÃ G TRÊN 2 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số lượng</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaG2ky" runat="server" AutoPostBack="true" OnTextChanged="txtMaG2ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
      
         <tr>
            <td align="right">Đã xử lý</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtDaxulyMaG" runat="server" AutoPostBack="true" OnTextChanged="txtDaxulyMaG_TextChanged"></asp:TextBox></td>
        </tr>  
        
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        
        <tr style="visibility:hidden;">
            <td align="right" >Còn lại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtConlaimaG" runat="server"></asp:TextBox></td>
        </tr>   
        
               <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><hr width="50%" height="1px">
                <b>SỐ LƯỢNG MÃ U 1 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaU1ky" runat="server" AutoPostBack="True" 
         OnTextChanged="txtMaU1ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
          
        <tr>
            <td colspan="3" align="left"><div width="50%" align="center"><b>SỐ LƯỢNG MÃ U TRÊN 6 KỲ</b></div></td>
        </tr>
         <tr>
            <td colspan="3" height="5px"></td>
        </tr>
         <tr>
            <td align="right">Tổng số lượng</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtMaU6ky" runat="server" AutoPostBack="true" OnTextChanged="txtMaU6ky_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
      
         <tr>
            <td align="right">Đã xử lý</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtDaxulyMaU" runat="server" AutoPostBack="True" 
         OnTextChanged="txtDaxulyMaU_TextChanged"></asp:TextBox></td>
        </tr>  
        
        <tr>
            <td colspan="3" height="5px"></td>
        </tr>
        
        <tr style="visibility:hidden;">
            <td align="right" >Còn lại</td>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtConlaimaU" runat="server"></asp:TextBox></td>
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
