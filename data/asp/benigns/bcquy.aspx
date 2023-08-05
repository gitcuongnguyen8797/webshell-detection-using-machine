<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bcquy.aspx.vb" Inherits="bckinhdoanh.bcquy"%>
<%@ Register src="Controls/ctlBaoCaoQuy.ascx" tagname="ctlBaoCaoQuy" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlBaoCaoQuy ID="ctlBaoCaoQuy1" runat="server" />
</asp:Content>

