<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="clip.aspx.vb" MasterPageFile="casefour.master" Inherits="hcmpc.clip" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="js/jwplayer.js" type="text/javascript"></script>
    <style>
        #video{ width:580px; height:422px; background-color:#ebebeb; padding-top:20px;}  
        #middleTwo p{ font-size:14px;}
       
        .xt2 {
            color: #1F83D7;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
        }
        .anh {
            float: left;
            padding-right: 16px;
            width: 165px;
        }
        .anh img {
            height: 120px;
            width: 165px;
        }
        .anh p {
            padding-top: 5px;
        }
        #ext p{ font-size:13px;}
        .title2 {
            color: #555555;
            font-size: 12px;
            font-weight: bold;
            text-decoration: none;
        }
        .title2:hover {
            color: #F7941D;
            text-decoration: none;
        }
        .clear {
            clear: both;
        }  
       
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div id="middleTwo">
<div class="phanhoiMiddleAuto">
        <div class="sidebar topRightBlocks ">
        <div id="recentNews">
						<div class="section subHeading">
					        <h1>VIDEO CLIP</h1>			
                            </div>	

        </div>	
        </div><br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    	<tr>
    		<td style="width:35%;"></td>
            <td style="width:65%;"></td>
    	</tr>
        <tr>
    		<td valign="top" style="padding:0px 10px;" id="dd">
                <p style=" font-size:14px; color:#9E0B0F; font-weight:bold;"><%=psAnhInfo.m_Title%></p>
                <p style=" font-size:11px; color:#959595"><%=psAnhInfo.m_Create_Date%></p>
                <p style=" font-weight:bold; padding-top:15px;"><%=psAnhInfo.m_IntroText%></p>
                <p style=" padding-top:15px;"><%=psAnhInfo.m_FullText%></p>
                <p style=" padding-top:15px; padding-right:15px; font-weight:bold" align="right"><%=psAnhInfo.m_Author%></p>
            </td>
            <td>
                <div style="padding-bottom:10px;">
                   
                    <div id="video"><center>
                        <div id="thePlayer"></div></center>
	                    <script type="text/javascript">
	                        jwplayer("thePlayer").setup({
	                            flashplayer: "wplayer.swf",
	                            file: "<%=psAnhInfo.m_Images.Rows(0)("AnhLon").ToString%>", image: "<%=psAnhInfo.m_Images.Rows(0)("AnhNho").ToString%>", height: 400, width: 540, allowfullscreen: "true", allowscriptaccess: "always",
	                            controlbar: "bottom", loop: "false", showdigits: 'true', backcolor: 'FFFFFF', frontcolor: '555555',
	                            lightcolor: '555555', screencolor: '2A2A2A', quality: 'high', volume: '100', shownavigation: 'true',
	                            autostart: 'false', bufferlength: '1', mute: 'false', wmode: "transparent"
	                        });
                        </script>                         
                    </div>    
                </div>
            </td>
    	</tr>
        <Tr>
            <Td id="ext" colspan="2" style=" padding:20px 5px 30px 15px">
                <!--<div class="anh">
                     <a href="#" class="title2"><img src="images/psanh/t1.jpg">
                     <p>“Thủ phủ” Thành phố mang tên Bác lung linh đón Tết</p></a>
                </div>
                <div class="anh">
                    <a href="#" class="title2"><img src="images/psanh/t2.jpg">
                     <p>“Thủ phủ” Thành phố mang tên Bác lung linh đón Tết</p></a>
                </div>
                <div class="anh">
                    <a href="#" class="title2"><img src="images/psanh/t3.jpg">
                     <p>“Thủ phủ” Thành phố mang tên Bác lung linh đón Tết</p></a>
                </div>
                <div class="anh">
                    <a href="#" class="title2"><img src="images/psanh/t4.jpg">
                     <p>“Thủ phủ” Thành phố mang tên Bác lung linh đón Tết</p></a>
                </div>
                <div class="anh" style="padding-right:0px;">
                    <a href="#" class="title2"><img src="images/psanh/t5.jpg">
                     <p>“Thủ phủ” Thành phố mang tên Bác lung linh đón Tết</p></a>
                </div>-->
                <%=ps_CacTinKhac%>
                <div class="clear" style="height:30px"></div>                
                <div style="border-bottom:solid 1px #DDD; width:800px; float:left; margin-top:8px;"></div>            
                <a href="tinvideo.aspx?ID=<%=psAnhInfo.Type_ID%>" class="xt2" style="padding-left:15px; float:left; *margin-top:-7px;">XEM TẤT CẢ</a>
                <div class="clear"></div>
            </Td>
        </Tr>
    </table>
    </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" runat="server" ContentPlaceHolderID="FooterContent">
</asp:Content>