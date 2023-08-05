<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NhapD1.aspx.vb" Inherits="niengiam.NhapD1" MasterPageFile="~/myniengiam2.master"%>
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
           <h1 class="xanh">TỔNG HỢP SỰ CỐ LƯỚI ĐIỆN TRÊN ĐỊA BÀN THÀNH PHỐ<br /><br />
           <div align="center">                
                <asp:Button ID="btnNamTruoc" CssClass="g-button g-button-submit" runat="server" Text="<< Năm Trước" />&nbsp;&nbsp;
                <asp:TextBox ID="txtNam" runat="server" style=" line-height:28px;" CssClass="nam"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnNamKe" CssClass="g-button g-button-submit" runat="server" Text="Năm Kế Tiếp >>" />                
            </div>
           </h1>
       </div><br />
       <div class="mpanel">            
            <asp:table id="tblDynamic2" runat="server" Width="100%">
            </asp:table>           
       </div>
       <div class="bpanel">           
            <a class="btn cam" href="#" onclick="__doPostBack('<%= btnLuu.UniqueID %>','')" style="margin-right:4px;">
                <span class="gbgs"><span class="gbit" style=" padding-left:10px; padding-right:10px;">Lưu</span></span>
            </a>            
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" style="display:none;" />
        </div>                  
   </div>
  
</asp:Content>

