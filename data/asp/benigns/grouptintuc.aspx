<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseTCT.master" CodeBehind="grouptintuc.aspx.vb" Inherits="hcmpc.grouptintuc" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<%@ Register src="Controls/ucTinNoiBat.ascx" tagname="ucTinNoiBat" tagprefix="uc1" %>


<%@ Register src="Controls/ctlTinNoiBat.ascx" tagname="ctlTinNoiBat" tagprefix="uc2" %>


<%@ Register src="Controls/ctlTopTinNoiBat.ascx" tagname="ctlTopTinNoiBat" tagprefix="uc3" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    
    <div id="middle">
		
			<!-- start: tier one -->


			

	
<div class="sidebar topRightBlocks ">
<div id="recentNews">				
<uc3:ctlTopTinNoiBat ID="ctlTopTinNoiBat" runat="server" />
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
                                    <a style="float:right" href="tintuc.aspx?ID=<%=idGroup%>" class="text">Xem thêm</a>
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
                                        <a style="float:right" href="tintuc.aspx?ID=<%=idGroup%>" class="text">Xem thêm</a>
					<div class="clearFix"></div>
                    <br />
                </div>
		</div>
        <%End If
            %>
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeadingLogo">
					<div style="float: right; white-space: nowrap; display: none;">
												
					</div>
					<div class="newsTitleLogo"><%= r("SessonTitle")%></div>
				</h2>
                 
        
           
            <%
                    idGroup = r("Section_ID")
            
                End If%>
				<div class="messageContent baseHtml" style="overflow:hidden">
                <div class="tintucgroup">
                    <a class="thumbnail" href="dtintuc.aspx?ID=<%=r("Article_ID")%>">
                    <%
                            Dim introImage As String = r("IntroImage")
                            If introImage.Trim = "" Then
                                introImage = "Image\logoevn.png"
                            End If
                            %>
							<img style="width: 64px; height: 64px;" src="<%=introImage%>" border="0" height="64" width="64">
						</a>
                        </div>
					<div class="postedBy">
						<span class="posted"><div class="sticky"></div><a style="cursor:pointer" href="dtintuc.aspx?ID=<%=r("Article_ID")%>"><Strong><%=r("ArticleTitle")%></Strong></a></span>						
                        <div class="newsText"><%=r("IntroText")%></div>
					</div>


					 <% If count = objNews.Rows.Count Then%>
                       </div>
                        <a style="float:right" href="tintuc.aspx?ID=<%=idGroup%>" class="text">Xem thêm</a>
                        
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


</div>	
</div>  
			
			
			
			
			
		
     <%-- <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style> --%>
</asp:Content>