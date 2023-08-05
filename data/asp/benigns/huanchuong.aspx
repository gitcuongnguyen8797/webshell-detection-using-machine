﻿<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="casetwo.master" CodeBehind="huanchuong.aspx.vb" Inherits="hcmpc.huanchuong" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<link rel="stylesheet" href="css/boiler_first.css" type="text/css">	
    <style>
        #main-content { width: 960px; margin: 10px auto; padding-top:10px;} 
        *::-moz-placeholder {
            color: #999999;
        }  
        *::-moz-selection {
            background: none repeat scroll 0 0 #ffff9e;
        }
        
        .image_grid {
            overflow: hidden;
            position: relative;
            margin-left:20px;
        }
        ul#list {
            margin: 0;
            padding: 0;
            position: relative;
        }
        .image_grid li {
            color: #686f74;
            cursor: pointer;
            float: left;
            list-style: none outside none;
            overflow: hidden;
            text-align: center;
        }
        .da-thumbs {
            text-align: center;
        }
        .da-thumbs li, .da-thumbs li img {
            display: block;
            position: relative;
        }
        #block-logo{ width:100%;}
        #block-logo .item {
            background: none repeat scroll 0 0 #fff;
            border: 1px solid #b3b3b3;
            height: auto;
            overflow: hidden;
            padding:1px;
        }        
        #block-logo li.sixth {
            height: 250px;
            width:160px
        }
        #block-logo li.sixth:nth-child(6n+1) {
            margin-left: 0;
        }      
        .da-thumbs li, .da-thumbs li img {
            display: block;
            position: relative;
        } 
        .mright{ margin-right:18px;}  
        .clear {
            clear: both;
        }      
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">   
    
    <div id="middle">
		
			<!-- start: tier one -->

			<br>	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
				<div class="section subHeading">		
					<h1><%=Title %></h1>	
			</div>	

         <!--  <iframe src="phapchebook/viewobj.aspx?type=tinphapche" frameborder="0" width="600" height="600"></iframe>
    -->
  
   <!--  <div style="margin-top:5px">     
      <iframe src="readpdf/web/viewer.aspx?id=1" frameborder="0" width="100%" height="600"></iframe>
    </div>
    -->
</div>	
</div>  
		<br />	
		   <div id="block-logo"> 
            <div class="image_grid"> 
                <ul id="list" class="portfolio_list da-thumbs ">
                    <asp:Repeater ID="rptLogo" runat="server">
                        <ItemTemplate>
                             <li class="sixth mright">
                                <div class="item">                                  
                                    <asp:ImageButton ID="btnImg" runat="server" />                                                                                                      
                                </div>
                                <div id="title">                                    
                                    <asp:Label ID="title" runat="server" text="abc"/>   
                                </div>
                            </li>                            
                        </ItemTemplate>
                    </asp:Repeater>
                          
                </ul>          
                
            </div>
            <div class="clear">
            </div>            
        </div>

	
			
			
			
		
		</div>
      <style type="text/css">
     
        .text,.blue1{ font-size:12px;}
      </style> 
</asp:Content>