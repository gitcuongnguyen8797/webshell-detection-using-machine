<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="caseTCT.master" CodeBehind="giaitri.aspx.vb" Inherits="hcmpc.giaitri" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent"> 
<%--    <script type="text/javascript" src="js/music/jquery.min.js"></script> --%>   	
<%--<script type="text/javascript" src="js/music/jquery.jplayer.min.js"></script>--%>
<script type="text/javascript">

//<![CDATA[
    $(document).ready(function () {

        var Playlist = function (instance, playlist, options) {
            var self = this;

            this.instance = instance; // String: To associate specific HTML with this playlist
            this.playlist = playlist; // Array of Objects: The playlist
            this.options = options; // Object: The jPlayer constructor options for this playlist

            this.current = 0;

            this.cssId = {
                jPlayer: "jquery_jplayer_",
                interface: "jp_interface_",
                playlist: "jp_playlist_"
            };
            this.cssSelector = {};

            $.each(this.cssId, function (entity, id) {
                self.cssSelector[entity] = "#" + id + self.instance;
            });

            if (!this.options.cssSelectorAncestor) {
                this.options.cssSelectorAncestor = this.cssSelector.interface;
            }

            $(this.cssSelector.jPlayer).jPlayer(this.options);

            $(this.cssSelector.interface + " .jp-previous").click(function () {
                self.playlistPrev();
                $(this).blur();
                return false;
            });

            $(this.cssSelector.interface + " .jp-next").click(function () {
                self.playlistNext();
                $(this).blur();
                return false;
            });
        };

        Playlist.prototype = {
            displayPlaylist: function () {
                var self = this;
                $(this.cssSelector.playlist + " ul").empty();
                for (i = 0; i < this.playlist.length; i++) {
                    var listItem = (i === this.playlist.length - 1) ? "<li class='jp-playlist-last'>" : "<li>";
                    listItem += "<a href='#' id='" + this.cssId.playlist + this.instance + "_item_" + i + "' tabindex='1'>" + this.playlist[i].name + "</a>";

                    // Create links to free media
                    if (this.playlist[i].free) {
                        var first = true;
                        listItem += "<div class='jp-free-media'>(";
                        $.each(this.playlist[i], function (property, value) {
                            if ($.jPlayer.prototype.format[property]) { // Check property is a media format.
                                if (first) {
                                    first = false;
                                } else {
                                    listItem += " | ";
                                }
                                listItem += "<a id='" + self.cssId.playlist + self.instance + "_item_" + i + "_" + property + "' href='" + value + "' tabindex='1'>" + property + "</a>";
                            }
                        });
                        listItem += ")</span>";
                    }

                    listItem += "</li>";

                    // Associate playlist items with their media
                    $(this.cssSelector.playlist + " ul").append(listItem);
                    $(this.cssSelector.playlist + "_item_" + i).data("index", i).click(function () {
                        var index = $(this).data("index");
                        if (self.current !== index) {
                            self.playlistChange(index);
                        } else {
                            $(self.cssSelector.jPlayer).jPlayer("play");
                        }
                        $(this).blur();
                        return false;
                    });

                    // Disable free media links to force access via right click
                    if (this.playlist[i].free) {
                        $.each(this.playlist[i], function (property, value) {
                            if ($.jPlayer.prototype.format[property]) { // Check property is a media format.
                                $(self.cssSelector.playlist + "_item_" + i + "_" + property).data("index", i).click(function () {
                                    var index = $(this).data("index");
                                    $(self.cssSelector.playlist + "_item_" + index).click();
                                    $(this).blur();
                                    return false;
                                });
                            }
                        });
                    }
                }
            },
            playlistInit: function (autoplay) {
                if (autoplay) {
                    this.playlistChange(this.current);
                } else {
                    this.playlistConfig(this.current);
                }
            },
            playlistConfig: function (index) {
                $(this.cssSelector.playlist + "_item_" + this.current).removeClass("jp-playlist-current").parent().removeClass("jp-playlist-current");
                $(this.cssSelector.playlist + "_item_" + index).addClass("jp-playlist-current").parent().addClass("jp-playlist-current");
                this.current = index;
                $(this.cssSelector.jPlayer).jPlayer("setMedia", this.playlist[this.current]);
            },
            playlistChange: function (index) {
                this.playlistConfig(index);
                $(this.cssSelector.jPlayer).jPlayer("play");
            },
            playlistNext: function () {
                var index = (this.current + 1 < this.playlist.length) ? this.current + 1 : 0;
                this.playlistChange(index);
            },
            playlistPrev: function () {
                var index = (this.current - 1 >= 0) ? this.current - 1 : this.playlist.length - 1;
                this.playlistChange(index);
            }
        };

        var audioPlaylist = new Playlist("2", [		
        <%=listMusic%>
	], {
	    ready: function () {
	        audioPlaylist.displayPlaylist();
	        audioPlaylist.playlistInit(false); // Parameter is a boolean for autoplay.
	    },
	    ended: function () {
	        audioPlaylist.playlistNext();
	    },
	    play: function () {
	        $(this).jPlayer("pauseOthers");
	    },
	    swfPath: "js",
	    supplied: "oga, mp3"
	});
    });
