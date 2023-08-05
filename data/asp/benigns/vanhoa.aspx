<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="vanhoa.aspx.vb" Inherits="hcmpc.vanhoa" %>

<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <base target="_parent" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <script src="js/slide-tto.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <style type="text/css" media="screen">
        html,body{ margin:0; padding:0; font-family:Arial,Helvetica,sans-serif;background:transparent;}
        .infiniteCarousel { width: 937px; position: relative;}
        .infiniteCarousel .wrapper {width: 937px; overflow:auto; height: 230px; margin: 0; padding:0; top:0; position: absolute; }
        .infiniteCarousel .wrapper ul {width: 937px; height:230px; list-style-image:none; list-style-position:outside; list-style-type:none; position: absolute; margin:0; padding:0; top: 0;}
        .infiniteCarousel .wrapper ul li {width:234px; height:230px; display:block; float:left;}
        .infiniteCarousel .wrapper ul li div{width:210px; float:left; padding-left:15px;}
        .infiniteCarousel .wrapper ul li p
        {
            line-height:90%;
            line-height:120%\9;  
            margin:0; 
            padding:0;
        }
        .infiniteCarousel .arrow { display: block; height:34px; width: 19px; background: url(js/arrow-tto-home.png) no-repeat 0 0; text-indent: -999px; position: absolute; top: 108px; cursor: pointer; outline: 0;}
        .infiniteCarousel .forward { background-position: 0 0; right: 8px;}
        .infiniteCarousel .back { background-position: 0 -72px; left: 892px;}
        .infiniteCarousel .forward:hover { background-position: 0 -35px;}
        .infiniteCarousel .back:hover { background-position: 0 -107px; }
        a.small{font-size:11px; color:#555; text-decoration:none;}
	    a.small:hover{ font-size:11px;color:#9E0B0F; text-decoration:none;}	
	    img{ border:none;}	
        </style>

         <div class="infiniteCarousel">
            <div class="wrapper">
                <ul>	

                <%
                    If Not dtVanHoaInfo Is Nothing Then
                        If dtVanHoaInfo.Rows.Count > 0 Then
                                    
                            For Each r As DataRow In dtVanHoaInfo.Rows
                                        %> 
                                         <li>
                        <div>
                            <p>
                            <a href="dtintuc.aspx?ID=<%=r("Article_ID")%>" class="small">
                            <img src="<%=r("HinhAnh")%>" width="116" height="116" style="padding-right:10px; float:left;" />
                            <b><%= r("Title")%></a></p>
                        </div>
                    </li>
                                        <%
                                        Next
                                    
                                End If
                            End If
%>
                </ul>
            </div>    
        </div>
    </form>
</body>
</html>
