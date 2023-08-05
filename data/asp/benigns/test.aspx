<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="test.aspx.vb" Inherits="CDTD.test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .header .logo {
            display: block;
            float: left;
            font-family: "Segoe UI",cursive;
            font-size: 20px;
            font-weight: 500;
            height: 50px;
            line-height: 50px;
            padding: 0 10px;
            text-align: center;
            width: 220px;
        }
        .header .logo .icon {
            margin-right: 10px;
        }
        
        .navbar {            
            margin-bottom: 0;             
        }
        
        .cm-notification-container {
		    min-width: 300px;
		    position: fixed;
		    right: 50px;
		    top: 0;
		    width: 40%;
		    z-index: 800; 
	    }
	    .cm-notification-container-top {
		    top: 10px;
	    }
	    .notification-content {
		    position: relative;
	    }
	    .notification-w, .notification-n, .notification-e {
		    background-position: 16px 12px !important;
		    background-repeat: no-repeat !important;
		    border: 1px solid;
		    border-radius: 6px;
		    font-family: Arial,Helvetica,sans-serif;
		    font-size: 100%;
		    line-height: 15px;
		    margin: 7px 0;
		    opacity: 0.96;
		    padding: 14px 0;
		    position: relative;
		    width: 99.7%;
	    }
	    .notification-w div, .notification-n div, .notification-e div {
		    display: block;
		    padding-left: 50px;
		    padding-right: 20px;
	    }
	    .notification-header-w, .notification-header-n, .notification-header-e {
		    float: left;
		    font: bold 110%/15px Arial,Helvetica,sans-serif;
		    margin: 0 10px 0 0;
		    padding-right: 0 !important;
	    }
	    .notification-w img, .notification-n img, .notification-e img {
		    border: 0 none;
		    outline: 0 none;
	    }
	    .notification-w p, .notification-n p, .notification-e p {
		    color: #8c8531;
		    margin: 0;
	    }
	    .notification-n p {
		    color: #496e16;
	    }
	    .notification-e p {
		    color: #9c3535;
	    }
	    .notification-w .cm-notification-close, .notification-n .cm-notification-close, .notification-e .cm-notification-close {
		    font-size: 50%;
		    position: absolute;
		    right: 5px;
		    top: 5px;
	    }
	    .notification-header-w, .notification-header-n, .notification-header-e {
		    color: #c52a01;
	    }
	    .notification-n {
		    background: #d0eaae url("index2_files/notice.png") repeat scroll 0 0;
		    border-color: #8bc045;
	    }
	    .notification-n div {
		    color: #496e16;
	    }
	    .notification-w {
		    background: #fffbcc url("index2_files/warning.png") repeat scroll 0 0;
		    border-color: #e6db55;
	    }
	    .notification-w div {
		    color: #8c8531;
	    }
	    .notification-e {
		    background: #ffcece url("index2_files/error.png") repeat scroll 0 0;
		    border-color: #df8f8f;
	    }
	    .notification-e div {
		    color: #9c3535;
	    }
	    .notification-header-n {
		    color: #668c34;
	    }
	    .notification-header-w {
		    color: #bfa615;
	    }
	    .header .logo{ width:350px}
    </style> 
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>            
        <script src="js/respond.js"></script>
    <![endif]-->

     <link href="css/css_all.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="gridscroll/gridviewScroll.min.js"></script>
    <link href="gridscroll/GridviewScroll.css" rel="stylesheet" />
   
