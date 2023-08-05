<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/casetwo.master" CodeBehind="lichghidien.aspx.vb" Inherits="hcmpc.lichghidien" %>

<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>

<%@ Register assembly="JustGrid" namespace="JustGrid" tagprefix="jGrid" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="magictabs_iuluaf6q" class="magictabs_style_lightblue_rounded">
    <div id="middle">
		
			    <!-- start: tier one -->

	
    <div class="sidebar topRightBlocks ">
        <div id="recentNews">
	        <div class="section subHeading">		
				    <h1> Lịch Ghi Và Thu Tiền Điện</h1>	
		    </div>
		    <div class="section sectionMain recentNews" id="Div3">
			    <div class="primaryContent leftDate">
				    <h2 class="subHeading">
					    DANH SÁCH LỊCH GHI VÀ THU TIỀN ĐIỆN                    					
				    </h2>
                
                     <center>    
                    <asp:GridView ID="JustGrid1" Width="90%" runat="server">
                    </asp:GridView>
                    <style type="text/css">
                    #<%=JustGrid1.ClientID%> td{ text-align:center; padding:3px;}
                    </style>
                      
                    </center>







                    <div align="right"></div>
                    </br>

               </div>
	       </div>
					
        </div>
        <div class="clearFix"></div>
				
    </div>
</div>		
    
    <style type="text/css">
       
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
        
      </style> 


</asp:Content>
