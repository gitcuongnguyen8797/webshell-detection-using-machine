<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="timkiem.aspx.vb" Inherits="hcmpc.timkiem" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    
    <div id="middle">
		
			<!-- start: tier one -->

			<br>	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
						
					<h1> <%= objNews.m_SectionName%></h1>	
			
	<%
                            If Not objNews.m_More Is Nothing Then
                                If objNews.m_More.Rows.Count > 0 Then
                                    
                                    For Each r As DataRow In objNews.m_More.Rows
                                        %> 	
		
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeading">
					<div style="float: right; white-space: nowrap; display: none;">
												
					</div>

					<a href="dtintuc.aspx?ID=<%=r("Article_ID")%>" class="newsTitle"><%= r("Title")%></a>
				</h2>

				<div class="newsDate secondaryContent">
					<div class="newsMonth heading">Oct</div>
					<div class="newsDay">09</div>
				</div>

				

				<div class="messageContent baseHtml">
					<div class="postedBy">
						<span class="posted"><div class="sticky"></div>Đăng Lúc <%=ToVietDate(r("Create_Date"))%></span>						
					</div>

					<div class="newsText"><div align="center"><a href="dtintuc.aspx?ID=<%=r("Article_ID")%>" class="internalLink">
	
					<img src="<%=r("IntroImage")%>" title="Image" alt="Image" class="bbCodeImage LbImage">
						
				</a></div><div align="center"><i></i></div><div align="center"><br></div> <%=r("IntroText")%></div>
					<div class="clearFix"></div>
				</div>				
			</div>
		</div>
		
		
 <%
                                        Next
                                    
                                End If
                            End If
%>			
		
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
             <a href="?q=<%=textTimKiem %>&page=1" class="text">&lt;&lt;Trang Đầu</a>
                <a href="?q=<%=textTimKiem %>&page=<%=curSelect-1 %>" class="text">&lt;Trang Trước</a>
            <%
            End If
            For i As Integer = startPage To endPage
                If i = curSelect Then%>
                    <a href="?q=<%=textTimKiem %>&page=<%=i%>" class="currentPage"><%=i%></a>    
                    <%
                    Else
                        %>
                        <a href="?q=<%=textTimKiem %>&page=<%=i%>"  rel="start"><%=i%></a>    
                        <%
                    End If
                %>
            
         <%Next%>
		    
        <%-- <a href="?page=<%=numPage%>" class=""><%=numPage%></a>--%>
        <% If curSelect < numPage Then%>                   
            <a href="?q=<%=textTimKiem %>&page=<%=curSelect+1 %>" class="text">Trang Sau &gt;</a>
            <a href="?q=<%=textTimKiem %>&page=<%=numPage%>" class="text">Trang Cuối &gt;&gt;</a>	
        <%End If%>
		
	</nav>	
</div>
</div>
<%End If%>			
</div>	
</div>  
			
			
			
			
			
		
		</div>
       
</asp:Content>