</head>
<body>
    <form id="form1" runat="server">
    <div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
          <div class="pace-progress-inner"></div>
        </div>
        <div class="pace-activity"></div></div>

                <!-- CONTENT STRUCTURE
                ===================================================================== -->

                <!-- header logo -->
                <header class="header" id="system_header_region"><div><!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="sidebar-toggle navbar-toggle" data-toggle="collapse" data-target="#amione-system-navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="logo">
                    <!-- Add the class icon to your logo image or logo icon to add the margining -->
                    CHẤM ĐIỂM THI ĐUA 
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            
        </nav></div></header>                
                <div class="wrapper row-offcanvas row-offcanvas-left" style="min-height: 961px;">
                    <!-- Contains the navbar and content of the page -->
                    abc
                </div>

                <!-- footer -->
                <footer id="system_footer_region" role="contentinfo" class="bs-docs-footer"><div><p class="col-lg-9">© 2015 Tổng công ty Điện Lực TP.HCM. Mọi bản quyền được bảo lưu.<br>Đường dây nóng: <span>0909 772 742</span></p>
        <p class="col-lg-3" align="right">Một sản phẩm của EVNHCMC IT</p></div></footer>

                <!-- General modal dialog -->
                <div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"></div>

                <!-- LIBRARIES -->        
                <script type="text/javascript" src="./index2_files/templates_vi_min.js"></script>
                <script type="text/javascript" src="./index2_files/app_all.js"></script>
                
    

        

       



       
            <table cellspacing="0" id="GridView1" style="width:100%;border-collapse:collapse;">
		<tr class="GridviewScrollHeader">
			<td colspan="2">Product</td><td rowspan="2">ListPrice</td><td rowspan="2">StandardCost</td><td colspan="2">Package</td><td rowspan="2">SafetyStockLevel</td><td rowspan="2">ReorderPoint</td><td rowspan="2">SellStartDate</td>
		</tr><tr class="GridviewScrollHeader">
			<td>Name</td><td>Number</td><td>Weight</td><td>Size</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">HL Mountain Frame - Black, 38</td><td style="background-color:#EFEFEF;">FR-M94B-38</td><td>1349.6000</td><td>739.0410</td><td>2.68</td><td>38</td><td>500</td><td>375</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">HL Mountain Frame - Silver, 38</td><td style="background-color:#EFEFEF;">FR-M94S-38</td><td>1364.5000</td><td>747.2002</td><td>2.68</td><td>38</td><td>500</td><td>375</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-150 Red, 62</td><td style="background-color:#EFEFEF;">BK-R93R-62</td><td>3578.2700</td><td>2171.2942</td><td>15.00</td><td>62</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-150 Red, 44</td><td style="background-color:#EFEFEF;">BK-R93R-44</td><td>3578.2700</td><td>2171.2942</td><td>13.77</td><td>44</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-150 Red, 48</td><td style="background-color:#EFEFEF;">BK-R93R-48</td><td>3578.2700</td><td>2171.2942</td><td>14.13</td><td>48</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-150 Red, 52</td><td style="background-color:#EFEFEF;">BK-R93R-52</td><td>3578.2700</td><td>2171.2942</td><td>14.42</td><td>52</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-150 Red, 56</td><td style="background-color:#EFEFEF;">BK-R93R-56</td><td>3578.2700</td><td>2171.2942</td><td>14.68</td><td>56</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-450 Red, 58</td><td style="background-color:#EFEFEF;">BK-R68R-58</td><td>1457.9900</td><td>884.7083</td><td>17.79</td><td>58</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-450 Red, 60</td><td style="background-color:#EFEFEF;">BK-R68R-60</td><td>1457.9900</td><td>884.7083</td><td>17.90</td><td>60</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-450 Red, 44</td><td style="background-color:#EFEFEF;">BK-R68R-44</td><td>1457.9900</td><td>884.7083</td><td>16.77</td><td>44</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-450 Red, 48</td><td style="background-color:#EFEFEF;">BK-R68R-48</td><td>1457.9900</td><td>884.7083</td><td>17.13</td><td>48</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-450 Red, 52</td><td style="background-color:#EFEFEF;">BK-R68R-52</td><td>1457.9900</td><td>884.7083</td><td>17.42</td><td>52</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Red, 58</td><td style="background-color:#EFEFEF;">BK-R50R-58</td><td>782.9900</td><td>486.7066</td><td>19.79</td><td>58</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Red, 60</td><td style="background-color:#EFEFEF;">BK-R50R-60</td><td>782.9900</td><td>486.7066</td><td>19.90</td><td>60</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Red, 62</td><td style="background-color:#EFEFEF;">BK-R50R-62</td><td>782.9900</td><td>486.7066</td><td>20.00</td><td>62</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Red, 44</td><td style="background-color:#EFEFEF;">BK-R50R-44</td><td>782.9900</td><td>486.7066</td><td>18.77</td><td>44</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Red, 48</td><td style="background-color:#EFEFEF;">BK-R50R-48</td><td>782.9900</td><td>486.7066</td><td>19.13</td><td>48</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Red, 52</td><td style="background-color:#EFEFEF;">BK-R50R-52</td><td>782.9900</td><td>486.7066</td><td>19.42</td><td>52</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Black, 58</td><td style="background-color:#EFEFEF;">BK-R50B-58</td><td>782.9900</td><td>486.7066</td><td>19.79</td><td>58</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Black, 60</td><td style="background-color:#EFEFEF;">BK-R50B-60</td><td>782.9900</td><td>486.7066</td><td>19.90</td><td>60</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Black, 62</td><td style="background-color:#EFEFEF;">BK-R50B-62</td><td>782.9900</td><td>486.7066</td><td>20.00</td><td>62</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Black, 44</td><td style="background-color:#EFEFEF;">BK-R50B-44</td><td>782.9900</td><td>486.7066</td><td>18.77</td><td>44</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Black, 48</td><td style="background-color:#EFEFEF;">BK-R50B-48</td><td>782.9900</td><td>486.7066</td><td>19.13</td><td>48</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Road-650 Black, 52</td><td style="background-color:#EFEFEF;">BK-R50B-52</td><td>782.9900</td><td>486.7066</td><td>19.42</td><td>52</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Mountain-100 Silver, 38</td><td style="background-color:#EFEFEF;">BK-M82S-38</td><td>3399.9900</td><td>1912.1544</td><td>20.35</td><td>38</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Mountain-100 Silver, 42</td><td style="background-color:#EFEFEF;">BK-M82S-42</td><td>3399.9900</td><td>1912.1544</td><td>20.77</td><td>42</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Mountain-100 Silver, 44</td><td style="background-color:#EFEFEF;">BK-M82S-44</td><td>3399.9900</td><td>1912.1544</td><td>21.13</td><td>44</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Mountain-100 Silver, 48</td><td style="background-color:#EFEFEF;">BK-M82S-48</td><td>3399.9900</td><td>1912.1544</td><td>21.42</td><td>48</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Mountain-100 Black, 38</td><td style="background-color:#EFEFEF;">BK-M82B-38</td><td>3374.9900</td><td>1898.0944</td><td>20.35</td><td>38</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr><tr class="GridviewScrollItem">
			<td style="background-color:#EFEFEF;">Mountain-100 Black, 42</td><td style="background-color:#EFEFEF;">BK-M82B-42</td><td>3374.9900</td><td>1898.0944</td><td>20.77</td><td>42</td><td>100</td><td>75</td><td>7/1/2005 12:00:00 AM</td>
		</tr>
	</table>
    <script type="text/javascript">
        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            gridView1 = $('#GridView1').gridviewScroll({
                width: 600,
                height: 300,
                railcolor: "#F0F0F0",
                barcolor: "#CDCDCD",
                barhovercolor: "#606060",
                bgcolor: "#F0F0F0",
                freezesize: 1,
                arrowsize: 30,
                varrowtopimg: "Images/arrowvt.png",
                varrowbottomimg: "Images/arrowvb.png",
                harrowleftimg: "Images/arrowhl.png",
                harrowrightimg: "Images/arrowhr.png",
                headerrowcount: 2,
                railsize: 16,
                barsize: 8
            });
        }
	</script>
       

    
    </form>
</body>
<link href="css/font-awesome.min.css" rel="stylesheet">
</html>
