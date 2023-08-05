<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="SoLechDoc.aspx.vb" Inherits="caothe.WebForm1" %>
<%@ Register src="Controls/ctlSoLech.ascx" tagname="ctlSoLech" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="css/base2.css" type="text/css" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td width="200" valign="top">    
                <uc1:ctlSoLech ID="ctlSoLech1" runat="server" />
            </td>
            </tr>
        </table>
        	
</asp:Content>
