<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NhapDT.aspx.vb" Inherits="niengiam.NhapDT" MasterPageFile="~/myniengiam2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
        <div id="system-message-container">            
            <asp:PlaceHolder ID="msg" runat="server">                
            </asp:PlaceHolder>     
        </div>
       <div>       
           <h1 class="xanh">DIỆN TÍCH ĐỊA BÀN QUẢN LÝ THEO TỪNG ĐƠN VỊ<br />Năm : <asp:Label ID="lblNam" runat="server" Text="Label"></asp:Label></h1>
       </div><br />
       <div class="mpanel">
            <asp:table id="tblDynamic2" runat="server" Width="700" style="border-collapse:collapse;">
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
