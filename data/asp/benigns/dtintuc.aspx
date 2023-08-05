<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseTCT.master" CodeBehind="dtintuc.aspx.vb" Inherits="hcmpc.dtintuc" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


<div id="middle">
		
			<!-- start: tier one -->

	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
	<div class="section subHeading">		
					<h1> <%= objNews.m_SectionName%></h1>	
			</div>
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeading">
					

					<%=objNews.m_Title%>
				</h2>

				<div class="newsDate secondaryContent">
					<div class="newsMonth heading">Oct</div>
					<div class="newsDay">09</div>
				</div>

				

				<div class="messageContent baseHtml">
					<div class="postedBy gDate">
						<span class="posted gDate"><div class="sticky"></div><%=objNews.m_Create_Date%></span>
					</div>

					<div class="newsText" align="left" >
					<b><%=objNews.m_IntroText%>
									</b>
					<br>
					
					
				</div>
				<br>
				<div align="left">
                <%=objNews.m_FullText%>
                <br />
                 <%If objNews.m_Urls <> "" Then
                         Dim url As String = Request.Url.AbsoluteUri
                         Dim pathURL As String = url.Substring(0, url.LastIndexOf("/"))
                         %>
                 <div>
         <a class="pdf" href="<%=pathURL%><%=objNews.m_Urls%>">
                <img src="image/pdficon.png" height="30px">
                <%If objNews.m_metaDescription <> "" Then%>
               <%=objNews.m_metaDescription %>
               <% Else%>
               Download
               <% End If%>
            </a>
            </div>
            <%End If%>
                <div align="right" style="font-size:12px">
                <%If objNews.m_TacGiaText <> "" Then%>
                Đưa tin:<%=objNews.m_TacGiaText%>
               <%End If%>
               <%If objNews.m_TacGiaAnh <> "" Then%>
                /Ảnh: <%=objNews.m_TacGiaAnh%>
                <%End If%>
               
</div>
        <div align="left" >
       <table>
       <tr style="font-size:13px">
       <td width="20">Số lần xem:
       <%=objNews.m_numClick%>
       &nbsp;In bài
        <a target="_blank" href="print.aspx?id=<%=objNews.m_Article_ID%>"><img style="vertical-align: middle;" src="image/print.png" /></a></td>
       </tr>
       </table>
          
        </div>
				</div>
					<div class="clearFix"></div>
				</div>

				
			</div>
		</div>
	</div>	
</div>  
			
		

	<div id="similar_threads">
	<div class="section sectionMain widget-container">
		<div class=" widget HCM_ExtendedThreadWidget_WidgetRenderer_ThreadWidget non-sidebar-widget" id="widget-51">
				
					<h4 style="font-size:14px">
						Các tin khác
						
					</h4>
					<br>
					<div class="etw news1">
        <ul>

        <%
                            If Not objNews.m_More Is Nothing Then
                                If objNews.m_More.Rows.Count > 0 Then
                                    
                                    For Each r As DataRow In objNews.m_More.Rows
                                        %> 
                                        
                                        
          <li>
					<div  class="col socialWrapDiv">
					<div class="mediaBar">
						<a class="thumbnail" href="dtintuc.aspx?ID=<%=r("Article_ID")%>">
                         <%
                          Dim introImage As String = r("IntroImage")
                          If introImage.Trim = "" Then
                              introImage = "Image\logoevn.png"
                          End If
                            %>
							<img style="width: 64px; height: 64px;" src="<%=introImage%>" border="0" height="64" width="64">
						</a>
					<a href="dtintuc.aspx?ID=<%=r("Article_ID")%>" class="copy" indepth="true">
						<%= r("Title")%>
					</a>
					
					</div>
					</div>
		</li>
            	
		<%
                                        Next
                                    End If
                            End If
              %>
			
			
		
                	
       </ul>
    </div>				
			</div>		
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
</asp:Content>
