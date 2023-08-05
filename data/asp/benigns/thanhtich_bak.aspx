<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="thanhtich_bak.aspx.vb" Inherits="hcmpc.thanhtich_bak" %>
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
				<div class="section subHeading">		
					<h1> Thành Tích Đạt Được</h1>	
			</div>
	<%
	    If Not objNews Is Nothing Then
	        If objNews.Rows.Count > 0 Then
                                    
	            For Each r As DataRow In objNews.Rows
                                        %> 	
		
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate" style="overflow: auto;">
				<h2 class="subHeading">
					<div style="float: right; white-space: nowrap; display: none;">
												
					</div>

					<a href="#" class="newsTitle"><%= r("Title")%></a>
				</h2>

				
				

				<div class="messageContent baseHtml">
				

					<% Dim ttData As DataTable = f_DanhSachThanhTich(r("thanhtich_type"))

                
				    If Not ttData Is Nothing Then
                        If ttData.Rows.Count > 0 Then
                            For Each tt As DataRow In ttData.Rows%> 	

					<div class="cellThanhTich">
                        <a href="dtintuc.aspx?ID=<%=tt("Article_ID")%>"><img src="<%=tt("SmallImage")%>" class="cellThanhTichImage" >
                        <div class="titleThanhTich">
                        <%=tt("title") %>
                        </div>
                        </a>
                    </div>

                     <%
                                        Next
                                    
                                End If
                            End If
%>	

				</div>				
			</div>
		</div>
		
		
 <%
                                        Next
                                    
                                End If
                            End If
%>			
		


</div>	
</div>  
			
			
			
			
			
		
		</div>
      <style type="text/css">
        .text,.blue1{ font-size:12px;}
        .cellThanhTich{width:170px;height:auto;float:left;margin-left:10px;margin-right:10px;}
        .titleThanhTich{text-align:center;width:170px;font-size: 14px;}
        .cellThanhTichImage{width:170px;height:ato}
      </style> 
</asp:Content>