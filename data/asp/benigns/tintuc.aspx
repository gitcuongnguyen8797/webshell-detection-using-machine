<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseTCT.master" CodeBehind="tintuc.aspx.vb" Inherits="hcmpc.tintuc" %>
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


<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeadingLogo">
					<div style="float: right; white-space: nowrap; display: none;">												
					</div>
					<div class="newsTitleLogo"><%= objNews.m_SectionName%></div>
				</h2>			
                <%
                            If Not objNews.m_More Is Nothing Then
                        If objNews.m_More.Rows.Count > 0 Then
                                        %> 	
				<div class="messageContent baseHtml" style="overflow:auto"> 	
                <%
                    Dim tinnum As Integer = 0
                    For Each r As DataRow In objNews.m_More.Rows
                        If tinnum = 0 Then
                    %>
                    <div class="hotnews-content">
                            <a class="aHN-img" href="dtintuc.aspx?ID=<%=r("Article_ID")%>">
                            <%
                                Dim introImageLarge As String = r("IntroImage")
                                  If introImageLarge.Trim = "" Then
                                      introImageLarge = "Image\logoevnlarge.png"
                                  End If
                            %>
                                <img width="270" height="200" src="<%=introImageLarge%>">
                             </a>
                            <h1 class="titleHN">
                                <a class="link-topnews" href="dtintuc.aspx?ID=<%=r("Article_ID")%>"><%=r("Title")%></a>                                
                            </h1>

                            <h2 class="h2leadHN">
                               <%=r("IntroText")%>
                            </h2>
                     </div>
                     <% Else%>
                    
                               

                <div style="width:100%;float:left; border-bottom: 2px dashed rgb(215, 237, 252); margin-top:10px">
                <div class="tintucgroup">
                    <a class="thumbnail" href="dtintuc.aspx?ID=<%=r("Article_ID")%>">
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
						<span class="posted"><div class="sticky"></div><a style="cursor:pointer" href="dtintuc.aspx?ID=<%=r("Article_ID")%>"><Strong><%=r("Title")%></Strong></a></span>						
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





		
<% If numPage > 0 Then%>	
<div class="section sectionMain">
<div class="PageNav" data-page="1" data-range="2" data-start="2" data-end="6" data-last="680" data-sentinel="{{sentinel}}" data-baseurl="?page=%7B%7Bsentinel%7D%7D">
	<span class="pageNavHeader">Trang <%=curPage%>/<%=numPage%></span>
	<nav>   
        <% 
            Dim startPage As Integer = startPage
            Dim curSelect As Integer = curPage
            Dim endPage As Integer = startPage - 1 + pageShow
            Dim half As Integer = Int(pageShow / 2)
            startPage = curSelect - half
            
            If startPage < 1 Then
                startPage = 1
            End If
            endPage = startPage + pageShow-1
            If endPage > numPage Then
                endPage = numPage
            End If
            If endPage = numPage Then
                startPage = numPage - pageShow + 1
                If startPage < 1 Then
                    startPage = 1
                End If
            End If
            %>
             
             <% If curSelect > 1 Then%>                   
             <a href="?ID=<%=sID%>&page=1" class="text">&lt;&lt;Trang Đầu</a>
                <a href="?ID=<%=sID%>&page=<%=curSelect-1 %>" class="text">&lt;Trang Trước</a>
            <%
            End If
            For i As Integer = startPage To endPage
                If i = curSelect Then%>
                    <a href="?ID=<%=sID%>&page=<%=i%>" class="currentPage"><%=i%></a>    
                    <%
                    Else
                        %>
                        <a href="?ID=<%=sID%>&page=<%=i%>"  rel="start"><%=i%></a>    
                        <%
                    End If
                %>
            
         <%Next%>
		    
        <%-- <a href="?page=<%=numPage%>" class=""><%=numPage%></a>--%>
        <% If curSelect < numPage Then%>                   
            <a href="?ID=<%=sID%>&page=<%=curSelect+1 %>" class="text">Trang Sau &gt;</a>
            <a href="?ID=<%=sID%>&page=<%=numPage%>" class="text">Trang Cuối &gt;&gt;</a>	
        <%End If%>
		
	</nav>	
</div>
</div>	
<%End If%>	


</div>	
</div>  
			
			
			
			
			
		
		</div>
      <style type="text/css">

        .text,.blue1{ font-size:12px;}
      </style> 
</asp:Content>