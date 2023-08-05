<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/QUANTRI/ADMIN.Master" CodeBehind="Quantri.aspx.vb" Inherits="DauNoi.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="current_page_item" 
        style="border-style: solid; border-width: medium; border-color: #0000FF; width: 100%">
        <tr>
            <td colspan="2" 
                
                
                style="color: #000040; font-weight: bold; text-align: center; background-color: #FFFFFF; font-family: 'Times New Roman', Times, serif;">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Text="Quản lý hình ảnh cho Slider" Font-Size="14pt" 
                    Height="30px"></asp:Label>
             </td>
        </tr>
        <tr>
            <td class="style3" 
                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold; text-align: left;">
                <asp:Label ID="Label4" runat="server" Text="Nhập STT" 
                    ForeColor="#000040"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="STT" runat="server" Width="570px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" 
                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold; text-align: left;">
                <asp:Label ID="Label2" runat="server" Text="Tên đường link website" 
                    ForeColor="#000040"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="Tenchuongtrinhweb" runat="server" Width="570px"></asp:TextBox>
            </td>
        </tr>
              
        <tr>
            <td class="style3" 
                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold; text-align: left;">
                <asp:Label ID="Label7" runat="server" ForeColor="#000040"  Text="Nội dung chương trình"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="Noidung" runat="server" Width="570px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" 
                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold; text-align: left;">
                <asp:Label ID="Label9" runat="server" ForeColor="#000040" Text="Hình ảnh"></asp:Label>
            </td>
            <td class="style4">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="570px" />
            </td>
        </tr>
        <tr>
            <td class="style3" 
                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold; text-align: left;">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Ketqua" runat="server" Text="Message" Width="431px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Button ID="Themmoi" runat="server" Font-Bold="True" Text="Thêm mới" 
                    Width="133px" CssClass="link" />
                <asp:Button ID="Thoat" runat="server" Font-Bold="True" Text="Thoát" 
                    Width="133px" />
            </td>
        </tr>
    </table>
      <div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="True"
        OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="STT" CellPadding="4" 
        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
            ForeColor="#333333" PageSize="20">
        <Columns>
        <asp:TemplateField HeaderStyle-Width="100px">
            <ItemTemplate>
                <asp:LinkButton ID="LkB1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LkB2" runat="server" CommandName="Update">Update</asp:LinkButton>
                <asp:LinkButton ID="LkB3" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateField>
  
        <asp:TemplateField HeaderText="STT" HeaderStyle-Width="300px">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("STT") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_STT" Width="300px" runat="server" Text='<%# Eval("STT") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        
          <asp:TemplateField HeaderText="Đường link" HeaderStyle-Width="300px">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("DUONGLINK") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_Link" Width="300px" runat="server" Text='<%# Eval("DUONGLINK") %>'></asp:TextBox>
            </EditItemTemplate>

        </asp:TemplateField>
             <asp:TemplateField HeaderText="Nội dung" HeaderStyle-Width="300px">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("NOIDUNG") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_Noidung" Width="300px" runat="server" Text='<%# Eval("NOIDUNG") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
         
        <asp:TemplateField HeaderText="Hình ảnh" HeaderStyle-Width="100px">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("DUONGDAN") %>'
                     Height="80px" Width="100px" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Image ID="img_user" runat="server" ImageUrl='<%# Eval("DUONGDAN") %>'
                     Height="80px" Width="100px" /><br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </EditItemTemplate>
        </asp:TemplateField>
        </Columns> 
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:GridView>
    </div>
</asp:Content>
