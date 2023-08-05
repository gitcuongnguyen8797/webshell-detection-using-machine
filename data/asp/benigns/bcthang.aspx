<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bcthang.aspx.vb" Inherits="bckinhdoanh.bcthang" %>
<%@ Register src="Controls/ctlBaoCaoThang.ascx" tagname="ctlBaoCaoThang" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlBaoCaoThang ID="ctlBaoCaoThang1" runat="server" />
</asp:Content>
