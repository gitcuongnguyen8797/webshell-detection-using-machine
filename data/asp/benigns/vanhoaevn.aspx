<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo1.master" CodeBehind="vanhoaevn.aspx.vb" Inherits="hcmpc.vanhoaevn" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" href="css/boiler_first.css" type="text/css">	
    <style>
        #main-content { width: 960px; margin: 10px auto; padding-top:10px;}        
        #da_slider_head { padding: 10px 0; background: #333; color: #666; text-align: center; margin: 0 40px 20px; text-shadow: 1px 1px 1px #000;}
        .samplecode { margin: 10px 0; padding: 20px 50px; display:block; background: #fff;}
        .panel-wrapper p{padding:5px 0;}             
        #magic-nav-magic-slider-1 ul li{float:left;} 
        .magic-nav-left{ width:30px;}             
    </style>
	<link rel="stylesheet" href="css/magic-slider.css" type="text/css">
	<link rel="stylesheet" href="css/boiler_last.css" type="text/css">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="main-content">        
        <img src="logo/elogo.png" style=" padding-right:6px; float:left;">
        <p class="head1" style="text-transform:uppercase;border-bottom:solid 1px #DDD; padding-bottom:10px; padding-top:1px;">Văn hóa EVNHCMC</p><br />
	    <div class="magic-slider-wrapper" style=" width:960px;">
		    <div class="magic-slider preload" id="magic-slider-1">
			    <div class="panel">
				    <div class="panel-wrapper" style=" background:url(images/bg-vh-evnhcmc.jpg); height:550px; background-size:880px 594px;">                        
					    <h2 class="title hidden">Hệ giá trị cốt lõi</h2>
                        <p><strong>Hệ giá trị cốt lõi</strong></p>
					    <p>Hệ giá trị cốt lõi là những giá trị mà mỗi thành viên đều trân trọng và tuân thủ.</p>
                        <p>Đó là sự hướng nội, khi bản thân mình có niềm tin và một mục đích rõ ràng thì chúng ta sẽ mang lại được lợi ích cho khách hàng và cộng đồng và cho cả bản thân mình, khi chúng ta có niềm tin và mục đích rõ ràng thì hành động của chúng ta sẽ khác với mọi người.</p>
				    </div>
			    </div>
			    <div class="panel">
				    <div class="panel-wrapper" style=" background:url(images/bg-vh-evnhcmc.jpg); height:550px; background-size:880px 594px;">
					    <h2 class="title hidden">Tầm nhìn</h2>					    
					    <p><strong>Tầm nhìn</strong></p>
					    <p>Tầm nhìn là hướng đi. Một doanh nghiệp không có tầm nhìn sẽ giống như một người đi trong rừng mà không có la bàn, đi trên biển lớn mà không có hải đồ.</p>
                        <p><strong>Tổng công ty Điện lực Tp HCM là một trong những đơn vị hàng đầu trong lĩnh vực cung ứng điện năng với uy tín và chất lượng cao tại Việt Nam cũng như trong khu vực.</strong></p>
				    </div>
			    </div>
                <div class="panel">
				    <div class="panel-wrapper" style=" background:url(images/bg-vh-evnhcmc.jpg); height:550px; background-size:880px 594px;">
					    <h2 class="title hidden">Sứ mệnh</h2>					    
					    <p><strong>Sứ mệnh</strong></p>
                        <p>Sứ mệnh: là một khái niệm dùng để xác định các mục đích của công ty, những lý do công ty đó ra đời và căn cứ tồn tại, phát triển của nó. Sứ mệnh của công ty chính là bản tuyên ngôn của công ty đó đối với xã hội, nó chứng minh tính hữu ích và các ý nghĩa trong sự tồn tại của công ty đối với xã hội.</p>
                        <p><strong>“Đáp ứng đầy đủ các nhu cầu về điện của khách hàng với chất lượng ngày càng cao và dịch vụ ngày càng hoàn hảo.”</strong></p>
				    </div>
			    </div>			    
                <div class="panel">
				    <div class="panel-wrapper" style=" background:url(images/bg-vh-evnhcmc.jpg); height:550px; background-size:880px 594px;">
					    <h2 class="title hidden">Khẩu hiệu</h2>					    
					    <p><strong>Khẩu hiệu</strong></p>	
                        <p>Khẩu hiệu: là một lời văn ngắn gọn diễn tả cô đọng về một vấn đề nào đó mà một tổ chức hay một công ty muốn thông báo đến cho mọi người hay đơn giản là lấy lại tinh thần hay phát động một phong trào nội bộ.</p>
                        <p align="center"><strong>Lương tâm- Trách nhiệm- Hiệu quả.</strong></p>
				    </div>
			    </div>				        
                <div class="panel">
				    <div class="panel-wrapper" style=" background:url(images/bg-vh-evnhcmc.jpg); height:800px; background-size:880px 844px;">
					    <h2 class="title hidden">Cam kết</h2>					    
					    <p><strong>Cam kết</strong></p>	
                        <p><strong>a. Với Đảng, thành phố và Tập đoàn Điện lực Việt Nam.</strong></p>
                        <p style="padding-left:10px">• Cam kết hoàn thành tốt nhiệm vụ được Đảng, Thành phố và EVN giao phó, đảm bảo cung cấp điện đầy đủ, ồn định, đáp ứng cho yêu cầu phát triển kinh tế - xã hội, đóng góp thiết thực cho mục tiêu phát triển bền vững của Thành phố.</p>		    
                        <p style="padding-left:10px">• Mỗi CBCNV ý thức rõ vai trò, trách nhiệm của mình trong việc góp phần phát triển EVNHCMC.</p>
                        <p style="padding-left:10px">• Kiên quyết bài trừ tệ nạn tham nhũng, cửa quyền, quan liêu, thiếu trách nhiệm và tư lợi cá nhân. Tuân thủ nghiêm các quy định về thực hành tiết kiệm và chống lãng phí.</p>
                        <p><strong>b. Với người lao động.</strong></p>
                        <p style="padding-left:10px">• Đảm bảo ổn định việc làm, chăm lo đời sống quyền lợi về vật chất, tinh thần cho người lao động để người lao động yên tâm công tác và cống hiến nhiệt huyết , trí tuệ, năng lực, toàn tâm toàn ý cho công việc được giao.</p>
                        <p style="padding-left:10px">• Tạo điều kiện cho người lao động phát huy tối đa năng lực, sở trường trong lĩnh vực mình công tác để phục vụ công việc với hiệu quả cao nhất. Đặc biệt là các ý tưởng sáng tạo trong công việc phải được khuyến khích để phát huy tinh thần học hỏi, nâng cao khả năng áp dụng ý tưởng vào thực tiễn của người lao động.</p>
                        <p style="padding-left:10px">• Người lao động phải được đánh giá đúng năng lực, thành tích phải được ghi nhận kịp thời, công bằng và công khai.</p>
                        <p><strong>c. Với cộng đồng</strong></p>
                        <p style="padding-left:10px">• Với phương châm “Vì một cộng đồng phát triển”, EVNHCMC nỗ lực xây dựng hình ảnh là một trong những đơn vị đi đầu trong việc đáp ứng các nhu cầu chính đáng về điện đến mọi người dân trong xã hội với chất lượng hoàn hảo và dịch vụ tốt nhất để góp phần vào sự phát triển của cộng đồng, công nghiệp hóa – hiện đại hóa đất nước.</p>
                        <p style="padding-left:10px">• Luôn tích cực tham gia và khuyến khích, tạo điều kiện để mọi tổ chức, cá nhân tham gia các hoạt động xã hội như đền ơn đáp nghĩa, từ thiện…</p>
                        <p><strong>d. Giữ gìn môi trường</strong></p>
                        <p style="padding-left:10px">• <strong>EVNHCMC</strong> hoạt động trong lĩnh vực đặc thù là kinh doanh điện năng nên luôn nhận thức được tầm quan trọng của việc bảo vệ môi trường và cam kết tuân thủ các quy định về bảo vệ môi trường.</p>
                        <p style="padding-left:10px">• Mỗi CBCNV luôn ý thức, chủ động giữ gìn công sở, cảnh quan môi trường xanh, sạch, đẹp; cam kết thực hiện nếp sống văn minh nơi cư trú và trong sinh hoạt cộng đồng.</p>
                        <div style="background-color:rgba(225, 225, 225, .7);">
                            <p><strong>e. Quan hệ với đối tác</strong></p>
                            <p style="padding-left:10px">• Quan hệ với đối tác trên cơ sở bình đẳng, hợp tác cùng phát triển, các bên cùng có lợi và tin tưởng lẫn nhau.</p>
                            <p style="padding-left:10px">• Khi tiếp xúc với đối tác trong và ngoài nước, luôn khẳng định vai trò, vị trí của mình, ý thức được trách nhiệm của mỗi cá nhân là đại diện cho EVNHCMC để có thái độ cư xử với đối tác một cách lịch thiệp, văn hóa với nghi thức phù hợp và luôn đúng hẹn.</p>
                            <p style="padding-left:10px">• Khi giải quyết công việc với đối tác trong và ngoài nước, luôn tuân thủ và tôn trọng luật pháp, quy định của EVNHCMC , hiểu được văn hóa của nước bạn để tránh những hiểu lầm không đáng có và để thực thi công việc được giao với hiệu quả cao nhất.</p>                        				    
                        </div>
			        </div>
                </div>
                <div class="panel">
				    <div class="panel-wrapper" style=" background:url(images/bg-vh-evnhcmc.jpg); height:550px; background-size:880px 594px;">
					    <h2 class="title hidden">Nhãn hiệu</h2>					    
					    <p><strong>Nhãn hiệu</strong></p>	                        				        
                        <center><img src="logo/nhanhieu.png" width="90%" /></center>
			        </div>
                </div>
	        </div>		
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" runat="server" ContentPlaceHolderID="FooterContent"> 
    <script>    
    window.jQuery || document.write('<script src="js/jquery.js"><\/script>')</script>	
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>	
	<script type="text/javascript" src="js/magic-slider.js"></script>
	<script type="text/javascript">
	    $().ready(function () {
	        $('#magic-slider-1').magicSlider({ firstPanelToLoad: <%=iPanel%>, autoSlide: true, autoCycle: true, slideDirection: "horizontal", autoSlideStopWhenClicked: true });
	        $('#magic-nav-magic-slider-1').width(940);
	    });
    </script>
</asp:Content>