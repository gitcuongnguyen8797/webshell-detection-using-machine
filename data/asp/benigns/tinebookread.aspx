<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseTCT.master" CodeBehind="tinebookread.aspx.vb" Inherits="hcmpc.tinebookread" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    
<%--    <div id="middle">
		
			<!-- start: tier one -->

			<br>	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
				<div class="section subHeading">		
					<h1><%=titleRead%></h1>	
			</div>	

          <div style="margin-top:5px">
       <!-- <iframe id="adv_53fe9b7a04620" class="adv-frame" src="phapchebook/bantin012013.pdf" allowtransparency="true" frameborder="0" height="600" width="100%"></iframe> -->
        <iframe src="readpdf/web/viewer.aspx?path=<%=pathFile%>" frameborder="0" width="100%" height="600"></iframe>
    </div>
    
    
</div>	
</div>  
	</div>--%>


   <div id="middle">
		
			<!-- start: tier one -->

	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
	<div class="section subHeading">		
					<h1><%=titleRead%></h1>	
			</div>
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeading">
					<%=titleLesson%>
				</h2>

				<div class="newsDate secondaryContent">
					<div class="newsMonth heading">Oct</div>
					<div class="newsDay">09</div>
				</div>

				

				<div class="messageContent baseHtml">
					<div class="postedBy gDate">
						<span class="posted gDate"><div class="sticky"></div><%=datePost%></span>
					</div>

					<div class="newsText" align="left" >
                     <iframe src="readpdf/web/viewer.aspx?path=<%=pathFile%>" frameborder="0" width="100%" height="750"></iframe>
                     <%--<iframe src="http://docs.google.com/viewer?url=<%=pathURL%><%=pathFile%>&embedded=true" width="100%" height="650" style="border: none;"></iframe>--%>
         
					<br>
					
					
				</div>
				<br>
			
					<div class="clearFix"></div>
				</div>

				
			</div>
		</div>
	</div>	
</div>  
			
		

<%--	<div id="similar_threads">
	<div class="section sectionMain widget-container">
		<div class=" widget HCM_ExtendedThreadWidget_WidgetRenderer_ThreadWidget non-sidebar-widget" id="widget-51">
				
					<h4>
						Các tin khác
						
					</h4>
					<br>
					<div class="etw news1">
        <ul>


                                        
                                        
          <li>
					<div  class="col socialWrapDiv">
					<div class="mediaBar">
						<a class="thumbnail" href="dtintuc.aspx?ID=d">
							<img style="width: 64px; height: 64px;" src="cc" border="0" height="64" width="64">
						</a>
					<a href="dtintuc.aspx?ID=bb" class="copy" indepth="true">
					aaa
					</a>
					
					</div>
					</div>
		</li>
 
			
			
		
                	
       </ul>
    </div>				
			</div>		
	</div>
	</div>--%>

</div>

</asp:Content>