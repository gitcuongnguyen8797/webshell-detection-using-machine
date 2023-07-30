<%@ Page Language="C#" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User.Include.AutoUpload" Codebehind="AutoUpload.aspx.cs" %>
<%@ Import Namespace="Kesion.Publics" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../../ks_inc/jquery.js"></script>
    <script src="../../ks_inc/kesion.common.js"></script>
    <style>
  *{margin:0;padding:0;word-wrap:break-word;}
body{font:12px/1.75 "宋体", arial, sans-serif,'DejaVu Sans','Lucida Grande',Tahoma,'Hiragino Sans GB',STHeiti,SimSun,sans-serif;color:#444; overflow:hidden}
a{text-decoration:none;color:#2C2C2C}
a:hover{text-decoration:underline;color:#F60;}
h3,h4,h5,h6{font-size:12px; margin:0; padding:0; font-weight:100;}
h2{font-size:20px;}
h3{font-size:14px; font-weight:600; padding-left:15px;}
a img{border:none;} 
div,ul,li,p,form{padding: 0px; margin: 0px;list-style-type: none;}
em{font-style: normal;font-weight: normal;}
table {padding: 0px; margin: 0px;list-style-type: none;}
dt,dl,dd {padding: 0px; margin: 0px;list-style-type: none;}      
/*添加图片*/
.imagebox{height:100%;}
.imagebox #uploadImg{overflow:hidden; position:absolute; cursor:pointer; width:100%; height:100%; top:10px; left:0 }
.imagebox .file{ cursor:pointer;position:absolute; z-index:100; width:100%; height:100%;opacity:0;filter:alpha(opacity=0); top:0; left:0;}
.imagebox .upbutton{background:#E2E2E2 url(../../sysimg/default/addpic.png) no-repeat center;width:50px;height:50px;border:none;cursor:pointer}
.imagebox .upshow li{float:left;width:55px;}
.imagebox .upshow li img{width:49px;height:49px;border:1px solid #ccc;}
.tips{ color:#B1B1B1}
/**/
    </style>
</head>
<body>

     <!--上传图片-->
     <iframe name="_hideframe" style="display:none;"></iframe>
       <div class="imagebox">
		 <script type="text/javascript">
		     function doSubmit(obj) { parent.doSubmit();$("#UpFileForm").submit(); }
         </script>
              <form name="UpFileForm" id="UpFileForm" method="post" enctype="multipart/form-data" action="autoUpload.Aspx" target="_hideframe">
                <span id="uploadImg">          
                  <input type="file" onchange="doSubmit(this)" size="1" name="File1" class='file'/>        
                  <input name="ChannelID" value="<%=channelId %>" type="hidden"/>          
                  <input name="fun" value="<%=fun %>" type="hidden"/>          
                  <input name="action" value="upload" type="hidden"/>          
                  <input type="button" id="BtnSubmit" name="Submit" class="upbutton" value="" />
                </span>
              </form>
    </div>
	<!--上传图片结束-->


</body>
</html>
