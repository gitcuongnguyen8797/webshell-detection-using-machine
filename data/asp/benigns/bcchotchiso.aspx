<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bcchotchiso.aspx.vb" Inherits="bckinhdoanh.WebForm6" 
    title="NĂNG SUẤT VÀ CHẤT LƯỢNG CHỐT CHỈ SỐ 2015" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<div align="center">
        <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Italic="False" 
        ForeColor="#0000A0" Text="Xem dữ liệu" />
    <asp:Button ID="Button1" runat="server" Font-Bold="True" ForeColor="#0000A0" 
        Text="Xuất  excel"/>
</div>
<div><hr width="50%" height="1px"></div>
<div id="divGridViewScroll" style="width: auto; height: auto; overflow: scroll">
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" 
        CellPadding="3" GridLines="Vertical" 
        OnDataBound = "OnDataBound" 
        Caption="NĂNG SUẤT VÀ CHẤT LƯỢNG CHỐT CHỈ SỐ 2015" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    <Columns>
<asp:BoundField DataField="MoTaNgan" HeaderText="Đơn Vị" ItemStyle-Width="125px" ItemStyle-Height="50px">
<ItemStyle Width="120px"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="TongDienKe" HeaderText="Tổng điện kế"/>
<asp:BoundField DataField="KhongConTaiCho" HeaderText="Điện kế không còn tại chỗ"/>
<asp:BoundField DataField="KhongSuDung" HeaderText="Điện kế không sử dụng"/>
<asp:BoundField DataField="PhaiChot" HeaderText="Số điện kế phải chốt"/>
<asp:BoundField DataField="Ngay1_ChotDuoc_Truoc14H" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay1_ChuaChot_Truoc14H" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Nangxuat" HeaderText="Năng suất (%)" ItemStyle-Width="80px" 
            ItemStyle-Height="50px" DataFormatString="{0:p}">
<ItemStyle Height="50px" Width="80px"></ItemStyle>
        </asp:BoundField>
<asp:BoundField DataField="Ngay1_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
<asp:BoundField DataField="Ngay2_ChotDuoc" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay2_ChuaChot" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Ngay2_Nangxuat" HeaderText="Năng suất (%)" 
            ItemStyle-Width="80px" ItemStyle-Height="50px" DataFormatString="{0:p}">
<ItemStyle Height="50px" Width="80px"></ItemStyle>
        </asp:BoundField>
<asp:BoundField DataField="Ngay2_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
<asp:BoundField DataField="Ngay3_ChotDuoc" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay3_ChuaChot" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Ngay3_Nangxuat" HeaderText="Năng suất (%)" 
            ItemStyle-Width="80px" ItemStyle-Height="50px" DataFormatString="{0:p}" >
<ItemStyle Height="50px" Width="80px"></ItemStyle>
        </asp:BoundField>
<asp:BoundField DataField="Ngay3_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
</Columns>
     <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
</div>
<div></div>
<asp:GridView ID="GridView2" runat="server" 
              AutoGenerateColumns="False" CellPadding="4" 
    GridLines="None" ForeColor="#333333" 
        Caption="NĂNG SUẤT VÀ CHẤT LƯỢNG CHỐT CHỈ SỐ 2015" CellSpacing="2" 
        Enabled="False" Visible="False">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
<Columns>
<asp:BoundField DataField="MoTaNgan" HeaderText="Đơn Vị" ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle>
    </asp:BoundField>
<asp:BoundField DataField="TongDienKe" HeaderText="Tổng điện kế"/>
<asp:BoundField DataField="KhongConTaiCho" HeaderText="Điện kế không còn tại chỗ"/>
<asp:BoundField DataField="KhongSuDung" HeaderText="Điện kế không sử dụng"/>
<asp:BoundField DataField="PhaiChot" HeaderText="Số điện kế phải chốt"/>
<asp:BoundField DataField="Ngay1_ChotDuoc_Truoc14H" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay1_ChuaChot_Truoc14H" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Nangxuat" HeaderText="Năng xuất (%)"/>
<asp:BoundField DataField="Ngay1_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
<asp:BoundField DataField="Ngay2_ChotDuoc" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay2_ChuaChot" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Ngay2_Nangxuat" HeaderText="Năng xuất (%)"/>
<asp:BoundField DataField="Ngay2_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
<asp:BoundField DataField="Ngay3_ChotDuoc" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay3_ChuaChot" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Ngay3_Nangxuat" HeaderText="Năng xuất (%)"/>
<asp:BoundField DataField="Ngay3_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
<asp:BoundField DataField="Ngay4_ChotDuoc" HeaderText="Điện kế chốt được"/>
<asp:BoundField DataField="Ngay4_ChuaChot" HeaderText="Điện kế không chốt được"/>
<asp:BoundField DataField="Ngay4_Nangxuat" HeaderText="Năng xuất (%)"/>
<asp:BoundField DataField="Ngay4_LyDo_Trongai" HeaderText="Lý do trở ngại"/>
</Columns>
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
</asp:Content>
