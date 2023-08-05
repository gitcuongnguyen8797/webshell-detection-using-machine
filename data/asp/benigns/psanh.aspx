<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casefour.master" CodeBehind="psanh.aspx.vb" Inherits="hcmpc.psanh" %>

<%@ Register src="Controls/ctlPSAnhDisplay.ascx" tagname="ctlPSAnhDisplay" tagprefix="uc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

  <uc1:ctlPSAnhDisplay  ID="ctlPSAnhDisplay1" runat="server" />

</asp:Content>
<asp:Content ID="FooterContent" runat="server" ContentPlaceHolderID="FooterContent">
   <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
   <link rel="stylesheet" type="text/css" href="js/main.css" />
   <link rel="stylesheet" type="text/css" href="js/jquery.jcarousel.css" />
   <link rel="stylesheet" type="text/css" href="js/skin.css" />
   <script type="text/javascript" src="js/jquery.galleria.min.js"></script>
   <script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
   <script type="text/javascript" src="js/jquery.hotkeys-0.7.8-packed.js"></script>
   <script type="text/javascript" src="js/tutorial.js"></script>
   <script type="text/javascript">
       $(window).load(function () {

           $("#mhoatdong1").css("font-size", "14px");
           $("#mgioithieu1").css("font-size", "14px");
           $("#mgioithieu1").css("left", "450px");
           $("#mhoatdong").hover(function () {
               $("#mhoatdong1").show();
           });
           $("#mhoatdong1").mouseleave(function () {
               $(this).hide();
           });
           $("#mgioithieu").hover(function () {
               $("#mgioithieu1").show();
           });
           $("#mgioithieu1").mouseleave(function () {
               $(this).hide();
           });


           var _divNav = $(document.createElement('div')).addClass('overlay-nav').attr('style', 'width: 560px; height: 450px; left: 10px; opacity:0;').append("<a class='prev' id='galleryPrev'></a><a class='next' id='galleryNext'></a>");
           $(".galleria_container").append(_divNav);
           $('#galleryPrev').click(function () { $.galleria.prev(); });
           $('#galleryNext').click(function () { $.galleria.next(); });
           $('#img').hover(function () { $('.overlay-nav').attr('style', 'width: 560px; height: 450px; left: 10px;opacity:1; '); }, function () { $('.overlay-nav').attr('style', 'width: 560px; height: 450px; left: 10px;opacity:0; '); });


       });  
   </script> 
</asp:Content>
 
