<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fpsanh.aspx.vb" Inherits="hcmpc.fpsanh" %>

 <script type="text/javascript" src="js/jwplayer.js" language="javascript"></script>
<script type="text/javascript" src="ucl_jwplayer_key.js" language="javascript"></script>

               <div id="thePlayer"></div>

                <script type="text/javascript">
                    jwplayer("thePlayer").setup({
                        playlist: [{
                            image: "https://www.ucl.ac.uk/stream/mediaplayer/jwplayer/images/general/ucl_quad_widescreen.jpg",
                            sources: [{
                                file: "http://streaming.ucl.ac.uk:1935/live/uclive_standard/playlist.m3u8"
                            }, {
                                file: "rtmp://streaming-live.ucl.ac.uk/live/uclive_standard"
                            }]
                        }],
                        primary: "flash",
                        flashplayer: "https://www.ucl.ac.uk/stream/mediaplayer/jwplayer_live/jwplayer.flash.swf",
                        androidhls: true,
                        width: "100%",
                        aspectratio: "16:9"
                    });
                </script>