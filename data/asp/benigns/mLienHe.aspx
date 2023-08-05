<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mLienHe.aspx.vb" Inherits="hcmpc.mLienHe" %>
<%@ Import Namespace = "System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places" type="text/javascript"></script>    
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
      #directions-panel {
        height: 596px;
        float: right;
        width: 756px;
        left:2px;
        right:2px;
        overflow: auto;
      }

      #map-canvas {
        margin-left: 2px;
        border:5px;
        width: 100%;
        height:500px;
      }

      #control {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }

      #pac-input {
        background-color: #fff;
        padding: 0 11px 0 13px;
        width: 200px;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        text-overflow: ellipsis;
      }

      #pac-input:focus {
        border-color: #4d90fe;
        margin-left: -1px;
        padding-left: 14px;  /* Regular padding-left + 1. */
        width: 201px;
      }

      .pac-container {
        font-family: Roboto;
      }

      @media print {
        #map-canvas {
          height: 500px;
          margin: 0;
        }

        #directions-panel {
          float: none;
          width: auto;
        }
      }
    .gtext
    {
        color: #666666;
        font-family: Arial,Helvetica,sans-serif;
        font-size: 14px;
    }
    .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
    .subHeading h1{color:#FFF;}
    .leftCol{float:left; width:30%;}   
    .rightCol{float:right; width:30%;}
    </style>
    <script type="text/javascript">
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map;
        var haight = new google.maps.LatLng(<%=lat%>, <%=lng%>);
        var oceanBeach = new google.maps.LatLng(<%=lat%>,<%=lng%>);    
        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions = {
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: haight
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directions-panel'));
 
            placeMarker(haight, map,"35 Tôn Đức Thắng, Phường Bến Nghé, Q1");

            var markers = [];
            var input =( document.getElementById('searchDirect'));
            var searchBox = new google.maps.places.SearchBox((input)); 
            google.maps.event.addListener(map, 'bounds_changed', function() {
            var bounds = map.getBounds();
            searchBox.setBounds(bounds);
            });
        }

        function calcRoute() {
           // var selectedMode = document.getElementById('mode').value;
           var selectedMode ="DRIVING";
            var request = {
                origin: document.getElementById('searchDirect').value,
                destination: document.getElementById('Den').value,
                // Note that Javascript allows us to access the constant
                // using square brackets and a string value as its
                // "property."
                travelMode: google.maps.TravelMode[selectedMode]
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        } 
        function placeMarker(position, map,content) {
    //      clearMarkers();
                var infowindow = new google.maps.InfoWindow({
                  content: content
              });
            var marker = new google.maps.Marker({
              position: position,
              map: map
            });
    //        markers.markers.push(marker);
            map.panTo(position);
            google.maps.event.addListener(marker, 'click', function() 
            {
                infowindow.open(map,marker);
            });
          }

        function getInfo() {
            var data=document.getElementById('ViTriDonVi').value
            var datasplit=data.split("@#$");
            var vitri=datasplit[0];
            var diachi=datasplit[1];
            var dienthoai=datasplit[2];
            var tenCongTy=datasplit[3];
            document.getElementById('lbCongTy').innerHTML=tenCongTy;
            document.getElementById('lbDiaChi').innerHTML=diachi;
            document.getElementById('lbDienThoai').innerHTML=dienthoai;
        
            //FOR MAP
            var latlngResult=vitri.split(",")        
           var result= new google.maps.LatLng(parseFloat(latlngResult[0]),parseFloat(latlngResult[1]));
           placeMarker(result, map,diachi);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="middle">
		<div class="phanhoiMiddle" style="border: 0 solid #F0F0F0; ">
			<!-- start: tier one -->
            <div class="div_title_block_tin">
			            <a href="#" class="title_block_tin">
				            <span class="pLinkObj">
				                Thông tin liên hệ
				            </span>
                            <span class="arrow"></span>
			            </a>
		            </div>               
            <div style="padding-left:5px;" class="gtext">
                <h4>Thông Tin, Vị Trí Của<br />       
                    <select id="ViTriDonVi" class="posDirect" style="font-size:13px; color:#666; border:1px solid #aaa; width:80%;" onchange="getInfo();">  
                        <% For Each r As DataRow In dt.Rows%> 	
                            <option value="<%=r("lat")%>,<%=r("lng")%>@#$<%=r("DiaChi")%>@#$<%=r("DienThoai")%>@#$<%=r("TenDonVi").ToString().ToUpper()%>"> <%=r("TenDonVi")%> </option>                       
                        <%Next%>
                    </select>        
                 </h4>
                <div id="Info">                    
                    <div style="color:#0066CC; font-weight:bold" id="lbCongTy"><%= dt.Rows(0)("TenDonVi").ToString().ToUpper()%></div>
                    <div id="lbDiaChi"><%=dt.Rows(0)("DiaChi")%></div>             
                    <div style="float: left;">Điện Thoại:&nbsp</div>
                    <div style="float: left; color:#0066CC;" id="lbDienThoai"><%= dt.Rows(0)("DienThoai")%></div>
                </div>    
                <br />        
            </div>   
            <div style="padding-left:5px; text-align:left;" class="gtext">
                <h4>Đường Đi Từ: <br />
                    <input id="searchDirect" name="q1" class="posDirect" placeholder="Nhập điểm bắt đầu"
                        type="text" size="20" style="font-size:13px; color:#666; width:79%;"/><br />
                    Đến: <br />
                    <select id="Den" class="posDirect" style="font-size:13px; color:#666; border:1px solid #aaa; width:80%;">  
                        <% For Each r As DataRow In dt.Rows%> 	
                              <option value="<%=r("lat")%>,<%=r("lng")%>"> <%=r("TenDonVi")%> </option>                       
                        <%Next%>
                    </select> 
                 <a indepth="true" onclick="calcRoute();" role="button" class="directbutton">Tìm ►</a><br />           
                </h4>
            </div>        
            <div id="map-canvas"></div><br />
        </div>
    </div>	
</asp:Content>
