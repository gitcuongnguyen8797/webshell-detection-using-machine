﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/myniengiam2.master" CodeBehind="NhapG2.aspx.vb" Inherits="niengiam.NhapG2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%=sScriptUpDown%>
<script type="text/javascript" src="Scripts/scriptNienGiam.js"></script>
<script type="text/javascript" language="javascript">

    function Tracking() {
        <%=sToken%>
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
        <div id="system-message-container">            
            <asp:PlaceHolder ID="msg" runat="server">                
            </asp:PlaceHolder>     
        </div>
       <div>       
           <h1 class="xanh">CƠ CẤU NHÂN SỰ TẠI ĐƠN VỊ QUẢN LÝ<br /><br />
           <div align="center">                
                <asp:Button ID="btnNamTruoc" CssClass="g-button g-button-submit" runat="server" Text="<< Năm Trước" />&nbsp;&nbsp;
                <asp:TextBox ID="txtNam" runat="server" style=" line-height:28px;" CssClass="nam"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnNamKe" CssClass="g-button g-button-submit" runat="server" Text="Năm Kế Tiếp >>" />                
            </div>
           </h1>
           <div align="right" style="color:#3079ed;font-weight:bold;padding-right:10px;">ĐVT: Người</div>
       </div><br />
       <div class="mpanel">            
            <asp:Table ID="tblDynamic2" runat="server" Width="100%" >
            </asp:Table>            
       </div>
       <div class="bpanel">
            <a class="btn cam" href="#" onclick="__doPostBack('<%= btnLaySoLieu.UniqueID %>','')" style="margin-right:4px;">
                <span class="gbgs"><span class="gbit" >Lấy Số Liệu</span></span>
            </a>
            <a class="btn cam" href="#" onclick="__doPostBack('<%= btnLuu.UniqueID %>','')" style="margin-right:4px;">
                <span class="gbgs"><span class="gbit" style=" padding-left:10px; padding-right:10px;">Lưu</span></span>
            </a>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" style="display:none;" />
            <asp:Button ID="btnLaySoLieu" runat="server" Text="Lấy Số Liệu" Width="80" style="display: none" />

        </div>                  
   </div>
</asp:Content>