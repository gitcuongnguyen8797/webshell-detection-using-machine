<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="ThongkevanbanThieu.aspx.vb" Inherits="VANPHONG.WebForm12" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="element-box">
    <div class="m">       
    <div style="height: 60px">
    <div align="center">
       
   Năm :<telerik:radcombobox ID="CboNam" Runat="server" Width="60px" Skin="Vista" AutoPostBack="true" ontextchanged="CboNam_TextChanged" ></telerik:radcombobox> 
                 <asp:RadioButton id="Vanbandi" GroupName="Kieuvanban" 
             Text=""  runat="server"/> 
    <asp:Label ID="Label1" runat="server" Text="Văn bản đi" 
              Font-Bold="false" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
           <asp:RadioButton id="Vanbanden" GroupName="Kieuvanban" 
             Text=""  runat="server"/>
   <asp:Label ID="Label4" runat="server" Text="Văn bản đến" 
              Font-Bold="false" Font-Size="10pt" ForeColor="Red"></asp:Label>
        <asp:CheckBox ID="ChkSoVB" Text="Chọn sổ VB" runat="server" />  
        <telerik:radcombobox ID="CboSoVB" Runat="server" Width="300px" Skin="Vista" AutoPostBack="true" ontextchanged="CboSoVB_TextChanged"></telerik:radcombobox> 
   <asp:Button ID="Button1" runat="server" Text="Thống kê" 
        Font-Bold="True" ForeColor="#000040" />
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" Visible ="false" ForeColor="#000040" />
        <asp:Label ID="Vanbanthieu" runat="server" Text=""></asp:Label>
    </div>
    </div>
        <asp:TextBox ID="TextBox1" runat="server" Height="400px" TextMode="MultiLine" 
            Width="1000px"></asp:TextBox>
    </div>
    </div>
    <hr />
    <div>
    
    </div>
</asp:Content>
