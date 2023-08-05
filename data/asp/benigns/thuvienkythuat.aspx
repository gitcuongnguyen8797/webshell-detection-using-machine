<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="thuvienkythuat.aspx.vb" Inherits="hcmpc.thuvienkythuat" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

<style>




  
</style>



</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    


    <div id="middle">
		
			 <div class="sidebar topRightBlocks ">
        <div id="recentNews">
						<div class="section subHeading">
					        <h1>THƯ VIỆN KỸ THUẬT</h1>			
                            </div>	

        </div>	
        </div>
                  <div class="section sectionMain recentNews" id="2186697">  
                     <div class="primaryContent leftDate" style="border-bottom:none;overflow: hidden;">
	    <div class="magic-slider-wrapper" style=" width:58.4em;">
          
		    <div class="sitemap">		
		      
          
               <div style="float:left;width:40%;margin-left:20px">
                <%
                    Dim list As String() = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"}
                    If Not listDanhMuc Is Nothing Then
                        If listDanhMuc.Rows.Count > 0 Then
                            Dim index As Integer = 1
                            For Each tt As DataRow In listDanhMuc.Rows
                                Dim idParent As Integer = tt("id")
                            %>
                            <br />
                       <div class="siteSubHeader">						
                        <%=index%>. 
                        <%If tt("hasChild") = 0 Then%>
                        <a href="thuvienkythuatchitiet.aspx?ID=<%=tt("id")%>">
                        <%end if %>
                        <%=tt("Ten")%> 
                         <%If tt("hasChild") = 0 Then%>
                        </a>
                             <%end if %> 
                            <% index += 1
                                If Not listDanhMucItem Is Nothing Then
                                    If listDanhMucItem.Rows.Count > 0 Then
                                        %>
                                        <div class="siteItem"  style="padding-left:20px">
                                        <%
                                            Dim indexItem As Integer = 0
                                            For i = 0 To listDanhMucItem.Rows.Count - 1
                                                If idParent <> listDanhMucItem.Rows(i)("ParentID") Then
                                                    Continue For
                                                End If
                                            %>
									<%=list(indexItem)%>. <a href="thuvienkythuatchitiet.aspx?ID=<%=listDanhMucItem.Rows(i)("id")%>"><%=listDanhMucItem.Rows(i)("Ten")%></a><br />
                                                 
							<%
							    indexItem += 1
							Next
							%>
                            </div>   					
                            <%
                            End If
                            end if
                                %>
                                   
                                  
						</div>
                        <%
                            next
                        End If
                    End If
                            %>


               
              
               </div>
         

	        </div>


	       </div>
           </div>


        </div>
			
			
			
			
			
		
		</div>
      <style type="text/css">
        .text,.blue1{ font-size:12px;}
        .cellThanhTich{width:170px;height:210px;float:left;margin-left:10px;margin-right:10px;}
        .titleThanhTich{text-align:center;width:170px;}
        .cellThanhTichImage{width:170px;height:170px}
      </style> 
</asp:Content>