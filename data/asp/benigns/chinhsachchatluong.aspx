<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casefour.master" CodeBehind="chinhsachchatluong.aspx.vb" Inherits="hcmpc.chinhsachchatluong" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 <style type="text/css">
        .text,.blue1{ font-size:12px;}
        .cellChinhSach{width:100%;margin:auto;}
        .titleChinhSach{text-align:center;width:100%;}
        .cellChinhSachImage{width:100%;}        
      </style> 
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
<br/> 
    <div id="middleTwo"> 
        <div class="sidebar topRightBlocks ">
        <div id="recentNews">
						<div class="section subHeading">
					        <h1>CHÍNH SÁCH CHẤT LƯỢNG</h1>			
                            </div>	

        </div>	
        </div>
           <div class="section sectionMain recentNews" id="2186697">  
                     <div class="primaryContent leftDate" style="border-bottom:none;overflow: auto;">
     

              <% 
                 If Not objNews Is Nothing Then
                     If objNews.Rows.Count > 0 Then
                         For row As Integer = 0 To objNews.Rows.Count - 1
                     
                                     %>
                                 <div class="cellChinhSach">
                                <a href="<%=objNews.Rows(row)("ClickURL")%>">
                                <%--<img src="<%=objNews.Rows(row)("imageURL")%>" class="cellThanhTichImage" >                       --%>
                                      <img src="<%=objNews.Rows(row)("imageURL")%>" class="cellChinhSachImage" > 
                                        </a>
                                    </div>
                   <div class="titleChinhSach">
                   <%=objNews.Rows(row)("Description")%>
                   </div>
                       
                               <br />
                         <%
                         Next
                             end if
                 End If
                    
                     %> 	
    
                    
					 </div>
                       </div>

        
    </div>
</asp:Content>
<asp:Content ID="FooterContent" runat="server" ContentPlaceHolderID="FooterContent">   
    
</asp:Content>
