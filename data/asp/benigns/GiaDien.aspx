<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="GiaDien.aspx.vb" Inherits="hcmpc.GiaDien" %>

<%@ Register src="Controls/ctlTinTheoSection2.ascx" tagname="ctlTinTheoSection2" tagprefix="uc1" %>
<%@ Register src="Controls/ctlTuyenTruyenTKD.ascx" tagname="ctlTuyenTruyenTKD" tagprefix="uc2" %>

<%@ Register src="Controls/ucLienHe.ascx" tagname="ucLienHe" tagprefix="uc3" %>

<%@ Register src="Controls/ucLienHeMiddle.ascx" tagname="ucLienHeMiddle" tagprefix="uc4" %>

<%@ Register src="Controls/ucGiaDien.ascx" tagname="ucGiaDien" tagprefix="uc5" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">    
    <div id="magictabs_iuluaf6q" class="magictabs_style_lightblue_rounded">
	    
        <uc5:ucGiaDien ID="ucGiaDien" runat="server" />
	    
    </div>    
   <%-- <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style>--%>
    </asp:Content>
