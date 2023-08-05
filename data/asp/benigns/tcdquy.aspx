<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="tcdquy.aspx.vb" Inherits="bckinhdoanh.tcdquy" %>

<%@ Register src="Controls/ctlQuy_TromCapDien.ascx" tagname="ctlQuy_TromCapDien" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlQuy_TromCapDien ID="ctlQuy_TromCapDien1" runat="server" />
</asp:Content>
