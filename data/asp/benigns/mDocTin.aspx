<%@ Page Title="Tin Tổng công ty Điện lực TP.HCM" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mDocTin.aspx.vb" Inherits="hcmpc.mDocTin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="css/mobile.css" type="text/css" media="all" rel="stylesheet" />      
    <style type="text/css">
        .bg_common 
        {
           display:inline-block;
           
           width:14px;
           height:10px;
           
           background: url(http://10.137.4.28/hcmbeta/images/comment.png) no-repeat scroll 0 0 transparent;
        }
    </style>
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="container" class="vnePage">
        <div>
            <div class="divContent">
                <div id="main_page_c2">
                    <div id="divHeaderTitle">
                        <div class="div_top_header">
                            <div class="breadcrumb">
                                <div class="tt left">
                                    <a href="default.aspx">
                                        <% If objNews.m_Section_ID = 1 Then%>Tin Tổng công ty Điện lực TP.HCM
                                        <% Else%>An Toàn Điện
                                        <% End If%>
                                    </a>
                                </div>
                                <div class="left">
                                    <img src="images/bg-arrow.gif" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="box_chitiet" class="block_tin box_width_common common_space">
                        <div class="content_block_tin">
                            <div class="title_news common_space">
                            <h1 class="h1Detail"><%= objNews.m_Title%></h1>
                        </div>
                        </div>
                        <div class="art_time left"><%=objNews.m_Create_Date %></div>
                        <h2 class="short_intro box_width_common common_space fontSizeCss">
                            <b class="fck_lead"><%= objNews.m_IntroText %></b></h2>
                        <div class="fck_detail pNormalD fontSizeCss left">
                            <table class="tplCaption" align="center" border="0" cellpadding="3" cellspacing="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="center">
                                            <img alt="<%= objNews.m_IntroImage %>" data-natural-width="300" src="<%= "."+objNews.m_IntroImage %>">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="text-align: justify;"><%= objNews.m_FullText %></div>
                        </div>                        
                        <div class="block_btn_bottom_box box_width_common">
                            <div class="lbl_on">
                                <p class="txt_1_3em txt_arial" style="padding:7px 0px; font-weight:bold;
                                    color:#0066CC;">Tin khác</p>
                            </div>
                            <asp:ListView ID="lvwTinKhac" runat="server">
                                <LayoutTemplate>
                                    <div class="box_width_common common_space">
                                        <ul class="ul-othernews common_space" 
                                            style="display:block;">
                                            <li id="ItemPlaceholder" runat="server"></li>
                                        </ul>
                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li class="li-topStory li_bgdot_bottom">
                                        <h3 class="h3Title">
                                            <a class="txt_1_3em ui-link block_image_relative img" href="./mDocTin.aspx?ID=<%#Eval("Article_ID")%>">
                                                <img class="imgOtherNews" src="<%# "."+Eval("IntroImage")%>" width="60px" height="45px" alt="">
                                                <p><%#Eval("Title")%></p>
                                            </a>
                                        </h3>
                                    </li>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>                                                 
        </div>
    </div>
</asp:Content>
