<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/KinhDoanh.Master" CodeBehind="baocao.aspx.vb" Inherits="KINHDOANH.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" Width="1000px"
              AutoGenerateColumns="False" CellPadding="4" GridLines="None" 
    ForeColor="#333333" 
   
    
        Caption="<font  color='#0000FF'> CÁC CHƯƠNG TRÌNH WEBSITE HỖ TRỢ SXKD ĐIỆN NĂNG </font>" ShowHeader="False" 
        Font-Bold="True" Font-Size="12pt" AllowPaging="True" AllowSorting="True" 
        PageSize="20">
        <RowStyle BackColor="#FFF7E7" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:ImageField DataImageUrlField="FilePath" ControlStyle-Width="30"
        ControlStyle-Height = "30"  HeaderText = "">

<ControlStyle Height="30px" Width="30px"></ControlStyle>
            </asp:ImageField>

       <asp:HyperLinkField DataNavigateUrlFields="DIACHIWEB" ControlStyle-ForeColor="#0000FF" FooterStyle-Font-Size="14px"

                                    DataTextField="TENCHUONGTRINH" 
                DataTextFormatString="{0}" ItemStyle-Width="950px" HeaderText="" >
<ItemStyle Width="950px" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
    <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
