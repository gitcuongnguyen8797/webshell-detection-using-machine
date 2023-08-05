<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="LeftMenuMaster.master" CodeBehind="grouptintucdl.aspx.vb" Inherits="hcmpc.grouptintucdl" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<%--<%@ Register src="Controls/ucTinNoiBat.ascx" tagname="ucTinNoiBat" tagprefix="uc1" %>


<%@ Register src="Controls/ctlTinNoiBat.ascx" tagname="ctlTinNoiBat" tagprefix="uc2" %>


<%@ Register src="Controls/ctlTopTinNoiBat.ascx" tagname="ctlTopTinNoiBat" tagprefix="uc3" %>--%>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    
    <div id="middle_right">
		
			<!-- start: tier one -->
            <div class="sidebar topRightBlocks ">
<div id="recentNews">


<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeadingLogo">
					<div style="float: right; white-space: nowrap; display: none;">												
					</div>
					<div class="newsTitleLogo"><%=objNews(0)("tenSection") %></div>
				</h2>			
                <%
                    If Not objNews Is Nothing Then
                        If objNews.Rows.Count > 0 Then
                                        %> 	
				<div class="messageContent baseHtml" style="overflow:auto"> 	
                <%
                    Dim tinnum As Integer = 0
                    For Each r As DataRow In objNews.Rows
                        If tinnum = 0 Then
                    %>
                    <div class="hotnews-content">
                            <a class="aHN-img" href="dtintucdl.aspx?menu=<%=menu%>&ID=<%=r("Article_ID")%>">
                            <%
                                Dim introImageLarge As String = r("IntroImage")
                                  If introImageLarge.Trim = "" Then
                                      introImageLarge = "Image\logoevnlarge.png"
                                  End If
                            %>
                                <img width="270" height="200" src="<%=introImageLarge%>">
                             </a>
                            <h1 class="titleHN">
                                <a class="link-topnews" href="dtintucdl.aspx?menu=<%=menu%>&ID=<%=r("Article_ID")%>"><%=r("Title")%></a>                                
                            </h1>

                            <h2 class="h2leadHN">
                               <%=r("IntroText")%>
                            </h2>
                     </div>
                     <% Else%>
                    
                               

                <div style="width:100%;float:left; border-bottom: 2px dashed rgb(215, 237, 252); margin-top:10px">
                <div class="tintucgroup">
                    <a class="thumbnail" href="dtintucdl.aspx?menu=<%=menu%>&ID=<%=r("Article_ID")%>">
                      <%
                          Dim introImage As String = r("IntroImage")
                          If introImage.Trim = "" Then
                              introImage = "Image\logoevn.png"
                          End If
                            %>
							<img style="width: 100px; height: 100px;" src="<%=introImage%>" border="0" height="100" width="100">
						</a>
                        </div>

					<div class="postedBy">
						<span class="posted"><div class="sticky"></div><a style="cursor:pointer" href="dtintucdl.aspx?menu=<%=menu%>&ID=<%=r("Article_ID")%>"><Strong><%=r("Title")%></Strong></a></span>						
                        <div class="newsText"><%=r("IntroText")%></div>
					</div>
                </div>
					 



                          
                                   
                    <%End If%>



					
                <% 
                    tinnum+=1
                Next
                %>
                </div>
                <%
                           End If
                       End If
                           
                               %>	
              	
			</div>
		</div>





</div>	
</div>  

</div>  
			
			
			
			
			
		
     <%-- <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style> --%>
</asp:Content>