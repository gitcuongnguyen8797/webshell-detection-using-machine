<%@ Page Title="Trang Tin Tổng công ty Điện lực TP.HCM" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/mMain.Master" CodeBehind="mdefault.aspx.vb" Inherits="hcmpc.mdefault" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="content" data-role="content">
  <div class="middle">
    
           <a class="image" href="">
                <img width="100%" src="<%=objTinNoiBat.m_IntroImage%>">
           </a>
           <div class="titleImage">
                <a  href="mdetail.aspx?ID=<%=objTinNoiBat.m_Article_ID %>"><%=objTinNoiBat.m_Title%></a>                                
            </div>

            <div class="titleIntro">
                <%=objTinNoiBat.m_IntroText%>
            </div>



            <%
                If Not objTinNoiBat.m_More Is Nothing Then
                    If objTinNoiBat.m_More.Rows.Count > 0 Then
                        For Each r As DataRow In objTinNoiBat.m_More.Rows
                        %>
            <div  class="groupSmall">
					<div class="mediaBar">
                    <div class="thumbnail">
						<a  href="dtintuc.aspx?ID=<%=r("Article_ID")%>">
							<img src="<%=r("IntroImage")%>" border="0">
						</a>
                        </div>
                        <div class="Intro">
					<a href="dtintuc.aspx?ID=<%=r("Article_ID")%>" class="subTitle">
						<%= r("Title")%>
					</a>
                    <div class="titleIntro"><%=r("IntroText")%></div>
                    </div>                        
					
					</div>
					</div>

                        <%                            
                        Next
                        End If
                    End If
                            %>

 <!-- FOR GROUP -->
 <%
	    If Not objNews Is Nothing Then
	        If objNews.Rows.Count > 0 Then
	            Dim idGroup As Integer = -99
	            Dim needClose As Boolean = False
	            Dim count As Integer = 0
	            Dim countDV As Integer = 0
	            For Each r As DataRow In objNews.Rows
	                count += 1
	               
	                    
	                countDV += 1
	                If Integer.Parse(r("Section_ID")) = idGroup Then
	                    If countDV > 2 Then
	                        If count = objNews.Rows.Count Then%>
                            </div>
                                    <%--<a style="float:right" href="tintuc.aspx?ID=<%=idGroup%>" class="text">Xem Thêm</a>--%>
					                    <div class="clearFix"></div>
                                         </div>
		                            </div>
                                <%end if 
                                    Continue For
                                End If
                        Else
                            countDV = 0
                            End If
                            If Integer.Parse(r("Section_ID")) <> idGroup Then
                                If idGroup <> -99 Then%>
                                       <%-- <a style="float:right" href="tintuc.aspx?ID=<%=idGroup%>" class="text">Xem Thêm</a>--%>
					<div class="clearFix"></div>
                    <br />
                </div>
		</div>
        <%End If
            %>
		<div class="section">
			<div class="primaryContent">
				<h2 class="subHeadingLogo">
					<div style="float: right; white-space: nowrap; display: none;">
												
					</div>
					<div class="newsTitleLogo"><%= r("SessonTitle")%></div>
				</h2>
                 
        
           
            <%
                    idGroup = r("Section_ID")
            
                End If%>
				<div class="groupSmall" style="overflow:hidden">
                <div class="mediaBar">
                    <a class="thumbnail" href="dtintuc.aspx?ID=<%=r("Article_ID")%>">
							<img src="<%=r("IntroImage")%>" border="0" >
						</a>
                        </div>
					<div class="postedBy">
						<span class="subTitle"><a style="cursor:pointer" href="dtintuc.aspx?ID=<%=r("Article_ID")%>"><Strong><%=r("ArticleTitle")%></Strong></a></span>						
                        <div class="titleIntro"><%=r("IntroText")%></div>
					</div>


					 <% If count = objNews.Rows.Count Then%>
                       </div>
                      <%--  <a style="float:right" href="tintuc.aspx?ID=<%=idGroup%>" class="text">Xem Thêm</a>--%>
                        
					<div class="clearFix"></div>
                    </br>
                    <%end if %>
				</div>		
           <% If count=objNews.Rows.Count Then		%>
			</div>
		</div>
        <%
           
        End If%>
		
		
 <%
                                        Next
                                    
                                End If
                            End If
%>			

 <!-- END GROUP -->
         
    </div>


        </div>


</asp:Content>
