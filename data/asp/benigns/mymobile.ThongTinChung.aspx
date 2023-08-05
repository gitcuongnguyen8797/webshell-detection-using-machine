<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mymobile.ThongTinChung.aspx.vb" Inherits="hcmpc.mymobile_ThongTinChung" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="css/mobile.css" type="text/css" media="all" rel="stylesheet" />      
    <style>
        .icon_commend {
            
        }
        .bg_common 
        {
           display:inline-block;
           
           width:14px;
           height:10px;
           
           background: url(http://10.137.4.28/hcmbeta/images/comment.png) no-repeat scroll 0 0 transparent;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container" class="vnePage">
        <div>
            <div id="divHeader">
                <div class="banner_top common_space left">                    
                        <script type="text/javascript" language="JavaScript">                            Poly_ShowTopBanner0();</script>
                </div>
                <div class="divLogo left">
                    <div class="divTopTitle">
                        <div class="left logo_vne">
                            <a href="/" onfocus="this.blur()">
                                <img class="noborder" src="http://10.137.4.28/hcmpc/images/mobile_logo.png" alt="EVNHCMC" /></a></div>
                            <div class="right">                                        <div class="pc left">
                                            <a  onfocus="this.blur()" href="default.aspx?a=&c=&ct=" >
                                                <span></span></a>
                                        </div>
                            <div class="menu left">
                                <a onfocus="this.blur()" href="#bottom-menu" rel="external"><span></span></a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        
            <div class="divContent">
                <div id="main_page_c2">
                    <div id="divHeaderTitle">
                            <div class="div_top_header">
                                <div class="breadcrumb">
                                    <div class="tt left">
                                        <a href="/">Thông tin chung
                                        </a>
                                    </div>
                                    <div class="left">
                                        <!--<img src="G%E1%BA%A7n%2011.000%20t%E1%BB%B7%20%C4%91%E1%BB%93ng%20thi%E1%BB%87t%20h%E1%BA%A1i%20do%20b%C3%A3o%20Wutip_files/bg-arrow.gif" alt="">-->
                                    </div>
                                    <div class="right">
                                        <div class="margin_top_5 left">
                                            <select class="sltCm" id="ddlCategory" name="select-choice-1" onchange=" SelectCategory(this.value) ">
                                                <option selected="selected" value="/xahoi/1001005">Xã hội</option>
                                                <option value="/xahoi/giao-duc/1001108">Giáo dục</option>
                                                <option value="/xahoi/tuyen-sinh/1001159">Tuyển sinh</option>
                                                <option value="/xahoi/nhip-dieu-tre/1001172">Nhịp điệu trẻ</option>
                                                <option value="/xahoi/cau-chuyen-cuoc-song/1001207">Câu chuyện cuộc sống</option>
                                                <option value="/xahoi/du-hoc/1001109">Du học</option>
                                            </select>                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div id="divTopNews">
                        <ul class="list_news_image_100">
						    <li class="end">
							    <div class="main_news">
								<a href="./mymobile.DocTin.aspx" class="block_image_relative ui-link">
									<span class="title_artical"><b>Nâng công suất máy biến áp Trạm 220 kV Mai Động
                                        <span style="font: 11px/20px arial; color: rgb(102, 102, 102);"><span style="display: none;" class="bg_common icon_commend"> </span>&nbsp;<span style="display: none;" class="widget-comment-2891605-1">0</span></span>
                                    </b></span>
									<span class="relative_box image_space_right_10 left">
                                        <img class="noborder" src="http://10.137.4.28/hcmbeta/upload_img/image/Dong%20dien%20tram%20Mai%20dong%202%2011509.JPG" alt="Nâng công suất máy biến áp Trạm 220 kV Mai Động" width="145px">
									</span>									
                                    <span class="lead txt_1_1em">Tổng Công ty Truyền tải điện quốc gia 
                                    (EVNNPTđã đóng điện thành công và đưa vào vận hành an toàn máy biến áp 
                                    110 kV-63 MVA, hoàn thành công trình nâng công suất máy biến áp 110kV-25MVA 
                                    tại Trạm 220kV Mai Động lên 63MVA. Trạm 220 kV Mai Động được nâng công suất. 
                                    Ảnh: VGP/Kim Thái Dự án được thực hiện tại Trạm biến áp 220kV Mai Động thuộc 
                                    địa bàn quận Hoàng Mai, TP. Hà Nội, do Công ty Truyền tải điện 1 quản lý, 
                                    điều hành thực hiện dự án, Công ty Cổ phần Tư vấn Xây dựng Điện 1 tổ chức tư vấn lập dự án. 
                                    Máy biến áp 110 kV-63 MVA được lắp đặt cho dự án này là máy biến áp do 
                                    Công ty cổ phần Thiết bị điện Đông Anh sản xuất..</span>
								</a>
							</div>
						    </li>
					    </ul>						
				    </div> 
                    <div id="box_list_cap2" class="block_tin box_width_common common_space">
                        <div class="content_block_tin">
                            <ul class="list_news_image_100 box_width_common common_space">  
                                <li class>		                            	
					                <a class="block_image_relative ui-link" href="/">
                                        <span class="relative_box image_space_right_10 left">		
                                            <img class="noborder" src="http://10.137.4.28/hcmbeta/upload_img/image/Dong%20dien%20tram%20Mai%20dong%202%2011509.JPG" alt="Đóng điện thành công công trình đường dây 500kV Vĩnh Tân - Sông Mây&nbsp;" width="130px">		                        
								        </span>								    
                                        <h2 class="h2SdTopHome txt_1_5em">Đóng điện thành công công trình đường dây 500kV Vĩnh Tân - Sông Mây&nbsp;</h2>
							        </a>		                                
		                        </li>
                                <li class="end_2">		                            	
					                <a class="block_image_relative ui-link" href="/">
                                        <span class="relative_box image_space_right_10 left">		
                                            <img class="noborder" src="http://10.137.4.28/hcmbeta/upload_img/image/Dong%20dien%20tram%20Mai%20dong%202%2011509.JPG" alt="Sự kiện giờ trái đất 2013: cả nước tiết kiệm được 401.000kWh&nbsp;" width="130px">		                        
								        </span>								    
                                        <h2 class="h2SdTopHome txt_1_5em">Sự kiện giờ trái đất 2013: cả nước tiết kiệm được 401.000kWh&nbsp;</h2>
							        </a>		                                
		                        </li>  
                            </ul>
                            <div class="box_width_common common_space">
                                <a class="right txt_1_1em" href="/" style="color:#333; text-decoration:none;">
                                    <span class="spanContinue left txt_arial">Trang sau</span>
                                    <span class="iconNext left"></span>
                                </a>
                            </div>
                            <div class="clear">  </div>
                         </div>
                    </div>
                </div>
            </div>    
        </div>
        <div id="main_footer">
                <div class="block_btn_bottom_box box_width_common margin_bottom_0">
                    <div class="divbutton txtcenter">
                        <b><a rel="external" class="txt_1_1em txt_link" href="#container">Về đầu trang
                            <img src="images/top-arrow.png" class="img-smallicon"></a> </b>
                    </div>
                </div>
                <div class="txt_coppyright box_width_common common_space margin_bottom_10">
                    <p class="fone_contact">
                        Hotline <span>1900 1122</span> - <span>1900 545454</span> </p>
                </div>
                <div class="divbutton2 left">
                    <a class="txt_link" href="http://hcmpc.vn/customer/lienhe.aspx">Chăm sóc khách hàng</a>
                </div>
                <div class="divbutton2 right">
                    <a class="txt_link" href="http://hcmpc.vn/customer/gioithieu.aspx?id=13">Thông tin EVNHCMC</a>
                </div>
                <div class="txt_coppyright box_width_common common_space">
                    <p class="">
                        &copy; Copyright 2013 EVNHCMC, All rights reserved</p>
                    <p class="">
                        &reg; EVNHCMC giữ bản quyền nội dung trên website này.
                    </p>
                </div>
            </div>
    </div>
    </form>
</body>
</html>
