<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print.aspx.vb" Inherits="print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link rel="stylesheet" type="text/css" href="css/index.css" media="all">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size:13px;margin-top:10px;">            
     <%--  <div style="overflow: auto;padding-bottom: 3px;clear:both; border-bottom:solid 2px #013f9d;">
            <div style="float:left;width:100%">
                <img alt="" src="Image/logohcmc2.png" style="float:left;" />
             </div>
             <div>
             <div style="font-size:12px;float:left;margin-left: 55px;" >             
                 <b style="color:#013f9d">TRANG TIN ĐIỆN TỬ TỔNG HỢP - EVN<span style="font-style:italic;color:Red">HCMC</span></b>
             </div>
            <div style="float:right;">
                Địa chỉ: 35 Tôn Đức Thắng, Phường Bến Nghé, Quận 1, TP.HCM <br />
                Điện thoại: <span style="color:#013f9d">(84.8) 2220.1177 - 2220.1188 - 2220.1199</span> Fax:<span style="color:#013f9d"> (84.8) 2220.1155 - 2220.1166</span> <br />
                Website: <a target="_blank" href="http://www.hcmpc.com.vn" style="color:#013f9d">www.hcmpc.com.vn</a> ; Email: <a target="_blank" href="mailto:dienluc@hcmpc.com.vn" style="color:#013f9d">dienluc@hcmpc.com.vn </a><br />
                
                </div>
                </div>
             
        </div>  --%>  
        <div style="overflow: auto;padding-bottom: 3px;clear:both; border-bottom:solid 2px #013f9d;">
            <div style="float:left;">
                <div>
                <img alt="" src="Image/logohcmc2.png" style="float:left;" />
                </div>
                 <div style="font-size:12px;float:left;margin-left: 55px;width:260px" >             
                 <b style="color:#013f9d">TRANG TIN ĐIỆN TỬ TỔNG HỢP - EVN<span style="font-style:italic;color:Red">HCMC</span></b>
                 </div>
             </div>
             <div>
              <div style="float:right;margin-top: 22px;">
                Địa chỉ: 35 Tôn Đức Thắng, Phường Bến Nghé, Quận 1, TP.HCM <br />
                Điện thoại: <span style="color:#013f9d">(84.8) 2220.1177 - 2220.1188 - 2220.1199</span> <br />
                Fax:<span style="color:#013f9d"> (84.8) 2220.1155 - 2220.1166</span> <br />
                Website: <a target="_blank" href="http://www.hcmpc.com.vn" style="color:#013f9d">www.hcmpc.com.vn</a> ; Email: <a target="_blank" href="mailto:dienluc@hcmpc.com.vn" style="color:#013f9d">dienluc@hcmpc.com.vn </a><br />
                
                </div>
            
           
                </div>
             
        </div>      
        
    <div style="height:5px;clear:both;">
    
    </div>
       	<div style="float:right; padding:0px 10px 0px 0px; width:100px; text-align:right;">
                <a href="" onclick="window.print()" class="print-title">
                    <img alt="" src="image/print.png" style="border:0; vertical-align:middle;" />&nbsp;In trang
                </a>
            </div>	        
    <table border="0" width="100%">
				<tr>
					
					<td align=left ><br><div style="font-size:18px"><%=objNews.m_Title%></div></td>
					
				</tr>
                <tr>
					
					<td align=left ><br><div style="font-size:12px"><%=objNews.m_Create_Date%></div></td>
					
				</tr>
                
				<tr>
				
					<td  align="left">
							<br /><b><%=objNews.m_IntroText%>
									</b></td>
				
				</tr>
				<tr>
					
					<td align=left >				
        			    <%=objNews.m_FullText%>
    		        
	                    </td>
					
				</tr>
				<tr>
					
					<td align=right >				
        			   <div align="right" style="font-size:12px">
                <%If objNews.m_TacGiaText <> "" Then%>
                Đưa tin:<%=objNews.m_TacGiaText%>
               <%End If%>
               <%If objNews.m_TacGiaAnh <> "" Then%>
                /Ảnh: <%=objNews.m_TacGiaAnh%>
                <%End If%>
               
</div></td>
					
				</tr>
			</table>
			
    <div style="height:50px; border-top:solid 1px #ccc; clear:both;">
            <div style="float:left; width:600px;">
                <p style="padding:10px 20px 0px 0px; margin:0; font-family:Arial; font-size:12px; color:#666;">
                    Bản quyền &copy; EVNHCMC
                </p>
            </div>

        </div>
        			
    </div>
    </form>
</body>
</html>
