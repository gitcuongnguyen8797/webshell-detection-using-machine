<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/caseTCT.Master" CodeBehind="tinanh.aspx.vb" Inherits="hcmpc.tinanh" %>

<%@ Register src="Controls/ctlPSAnhTheoLoai.ascx" tagname="ctlPSAnhTheoLoai" tagprefix="uc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    
    <!--[if lt IE 9]>
        <style type="text/css">
            .TT{float:left;}
        </style>
    <![endif]-->
    <uc1:ctlPSAnhTheoLoai ID="ctlPSAnhTheoLoai" runat="server" />
    <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style>    
</asp:Content>