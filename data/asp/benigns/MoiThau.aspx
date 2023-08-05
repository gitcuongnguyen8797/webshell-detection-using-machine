<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casefour.master" CodeBehind="MoiThau.aspx.vb" Inherits="hcmpc.MoiThau" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   







    <div id="middleTwo">
		
			<!-- start: tier one -->

<div class="sidebar topRightBlocks ">
<div id="recentNews">
				<div class="section subHeading">		
					<h1><%=tittleMoiThau %>
</h1>	
			</div>
            <%If Not sID <= 0 Then%>
            <div class="section sectionMain recentNews" id="2186697">  
                     <div class="primaryContent leftDate" style="border-bottom:none;overflow: auto;">
                     <%End If%>
      <%If sID <= 0 Then%>
	    <table class="bordered" style="margin-top:20px">
        <tr ><th width=150>Dự án</th><th width=300>Nội dung gói thầu</th><th width=80>Hình thức chọn thầu</th><th width=100>Đơn vị mời thầu</th><th width=100>Thời gian <br /> phát hành HSMT</th></tr>
        <% 
            If Not objNews Is Nothing Then
                For Each r As DataRow In objNews.Rows%>
        <tr style="cursor:pointer" onclick="document.location = '?page=<%=curPage%>&ID=<%=r(0)%>'"><td><%=r(1)%></td><td><%=r(2)%></td><td><%=r(3)%></td><td><%=r(4)%></td><td><%=r(5)%></td></tr>
        <%           
        Next
         End if
        %>
        </table>
        
    <%Else%>
    <table class="nonbordered">
        <%--<tr><th>Tên Dự Án</th><th>Nội Dung Gói Thầu</th></tr>--%>
        <% For i As Integer=0 to objNews.Columns.Count-1%>
        <tr><th width="30%"><%=objNews.Columns(i).ColumnName%></th><td><div style="padding-bottom:20px;padding-left:20px"><%=objNews.Rows(0).Item(i)%></div></td></tr>
        <%next%>
        </table>
<%End If%>


		<%If Not sID <= 0 Then%>
        </div>
        </div>
        <%End If%>

</div>	 
			
			













    
<% If sID<=0 then
    If numPage > 0 Then%>	
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
             <a href="?page=1" class="text">&lt;&lt;Trang Đầu</a>
                <a href="?page=<%=curSelect-1 %>" class="text">&lt;Trang Trước</a>
            <%
            End If
            For i As Integer = startPage To endPage
                If i = curSelect Then%>
                    <a href="?page=<%=i%>" class="currentPage"><%=i%></a>    
                    <%
                    Else
                        %>
                        <a href="?page=<%=i%>"  rel="start"><%=i%></a>    
                        <%
                    End If
                %>
            
         <%Next%>
		    
        <%-- <a href="?page=<%=numPage%>" class=""><%=numPage%></a>--%>
        <% If curSelect < numPage Then%>                   
            <a href="?page=<%=curSelect+1 %>" class="text">Trang Sau &gt;</a>
            <a href="?page=<%=numPage%>" class="text">Trang Cuối &gt;&gt;</a>	
        <%End If%>
		
	</nav>	
</div>
</div>	
<%End If
Else 'Cho Quay lai
    %>
    <div class="section sectionMain">
    <div class="PageNav" >
	<nav>
    <a href="MoiThau.aspx?page=<%=curPage%>" class="text">Quay Lại</a>	
    </nav>
    </div>
    </div>
<%End If
    %>	

			
			
			</div>
			
			
		
		
			
			
		
		</div>
     <%-- <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style> --%>
</asp:Content>