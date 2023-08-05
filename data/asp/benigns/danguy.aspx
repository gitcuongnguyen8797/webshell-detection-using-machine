<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseDangUy.master" CodeBehind="danguy.aspx.vb" Inherits="hcmpc.danguy" %>
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

    <script type="text/javascript">
        var validFilesTypes = ["doc", "docx","pdf"];

        function CheckExtension(file) {
            /*global document: false */
            var filePath = file.value;
            var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
            var isValidFile = false;

            for (var i = 0; i < validFilesTypes.length; i++) {
                if (ext == validFilesTypes[i]) {
                    isValidFile = true;
                    break;
                }
            }

            if (!isValidFile) {
                file.value = null;
                alert("Không đúng định dạng file. Chỉ được chọn file :\n\n" + validFilesTypes.join(", "));
            }

            return isValidFile;
        }

        function onPostBack(obj) {
            var y = generateRandomSequence();
            var hdnGuid = document.getElementById("ctl00_MainContent_capchar");
            hdnGuid.value = y;
        }

        function generateRandomSequence() {
            var g = "";
            for (var i = 0; i < 32; i++)
                g += Math.floor(Math.random() * 0xF).toString(0xF)
            return g;
        }

</script>
<script type="text/javascript">
    var validFileSize = 15 * 1024 * 1024;

    function CheckFileSize(file) {
        /*global document: false */
        var fileSize = file.files[0].size;
        var isValidFile = false;
        if (fileSize !== 0 && fileSize <= validFileSize) {
            isValidFile = true;
        }
        else {
            file.value = null;
            alert("File Size Should be Greater than 0 and less than 15 MB.");
        }
        return isValidFile;
    }
</script>
<script type="text/javascript">
    function CheckFile(file) {
        var isValidFile = CheckExtension(file);

        if (isValidFile)
            isValidFile = CheckFileSize(file);

        return isValidFile;
    }
</script>

   <div id="middleTwo">
		
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
                <!--     <iframe src="http://docs.google.com/viewer?url=<%=pathURL%><%=pathFile%>&embedded=true" width="100%" height="650" style="border: none;"></iframe> -->

					<br>
					
					
				</div>
				<br>
			
					<div class="clearFix"></div>
				</div>

				
			</div>
		</div>
	</div>	
</div>  
			
<%--<%If isComment Then%>	--%>	

	<div id="similar_threads" 
    <% If not isComment Then %>
    style="display:none"
    	<%end if %>	
        >
	<div class="section sectionMain widget-container">
		<div class=" widget HCM_ExtendedThreadWidget_WidgetRenderer_ThreadWidget non-sidebar-widget" id="widget-51">
				
					<h4>
						Các góp ý
						
					</h4>
					<br>
					<div class="etw news1">
        <ul>
        <%
            If Not listComment Is Nothing Then
                If listComment.Rows.Count > 0 Then
                    For Each cm As DataRow In listComment.Rows
           %>                              
                                        
          <li>                    
					<div  class="col socialWrapDiv">
					<div class="mediaBar" style="padding-top:5px;padding-bottom:5px">						
                    <div class="comment_ten">                    
                    <%Dim ngay As Date
                        ngay = cm("NgayDang")
                        %>
                    <%=cm("Ten")%> - <span class="comment_time"> <%=ngay.ToString("hh:mm dd/MM/yyyy")%></span>
                    </div>
                    <div class="comment_noidung">
					<%=cm("Title") %>
                    </div>
                    <%If cm("url") <> "" Then%>
                    <div class="comment_dinhkem">
                    Tải file: <a url="<%=cm("url") %>"> <%=cm("TenFile")%></a>
                    </div>
                    <%end if %>
					</div>
					</div>
		</li>
 
			<%
			Next
            End If
			end if
			    %>
			
		
                	
       </ul>
    </div>				
			</div>		
	</div>
    <input name="abc" type="hidden" id="capchar" runat="Server" />
    <div style="margin-bottom:10px;overflow: hidden;">
    <div><input autocomplete="off" type="text" id="hoten" class="gInput" value="Họ Và Tên" onfocus="if(this.value == 'Họ Và Tên'){this.value = '';}" onblur="if(this.value == ''){this.value='Họ Và Tên';}" runat="Server" /><span style="color:Red"> (*)</span></div>
     <div ><input autocomplete="off" type="text" id="email" class="gInput" value="Email" onfocus="if(this.value == 'Email'){this.value = '';}" onblur="if(this.value == ''){this.value='Email';}" runat="Server" /><span style="color:Red"> (*)</span></div>
    <asp:textbox id="noidung" text="Ý kiến của bạn"  onfocus="if(this.value == 'Ý kiến của bạn'){this.value = '';}" onblur="if(this.value == ''){this.value='Ý kiến của bạn';}" name="noidung" align="left" 
                    style="font-size: 14px;color: #666;font-family: Arial,Helvetica,sans-serif;border:solid 1px #DDD;padding: 5px;width: 920px;"
                    class="textarea" runat="Server" Height="74px"
                    TextMode="MultiLine" BorderColor="Gray"/>
      </div>
      Chọn file Upload
       <asp:FileUpload ID="upFileUpload" onchange="return CheckExtension(this);" runat="server" Width="502px" val />
      <%-- <asp:RegularExpressionValidator ID="uplValidator" runat="server"   

  ControlToValidate="upFileUpload" ErrorMessage=".mp3, .mp4 & wma formats are allowed"

 ValidationExpression="(.+\.([Mm][Pp][3])|.+\.([Mm][Pp][4])|.+\.([Ww][Mm][Aa]))">

</asp:RegularExpressionValidator>--%>
       <br /> 

      <div style="margin-bottom:10px;margin-top:10px">
       <asp:Button ID="btnGuiDi" Text="Gửi đi" class="rn_ButtonInput_None" style=" height:27px; width:70px;" runat="server"/>
      </div>
	</div>



<%--<%end if %>--%>

</div>
<style>
.gInput
{
    font-size: 10pt;
    color: rgb(99, 99, 99);
    border: 1px solid rgb(178, 178, 178);
    border-radius: 3px 3px 3px 3px;
    height: 1.8em;
    padding-left: 4px;
    outline: medium none; 
    margin-bottom:5px; 
    width: 200px;
}</style>
</asp:Content>