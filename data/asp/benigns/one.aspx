<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="caseone.master" CodeBehind="one.aspx.vb" Inherits="hcmpc.one" %>
<%@ Register src="Controls/ctlTinTheoSection2.ascx" tagname="ctlTinTheoSection2" tagprefix="uc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .DateIcon .IconLogo {
	        background: url("images/ico-small-logo.jpg") no-repeat scroll left top transparent;
            float: right;
            height: 45px;
            margin-right: 18px;
            width: 43px;
	    }
	    
	    .Wrapper .TitleBlock {
            background: none;
            clear: both;
            color: #666666;
            font-family: 'UVNGiayTrangBold';
            font-size: 2.4em;
            line-height: 28px;
            margin: 0;
            padding: 0 0 0 5px;
            text-transform: uppercase;            
        }
    </style>
    <ul id="tabs_0">
        <li><a href="#" name="tab1_0">Tin nổi bật</a></li>
        <li><a href="#" name="tab2_0">Xem nhiều nhất</a></li>
    </ul>            
    <div id="content_0"> 
        <div id="tab1_0">
            <asp:PlaceHolder ID="ucTinNoiBat" runat="server"></asp:PlaceHolder>
        </div>
        <div id="tab2_0">
            <asp:PlaceHolder ID="ucTinXemNhieu" runat="server"></asp:PlaceHolder>
        </div>
    </div>
    <div class="clear h10"></div>                
    <div style="width:660px; height:90px; border:solid 1px #DDD; background-color:#FFF;"> 
        <span style="font-size:80px; color:#9e0b0f; font-weight:bold; font-family:'Times New Roman',arial,serif; line-height:100%; padding-left:30px; padding-top:3px; float:left">09</span>
        <span style="font-size:18px; color:#1F83D7; width:520px; line-height:130%; float:left; padding-left:10px; padding-top:20px;">Hãy tắt tất cả các thiết bị điện và rút phích cắm ra khỏi ổ điện, không để các thiết bị điện ở chế độ chờ khi sử dụng</span>
    </div>
            
    

    <div class="h10"></div>                

    

    <div class="Content">


    <uc1:ctlTinTheoSection2 ID="ctlTinTheoSection21" runat="server" />

    <div style=" display:none">
    
        <div class="ContentLeft" style="padding-right:2px;">
            <div class="Wrapper">	
                <p class="TitleBlock">Tin tổng công ty điện lực</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>                    
            <div class="ContentLeft">
            <div class="Wrapper">	
                <p class="TitleBlock">Tin trong ngành điện</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="clear h10"></div>
            <div class="ContentLeft" style="padding-right:2px">
            <div class="Wrapper">	
                <p class="TitleBlock">Tin vắn khắp nơi</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="ContentLeft">
            <div class="Wrapper">	
                <p class="TitleBlock">Tin tức đoàn thể</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="clear h10"></div>
            <div class="ContentLeft" style="padding-right:2px">
            <div class="Wrapper">	
                <p class="TitleBlock">Học tập tấm gương đạo đức Hồ Chí Minh</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="ContentLeft">
            <div class="Wrapper">	
                <p class="TitleBlock">An toàn điện & tiết kiệm điện</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="clear h10"></div>
            <div class="ContentLeft">
            <div class="Wrapper">	
                <p class="TitleBlock">Văn hóa EVN HCMC</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="ContentLeft">
            <div class="Wrapper">	
                <p class="TitleBlock">Điểm báo và phản hồi</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>
            <div class="clear h10"></div>
            <div class="ContentLeft">
            <div class="Wrapper">	
                <p class="TitleBlock">Đặc san kỹ thuật - CNTT</p>	
                <div class="Block01">		
                    <div class="Blocktop01"></div>		
                    <div class="BlockContent01 HeightContent">
                        <a href="#" class="TitleBlockRight">EVN HCMC: Đảm bảo cung cấp điện an toàn, liên tục cho các doanh nghiệp</a> <span class="jxtcdate">(28-05-2013 12:23) </span>
                        <p class="TxtInfo">Sáng ngày 9/5/2013, Tổng công ty Điện lực TP.HCM (EVN HCMC) phối hợp với Ban Quản lý các Khu chế xuất, Khu công nghiệp Thành phố Hồ Chí Minh (HEPZA) đã tổ chức Hội nghị Doanh nghiệp...</p>
<a href="#" class="ViewMore">Xem tiếp ...</a>
                        <div class="AbBottom">
                            <ul class="ListNewBellow">
                                <li><a href="#">EVNHCMC: Hội nghị công tác tư vấn các công trình điện (28-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổ chức Hội nghị khách hàng (16-05-2013) </a></li>
                                <li><a href="#">EVN HCMC: Tổng kết thực hiện thí điểm Hóa đơn điện tử (05-05-2013) </a></li>
                                <li><a href="#">Tổng kết công tác chỉnh trang dây thông tin năm 2012 (15-03-2013) </a></li>
                            </ul>
                            <div class="DateIcon">
                                <p class="Date"><a href="#" class="Date1">Xem thêm</a></p>
                                <p class="IconLogo"></p>
                            </div>
                         	</div>
                       	</div>
                </div>
            </div>
            </div>


    </div>

        </div>
    <div class="clear h10"></div> 
</asp:Content>
