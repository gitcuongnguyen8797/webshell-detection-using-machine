<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casefour.master" CodeBehind="sitemap.aspx.vb" Inherits="hcmpc.sitemap" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" type="text/css" media="screen, print" href="css/slickmap.css" />
    <style>
        .siteHeader{font-size:18px;}
        .siteSubHeader{font-size:14px;padding-left:15px;font-weight:bold}
        .siteHeaderSecond{margin-top:15px;}
        .siteItem{padding-left:15px;font-size:12px;font-weight:normal}
        
    </style>
	

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
<br/> 
    <div id="middleTwo">  
        <div class="sidebar topRightBlocks ">
        <div id="recentNews">
						<div class="section subHeading">
					        <h1>Sơ đồ web</h1>			
                            </div>	

        </div>	
        </div>
                <br />
	    <div class="magic-slider-wrapper" style=" width:58.4em;">
          
		    <div class="sitemap">		
            

            <%
                          If Not listMainMenu Is Nothing Then
                              If listMainMenu.Rows.Count > 0 Then
                                  Dim index As Integer = 0
                                  For Each tt As DataRow In listMainMenu.Rows
                                 Dim id As Integer = tt("id")
                                 Dim listMainMenuLevel1 As New DataTable
                                 listMainMenuLevel1 = loadMenu(id)
                                  %>
					<div class="siteHeader" style="float:left;width:30%;margin-left:20px">
                    <a class="mm-item-link" href="<%=tt("url") %>"><%=tt("Title") %></a>
						<%
						    If Not listMainMenuLevel1 Is Nothing Then
						        If listMainMenuLevel1.Rows.Count > 0 Then%>
                              <div class="siteSubHeader">
                            <%
                                For Each lv1 As DataRow In listMainMenuLevel1.Rows
                                    Dim idlv1 As Integer = lv1("id")
                                    Dim listMainMenuLevel2 As New DataTable
                                    listMainMenuLevel2 = loadMenu(idlv1)
                                  %>
                                <div>
                                    <%If not lv1("title").ToString().Trim = "AN" Then%>
									<a href="<%=lv1("url") %>"><%=lv1("title")%></a>
                                    <%End if %>

                                    <%
                                        If Not listMainMenuLevel2 Is Nothing Then
                                            If listMainMenuLevel2.Rows.Count > 0 Then
                                                For i = 0 To listMainMenuLevel2.Rows.Count - 1
                                                    %>
									        <div class="siteItem">    <a href="<%=listMainMenuLevel2.Rows(i)("url")%>">»  <%=listMainMenuLevel2.Rows(i)("Title")%> </a></div>
                                              
									<%
									    
									Next
                                End If
                            End If
									%>
                                     </div>
                                     <%
                                     Next
                                        %>
                            </div>
                            <%
                            End If
                        End If
                                %>
                                </div>

                  <%
									    
									    Next
                                    End If
                                    end if
                                        %>  







     <%-- <div style="float:left;width:20%;margin-left:20px">
                                 
                 <div class="siteHeader"> <a href="gioithieu.aspx">Giới thiệu</a> </div>
                <div class="siteItem">
             <a href="gioithieu.aspx?tab=1">  » Tổng quan</a> <br />
             <a href="gioithieu.aspx?tab=2">  » Quá trình đầu tư</a> <br />
             <a href="gioithieu.aspx?tab=3">  » Lĩnh vực hoạt động</a> <br />
             <a href="thanhtich.aspx">  » Các thành tích đạt được</a> <br />          
           <a href="gioithieu.aspx?tab=8">   » Thông tin chung</a> <br />
           <a href="chinhsachchatluong.aspx">   » Chính sách chất lượng</a> <br />           
             <a href="gioithieu.aspx?tab=4">    » Sơ đồ tổ chức</a> <br />
            <a href="gioithieu.aspx?tab=7">    » Sơ đồ lưới điện</a> <br />

            </div>

		        <div class="siteHeader siteHeaderSecond"> <a href="logo.aspx"> Liên kết </a></div>

              </div>     --%>




            

	        </div>


	       
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" runat="server" ContentPlaceHolderID="FooterContent">   

</asp:Content>


