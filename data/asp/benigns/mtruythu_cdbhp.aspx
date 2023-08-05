<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="mtruythu_cdbhp.aspx.vb" Inherits="bckinhdoanh.mtruythu_cdbhp" %>
<%@ Register src="Controls/ctlTruyThu_CDBHP_ChiTieu.ascx" tagname="ctlTruyThu_CDBHP_ChiTieu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlTruyThu_CDBHP_ChiTieu ID="ctlTruyThu_CDBHP_ChiTieu1" runat="server" />
</asp:Content>
