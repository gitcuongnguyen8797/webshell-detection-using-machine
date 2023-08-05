<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkesovanthu.aspx.vb" Inherits="DauNoi.WebForm19" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ucMenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="element-box">
    <div class="m">       
    <div style="height: 60px">
    <div align="center">
     <asp:Label ID="Label4" runat="server" Text="Chọn chức năng:" 
              Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Xem văn thư văn đơn vị" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label><asp:RadioButton id="Vanthudonvi" GroupName="Vanthu" 
             Text=""  runat="server"/> 
          <asp:Label ID="Label2" runat="server" Text="Văn thư đi" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
           <asp:RadioButton id="Vanthudi" GroupName="Vanthu" 
             Text=""  runat="server"/>    
             <asp:Label ID="Label3" runat="server" Text="Văn thư đến" 
              Font-Bold="True" Font-Size="10pt" ForeColor="#0066FF"></asp:Label>
           <asp:RadioButton id="Vanthuden" GroupName="Vanthu" 
             Text=""  runat="server"/>       
    <asp:Button ID="Button1" runat="server" Text="Xem In" Font-Bold="True" ForeColor="#000040" />
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" ForeColor="#000040" />
    </div>
    </div>
    </div>
    </div>
     <CR:CrystalReportViewer ID="Thongkesovanthu" runat="server" 
        AutoDataBind="true" />
</asp:Content>
