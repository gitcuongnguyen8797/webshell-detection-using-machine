<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="phapche.aspx.vb" Inherits="hcmpc.phapche" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

<style>




  
</style>



</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    


    <div id="middle">
		
			<!-- start: tier one -->

<div class="sidebar topRightBlocks ">
<div id="recentNews">
				<div class="section subHeading">		
					<h1>CÁC VĂN BẢN VỀ
QUY ĐỊNH – NGHỊ ĐỊNH – THÔNG TƯ – LUẬT ĐIỆN LỰC
</h1>	
			</div>
            </br>


            <table class="bordered">          
    <thead>

    <tr>
        <th width=5px>STT</th>        
        <th width=400px>Văn Bản</th>
        <th width=15>Ngày Phát Hành</th>
    </tr>
    </thead>
    <%
	    If Not objNews Is Nothing Then
	        If objNews.Rows.Count > 0 Then
                                    
                For Each r As DataRow In objNews.Rows
                    Dim stt As Integer = 0
                                        %> 	
    <tr>
        <td colspan=3 style="font-weight:bold"><%= r("Title")%></td>        
    </tr> 
    <% Dim ttData As DataTable = f_DanhSachVanBan(r("vanban_type"))

                
				    If Not ttData Is Nothing Then
                        If ttData.Rows.Count > 0 Then
                For Each tt As DataRow In ttData.Rows
                    stt += 1
                    %> 	
    <tr>
        <td><%=stt%></td> 
        <td > 
            <div>
         <a class="pdf" href="tinebookread.aspx?Loai=pc&ID=<%=tt("VanBan_ID")%>">
                <img src="image/pdficon.png" height="30px">
               <%=tt("Title")%>
            </a>
            </div>
        <%= tt("Description")%>
        </td>
        <td ><%= tt("NgayBanHanh")%></td>
    </tr> 
     <%
                                        Next
                                    
                                End If
                            End If

                                        Next
                                    
                                End If
                            End If
%>

</table>


		


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