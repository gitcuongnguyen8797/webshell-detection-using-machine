<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="Thongkedungluong.aspx.vb" Inherits="DauNoi.WebForm7" %>
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
     <asp:Button ID="Button1" runat="server" Text="Xem In" 
        Font-Bold="True" ForeColor="Red" /> 
    <asp:Button ID="Button2"
        runat="server" Text="Xuất Excel" Font-Bold="True" ForeColor="Red" />
     <br />
    </div>
    </div>
    </div>
    </div>
    
    <br />

    <CR:CrystalReportViewer id="Thongkedungluongcosodulieu" runat="server" autodatabind="true" />
    
</asp:Content>
