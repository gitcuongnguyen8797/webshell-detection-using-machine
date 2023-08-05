<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mGiaDien.aspx.vb" Inherits="hcmpc.mGiaDien" %>
<%@ Register src="../Controls/ucGiaDien.ascx" tagname="ucGiaDien" tagprefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="magictabs_iuluaf6q" class="magictabs_style_lightblue_rounded">
        <uc5:ucGiaDien ID="ucGiaDien" runat="server" />
    </div>
</asp:Content>
