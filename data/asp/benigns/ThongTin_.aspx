<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThongTin.aspx.cs" Inherits="Web_LichSinhHoat.ThongTin" %>

<!DOCTYPE html>
 <meta http-equiv="Refresh" content="180; url=hoatdong.aspx" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <script type="text/javascript" src="http://10.137.4.26/lichsinhhoat2/scripts/jquery.min.js"></script>
    <script type="text/javascript" src="http://10.137.4.26/lichsinhhoat2/scripts/jquery-1.4.1.min.js"></script>
    
    
     <link rel="stylesheet" href="http://10.137.4.26/lichsinhhoat2/css/responsiveslides.css">
      
    <script type="text/javascript" src="http://10.137.4.26/lichsinhhoat2/scripts/responsiveslides.min.js"></script>

    <script type="text/javascript">//<![CDATA[


        $(window).load(function () {
            //var div = $('div');
            // Slideshow 1
            $("#slider1").responsiveSlides({
                maxwidth: 1880,
                timeout: 20000,
                pager: false
            });

           
            

            
            window.onload = startticker;



        });  //]]>  
      </script>

    <style type="text/css">
        .style4 {
            width: 100%;
        }

        .style5 {
            width: 174px;
        }

        .footer {
            position: fixed;
            bottom: 10px;
            color: #4e5766;
            padding: 8px 0px 0px 0px;
            margin: 0px auto;
            text-align: LEFT;
            line-height: normal;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <div>
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: x-large; vertical-align: middle; text-align: center">
                <table class="style4">
                    <tr>
                        <td class="style5" rowspan="3" width="20%">
                            <asp:Image ID="Image1" runat="server" Height="85px" ImageUrl="~/evnlogo.jpg" />
                        </td>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 32px; font-weight: bold; color: #0000FF; vertical-align: middle; text-align: center;">CÔNG TY CÔNG NGHỆ THÔNG TIN
                        </td>
                    </tr>                    

                    <tr>
                        <div id="wrapper" style="height: 100%; left: 0; position: absolute; text-align: center; width: 100%; display: table">
                            <div style="display: table-row">
                                <div style="display: table-cell; vertical-align: middle;">
                                    <div style="text-align: left; display: inline-block;">
                                        <ul class="rslides" id="slider1">
                                            <li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT1.jpg" style="height:1000px; " alt=""></li>
                                            <li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT2.jpg" style="height:1000px; " alt=""></li>
                                            <li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT3.jpg" style="height:1000px; " alt=""></li>
												<li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT4.jpg" style="height:1000px;  " alt=""></li>
												<li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT5.jpg" style="height:1000px; " alt=""></li>
												<li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT6.jpg" style="height:1000px;  " alt=""></li>
												<li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT7.jpg" style="height:1000px;  " alt=""></li>
												<li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT8.jpg" style="height:1000px;  " alt=""></li>
												<li>
                                                <img src="ThongTinTuyenTruyen/2016_03_TT/TT9.jpg" style="height:1000px;  " alt=""></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>




                        </div>

                    </tr>
                </table>
            </p>

        </div>
    </form>

    <div class="footer">
        <table id="table2" style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px;
            border-top-style: none; padding-top: 0px; border-right-style: none; border-left-style: none;
            border-bottom-style: none;" bordercolor="#808080" width="100%" border="1">
            <tbody>
                <tr>
                    <td style="border-top-width: 0pt; border-left-width: 0pt; border-bottom-width: 0pt;
                        border-right-width: 0pt;">
                        <table id="table3" cellpadding="2" width="100%" border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt; font-family: arial;"><span style="color: #0066cc;"><strong>
                                            CÔNG TY CÔNG NGHỆ THÔNG TIN ÐIỆN LỰC THÀNH PHỐ HỒ CHÍ MINH</strong></span><br>
                                            138 Trần Huy Liệu, Phường 15, Quận Phú Nhuận, Thành phố Hồ Chí Minh.<br>
                                            Ðiện thoại: <span style="color: #0066cc;">(84.8) 2211.0285&nbsp;&nbsp;
                                            </span></span></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
