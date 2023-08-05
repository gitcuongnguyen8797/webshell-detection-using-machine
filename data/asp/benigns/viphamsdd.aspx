<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="viphamsdd.aspx.vb" Inherits="bckinhdoanh.viphamsdd" %>

<%@ Register src="Controls/ctlQuy_VPSDD.ascx" tagname="ctlQuy_VPSDD" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlQuy_VPSDD ID="ctlQuy_VPSDD1" runat="server" />
</asp:Content>
