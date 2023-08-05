<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="LeftMenuMaster.master" CodeBehind="vanbanhuongdandl.aspx.vb" Inherits="hcmpc.vanbanhuongdandl" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


<div id="middle_right">
		
			<!-- start: tier one -->

	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
				<div class="section subHeading">		
					<h1>VĂN BẢN HƯỚNG DẪN
</h1>	
			</div>
            </br>


            <table class="bordered">          
    <thead>

    <tr>
        <th width=5px>STT</th>        
        <th width=400px>Văn Bản</th>
        <th width=15>Ngày Phát Hành</th>
    </tr>
    </thead>
    <%
	    If Not objNews Is Nothing Then
	        If objNews.Rows.Count > 0 Then
                                    
                For Each r As DataRow In objNews.Rows
                    Dim stt As Integer = 0
                                        %> 	
    <tr>
        <td colspan=3 style="font-weight:bold"><%= r("Title")%></td>        
    </tr> 
    <% Dim ttData As DataTable = f_DanhSachVanBan(r("vanban_type"))

                
				    If Not ttData Is Nothing Then
                        If ttData.Rows.Count > 0 Then
                For Each tt As DataRow In ttData.Rows
                    stt += 1
                    %> 	
    <tr>
        <td><%=stt%></td> 
        <td > 
            <div>
         <a class="pdf" href="tinebookread.aspx?Loai=pc&ID=<%=tt("VanBan_ID")%>">
                <img src="image/pdficon.png" height="30px">
               <%=tt("Title")%>
            </a>
            </div>
        <%= tt("Description")%>
        </td>
        <td ><%= tt("NgayBanHanh")%></td>
    </tr> 
     <%
                                        Next
                                    
                                End If
                            End If

                                        Next
                                    
                                End If
                            End If
%>

</table>


		


</div>	
</div>  





</div>


<%--<div style="padding-left:30px; padding-right:30px; padding-top:30px; width:600px;">
        <p class="head1" style=" text-transform: uppercase;"><img src="logo/elogo.png" style=" padding-right:6px;"><%= objNews.m_SectionName%><uc1:ctlPSAnhDisplay 
                
        </p>
        <div style="border-top:solid 1px #DDD; padding-top:20px;">            
            <p class="tngay2" align="right"><%=objNews.m_Create_Date%></p>
            <p class="head2"><%=objNews.m_Title%></p>
            <div class="ttext"><br />
                <b><%=objNews.m_IntroText%></b>
                <%=objNews.m_FullText%>
            </div>
            <div class="clear" style="padding:5px"></div>
        </div>        
        <div style=" background-color:#f16623; height:5px; margin-top:30px;"></div>
        <p style=" font-size:18px;font-weight:bold;color:#1F83D7; padding-top:10px; padding-bottom:20px;">CÁC TIN KHÁC</p>
         <p style=" padding-left:10px;">
             <ul id="tinkhac">

              <%
                            If Not objNews.m_More Is Nothing Then
                                If objNews.m_More.Rows.Count > 0 Then
                                    
                                    For Each r As DataRow In objNews.m_More.Rows
                                        %> 
                                        <li><a href="dtintuc.aspx?ID=<%=r("Article_ID")%>"><%= r("Title")%></a> <span>(<%= ToVietDate(r("Create_Date"))%>)</span></li>
                                        <%
                                        Next
                                    End If
                            End If
              %>
            </ul>
        </p>
        <a href="#" class="xt" style="padding-top:3px">Xem tiếp</a>
        <div class="clear"></div>
        <br />
    </div> --%>
   <%-- <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
        .newsText{text-align:justify;}
      </style> --%>  


      <style type="text/css">
        .text,.blue1{ font-size:12px;}
        .cellThanhTich{width:170px;height:210px;float:left;margin-left:10px;margin-right:10px;}
        .titleThanhTich{text-align:center;width:170px;}
        .cellThanhTichImage{width:170px;height:170px}
      </style> 
</asp:Content>
