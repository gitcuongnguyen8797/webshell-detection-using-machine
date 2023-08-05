<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="truythu_cdbhp.aspx.vb" Inherits="bckinhdoanh.truythu_cdbhp" %>
<%@ Register src="Controls/ctlTruyThu_CDBHP.ascx" tagname="ctlTruyThu_CDBHP" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlTruyThu_CDBHP ID="ctlTruyThu_CDBHP1" runat="server" />
</asp:Content>