//]]>
</script>


<link rel="stylesheet" type="text/css" href="js/music/index.css" media="all">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


<div id="middle">
		
			<!-- start: tier one -->
	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
	<div class="section subHeading">		
					<h1>Giải trí</h1>	
			</div>
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
			

			
			<table border="0" width="100%">
  <tbody><tr>
    <td width="100%"> <div id="jp-container">
    
     <div style="background-color: rgb(0, 0, 0);" id="jquery_jplayer_2" class="jp-jplayer"><img style="width: 0px; height: 0px; display: none;" id="jp_poster_0"><audio src="mp3/Le fou sur la colline (valzer 5 tempi).ogg" preload="metadata" id="jp_audio_0"></audio></div>
		<div class="jp-audio">
			<div class="jp-type-playlist">
				<div id="jp_interface_2" class="jp-interface">
                    <div class="jp-progress">
						<div style="width: 0%;" class="jp-seek-bar">
							<div style="width: 0%;" class="jp-play-bar"></div>
						</div>
					</div>
                    <div class="jp-volume-bar" style="float:right;margin-top: 13px;">
						<div style="width: 80%;" class="jp-volume-bar-value"></div>
					</div>
                    <div style="float:right;margin-top: 5px;">                    
                    <div class="jp-current-time">00:00</div>
                    <div style="float:left">|</div>
					<div class="jp-duration">00:00</div>
                    </div>
                    <div  style="float:left">
					<ul class="jp-controls">
						<li><a class="jp-play" tabindex="1">play</a></li>
						<li><a style="display: none;" href="#" class="jp-pause" tabindex="1">pause</a></li>
						<li><a class="jp-stop" tabindex="1">stop</a></li>
						<li><a style="margin-left: 63%;margin-top: 10px;" href="#" class="jp-mute" tabindex="1">mute</a></li>
						<li><a style="display: none;" href="#" class="jp-unmute" tabindex="1">unmute</a></li>
						<li><a href="#" class="jp-previous" tabindex="1">previous</a></li>
						<li><a href="#" class="jp-next" tabindex="1">next</a></li>
					</ul>
					</div>
					
					
				</div>
                <hr style="padding: 0px;margin-bottom: 5px;">
				<div id="jp_playlist_2" class="jp-playlist" style="max-height: 200px;overflow-y: auto;overflow-x: hidden;">
					<ul>
                    <li class="jp-playlist-current"><a class="jp-playlist-current" href="#" id="jp_playlist_2_item_0" tabindex="1">Le fou sur la colline (valzer 5 tempi)</a><div class="jp-free-media">(<a id="jp_playlist_2_item_0_mp3" href="a.mp3" tabindex="1">mp3</a> | <a id="jp_playlist_2_item_0_oga" href="http://www.diatonia.net/jPlayer/mp3/Le%20fou%20sur%20la%20colline%20(valzer%205%20tempi).ogg" tabindex="1">oga</a>)</div></li>
					<li><a href="#" id="jp_playlist_2_item_1" tabindex="1">Minou (rondeau)</a><div class="jp-free-media">(<a id="jp_playlist_2_item_1_mp3" href="b.mp3" tabindex="1">mp3</a> | <a id="jp_playlist_2_item_1_oga" href="http://www.diatonia.net/jPlayer/mp3/Minou%20(rondeau).ogg" tabindex="1">oga</a>)</div></li>
					</ul>
				</div>
			</div>
		</div>
   
     </div>
        </td>
   
  </tr>

</tbody></table>
             

				<div class="section sectionMain recentNews" id="Div1">
			<div class="primaryContent leftDate">
				<h2 class="subHeading">
					<div style="float: right; white-space: nowrap; display: none;">
												
					</div>

					<a href="" class="newsTitle">Danh sách album</a>
				</h2>

			

				

				<div class="messageContent baseHtml">					
                <% If Not albumList Is Nothing Then
                        If albumList.Rows.Count > 0 Then
                            For Each tt As DataRow In albumList.Rows
                             %>
                             <div>
                             <a href="giaitri.aspx?list=<%=tt("ID")%>"><%=tt("Title")%></a>
                             </div>
                               <% 
                               Next
                           End If
                       End If
                               
                               %>
					
				</div>				
			</div>
		</div>

				
			</div>
		</div>



        



	</div>	
</div>  
			
		


</div>


</asp:Content>
