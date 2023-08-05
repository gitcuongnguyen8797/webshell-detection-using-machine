<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="sanluong.aspx.vb" Inherits="caothe.sanluong" %>
<%@ Register src="Controls/ctlSanLuong.ascx" tagname="ctlSanLuong" tagprefix="uc1" %>
<%@ Register src="Controls/ctlDSTram.ascx" tagname="ctlDSTram" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/base2.css" type="text/css" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td>
            &nbsp;
            </td>
            <td width="200" valign="top">    
                <uc2:ctlDSTram ID="ctlDSTram1" runat="server" />
            </td>
            <td width="10" valign="top">    
            &nbsp;
            </td>
            <td valign="top">    
                <uc1:ctlSanLuong ID="ctlSanLuong1" runat="server" />
            </td>
            </tr>
        </table>
</asp:Content>
