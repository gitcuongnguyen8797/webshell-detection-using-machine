<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/siteadmin.master" CodeBehind="bctuan.aspx.vb" Inherits="bckinhdoanh.bctuan" 
    title="Báo Cáo Tuần" %>
<%@ Register src="Controls/ctlBaoCaoTuan.ascx" tagname="ctlBaoCaoTuan" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link type="text/css" href="/jquery/css/smoothness/jquery-ui-1.8.19.custom.css" rel="Stylesheet" />	
<script type="text/javascript" src="/jquery/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/jquery/js/jquery-ui-1.8.19.custom.min.js"></script>
<script type="text/javascript" src="/jquery/js/calendar-vi.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ctlBaoCaoTuan ID="ctlBaoCaoTuan1" runat="server" />
</asp:Content>