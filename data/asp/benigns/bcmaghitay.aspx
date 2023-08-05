<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bcmaghitay.aspx.vb" Inherits="bckinhdoanh.WebForm3" 
    title="Thống kê tình hình xử lý các mã ghi điện" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <asp:Label ID="Label1" runat="server" Text="Chọn năm báo cáo"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="127px">
        <asp:ListItem>2012</asp:ListItem>
        <asp:ListItem Value="2013"></asp:ListItem>
        <asp:ListItem Value="2014"></asp:ListItem>
        <asp:ListItem Value="2015"></asp:ListItem>
        <asp:ListItem Value="2016"></asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="270px">
        <asp:ListItem Value="1">Tình hình xử lý các mã điện</asp:ListItem>
        <asp:ListItem Value="2">Thống kê các mã ghi tay của ghi điện</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Italic="False" 
        ForeColor="Red" Text="Xem dữ liệu" />
    <asp:Button ID="Button1" runat="server" Font-Bold="True" ForeColor="Red" 
        Text="Xuất báo cáo excel" Width="133px" />
</div>
<div><hr width="50%" height="1px"></div>
<div>
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" 
        CellPadding="4" GridLines="None" ForeColor="#333333" 
        OnDataBound = "OnDataBound" Caption="Thống kê tình hình xử lý các mã ghi điện" 
        CellSpacing="2">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
<asp:BoundField DataField="MoTaNgan" HeaderText="Đơn Vị" ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
<asp:BoundField DataField="TTMaT2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="TTMaT2kyDaxuly" HeaderText="Đã xử lý"/>
<asp:BoundField DataField="TTMaT2kyConlai" HeaderText="Còn lại"/>
<asp:BoundField DataField="TTMaV2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="TTMaV2kyDaxuly" HeaderText="Đã xử lý"/>
<asp:BoundField DataField="TTMaV2kyConlai" HeaderText="Còn lại"/>
<asp:BoundField DataField="TTMaL2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="TTMaL2kyDaxuly" HeaderText="Đã xử lý"/>
<asp:BoundField DataField="TTMaL2kyConlai" HeaderText="Còn lại"/>
<asp:BoundField DataField="TTMaG2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="TTMaG2kyDaxuly" HeaderText="Đã xử lý"/>
<asp:BoundField DataField="TTMaG2kyConlai" HeaderText="Còn lại"/>
<asp:BoundField DataField="TTMaU6ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="TTMaU6kyDaxuly" HeaderText="Đã xử lý"/>
<asp:BoundField DataField="TTMaU6kyConlai" HeaderText="Còn lại"/>
</Columns>
     <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
</div>
<asp:GridView ID="GridView2" runat="server" 
              AutoGenerateColumns="False" 
              OnRowCreated="GridView2_RowCreated" CellPadding="4" 
    GridLines="None" ForeColor="#333333" 
        Caption="SỐ LIỆU THỐNG KÊ CÁC MÃ GHI TAY CỦA GHI ĐIỆN" CellSpacing="2">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
<Columns>
<asp:BoundField DataField="MoTaNgan" HeaderText="Đơn Vị" ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle>
    </asp:BoundField>
<asp:BoundField DataField="MaT1ky" HeaderText="1 kỳ"/>
<asp:BoundField DataField="TTMaT2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="MaV1ky" HeaderText="1 kỳ"/>
<asp:BoundField DataField="TTMaV2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="MaL1ky" HeaderText="1 kỳ"/>
<asp:BoundField DataField="TTMaL2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="MaG1ky" HeaderText="1 kỳ"/>
<asp:BoundField DataField="TTMaG2ky" HeaderText="Trên 2 kỳ"/>
<asp:BoundField DataField="MaU1ky" HeaderText="1 kỳ"/>
<asp:BoundField DataField="TTMaU6ky" HeaderText="Trên 6 kỳ"/>
</Columns>
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
</asp:Content>
