<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="tincongdoan.aspx.vb" Inherits="hcmpc.tincongdoan" %>
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
					<h1>Bản tin Công Đoàn</h1>	
			</div>	

          <div style="margin-top:5px">
       <!-- <iframe id="adv_53fe9b7a04620" class="adv-frame" src="phapchebook/bantin012013.pdf" allowtransparency="true" frameborder="0" height="600" width="100%"></iframe> -->
        <iframe src="readpdf/web/viewer.aspx?id=1" frameborder="0" width="100%" height="600"></iframe>
    </div>
    
    
</div>	
</div>  
			
			
			
			
			
		
		</div>
      <style type="text/css">
        <!--.subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}-->
        .text,.blue1{ font-size:12px;}
      </style> 
</asp:Content>