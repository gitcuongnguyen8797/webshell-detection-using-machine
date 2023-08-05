<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casefour.master" CodeBehind="sitemap_bak.aspx.vb" Inherits="hcmpc.sitemap_bak" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" type="text/css" media="screen, print" href="css/slickmap.css" />
    <style>
        #main-content { width: 960px; margin: 10px auto; padding-top:10px;}        
        #da_slider_head { padding: 10px 0; background: #333; color: #666; text-align: center; margin: 0 40px 20px; text-shadow: 1px 1px 1px #000;}
        .samplecode { margin: 10px 0; padding: 20px 50px; display:block; background: #fff;}
        .panel-wrapper p{padding:5px 0;}             
        #magic-nav-magic-slider-1 ul li{float:left;} 
        .magic-nav-left{ width:30px;}
        #primaryNav a:link:before, #primaryNav a:visited:before, #utilityNav a:link:before, #utilityNav a:link:before {
            content:normal;
            cursor: pointer; 
        }
    </style>
	

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
<br/> 
    <div id="middleTwo">  
        <div class="sidebar topRightBlocks ">
        <div id="recentNews">
						<div class="section subHeading">
					        <h1>Sơ đồ web</h1>			
                            </div>	

        </div>	
        </div>
                <br />
	    <div class="magic-slider-wrapper" style=" width:58.4em;">
          
		    <div class="sitemap">		
		       <%-- <ul id="utilityNav">
			        <li style="display:none"><a href="default.aspx">Đăng ký</a></li>
			        <li><a href="logo.aspx">Liên kết</a></li>
			        <li><a href="sitemap.aspx">Site Map</a></li>
		        </ul>--%>
                <br />

		        <ul id="primaryNav" class="col4">
			        <li id="home"><a href="default.aspx">Website</a></li>			        
			        <li><a href="default.aspx">Trang chủ</a>
				        <ul>
                            <li><a href="moithau.aspx">Thông tin mời thầu</a></li>					        					        
					        <li><a href="tintuc.aspx?ID=2">An toàn - Tiết kiệm điện</a></li>
					        <li><a href="vanhoaevnhcmc.aspx">Văn hóa EVNHCMC</a></li>
                            <li><a href="phapche.aspx">Pháp chế</a></li> 
                            <li><a href="tintuc.aspx?ID=29">Tuyển dụng</a></li>
                            <li><a href="hoigopy.aspx">Hỏi đáp - Góp ý</a></li>
                            <li><a href="clip.aspx">Video clip</a></li>
					        <li><a href="psanh.aspx?ID=21">Phóng sự ảnh</a></li>
					        <li><a href="psanh.aspx?ID=6">EVNHCMC qua ảnh</a></li>
					        <li><a href="tintuc.aspx">Thông tin cần biết</a></li>                            					                                   
				        </ul>
			        </li>
			        <li><a href="grouptintuc.aspx">Các hoạt động</a>
				        <ul>	
                            <li><a href="#">THÔNG TIN</a>
                                <ul>									
									<li><a href="grouptintuc.aspx">Tổng công ty</a></li>
									<li><a href="tintuc.aspx?ID=4">Đoàn thể</a></li>
                                    <li><a href="tintuc.aspx?ID=15">Học tập và làm theo tấm gương đạo đức Hồ Chí Minh</a></li>
                                    <li><a href="vanhoaevnhcmc.aspx">Văn hóa EVNHCMC</a></li>
                                    <li><a href="phapche.aspx">Pháp chế</a></li>
                                    <li><a href="tintuc.aspx?ID=34">Thông báo từ EVNHCMC</a></li>                                    
                                    <li><a href="MoiThau.aspx">Thông tin mời thầu</a></li>
                                    <li><a href="tinebookread.aspx?Loai=ds">Các điểm thu tiền điện</a></li>
                                    <li><a href="tintuc.aspx?ID=29">Thông tin tuyển dụng</a></li>	
                                    <li><a href="hoigopy.aspx">Hỏi đáp – góp ý</a></li>		
                                    								
								</ul>
                            </li>
                            <li><a href="#">KHẮP NƠI</a>
                                <ul>									
									<li><a href="tintuc.aspx?ID=3">Tin trong ngành</a></li>
									<li><a href="tintuc.aspx?ID=16">Điểm báo - Phản Hồi</a></li>	
                                    <li><a href="tintuc.aspx?ID=19">Đặc san kỹ thuật</a></li>								
								</ul>
                            </li>	
                             <li><a href="#">CÁC ẤN PHẨM</a>
                                <ul>									
									<li><a href="tinebook.aspx?ID=2">Bản tin Công đoàn</a></li>
									<li><a href="tinebook.aspx?ID=3">Bản tin zoom</a></li>
                                    <li><a href="tinebookread.aspx?Loai=vh">Cẩm nang Văn hóa EVNHCMC</a></li>
								</ul>
                            </li>
                            <li><a href="tintuc.aspx?ID=33">Hội điện lực TPHCM</a></li>	
				        </ul>
			        </li>
                    <li><a href="gioithieu.aspx">Giới thiệu</a>
				        <ul>
					        <li><a href="gioithieu.aspx?tab=1">Tổng quan</a></li>
					        <li><a href="gioithieu.aspx?tab=2">Quá trình đầu tư</a></li>
					        <li><a href="gioithieu.aspx?tab=3">Lĩnh vực hoạt động</a></li>
                            <li><a href="gioithieu.aspx?tab=4">Sơ đồ tổ chức</a></li>
                            <li><a href="gioithieu.aspx?tab=7">Sơ đồ lưới điện</a></li>
                            <li><a href="gioithieu.aspx?tab=8">Thông tin chung</a></li>
				        </ul>
			        </li>
			        <li><a href="lienhe.aspx">Liên hệ</a>				        
			        </li>	
		        </ul>

	        </div>
	       
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" runat="server" ContentPlaceHolderID="FooterContent">   

</asp:Content>


