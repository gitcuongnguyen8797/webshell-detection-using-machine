<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casefour.master" CodeBehind="logo.aspx.vb" Inherits="hcmpc.logo" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 <style type="text/css">
        .text,.blue1{ font-size:12px;}
        .cellThanhTich{width:160px;height:80px;float:left;margin:9px;}
        .titleThanhTich{text-align:center;width:160px;}
        .cellThanhTichImage{width:160px;height:80px}
        .groupTitle{margin-bottom:5px;overflow:auto;font-size: 12px;}
      </style> 
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
<br/> 
    <div id="middleTwo"> 
        <div class="sidebar topRightBlocks ">
        <div id="recentNews">
						<div class="section subHeading">
					        <h1>Các Liên Kết</h1>			
                            </div>	

        </div>	
        </div>
           <div class="section sectionMain recentNews" id="2186697">  
                     <div class="primaryContent leftDate" style="border-bottom:none;overflow: auto;">
     


     <% 
         If Not objNews Is Nothing Then
             If objNews.Rows.Count > 0 Then
                 Dim id As Integer = -1
                 Dim title As String = ""
                 Dim index As Integer = 0
                 Dim indexShow As Integer = 1
                 For i As Integer = 1 To 3
                     If i <> id and id<>-1Then
                         continue for
                     End If
                     If i = 1 Then
                         title = indexShow &". Đơn Vị Thành Viên"
                     ElseIf i = 2 Then
                         title = indexShow & ". Đơn Vị Trong Ngành"
                     ElseIf i = 3 Then
                         title = indexShow & ". Thông Tin Cần Biết"
                     End If
                     indexShow+=1
                     %>
                     
                      <div class="groupTitle">    
                      <div>                     
                         <%=title%>        
                         </div>
                         <div>
                         <%
                             For row As Integer = index To objNews.Rows.Count - 1
                                 Dim value As Integer = Integer.Parse(objNews.Rows(row)("type").ToString())
                                 If id <> value And id <> -1 Then
                                      id = value
                                     Exit For
                                 End If
                                 id = value
                                 index += 1
                             %>
                         <div class="cellThanhTich">
                        <a href="<%=objNews.Rows(row)("ClickURL")%>"><img src="<%=objNews.Rows(row)("imageURL")%>" class="cellThanhTichImage" >                       
                                </a>
                            </div>
                    <%
                      Next
                        %>
                        </div>
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
