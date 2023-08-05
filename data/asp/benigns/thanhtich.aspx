<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="thanhtich.aspx.vb" Inherits="hcmpc.thanhtich" %>
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
					<h1> Thành Tích Đạt Được</h1>	
			</div>
	<%
	    If Not objNews Is Nothing Then
	        If objNews.Rows.Count > 0 Then %>
                     <div class="section sectionMain recentNews" id="2186697">  
                     <div class="primaryContent leftDate" style="overflow: auto;">             
	            <%
	                Dim oldGroup As Integer = -1
	                Dim canClose As Boolean = False
	                For Each r As DataRow In objNews.Rows
	                    canClose = True
	                    If r("GroupBy") <> oldGroup Then
	                        If oldGroup <> -1 Then
	                            %>
                                 </tr>
		                        </table>	
		                        </div>
                                <%
	                        End If
	                        oldGroup = r("GroupBy")
	                    %> 
		<div class="lineRow">
			<table width="100%"><tr>
            <%End If%>
					<% Dim ttData As DataTable = f_DanhSachThanhTich(r("thanhtich_type"))

                
				    If Not ttData Is Nothing Then
                        If ttData.Rows.Count > 0 Then
                            For Each tt As DataRow In ttData.Rows%> 	
                            <td align="center">
					<div class="cellThanhTich">
                        <a href="dtintuc.aspx?ID=<%=tt("Article_ID")%>"><img src="<%=tt("SmallImage")%>" class="cellThanhTichImage" >
                        <div class="titleThanhTich">
                        <%=tt("title") %>
                        </div>
                        </a>
                    </div>
                    </td>
                     <%
                                        Next
                                    
                                End If
                            End If
%>	
           
		
		
 <%
 Next
 If canClose Then%>
      </tr>
		</table>	
		</div>
 <%End If
 %>
                                        </div>
                                        </div>
                                        <%
                                    
                                End If
                            End If
%>			
		


</div>	
</div>  
			
			
			
			
			
		
		</div>
      <style type="text/css">
        .text,.blue1{ font-size:12px;}
        .cellThanhTich{width:160px;height:auto;margin-left:10px;margin-right:10px;margin-top:20px}
        .titleThanhTich{text-align:center;width:160px;font-size: 12px;}
        .cellThanhTichImage{width:50%;height:auto;}
        .lineRow{width:100%;float:left;}
    
      </style> 
</asp:Content>