<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseThree.master" CodeBehind="lienhe_bak.aspx.vb" Inherits="hcmpc.lienhe_bak" %>
<%@ Import Namespace = "System.Data" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
     <style>
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
        width: 612px;
        height:508px;
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
    </style>
<script>
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
//    function clearMarkers(){
//          for(var i=0; i<markers.length; i++){
//            markers[i].set_map(null);
//          }
//          markers.length = 0;
//        }; 
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
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


<div id="middle">
		<div class="phanhoiMiddle" >
			<!-- start: tier one -->
	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
					<div class="section subHeading">	
					<h1>Thông tin liên hệ</h1>			
                    </div>	

</div>	
</div>
        <br />   
        <style>
            .gtext
            {
                color: #666666;
                font-family: Arial,Helvetica,sans-serif;
                font-size: 14px;
                
             }
                  

        </style> 
        <div style="padding-left:5px" class="gtext">
      
            <h4 class="lienhe">Thông Tin,Vị Trí Của       
          <select id="ViTriDonVi" class="posDirect" style="font-size:13px; color:#666; border:1px solid #aaa;" onchange="getInfo();">  
                <% For Each r As DataRow In dt.Rows%> 	
                          <option value="<%=r("lat")%>,<%=r("lng")%>@#$<%=r("DiaChi")%>@#$<%=r("DienThoai")%>@#$<%=r("TenDonVi").ToString().ToUpper()%>"> <%=r("TenDonVi")%> </option>                       
                 <%Next%>
                  </select>        
             </h4>
            <div id="Info">                    
                <div  style="float: left; color:#0066CC; font-weight:bold" id="lbCongTy"><%=dt.Rows(0)("TenDonVi").ToString().ToUpper()%></div>
                <br />              
                <div style="float: left"></div>
                <div  style="float: left" id="lbDiaChi"><%=dt.Rows(0)("DiaChi")%></div>
                <br />              
                <div style="float: left">Điện Thoại:&nbsp</div>
                <div  style="float: left; color:#0066CC;" id="lbDienThoai"><%=dt.Rows(0)("DienThoai")%></div>
            </div>    
            <br />        
        </div>   
        <div style="padding-left:5px" class="gtext">
            <h4 class="lienhe" >Tìm Đường Đi Từ<input id="searchDirect" name="q1" class="posDirect" placeholder="Nhập điểm bắt đầu"
                    type="text" size="20" style="font-size:13px; color:#666;">Đến 
                <select id="Den" class="posDirect" style="font-size:13px; color:#666; border:1px solid #aaa;">  
                <% For Each r As DataRow In dt.Rows%> 	
                          <option value="<%=r("lat")%>,<%=r("lng")%>"> <%=r("TenDonVi")%> </option>                       
                 <%Next%>
                  </select>
            <a indepth="true" onclick="calcRoute();" role="button" class="directbutton">Tìm ►</a>	
            </h4>
        </div>
        <%-- <div id="panel">
       <b>Kiểu Di Chuyển &nbsp</b>        
        <select id="mode" class="posDirect" onchange="calcRoute();">
          <option value="DRIVING">Lái Xe</option>
          <option value="WALKING">Đi Bộ</option>
          <option value="BICYCLING">Xe Đạp</option>
          <option value="TRANSIT">Công Cộng</option>
        </select>            
        </div>--%>
        <div id="map-canvas"></div>

			<br />
		<%--<asp:Label ID="lblError" Visible="false" Text="Thông tin liên hệ của khách hàng chưa gửi đến chúng tôi. Xin vui lòng gửi lại." style="background-color:InfoBackground; padding-top:5px; padding-bottom:5px; margin-bottom:10px; display:block;" ForeColor="Red" runat="Server"></asp:Label>
        <div style=" padding-bottom:10px;border-bottom:solid 1px #DDD; font-size:12px; font-weight:bold; color:#1F83D7;">Quý khách vui lòng điền vào mẫu thông tin dưới đây</div>                
        <div style="padding-top:30px">    
            <style>
                
                .textbox                
                { 
                    height:30px; width:260px;
                    border: 1px solid #DDD;
                    border-radius: 5px 5px 5px 5px;
                    color:#555; padding-left:8px;
                    font-size:12px;  
                    line-height: 30px;                                     
                }
                .textbox:hover{border: 1px solid #addefc;}
                .textbox:focus{border: 1px solid #addefc;}
                .textarea{ color:#555; padding-left:8px; padding-top:8px;font-size:12px; width:310px; height:218px; border:solid 1px #FFF;}
                #s1{position:relative; color:Red; left:75px; top:-277px; font-size:12px; display:none;}
                #s2{position:relative; left:78px; top:-216px; color:Red; font-size:12px; display:none;}
                #s3{position:relative; left:55px; top:-157px; color:Red; font-size:12px; display:none;}
                #s4{position:relative; left:355px; top:-298px; color:Red; font-size:12px; display:none;}
            </style>
            <!--[if lte IE 8]>
                <style>                
                #s1{position:relative; color:Red; left:75px; top:-285px; font-size:12px}
                #s2{position:relative; left:78px; top:-220px; color:Red; font-size:12px}
                #s3{position:relative; left:55px; top:-160px; color:Red; font-size:12px}
                #s4{position:relative; left:355px; top:-308px; color:Red; font-size:12px}  
                .textarea{ height:223px;}              
                </style>
            <![endif]-->            
            <div style="float:left; width:46%">
                <div style="padding-top:1px;"><input type="text" id="tencty" class="gInput" value="Tên công ty" onfocus="tFocus(this,-1)" onblur="tBlur(this,-1)" runat="Server" /></div>
                <div style="padding-top:5px"><input type="text" id="hoten" class="textbox" value="Họ và tên" onfocus="tFocus(this,1)" onblur="tBlur(this,1)" runat="Server" /></div>
                <div style="padding-top:5px"><input type="text" id="diachi" class="textbox" value="Địa chỉ" onfocus="tFocus(this,-1)" onblur="tBlur(this,-1)" runat="Server" /></div>
                <div style="padding-top:5px"><input type="text" id="phone" class="textbox" value="Điện thoại" onfocus="tFocus(this,2)" onblur="tBlur(this,2)" runat="Server" /></div>
                <div style="padding-top:5px"><input type="text" id="fax" class="textbox" value="Fax" onfocus="tFocus(this,-1)" onblur="tBlur(this,-1)" runat="Server" /></div> 
                <div style="padding-top:5px"><input type="text" id="email" class="textbox" value="Email" onfocus="tFocus(this,3)" onblur="tBlur(this,3)" runat="Server" /></div> 
            </div>
            <div style="float:left; width:54%; *padding-top:2px;">
                <div style="border:solid 1px #DDD;border-radius: 5px 5px 5px 5px;">
                    <textarea id="noidung" name="noidung" class="textarea" onfocus="tFocus(this,4)" onblur="tBlur(this,4)" runat="Server">Nội dung</textarea>
                </div>                
               
            </div>
            <div class="clear"></div>
            <p align="right" style="color:#555;"><br /><span style="color:red">(*)</span> Các thông tin bắt buộc</p>
            <p align="center" style="padding-top:15px">   
            
                <asp:Button ID="btnGuiDi" Text="Gửi đi" class="g-button g-button-submit" style=" height:27px; width:70px;" runat="server" />
                &nbsp;                              
                <asp:Button ID="btnNhapLai" Text="Nhập lại" class="g-button g-button-submit" style=" height:27px; width:70px;" runat="server" />
                            
            </p>
            <span id="s4">*</span>&nbsp;
               <br /><span id="s1">*</span>&nbsp;
               <br /><span id="s2">*</span>&nbsp;
               <br /><span id="s3">*</span>&nbsp;
        </div>--%>

        </div>
 



    </div>	
		
			
			






   
        
</asp:Content>
