<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bcmaghisai.aspx.vb" Inherits="bckinhdoanh.WebForm8" 
    title="THỐNG KÊ TÌNH HÌNH GHI SAI TẠI CÁC CÔNG TY ĐIỆN LỰC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src="jquery/js/jquery.min.js" type="text/javascript"></script>
<script src="jquery/js/jquery-ui.min.js" type="text/javascript"></script>
<link href="jquery/css/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script src="jquery/js/calendar-vi.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
        $("[id$=txtNgaythongke]").datepicker({
                showOn: 'button',
                buttonImage: "/jquery/images/calendar.gif",
                buttonImageOnly: true
                
            });
        });
    </script>
   <div>
              &nbsp;
   </div>
<div>
<table>
<tr>
            <td colspan="3" align="center" style="color: #000080; font-weight: bold">THỐNG KÊ TÌNH HÌNH GHI SAI TẠI CÁC CÔNG TY ĐIỆN LỰC</td>
        </tr>
        <tr>
            <td colspan="3" align="center" class="style1">
                Ngày thống kê : &nbsp; &nbsp; 
            
                <asp:TextBox ID="txtNgaythongke" runat="server" width="108px" 
                    AutoPostBack="true" placeholder="dd/mm/yyyy" Height="18px"></asp:TextBox>
            
                &nbsp; 
            
                <asp:Button ID="BtnXem" runat="server" Font-Bold="True" ForeColor="Navy" 
                    Text="Xem báo cáo" />
                <asp:Button ID="BtnExcel" runat="server" Font-Bold="True" ForeColor="Navy" 
                    Text="Xuất excel" />
            
            </td>
        </tr>
</table>
</div>
<div id="divGridViewScroll" style="width: 1000px; height: auto; overflow: scroll">

    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" OnRowCreated="GridView1_RowCreated"
        CellPadding="3" GridLines="Vertical" Width="998px" 
        AutoGenerateColumns="False" AllowSorting="True" HorizontalAlign="Center"> 
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns><asp:BoundField DataField="MoTaNgan" HeaderText="Đơn Vị" ItemStyle-Width="250px" ItemStyle-Height="50px">
<ItemStyle Width="250px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="soluotgiaoghi" HeaderText="Số lượt giao ghi" 
                ItemStyle-Width="200px"  ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Soluotghisaidieuchinh" HeaderText="Số lượt ghi sai điều chỉnh hóa đơn" 
                ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Soluotghisaikhongdieuchinh" HeaderText="Số lượt ghi sai không điều chỉnh hóa đơn" 
                ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Tileghisai" HeaderText="Tỷ lệ ghi sai (%)" 
                DataFormatString="{0:P4}" ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="soluotgiaoghiluyke" HeaderText="Số lượt giao ghi" 
                ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Soluotghisaidieuchinhluyke" HeaderText="Số lượt ghi sai điều chỉnh hóa đơn" 
                ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Soluotghisaikhongdieuchinhluyke" HeaderText="Số lượt ghi sai không điều chỉnh hóa đơn" 
                ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Tileghisailuyke" HeaderText="Tỷ lệ ghi sai (%)" 
                 DataFormatString="{0:P4}" ItemStyle-Width="200px" ItemStyle-Height="50px">
<ItemStyle Height="50px" Width="200px"></ItemStyle>
</asp:BoundField>
</Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>

</div>
</asp:Content>
