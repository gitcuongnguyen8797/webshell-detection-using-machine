<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mLichCatDien.aspx.vb" Inherits="hcmpc.mLichCatDien" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/indexTT.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_title_block_tin">
	<a href="#" class="title_block_tin">
		<span class="pLinkObj">
			Lịch Tạm Ngưng Cung Cấp Điện
		</span>
        <span class="arrow"></span>
	</a>
    </div>

    <div id="recentNews">
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
                        <a style="float:right" href="../m/mLichCatDien.aspx" class="text">Xem tất cả</a>
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
 

</asp:Content>
