<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/m/mymobile.master" CodeBehind="diachi.aspx.vb" Inherits="hcmpc.diachi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" 

src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
  <script 

type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
  

<script type="text/javascript" src="gmaps.js"></script>
  
<link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css" />
  

<link rel="stylesheet" type="text/css" href="examples.css" />
  
<script type="text/javascript">

    $(document).ready(function () {
        map = new GMaps({
            div: '#map',
            lat: <%=lat%>,
            lng: <%=lng%>,
            width: '300px',
            height: '300px',
            zoomControl: true,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL,
                position: google.maps.ControlPosition.TOP_LEFT
            },
            scrollwheel: false,
            panControl: false,
            mapTypeControl: false,
            scaleControl: false,
            streetViewControl: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        map.addMarker({
            lat: <%=lat%>,
            lng: <%=lng%>,
            title: '<%=sDV%>',
            click: function (e) {
                //alert('You clicked in this marker');
            },
            infoWindow: {
                content: '<p><%=sDV%><br><%=sDC%></p>'
            }
        });

    });



</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<center>
<div width="400">
<h3 color="red"><%=sDV%></h3>
<br/>
<p>
<b>Địa chỉ: <%=sDC%></b><br/>
<b>Điện thoại: <%=sTel%></b>
</p>

</div>

</center>

<div class="row">
    
<div class="span11">
      
   <div id="map"></div>

</div>
</div>




</asp:Content>
