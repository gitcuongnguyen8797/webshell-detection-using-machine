<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="LichCatDien.aspx.vb" Inherits="hcmpc.LichCatDien" %>
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
					<h1> Lịch Tạm Ngưng Cung Cấp Điện</h1>	
			</div>
	<%
	    If Not objNews Is Nothing Then
	        If objNews.Rows.Count > 0 Then
	            Dim idGroup As Integer = -99
	            Dim needClose As Boolean = False
	            Dim count As Integer = 0
	            Dim countDV As Integer = 0
	            For Each r As DataRow In objNews.Rows
	                count += 1
	                If sID < 0 Then
	                    
	                    countDV += 1
	                    If Integer.Parse(r("DonVi_ID")) = idGroup Then
	                        If countDV > 2 Then
	                            If count = objNews.Rows.Count Then%>
                                    <a style="float:right" href="?ID=<%=idGroup%>" class="text">Xem thêm</a>
					                    <div class="clearFix"></div>
                                         </div>
		                            </div>
                                <%end if 
                                    Continue For
                                End If
                        Else
                            countDV = 0
                            End If
                        End If
            If Integer.Parse(r("DonVi_ID")) <> idGroup Then
                            If idGroup <> -99 and sID<0 Then%>
                                        <a style="float:right" href="?ID=<%=idGroup%>" class="text">Xem thêm</a>
					<div class="clearFix"></div>
                    <br />
                </div>
		</div>
        <%End If
            %>
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeading">
					<div style="float: right; white-space: nowrap; display: none;">
												
					</div>
					<div class="newsTitle"><%= r("TenDonVi")%></div>
				</h2>
                 
        
           
            <%
                    idGroup = r("DonVi_ID")
            
                End If%>
				<div class="messageContent baseHtml">
					<div class="postedBy">
						<span class="posted"><div class="sticky"></div><a style="cursor:pointer" href="<%=r("FileName")%>"><Strong><%=r("Title")%></Strong></a></span>						
                        <div class="newsText"><%=r("IntroText")%></div>
					</div>


					 <% If count = objNews.Rows.Count Then
                        if sID<0 then%>
                        <a style="float:right" href="?ID=<%=idGroup%>" class="text">Xem thêm</a>
                        <%else %>
                        <a style="float:right" href="lichcatdien.aspx" class="text">Xem tất cả</a>
                        <%end if %>
					<div class="clearFix"></div>
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
			
			
			
	
   <% If numPage > 0 And sID >= 0 Then%>	
<div class="section sectionMain" style="margin-top: -7px;">
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
     <%-- <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style> --%>
</asp:Content>