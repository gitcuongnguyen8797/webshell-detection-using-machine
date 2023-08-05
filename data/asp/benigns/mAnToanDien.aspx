<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mAnToanDien.aspx.vb" Inherits="hcmpc.mAnToanDien" %>
<%@ Register src="Controls/mucTinMoiNhat.ascx" tagname="mucTinMoiNhat" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="div_title_block_tin">
	<a href="#" class="title_block_tin">
		<span class="pLinkObj">
			An Toàn Điện
		</span>
        <span class="arrow"></span>
	</a>
</div>
    <uc1:mucTinMoiNhat ID="mucTinMoiNhat1" runat="server" />  
</asp:Content>
